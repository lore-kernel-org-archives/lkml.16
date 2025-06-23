Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A0C14D2A0;
	Mon, 23 Jun 2025 08:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750668621; cv=none; b=amI2hz5h2qepeMYxYIHm8g5Gwj5Y5p7oo7ouurBNGJMj4fIwDEsiyiC9FB5A3cTT3QaZKdaN/xU3n8Mh19qZaE2fQS1CTg28AsdngjRFvnMEzar3iQA1CqFFFYxxPz2uVKwBiZnd/EWQybo7eyMIJVxOmM/3uIqL7ueXo+XEu00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750668621; c=relaxed/simple;
	bh=jrawT35wmhyz3NLgVIcmL35vMqmLA5Yl2YnxxrpMy/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=brafasYk21KPvc+Bl2zyZInPjgGuKZAvGnGBbYE8xnCuPPDK+LHXBZ8suwqfENpIL3LcgJL/fG58cxe7P7YnSggoUE0BLRQY9L+dMhDO7zr9Wb9gMMSx8D7dmpIaYxcVMrGhrSan/Ow2t/oILLXOVg6a+FP0GEmIgOkGpnq0txE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iPA/bL2e; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iPA/bL2e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750668621; x=1782204621;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jrawT35wmhyz3NLgVIcmL35vMqmLA5Yl2YnxxrpMy/I=;
  b=iPA/bL2eeVYKrTeegYxom4paT2gkbmXLnMwDsr1DviFCTZSwmYTTzkDV
   uBxu2uhHZGx/9LO0ZwysxU6+01l2uEj7zFpdVNmoXj3hOGZiqZ6/iBEWn
   qsn2HEaxvBg8wNm2z6+Ok7/M+Ci7g2Cr3HZcxlNicNivTw+lLmED74wG8
   49rVp8T/KnmX9H2Wp12+dN7Iy73FhY4ScFcxdZ+gR5tO8NfBsXtbmc8dC
   U8Tqud1VZOjNYeDebPjWu9RBrPu22cPOb0ovUsqLpj+TlTnw6gA1sBvT7
   EiPAuzcADaVyzniuKjnogWf2Zuu8D1ldWhkIfBOHyoPo2NtUwUKTdNfKF
   w==;
X-CSE-ConnectionGUID: AkJlYKrpTaqygxNliF5Hbg==
X-CSE-MsgGUID: s/uVrWQjS0GndbglYhm9lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="75398344"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="75398344"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 01:50:20 -0700
X-CSE-ConnectionGUID: +8bXJz6LSx2prqvi2Q9vlA==
X-CSE-MsgGUID: fQBw2f/FTBCnoy7g9ZEzxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="152213190"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 01:50:14 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uTcsT-0000000977T-3KBo;
	Mon, 23 Jun 2025 11:50:09 +0300
Date: Mon, 23 Jun 2025 11:50:09 +0300
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
Subject: Re: [PATCH v6 06/23] mailbox: Add RISC-V SBI message proxy (MPXY)
 based mailbox driver
Message-ID: <aFkVQTSCSkvBhzgC@smile.fi.intel.com>
References: <20250618121358.503781-1-apatel@ventanamicro.com>
 <20250618121358.503781-7-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618121358.503781-7-apatel@ventanamicro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jun 18, 2025 at 05:43:41PM +0530, Anup Patel wrote:
> Add a mailbox controller driver for the new SBI message proxy extension
> which is part of the SBI v3.0 specification.

...

> +static void mpxy_mbox_remove(struct platform_device *pdev)
> +{
> +	struct mpxy_mbox *mbox = platform_get_drvdata(pdev);

> +	if (mbox->msi_count)

I'm still not convinced we need this check _here_.
Can it be rather a separate patch to add it inside
the below call?

> +		platform_device_msi_free_irqs_all(mbox->dev);
> +}

...

> +static const struct of_device_id mpxy_mbox_of_match[] = {
> +	{.compatible = "riscv,sbi-mpxy-mbox", },

Missing space and unneeded inner comma.

> +	{}
> +};

...

> --- a/include/linux/byteorder/generic.h
> +++ b/include/linux/byteorder/generic.h

This is good change, but deserves to be in a separate patch.
I will Ack/Review it as soon as it appears to be so.

-- 
With Best Regards,
Andy Shevchenko


