Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703602E7F0E;
	Thu, 26 Jun 2025 14:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750946917; cv=none; b=cc2U4/FSPV5arpIT5GF8+Pe2mSU15r8ZnW/UwQHUWPw3h7PzkoVlP7Xv+3p7IPACij/Swxbm6J4BICXFNkVO/Zi8HbAO4TNqLvFoloXoT5bcrrAlMiSScTD2R7CsKjNAFdUIM0G68o0bE9bN+edzoIkgzqFsubRE0pGYwXR1XbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750946917; c=relaxed/simple;
	bh=k/qMuy2UAwSKbsE7B3K84tsOzsawz6UhjEOsFcCgiuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bLOtZB5kAlmpo6hYqqKVQZvpPFwgZB6o3Xhhd/ZkzI2inVf170H+08JG+THvKsnGhGKltPqVVPIwC/fi0iCK7hu8MxOQ3AsVeF9odFCIFdQ2tvhAB27rGzQwIDT03zm3ej3mqMDU2A4uRfQDL7M+xZ0grC5MG1rmTYPEc+iTaZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kyXF2bcK; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kyXF2bcK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750946915; x=1782482915;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=k/qMuy2UAwSKbsE7B3K84tsOzsawz6UhjEOsFcCgiuY=;
  b=kyXF2bcKAOdCQqlwd+oWi2eEK7VYDT1jzW1bultTA2Xyd0vSFrjrPrsy
   yBxu1+4bom5OeTJStsHgczZUzp8VVrDrHUFwYBrl059tAl5Dff7LZkxnO
   7+YoOApfuWpfL9y+bvDeu6vquK4ODiccJatf/6aWJGWAXqfZDbX5vL1pc
   JHmyO1NB7JR09H2662fsxDbEyvu+K/4VzOHikJwpfSF+i6bS1+Gb37t2c
   rfvUP3DSr/V1sG9A6+uXU33L2wD0MULJqBdLxzQzPpEzvKkO45ya50vNa
   yDBIlnuik9znd7QgGD6qbo53co0hCw8xJ/oHwQTftQKFYSBLsDnDL8Za9
   Q==;
X-CSE-ConnectionGUID: t4YhfzloQp6oRyULYlATAw==
X-CSE-MsgGUID: LSNmX7RvQpuK+abaZvLLxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53185499"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="53185499"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 07:08:34 -0700
X-CSE-ConnectionGUID: CB549Yq0TNqBqvYiSe3cwg==
X-CSE-MsgGUID: h/oV6ZAkT420la7/oEhi8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="158027243"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 07:08:28 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uUnH6-0000000ACBt-2d9z;
	Thu, 26 Jun 2025 17:08:24 +0300
Date: Thu, 26 Jun 2025 17:08:24 +0300
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
Message-ID: <aF1UWNzWhheLNTky@smile.fi.intel.com>
References: <20250618121358.503781-1-apatel@ventanamicro.com>
 <20250618121358.503781-10-apatel@ventanamicro.com>
 <aFkZJKnweqBi64b8@smile.fi.intel.com>
 <CA+Oz1=a65HvfXHWjeSq4Ubq=5kzHp9pkLJVr77hvTYAGFHv0Mg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+Oz1=a65HvfXHWjeSq4Ubq=5kzHp9pkLJVr77hvTYAGFHv0Mg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jun 26, 2025 at 12:32:14PM +0530, Rahul Pathak wrote:
> On Mon, Jun 23, 2025 at 2:36 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Wed, Jun 18, 2025 at 05:43:44PM +0530, Anup Patel wrote:

...

> > > +union rpmi_clk_rates {
> > > +     u64 discrete[RPMI_CLK_DISCRETE_MAX_NUM_RATES];
> > > +     struct {
> > > +             u64 min;
> > > +             u64 max;
> > > +             u64 step;
> > > +     } linear;
> >
> > Have you looked at the linear_range.h? Why can it not be (re-)used here?
> 
> I did the first time only when you commented. And i dont see any
> benefit in that.
> linear_range has slightly different way to access any value using `sel`.
> Here this union represents how RPMI protocol represents the rates and
> reusing linear_range will only introduce conversion to and fro.

Summarize this in the comment on top of the struct definition so one will not
attempt to convert the driver in the future.

> > > +};

...

> > > +static u32 rpmi_clk_get_num_clocks(struct rpmi_clk_context *context)
> > > +{
> > > +     struct rpmi_get_num_clocks_rx rx;
> > > +     struct rpmi_mbox_message msg;
> > > +     int ret;
> > > +
> > > +     rpmi_mbox_init_send_with_response(&msg, RPMI_CLK_SRV_GET_NUM_CLOCKS,
> > > +                                       NULL, 0, &rx, sizeof(rx));
> >
> > ...here
> >
> > > +     ret = rpmi_mbox_send_message(context->chan, &msg);
> > > +
> >
> > This blank line should be rather ^^^
> 
> Sure, I will update.
> 
> >
> > > +     if (ret || rx.status)
> > > +             return 0;
> >
> > Why rx.status can't be checked before calling to a sending message?
> > Sounds like the rpmi_mbox_init_send_with_response() links rx to msg somehow.
> > If this is the case, use msg here, otherwise move the check to be in the
> > correct place.
> 
> Yes, the rpmi_mbox_init_send_with_response is a helper function which links
> the rx to msg. It's a very simple function which only performs assignments.
> 
> Using msg instead of rx directly will require additional typecasting
> which will only clutter
> I can add a comment if that helps wherever the rpmi_mbox_init_send_with_response
> is used.

This is besides harder-to-read code is kinda of layering violation.
If you afraid of a casting, add a helper to check for the status error.
Comment won't help much as making code better to begin with.

> > Seems the same question to the all similar checks in the code.
> >
> > > +     return le32_to_cpu(rx.num_clocks);
> > > +}

...

> > > +     struct rpmi_clk_context *context = rpmi_clk->context;
> > > +     struct rpmi_clk_rate_discrete *rate_discrete;
> > > +     struct rpmi_clk_rate_linear *rate_linear;

> > > +     struct rpmi_get_supp_rates_rx *rx __free(kfree) = NULL;

This should be assigned where it's used. NULL assignment is not encouraged.

> > > +     struct rpmi_get_supp_rates_tx tx;
> > > +     struct rpmi_mbox_message msg;
> >
> > > +     size_t clk_rate_idx = 0;
> >
> > This kind of assignments is hard to maintain and it's mistake prone in case
> > some additional code is injected in the future that might reuse it.
> >
> I dont understand what is the problem with this assignment. If any
> code added in the future reuse it then it has to make sure that
> clk_rate_idx has the correct initial value before any further references.

Yes, it will add an additional churn and require more brain activity to
maintain such a code. It's a general recommendation to assign when it's
actually needed (there are, of course, exceptions for some small functions,
but this one is not).

> > > +     int ret, rateidx, j;

...

> > > +     context->chan = mbox_request_channel(&context->client, 0);
> > > +     if (IS_ERR(context->chan))
> > > +             return PTR_ERR(context->chan);
> >
> > Here is an incorrect order of the freeing resources. Besides that, wrapping
> > the mbox_free_channel() into managed resources reduces this code by more
> > than 10 LoCs! At bare minimum it will fix the bug,
> 
> Understood. So we can use devm_add_action_or_reset to link a release function
> with the context->chan. Is this what you are suggesting? This will also make
> the .remove callback redundant which can be removed.

Yes.

-- 
With Best Regards,
Andy Shevchenko


