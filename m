Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFD028DF14
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 11:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749553443; cv=none; b=R2+RxkhcTq/cO1xF/B9WntB/Miv7YkMiMnjMWXaJSWuF5YsFlD95XKUVipQc/Ebkjdgb6uGzW+m272AUp4sZGSZWElDkXFPSzgFIfoiHrV3kcFTRGPalu1QCw/YpcoYSVZ/oCjgXWJMgMZ6a2fopL7Dulb/0KZjnx+Bob6/J3tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749553443; c=relaxed/simple;
	bh=8fNQgjatY1ybh3/ip3WOZMx4IyIUcueMoDOkViRKZd8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G3VXK5PqIobHWqTIBWRh1RL/Xki1tP57Cn0A5CsaH2kYurZU/beUFaJhPPAsIfW6i8fQrpbMsHh9UbTficuV6kZxmp1D6fnOHhI3hQcgKEO0ZfSqEF1rVC05AZm75KAp3bxz/3lEhQ46POvyEO6LZ8mNGRa107DrjQ9MAe24c64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=MyPwLmaw; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="MyPwLmaw"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54998f865b8so5000454e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 04:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749553439; x=1750158239; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XKrG+/t13RZcj2XOvH9v9z8+L2fFTYYa3Ltd42Ng0rE=;
        b=MyPwLmawmguJu8VPMGIASo7MS3uN2CUDw5+K1JkfdI3XwUe3aIOnt+7XeEbaxFYsfw
         dyig0/cE0IuVw6vxqMbeUxc4WJkd2DE2T04xmITFKkrzErmb6XtvkzaCGkNOFTHk9iS5
         gx/xmfvzZMVpf1ACgIIczmhSbn6RZN8EzY3eczxmpbJZGOnhwNfuZksBBVn9NwTv0QNM
         8Em9Y9A4ENlkAY4i0jmIOmSKo9d7iJCWFVHVgkzonXH8Gqn4FYSkXUNrSbT0leeiFNC+
         2tQIZ7LTLigPRDvP465LjYIVwXggsp97mpau9TWzONJT7k43MSpi+2dSbpw+uW73nYab
         DJSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749553439; x=1750158239;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XKrG+/t13RZcj2XOvH9v9z8+L2fFTYYa3Ltd42Ng0rE=;
        b=CBp3uoGGumSeTVt4x078VEfj5SoztZH7gaB/yalSkiGnijzE86QUIhhVxh8mePSt8p
         FI8Lq8jW72s1RonPi6D5qRAdTKXTX3XpwOA4sSmIeoO7EJrHmz5qhjcuClmqkyiuX3lA
         yIG/kuwlrh06nA/C5CdAzTroseUT/zcwZDmhd67HHVMtBrQ1P80+D6A0nLZOUzDDjf2I
         emktWq55yW3abofBAyinjtkSbb2XOJajb3b+PxzXPk00WAcwB3tcJ7Snrn/Hy38EmzBW
         AuUNRtag8rLHz+/UgyEUcHkYdR+e9ayow66CYkY1BVKu0zn5M3dtflAAtKJtw7wLSlRS
         fzvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxqR56cdpwFp/vT7b6/HxiGguOHDzluHZgG9eChh29Tm3qdrKG0vA/LGwAR1G58Zlq/xNRU9Naj8xL9rU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWT2LgiAO0A33rpwtncT5yhzK2FJuNJBrjI+tSZm4UyMYv8DJQ
	9dI9pAkwGg31OJ9b2vNfrdJlThn6zfjlpICxz8P4qZoqFkaIAV5MELLjyX1BxzSlOV3nZwMzNV3
	U5nk/xlStajYSSLU1O9/GlfBtUXS6Iuhmr2FVuNKuEg==
X-Gm-Gg: ASbGncsBvLJIVmVuRHL2rmKJMonUt8AEf6nkxp7lRAdFzC/GoEDArqisoq8fUihzT9c
	Qo6qCwZucBTiKcAOwJPGbpe48jW4eehm0iRhumVApS4Ga8j57gj33UT87FPwTtMe6xwfxCft9rc
	IAMOyI8PWbERm9iJrde8TXNrePfJyM9hR154n7Ukj44HcH
X-Google-Smtp-Source: AGHT+IESMN1xY0S0unbcyTuOy1IpGOvKrvakY0krrQjYzGxBna97nQp1FPjoYQhSDGAOnzFkYRrS1ke1WZ4KLHhwEvw=
X-Received: by 2002:a05:6512:1390:b0:553:349c:6465 with SMTP id
 2adb3069b0e04-553947c776fmr618266e87.33.1749553439019; Tue, 10 Jun 2025
 04:03:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
 <20250525084710.1665648-14-apatel@ventanamicro.com> <aDWjG9jAJ7kSaC9b@smile.fi.intel.com>
In-Reply-To: <aDWjG9jAJ7kSaC9b@smile.fi.intel.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 10 Jun 2025 16:33:46 +0530
X-Gm-Features: AX0GCFshka7Yxp7fjO1jD3jzFyiwSbjQL6yn3YQHCZzypSxtbBGLaVxP7eVlcr8
Message-ID: <CAK9=C2VYCSkMV5zoyVEKHTY30Y0KpUr_M8FELm37M8=WYi+4HQ@mail.gmail.com>
Subject: Re: [PATCH v4 13/23] irqchip: Add driver for the RPMI system MSI
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

