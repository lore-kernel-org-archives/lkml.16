Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B46121D3DC;
	Mon,  9 Jun 2025 19:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749498826; cv=none; b=fwsF5ijPyb7SwNHG7jAXZLZeD5zDI7FA0x1r2MNdiMxwCNwFqMoR0iTpKp4sQKTi2f6Ly37VG5ixhsfgS48Cq/oKrmvseCu2EkP5xnFIMu38txlWP6whQY3p11cR9ixDEuh8CM8qMXJtJn5qD5/6FtxgyQTNjkjvqO6YZyZBlYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749498826; c=relaxed/simple;
	bh=Z61vb05yKjlD/LY/gFG3tUG593iO/oPz3v/J5LDaeyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c9JmSde0Aq0arwVenGcKLkoAxFtxaH2NHCjgeCy2/cyBd4IKcwjRRxlKsZ7+mE2Cvh63g50ax0zmiaDha5qvmOqQ556gb/+zBkHkUUhk4+s1/x97tv+gH6wk480NqEWBQ03BcVqjH3FwDfh4mbHlrOkfmBW9FLHxhngPkQNvtcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hxka7Vcw; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hxka7Vcw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749498826; x=1781034826;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Z61vb05yKjlD/LY/gFG3tUG593iO/oPz3v/J5LDaeyk=;
  b=Hxka7Vcw2Fk0vdXcImUmaWKSCqTTUUnVzPbMAkex/DcuSrMAu2p14Zkg
   tfcjFNa8KFhdpwLbH2+9fz4JgBI2V0NHTDJYAeQKQg4AJ7z8cVyeoAmUs
   w7QINbLT4D40nfq+drBKVVvhoYMviBphpfu/xMnD/3IAKVM2FRIpnDd5r
   BOYzx8+dM6urSOhSrVrrzNyK6OjuuswYyqJGeFAyD9oN25THAS63M/XtS
   Po9SPV+uB+3Xa0Cs4ckN97eFdZBhdW30kBYzBxp+7qxo1wDa10kukWLPl
   mwAdkB5s4OTdmBKAolzqtKWqkEDi1Q9orjoNqp6IllA0JHAhDEhptn+fY
   w==;
X-CSE-ConnectionGUID: MVEAlLKUTOGVjptCpp7xRA==
X-CSE-MsgGUID: z0zQZQkAT9e3Srjcfg+f0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="69035407"
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="69035407"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 12:53:45 -0700
X-CSE-ConnectionGUID: 86ZvYcmhTumsX1SJHoxbCA==
X-CSE-MsgGUID: J/583IboSVW9+nxntMhqew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="169789539"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 12:53:38 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uOiYp-000000059Ff-0Jqe;
	Mon, 09 Jun 2025 22:53:35 +0300
Date: Mon, 9 Jun 2025 22:53:34 +0300
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
Subject: Re: [PATCH v4 06/23] mailbox: Allow controller specific mapping
 using fwnode
Message-ID: <aEc7vogHjBKP1anJ@smile.fi.intel.com>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
 <20250525084710.1665648-7-apatel@ventanamicro.com>
 <aDWk5kIN3lkB0Jw2@smile.fi.intel.com>
 <CAK9=C2XbNeZRp9h4FevVBm-NdPH3w5t=C1NhAn5WQAkNLK9d_A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK9=C2XbNeZRp9h4FevVBm-NdPH3w5t=C1NhAn5WQAkNLK9d_A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Jun 09, 2025 at 02:40:32PM +0530, Anup Patel wrote:
> On Tue, May 27, 2025 at 5:11 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Sun, May 25, 2025 at 02:16:53PM +0530, Anup Patel wrote:

...

> > >  struct mbox_chan *mbox_request_channel(struct mbox_client *cl, int index)
> > >  {
> > > +     struct fwnode_reference_args fwspec;
> >
> > + property.h (if not done yet)
> 
> This needs fwnode.h

No, it needs property.h. Please, read the note at the top of fwnode.h why.

...

> > > -     int ret;
> > > +     int i, ret;
> >
> > Why is 'i' signed?
> 
> No particular reason because 'i' is not being assigned a negative
>>  value so both signed and unsigned will work fine.

Besides, splitting will make it easier to check and work on as being less
intrusive change.

-- 
With Best Regards,
Andy Shevchenko


