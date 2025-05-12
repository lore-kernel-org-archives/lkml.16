Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302AB1E9B26;
	Mon, 12 May 2025 14:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747059316; cv=none; b=LRVosaDH0DAj+NAJtJZ16FoVo5s8xZmR1AezhkZ6bPn2TrU+IWfv29K74zMPfQJtYlxiPOQCZGFUlLWz3Qyv4h/49iBCfjWI3OEMpTtfh+7qzTdvBQ1HZZyHbymTybw4YtkDjCRNa+QRKIV5afRbOHUdO6PBeOuos9jE4mmpzrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747059316; c=relaxed/simple;
	bh=dfONP3e4U/F57uoCSRBd9jnVS+K1EGl3ODa9VLH9Bw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QHh6k0aNowWQxjFIBOzWMSg+nEqgYV921pRXd/rG9OhqkQf+qqOWWvMKLjPLjf6zwOGDUHmG0UuUETISUxH+wjrgqnA4JU08OlQYHxs1OOO8r3F0jI7fi4je52cudlmOpg9rZfTEZdbOVX8OJI8e7nFXPMbENNeCpq5AKoD7+WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E3QKam8E; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E3QKam8E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747059314; x=1778595314;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=dfONP3e4U/F57uoCSRBd9jnVS+K1EGl3ODa9VLH9Bw8=;
  b=E3QKam8EBatqGjWSXWFxNOiDms54iChtt3n79BCAA3Tmofr4JAZHuwt6
   j30yrc0QGWD52h/y/LJnB2AdZTuyzQ4/L9jJH04lfACpy2MiJFNBCFBBo
   8992Z5OM4I3YGz+CFB1DLyhMAb1/ZCBqKERPgxiGhqnv3tBCZVdF99CQ3
   q/Z+ZCwnxVfK6r5+iuizKdz3A7h+dDSgTveCaocfyVBCaW1nkgyRDxaKc
   sXgf0LyRQBavL5xosluGrrUdh1crmuZIHfsUxVyT/PtKKyxtkUwbpII8G
   TTbMZrxbQSyhk9HGyj1DP73h5pPJ8lDbuIPOJ4ovS5QJCHT1eUjyvMZTE
   w==;
X-CSE-ConnectionGUID: qkCkTHzyRK+gQY/aXrAeGw==
X-CSE-MsgGUID: wCVG6ad6Q1iAgQvFI9fFMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="60201652"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; 
   d="scan'208";a="60201652"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 07:15:13 -0700
X-CSE-ConnectionGUID: pf3t37W5TEeqZTmIlLtlPg==
X-CSE-MsgGUID: jA0dgYZaQvCt5C0vvV/qsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; 
   d="scan'208";a="142324184"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 07:15:07 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uETvr-00000000vxo-21U5;
	Mon, 12 May 2025 17:15:03 +0300
Date: Mon, 12 May 2025 17:15:03 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Rahul Pathak <rpathak@ventanamicro.com>
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
	Len Brown <lenb@kernel.org>, Sunil V L <sunilvl@ventanamicro.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, rahul@summations.net
Subject: Re: [PATCH v3 10/23] clk: Add clock driver for the RISC-V RPMI clock
 service group
Message-ID: <aCICZxMT6Y7k7Kz1@smile.fi.intel.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
 <20250511133939.801777-11-apatel@ventanamicro.com>
 <aCGeTPS4WiGYMTTo@smile.fi.intel.com>
 <CA+Oz1=ZXJOrXT28V+MVSmvh-4ddnwZ8hJAFzB6tmNbcohLMT=g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+Oz1=ZXJOrXT28V+MVSmvh-4ddnwZ8hJAFzB6tmNbcohLMT=g@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, May 12, 2025 at 03:28:37PM +0530, Rahul Pathak wrote:
> On Mon, May 12, 2025 at 12:38 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Sun, May 11, 2025 at 07:09:26PM +0530, Anup Patel wrote:

...

> > > +struct rpmi_get_supp_rates_rx {
> > > +     u32 status;
> > > +     u32 flags;
> > > +     u32 remaining;
> > > +     u32 returned;
> > > +     u32 rates[];
> > > +};
> >
> > Is it ABI? (I mean if this is interface with some kind of FW)
> > If so, Use proper endianess aware types. Same Q for all data
> > types defined in this driver.
> 
> Sure.
> 
> It's the message format defined by the RISC-V RPMI spec.

So, use the endianess as provided. Or is it always native endianess?

...

> > > +     devm_kfree(context->dev, rx);
> >
> > Why?! This is a red flag to point that here is misunderstanding or abuse of
> > managed resources approach. Either use __Free() from cleanup.h or don't call
> > devm_kfree(). The latter must have a very good justification to explain why.
> 
> Yeah, I think it's better to use kzalloc for this case and then free it.

Instead of freeing it explicitly consider using cleanup.h, i.e. __free().

-- 
With Best Regards,
Andy Shevchenko


