Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46931B78F3
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 15:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751036841; cv=none; b=NUIuaJ9Yonesh8orYjFIDNdXF5F9KXMSmCiwrvCwmZnXftg2O4G2I1I2vSrh6ZJ/0mBcNBpsyGQNWHxPx8xUxuXu+3I1s8F17oRgTrJIIKQBtYU2Mxk/gVF/9y/8mZhMkbE5ff4me1jeYqQ78Ur3bx1UdeJ7cxR1Wf5l5rG6XJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751036841; c=relaxed/simple;
	bh=K1W/ACUkhEzsh3VhZeua9bbwljhzBiDcmta6M6ukqF0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=suZEWIiLelUIrJqByLCAQlo7dCGdE6Xsh4uPSiePe8UJ0GtS86Lc1m9S0CE31FNSJHYWcVdhguCD154YEGB8nTa2o1on5EAlEK9lCQeDpGLCFNx0Y4AMfnPDYg7oMM0R8E+lO3a7oHsrSDFi0cjzYTOpZcIjMaDDCfxGD/ErLvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=D25FZLss; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="D25FZLss"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-879d2e419b9so1939671a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 08:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751036839; x=1751641639; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kTVCLY7nH8LB+Zm3xLfrn9nxZr6jXIw9YXpYJef7Kgs=;
        b=D25FZLsstZtLsO5j+wAXsUDJnc7QJjU1sSGmjqN94ktzT3SFC4WYiJE7BbwEvnAAPG
         q2q4YlC6sC0HhmzfiJo+aICTur6m9XyRK/P/xbhCYJmVXqJbzCLYXZ9HNXFvennNOs+J
         0Zu+F8ZBFwThPrbcK8xpNVb1UYvI8lbFEyVjp9+s5lszsR4cQTHYV3isOpQMkYqfa8lC
         8pic48+BHO9EEHvi6ArqBtW5i/emso6Zp6VnmTKIJUTC00ITbygVdj7sNjAzo2pA+dCY
         S8nfOC3Nu+iNYTwhgf3/4unN1yFpd9wmMIZnTHHUzyYEinDKjW2prZ/esAX5QKzjtxCg
         iApw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751036839; x=1751641639;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kTVCLY7nH8LB+Zm3xLfrn9nxZr6jXIw9YXpYJef7Kgs=;
        b=Y8MZBCF9DTPypaYrUgXntjfviIshD06yRfIc7jCFa9INbyk0Oc7kjnm2nJ1li7OWW2
         8wLo3/UdW60799K2n3x1KV35Jwp6wg8u/RbcbO8OA6FN1zIVzg/7lwDTINRPWqtLIXxh
         1RHfp4NwUVWs+H77Rq6xlwS+P30oO4Lr03DhLFTs5xo1Ujf//fdkfYBIpTulWdtP8OQ/
         6F3JGaV4MmfxOwvRF2E4MGXqnp1Naviy/wWv4vkMIoLsTqEAp4Z9kYs9c18Kynkfpxka
         wq2oA4TEfmvfSsKQdio92A3r603WU/BhzKNqtwQFToxrhxVoHs67N4CgYRBeNB7imMAE
         hcJw==
X-Forwarded-Encrypted: i=1; AJvYcCWimFR34tIWS6AeBQ5GH/9AmFvIpwmsBg+bK7YBlvqdk99U+Jomu1bvdspMPUyBwL7UWlzHoMbiDXu58Jc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwE5BB60rAWDWwfylr4A6Zv6EUG5GWDewqDLrGAYPlucTWMaThO
	zZUsszBmUtE0PiEUKMhjO8oU8DTeL5bmdEzHhqlkuxcfKjrCjh1qy4EvntrtDcpNwiTFPuNl+1q
	9JN9j+GY9Fde5vC2AI9huyWGAugyhKZ+Hz0L95ACOkQ==
X-Gm-Gg: ASbGncsBzJRnON9AFq+S/uVW1UA6Ri53CSkYfCqSVxQVf9XPKtB0Tumi7NJjxjG3u6t
	WXZhor0Xi+vsZ4lViruymcvNbmvFTsqWjburkK5pET7A7lWBMOFPNwEPuai1GoTkZBQY9glIYz1
	5I/rrXgV099/6pZYXPW47FKbCocmgnaO/iRnVE3avtoqkA8O+Fbb1pbGBftcHs5vKmZXYautMUb
	eCi
