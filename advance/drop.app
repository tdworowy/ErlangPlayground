{application, drop,
[{description, "Dropping objects from towers"},
{vsn, "0.0.1"},
{modules, [drop,supervisor_exl,drop_app]},
{registered,[drop, supervisor_exl]},
{applications, [kernel,stdlib]},
{mod, {drop_app,[]} }]}.