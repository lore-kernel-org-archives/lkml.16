Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76FA2571B3
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 12:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749472196; cv=none; b=Q6Ms/D1ULuzqU3KcPHBk/6oYWwcnsEk8MPllw+oPZsu77VWFjFCyGMT/Jsh6+w1Eys0Q0YW1DvYSsgmx5TU5rO2FiTSh1ZdyDxxHkGaRMF1/CS4oHFtJZmScsfDNzS9qmxYEXN6QxrlF+Unz6AacuWuX7qlNYX73qk1+aa93laM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749472196; c=relaxed/simple;
	bh=2l9bZJSicAOmv/p2gQ9X6xxSWiJuA2AZHwOhiSs9HSI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HQHh5jyCod2bTXeMvtGSj0RccLX/en3uq79KCFzZbualwyybDMhLAIBogS53RItPqpUtZD8JOUwuje+MJChGjLGD7XLHAZvLAON+2KDy2aMvivR/9JJl89QRRAW8KVoo0Bwzvu1QKxJpmZYtn74+Ak9IXwdt/EEwA3x7Y6EkvO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Wx85GccL; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Wx85GccL"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5535652f42cso4285707e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 05:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749472193; x=1750076993; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8q3U/Hr0JRlIhPJHqFGG5OJ4RZSvBVNQKzbNaS7wJlA=;
        b=Wx85GccLtt+83qCwBK5A73Ezrx0v6kq4WbivXI+Y357GjeO6V9Nyoo/93GPqhRrGI1
         mdESS8UOwJdXCblbMbuMhme5Pse07LxkeeDIEDQhqKztas4ik32H8kPJ5mBspJzTrrdJ
         Xfsdv/n+CKsnSekV12HtFAvmoLe4Nk8+9bf+GzUM/dGlDvNTbrugZHhWwH+ScmIJxAqk
         okb9fQHA7V9hA3MA/yl3NxfBJoCFIj/3+5gYbDv70jVg6GeyDO0Soz7pOr/J11yG2CW4
         wuQhWiwB9l40EKQ1qmCa5T/NBm9ENWIgFy5Ab8erW3hVbtgMrO1zuut8xd/RXyGSFgzO
         sVfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749472193; x=1750076993;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8q3U/Hr0JRlIhPJHqFGG5OJ4RZSvBVNQKzbNaS7wJlA=;
        b=AkcdXs6s1MPuevttPWbTvKDm++in/KMBil5vPQ3awBnE1K8+WjinmYj276WLfnmxpH
         d9XWpg/uqocXehQYjmm+RZmEdGcTrHPJZxeU7Mf160nl5VaKbOOgOlhVMG1zzguHHuQK
         UobYkZoI4iXMwgsvEeDT2ZNR1DwgeP5z9ATC38cg4WdP+70VtI79YjzYgCea9TpkK6hn
         5j3lIKxe9XMOiKofbYFYjljlCyWTYeSJhjHDuj3Sj+RjBmZL7RSC+YWwMc0BcD6Daaan
         kwXglnFosLmfF4YUH9Ne2boJUFkOd075ktfCFngrrTw7Op8JgBVjkz2MOf4ouoqDoyo4
         En1g==
X-Forwarded-Encrypted: i=1; AJvYcCVWQ/hqxA77MLrSbZBo0nHv25l+mYLdZTP3oa2Eh0b3PD/kyL+3ETUQ5xqq+QgYT7SJUrXFEA3cUZXJkfI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb0tM6TPtweZBNLPUuk+ilArnmQ2w2Cvjkx2aV3ojkrPmKK+pB
	2lRrQRBM6+TeMC8FqxF74AUldPwWGbJ5ErzLa1kpgGCQPZ38pFxwE20daQEHl0ixs1dRdZgaO9c
	RbM9WtO9h4LRJEKoce22v8E/gIQ4fAajQomh+eylbdQ==