X-Google-Smtp-Source: AGHT+IF4AdiLDVJzWcIgdL/8Bs2UVOqvh/d51X69lsgIeuxgoVvKvtiPfY/zv1dvVDdkVgnc/ZS5VJNJlB5QgtEcAew=
X-Received: by 2002:a17:90b:528a:b0:311:d3a5:572a with SMTP id
 98e67ed59e1d1-318c9225e52mr5337592a91.8.1751036839222; Fri, 27 Jun 2025
 08:07:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250618121358.503781-1-apatel@ventanamicro.com>
 <20250618121358.503781-10-apatel@ventanamicro.com> <aFkZJKnweqBi64b8@smile.fi.intel.com>
 <CA+Oz1=a65HvfXHWjeSq4Ubq=5kzHp9pkLJVr77hvTYAGFHv0Mg@mail.gmail.com> <aF1UWNzWhheLNTky@smile.fi.intel.com>
In-Reply-To: <aF1UWNzWhheLNTky@smile.fi.intel.com>
From: Rahul Pathak <rpathak@ventanamicro.com>
Date: Fri, 27 Jun 2025 20:36:41 +0530
X-Gm-Features: Ac12FXyg_1voP3_rSKmrZJ_A-E3gflVigZ0fA-ce5u-xgIj9wegRrIsa-1iLCcE
Message-ID: <CA+Oz1=bAsykB=qAk3r8FV8K8cnPEVT4Ow7L4SWBvrc_3DsyaWw@mail.gmail.com>
Subject: Re: [PATCH v6 09/23] clk: Add clock driver for the RISC-V RPMI clock
 service group
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Anup Patel <apatel@ventanamicro.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Len Brown <lenb@kernel.org>, Sunil V L <sunilvl@ventanamicro.com>, 
	Leyfoon Tan <leyfoon.tan@starfivetech.com>, Atish Patra <atish.patra@linux.dev>, 
	Andrew Jones <ajones@ventanamicro.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Anup Patel <anup@brainfault.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > > > +union rpmi_clk_rates {
> > > > +     u64 discrete[RPMI_CLK_DISCRETE_MAX_NUM_RATES];
> > > > +     struct {
> > > > +             u64 min;
> > > > +             u64 max;
> > > > +             u64 step;
> > > > +     } linear;
> > >
> > > Have you looked at the linear_range.h? Why can it not be (re-)used here?
> >
> > I did the first time only when you commented. And i dont see any
> > benefit in that.
> > linear_range has slightly different way to access any value using `sel`.
> > Here this union represents how RPMI protocol represents the rates and
> > reusing linear_range will only introduce conversion to and fro.
>
> Summarize this in the comment on top of the struct definition so one will not
> attempt to convert the driver in the future.
>

Sure, I will update.

> >
> > >
> > > > +     if (ret || rx.status)
> > > > +             return 0;
> > >
> > > Why rx.status can't be checked before calling to a sending message?
> > > Sounds like the rpmi_mbox_init_send_with_response() links rx to msg somehow.
> > > If this is the case, use msg here, otherwise move the check to be in the
> > > correct place.
> >
> > Yes, the rpmi_mbox_init_send_with_response is a helper function which links
> > the rx to msg. It's a very simple function which only performs assignments.
> >
> > Using msg instead of rx directly will require additional typecasting
> > which will only clutter
> > I can add a comment if that helps wherever the rpmi_mbox_init_send_with_response
> > is used.
>
> This is besides harder-to-read code is kinda of layering violation.
> If you afraid of a casting, add a helper to check for the status error.
> Comment won't help much as making code better to begin with.

Why using rx is the issue in the first place when it's the same layer
which links the rx with msg using the helper function and then
uses it directly?  Infact using rx directly avoids unnecessary code
which is only increasing redundant code which ultimately results in
same thing. Even if I add a helper function that will require additional
pointer passing with NULL checking which all is currently avoided.
And, we are not just talking about rx.status but a lot of other fields.

>
> > > > +     struct rpmi_clk_context *context = rpmi_clk->context;
> > > > +     struct rpmi_clk_rate_discrete *rate_discrete;
> > > > +     struct rpmi_clk_rate_linear *rate_linear;
>
> > > > +     struct rpmi_get_supp_rates_rx *rx __free(kfree) = NULL;
>
> This should be assigned where it's used. NULL assignment is not encouraged.

Sure, I will update.

>
> > > > +     struct rpmi_get_supp_rates_tx tx;
> > > > +     struct rpmi_mbox_message msg;
> > >
> > > > +     size_t clk_rate_idx = 0;
> > >
> > > This kind of assignments is hard to maintain and it's mistake prone in case
> > > some additional code is injected in the future that might reuse it.
> > >
> > I dont understand what is the problem with this assignment. If any
> > code added in the future reuse it then it has to make sure that
> > clk_rate_idx has the correct initial value before any further references.
>
> Yes, it will add an additional churn and require more brain activity to
> maintain such a code. It's a general recommendation to assign when it's
> actually needed (there are, of course, exceptions for some small functions,
> but this one is not).

Sure, I will update.



-- 

Thanks
Rahul Pathak
