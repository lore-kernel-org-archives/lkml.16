Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449A413BC0C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 18:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743791881; cv=none; b=TaG8sUGM2vsn71w6TGnrtoIlYLv6vg7UccOwx91RGtj+nBxMcXcBqDsIu09q9CKVYO6i3bCye7otuW3c7CUCZ+4VseQqIxZUsaNRtQca5kNfhPRiWdWasxQfkjC89b0Ik8fFpoeL62zMy6OOtcVGj/qak7PwwAdM3s/T743lNNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743791881; c=relaxed/simple;
	bh=SbEtg3AyFxTr/ZdtpsyqmMFloFhhusssy3YW2Vk6v2g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AAexDHUYx/d0NTc/WKfVV733EkhZfRucZlyUMeqCFBofwG6I6YDrSPUpb8OIh7GT9Rjv0oXAY3+wlBy3+k5CL60KaLgjNTfst/Ic4y3MgRs1oajsae8jvAaMQI6kWz5w0d+Ll9V94cDvxrx8EFPY/9ruLHl6cuwSnZvhsS3pOFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YRKYdpbE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YRKYdpbE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743791878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FH9uqPPYrtgbqQKtkDvqkLUyY8YkbRel0P0Eu4ZBawA=;
	b=YRKYdpbE8Hf8quUdM8lSDOnAwk3znasQJUWKyyJxrWp+8QwIyFgRN4Fw77J3Xe/H/zV2GV
	sAPlxhi9tMmuAXEDtei+YL742s83r7EfX1FInU3DRFZg08bo3Tofwr6R41oOpx+hKltcCl
	lwUyTgn4oNUsjlH6JboQUzfIujF4O34=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-145-9DF-pSJ_OAWR50YfkOl13g-1; Fri, 04 Apr 2025 14:37:56 -0400
X-MC-Unique: 9DF-pSJ_OAWR50YfkOl13g-1
X-Mimecast-MFC-AGG-ID: 9DF-pSJ_OAWR50YfkOl13g_1743791876
Received: by mail-yb1-f198.google.com with SMTP id 3f1490d57ef6-e6dfe7c8d4cso3316224276.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 11:37:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743791876; x=1744396676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FH9uqPPYrtgbqQKtkDvqkLUyY8YkbRel0P0Eu4ZBawA=;
        b=rT1qxHSZ9AKwxc1WX0h1gz6nZEXIKEoNcTx+aVuCiHLqz2Q+Pzmk+LEeSA/aqHZHHf
         QwcXb4BNmXqeWAwCYNUCftnleocKuhGdqtsudb4oGP3N5Sh7imw1wydQuKBNEIq5kjF4
         rAGYPOgdjTvmq1yALXxikhPIpgpV+e3i8xZ5u27ohimAlvvlQ8udGyMAt6Xj4iqSo5td
         Rt3oCuIBcaCQWoIkrRpXmb67z+esdtMdpYfYIBqlvdrZrYN+XooGt7+d4Rc5CT6NGbgt
         SacH7gKqJyMWXu6gff/dUcsDp9lyGdAHRio2sJ9p5vlVChNXiQMd1y0g4YlhgobqxcQf
         X1Dg==
X-Forwarded-Encrypted: i=1; AJvYcCUMC0JMtLDsfI8d7FxmW6saJIJsgWhLKLyx30i2ncAzmDKTy+TtudhorF0PJtqXB5Nl6opRVOsWdOYslHY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpJ03GGxiDpo6WU8VcGrD3TESE/LpJTS4HMQCPOitx+HJ6mGQp
	JMhqtP8anykCk5FGI1adc7bZCEaAxxhYtEGpP2I3Ht2pxr090QcS6ypqOBCTNb1btVJ/LDBXIN9
	ebAupciQZIiQv4h9WXeLTLPuQ+H51noUXhQqnjRDDglHh1Ce0lvdYA/THDIfg4nZOve/nJ3oNWk
	jnR/NLNtiuBfMpHq/YMainPw50zw+Gvdzecq12
X-Gm-Gg: ASbGncsfpCbgoigtuPxkLR4vdqd/DGA3R438zLiJjlQsZBsurO0I4p9s0/saPWkIwdM
	R6QYAqTFnVLQzfJ/N9jnGO/zOau05d/TYRUOecuOgyJuYwCJJkRTP+Cn67NDl+cNZixkW