X-Gm-Gg: ASbGncvoALyGJ855cZIqdzKQn2eLNVNG7TJ0DjqVeTQLzIYfJqy/K2MgDEw2UUhlLsi
	j1ISsoNR1/3su0x8bbszK3VlWNBwNoxkoHHuD+VJMubfyF4bBoi4WZKLJ5NWhNfBkpx1EFsioP1
	pj42EJJ4qJmVC94o6fbGQ68gdmMqdE2dLUDg==
X-Google-Smtp-Source: AGHT+IEBO6vMdFOk3HU4A5lnhJIS0FlanlYt8/6Sm7sYICMiB+mJtpqmaDxrO0jfrtpHuYlZVyr1lZapefSr5+o/xbs=
X-Received: by 2002:a05:6512:2315:b0:553:2411:b4ef with SMTP id
 2adb3069b0e04-55366bf8cb1mr3181092e87.34.1749472192597; Mon, 09 Jun 2025
 05:29:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
 <20250525084710.1665648-8-apatel@ventanamicro.com> <aDbrBFcgaJxgBRVZ@smile.fi.intel.com>
In-Reply-To: <aDbrBFcgaJxgBRVZ@smile.fi.intel.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 9 Jun 2025 17:59:40 +0530
X-Gm-Features: AX0GCFtvZAy9FpdTPML8KJz-weR5ylPxkJ7kgkuXpm7IOx5u_K2lC0wpK3LEeXE
Message-ID: <CAK9=C2XJwgsC5AK-eVOHQqN1tPxtrsTjVoKdHgALbREv=sb8zQ@mail.gmail.com>
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

On Wed, May 28, 2025 at 4:23=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Sun, May 25, 2025 at 02:16:54PM +0530, Anup Patel wrote:
> > Add a mailbox controller driver for the new SBI message proxy extension
> > which is part of the SBI v3.0 specification.
>
> ...
>
> > +#include <asm/sbi.h>
>
> asm/* usually goes after generic linux/* ones. Why here?

I am not aware of any such convention but I will update anyway.

>
> > +#include <linux/cpu.h>
> > +#include <linux/err.h>
> > +#include <linux/init.h>
> > +#include <linux/jump_label.h>
>
> > +#include <linux/kernel.h>
>
> What for?
>
> > +#include <linux/mailbox_controller.h>
> > +#include <linux/mailbox/riscv-rpmi-message.h>
> > +#include <linux/mm.h>
> > +#include <linux/module.h>
> > +#include <linux/msi.h>
> > +#include <linux/of_irq.h>
> > +#include <linux/percpu.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/smp.h>
>
> Please, double check that you follow IWYU (Include What You Use) principl=
e and
> have no "proxy" headers.
>
> (E.g., types.h is missing here, but it got included via one of the above,=
 like
> kernel.h)
>

Okay, I will update.

> ...
>
> > +
> > +     get_cpu();
> > +
> > +     /* Get the remaining and returned fields to calculate total */
> > +     sret =3D sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_GET_CHANNEL_IDS,
> > +                      0, 0, 0, 0, 0, 0);
> > +     if (!sret.error) {
>
> Can it be standard pattern?
>
>         if (error)
>                 goto err_put_cpu;
>
> Ditto for other similar cases.

Okay, I will update.

>
> > +             remaining =3D le32_to_cpu(sdata->remaining);
> > +             returned =3D le32_to_cpu(sdata->returned);
> > +             *channel_count =3D remaining + returned;
> > +     }
> > +
> > +     put_cpu();
> > +     return sbi_err_map_linux_errno(sret.error);
> > +}
>
> ...
>
> > +static int mpxy_get_channel_ids(u32 channel_count, u32 *channel_ids)
> > +{
> > +     u32 remaining, returned, sidx, start_index =3D 0, cidx =3D 0;
> > +     struct mpxy_local *mpxy =3D this_cpu_ptr(&mpxy_local);
> > +     struct sbi_mpxy_channel_ids_data *sdata =3D mpxy->shmem;
> > +     struct sbiret sret;
> > +
> > +     if (!mpxy->shmem_active)
> > +             return -ENODEV;
> > +     if (!channel_count || !channel_ids)
> > +             return -EINVAL;
> > +
> > +     get_cpu();
> > +
> > +     do {
> > +             sret =3D sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_GET_CHANNEL=
_IDS,
> > +                              start_index, 0, 0, 0, 0, 0);
> > +             if (sret.error)
> > +                     goto done;
> > +
> > +             remaining =3D le32_to_cpu(sdata->remaining);
> > +             returned =3D le32_to_cpu(sdata->returned);
> > +
> > +             for (sidx =3D 0; sidx < returned && cidx < channel_count;=
 sidx++) {
> > +                     channel_ids[cidx] =3D le32_to_cpu(sdata->channel_=
array[sidx]);
> > +                     cidx +=3D 1;
> > +             }
> > +
> > +             start_index =3D cidx;
> > +
> > +     } while (remaining);
> > +
> > +done:
>
> It sounds to me like an 'err_put_cpu' for the name.

