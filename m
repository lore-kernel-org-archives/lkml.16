Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDC922DFA2
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 09:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744191945; cv=none; b=dVsRBIQmVvakI5YPwDhH2qwRQbpONGBu+x12HNmcsy4qGsqw/ZG05OtS7P4WNVHGP1eBb8QHEuLa1I8twUCUTfUGoSDVwJZFDgm62iph2qin0kWz18PDcNDPmcEImBZEp7l2idv5yO0vs6m8y+pMw91qzZPJ9/nE6pILzgnFtJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744191945; c=relaxed/simple;
	bh=XjjUhTS9VJr1Zufc1xdYWqFTAUH4jrHIaqx6RaRNeG4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bPsn+Tu1C/60JxFV64TMZR4N0liiQIitBtnzb0PFiqiy0I2XL276qHcrezCshcxCAZHy8VQowO1TN6q2I3m7WTWAckQE4Tl+oVdXBTtWRjceTGEmcLbtPLNT9+2QN1FNeD2/KjPEWOgh6LyL/j3f8wcgTyh9m0xkDRdl4Kma1nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Nc1/Pnru; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Nc1/Pnru"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744191942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TKVfH0bP0xouirfCCs2OtGdx4KFsMNg0TzzFUxvnY5M=;
	b=Nc1/Pnru0Q2vRkygUH0aBo2xE5dlwILU175urZQ4oECsC6hmrXmIUu9ij1UubV7kK9XH6z
	AfDuDhaualQCusAzLS90iZtCgJ/PDGbnQ1ondiR1AARH3TfLHFCuqOgKGGoEgY3wkpobcM
	QT4qeQz3YA0SQLaKvG2oJ8HlHKSVlzA=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-480-RCMLfWnKP0muQjHDnpHOIw-1; Wed, 09 Apr 2025 05:45:39 -0400
X-MC-Unique: RCMLfWnKP0muQjHDnpHOIw-1
X-Mimecast-MFC-AGG-ID: RCMLfWnKP0muQjHDnpHOIw_1744191938
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-6ef85037f3bso8782337b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 02:45:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744191938; x=1744796738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TKVfH0bP0xouirfCCs2OtGdx4KFsMNg0TzzFUxvnY5M=;
        b=Pkd0e+lBrE/ehjWKVBrYskfmaTrLa5t/2Il494Lh2qDv9QVsV47YaiEP5KE1uOz8aW
         r8IV8qoiK8bFAdzegRwNqy2at3t50alEuZQgi1oEfG5UNdSt17mSHYAr6ZcbgluW7oOK
         EPiG8Vex9k44ubDRL5fbG2DPpEgLEXTeEFAH0QW039WyR/r11fKwqmADu4QhR0blNkmh
         Iu5ePANCloCRjNxWlP3ZjTjgrKnht83onUCXjq8eOcAJpGaDiiavt4Mpr1GgAkc/vKzn
         3sc6yPJtdDbtcak3eTa4qi3xNd38g9YngZ8yGBxtvMEK7N4hi7cZ9aI0gKvNLP8sICOy
         HeoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrGCYJQ34tn3R17DdZPoHihBHzKpE3jnBkoHZBGZ8P2kCh2eBrsz/FQbcg+XPnyGouX1lJS7RI+zFVM5g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRKR6D0XWvhuBVxTGafAv76gHtLfc/bFsRTfwfVxw5SkI4fnvG
	np60yXktxCPF2zGd30GWUNts5U7vayoXdgOteZMxTYs3jtqxzw0C7RRdO8nKR1s18RMmR26DLlq
	J4dxM8k0pOeYjiuJF0mrA7qfwX+HxfNPzHh8MnRkVU8RERjGBA/QBio7/qVOJnphKD2aS5mum8I
	mBdd2dpQGeDSbkXamMWjjYcSGtrAePhRM3mu5U
X-Gm-Gg: ASbGncu5+bM5Tu/bM+xZyFji7LKDWZqzoMeiv+fCW4/5NCvHxCk2HXXc+tyx0UymurI
	OuCIEPGztWzqD76rQ6re9ZiDsyMPeWmrTE0r3gGbRz1Q84OsTFDwdWkov4YCHTDIupUc=
X-Received: by 2002:a05:6902:228e:b0:e6b:7e33:b637 with SMTP id 3f1490d57ef6-e702e26d5a7mr3856599276.14.1744191938554;
        Wed, 09 Apr 2025 02:45:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHisCB7623SUDNdsp8qFrjYJi4J8Do54OWEhkmaIUaKl/L0t4PRuH343+79GsCY6oG9Gt8oA6rIXzIcnfJq5EU=