X-Received: by 2002:a05:6902:158b:b0:e39:8e5f:adab with SMTP id 3f1490d57ef6-e6e1c44374amr7243205276.39.1743791876114;
        Fri, 04 Apr 2025 11:37:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEevyqGuidPZqVNBDj+KFxHl9JMJVo1UAIgY+YpK39FKnWBtQbNPTK6tAPKgm8JU8MU/JDBrWFIK50jN7+/iUU=
X-Received: by 2002:a05:6902:158b:b0:e39:8e5f:adab with SMTP id
 3f1490d57ef6-e6e1c44374amr7243157276.39.1743791875773; Fri, 04 Apr 2025
 11:37:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403100943.120738-1-sgarzare@redhat.com> <20250403100943.120738-4-sgarzare@redhat.com>
 <CAAH4kHYcRm1TpcgbtryJAtc6sjeh3hXzW7ApXY4WhcfZ3HEpVw@mail.gmail.com>
In-Reply-To: <CAAH4kHYcRm1TpcgbtryJAtc6sjeh3hXzW7ApXY4WhcfZ3HEpVw@mail.gmail.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Fri, 4 Apr 2025 20:37:44 +0200
X-Gm-Features: ATxdqUHKn197Z_4aQy4LW5pv_IIGkWQEqk42058WikkJ9-SNy1cP1FmNt99U1KU
Message-ID: <CAGxU2F4Zf7Khfqy5UjjPJ096kHHPjhFMN+oxvRTfG1knKca9gA@mail.gmail.com>
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

