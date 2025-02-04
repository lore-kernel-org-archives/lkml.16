Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112A42163AF;
	Tue,  4 Feb 2025 17:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738690613; cv=none; b=nYwPN0rkF+86mlH+92CWhG6Q+p3NkG+APRDbpLQ2GsuyXeIU/S2LeHTIDUb3kgBq/3x9QIrSspEyzwsewXRNph0tp+DLhieUysFY64gHEJKDrQKMIMN0YE75BXdwLbUUVe8elniPKkrCF/vGf3l9uIr3e4qwQfovjSt0rpB96Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738690613; c=relaxed/simple;
	bh=pIXT1Hs1aUtzZe3Mmj8B+f4h66p4s3gODDX3GQGG9jk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YjfRffhlrm+/jTZdJsT5vWcxIP3e6AiXlSEPGsGvcXzEMJ6xqMtE0r0LMELcAQRDcGz39psmVwHJ/aEbNIgP9w/7rmQV+K8pLMH9fGbcajKt/TrUApkNl44y6874GWCY6Hi2XF5Aj9R8GXqigkC3fqRZx4TUqLMr/1AXXOyrfE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JqeLuFId; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JqeLuFId"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738690612; x=1770226612;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pIXT1Hs1aUtzZe3Mmj8B+f4h66p4s3gODDX3GQGG9jk=;
  b=JqeLuFIdWOkz9cJWnwzAp6+wUvF8Ptcxk8v0yd4nzz4In2Ema1YQudwX
   AXJd71UoeRHkdGhY1kIl7XGUFj9q5GMoJNGUazp1NkofHJ3wPE6kzsoE7
   zIf0CN9pedv4Ph/pY1ObEE/f/ShikONKandcqjZGz15VoXndfQ14k+Juq
   V31QHYT2Pl8gy7L+fJ4AI7m3eKVJaIcvoL1AMZofyh75rTF4lB3wiPjQ2
   6ylztqTtmREcCkRdvRqGNyKJycsf+UczP8ZIiHSktHxEdJFzUIjCvVR2l
   Xm+dGKtkKaP80FbOTgycoG9P03+cnxbpwP7z9qdUMFenJv20XeE9+Aj19
   Q==;
X-CSE-ConnectionGUID: yeIKk6AZSz+hacf7Lj7qHA==
X-CSE-MsgGUID: sIYvCpe4QVmlRDRTgJ2HTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="64583761"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="64583761"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:36:51 -0800
X-CSE-ConnectionGUID: wCA9AbmgQMu5wOszPK0wRg==
X-CSE-MsgGUID: fMhha4lFQUKbtEVcr0PRXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="110494598"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:36:45 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tfMqn-00000008DQ7-3FFR;
	Tue, 04 Feb 2025 19:36:41 +0200
Date: Tue, 4 Feb 2025 19:36:41 +0200
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
Message-ID: <Z6JQKQnBeB2Z9XQY@smile.fi.intel.com>
References: <20250203084906.681418-1-apatel@ventanamicro.com>
 <20250203084906.681418-13-apatel@ventanamicro.com>
 <Z6CPvteWv89Xo70j@smile.fi.intel.com>
 <20250203105840.GH3713119@black.fi.intel.com>
 <Z6C1cg3cqik8ZxvU@sunil-laptop>
 <20250203123658.GI3713119@black.fi.intel.com>
 <Z6DJ9kmNx4JoqRg-@sunil-laptop>
 <Z6DVDicVEgmSyGcT@smile.fi.intel.com>
 <Z6DVn8u-2EwMaMR4@smile.fi.intel.com>
 <Z6JHG-nqFWDv-jpE@sunil-laptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6JHG-nqFWDv-jpE@sunil-laptop>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Feb 04, 2025 at 10:28:03PM +0530, Sunil V L wrote:
> On Mon, Feb 03, 2025 at 04:41:35PM +0200, Andy Shevchenko wrote:
> > > Ah, interesting. The original change that introduces this 3e3119d3088f ("device
> > > property: Introduce fwnode_property_get_reference_args") hadn't been reviewed
> > > by Mika or me, that's probably why we are not familiar with.
> > > 
> > > Since interface is already established, I would recommend to fix
> > > this as proposed, i.e. with a new API. This is the way to match
> > > how OF seems to be doing.
> > 
> > For the reference see implementation of of_fwnode_get_reference_args()
> > 
> > 	if (nargs_prop)
> > 		ret = of_parse_phandle_with_args(to_of_node(fwnode), prop,
> > 						 nargs_prop, index, &of_args);
> > 	else
> > 		ret = of_parse_phandle_with_fixed_args(to_of_node(fwnode), prop,
> > 						       nargs, index, &of_args);
> > 
> > 
> Thanks!. I can do similar. But the change in
> __acpi_node_get_property_reference() will be still required since that
> is the place where the actual decoding of AML object is done. That would
> be similar to __of_parse_phandle_with_args() as well. Hope that is fine.

You don't need that. Split the core part to local static helper that
takes whatever it needs, but being not visible to anyone outside
drivers/acpi/property.c. And build the current helper and new visible one
on the basis of this split. For better reviewing and maintaining you can
split this approach to two patches: 1) preparatory by splitting a new
local helper; 2) the introduction of a new API.


-- 
With Best Regards,
Andy Shevchenko


