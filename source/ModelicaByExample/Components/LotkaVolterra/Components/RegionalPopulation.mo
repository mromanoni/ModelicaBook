within ModelicaByExample.Components.LotkaVolterra.Components;
model RegionalPopulation "Population of animals in a specific region"
  encapsulated type InitializationOptions = enumeration(
      Free "No initial conditions",
      FixedPopulation "Specify initial population",
      SteadyState "Population initially in steady state");
  parameter InitializationOptions init=InitializationOptions.Free annotation(choicesAllMatching=true);
  parameter Real initial_population
    annotation(Dialog(group="Initialization", enable=init==InitializationOptions.FixedPopulation));
  Interfaces.Species species
    annotation (Placement(transformation(extent={{-10,90},{10,110}}),
        iconTransformation(extent={{-10,90},{10,110}})));
  annotation (Diagram(graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,127,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid)}), Icon(graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          fillColor={128,255,0},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-54,58},{-38,42}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{56,36},{72,20}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{10,78},{26,62}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-24,42},{-12,30}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-62,-10},{-46,-26}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-10,-66},{6,-82}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{14,-16},{30,-32}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{60,-56},{76,-72}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-44,34},{-32,22}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{22,-40},{34,-52}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{16,36},{32,20}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-100,-100},{100,-140}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="%name")}));
protected
  Real population(start=10) = species.population "Population in this region";
initial equation
  if init==InitializationOptions.FixedPopulation then
    species.population = initial_population;
  elseif init==InitializationOptions.SteadyState then
    der(species.population) = 0;
  else
  end if;
equation
  der(species.population) = species.rate;
  assert(species.population>0, "Population must be greater than zero");
end RegionalPopulation;