Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BB92153C6;
	Wed, 28 May 2025 11:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748430349; cv=none; b=oPHKz+RBSlRXLqOOwU5bcYCrh6qtf0x3J/atWrz/RJE4cezKoAdny9amIBf0h0HsDycwHcSr3vzjKr74sPzE6IevkwTXI65rVi4ZRCVwcNeifjTVlsk31JzExsS/pFMD/0nhuVYDXKWI/LusbR6mVq4r523l9wtSAzBK55ba8ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748430349; c=relaxed/simple;
	bh=ToQEsJtK6Rkp6PB1avzmO5rYbaGHvKv6ChVjnjuWW+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qKnKQylK+68DHu8JNBndaU8RgYJ18FlfDdV0XsV/xN1Pj8liPsAELR9FPXM0fcx6h1PcuQTYms/TP6PEI/OrrTArXGqeKlneFZKujItGgRvwvkMsPT+lCFkTHxh5puiwdr1w+SASTRp36tZ7OShWnM+YESG7zHkBRiA7vzjjn4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OIpV+zmT; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OIpV+zmT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748430348; x=1779966348;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ToQEsJtK6Rkp6PB1avzmO5rYbaGHvKv6ChVjnjuWW+Q=;
  b=OIpV+zmTe4lulThsr7kX7lVTlDXlDLPGBRKq7c22JZKF2Pmabad2YTKW
   s7psPfWLT966i2DiSS7aj5qTwL5+R1cpnJV037tLaC+a/JurlArzhv4Qi
   YXWAleKYexICDdeqXDQ8NpRbVvd+vfRGTpbYV90AHJvKfTv8aJZs7gzXA
   KO5DeB/ZFSjXrD5UTPjTbWtdyoFFnPgmf8CEPAxvmv+oqSkxFMbhQX9rI
   oKhHPRZcp8mogw5+UcAuUYlJXm9nNB82AKooe8vS+2Ii/uJ5y+8zYr5VM
   F8WKSVRU/ATI4GLmQZOwYdjdIJqqGzE8SQ3pB9fnWce+DNePcpBuaO4iA
   g==;
X-CSE-ConnectionGUID: V7lySNi7SJKhDaLziUL7eg==
X-CSE-MsgGUID: zb8ohYwdQKa9F5Cl9wSB5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="61507826"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="61507826"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 04:05:47 -0700
X-CSE-ConnectionGUID: 8iPiFFdzQFCUu9mW66glIw==
X-CSE-MsgGUID: tz6rZrWDSXmyTaQ0KyywyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="174206027"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 04:05:41 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uKEbJ-00000001QJz-0DBv;
	Wed, 28 May 2025 14:05:37 +0300
Date: Wed, 28 May 2025 14:05:36 +0300
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
Subject: Re: [PATCH v4 17/23] ACPI: RISC-V: Create interrupt controller list
 in sorted order
Message-ID: <aDbuABrlO30TIrx1@smile.fi.intel.com>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
 <20250525084710.1665648-18-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250525084710.1665648-18-apatel@ventanamicro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sun, May 25, 2025 at 02:17:04PM +0530, Anup Patel wrote:
> 
> Currently, the interrupt controller list is created without any order.
> Create the list sorted with the GSI base of the interrupt controllers.

...

> -	list_add_tail(&ext_intc_element->list, &ext_intc_list);
> +	if (list_empty(&ext_intc_list)) {
> +		list_add(&ext_intc_element->list, &ext_intc_list);
> +		return 0;
> +	}

With the below done the above can be optimized (hopefully).

> +	list_for_each_entry(node, &ext_intc_list, list) {
> +		if (node->gsi_base < ext_intc_element->gsi_base)
> +			break;
> +	}
> +
> +	__list_add(&ext_intc_element->list, node->list.prev, &node->list);

Is this reimplementation of list_add_tail()? And why list debug is excluded here?

-- 
With Best Regards,
Andy Shevchenko


