Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DEC418C00;
	Sun, 15 Jun 2025 19:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750014060; cv=none; b=h8vyaw6uUi11HZGoaGZMJQ6TqhoVflnxeWXAiYqvY0J3PrLY13Ew4omqPSVcHTWZjNiEfmZmrB228BaDD1Kxb0fBbrlBPkdA1NHGDXeSfbh1Gu6ScbI9Sd7597UqjqMy8jy1hjz9cJcWMvjHwP0mMe9UcCICd9ZbqWj8dFaQoBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750014060; c=relaxed/simple;
	bh=5eIfI1c3nRawIwoZMxaH4jWEB+QWg4eyuvjPQnrf54M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ubEtwSKnC1LxvQL0xf7yqHTz4FlXkLgBY3eS+6pSKn9eNVD3UuYx3fF3RWexEd75HLBC4kVpz4i68JaFJvc/uUqU5HUtYkSqJs6+USuz6T3jdIyiMFOvmiy3Fp4r8gIQ1VD4hscu9XKYRmChoTlF9ddKKdnyFBpT2gbolVNSY9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=gozXfa2s; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="gozXfa2s"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=1rYE6Uz0rxLEhZw0w2nC3melU9arsuScDwg5zjXt8Y0=; b=gozXfa2sJtFcl0ebEq9Xmy1I2C
	VpmWwI8+jZ0MQZfbjT7pmkAk5LP14frpEqrGUvU4oMEu4lNA2rJ4NAqqQ8YNn6ChZj4/fD0xF+ol5
	csBYEhmu1WXiT1y7JpSlfqPZshBXRCXcx3MphqY1RJvkbzDoIJUKtvJk4DNCnIGMyzeIYwjdAgz8l
	JU2TmFdDJmFlljWYfe5ZZaZBzEkc7cji63td0+fJ6tsRiAxHHN615w9iG4zZfXVOHeyGsr8h8B2Iw
	wuKX7+EQbae8OmyoT0rJw2hWoDDCNjAvQJYsthBDdadATWBXWLKFeogtgbaLtey4p0ElxQIIjWqoh
	Ey84rJkg==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQsb7-0000000F9bM-06J0;
	Sun, 15 Jun 2025 19:00:53 +0000
Message-ID: <02d7f827-3bfc-4cf8-944b-5ec257a5b22c@infradead.org>
Date: Sun, 15 Jun 2025 12:00:49 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/3] platform/x86: Add Uniwill laptop driver
To: Armin Wolf <W_Armin@gmx.de>, ilpo.jarvinen@linux.intel.com,
 hdegoede@redhat.com, chumuzero@gmail.com, corbet@lwn.net, cs@tuxedo.de,
 wse@tuxedocomputers.com, ggo@tuxedocomputers.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
References: <20250615175957.9781-1-W_Armin@gmx.de>
 <20250615175957.9781-3-W_Armin@gmx.de>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250615175957.9781-3-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 6/15/25 10:59 AM, Armin Wolf wrote:
> Add a new driver for Uniwill laptops. The driver uses a ACPI WMI
> interface to talk with the embedded controller, but relies on a
> DMI whitelist for autoloading since Uniwill just copied the WMI
> GUID from the Windows driver example.
> 
> The driver is reverse-engineered based on the following information:
> - OEM software from intel
> - https://github.com/pobrn/qc71_laptop
> - https://github.com/tuxedocomputers/tuxedo-drivers
> - https://github.com/tuxedocomputers/tuxedo-control-center
> 
> The underlying EC supports various features, including hwmon sensors,
> battery charge limiting, a RGB lightbar and keyboard-related controls.
> 
> Reported-by: cyear <chumuzero@gmail.com>
> Closes: https://github.com/lm-sensors/lm-sensors/issues/508
> Closes: https://github.com/Wer-Wolf/uniwill-laptop/issues/3
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---

> diff --git a/drivers/platform/x86/uniwill/Kconfig b/drivers/platform/x86/uniwill/Kconfig
> index 5f1ea3e9e72f..57f9f88c757c 100644
> --- a/drivers/platform/x86/uniwill/Kconfig
> +++ b/drivers/platform/x86/uniwill/Kconfig
> @@ -16,6 +16,23 @@ menuconfig X86_PLATFORM_DRIVERS_UNIWILL
>  
>  if X86_PLATFORM_DRIVERS_UNIWILL
>  
> +config UNIWILL_LAPTOP
> +	tristate "Uniwill Laptop Extras"
> +	default m
> +	depends on ACPI_WMI
> +	depends on ACPI_BATTERY
> +	depends on UNIWILL_WMI
> +	depends on REGMAP

REGMAP is usually selected instead of being a dependency.
There is one other REGMAP dependency in the kernel tree vs. 131 selects.
Also, there is no user prompt for the REGMAP symbol so users aren't able
to enable it directly.

Or maybe you could select a more specific REGMAP_xyz and then it will
enable REGMAP:

config REGMAP
	bool
	default y if (REGMAP_I2C || REGMAP_SPI || REGMAP_SPMI || REGMAP_W1 || REGMAP_AC97 || REGMAP_MMIO || REGMAP_IRQ || REGMAP_SOUNDWIRE || REGMAP_SOUNDWIRE_MBQ || REGMAP_SCCB || REGMAP_I3C || REGMAP_SPI_AVMM || REGMAP_MDIO || REGMAP_FSI)



> +	depends on HWMON
> +	depends on LEDS_CLASS_MULTICOLOR
> +	depends on DMI
> +	help
> +	  This driver adds support for various extra features found on Uniwill laptops,
> +	  like the lightbar and hwmon sensors. It also supports many OEM laptops
> +	  originally manufactured by Uniwill.
> +
> +	  If you have such a laptop, say Y or M here.
> +
>  config UNIWILL_WMI
>  	tristate "Uniwill WMI Event Driver"
>  	default m


-- 
~Randy

