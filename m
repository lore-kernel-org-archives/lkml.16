Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA1A7DA82;
	Mon, 12 May 2025 07:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747035077; cv=none; b=S7O/Sdik4TVHBeaOxU9J2EvvVlhrwUXo3/dkHS6yUnTu3JQTvUJXpoVVM9drK7snYr+GOtd8E0VDAg4cqAQdIL7Quzbt65j+O4MSxH0pOFi1//WHfvkDnXSHS80PIthwKKPY0xi199ILsxIhsP0KeqKD9CHuOjZdfVFI1EBNRTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747035077; c=relaxed/simple;
	bh=dpfuuOvYos686Fhw3YTd24pgbdRgiTmoR3WYG9xXogU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=efZi9bTPumlj6UM2xvHYqW31JYpjgrDWgzSq0i90W/9B2HQyfrNSGtnFtUpw8pcueCfe27zQA21i+Uge8srAbO7DXx+Shdlhs1AOwt1Be+rzHyhsKeha9eyax2OKHSI5524K4SBETe+wLg9QxpzPQhEK3JxbbmmVJgnmabNH+3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K/rKlA/o; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K/rKlA/o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747035075; x=1778571075;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dpfuuOvYos686Fhw3YTd24pgbdRgiTmoR3WYG9xXogU=;
  b=K/rKlA/oeC04m92agn4/J6D4cA2mTU9hltKr5fJlNhOiDhaUa6hzUm/c
   v0ML7lsHVTK2e8Exsp8auol3sgk/co3MVskSjX9nPBWUQ9v+npXEI87oJ
   OUKQePRwkWO5ROFC6EH8OOiK5l4E6wj67PNWqhH6FJ9+ncYdJxWy0g94a
   J+W0YFjvuOcaavIV0sBDJlRZQ1TDhTeENpO+YCfLqV/P9lN+kcao8FAMe
   A1oeVQ3yBVtNW4M6vVRKnyvFEbkCzLNdiB+eVKKCHk6Vroaxr4K905O/B
   LDg1rDbHO6d6eTTSpuft6J6r2N+6AdQUX9yoNvrW8WY5jkgE133LFm+Ba
   A==;
X-CSE-ConnectionGUID: vZzYU264RuC6aCJlwRvhKA==
X-CSE-MsgGUID: via8ham8ScuuWNYXbLYdrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="36444999"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="36444999"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 00:31:14 -0700
X-CSE-ConnectionGUID: 5EgLtYGkTYGl62sK56r6pA==
X-CSE-MsgGUID: V9z2TlQ/RWmDEmEo6ydWXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="137187634"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 00:31:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uENcv-00000000qeS-26L1;
	Mon, 12 May 2025 10:31:05 +0300
Date: Mon, 12 May 2025 10:31:05 +0300
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
Subject: Re: [PATCH v3 18/23] ACPI: RISC-V: Add support to update gsi range
Message-ID: <aCGjuc9AmZaKBGg5@smile.fi.intel.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
 <20250511133939.801777-19-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250511133939.801777-19-apatel@ventanamicro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sun, May 11, 2025 at 07:09:34PM +0530, Anup Patel wrote:
> From: Sunil V L <sunilvl@ventanamicro.com>
> 
> Some RISC-V interrupt controllers like RPMI based system MSI interrupt
> controllers do not have MADT entry defined. These interrupt controllers
> exist only in the namespace. ACPI spec defines _GSB method to get the
> GSI base of the interrupt controller, However, there is no such standard
> method to get the GSI range. To support such interrupt controllers, set
> the GSI range of such interrupt controllers to non-overlapping range and
> provide API for interrupt controller driver to update it with proper
> value.

...

> +static inline int riscv_acpi_update_gsi_range(u32 gsi_base, u32 nr_irqs)
> +{
> +	return -1;

Why not using the defined error code?

> +}

...

> +int riscv_acpi_update_gsi_range(u32 gsi_base, u32 nr_irqs)
> +{
> +	struct riscv_ext_intc_list *ext_intc_element;
> +
> +	list_for_each_entry(ext_intc_element, &ext_intc_list, list) {
> +		if (gsi_base == ext_intc_element->gsi_base &&
> +		    (ext_intc_element->flag & RISCV_ACPI_INTC_FLAG_PENDING)) {
> +			ext_intc_element->nr_irqs = nr_irqs;
> +			ext_intc_element->flag &= ~RISCV_ACPI_INTC_FLAG_PENDING;
> +			return 0;
> +		}
> +	}

> +	return -1;

Ditto.

> +}

...

> +	/* If nr_irqs is zero, indicate it in flag and set to max range possible */
> +	if (!nr_irqs) {

Make conditional positive.

> +		ext_intc_element->flag |= RISCV_ACPI_INTC_FLAG_PENDING;
> +		ext_intc_element->nr_irqs =  U32_MAX - ext_intc_element->gsi_base;

One space too many.

> +	} else {
> +		ext_intc_element->nr_irqs = nr_irqs;
> +	}

-- 
With Best Regards,
Andy Shevchenko


