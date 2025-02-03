Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A931C17993;
	Mon,  3 Feb 2025 14:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738593563; cv=none; b=ModJ8TXDtTsZHHY7Wn9hRFwf0k6All2WM7T+sPR9K9HT6lOdB3rJk2Pp8uoTmHSrq1FaCyGdZCUcoeyCICXDGQ4JxO/C9BownrKqsh/0+6DNinTklLKdMWiJuiF5gCuUEOxnASenjKlcnP3oBOJDtzaezBV45fPMwmw6UZPPZIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738593563; c=relaxed/simple;
	bh=dA12J9ikOMHFZHgkM871xf7LoUD101cGevQzk/6n9tU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iz9G3+6EOv3FwmrRWDW9Gx7WmxCctmSefoJHD7LgWdgIuV+4cvIPDylZiph7ywW12la/BnweIg1uJ5unOsc6sa1LZIW+RLIpSsqHbuzZF6Av8EX5eBglF5kj+xFQ5OPoY8lfnUsyOw2wJ07fL3f0H7ID2RaBFfpcZ9jembh4HHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mkC0nb7A; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mkC0nb7A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738593562; x=1770129562;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dA12J9ikOMHFZHgkM871xf7LoUD101cGevQzk/6n9tU=;
  b=mkC0nb7A7u0Los7MObt3fsCCwRNubmIBzD22sHVxLg03yTFvU6Q5bmyb
   9FS29PFms0zpIHCO6xtCj5nVyEUUCT/ZsnImkjBkulaaxNDAePoRjNupR
   eu7i147TBJvSciPRV0rwdhcBeI9H/t9SAD5k94XyQGxdlLv3VGMROuUbv
   K9WOQbNHG5zYnA9c/k2My30ryCnkh9lXwSGB1bP74SDgHJQEIEhKQbVXK
   TuvH0pPF+XmU0csAi+nsPqZjRsbRecrrWReepY9qbv8Mx2odtL6UzHO8g
   q01OrM5BIUQHrMVV2ARqbgLWHKExAhPyIukHuhDd09sux7nHhGNcH36t4
   w==;
X-CSE-ConnectionGUID: NBGP5es5RKqH8+aU6a2dPQ==
X-CSE-MsgGUID: rRY6V6HAR8CpRkAe/++ahA==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="39226920"
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="39226920"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 06:39:21 -0800
X-CSE-ConnectionGUID: /2Cyhkc9SySXsArDog+jaQ==
X-CSE-MsgGUID: rC94I25uQ6qErBJa9Mq56Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="110199299"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 06:39:15 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1texbT-00000007rJ0-0hyj;
	Mon, 03 Feb 2025 16:39:11 +0200
Date: Mon, 3 Feb 2025 16:39:10 +0200
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
Message-ID: <Z6DVDicVEgmSyGcT@smile.fi.intel.com>
References: <20250203084906.681418-1-apatel@ventanamicro.com>
 <20250203084906.681418-13-apatel@ventanamicro.com>
 <Z6CPvteWv89Xo70j@smile.fi.intel.com>
 <20250203105840.GH3713119@black.fi.intel.com>
 <Z6C1cg3cqik8ZxvU@sunil-laptop>
 <20250203123658.GI3713119@black.fi.intel.com>
 <Z6DJ9kmNx4JoqRg-@sunil-laptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6DJ9kmNx4JoqRg-@sunil-laptop>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Feb 03, 2025 at 07:21:50PM +0530, Sunil V L wrote:
> On Mon, Feb 03, 2025 at 02:36:58PM +0200, Mika Westerberg wrote:
> > On Mon, Feb 03, 2025 at 05:54:18PM +0530, Sunil V L wrote:
> > > On Mon, Feb 03, 2025 at 12:58:40PM +0200, Mika Westerberg wrote:
> > > > On Mon, Feb 03, 2025 at 11:43:26AM +0200, Andy Shevchenko wrote:
> > > > > On Mon, Feb 03, 2025 at 02:19:01PM +0530, Anup Patel wrote:
> > > > > > From: Sunil V L <sunilvl@ventanamicro.com>
> > > > > > 
> > > > > > fwnode_get_reference_args() which is common for both DT and ACPI passes
> > > > > > a property name like #mbox-cells which needs to be fetched from the
> > > > > > reference node to determine the number of arguments needed for the
> > > > > > property. However, the ACPI version of this function doesn't support
> > > > > > this and simply ignores the parameter passed from the wrapper function.
> > > > > > Add support for dynamically finding number of arguments by reading the
> > > > > > nargs property value. Update the callers to pass extra parameter.
> > > > > 
> > > > > I don't like this (implementation).
> > > > 
> > > > Agree.
> > > > 
> > > > > It seems that we basically have two parameters which values are duplicating
> > > > > each other. This is error prone API and confusing in the cases when both are
> > > > > defined. If you want property, add a new API that takes const char *nargs
> > > > > and relies on the property be present.
> > > > 
> > > > Also this is not really needed for ACPI case because it has types so it can
> > > > distinguish references from integer. Having separate property for this just
> > > > makes things more complex than they need to be IMHO.
> > > 
> > > Thanks! Andy and Mika for your kind feedback. I agree that having both
> > > property name and nargs is confusing and also ACPI would not need
> > > nargs_prop. In fact, I think ACPI doesn't need even nargs integer value
> > > as well from the caller since all integers after the reference are
> > > counted as arguments.  However, the issue is acpi_get_ref_args() assumes
> > > that caller passes valid num_args. But typically the common
> > > fwnode_property_get_reference_args() doesn't usually pass both valid
> > > values. So, should fwnode_property_get_reference_args() pass both
> > > nargs_prop (for DT) and nargs (for ACPI). Or do you mean it is better to
> > > remove the check for num_args in the loop inside acpi_get_ref_args()
> > > function?
> > 
> > Can you show an example of a case you are trying to solve with this? So far
> > we have been able to go with the current implementation so why this is
> > needed now?
> 
> Basically one can call fwnode_property_get_reference_args()
> irrespective of DT/ACPI. The case we are trying is like below.
> 
> if (fwnode_property_get_reference_args(dev->fwnode, "mboxes",
> 					       "#mbox-cells", 0, index, &fwspec)) {
> ...
> }
> 
> As you can see this works for DT since OF interface handles
> "#mbox-cells". But since nargs is passed as 0, it won't work for ACPI
> due to the reason I mentioned earlier.
> 
> Mandating to pass both "#mbox-cell" and valid nargs count looks
> redundant to me.

Ah, interesting. The original change that introduces this 3e3119d3088f ("device
property: Introduce fwnode_property_get_reference_args") hadn't been reviewed
by Mika or me, that's probably why we are not familiar with.

Since interface is already established, I would recommend to fix
this as proposed, i.e. with a new API. This is the way to match
how OF seems to be doing.

-- 
With Best Regards,
Andy Shevchenko


