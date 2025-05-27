Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAD018DF80;
	Tue, 27 May 2025 08:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748335647; cv=none; b=PRN05f4CtxzSGOPqZdiffrR71cJ68wNmI6/R5+GBno6s7HdwprDOCgCepkbZU8C1wYb/cpmVgob5pPfxHoy9xMjRL4/k/ZLgyUbsJjWMsv/IUWtU+HraKTDIkDbO1VYRE7xM11Rj0QTPrmYf/U4eJFZCjZ6ZPcSqqAAMajXFLkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748335647; c=relaxed/simple;
	bh=LtysCbwslxqlZwIM9UyV2hJeTATNz4K07lC7vqcAAIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZjKArBP6JAb9V33yDXzsFC07wK4dt+d9o2zaJohZ6RQ0HS1Y5b7M9GffM3LqAAOwpQ8fzwgutg2zttB/okoLNdsakTTLKVSBGB21nEUKU3X/1CVYmOCgDTNMrISn9OGsDcqlhXXdehomSvtO7wqTd5TsEcEGcx47SIPBKrLMn5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RAFVJbFR; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RAFVJbFR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748335647; x=1779871647;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LtysCbwslxqlZwIM9UyV2hJeTATNz4K07lC7vqcAAIk=;
  b=RAFVJbFRRgw502CtTQ/tyhKWc1zrnjLRuhXBcFr0d5g4JzvyvcogtQZN
   OaQnBiC1gfS9xHsDaht/9HGdPLNy6sRmiFNn6AMgL01uGy/zpWDzkYbqp
   pw5A/monwpffcCpUBrCQFSzMB3RSLyyFJUzB70cXV3elEOHlXtMIqKF9/
   hPzz2WyccqPEXl+lxaULucGk7Yk0/SEGSTBwqw1aECgkm7tW25YFLMoyO
   /su1nwTCPvIFT9se0iAGi3WqCF+NSwzjStNxTpBKpLTBQmolCqgWmb6fT
   2xAGuBwpU+h9Icy5aZgHoTPyT3fO9cobW3ZkvKMLz6/1AJu2pkXgllJWe
   A==;
X-CSE-ConnectionGUID: fe9j7+KqTlqFPF9DMqMolw==
X-CSE-MsgGUID: o1m+x44DQOafR+C8U8uDjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="61721364"
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="61721364"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 01:47:26 -0700
X-CSE-ConnectionGUID: HVEXZxs7TFG9P6EBNM/jiA==
X-CSE-MsgGUID: lk/4bV7NTUubzL1z1c6XGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="143691745"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 01:47:19 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uJpxr-000000017WH-1MGm;
	Tue, 27 May 2025 11:47:15 +0300
Date: Tue, 27 May 2025 11:47:15 +0300
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
Subject: Re: [PATCH v4 04/23] RISC-V: Add defines for the SBI message proxy
 extension
Message-ID: <aDV8E0TF_cYuoQ4A@smile.fi.intel.com>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
 <20250525084710.1665648-5-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250525084710.1665648-5-apatel@ventanamicro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sun, May 25, 2025 at 02:16:51PM +0530, Anup Patel wrote:
> Add defines for the new SBI message proxy extension which is part
> of the SBI v3.0 specification.

...

> +/** RPMI message protocol specific MPXY attributes */

If you do a kernel-doc, do it properly.

> +enum sbi_mpxy_rpmi_attribute_id {
> +	SBI_MPXY_RPMI_ATTR_SERVICEGROUP_ID = SBI_MPXY_ATTR_MSGPROTO_ATTR_START,
> +	SBI_MPXY_RPMI_ATTR_SERVICEGROUP_VERSION,

> +	SBI_MPXY_RPMI_ATTR_MAX_ID,

Remove trailing comma for the terminator.

> +};
> +
> +/* Encoding of MSG_PROT_VER attribute */
> +#define SBI_MPXY_MSG_PROT_VER_MAJOR(__ver)	(((__ver) >> 16) & 0xffff)
> +#define SBI_MPXY_MSG_PROT_VER_MINOR(__ver)	((__ver) & 0xffff)

This can utilise GENAMSK() or even upper_16_bits()/lower_16_bits().

-- 
With Best Regards,
Andy Shevchenko


