Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DB424DD09
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 09:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749460248; cv=none; b=Y23FPnAKirBLRLTOzJ+iTWUPpq3MNkiVZJU7GiTppu9J1c3OgXZWQaS7z7d3cimKBzVWzh8Jq+U3IiYul6vicbuC5Xm4XDbs1iiOKCaZd8WNbSgOZ4rFxkWTYsKFmqfzeLUkXJ1SENkOD2XELAWICXcdRDoofcFYiJX49A+LMlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749460248; c=relaxed/simple;
	bh=ZDHaPJOchoR/hqnrZl0N+DUeT8UZdeaTMXTUEFnbspw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CTsm0VJmFAYFkugHVmSDVeLWmPoClKGK58MdblrrIWQogfbXrzL8aMRRtUsKJ1ISRsNkxIotlAtLYEOLte5RDVWu7Y6eJcOlhxeZqWnj8orIzv1At/KFKz20F2inl5RuwuSzxRbvgofe5FMvxMNJa/rJOcGPrWRmY8tP7g/kzfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=HaGVmXad; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="HaGVmXad"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5533c562608so4016344e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 02:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749460244; x=1750065044; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FMmw4G9aKaZU5qDapJFu/F3F/qwNFopqJUpdbcMKEQI=;
        b=HaGVmXadMfaSSUlitAkJrhvVhwgWFHyX5USsKYyy7CIPtPtOjhzD7n2n+MLhduljMv
         rx06MLFK/5MmakjXXIWB91QqSsqlESPfBLs2Eb6CeGPIAmXtGbYCSrEtft9CctVYQ950
         FrgvOblqSrVw1jIyMZ+qZDWZCdM9tVXn2ugbFaii2SQHTqun4fDRAX2unjD7e16m+CpQ
         frlXDqJvDlKnzB4A2hImk0dgcy62u1GU/K3k7x1tZoypj8hX7+BMeXA9bzywjaH5oc0g
         VG+zTtnPaqh8XDWG0GLsr6Q0gVFX5AcHQ9b9DoAakqnbUbe7aiIBEeggTbsBSG0D4oTr
         buiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749460244; x=1750065044;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FMmw4G9aKaZU5qDapJFu/F3F/qwNFopqJUpdbcMKEQI=;
        b=NMbYHUMgE2FYUhfe82ujBu5lMZjSYUhskaJgEkG+834D8Kz0XYGlbsb176oFsXUz0T
         MI83g8/XOOhc6gt4Mdp2lF5728nl9KyhWWU+fd0D7B44OSCIwmc19fZHtPWGdKhGsr5L
         2Ikfcxv78ji612szj2bY3umj8M2hWTS3JYDqUcW/O+9+gEa5XOYqqhBXxcu1BNHJ3ejn
         GCyzWhNPzXjyAflcdvPUaFSOshQo66Vr/Z5JrfikzGgRIdynNgErQwo8L7HC/unLQqep
         k8t+wDN/VleWtNcn84klWMly13btLHkVL9fLP0F79sglfdzibqb1AsRcXQnCDPO/zt+0
         eVjg==
X-Forwarded-Encrypted: i=1; AJvYcCXJ9Cdu0LjWuiq5kB8RVAMqrKFpalSXZsIERse4tqKesIKSt+2a2No7NIXKQWnN9TSn+VNOgEI6ORHpUho=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/v9JpTt0k/0SLYIsTNl0Rt9gYaa4RwDVd8FbxiD51W/afco4u
	tWiq3yxkUd6bToV7w3SaihJMVkcbyI9oIyZJ8iuJQ19Li0DInGBEYRWNtprsnXQkGJ0gwyBMLrO
	T9Wnn8IQmg7ZluOTzB1R4kKZfPgVDQadgz69dPPeRLA==
X-Gm-Gg: ASbGncueZEsQw0MkmHH55bsPISidDA3B6XePw3hdNCAtCATD+qnuCSnypepyw640zhe
	Ttr4i597qz313f30sFImwLVzWryINcPZuzRg3gzxxAU2WMnZ9HToAbI3uA+qM1eRvqErfMVZhK/
	k4stjFu2vhWweO7lEbBlxAglVz3/7Vb2t/7Ik1wzU4wSma
X-Google-Smtp-Source: AGHT+IH+6vAFbi+7H9+Qq6oBFGjvfco9YJD10/KKGRGKVUqABbwLY2AZfQVHTc1As+KdJzrE2dw9ZkGPK2jj2n3kE2k=
X-Received: by 2002:a05:6512:3da1:b0:553:2a2f:22eb with SMTP id
 2adb3069b0e04-55366c35872mr2987129e87.36.1749460244141; Mon, 09 Jun 2025
 02:10:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
 <20250525084710.1665648-7-apatel@ventanamicro.com> <aDWk5kIN3lkB0Jw2@smile.fi.intel.com>