On Fri, 4 Apr 2025 at 19:32, Dionna Amalie Glaze <dionnaglaze@google.com> w=
rote:
>
> On Thu, Apr 3, 2025 at 3:10=E2=80=AFAM Stefano Garzarella <sgarzare@redha=
t.com> wrote:
> >
> > From: Stefano Garzarella <sgarzare@redhat.com>
> >
> > Add driver for the vTPM defined by the AMD SVSM spec [1].
> >
> > The specification defines a protocol that a SEV-SNP guest OS can use to
> > discover and talk to a vTPM emulated by the Secure VM Service Module (S=
VSM)
> > in the guest context, but at a more privileged level (VMPL0).
> >
> > The new tpm-svsm platform driver uses two functions exposed by x86/sev
> > to verify that the device is actually emulated by the platform and to
> > send commands and receive responses.
> >
> > The device cannot be hot-plugged/unplugged as it is emulated by the
> > platform, so we can use module_platform_driver_probe(). The probe
> > function will only check whether in the current runtime configuration,
> > SVSM is present and provides a vTPM.
> >
> > This device does not support interrupts and sends responses to commands
> > synchronously. In order to have .recv() called just after .send() in
> > tpm_try_transmit(), the .status() callback returns 0, and both
> > .req_complete_mask and .req_complete_val are set to 0.
> >
> > [1] "Secure VM Service Module for SEV-SNP Guests"
> >     Publication # 58019 Revision: 1.00
> >
> > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > ---
> > v6:
> > - removed the `locality` field (set to 0) and the FIXME comment [Jarkko=
]
> > v5:
> > - removed cancel/status/req_* ops after rebase on master that cotains
> >   commit 980a573621ea ("tpm: Make chip->{status,cancel,req_canceled} op=
t")
> > v4:
> > - moved "asm" includes after the "linux" includes [Tom]
> > - allocated buffer separately [Tom/Jarkko/Jason]
> > v3:
> > - removed send_recv() ops and followed the ftpm driver implementing .st=
atus,
> >   .req_complete_mask, .req_complete_val, etc. [Jarkko]
> > - removed link to the spec because those URLs are unstable [Borislav]
> > ---
> >  drivers/char/tpm/tpm_svsm.c | 128 ++++++++++++++++++++++++++++++++++++
> >  drivers/char/tpm/Kconfig    |  10 +++
> >  drivers/char/tpm/Makefile   |   1 +
> >  3 files changed, 139 insertions(+)
> >  create mode 100644 drivers/char/tpm/tpm_svsm.c
> >
> > diff --git a/drivers/char/tpm/tpm_svsm.c b/drivers/char/tpm/tpm_svsm.c
> > new file mode 100644
> > index 000000000000..b9242c9eab87
> > --- /dev/null
> > +++ b/drivers/char/tpm/tpm_svsm.c
> > @@ -0,0 +1,128 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (C) 2025 Red Hat, Inc. All Rights Reserved.
> > + *
> > + * Driver for the vTPM defined by the AMD SVSM spec [1].
> > + *
> > + * The specification defines a protocol that a SEV-SNP guest OS can us=
e to
> > + * discover and talk to a vTPM emulated by the Secure VM Service Modul=
e (SVSM)
> > + * in the guest context, but at a more privileged level (usually VMPL0=
).
> > + *
> > + * [1] "Secure VM Service Module for SEV-SNP Guests"
> > + *     Publication # 58019 Revision: 1.00
> > + */
> > +
> > +#include <linux/module.h>
> > +#include <linux/kernel.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/tpm_svsm.h>
> > +
> > +#include <asm/sev.h>
> > +
> > +#include "tpm.h"
> > +
> > +struct tpm_svsm_priv {
> > +       void *buffer;
> > +};
> > +
> > +static int tpm_svsm_send(struct tpm_chip *chip, u8 *buf, size_t len)
> > +{
> > +       struct tpm_svsm_priv *priv =3D dev_get_drvdata(&chip->dev);
> > +       int ret;
> > +
> > +       ret =3D svsm_vtpm_cmd_request_fill(priv->buffer, 0, buf, len);
> > +       if (ret)
> > +               return ret;
> > +
> > +       /*
> > +        * The SVSM call uses the same buffer for the command and for t=
he
> > +        * response, so after this call, the buffer will contain the re=
sponse
> > +        * that can be used by .recv() op.
> > +        */
> > +       return snp_svsm_vtpm_send_command(priv->buffer);
> > +}
> > +
> > +static int tpm_svsm_recv(struct tpm_chip *chip, u8 *buf, size_t len)
> > +{
> > +       struct tpm_svsm_priv *priv =3D dev_get_drvdata(&chip->dev);
> > +
> > +       /*
> > +        * The internal buffer contains the response after we send the =
command
> > +        * to SVSM.
> > +        */
> > +       return svsm_vtpm_cmd_response_parse(priv->buffer, buf, len);
> > +}
> > +
> > +static struct tpm_class_ops tpm_chip_ops =3D {
> > +       .flags =3D TPM_OPS_AUTO_STARTUP,
> > +       .recv =3D tpm_svsm_recv,
> > +       .send =3D tpm_svsm_send,
> > +};
> > +
> > +static int __init tpm_svsm_probe(struct platform_device *pdev)
> > +{
> > +       struct device *dev =3D &pdev->dev;
> > +       struct tpm_svsm_priv *priv;
> > +       struct tpm_chip *chip;
> > +       int err;
> > +
> > +       if (!snp_svsm_vtpm_probe())
> > +               return -ENODEV;
> > +
> > +       priv =3D devm_kmalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +       if (!priv)
> > +               return -ENOMEM;
> > +
> > +       /*
> > +        * The maximum buffer supported is one page (see SVSM_VTPM_MAX_=
BUFFER
> > +        * in tpm_svsm.h).
> > +        */
> > +       priv->buffer =3D (void *)devm_get_free_pages(dev, GFP_KERNEL, 0=
);
> > +       if (!priv->buffer)
> > +               return -ENOMEM;
> > +
> > +       chip =3D tpmm_chip_alloc(dev, &tpm_chip_ops);
> > +       if (IS_ERR(chip))
> > +               return PTR_ERR(chip);
> > +
> > +       dev_set_drvdata(&chip->dev, priv);
> > +
> > +       err =3D tpm2_probe(chip);
>
> Our testing is showing that tpm2_probe is hitting a null pointer deref
> in tpm_transmit.

Next time, please share a backtrace.

BTW I suspect you're not using Linus' tree, so be sure to backport
also commit 980a573621ea ("tpm: Make
chip->{status,cancel,req_canceled} opt").

Without that, you will have a null ptr dereference since .status() is
NULL from v5 of this series (as specified in the changelog).

Stefano

