Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E4522FF5E
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 09:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747387775; cv=none; b=Hz+KDLtsgqP5mHzr3qN+4/gfu4wSq5VJPai9lmGmb2KqOKiD19zSgRob4Oq+VrHuhQqQYo/Zvij1HNqm95rXoiMkDSXt3z07UPKw1TUbB2uEDgmRkfpvk+/1MPzWW0LUbNaf71c710oI6E1EbQyFSTVjPSQK5Ge5HnNFtiXuRmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747387775; c=relaxed/simple;
	bh=P4Q+TwoV9CsCxq2+rEEUq8WV1ggTeAmq86PHWQKod58=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H/BLvfU1J0VGUeJhbr2RZ1gH01e/+EpuOzzXQS2Rtag7ks4cmm66Zzc9LtG9DiDsgqGf1g8yJ4wsasqrbbXd5E3N1/TmLmn8ibh4MxPxWsLPdLVj8bUfvnoCVZjc+oSZpIwcpraYf6YXLE/CahfQasTH6HNO88iuegPC0ntdENI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N9/cUSpP; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N9/cUSpP"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5fbee929e56so3533076a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 02:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747387771; x=1747992571; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gHhHGMrWLIGUqDFlkOGWHGKdWIzyR3vOGQ1cH2zD7ao=;
        b=N9/cUSpPwz+ivaFnBIVtJ6t1Kv1ZV1lIU3oHReO8CAAPr88jd2unwNdJau3SFtKg2g
         EtIa2vD47RNeg+EVa3XSpW1tFzlXi3H7hv/M0h2MRp+Z5PSFmr/DcGSVc647ITXXo8zO
         OcvqGVsgm6tH7GEMmqC6OvIJwnM4WpaPRxzpUhHjq+DEgjisVGXGRc/Fpp0As8bGg2O2
         JKzCpmv/XjRqULJNERgLtcEwEJV+fG6fGrsO/mPohoBft1CSDV5hda2TTgjjTZf/fqQ1
         Y/XDSW+WbZPI58f9kG7v7bhLpfXVzhrrvg3M1NIwwIL8Keeg6lTNRXYwWem3O43spS7u
         ob3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747387771; x=1747992571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gHhHGMrWLIGUqDFlkOGWHGKdWIzyR3vOGQ1cH2zD7ao=;
        b=uek9RikPcIxpdOO9C5rlPnnywUZY47qvny5y7toRCQNGlHd9KIBZ9r82ifi967KtGr
         4lX+uJBnKsinJt3OYE0Ble//kkUOuCiGBdAlDVcm0z38Wq4nVKNRvHlQP6ggwC0iT2TN
         Y4LXWp7SMguxdl1N0QS9Bp7AYZkypBGdW34Rok/FixU9ewaiDjxCBn871GfW3ZU3fBDI
         TIP641mIhV4HaeL8jnkgoVX0yBj0B6pB5rKQ2nXV0y1PVwf/2CY69u4U+ImE8F5McGZv
         1XrLU9pUZkwgd9yhkY8hvSW+Qr4ZAdbkorPesDAFTIgh8PQ5QjawJWAsZUjKFWum+fbQ
         pM8g==
X-Forwarded-Encrypted: i=1; AJvYcCX9WlzqCTN4QN1SB5S4qmaEdNEH+cJsXqmzgmLBa6SjhS8MsTFg0JbbNwoO2rMUB1qD/DlSrwp1i+VGaXA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2MepVET8mO011fl+XuK3hS2dQ8Ng5MYkgTnkeyqOg49rj+hIN
	SheDAH/D9iFsPMvfZn4Yxa+MgKv+6H29Ww4o13A3OKfDjHvOSqTZ4PXcJ6qxxPsFpcSsbCibos4
	iuNh02BP5o2u220POplsUooAyocBd8r8=
X-Gm-Gg: ASbGncu1THDYksOcy1+wUuWrm5QmifFK/ztiylsK59brJgBwrmsSfGSwyGVhXVuqO4o
	QswvkVUwvSeyTlgvtQsuM0GAcYoYx0toSI+9d8AxmV+ONZVqbYrDijSDLUOby3YH1y1ttUHpJe4
	aMq5KIPd6bkbeDEGkC2I/YA8/2ofTH3TPg