Okay, I will update.

>
> > +     put_cpu();
> > +     return sbi_err_map_linux_errno(sret.error);
> > +}
>
> > +static int mpxy_write_attrs(u32 channel_id, u32 base_attrid, u32 attr_=
count,
> > +                         u32 *attrs_buf)
> > +{
> > +     struct mpxy_local *mpxy =3D this_cpu_ptr(&mpxy_local);
> > +     struct sbiret sret;
> > +     u32 i;
> > +
> > +     if (!mpxy->shmem_active)
> > +             return -ENODEV;
> > +     if (!attr_count || !attrs_buf)
> > +             return -EINVAL;
> > +
> > +     get_cpu();
> > +
> > +     for (i =3D 0; i < attr_count; i++)
> > +             ((__le32 *)mpxy->shmem)[i] =3D cpu_to_le32(attrs_buf[i]);
>
> Don't we have helpers for this? They are suffixed with _array.
> https://elixir.bootlin.com/linux/v6.15-rc6/source/include/linux/byteorder=
/generic.h#L168
> Don't forget to have asm/byteorder.h being included.
>
> Ditto for the similar case(s).

The cpu_to_le32_array() and le32_to_cpu_array() helpers update data
in-place but over here we have separate source and destination.

>
> > +     sret =3D sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_WRITE_ATTRS,
> > +                      channel_id, base_attrid, attr_count, 0, 0, 0);
> > +
> > +     put_cpu();
> > +     return sbi_err_map_linux_errno(sret.error);
> > +}
>
> ...
>
> > +     msg->error =3D rc;
> > +     return 0;
>
> What's the point of having int and not void function?

Okay, I will update.

>
> ...
>
> > +                            sizeof(mchan->rpmi_attrs) / sizeof(u32),
> > +                            (u32 *)&mchan->rpmi_attrs);
>
> Why casting? What about alignment?

The RPMI attributes (aka struct sbi_mpxy_rpmi_channel_attrs) are
a collection of u32 attributes hence we can also treat rpmi_attrs
as a u32 array. Further, the rpmi_attrs is XLEN aligned within the
struct mpxy_mbox_channel so no alignment issue with the casting
on both RV32 and RV64.

If we want to avoid the casting then we will have to use a temporary
u32 array plus additional memcpy().

