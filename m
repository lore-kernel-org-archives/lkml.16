Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7C2EC2;
	Fri, 23 May 2025 16:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748018118; cv=none; b=bngUYMQUahhYvUsokIt8uFdybrmMKzpyMegqzkjY1h1eVWFAH8SNTSC8u6iCnjSLAo/SsUlYdm17o1IghutHwGAF4V2zJfNg1PmWQD0pwS6OTne6UjB89ccvM+ku59fLt0y69xUvostSveLmxz5oJAC7Maee+I2d4OE/+pcMjDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748018118; c=relaxed/simple;
	bh=+ql4+wMFVHmoFncJ5POu6pIQVoJkYP5u9JwCC9Ndcww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OC7bPcK3kvSt2EqRUusB2NlVMMlsk6oSOSdtW+IYNJB9jr4Y76Tglr/8nCsU68bRSUuLAwPghlEcVJLpSt5Hhl1u2QCthFZFgFMQpK069cOE+t3xCaYkjQrTMAmih/iP7WU+kqlpmKRdnCT9Q0AHlsB5YUUuyveN4GqAzib5HAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tu5S5cG2; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tu5S5cG2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748018117; x=1779554117;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=+ql4+wMFVHmoFncJ5POu6pIQVoJkYP5u9JwCC9Ndcww=;
  b=Tu5S5cG2HTytGRNf+zmIcY1FRC7JG3xPuEKL+lmWcCLuJfN/WK3OZ5PM
   KDDhy1RK3+WBtvXwMPe3/EnyEtk3cX0FXcWty4LFLgu13gbdF1wvcS22j
   8LQ8VPfifqPPJAY1tPILw/7fQFvZO9IYwlV3qYhQekZ0ZT2bSuQVtBBbb
   INsQbOnejHTc9pzravIicBATw8XZPydZ72MplWpTzFshYaz211CBeF03b
   WdQaOdyOTHltjPUMofbdMVJ9hXtJ0m9KjUdtqsoUsozEfY0uwQzheFkoA
   GviNK4rxU5SmhiT3bqbnI+v2vBm27nRc8o0lluyhm7Zi6/q5blUeyT71t
   w==;
X-CSE-ConnectionGUID: cd65I6GASP+zH9uoOjYeXQ==
X-CSE-MsgGUID: KOj9zv1NTSSttWc+/0pxiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49334835"
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; 
   d="scan'208";a="49334835"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 09:35:15 -0700
X-CSE-ConnectionGUID: 1kq2cXoyS26GB4c60n4EDA==
X-CSE-MsgGUID: 8eOGJ7T/QkyBOIEo4kD2ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; 
   d="scan'208";a="141706401"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 09:35:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uIVMP-000000006UP-2OH6;
	Fri, 23 May 2025 19:35:05 +0300
Date: Fri, 23 May 2025 19:35:05 +0300
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
Subject: Re: [PATCH v3 10/23] clk: Add clock driver for the RISC-V RPMI clock
 service group
Message-ID: <aDCjua9KiI96Q8Ht@smile.fi.intel.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
 <20250511133939.801777-11-apatel@ventanamicro.com>
 <aCGeTPS4WiGYMTTo@smile.fi.intel.com>
 <CA+Oz1=aLgFSc+RG4=5B0ejUDRrjUh1xNYmHjJQd0sRUwjMBGiw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+Oz1=aLgFSc+RG4=5B0ejUDRrjUh1xNYmHjJQd0sRUwjMBGiw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, May 22, 2025 at 06:44:09PM +0530, Rahul Pathak wrote:
> On Mon, May 12, 2025 at 12:38 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Sun, May 11, 2025 at 07:09:26PM +0530, Anup Patel wrote:

First of all, remove all unneeded context with which you are agree.
I should not crawl through dozens of lines of the email to see what
you wanted to discuss. Take it as everyday practice, please.

...

> > > +     /* Validate RPMI specification version */
> > > +     rpmi_mbox_init_get_attribute(&msg, RPMI_MBOX_ATTR_SPEC_VERSION);
> > > +     ret = rpmi_mbox_send_message(context->chan, &msg);
> > > +     if (ret) {
> > > +             dev_err_probe(dev, ret, "Failed to get spec version\n");
> > > +             goto fail_free_channel;
> >
> > This is simply wrong. You should not do goto before any devm_*() calls.
> > The error path and ->remove(), if present) is broken. Fix it accordingly.
> >
> > Here should be
> >
> >                 return dev_err_probe(...);
> >
> > it's your homework to understand how to achieve that. Plenty of the examples in
> > the kernel.
> 
> So far I could only find drivers with "goto used before devm_*" pattern used.

Of course, because they are wrong and most of them need fixing.
(Yes, there are some exceptional cases, but I don't believe it's many)

> Can you please point me to the example which does not use goto before
> devm_* apis.

Tons of them, any which starts with devm_*() call in the probe, most of the
drivers/iio/, for instance. Just a random pick here: drivers/iio/accel/bma400*.

(and FWIW it was indeed the very first driver I was looking into while writing
 this email)

> Also, I couldn't understand the problem which may happen because of
> this. Can you please explain?

devm_*() defers the resource deallocation to the end of ->remove() and error
path in ->probe(). This breaks the symmetry of the allocating / deallocating
resources. At worst case it will be an Oops on ->remove() or when error happens
during the ->probe().

...

My gosh, the original text was quoted twice! Next time I won't even look into
the email reply which won't have a reduced context.

-- 
With Best Regards,
Andy Shevchenko


