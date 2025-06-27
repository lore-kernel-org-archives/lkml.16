Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9705819E990;
	Fri, 27 Jun 2025 15:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751039899; cv=none; b=ICsqLr+jakEUA57DF8FIv5lwxGMMCVxWL+MqB1cDOF3m/Q5D2jWPWiOccPx8KDvPgfW019wUjwmvP1n8olAymmIDHE6YZuI6TbLJcPB9pLvaRCEGpCnefsuAwxzHNkNCgtnwAgQCfoNUTsxGFG9BsCGHF3kzyGYRxbGTm+Cg+qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751039899; c=relaxed/simple;
	bh=u+XL7v8/9OOtA8g6d2DdeYD79b4YpzBpJvua/vnySUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t4MEEpYWWWaPXLT8Vu1Sw/cn5CfZ+Biouvc18raV3PMyT4DJy0TR/U/3h9nIo5ZmdvCO9m7MpGJ1UdFFrw0DrRsMo0clo1On8ytLOnuQ/VWpedV4BeGghUSO6JwiYMBnw/tKAKGS2JP2EUR8GFAdPl5+6vW4dW6pDSQxDEssco8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aua8oyWG; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aua8oyWG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751039898; x=1782575898;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u+XL7v8/9OOtA8g6d2DdeYD79b4YpzBpJvua/vnySUU=;
  b=aua8oyWGZ+MBtqFh7wthv4dL7LYTn4BaXspsqPK5BHCywxv7QBZg0LXj
   Jt4hAP/yRQN33rHfR0L4fU6mn/GehuGTUcA7+ddvYrp8gv7LstLgqV1Af
   z4HfqDh+P6XWBVSpqEa3e+obDPFQxRaPNExEF+OUS2+DpkVJQA1z36CFD
   1Yw0ZnzhKv6CPgzDhJhWM0FPJ8PUSHdmnGDIui/d0w2M5cqzPQbhrMDtV
   R9oRz5a5Ea9loZEqC8lJizxH46c6ku7CqFXA9gq3n27Jfu3NOftBuaLHB
   mxvM7qie1GJ8+OCJiKLKJLJiKsmW4QpP36lAAz44/K5BCzr2dtEY91xQW
   g==;
X-CSE-ConnectionGUID: MhW9j5FXSUiMS3VQ3XIgMg==
X-CSE-MsgGUID: tWTUKrZ7R5CMaA4bFqiVnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="57164080"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="57164080"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 08:58:16 -0700
X-CSE-ConnectionGUID: KVJGX7g6S5KEfnZwEuHcqg==
X-CSE-MsgGUID: yIZt5dr4Q5yFAGa7IG6/Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="176516514"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 08:58:10 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uVBSo-0000000AWqQ-09Od;
	Fri, 27 Jun 2025 18:58:06 +0300
Date: Fri, 27 Jun 2025 18:58:05 +0300
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
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 09/23] clk: Add clock driver for the RISC-V RPMI clock
 service group
Message-ID: <aF6_jVJYCXeKZfXo@smile.fi.intel.com>
References: <20250618121358.503781-1-apatel@ventanamicro.com>
 <20250618121358.503781-10-apatel@ventanamicro.com>
 <aFkZJKnweqBi64b8@smile.fi.intel.com>
 <CA+Oz1=a65HvfXHWjeSq4Ubq=5kzHp9pkLJVr77hvTYAGFHv0Mg@mail.gmail.com>
 <aF1UWNzWhheLNTky@smile.fi.intel.com>
 <CA+Oz1=bAsykB=qAk3r8FV8K8cnPEVT4Ow7L4SWBvrc_3DsyaWw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+Oz1=bAsykB=qAk3r8FV8K8cnPEVT4Ow7L4SWBvrc_3DsyaWw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Jun 27, 2025 at 08:36:41PM +0530, Rahul Pathak wrote:

...

> > > > > +     if (ret || rx.status)
> > > > > +             return 0;
> > > >
> > > > Why rx.status can't be checked before calling to a sending message?
> > > > Sounds like the rpmi_mbox_init_send_with_response() links rx to msg somehow.
> > > > If this is the case, use msg here, otherwise move the check to be in the
> > > > correct place.
> > >
> > > Yes, the rpmi_mbox_init_send_with_response is a helper function which links
> > > the rx to msg. It's a very simple function which only performs assignments.
> > >
> > > Using msg instead of rx directly will require additional typecasting
> > > which will only clutter
> > > I can add a comment if that helps wherever the rpmi_mbox_init_send_with_response
> > > is used.
> >
> > This is besides harder-to-read code is kinda of layering violation.
> > If you afraid of a casting, add a helper to check for the status error.
> > Comment won't help much as making code better to begin with.
> 
> Why using rx is the issue in the first place when it's the same layer
> which links the rx with msg using the helper function and then
> uses it directly?  Infact using rx directly avoids unnecessary code
> which is only increasing redundant code which ultimately results in
> same thing. Even if I add a helper function that will require additional
> pointer passing with NULL checking which all is currently avoided.
> And, we are not just talking about rx.status but a lot of other fields.

Because it's simply bad code, look at the simplified model:

	int foo, bar;
	int ret;

	func_1(..., &foo, &bar);
	ret = func_2(&foo);
	if (ret || bar)
		...do something...

When one reads this code the immediate reaction will be like mine.
This is also (without deeper understanding) tempting to someone
who even thinks that the code can be simplified (w/o knowing that it
may not) to change it as

	func_1(..., &foo, &bar);
	if (bar)
		...do something...

	ret = func_2(&foo);
	if (ret)
		...do something...

Using msg is the right thing to do. In that way there is no questions asked
and everything is clear. Also why layering violation? Because the conditional
requires to know the guts of rx in the code which doesn't use rx that way
(or rather using it as semi-opaque object).

-- 
With Best Regards,
Andy Shevchenko