X-Google-Smtp-Source: AGHT+IHKCOQVIPRjqeDK2kspkKwQXzvvSPySyP8vuz7UIAF5Y7ve27DSNoRzMKYZHDV7oNqSJ1eU0buBbX0uVmglaIs=
X-Received: by 2002:a17:907:7da8:b0:ad2:4fb7:6cd7 with SMTP id
 a640c23a62f3a-ad536b5a0e6mr144436566b.2.1747387770326; Fri, 16 May 2025
 02:29:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1747276047.git.zhoubinbin@loongson.cn> <0963b8274bfe25a21f56da9fcba05830fb43408b.1747276047.git.zhoubinbin@loongson.cn>
 <aCaOAVgb8V7_-rLR@mail.minyard.net>
In-Reply-To: <aCaOAVgb8V7_-rLR@mail.minyard.net>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Fri, 16 May 2025 17:29:17 +0800
X-Gm-Features: AX0GCFveM1wfseJ1SBRSiSVMUA_R-l0h2_d8wm9QOuPSnJ5xgEOnMzOqNT15JGk
Message-ID: <CAMpQs4+c5iDfNry__xwqVDQgoji-Chqeov_jvxFZykvvqW-Mmw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] ipmi: Add Loongson-2K BMC support
To: corey@minyard.net
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Lee Jones <lee@kernel.org>, Corey Minyard <minyard@acm.org>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	openipmi-developer@lists.sourceforge.net, Chong Qiao <qiaochong@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Corey:

Thanks so much for the detailed review.

On Fri, May 16, 2025 at 8:59=E2=80=AFAM Corey Minyard <corey@minyard.net> w=
rote:
>
> On Thu, May 15, 2025 at 10:32:25AM +0800, Binbin Zhou wrote:
> > This patch adds Loongson-2K BMC IPMI support.
> >
> > According to the existing design, we use software simulation to
> > implement the KCS interface registers: Stauts/Command/Data_Out/Data_In.
>
> This is a strange way to do this.  My preference would be to have a
> separate driver for this and not put it under the ipmi_si driver.
> But it's annoyingly close and it would duplicate a lot of ipmi_si_intf.c
> Anyway, I think I'm ok with this basic design.  But there are problems.
>
> >
> > Also since both host side and BMC side read and write kcs status, I use
> > fifo pointer to ensure data consistency.
>
> I assume this fifo pointer is part of the interface hardware or the
> implementation on the other side of the interface.
>
> >
> > Therefore I made the whole IPMI driver independent.
>
> What do you mean by this statement?
>
> More comments inline.
>
> >
> > Co-developed-by: Chong Qiao <qiaochong@loongson.cn>
> > Signed-off-by: Chong Qiao <qiaochong@loongson.cn>
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  drivers/char/ipmi/Makefile       |   1 +
> >  drivers/char/ipmi/ipmi_si.h      |   7 +
> >  drivers/char/ipmi/ipmi_si_intf.c |   3 +
> >  drivers/char/ipmi/ipmi_si_ls2k.c | 250 +++++++++++++++++++++++++++++++
> >  4 files changed, 261 insertions(+)
> >  create mode 100644 drivers/char/ipmi/ipmi_si_ls2k.c
> >
> > diff --git a/drivers/char/ipmi/Makefile b/drivers/char/ipmi/Makefile
> > index e0944547c9d0..5eb3494f5f39 100644
> > --- a/drivers/char/ipmi/Makefile
> > +++ b/drivers/char/ipmi/Makefile
> > @@ -8,6 +8,7 @@ ipmi_si-y :=3D ipmi_si_intf.o ipmi_kcs_sm.o ipmi_smic_s=
m.o ipmi_bt_sm.o \
> >       ipmi_si_mem_io.o
> >  ipmi_si-$(CONFIG_HAS_IOPORT) +=3D ipmi_si_port_io.o
> >  ipmi_si-$(CONFIG_PCI) +=3D ipmi_si_pci.o
> > +ipmi_si-$(CONFIG_LOONGARCH) +=3D ipmi_si_ls2k.o
>
> Shouldn't this be dependent on MFD_LS2K_BMC?  It appears you can disable
> that and still have CONFIG_LOONGARCH enabled.