X-Received: by 2002:a05:6902:228e:b0:e6b:7e33:b637 with SMTP id
 3f1490d57ef6-e702e26d5a7mr3856573276.14.1744191938238; Wed, 09 Apr 2025
 02:45:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403100943.120738-1-sgarzare@redhat.com> <20250403100943.120738-4-sgarzare@redhat.com>
 <CAAH4kHYcRm1TpcgbtryJAtc6sjeh3hXzW7ApXY4WhcfZ3HEpVw@mail.gmail.com>
 <CAGxU2F4Zf7Khfqy5UjjPJ096kHHPjhFMN+oxvRTfG1knKca9gA@mail.gmail.com> <CAAH4kHZhsUoxNdJ0F3GeRPhC_JpB4suUA1z44bQ=RpGoR2oHkA@mail.gmail.com>
In-Reply-To: <CAAH4kHZhsUoxNdJ0F3GeRPhC_JpB4suUA1z44bQ=RpGoR2oHkA@mail.gmail.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Wed, 9 Apr 2025 11:45:27 +0200
X-Gm-Features: ATxdqUEHc0oIxvcOqNXD1IH1Pn8Q_A7cyhZV-Uk3hwANcZdEi5U4ok4pB4uuUD0
Message-ID: <CAGxU2F7NDvHPhyHbN+dBjVta2NLstyoV2SQ6VkwDTf2FiKLasA@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] tpm: add SNP SVSM vTPM driver
To: Dionna Amalie Glaze <dionnaglaze@google.com>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>, "H. Peter Anvin" <hpa@zytor.com>, 
	linux-coco@lists.linux.dev, linux-integrity@vger.kernel.org, 
	Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@redhat.com>, x86@kernel.org, 
	Tom Lendacky <thomas.lendacky@amd.com>, Joerg Roedel <jroedel@suse.de>, 
	Claudio Carvalho <cclaudio@linux.ibm.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, linux-kernel@vger.kernel.org, 
	Dov Murik <dovmurik@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 4 Apr 2025 at 20:59, Dionna Amalie Glaze <dionnaglaze@google.com> w=
rote:
>
> On Fri, Apr 4, 2025 at 11:37=E2=80=AFAM Stefano Garzarella <sgarzare@redh=
at.com> wrote:
> >
> > On Fri, 4 Apr 2025 at 19:32, Dionna Amalie Glaze <dionnaglaze@google.co=
m> wrote:
> > >
> > > On Thu, Apr 3, 2025 at 3:10=E2=80=AFAM Stefano Garzarella <sgarzare@r=
edhat.com> wrote:
> > > >
> > > > From: Stefano Garzarella <sgarzare@redhat.com>
> > > >
> > > > Add driver for the vTPM defined by the AMD SVSM spec [1].
> > > >
> > > > The specification defines a protocol that a SEV-SNP guest OS can us=
e to
> > > > discover and talk to a vTPM emulated by the Secure VM Service Modul=
e (SVSM)
> > > > in the guest context, but at a more privileged level (VMPL0).
> > > >
> > > > The new tpm-svsm platform driver uses two functions exposed by x86/=
sev
> > > > to verify that the device is actually emulated by the platform and =
to
> > > > send commands and receive responses.
> > > >
> > > > The device cannot be hot-plugged/unplugged as it is emulated by the
> > > > platform, so we can use module_platform_driver_probe(). The probe
> > > > function will only check whether in the current runtime configurati=
on,
> > > > SVSM is present and provides a vTPM.
> > > >
> > > > This device does not support interrupts and sends responses to comm=
ands
> > > > synchronously. In order to have .recv() called just after .send() i=
n
> > > > tpm_try_transmit(), the .status() callback returns 0, and both
> > > > .req_complete_mask and .req_complete_val are set to 0.
> > > >
> > > > [1] "Secure VM Service Module for SEV-SNP Guests"
> > > >     Publication # 58019 Revision: 1.00
> > > >
> > > > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > > > ---
> > > > v6:
> > > > - removed the `locality` field (set to 0) and the FIXME comment [Ja=
rkko]
> > > > v5:
> > > > - removed cancel/status/req_* ops after rebase on master that cotai=
ns
> > > >   commit 980a573621ea ("tpm: Make chip->{status,cancel,req_canceled=
} opt")
> > > > v4:
> > > > - moved "asm" includes after the "linux" includes [Tom]
> > > > - allocated buffer separately [Tom/Jarkko/Jason]
> > > > v3:
> > > > - removed send_recv() ops and followed the ftpm driver implementing=
 .status,