On Tue, May 27, 2025 at 5:03=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Sun, May 25, 2025 at 02:17:00PM +0530, Anup Patel wrote:
> > The RPMI specification defines a system MSI service group which
> > allows application processors to receive MSIs upon system events
> > such as graceful shutdown/reboot request, CPU hotplug event, memory
> > hotplug event, etc.
> >
> > Add an irqchip driver for the RISC-V RPMI system MSI service group
> > to directly receive system MSIs in Linux kernel.
>
> ...
>
> > +#include <linux/device.h>
>
> Perhaps I missed something, but devm_kzalloc() is in device/devres.h. Do =
you
> need it for something else?

dev_get_msi_domain() is part of linux/device.h hence it should
be included.

I will add linux/device/devres.h as well.

>
> > +#include <linux/dev_printk.h>
> > +#include <linux/irq.h>
> > +#include <linux/irqdomain.h>
> > +#include <linux/mailbox_client.h>
> > +#include <linux/mailbox/riscv-rpmi-message.h>
> > +#include <linux/module.h>
> > +#include <linux/msi.h>
> > +#include <linux/of_irq.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/types.h>
>
> > +#include <vdso/bits.h>
>
> Just make it linux/bits.h as vdso is for user space libvdso and related.
>
> But
>
> + asm/byteorder.h
>
> ...
>
> > +static void rpmi_sysmsi_irq_mask(struct irq_data *d)
> > +{
> > +     struct rpmi_sysmsi_priv *priv =3D irq_data_get_irq_chip_data(d);
>
> Declare temporary variable for hwirq and do irqd_to_hwirq() only once.

Okay, I will update.

>
> > +     int ret;
> > +
> > +     ret =3D rpmi_sysmsi_set_msi_state(priv, irqd_to_hwirq(d), 0);
> > +     if (ret) {
> > +             dev_warn(priv->dev, "Failed to mask hwirq %lu (error %d)\=
n",
> > +                      irqd_to_hwirq(d), ret);
> > +     }
> > +     irq_chip_mask_parent(d);
> > +}
>
> ...
>
> > +static void rpmi_sysmsi_irq_unmask(struct irq_data *d)
>
> Ditto.
>
> ...
>
> > +static void rpmi_sysmsi_set_desc(msi_alloc_info_t *arg, struct msi_des=
c *desc)
> > +{
> > +     arg->desc =3D desc;
> > +     arg->hwirq =3D (u32)desc->data.icookie.value;
>
> Hmm... Why do you need an explicit casting?

Not needed, I will drop the casting in the next revision.

>
> > +}
>
> ...
>
> > +     if (WARN_ON(fwspec->param_count < 1))
>
> + bug.h

Okay, I will update.

>
> > +             return -EINVAL;
>
> + errno.h (but actually you need err.h due to PTR_ERR() et al.)
>
> ...
>
> > +static int rpmi_sysmsi_probe(struct platform_device *pdev)
> > +{
> > +     struct device *dev =3D &pdev->dev;
> > +     struct rpmi_sysmsi_priv *priv;
> > +     int rc;
>
> Be consistent with variable naming for the same (semantically) stuff.
>
> > +     priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +     if (!priv)
> > +             return -ENOMEM;
> > +     priv->dev =3D dev;
>
> > +     platform_set_drvdata(pdev, priv);
>
> How is being used?

Typically, it's for driver_remove() but since we don't have
driver_remove() we can drop it.

>
> > +
> > +     /* Setup mailbox client */
> > +     priv->client.dev                =3D priv->dev;
> > +     priv->client.rx_callback        =3D NULL;
> > +     priv->client.tx_block           =3D false;
> > +     priv->client.knows_txdone       =3D true;
> > +     priv->client.tx_tout            =3D 0;
> > +
> > +     /* Request mailbox channel */
> > +     priv->chan =3D mbox_request_channel(&priv->client, 0);
> > +     if (IS_ERR(priv->chan))
> > +             return PTR_ERR(priv->chan);
> > +
> > +     /* Get number of system MSIs */
> > +     rc =3D rpmi_sysmsi_get_num_msi(priv);
> > +     if (rc < 1) {
> > +             mbox_free_channel(priv->chan);
> > +             if (rc)
> > +                     return dev_err_probe(dev, rc, "Failed to get numb=
er of system MSIs\n");
> > +             else
> > +                     return dev_err_probe(dev, -ENODEV, "No system MSI=
s found\n");
> > +     }
> > +     priv->nr_irqs =3D rc;
> > +
> > +     /* Set the device MSI domain if not available */
> > +     if (!dev_get_msi_domain(dev)) {
> > +             /*
> > +              * The device MSI domain for OF devices is only set at th=
e
> > +              * time of populating/creating OF device. If the device M=
SI
> > +              * domain is discovered later after the OF device is crea=
ted
> > +              * then we need to set it explicitly before using any pla=
tform
> > +              * MSI functions.
> > +              */
>
> > +             if (is_of_node(dev_fwnode(dev)))
> > +                     of_msi_configure(dev, to_of_node(dev_fwnode(dev))=
);
>
>                 if (dev_of_node(dev))
>                         of_msi_configure(dev, dev_of_node(dev));

Okay, I will update.

>
> > +             if (!dev_get_msi_domain(dev)) {
> > +                     mbox_free_channel(priv->chan);
> > +                     return -EPROBE_DEFER;
> > +             }
> > +     }
> > +
> > +     if (!msi_create_device_irq_domain(dev, MSI_DEFAULT_DOMAIN,
> > +                                       &rpmi_sysmsi_template,
> > +                                       priv->nr_irqs, priv, priv)) {
> > +             mbox_free_channel(priv->chan);
> > +             return dev_err_probe(dev, -ENOMEM, "failed to create MSI =
irq domain\n");
> > +     }
> > +
> > +     dev_info(dev, "%u system MSIs registered\n", priv->nr_irqs);
> > +     return 0;
> > +}
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Regards,
Anup
