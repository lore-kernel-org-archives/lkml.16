Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E0D239090;
	Wed, 11 Jun 2025 08:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749630308; cv=none; b=YGbCCLh8gORsGKWs99uxIhHpCFkozTMf2AOLR5HAjg5K3RYk9TiElWhuYMhPcTyVE9nLmAt5yiIZ8smWw6kEbBBJECgN9W96lsu5LYXFByQxoxYYQN2bRZkJiO1pFzpe4479ZS2GdDbq0S6aTFvuMqPNYO7cF1ZcACe8yAc3d14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749630308; c=relaxed/simple;
	bh=q+9KzBFgMxlH3wVoWy5ulc7FYJUMsWouhRYi24kW+mE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OnZPBfNLeLe3kJXhJGF4ElmcT+Q2cRkiMPEbRiAZN7Vj/jkaprbRXZO+z9cukB7PMVvmlF67IlkKhatMGLx4YNwfKfOGYsmO3P5HPM4RmlDHiQHdcxxYdw2ib31EkvU6KvoibTnYcG+GpfTFXFBZyb8W82Ma/qPH430SBpwPbQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eGILYGta; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eGILYGta"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749630307; x=1781166307;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=q+9KzBFgMxlH3wVoWy5ulc7FYJUMsWouhRYi24kW+mE=;
  b=eGILYGtaf8S8Tee3OLHkVKCXgF4Ki/5r5IOY0Sab00+U5JXcRng7OPTT
   TFm7Mf5dC0cbA2ebsSyCWl3IRuW4xBNAAQQnnkDMT++vv1ncBGaK934KZ
   vlUqXE/F5cQo0yDbvwtdbUrem6eIaiIX72MJ2N2bIT3cGdB/1C/a0JC7G
   akYJsFHcjwvaDu0m2PLP9L8DBGWv3p8DSYZYRXVObbVl8q1685VNhpWK6
   iO/XzIVYTEfao/0HX9rsWONMw2OkMrh0NS4u53ZMFl4HHSUhLGZD9Iac8
   ENF67iqSlQlwC2DRxcF+V2KvF+4NZ7wkAIPCcgG3rhOzQumDyW5qhVBdd
   Q==;
X-CSE-ConnectionGUID: LMYURQReRLauTItnOQmemw==
X-CSE-MsgGUID: iJSfzpGqTT62UxShfhLubg==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="54393246"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="54393246"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 01:25:06 -0700
X-CSE-ConnectionGUID: kcHoIWDfS5qiqKqUef/d9A==
X-CSE-MsgGUID: CGqt+bAeQ2m89Ini1HA5/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="178036550"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 01:22:28 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uPGj2-00000005aES-435h;
	Wed, 11 Jun 2025 11:22:24 +0300
Date: Wed, 11 Jun 2025 11:22:24 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Len Brown <lenb@kernel.org>, Sunil V L <sunilvl@ventanamicro.com>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 13/23] irqchip: Add driver for the RPMI system MSI
 service group
Message-ID: <aEk8wNtMT6azM_30@smile.fi.intel.com>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
 <20250525084710.1665648-14-apatel@ventanamicro.com>
 <aDWjG9jAJ7kSaC9b@smile.fi.intel.com>
 <CAK9=C2VYCSkMV5zoyVEKHTY30Y0KpUr_M8FELm37M8=WYi+4HQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK9=C2VYCSkMV5zoyVEKHTY30Y0KpUr_M8FELm37M8=WYi+4HQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Jun 10, 2025 at 04:33:46PM +0530, Anup Patel wrote:
> On Tue, May 27, 2025 at 5:03 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Sun, May 25, 2025 at 02:17:00PM +0530, Anup Patel wrote:

...

> > > +#include <linux/device.h>
> >
> > Perhaps I missed something, but devm_kzalloc() is in device/devres.h. Do you
> > need it for something else?
> 
> dev_get_msi_domain() is part of linux/device.h hence it should
> be included.

Ah, that's what I missed. Thanks for pointing out.

-- 
With Best Regards,
Andy Shevchenko