Indeed, it should rely on MFD_LS2K_BMC.
>
> And this MFD can have multiple things hanging off of it, wouldn't you
> want to make the individual drivers their own CONFIG items?
>
> >  ipmi_si-$(CONFIG_PARISC) +=3D ipmi_si_parisc.o
> >
> >  obj-$(CONFIG_IPMI_HANDLER) +=3D ipmi_msghandler.o
> > diff --git a/drivers/char/ipmi/ipmi_si.h b/drivers/char/ipmi/ipmi_si.h
> > index a7ead2a4c753..71f1d4e1272c 100644
> > --- a/drivers/char/ipmi/ipmi_si.h
> > +++ b/drivers/char/ipmi/ipmi_si.h
> > @@ -93,6 +93,13 @@ void ipmi_si_pci_shutdown(void);
> >  static inline void ipmi_si_pci_init(void) { }
> >  static inline void ipmi_si_pci_shutdown(void) { }
> >  #endif
> > +#ifdef CONFIG_LOONGARCH
> > +void ipmi_si_ls2k_init(void);
> > +void ipmi_si_ls2k_shutdown(void);
> > +#else
> > +static inline void ipmi_si_ls2k_init(void) { }
> > +static inline void ipmi_si_ls2k_shutdown(void) { }
> > +#endif
>
> I'm not excited about this, but there is history, I guess.
>
> Same comment as the Makefile on CONFIG_LOONGARCH.

It should be MFD_LS2K_BMC.
>
> >  #ifdef CONFIG_PARISC
> >  void ipmi_si_parisc_init(void);
> >  void ipmi_si_parisc_shutdown(void);
> > diff --git a/drivers/char/ipmi/ipmi_si_intf.c b/drivers/char/ipmi/ipmi_=
si_intf.c
> > index 12b0b77eb1cc..323da77698ea 100644
> > --- a/drivers/char/ipmi/ipmi_si_intf.c
> > +++ b/drivers/char/ipmi/ipmi_si_intf.c
> > @@ -2107,6 +2107,7 @@ static int __init init_ipmi_si(void)
> >
> >       ipmi_si_pci_init();
> >
> > +     ipmi_si_ls2k_init();
> >       ipmi_si_parisc_init();
> >
> >       /* We prefer devices with interrupts, but in the case of a machin=
e
> > @@ -2288,6 +2289,8 @@ static void cleanup_ipmi_si(void)
> >
> >       ipmi_si_pci_shutdown();
> >
> > +     ipmi_si_ls2k_shutdown();
> > +
> >       ipmi_si_parisc_shutdown();
> >
> >       ipmi_si_platform_shutdown();
> > diff --git a/drivers/char/ipmi/ipmi_si_ls2k.c b/drivers/char/ipmi/ipmi_=
si_ls2k.c
> > new file mode 100644
> > index 000000000000..cb31bb989fca
> > --- /dev/null
> > +++ b/drivers/char/ipmi/ipmi_si_ls2k.c
> > @@ -0,0 +1,250 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Driver for Loongson-2K BMC IPMI
> > + *
> > + * Copyright (C) 2024 Loongson Technology Corporation Limited.
> > + *
> > + * Originally written by Chong Qiao <qiaochong@loongson.cn>
> > + * Rewritten for mainline by Binbin Zhou <zhoubinbin@loongson.cn>
> > + */
> > +
> > +#include <linux/ioport.h>
> > +#include <linux/module.h>
> > +#include <linux/types.h>
> > +
> > +#include "ipmi_si.h"
> > +
> > +#define LS2K_KCS_STS_OBF     BIT(0)
> > +#define LS2K_KCS_STS_IBF     BIT(1)
> > +#define LS2K_KCS_STS_SMS_ATN BIT(2)
> > +#define LS2K_KCS_STS_CMD     BIT(3)
> > +
> > +#define LS2K_KCS_DATA_MASK   (LS2K_KCS_STS_OBF | LS2K_KCS_STS_IBF | LS=
2K_KCS_STS_CMD)
> > +
> > +/* Read and write fifo pointers for data consistency. */
> > +struct ls2k_fifo_flag {
> > +     u8 ibfh;
> > +     u8 ibft;
> > +     u8 obfh;
> > +     u8 obft;
> > +};
> > +
> > +struct ls2k_kcs_reg {
> > +     u8 status;
> > +     u8 data_out;
> > +     s16 data_in;
> > +     s16 cmd;
> > +};
> > +
> > +struct ls2k_kcs_data {
> > +     struct ls2k_fifo_flag fifo;
> > +     struct ls2k_kcs_reg reg;
> > +     u8 cmd_data;
> > +     u8 version;
> > +     u32 write_req;
> > +     u32 write_ack;
> > +     u32 reserved[2];
> > +};
>
> The above appears to be a memory overlay for registers.  But you aren't
> using readb/writeb and associated functions to read/write it.  That is
> not the right way to do things.  Please read
> Documentation/driver-api/device-io.rst