>
> ...
>
> > +     while (1) {
>
> Do it as do {} while, it will give an idea that the loop will run at leas=
t once
> (without looking into condition), ideally it shouldn't be infinite loop, =
but it
> might be harder to realise.

Okay, I will update.

>
> > +             rc =3D mpxy_get_notifications(mchan->channel_id, notif, &=
data_len);
> > +             if (rc || !data_len)
> > +                     break;
> > +
> > +             if (mchan->attrs.msg_proto_id =3D=3D SBI_MPXY_MSGPROTO_RP=
MI_ID)
> > +                     mpxy_mbox_peek_rpmi_data(chan, mchan, notif, data=
_len);
> > +
> > +             have_notifications =3D true;
> > +     }
>
> ...
>
> > +static void mpxy_mbox_cleanup_events(struct mpxy_mbox_channel *mchan)
> > +{
> > +     struct device *dev =3D mchan->mbox->dev;
> > +     int rc;
> > +
> > +     /* Do nothing if events state not supported */
> > +     if (!mchan->have_events_state)
> > +             return;
> > +
> > +     /* Do nothing if events state already disabled */
> > +     if (!mchan->attrs.events_state_ctrl)
> > +             return;
> > +
> > +     /* Disable channel events state */
> > +     mchan->attrs.events_state_ctrl =3D 0;
> > +     rc =3D mpxy_write_attrs(mchan->channel_id, SBI_MPXY_ATTR_EVENTS_S=
TATE_CONTROL,
> > +                           1, &mchan->attrs.events_state_ctrl);
>
> > +     if (rc) {
> > +             dev_err(dev, "disable events state failed for MPXY channe=
l 0x%x\n",
> > +                     mchan->channel_id);
> > +     }
>
> Redundant {}.

Okay, I will update.

>
> > +}
>
> ...
>
> > +static int mpxy_mbox_probe(struct platform_device *pdev)
> > +{
> > +     struct device *dev =3D &pdev->dev;
> > +     struct mpxy_mbox_channel *mchan;
> > +     struct mpxy_mbox *mbox;
> > +     int i, msi_idx, rc;
>
> Why is 'i' signed? Also make sure either they use POD (like unsigned int)=
 or
> exact data type the upper limit does or API where you pass it in.

'i' is used to iterate over channels where channel_count and channel ids
are u32 so better to use the u32 data type.

>
> > +     u32 *channel_ids;
> > +
> > +     /*
> > +      * Initialize MPXY shared memory only once. This also ensures
> > +      * that SBI MPXY mailbox is probed only once.
> > +      */
> > +     if (mpxy_shmem_init_done) {
> > +             dev_err(dev, "SBI MPXY mailbox already initialized\n");
> > +             return -EALREADY;
> > +     }
> > +
> > +     /* Probe for SBI MPXY extension */
> > +     if (sbi_spec_version < sbi_mk_version(1, 0) ||
> > +         sbi_probe_extension(SBI_EXT_MPXY) <=3D 0) {
> > +             dev_info(dev, "SBI MPXY extension not available\n");
> > +             return -ENODEV;
> > +     }
> > +
> > +     /* Find-out shared memory size */
> > +     mpxy_shmem_size =3D mpxy_get_shmem_size();
> > +
> > +     /*
> > +      * Setup MPXY shared memory on each CPU
> > +      *
> > +      * Note: Don't cleanup MPXY shared memory upon CPU power-down
> > +      * because the RPMI System MSI irqchip driver needs it to be
> > +      * available when migrating IRQs in CPU power-down path.
> > +      */
> > +     cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "riscv/sbi-mpxy-shmem",
> > +                       mpxy_setup_shmem, NULL);
> > +
> > +     /* Mark as MPXY shared memory initialization done */
> > +     mpxy_shmem_init_done =3D true;
> > +
> > +     /* Allocate mailbox instance */
> > +     mbox =3D devm_kzalloc(dev, sizeof(*mbox), GFP_KERNEL);
> > +     if (!mbox)
> > +             return -ENOMEM;
> > +     mbox->dev =3D dev;
> > +     platform_set_drvdata(pdev, mbox);
> > +
> > +     /* Find-out of number of channels */
> > +     rc =3D mpxy_get_channel_count(&mbox->channel_count);
> > +     if (rc)
> > +             return dev_err_probe(dev, rc, "failed to get number of MP=
XY channels\n");
> > +     if (!mbox->channel_count)
> > +             dev_err_probe(dev, -ENODEV, "no MPXY channels available\n=
");
> > +
> > +     /* Allocate and fetch all channel IDs */
> > +     channel_ids =3D devm_kcalloc(dev, mbox->channel_count,
> > +                                sizeof(*channel_ids), GFP_KERNEL);
> > +     if (!channel_ids)
> > +             return -ENOMEM;
> > +     rc =3D mpxy_get_channel_ids(mbox->channel_count, channel_ids);
> > +     if (rc)
> > +             return dev_err_probe(dev, rc, "failed to MPXY channel IDs=
\n");
> > +
> > +     /* Populate all channels */
> > +     mbox->channels =3D devm_kcalloc(dev, mbox->channel_count,
> > +                                   sizeof(*mbox->channels), GFP_KERNEL=
);
> > +     if (!mbox->channels)
> > +             return -ENOMEM;
> > +     for (i =3D 0; i < mbox->channel_count; i++) {
> > +             mchan =3D &mbox->channels[i];
> > +             mchan->mbox =3D mbox;
> > +             mchan->channel_id =3D channel_ids[i];
> > +
> > +             rc =3D mpxy_read_attrs(mchan->channel_id, SBI_MPXY_ATTR_M=
SG_PROT_ID,
> > +                                  sizeof(mchan->attrs) / sizeof(u32),
> > +                                  (u32 *)&mchan->attrs);
> > +             if (rc) {
> > +                     return dev_err_probe(dev, rc,
> > +                                          "MPXY channel 0x%x read attr=
s failed\n",
> > +                                          mchan->channel_id);
> > +             }
> > +
> > +             if (mchan->attrs.msg_proto_id =3D=3D SBI_MPXY_MSGPROTO_RP=
MI_ID) {
> > +                     rc =3D mpxy_mbox_read_rpmi_attrs(mchan);
> > +                     if (rc) {
> > +                             return dev_err_probe(dev, rc,
> > +                                                  "MPXY channel 0x%x r=
ead RPMI attrs failed\n",
> > +                                                  mchan->channel_id);
> > +                     }
> > +             }
> > +
> > +             mchan->notif =3D devm_kzalloc(dev, mpxy_shmem_size, GFP_K=
ERNEL);
> > +             if (!mchan->notif)
> > +                     return -ENOMEM;
> > +
> > +             mchan->max_xfer_len =3D min(mpxy_shmem_size, mchan->attrs=
.msg_max_len);
> > +
> > +             if ((mchan->attrs.capability & SBI_MPXY_CHAN_CAP_GET_NOTI=
FICATIONS) &&
> > +                 (mchan->attrs.capability & SBI_MPXY_CHAN_CAP_EVENTS_S=
TATE))
> > +                     mchan->have_events_state =3D true;
> > +
> > +             if ((mchan->attrs.capability & SBI_MPXY_CHAN_CAP_GET_NOTI=
FICATIONS) &&
> > +                 (mchan->attrs.capability & SBI_MPXY_CHAN_CAP_MSI))
> > +                     mchan->msi_index =3D mbox->msi_count++;
> > +             else
> > +                     mchan->msi_index =3D U32_MAX;
> > +             mchan->msi_irq =3D U32_MAX;
> > +     }
>
> > +     /* Free-up channel IDs */
> > +     devm_kfree(dev, channel_ids);
>
> Just no. This is most likely (99.9%) wrong use of managed resources. This=
 is
> the biggest issue with this patch so far.

Okay, I will use __free(kfree) for channel_ids[].

>
> > +     /* Initialize mailbox controller */
> > +     mbox->controller.txdone_irq =3D false;
> > +     mbox->controller.txdone_poll =3D false;
> > +     mbox->controller.ops =3D &mpxy_mbox_ops;
> > +     mbox->controller.dev =3D dev;
> > +     mbox->controller.num_chans =3D mbox->channel_count;
> > +     mbox->controller.fw_xlate =3D mpxy_mbox_fw_xlate;
> > +     mbox->controller.chans =3D devm_kcalloc(dev, mbox->channel_count,
> > +                                           sizeof(*mbox->controller.ch=
ans),
> > +                                           GFP_KERNEL);
> > +     if (!mbox->controller.chans)
> > +             return -ENOMEM;
> > +     for (i =3D 0; i < mbox->channel_count; i++)
> > +             mbox->controller.chans[i].con_priv =3D &mbox->channels[i]=
;
> > +
> > +     /* Set the MSI domain if not available */
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
> > +             if (is_of_node(dev_fwnode(dev)))
> > +                     of_msi_configure(dev, to_of_node(dev_fwnode(dev))=
);
> > +     }
> > +
> > +     /* Setup MSIs for mailbox (if required) */
> > +     if (mbox->msi_count) {
> > +             mbox->msi_index_to_channel =3D devm_kcalloc(dev, mbox->ms=
i_count,
> > +                                                       sizeof(*mbox->m=
si_index_to_channel),
> > +                                                       GFP_KERNEL);
> > +             if (!mbox->msi_index_to_channel)
> > +                     return -ENOMEM;
> > +
> > +             for (msi_idx =3D 0; msi_idx < mbox->msi_count; msi_idx++)=
 {
> > +                     for (i =3D 0; i < mbox->channel_count; i++) {
> > +                             mchan =3D &mbox->channels[i];
> > +                             if (mchan->msi_index =3D=3D msi_idx) {
> > +                                     mbox->msi_index_to_channel[msi_id=
x] =3D mchan;
> > +                                     break;
> > +                             }
> > +                     }
> > +             }
> > +
> > +             rc =3D platform_device_msi_init_and_alloc_irqs(dev, mbox-=
>msi_count,
> > +                                                          mpxy_mbox_ms=
i_write);
> > +             if (rc) {
> > +                     return dev_err_probe(dev, rc, "Failed to allocate=
 %d MSIs\n",
> > +                                          mbox->msi_count);
> > +             }
> > +
> > +             for (i =3D 0; i < mbox->channel_count; i++) {
> > +                     mchan =3D &mbox->channels[i];
> > +                     if (mchan->msi_index =3D=3D U32_MAX)
> > +                             continue;
> > +                     mchan->msi_irq =3D msi_get_virq(dev, mchan->msi_i=
ndex);
> > +             }
> > +     }
> > +
> > +     /* Register mailbox controller */
> > +     rc =3D devm_mbox_controller_register(dev, &mbox->controller);
> > +     if (rc) {
> > +             dev_err_probe(dev, rc, "Registering SBI MPXY mailbox fail=
ed\n");
> > +             if (mbox->msi_count)
> > +                     platform_device_msi_free_irqs_all(dev);
> > +             return rc;
> > +     }
> > +
> > +     dev_info(dev, "mailbox registered with %d channels\n",
> > +              mbox->channel_count);
> > +     return 0;
> > +}
>
> ...
>
> > +     if (mbox->msi_count)
>
> Is this check really needed?

MSIs are optional for the SBI MPXY mailbox so we should only use
platform_device_msi_xyz() APIs only when MSIs are available.

>
> > +             platform_device_msi_free_irqs_all(mbox->dev);
> > +}
>
> ...
>
> > +static const struct of_device_id mpxy_mbox_of_match[] =3D {
> > +     {.compatible =3D "riscv,sbi-mpxy-mbox", },
> > +     {},
>
> No comma for the terminator entry.
> You should apply the reviewers' comments on all of your code, not just wh=
ere it
> was commented.

Okay, I will update.

Regards,
Anup
