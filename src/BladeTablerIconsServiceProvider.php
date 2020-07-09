<?php

declare(strict_types=1);

namespace RyanChandler\TablerIcons;

use BladeUI\Icons\Factory;
use Illuminate\Support\ServiceProvider;

final class BladeTablerIconsServiceProvider extends ServiceProvider
{
    public function register(): void
    {
        $this->callAfterResolving(Factory::class, function (Factory $factory) {
            $factory->add('tabler', [
                'path' => __DIR__ . '/../resources/svg',
                'prefix' => 'tabler',
            ]);
        });
    }

    public function boot(): void
    {
        if ($this->app->runningInConsole()) {
            $this->publishes([
                __DIR__ . '/../resources/svg' => public_path('vendor/blade-tabler-icons'),
            ], 'blade-tabler-icons');
        }
    }
}
