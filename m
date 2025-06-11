Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A615695
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 05:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749619291; cv=none; b=YGxsk2SM11UA0XhySvhlbP9tF/kSAbjPQcwDLAOQKfhe+g8P7TNzpDQBwncgQ3x4CPQpQOcDK2kujZTsidiqRSZSdOv4TL9GzXmWsiDMuSe5zQuHxWqAAWxxQRdYoBDH/bMAGw4V7bdeYAQO0tlTqDz5YcYM1QOzbo6i1vIdPto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749619291; c=relaxed/simple;
	bh=Hf+lkGaUqaa3E7rZXs3fvFcSb8MaDoq9N7PpKV1SFWY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zw9AeYmiTMR8PDfbuZoGG982TUZGBvZMD0+Jf6uZ9stDhp1GU/SKhhQ9TsAXUSOnIPPKH8Sls2Qe/Sv8h670zZUapM2xrI+BUag2dMaqkuXgpvMGhrSAHwF6Ur1uBWGDM+035dlVBMhETY00V8s1saslS1cNMQ/zX5PPMtSJ3KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=cIaZVpyr; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="cIaZVpyr"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5535652f42cso6365995e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 22:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749619288; x=1750224088; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CZBCRuywHIrHwB4Y6CUEmtf4oyW/dhVJ1DZHpWrRRRc=;
        b=cIaZVpyrGmbtfG9DEmittwHhTJGAwUmt5GTccOjEFW/8RuReQg9x3QS/m/uDCe+xHO
         5vCS21iejai+faDwO6c9RIoXzEjK6br6ZkGJMWF/DMeYL7OSBzhiolK9qun2QW7xnV/W
         v8prh+cM9rzXAB3y3idfe6Ox4/bG4iqdNjoO5wWJVLYSbgLr/Eqiy1w0q9ZuyzRsMxqs
         G6CupV9O5iUT9lnxaYHP3wJYAsSz6al2q20gfyJzTsC/xHxNsbipT2/+tYuljBtDGfMO
         OnmJaZG2aEri60Gj4l+7LuTeSiY2mFoVVvPb66Srt8U9iDSRRwb336vDNSLDP4iPeHru
         1uAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749619288; x=1750224088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CZBCRuywHIrHwB4Y6CUEmtf4oyW/dhVJ1DZHpWrRRRc=;
        b=k5kZZhG8q3e6q1TJ8T1WniFiF/yT64pssVyZ0nWAY7h1BMn/5zLP+ar6VPo/NCA+rT
         HPtPpS7OZk+fE68/tOXT+Z31+wwlzuCUPAfZoK/B7OOWTbuTxp376A/qD/w1Lgovq0fk
         m+Qmfw1stEKm+jYz5gPZqls6xVEy7zbyC/i8kQ0op4CRX3xrsyiUQg15tdHBNQY+qyZB
         npvOgIbkQz1DTUKHFQb4DQo8RL2JiKuKYJmFP15nLZ+6LG63LaysGnaf0gy37VABIZ/T
         rkeOzjkSkYB7SCwELkmsJI4bdD+JQJaQbZy/R5x2qrpM++VHD4PzKQck+wpcLV0/Cxst
         fY2w==
X-Forwarded-Encrypted: i=1; AJvYcCU4iyruGD6YYIfmxv19JWPNRK6PsRdEgxs6eRL3Pggeu4jq7LbluHtD9LcpVArZoCTF8oWSrCpkoUDNC2U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwerPz5fhCVYR46f94yHPO9au0I6X1RKftUs9haT/t92qBJGY3
	h3UEH7dqkmhr4Nn4cXLsDJQWJQmhabgVYKgTtxZP1BVT4AAIW8iMPwA4mnvlGu0sUMPXqNlLzGl
	agzQey5cAOm6y3ASv6D1Qv0Fv4YX/uEkyL/627RtTVQ==