Ok, I'll refactor this part of the code to redefine each struct item
into the appropriate macro and access it via readx()/writex().
>
> > +
> > +static void ls2k_set_obf(struct ls2k_kcs_data *ik, u8 sts)
> > +{
> > +     ik->reg.status =3D (ik->reg.status & ~LS2K_KCS_STS_OBF) | (sts & =
BIT(0));
> > +}
> > +
> > +static void ls2k_set_ibf(struct ls2k_kcs_data *ik, u8 sts)
> > +{
> > +     ik->reg.status =3D (ik->reg.status & ~LS2K_KCS_STS_IBF) | ((sts &=
 BIT(0)) << 1);
> > +}
> > +
> > +static u8 ls2k_get_ibf(struct ls2k_kcs_data *ik)
> > +{
> > +     return (ik->reg.status >> 1) & BIT(0);
> > +}
> > +
> > +static unsigned char intf_sim_inb_v0(struct ls2k_kcs_data *ik,
> > +                                  unsigned int offset)
> > +{
> > +     u32 inb =3D 0;
> > +
> > +     switch (offset & BIT(0)) {
> > +     case 0:
> > +             inb =3D ik->reg.data_out;
> > +             ls2k_set_obf(ik, 0);
> > +             break;
> > +     case 1:
> > +             inb =3D ik->reg.status;
> > +             break;
> > +     }
> > +
> > +     return inb;
> > +}
> > +
> > +static unsigned char intf_sim_inb_v1(struct ls2k_kcs_data *ik,
> > +                                  unsigned int offset)
> > +{
> > +     u32 inb =3D 0;
> > +     int cmd;
> > +     bool obf, ibf;
> > +
> > +     obf =3D ik->fifo.obfh !=3D ik->fifo.obft;
> > +     ibf =3D ik->fifo.ibfh !=3D ik->fifo.ibft;
> > +     cmd =3D ik->cmd_data;
> > +
> > +     switch (offset & BIT(0)) {
> > +     case 0:
> > +             inb =3D ik->reg.data_out;
> > +             ik->fifo.obft =3D ik->fifo.obfh;
> > +             break;
> > +     case 1:
> > +             inb =3D ik->reg.status & ~LS2K_KCS_DATA_MASK;
> > +             inb |=3D obf | (ibf << 1) | (cmd << 3);
> > +             break;
> > +     }
> > +
> > +     return inb;
> > +}
> > +
> > +static unsigned char ls2k_mem_inb(const struct si_sm_io *io,
> > +                               unsigned int offset)
> > +{
> > +     struct ls2k_kcs_data *ik =3D io->addr;
> > +     int inb =3D 0;
> > +
> > +     if (ik->version =3D=3D 0)
> > +             inb =3D intf_sim_inb_v0(ik, offset);
> > +     else if (ik->version =3D=3D 1)
> > +             inb =3D intf_sim_inb_v1(ik, offset);
> > +
> > +     return inb;
> > +}
> > +
> > +static void intf_sim_outb_v0(struct ls2k_kcs_data *ik, unsigned int of=
fset,
> > +                          unsigned char val)
> > +{
> > +     if (ls2k_get_ibf(ik))
> > +             return;
> > +
> > +     switch (offset & BIT(0)) {
> > +     case 0:
> > +             ik->reg.data_in =3D val;
> > +             ik->reg.status &=3D ~LS2K_KCS_STS_CMD;
> > +             break;
> > +
> > +     case 1:
> > +             ik->reg.cmd =3D val;
> > +             ik->reg.status |=3D LS2K_KCS_STS_CMD;
> > +             break;
> > +     }
> > +
> > +     ls2k_set_ibf(ik, 1);
> > +     ik->write_req++;
> > +}
> > +
> > +static void intf_sim_outb_v1(struct ls2k_kcs_data *ik, unsigned int of=
fset,
> > +                          unsigned char val)
> > +{
> > +     if (ik->fifo.ibfh !=3D ik->fifo.ibft)
> > +             return;
> > +
> > +     switch (offset & BIT(0)) {
> > +     case 0:
> > +             ik->reg.data_in =3D val;
> > +             ik->cmd_data =3D 0;
> > +             break;
> > +
> > +     case 1:
> > +             ik->reg.cmd =3D val;
> > +             ik->cmd_data =3D 1;
> > +             break;
> > +     }
> > +
> > +     ik->fifo.ibfh =3D !ik->fifo.ibft;
> > +     ik->write_req++;
> > +}
> > +
> > +static void ls2k_mem_outb(const struct si_sm_io *io, unsigned int offs=
et,
> > +                       unsigned char val)
> > +{
> > +     struct ls2k_kcs_data *ik =3D io->addr;
> > +
> > +     if (ik->version =3D=3D 0)
> > +             intf_sim_outb_v0(ik, offset, val);
> > +     else if (ik->version =3D=3D 1)
> > +             intf_sim_outb_v1(ik, offset, val);
> > +}
> > +
> > +static void ls2k_mem_cleanup(struct si_sm_io *io)
> > +{
> > +     if (io->addr)
> > +             iounmap(io->addr);
> > +}
> > +
> > +static int ipmi_ls2k_sim_setup(struct si_sm_io *io)
> > +{
> > +     io->addr =3D ioremap(io->addr_data, io->regspacing);
> > +     if (!io->addr)
> > +             return -EIO;
> > +
> > +     io->inputb =3D ls2k_mem_inb;
> > +     io->outputb =3D ls2k_mem_outb;
> > +     io->io_cleanup =3D ls2k_mem_cleanup;
> > +
> > +     return 0;
> > +}
> > +
> > +static int ipmi_ls2k_probe(struct platform_device *pdev)
> > +{
> > +     struct si_sm_io io;
> > +
> > +     dev_info(&pdev->dev, "probing via ls2k platform");
> > +     memset(&io, 0, sizeof(io));
> > +
> > +     io.addr_source  =3D SI_PLATFORM;
> > +     io.si_type      =3D SI_KCS;
>
> si_type has been reworked recently, the linux next tree has the changes.
> I'll need this modified to work with the linux next changes.

OK, I will rebase my driver.
>
> > +     io.addr_space   =3D IPMI_MEM_ADDR_SPACE;
> > +     io.io_setup     =3D ipmi_ls2k_sim_setup;
> > +     io.addr_data    =3D pdev->resource[0].start;
> > +     io.regspacing   =3D pdev->resource[0].end - pdev->resource[0].sta=
rt + 1;
> > +     io.regsize      =3D DEFAULT_REGSIZE;
> > +     io.regshift     =3D 0;
>
> The above items, except for io_setup,  don't have much meaning for your
> device; there's not much need to set them, and there's no need to
> initialize things to zero.  They are for ipmi_si_port and ipmi_si_mem.

The addr_data and regspacing seem to be needed in
ipmi_ls2k_sim_setup(), in any case, I'll reorganize it based on the
latest code.
>
> > +     io.dev          =3D &pdev->dev;
> > +     io.irq          =3D 0;
> > +     if (io.irq)
> > +             io.irq_setup =3D ipmi_std_irq_setup;
>
> Just remove the irq thing, don't set it to zero and then check it.

OK..
>
> > +
> > +     dev_info(&pdev->dev, "%pR regsize %d spacing %d irq %d\n",
> > +              &pdev->resource[0], io.regsize, io.regspacing, io.irq);
> > +
> > +     return ipmi_si_add_smi(&io);
> > +}
> > +
> > +static void ipmi_ls2k_remove(struct platform_device *pdev)
> > +{
> > +     ipmi_si_remove_by_dev(&pdev->dev);
> > +}
> > +
> > +struct platform_driver ipmi_ls2k_platform_driver =3D {
> > +     .driver =3D {
> > +             .name =3D "ls2k-ipmi-si",
> > +     },
> > +     .probe  =3D ipmi_ls2k_probe,
> > +     .remove =3D ipmi_ls2k_remove,
> > +};
> > +
> > +static bool platform_registered;
> > +void ipmi_si_ls2k_init(void)
> > +{
> > +     int rv;
> > +
> > +     rv =3D platform_driver_register(&ipmi_ls2k_platform_driver);
> > +     if (rv)
> > +             pr_err("Unable to register driver: %d\n", rv);
>
> That's far to vague to be useful.

OK, let's just drop it.
>
> > +     else
> > +             platform_registered =3D true;
> > +}
> > +
> > +void ipmi_si_ls2k_shutdown(void)
> > +{
> > +     if (platform_registered)
> > +             platform_driver_unregister(&ipmi_ls2k_platform_driver);
> > +}
> > --
> > 2.47.1
> >

--
Thanks.
Binbin