In-Reply-To: <aDWk5kIN3lkB0Jw2@smile.fi.intel.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 9 Jun 2025 14:40:32 +0530
X-Gm-Features: AX0GCFu9QhcInm8OVXRkSGSXY6CJ1XzDih7D6CmQzSnxoRj96FTDd8_3JeLtE_U
Message-ID: <CAK9=C2XbNeZRp9h4FevVBm-NdPH3w5t=C1NhAn5WQAkNLK9d_A@mail.gmail.com>
Subject: Re: [PATCH v4 06/23] mailbox: Allow controller specific mapping using fwnode
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

On Tue, May 27, 2025 at 5:11=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Sun, May 25, 2025 at 02:16:53PM +0530, Anup Patel wrote:
> > Introduce optional fw_node() callback which allows a mailbox controller
> > driver to provide controller specific mapping using fwnode.
> >
> > The Linux OF framework already implements fwnode operations for the
> > Linux DD framework so the fw_xlate() callback works fine with device
> > tree as well.
>
> ...
>
> >  struct mbox_chan *mbox_request_channel(struct mbox_client *cl, int ind=
ex)
> >  {
> > +     struct fwnode_reference_args fwspec;
>
> + property.h (if not done yet)

This needs fwnode.h

>
> > -     int ret;
> > +     int i, ret;
>
> Why is 'i' signed?

No particular reason because 'i' is not being assigned a negative
value so both signed and unsigned will work fine.

>
> > -     if (!dev || !dev->of_node) {
> > -             pr_debug("%s: No owner device node\n", __func__);
> > +     if (!dev || !dev->fwnode) {
>
> Do not dereference fwnode directly. Use dev_fwnode.
>
> > +             pr_debug("%s: No owner %s\n", __func__, !dev ? "device" :=
 "fwnode");
>
> Use positive conditional.
>
> __func__ is redundant it debug messages. With Dynamic Debug enabled it ma=
y be
> switched at run-time.

Okay, I will drop the __func__

>
> >               return ERR_PTR(-ENODEV);
> >       }
> >
> > -     ret =3D of_parse_phandle_with_args(dev->of_node, "mboxes", "#mbox=
-cells",
> > -                                      index, &spec);
> > +     ret =3D fwnode_property_get_reference_args(dev->fwnode, "mboxes",
>
>         struct fwnode_handle *fwnode =3D dev_fwnode(dev);
>
> > +                                              "#mbox-cells", 0, index,=
 &fwspec);
> >       if (ret) {
> >               dev_dbg(dev, "%s: can't parse \"mboxes\" property\n", __f=
unc__);
> >               return ERR_PTR(ret);
> >       }
>
> > +     memset(&spec, 0, sizeof(spec));
> > +     if (dev->of_node) {
>
> What is this check for?

It's a paranoid check on my part. I will drop the check
in the next revision.

>
> > +             spec.np =3D to_of_node(fwspec.fwnode);
> > +             spec.args_count =3D fwspec.nargs;
> > +             for (i =3D 0; i < spec.args_count; i++)
> > +                     spec.args[i] =3D fwspec.args[i];
> > +     }
> > +
> >       mutex_lock(&con_mutex);
> >
> >       chan =3D ERR_PTR(-EPROBE_DEFER);
> > -     list_for_each_entry(mbox, &mbox_cons, node)
> > -             if (mbox->dev->of_node =3D=3D spec.np) {
> > +     list_for_each_entry(mbox, &mbox_cons, node) {
> > +             if (mbox->fw_xlate && mbox->dev->fwnode =3D=3D fwspec.fwn=
ode) {
> > +                     chan =3D mbox->fw_xlate(mbox, &fwspec);
> > +                     if (!IS_ERR(chan))
> > +                             break;
> > +             } else if (mbox->of_xlate && mbox->dev->of_node =3D=3D sp=
ec.np) {
> >                       chan =3D mbox->of_xlate(mbox, &spec);
> >                       if (!IS_ERR(chan))
> >                               break;
> >               }
>
>
>                 if (!IS_ERR(...))
>                         break;
>
> is common.

Latest mailbox.c has changed so I will check and update accordingly.

>
>
> > +     }
>
> ...
>
> > +fw_mbox_index_xlate(struct mbox_controller *mbox,
> > +                 const struct fwnode_reference_args *sp)
>
> One line?

Okay, I will update.

Regards,
Anup
