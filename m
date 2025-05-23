Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A23D18DB2A
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 11:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748000353; cv=none; b=joK41YH6lPbI8TWxq6hUAHfDvcRKEovrXTn24ACAfMkscLeDTQKR6KAE2ddZlM3aUa+7LaSduD9XfapS1LozhmEfgdgBTt/mK0brubRnr0ptnZc2mQQGEZrvv6jpeyL8FMb3AZO3VOk8LvYplfb7qB152IM/U58qQ/IHAoQbqpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748000353; c=relaxed/simple;
	bh=4c6XCcGeGI3Iz42ETVD1kWDpnOaknLRaew23lcoOgaw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GZcwc2rIL4zIk+CCBiCaa47To0ciKp60rzDu2XZ3rpmKEWGS3tTla5jWqGfg7SGwfaxw6ZsPPyl/T8qs7CNkIT8Qkams5wta3Wu5Kgi/3qXzr8gcyWbfSlHWQ+EgSM1jeVR9ZHpt/5PRDOdrBkratVw3BQmKQo9RnkWpkkirRA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=iqt2JCiD; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="iqt2JCiD"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3290ae9b011so62079601fa.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 04:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748000349; x=1748605149; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4c6XCcGeGI3Iz42ETVD1kWDpnOaknLRaew23lcoOgaw=;
        b=iqt2JCiD0yZhix7cKkZGkGIt7KPbjUPQa7M/o+1OAdMDz6hgpQDqt6kjx8vHb+FCfG
         l4m3y/plCGg6oIf20G6NiVN2/fWdF4BT6ntRTygyc2C0ktOtySZfDwI1Kk6p7gLJrlxt
         Yk30ZY6gW6FAGy/r9gkyXjRhq0Xsc9yg7cWL8IgTKfhNA/QpXd6nEAo1OVWyRFKFXPCU
         NknyrlzTj3sa8l0bieqOHtvXypLPdyCUP/6HM7fpvCq7K3zNcjHwZp32XAAUhyfTO7FL
         r88tuv8JSv29aPPMOtvj05DOfW/pGRfxitUIP4IMQF0RSXqYHe/WhxZA6PY/re6gSEep
         7pBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748000349; x=1748605149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4c6XCcGeGI3Iz42ETVD1kWDpnOaknLRaew23lcoOgaw=;
        b=uXlyEiLPCJaXV8UISdhzcQT1VtpfG3xmeDQhge2yDhQx6PCcZ357rNBMRFpgQD+/tu
         0NLv4jWaINN23ymZubLV9tG2QErLYkB+1AGdEKncBS04DyIewgaGaPZo/XNe2hgwu+Xb
         2RjttN8rG4b3EDgnQz0m6U0bA3lo2g3A9Qre2X0ngDgldQaEJ/hOacto1CL4K4GA99u4
         fBD2RKZ73GGj6vmsMjK/QJNUyALXZGPc/HtlthQcbMnufr78lJJiU5Hs37CfqXLTSnuO
         vTJgzPmyKNSo1dZUq9ZDsrtIIYeq6wurGcTcxnZ2l4axQd7QAbQ1ETpsijgek5EbQva+
         /NzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZBeGHUUsMh+NK6QBWP9LrbH7nVma8u6yxFuoWVhj7pht8z21BVMzGhy6yW2KKAg/F6YISPYV8+SWeWNo=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl1nmupqN9zovx4uw9BrXUPPcTBP9xkObLpKvmWCETyi9N+YqI
	SL6fPHdfETIknOTyyc1caWRg4nTMHi+TTrYq6JSQIikF4tUXlLsUuecMucOUCZuHzN1Sc/5mj2B
	TumrdC74QQtUi0Ev1TfB5sgnPUB3a2iHk7A/QznwKdw==
X-Gm-Gg: ASbGncsxPn59KYDECp2Iyg5PrQvSRGdYVt7vzKTo9pKyOTaELbjmNBZaFwjI/gKjMqR
	6g9CoIIDG7AX0BFL+KQMYFOAg9EB/AGhO3nD6Cq+8Yy9hYhb2few7IOmg5zbOi6ypBfD3aQtYmz
	NLjx5Fj/r2vKGxlboqe6TLKkNZA3LmPgb0
X-Google-Smtp-Source: AGHT+IF2LOIg4O1xHRyi86CCrwvgJ2OS7m73hlziSd4ebNFqUGMO5r7pRVz549vYj95zmX/EW8KpI62SWz8WryNi6o8=
X-Received: by 2002:a05:651c:304f:b0:30b:b956:53e5 with SMTP id
 38308e7fff4ca-328096b7830mr78162091fa.12.1748000349503; Fri, 23 May 2025
 04:39:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250511133939.801777-1-apatel@ventanamicro.com>
 <20250511133939.801777-14-apatel@ventanamicro.com> <aCGaKXOOWyM4JQMg@smile.fi.intel.com>
 <CAK9=C2U1rzSa42qMNqxfTtjAC5RiJrhwg_32_B86nT2+xJ4Qow@mail.gmail.com> <aC3e-IXYb68RoIyu@smile.fi.intel.com>
In-Reply-To: <aC3e-IXYb68RoIyu@smile.fi.intel.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 23 May 2025 17:08:57 +0530
X-Gm-Features: AX0GCFuikFsTk4gG8kf6GKZUp9UJZvUrFZuYjcduLBrZd3gwT8GH2kdzFPFBAPw
Message-ID: <CAK9=C2WMxdmGEY=4BSeR_20JXoLkYK-t55qd0K7w=qOqnAkkOQ@mail.gmail.com>
Subject: Re: [PATCH v3 13/23] irqchip: Add driver for the RPMI system MSI
 service group
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Len Brown <lenb@kernel.org>, Sunil V L <sunilvl@ventanamicro.com>, 
	Rahul Pathak <rpathak@ventanamicro.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, 
	Atish Patra <atish.patra@linux.dev>, Andrew Jones <ajones@ventanamicro.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 7:41=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, May 21, 2025 at 05:07:05PM +0530, Anup Patel wrote:
> > On Mon, May 12, 2025 at 12:20=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Sun, May 11, 2025 at 07:09:29PM +0530, Anup Patel wrote:
>
> ...
>
> > > > +#include <linux/bitfield.h>
> > > > +#include <linux/bitops.h>
> > > > +#include <linux/cpu.h>
> > > > +#include <linux/interrupt.h>
> > > > +#include <linux/irqchip.h>
> > > > +#include <linux/mailbox_client.h>
> > > > +#include <linux/mailbox/riscv-rpmi-message.h>
> > > > +#include <linux/module.h>
> > > > +#include <linux/msi.h>
> > > > +#include <linux/of_irq.h>
> > > > +#include <linux/platform_device.h>
> > > > +#include <linux/printk.h>
> > > > +#include <linux/smp.h>
> > >
> > > + types.h
> > >
> > > Actually this one is most clean, the rest of the patches where the ne=
w code
> > > is introduced has semi-random list of the inclusions, please, follow =
the IWYU
> > > principle.
> >
> > Sure, I will simplify the #includes
>
> Oh, IWYU (Include What You Use) is not about simplification. It's about
> comprehension. It usually means that *more* headers need to be included
> and *only some* of the existing will be dropped.
>

Okay, I will update accordingly.

Regards,
Anup