> > > >   .req_complete_mask, .req_complete_val, etc. [Jarkko]
> > > > - removed link to the spec because those URLs are unstable [Borisla=
v]
> > > > ---
> > > >  drivers/char/tpm/tpm_svsm.c | 128 ++++++++++++++++++++++++++++++++=
++++
> > > >  drivers/char/tpm/Kconfig    |  10 +++
> > > >  drivers/char/tpm/Makefile   |   1 +
> > > >  3 files changed, 139 insertions(+)
> > > >  create mode 100644 drivers/char/tpm/tpm_svsm.c
> > > >
> > > > diff --git a/drivers/char/tpm/tpm_svsm.c b/drivers/char/tpm/tpm_svs=
m.c
> > > > new file mode 100644
> > > > index 000000000000..b9242c9eab87
> > > > --- /dev/null
> > > > +++ b/drivers/char/tpm/tpm_svsm.c
> > > > @@ -0,0 +1,128 @@
> > > > +// SPDX-License-Identifier: GPL-2.0-only
> > > > +/*
> > > > + * Copyright (C) 2025 Red Hat, Inc. All Rights Reserved.
> > > > + *
> > > > + * Driver for the vTPM defined by the AMD SVSM spec [1].
> > > > + *
> > > > + * The specification defines a protocol that a SEV-SNP guest OS ca=
n use to
> > > > + * discover and talk to a vTPM emulated by the Secure VM Service M=
odule (SVSM)
> > > > + * in the guest context, but at a more privileged level (usually V=
MPL0).
> > > > + *
> > > > + * [1] "Secure VM Service Module for SEV-SNP Guests"
> > > > + *     Publication # 58019 Revision: 1.00
> > > > + */
> > > > +
> > > > +#include <linux/module.h>
> > > > +#include <linux/kernel.h>
> > > > +#include <linux/platform_device.h>
> > > > +#include <linux/tpm_svsm.h>
> > > > +
> > > > +#include <asm/sev.h>
> > > > +
> > > > +#include "tpm.h"
> > > > +
> > > > +struct tpm_svsm_priv {
> > > > +       void *buffer;
> > > > +};
> > > > +
> > > > +static int tpm_svsm_send(struct tpm_chip *chip, u8 *buf, size_t le=
n)
> > > > +{
> > > > +       struct tpm_svsm_priv *priv =3D dev_get_drvdata(&chip->dev);
> > > > +       int ret;
> > > > +
> > > > +       ret =3D svsm_vtpm_cmd_request_fill(priv->buffer, 0, buf, le=
n);
> > > > +       if (ret)
> > > > +               return ret;
> > > > +
> > > > +       /*
> > > > +        * The SVSM call uses the same buffer for the command and f=
or the
> > > > +        * response, so after this call, the buffer will contain th=
e response
> > > > +        * that can be used by .recv() op.
> > > > +        */
> > > > +       return snp_svsm_vtpm_send_command(priv->buffer);
> > > > +}
> > > > +
> > > > +static int tpm_svsm_recv(struct tpm_chip *chip, u8 *buf, size_t le=
n)
> > > > +{
> > > > +       struct tpm_svsm_priv *priv =3D dev_get_drvdata(&chip->dev);
> > > > +
> > > > +       /*
> > > > +        * The internal buffer contains the response after we send =
the command
> > > > +        * to SVSM.
> > > > +        */
> > > > +       return svsm_vtpm_cmd_response_parse(priv->buffer, buf, len)=
;
> > > > +}
> > > > +
> > > > +static struct tpm_class_ops tpm_chip_ops =3D {
> > > > +       .flags =3D TPM_OPS_AUTO_STARTUP,
> > > > +       .recv =3D tpm_svsm_recv,
> > > > +       .send =3D tpm_svsm_send,
> > > > +};
> > > > +
> > > > +static int __init tpm_svsm_probe(struct platform_device *pdev)
> > > > +{
> > > > +       struct device *dev =3D &pdev->dev;
> > > > +       struct tpm_svsm_priv *priv;
> > > > +       struct tpm_chip *chip;
> > > > +       int err;
> > > > +
> > > > +       if (!snp_svsm_vtpm_probe())
> > > > +               return -ENODEV;
> > > > +
> > > > +       priv =3D devm_kmalloc(dev, sizeof(*priv), GFP_KERNEL);
> > > > +       if (!priv)
> > > > +               return -ENOMEM;
> > > > +
> > > > +       /*
> > > > +        * The maximum buffer supported is one page (see SVSM_VTPM_=
MAX_BUFFER
> > > > +        * in tpm_svsm.h).
> > > > +        */
> > > > +       priv->buffer =3D (void *)devm_get_free_pages(dev, GFP_KERNE=
L, 0);
> > > > +       if (!priv->buffer)
> > > > +               return -ENOMEM;
> > > > +
> > > > +       chip =3D tpmm_chip_alloc(dev, &tpm_chip_ops);
> > > > +       if (IS_ERR(chip))
> > > > +               return PTR_ERR(chip);
> > > > +
> > > > +       dev_set_drvdata(&chip->dev, priv);
> > > > +
> > > > +       err =3D tpm2_probe(chip);
> > >
> > > Our testing is showing that tpm2_probe is hitting a null pointer dere=
f
> > > in tpm_transmit.
> >
> > Next time, please share a backtrace.
>
> Right, my bad.
> >
> > BTW I suspect you're not using Linus' tree, so be sure to backport
> > also commit 980a573621ea ("tpm: Make
> > chip->{status,cancel,req_canceled} opt").
> >
> > Without that, you will have a null ptr dereference since .status() is
> > NULL from v5 of this series (as specified in the changelog).
>
> Thanks, I missed that detail. Will report back.

I'm preparing v7, is your issue solved or do we need to investigate
better before sending a v7?

Thanks,
Stefano

