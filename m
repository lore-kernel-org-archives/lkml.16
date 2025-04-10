Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E1D28EA4E
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 18:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744310499; cv=none; b=p+tIUkz9Xdk877lvicseE/djlgzhmTGN9p2TU0qGdAtqvwthPbbJ3kCYtm9JLaDgnTIuFMznEsOPJvBRQmAGLcRdP5ZgK4UIpc1gz9njhp49zWHs2b5LmRcfAnXyWsLjgJ66yvoERW4y3apIGCdADey+5RNtgH8qSRGfLK1pGYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744310499; c=relaxed/simple;
	bh=T7UZl6Ece7qOgFFy7gpGnG7R1j1U94b4sSnKn8z7krw=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OmiXS0J9Rv0bcRa+fxOIy2sibPb5s454zlu+ttsXuiGFtZXZ3nRZsjIRJ6J6niKurptp9KyZqjOxhDwJnnodTd08ToNYmsJ6jGrgePQqddZ3+f4rEaw7X8NY2qUnzTvr3mjjYyXTv8S0b9RrbtDWUUszo8LUygOvBo7ePxWuLiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-232.elisa-laajakaista.fi [88.113.26.232])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id 6184be0b-163b-11f0-963b-005056bdd08f;
	Thu, 10 Apr 2025 21:41:14 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 10 Apr 2025 21:41:14 +0300
To: Kees Bakker <kees@ijzerbout.nl>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, Mika Westerberg <westeri@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v1 2/2] gpiolib: acpi: Make sure we fill struct
 acpi_gpio_info
Message-ID: <Z_gQyg_JXTBRjisf@surfacebook.localdomain>
References: <20250409132942.2550719-1-andriy.shevchenko@linux.intel.com>
 <20250409132942.2550719-3-andriy.shevchenko@linux.intel.com>
 <98ded07e-33e4-417c-8146-fbf2783a7464@ijzerbout.nl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <98ded07e-33e4-417c-8146-fbf2783a7464@ijzerbout.nl>

Wed, Apr 09, 2025 at 08:16:59PM +0200, Kees Bakker kirjoitti:
> Op 09-04-2025 om 15:27 schreef Andy Shevchenko:

...

> Can you check and confirm that at least info.gpioint is filled in (or
> initialized)?

Yes, I can confirm this. And that's how I have tested it, on Intel
Edison/Arduino the first GPIO expander (PCAL9555, serviced by
drivers/gpio/gpio-pca953x.c) is able to deliver an interrupt to the SoC.

Before this series that doesn't show up, now it works as expected.

> The callers of `__acpi_find_gpio` pass in an uninitialized `struct
> acpi_gpio_info`

True.

> and after the call they read `info.gpioint`.

...when GPIO descriptor is valid.

...

Yes, I agree that NULLifying info maybe good to have, but I don't see currently
if we have bugs with it. Can you be more specific in case you have observed
anything wrong?


-- 
With Best Regards,
Andy Shevchenko


