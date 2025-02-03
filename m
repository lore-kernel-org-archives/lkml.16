Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2478B20ADCE;
	Mon,  3 Feb 2025 14:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738593707; cv=none; b=s+/stviJKH/5NU46Caee0gF6j1EA/WZvRBA3Eo/yd/b1WkfnRIItXob0Ue2D/RMK8J/Gfq6N1lOD/yZfAYOkEuBylnSCtXdd448chUVJfgJB3E1KCnYmEmyGBM30gDVf7BbPbJoDbk2gQhKh7FUIubikTOT54JKDmAdaIYc2VHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738593707; c=relaxed/simple;
	bh=eqHJ6iLQC6PaAIkGJVA+giLkfaYuuTRYHIPTbp/HUeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G9mpziJVXYzDuzLjCRmHfCFJxn/uj+e6s695fRH9PL7ieYfQ4svX1iRjpSXEdxBcqK14iGNvFlOJS8JdHV0zixbpuHHd62IND0W68U5gHHyZfZh9mTLgulFvnYd1yAzKog7146nU3m5b4QCMof0viffq8pzBctJDGpR7OjLROeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OO2ifQqF; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OO2ifQqF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738593706; x=1770129706;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eqHJ6iLQC6PaAIkGJVA+giLkfaYuuTRYHIPTbp/HUeE=;
  b=OO2ifQqFVmV7kG4nW5obr55+UI88HnNLPwTVLRyC6gkABIl/NcAmxuMC
   6m+HeHCqTEoI9japp1fm9iUQUrKI4ziqFNew2PK5XuZQ6FOjxCDr9fzrv
   HA0bqRMm/d5LrrG/epMaLlDPZEGx/TE0CzvCXT3OfUJU0qgWhG1J9+Fyv
   vqvn3SaTaDoc2TEXQfb8kg6ZMgU6ZSe3ov41M2k5sU0XQvWCIfgVEfmUN
   Vhh2MIdN3UczM+1jEcsyht2yJmfFi0nawDu4JSIrmtdJcbvBbkuCVX9bi
   zzbZdXy1cztNNhQtDbCfetQWG7p0Osw5m73q2TZ376LNVnn4iWB6vG82t
   g==;
X-CSE-ConnectionGUID: FXKj8CnjToqM8N1IVO/elw==
X-CSE-MsgGUID: epKpmSa5QqSJA2n3yozLfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="43012117"
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="43012117"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 06:41:45 -0800
X-CSE-ConnectionGUID: /GE/cKmzS16OqKpC32VlUg==
X-CSE-MsgGUID: 17ywrmFcQAaESKVe9X2uPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114340726"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 06:41:39 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1texdo-00000007rLu-0rgk;
	Mon, 03 Feb 2025 16:41:36 +0200
Date: Mon, 3 Feb 2025 16:41:35 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
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
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
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
Message-ID: <Z6DVn8u-2EwMaMR4@smile.fi.intel.com>
References: <20250203084906.681418-1-apatel@ventanamicro.com>
 <20250203084906.681418-13-apatel@ventanamicro.com>
 <Z6CPvteWv89Xo70j@smile.fi.intel.com>
 <20250203105840.GH3713119@black.fi.intel.com>
 <Z6C1cg3cqik8ZxvU@sunil-laptop>
 <20250203123658.GI3713119@black.fi.intel.com>
 <Z6DJ9kmNx4JoqRg-@sunil-laptop>
 <Z6DVDicVEgmSyGcT@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6DVDicVEgmSyGcT@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Feb 03, 2025 at 04:39:11PM +0200, Andy Shevchenko wrote:
> On Mon, Feb 03, 2025 at 07:21:50PM +0530, Sunil V L wrote:
> > On Mon, Feb 03, 2025 at 02:36:58PM +0200, Mika Westerberg wrote:
> > > On Mon, Feb 03, 2025 at 05:54:18PM +0530, Sunil V L wrote:
> > > > On Mon, Feb 03, 2025 at 12:58:40PM +0200, Mika Westerberg wrote:
> > > > > On Mon, Feb 03, 2025 at 11:43:26AM +0200, Andy Shevchenko wrote:
> > > > > > On Mon, Feb 03, 2025 at 02:19:01PM +0530, Anup Patel wrote:
> > > > > > > From: Sunil V L <sunilvl@ventanamicro.com>
> > > > > > > 
> > > > > > > fwnode_get_reference_args() which is common for both DT and ACPI passes
> > > > > > > a property name like #mbox-cells which needs to be fetched from the
> > > > > > > reference node to determine the number of arguments needed for the
> > > > > > > property. However, the ACPI version of this function doesn't support
> > > > > > > this and simply ignores the parameter passed from the wrapper function.
> > > > > > > Add support for dynamically finding number of arguments by reading the
> > > > > > > nargs property value. Update the callers to pass extra parameter.
> > > > > > 
> > > > > > I don't like this (implementation).
> > > > > 
> > > > > Agree.
> > > > > 
> > > > > > It seems that we basically have two parameters which values are duplicating
> > > > > > each other. This is error prone API and confusing in the cases when both are
> > > > > > defined. If you want property, add a new API that takes const char *nargs
> > > > > > and relies on the property be present.
> > > > > 
> > > > > Also this is not really needed for ACPI case because it has types so it can
> > > > > distinguish references from integer. Having separate property for this just
> > > > > makes things more complex than they need to be IMHO.
> > > > 
> > > > Thanks! Andy and Mika for your kind feedback. I agree that having both
> > > > property name and nargs is confusing and also ACPI would not need
> > > > nargs_prop. In fact, I think ACPI doesn't need even nargs integer value
> > > > as well from the caller since all integers after the reference are
> > > > counted as arguments.  However, the issue is acpi_get_ref_args() assumes
> > > > that caller passes valid num_args. But typically the common
> > > > fwnode_property_get_reference_args() doesn't usually pass both valid
> > > > values. So, should fwnode_property_get_reference_args() pass both
> > > > nargs_prop (for DT) and nargs (for ACPI). Or do you mean it is better to
> > > > remove the check for num_args in the loop inside acpi_get_ref_args()
> > > > function?
> > > 
> > > Can you show an example of a case you are trying to solve with this? So far
> > > we have been able to go with the current implementation so why this is
> > > needed now?
> > 
> > Basically one can call fwnode_property_get_reference_args()
> > irrespective of DT/ACPI. The case we are trying is like below.
> > 
> > if (fwnode_property_get_reference_args(dev->fwnode, "mboxes",
> > 					       "#mbox-cells", 0, index, &fwspec)) {
> > ...
> > }
> > 
> > As you can see this works for DT since OF interface handles
> > "#mbox-cells". But since nargs is passed as 0, it won't work for ACPI
> > due to the reason I mentioned earlier.
> > 
> > Mandating to pass both "#mbox-cell" and valid nargs count looks
> > redundant to me.
> 
> Ah, interesting. The original change that introduces this 3e3119d3088f ("device
> property: Introduce fwnode_property_get_reference_args") hadn't been reviewed
> by Mika or me, that's probably why we are not familiar with.
> 
> Since interface is already established, I would recommend to fix
> this as proposed, i.e. with a new API. This is the way to match
> how OF seems to be doing.

For the reference see implementation of of_fwnode_get_reference_args()

	if (nargs_prop)
		ret = of_parse_phandle_with_args(to_of_node(fwnode), prop,
						 nargs_prop, index, &of_args);
	else
		ret = of_parse_phandle_with_fixed_args(to_of_node(fwnode), prop,
						       nargs, index, &of_args);


-- 
With Best Regards,
Andy Shevchenko


