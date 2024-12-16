# Blade Tabler Icons

> [!WARNING]
> This package is no longer maintained. I recommend migrating to [secondnetwork/blade-tabler-icons](https://github.com/secondnetwork/blade-tabler-icons) which provides the same set of icons.

<a href="https://github.com/ryangjchandler/blade-tabler-icons/actions?query=workflow%3ATests">
    <img src="https://github.com/ryangjchandler/blade-tabler-icons/workflows/Tests/badge.svg" alt="Tests">
</a>
<a href="https://packagist.org/packages/ryangjchandler/blade-tabler-icons">
    <img src="https://poser.pugx.org/ryangjchandler/blade-tabler-icons/v/stable.svg" alt="Latest Stable Version">
</a>
<a href="https://packagist.org/packages/ryangjchandler/blade-tabler-icons">
    <img src="https://poser.pugx.org/ryangjchandler/blade-tabler-icons/d/total.svg" alt="Total Downloads">
</a>

A package to easily make use of [Tabler Icons](https://github.com/tabler/tabler-icons) in your Laravel Blade views.

For a full list of available icons see [the SVG directory](resources/svg) or preview them on [GitHub](https://preview.tabler.io/icons.html).

## Requirements

- PHP 7.4 or higher
- Laravel 8.0 or higher

## Installation

```bash
composer require ryangjchandler/blade-tabler-icons
```

## Usage

Icons can be used a self-closing Blade components which will be compiled to SVG icons:

```blade
<x-tabler-alert-circle />
```

You can also pass classes to your icon components:

```blade
<x-tabler-alert-circle class="w-6 h-6 text-gray-500"/>
```

And even use inline styles:

```blade
<x-tabler-alert-circle style="color: #555"/>
```

### Raw SVG Icons

If you want to use the raw SVG icons as assets, you can publish them using:

```bash
php artisan vendor:publish --tag=blade-tabler-icons --force
```

Then use them in your views like:

```blade
<img src="{{ asset('vendor/blade-tabler-icons/alert-circle.svg') }}" width="10" height="10"/>
```

### Blade Icons

Blade Tabler Icons uses Blade Icons under the hood. Please refer to [the Blade Icons readme](https://github.com/blade-ui-kit/blade-icons) for additional functionality.

## Changelog

Check out the [CHANGELOG](CHANGELOG.md) in this repository for all the recent changes.

## Maintainers

Blade Tabler Icons is developed and maintained by [Ryan Chandler](https://ryangjchandler.co.uk).

## License

Blade Tabler Icons is open-sourced software licensed under [the MIT license](LICENSE.md).
