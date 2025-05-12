Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15718254872;
	Mon, 12 May 2025 08:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747039646; cv=none; b=eV8iOmlpyfiJY9x0OmLRM+jBDPBMd7822N4lyppnOpImAUs0dO/+W7lOoeLxRSx1SbYjR04+B2JB31SjjvrXHxhOlaoZbZmevSwxkd2/a7s1yu/NfZDEn5no0jr0voJV7F6VycTMlheVjOoIb/vFxi/WcVjATxrhiZNqMZC8/AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747039646; c=relaxed/simple;
	bh=pOvpQydW9G7mOb+Bx1viFb769PJHsmY5rTbfQP3cF/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hl7ELt7A0PZdpaxTsYsd2Qkk8uw4pHgP0pL58u80pE8uxEOLz3YvOqxbfVcIt06sg1D784BGVXdZr9yyNUW/0No1mJGStolypd7X/V8bGX6QNRrcC1hM+x/kLOVXl6YlmZ4F/x+PhDcVCk1C4/NcPWR42KA17u7N/r2JP2K6tVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MV8Jd179; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MV8Jd179"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747039645; x=1778575645;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pOvpQydW9G7mOb+Bx1viFb769PJHsmY5rTbfQP3cF/g=;
  b=MV8Jd17956e0I6wrDoHp77t7uMKBFrq27XpeS3k6nWx7VIYoXpYsFZWJ
   IxMMqJDUXkizriVWWtIsO2wzNNzj6NxL2hsegRGsPtHvMaYR24NVCO1Na
   CeOUsfTUXDorDuQlFaILKUi+j8WAbRXd7GNoleAUUYwfn29PqQqLwLgSs
   QQaX0t20OT04AANDv5fyGGAVh/EIpWMzGX2M5vy1HZuOGknfyCBGx/hEd
   lT3EdxjPjvPhNPZergq53j/NZ1WwXYl9SKo0aa7Dy3vdmgfGKxGyNhXPI
   358KMid0x1bpIWW1/+3g3SDKRKSor6PYTOnsA+dQnmbs/SSuM6h0EivPm
   Q==;
X-CSE-ConnectionGUID: htLpHsWXSyieBPqiealx2Q==
X-CSE-MsgGUID: q+/IkamTRMKRD29AsxjjIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="48519947"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="48519947"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 01:47:24 -0700
X-CSE-ConnectionGUID: 1zLdvAZzQ9qvLMn4jpioTw==
X-CSE-MsgGUID: l8SgDcjCRKaeYnBn8vMg7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="137005543"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 01:47:18 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uEOoc-00000000rkH-49kY;
	Mon, 12 May 2025 11:47:14 +0300
Date: Mon, 12 May 2025 11:47:14 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Anup Patel <apatel@ventanamicro.com>,
	Michael Turquette <mturquette@baylibre.com>,
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
	Len Brown <lenb@kernel.org>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 20/23] mailbox/riscv-sbi-mpxy: Add ACPI support
Message-ID: <aCG1kqi2w2EUKWyO@smile.fi.intel.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
 <20250511133939.801777-21-apatel@ventanamicro.com>
 <aCGjEdNVH3ughITd@smile.fi.intel.com>
 <aCGzFVXFBVRbMUKz@sunil-laptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCGzFVXFBVRbMUKz@sunil-laptop>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, May 12, 2025 at 02:06:37PM +0530, Sunil V L wrote:
> On Mon, May 12, 2025 at 10:28:17AM +0300, Andy Shevchenko wrote:
> > On Sun, May 11, 2025 at 07:09:36PM +0530, Anup Patel wrote:

...

> > > +#ifdef CONFIG_ACPI
> > > +	if (!acpi_disabled)
> > 
> > Hmm... Why do you need this check? What for?
> > 
> When we boot with DT, ACPI_COMPANION(dev) will return NULL which will
> cause a crash in acpi_dev_clear_dependencies(). Let me know if I am
> missing something.

Yes, just check that the companion is NULL, rather than the above.

	struct acpi_device *adev;

	adev = ACPI_COMPANION(dev);
	if (adev)
		acpi_dev_clear_dependencies(adev);

> > > +		acpi_dev_clear_dependencies(ACPI_COMPANION(dev));
> > > +#endif

-- 
With Best Regards,
Andy Shevchenko


