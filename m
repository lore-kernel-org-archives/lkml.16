Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261E8202C3E;
	Mon,  3 Feb 2025 12:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738586230; cv=none; b=W+GSZp3G3/Y/DxzjlfuIrZw7jaLohl7MRZdraJOwvDK3kC2GlECC/T3ZkGL1RV5xSDHMEpKqUl/Ya5PC2vvjNaMRUD6DNsZYuBwY1vXv41HOLkwmssyFsnxjd6dFj0pTL2xoyh/n1e1sKaaloC69M0mZh9COUEuZVV5KLp4B60g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738586230; c=relaxed/simple;
	bh=+hfIDKazatu6zjWjzZX8NO2y9nDwJDIinki/gvRlLn8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g/+fmkdhNjnvoIhf2zCq6s0BmUGGfM97OQzker5oDG7DvQUyBlZJFWUoDQn2eSjA97hZ7PdDpQRjavTSHReIPL5oYdRu+Kwcy3gVDiMBsmxGNntGgOEA6aYkIhu0fM4V0xW2J50ga7nrF/kb5eA2KI9XFjKtjuLXfSMYj51lpok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fJcpNOU7; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fJcpNOU7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738586228; x=1770122228;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+hfIDKazatu6zjWjzZX8NO2y9nDwJDIinki/gvRlLn8=;
  b=fJcpNOU7ZKV2xlhznqcAV/aIyk8Eoxp0nbHOoZksNsAOVgSmhXC/HdSj
   inxNYmTFC6NPZv6h0u3E2kfw2kDEgFIipsrkixV6huMGToXTQ2z7SLdqp
   TSH1ILLRRvFj1c5XqO3zu1dxb87Kv6S9gSv2HsLWoNA55+upHf7BIqu8l
   HKhPf79IQJAijAkqwK4FvKixrp+dd47llGPRv1NUIKbTzw3sNXSklb70J
   XFMS23Ug/NpoTIfszXailE2hcDohN+7qEoeOedtrSY7EgbtlkhJiwIbQS
   /jgf3ati64zhaMcbU57pfUt5adT2yk+xghBO3/Tfm0o0Avxj7slSYQ+rc
   g==;
X-CSE-ConnectionGUID: S4aa9w0QQRuPSFw16i/LVw==
X-CSE-MsgGUID: YgpF1PWUTZKwbLBj6BJqgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="38954789"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="38954789"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 04:37:07 -0800
X-CSE-ConnectionGUID: Qktvc/okRsyrMX4rQS+URA==
X-CSE-MsgGUID: rVXpaxrpS82OVaBvVMjFhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="110451647"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa008.fm.intel.com with ESMTP; 03 Feb 2025 04:37:00 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 71CCF23F; Mon, 03 Feb 2025 14:36:58 +0200 (EET)
Date: Mon, 3 Feb 2025 14:36:58 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Len Brown <lenb@kernel.org>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 12/17] ACPI: property: Add support for nargs_prop
 in acpi_fwnode_get_reference_args()
Message-ID: <20250203123658.GI3713119@black.fi.intel.com>
References: <20250203084906.681418-1-apatel@ventanamicro.com>
 <20250203084906.681418-13-apatel@ventanamicro.com>
 <Z6CPvteWv89Xo70j@smile.fi.intel.com>
 <20250203105840.GH3713119@black.fi.intel.com>
 <Z6C1cg3cqik8ZxvU@sunil-laptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z6C1cg3cqik8ZxvU@sunil-laptop>

On Mon, Feb 03, 2025 at 05:54:18PM +0530, Sunil V L wrote:
> On Mon, Feb 03, 2025 at 12:58:40PM +0200, Mika Westerberg wrote:
> > On Mon, Feb 03, 2025 at 11:43:26AM +0200, Andy Shevchenko wrote:
> > > On Mon, Feb 03, 2025 at 02:19:01PM +0530, Anup Patel wrote:
> > > > From: Sunil V L <sunilvl@ventanamicro.com>
> > > > 
> > > > fwnode_get_reference_args() which is common for both DT and ACPI passes
> > > > a property name like #mbox-cells which needs to be fetched from the
> > > > reference node to determine the number of arguments needed for the
> > > > property. However, the ACPI version of this function doesn't support
> > > > this and simply ignores the parameter passed from the wrapper function.
> > > > Add support for dynamically finding number of arguments by reading the
> > > > nargs property value. Update the callers to pass extra parameter.
> > > 
> > > I don't like this (implementation).
> > 
> > Agree.
> > 
> > > It seems that we basically have two parameters which values are duplicating
> > > each other. This is error prone API and confusing in the cases when both are
> > > defined. If you want property, add a new API that takes const char *nargs
> > > and relies on the property be present.
> > 
> > Also this is not really needed for ACPI case because it has types so it can
> > distinguish references from integer. Having separate property for this just
> > makes things more complex than they need to be IMHO.
> 
> Thanks! Andy and Mika for your kind feedback. I agree that having both
> property name and nargs is confusing and also ACPI would not need
> nargs_prop. In fact, I think ACPI doesn't need even nargs integer value
> as well from the caller since all integers after the reference are
> counted as arguments.  However, the issue is acpi_get_ref_args() assumes
> that caller passes valid num_args. But typically the common
> fwnode_property_get_reference_args() doesn't usually pass both valid
> values. So, should fwnode_property_get_reference_args() pass both
> nargs_prop (for DT) and nargs (for ACPI). Or do you mean it is better to
> remove the check for num_args in the loop inside acpi_get_ref_args()
> function?

Can you show an example of a case you are trying to solve with this? So far
we have been able to go with the current implementation so why this is
needed now?