X-Gm-Gg: ASbGncvXeOMOGjjB4lF6egcjNaeripGTkWdBStV+PcZj4aWBTpvXIXctHwWzzFz2GTC
	IpR7XTBfDpgO5CX0ZXpxvWEIGFNFhFjlg1rnI84Kh3/Kq06rUcI791P9Fx/jtZ98dzBaD5r7z9E
	gkNqPfJnr8cdSxFtE3XedoBPf/hKw2Z5771V6UIpdmp3N8Woq3sJA5Q/U=
X-Google-Smtp-Source: AGHT+IGcTZB8S6Gd3hIZot1w2/0Yfybi+OExqcLnX1AZuMKGrGy+Zh6YIGrowqLXEqln+XAK8JxzBWfPL5Z462AVQRQ=
X-Received: by 2002:a05:6512:ea0:b0:553:2411:b4ef with SMTP id
 2adb3069b0e04-5539c14d883mr614133e87.34.1749619287649; Tue, 10 Jun 2025
 22:21:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
 <20250525084710.1665648-8-apatel@ventanamicro.com> <aDbrBFcgaJxgBRVZ@smile.fi.intel.com>
 <CAK9=C2XJwgsC5AK-eVOHQqN1tPxtrsTjVoKdHgALbREv=sb8zQ@mail.gmail.com>
 <aEc-SHvL187xdj-m@smile.fi.intel.com> <CAK9=C2VjOZ22smYdxDg1bjnx-+wwjngEN3c-iOpdtaADFcQ0+w@mail.gmail.com>
 <aEgBGup553Pki98e@smile.fi.intel.com>
In-Reply-To: <aEgBGup553Pki98e@smile.fi.intel.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 11 Jun 2025 10:51:15 +0530
X-Gm-Features: AX0GCFt0zvXLqPkqunyCtbvdd6VWwuT7DuTT2gaTg9GfnLxzDC88KAV9zwbxwm8
Message-ID: <CAK9=C2Ww0Mt91x_r0VTffse-AiWcOyBYvWpxxK7p5=+EDUEoMw@mail.gmail.com>
Subject: Re: [PATCH v4 07/23] mailbox: Add RISC-V SBI message proxy (MPXY)
 based mailbox driver
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

On Tue, Jun 10, 2025 at 3:25=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Jun 10, 2025 at 10:05:27AM +0530, Anup Patel wrote:
> > On Tue, Jun 10, 2025 at 1:34=E2=80=AFAM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Mon, Jun 09, 2025 at 05:59:40PM +0530, Anup Patel wrote:
> > > > On Wed, May 28, 2025 at 4:23=E2=80=AFPM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > On Sun, May 25, 2025 at 02:16:54PM +0530, Anup Patel wrote:
>
> ...
>
> > > > > > +     if (mbox->msi_count)
> > > > >
> > > > > Is this check really needed?
> > > >
> > > > MSIs are optional for the SBI MPXY mailbox so we should only use
> > > > platform_device_msi_xyz() APIs only when MSIs are available.
> > >
> > > > > > +             platform_device_msi_free_irqs_all(mbox->dev);
> > >
> > > Hmm... I am not sure why. Do you have any Oops or warnings if the che=
ck
> > > is not there and no MSI provided?
> >
> > We don't see any oops or warnings. This check is to avoid unnecessary
> > work (such as acquiring lock, checking default domain, etc) in the
> > msi_domain_free_irqs_all() called by platform_device_msi_free_irqs_all(=
).
> >
> > I don't mind dropping the check so I will update in the next revision.
>
> Perhaps you can rather add this check into the callee? Seems to me that
> you have a justification for it. Usual pattern in the kernel that freeing
> resources should be aware of the NULL pointers or optional resources
> so we may call it unconditionally from the user(s).
>

Unconditionally calling platform_device_msi_free_irqs_all() when there
were no MSIs allocated causes the below crash because "dev->msi.data"
is non-NULL only when:

[    1.355735] Unable to handle kernel NULL pointer dereference at
virtual address 0000000000000008
[    1.358212] Current swapper/0 pgtable: 4K pagesize, 57-bit VAs,
pgdp=3D0x0000000081a2b000
[    1.360632] [0000000000000008] pgd=3D0000000000000000
[    1.363132] Oops [#1]
[    1.363748] Modules linked in:
[    1.364768] CPU: 3 UID: 0 PID: 1 Comm: swapper/0 Not tainted
6.16.0-rc1-00037-gab55e1c1d97a-dirty #7 NONE
[    1.368325] epc : mutex_lock+0x0/0x28
[    1.369796]  ra : __msi_lock_descs+0x32/0x3c
[    1.370234] epc : ffffffff80af96e8 ra : ffffffff800038e6 sp :
ff2000000004ba90
[    1.372412]  gp : ffffffff81819c00 tp : ff60000001dc0000 t0 :
6900000000000000
[    1.373527]  t1 : 0000000000000072 t2 : 6962732d76637369 s0 :
ff2000000004bab0
[    1.376628]  s1 : ff6000000241c410 a0 : 0000000000000008 a1 :
ffffffff8168ca58
[    1.379110]  a2 : 0000000000000010 a3 : 00000000000000a3 a4 :
0000000000000000
[    1.380410]  a5 : 0000000000000000 a6 : 0000000000000000 a7 :
000000004442434e
[    1.381019]  s2 : 0000000000000000 s3 : ff6000003fff30a0 s4 :
ff6000000241c410
[    1.381579]  s5 : ff600000039f9320 s6 : ff6000000241c400 s7 :
0000000000000002
[    1.382242]  s8 : ffffffff81821fa0 s9 : 0000000000000000 s10:
0000000000000000
[    1.384018]  s11: 0000000000000000 t3 : ffffffff81830a37 t4 :
ffffffff81830a37
[    1.385958]  t5 : ffffffff81830a38 t6 : ff2000000004b7c8
[    1.387306] status: 0000000200000120 badaddr: 0000000000000008
cause: 000000000000000d
[    1.388407] [<ffffffff80af96e8>] mutex_lock+0x0/0x28
[    1.389333] [<ffffffff80003dba>] msi_domain_free_irqs_all+0x2a/0x48
[    1.390275] [<ffffffff80714e86>] platform_device_msi_free_irqs_all+0x16/=
0x2c
[    1.391715] [<ffffffff808d8114>] mpxy_mbox_probe+0x6dc/0x750
[    1.392522] [<ffffffff806f1706>] platform_probe+0x4e/0xb4
[    1.393169] [<ffffffff806eef58>] really_probe+0x84/0x230
[    1.393789] [<ffffffff806ef160>] __driver_probe_device+0x5c/0xdc
[    1.394282] [<ffffffff806ef2a4>] driver_probe_device+0x2c/0xf8
[    1.396577] [<ffffffff806ef4ac>] __driver_attach+0x6c/0x15c
[    1.397634] [<ffffffff806ed146>] bus_for_each_dev+0x62/0xb0
[    1.399060] [<ffffffff806eea9a>] driver_attach+0x1a/0x24
[    1.399792] [<ffffffff806ee31e>] bus_add_driver+0xce/0x1d8
[    1.400363] [<ffffffff806f020c>] driver_register+0x40/0xdc
[    1.400832] [<ffffffff806f1414>] __platform_driver_register+0x1c/0x24
[    1.401551] [<ffffffff80c3df7e>] mpxy_mbox_driver_init+0x1a/0x24
[    1.402328] [<ffffffff800108b2>] do_one_initcall+0x56/0x1d8
[    1.403674] [<ffffffff80c01236>] kernel_init_freeable+0x266/0x2d0
[    1.404956] [<ffffffff80af549a>] kernel_init+0x1e/0x13c
[    1.405422] [<ffffffff80012266>] ret_from_fork_kernel+0xe/0xcc
[    1.405870] [<ffffffff80aff042>] ret_from_fork_kernel_asm+0x16/0x18

It is better to have the check on "mbox->msi_count" before calling
platform_device_msi_free_irqs_all().

Regards,
Anup
