Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1842080E8
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 17:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743787930; cv=none; b=og5iYIJB6zavz/9qn+3uavHYWvtr7gOQkRFsRzPY/ZoGVB6I+bGb5SJE1kSEeRdGs+ludwcUH05ZPaU5eRrXKNp5z3BlWhE9zNyXDBYmtBXc8fGb7gohGuEAZ+ac+M1b4/MNEdj8Posw5KzvfnxDc114s9cbAwMjddSYqbj5sAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743787930; c=relaxed/simple;
	bh=Y3b2Cjxv4tYL0u0PPGJYMVEnxE9QkPDjbFvD2vkuSYo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MoalHPb6588wD+MMXEhvCEqmaEjrVrDGaxQmuRkt10AMZBmBiOnJo9AsVLe5SOYwwDxm3MrBZc4gOslTAgTpmzBfPhz0j+XD/kSid9SqDZ4Oblv2IBW0ONNEUORxE5BdJ8qkyptx9FMp1zzU3FvXUOPbSMatprgSgu/TAf4lm5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sCv7kNwV; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sCv7kNwV"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aaecf50578eso362833966b.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 10:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743787927; x=1744392727; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q89yAvYXvndl1irm5LZz/0EHmiyywExfQhlkm5JASPw=;
        b=sCv7kNwVxpzCfCM99JKA0cu97CRi5PvqmnjDhOdcJJqdP4nznjXu4hmyywpyYpFyMq
         d7MnhjzCSY/dbai+hNCtGqPWK8NY1tlJjCK95xuwb2V0mq2ZiqVNVkSqGRPraZ6br0qo
         2Vf09kumIUqWQ+P9qUn3ZXYanZk8IiUt8Nd2EdaOmEemKyoKqalqyE0SX3affKOw+W+U
         1zwC4jFGPVgQKWam4rjDjS6TZ90HveWII1JOrPxN+ABEPtSsS9G939d3m6xW8dNQ8/1+
         KekJAM6GBCP4RxZsZMU5pEYSCVQHGDHvAOw2sVpKiBMSYjJHjcXS1+XcpyXi056Uj1tV
         9E4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743787927; x=1744392727;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q89yAvYXvndl1irm5LZz/0EHmiyywExfQhlkm5JASPw=;
        b=d6dTf/J+P8unak0dThcDf5d1VfLPv5B4UXiPFUpWlyAexvNrnX/KOmwCt6xHWcYcfh
         Q9h20GOZlDjUf676WBKOTvRXsoI7dq43yALpFlZLWvTRAFcS3ahfvYMvk1ibt3ZC6Uoy
         SY8D8DNdJmVQYEDqvrTPASnHc/m7ej+2Ziqw0vu270kGZvzseKDRXbt/h/15Q5BcJAmL
         ggR13mOwBjWfdV/WNHL55LQUdXq0nGINhkMFr8yRK4NGONBtsVX9O9IxdId8MjQXNbIJ
         DaMIB2Ihk41F00ySnkGQwC8ddSKPURVhdrBsKmqkiCqMw6En4+OblKkQTErXxfVIMoO5
         naVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIeREZF4XhimVXb20NRM1Q1lva+rCmRqABHAtkryBZidI0tp3WUXWpI0E9k6/E2HdNryJ82Iu2JHgzMJI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/Y04bLbihYZFZgYTPT2ToNYW2d55zR0bjS94xdkPMIMZqeKwC
	WoqYDh1TLasycJWgKAMnV80fjelMmgMADRrNFBr5Ne9yzll3ydIa4qTzic74iWGHk2N3GgYhm6Y
	WirSSTIUGkKCREz4IPT9PeOl93a6QFhAiiSa3
X-Gm-Gg: ASbGncvd6FMwduqdpAIBwN+xmY9qi1JOitj8Nd3ZMM6FqwxnFtutJagW99OLDe1ihD/
	rCvAsJX3E3MiKRsF36luTUuEDZP9CV+YjEpt3RJzCIwuM/Si0NEX8x/iIZTzWbrCTx9pY/RI/5c
	RDRTtMQYVt12dvSq36UdWTAD4XkQ==
X-Google-Smtp-Source: AGHT+IE88NgLTRWE+IuShfOX0Jx6AkxSFsKpDC1V09N1wPs/KLPyeH3dIToVTOqntAd8wIUj/YscWKjvbWX1pmw+qno=
X-Received: by 2002:a17:906:dc94:b0:ac2:b8ce:90d5 with SMTP id
 a640c23a62f3a-ac7e761e88fmr33071166b.44.1743787918560; Fri, 04 Apr 2025
 10:31:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403100943.120738-1-sgarzare@redhat.com> <20250403100943.120738-4-sgarzare@redhat.com>
In-Reply-To: <20250403100943.120738-4-sgarzare@redhat.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Fri, 4 Apr 2025 10:31:46 -0700
X-Gm-Features: ATxdqUHPtDIrRTyTH9FKonOAsFXCoiLuJzoCznyGYLEznBNeztNYqKCarK8ZvPQ
Message-ID: <CAAH4kHYcRm1TpcgbtryJAtc6sjeh3hXzW7ApXY4WhcfZ3HEpVw@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] tpm: add SNP SVSM vTPM driver
To: Stefano Garzarella <sgarzare@redhat.com>
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

On Thu, Apr 3, 2025 at 3:10=E2=80=AFAM Stefano Garzarella <sgarzare@redhat.=
com> wrote:
>
> From: Stefano Garzarella <sgarzare@redhat.com>
>
> Add driver for the vTPM defined by the AMD SVSM spec [1].
>
> The specification defines a protocol that a SEV-SNP guest OS can use to
> discover and talk to a vTPM emulated by the Secure VM Service Module (SVS=
M)
> in the guest context, but at a more privileged level (VMPL0).
>
> The new tpm-svsm platform driver uses two functions exposed by x86/sev
> to verify that the device is actually emulated by the platform and to
> send commands and receive responses.
>
> The device cannot be hot-plugged/unplugged as it is emulated by the
> platform, so we can use module_platform_driver_probe(). The probe
> function will only check whether in the current runtime configuration,
> SVSM is present and provides a vTPM.
>
> This device does not support interrupts and sends responses to commands
> synchronously. In order to have .recv() called just after .send() in
> tpm_try_transmit(), the .status() callback returns 0, and both
> .req_complete_mask and .req_complete_val are set to 0.
>
> [1] "Secure VM Service Module for SEV-SNP Guests"
>     Publication # 58019 Revision: 1.00
>
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
> v6:
> - removed the `locality` field (set to 0) and the FIXME comment [Jarkko]
> v5:
> - removed cancel/status/req_* ops after rebase on master that cotains
>   commit 980a573621ea ("tpm: Make chip->{status,cancel,req_canceled} opt"=
)
> v4:
> - moved "asm" includes after the "linux" includes [Tom]
> - allocated buffer separately [Tom/Jarkko/Jason]
> v3:
> - removed send_recv() ops and followed the ftpm driver implementing .stat=
us,
>   .req_complete_mask, .req_complete_val, etc. [Jarkko]
> - removed link to the spec because those URLs are unstable [Borislav]
> ---
>  drivers/char/tpm/tpm_svsm.c | 128 ++++++++++++++++++++++++++++++++++++
>  drivers/char/tpm/Kconfig    |  10 +++
>  drivers/char/tpm/Makefile   |   1 +
>  3 files changed, 139 insertions(+)
>  create mode 100644 drivers/char/tpm/tpm_svsm.c
>
> diff --git a/drivers/char/tpm/tpm_svsm.c b/drivers/char/tpm/tpm_svsm.c
> new file mode 100644
> index 000000000000..b9242c9eab87
> --- /dev/null
> +++ b/drivers/char/tpm/tpm_svsm.c
> @@ -0,0 +1,128 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2025 Red Hat, Inc. All Rights Reserved.
> + *
> + * Driver for the vTPM defined by the AMD SVSM spec [1].
> + *
> + * The specification defines a protocol that a SEV-SNP guest OS can use =
to
> + * discover and talk to a vTPM emulated by the Secure VM Service Module =
(SVSM)
> + * in the guest context, but at a more privileged level (usually VMPL0).
> + *
> + * [1] "Secure VM Service Module for SEV-SNP Guests"
> + *     Publication # 58019 Revision: 1.00
> + */
> +
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/platform_device.h>
> +#include <linux/tpm_svsm.h>
> +
> +#include <asm/sev.h>
> +
> +#include "tpm.h"
> +
> +struct tpm_svsm_priv {
> +       void *buffer;
> +};
> +
> +static int tpm_svsm_send(struct tpm_chip *chip, u8 *buf, size_t len)
> +{
> +       struct tpm_svsm_priv *priv =3D dev_get_drvdata(&chip->dev);
> +       int ret;
> +
> +       ret =3D svsm_vtpm_cmd_request_fill(priv->buffer, 0, buf, len);
> +       if (ret)
> +               return ret;
> +
> +       /*
> +        * The SVSM call uses the same buffer for the command and for the
> +        * response, so after this call, the buffer will contain the resp=
onse
> +        * that can be used by .recv() op.
> +        */
> +       return snp_svsm_vtpm_send_command(priv->buffer);
> +}
> +
> +static int tpm_svsm_recv(struct tpm_chip *chip, u8 *buf, size_t len)
> +{
> +       struct tpm_svsm_priv *priv =3D dev_get_drvdata(&chip->dev);
> +
> +       /*
> +        * The internal buffer contains the response after we send the co=
mmand
> +        * to SVSM.
> +        */
> +       return svsm_vtpm_cmd_response_parse(priv->buffer, buf, len);
> +}
> +
> +static struct tpm_class_ops tpm_chip_ops =3D {
> +       .flags =3D TPM_OPS_AUTO_STARTUP,
> +       .recv =3D tpm_svsm_recv,
> +       .send =3D tpm_svsm_send,
> +};
> +
> +static int __init tpm_svsm_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct tpm_svsm_priv *priv;
> +       struct tpm_chip *chip;
> +       int err;
> +
> +       if (!snp_svsm_vtpm_probe())
> +               return -ENODEV;
> +
> +       priv =3D devm_kmalloc(dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       /*
> +        * The maximum buffer supported is one page (see SVSM_VTPM_MAX_BU=
FFER
> +        * in tpm_svsm.h).
> +        */
> +       priv->buffer =3D (void *)devm_get_free_pages(dev, GFP_KERNEL, 0);
> +       if (!priv->buffer)
> +               return -ENOMEM;
> +
> +       chip =3D tpmm_chip_alloc(dev, &tpm_chip_ops);
> +       if (IS_ERR(chip))
> +               return PTR_ERR(chip);
> +
> +       dev_set_drvdata(&chip->dev, priv);
> +
> +       err =3D tpm2_probe(chip);

Our testing is showing that tpm2_probe is hitting a null pointer deref
in tpm_transmit.


> +       if (err)
> +               return err;
> +
> +       err =3D tpm_chip_register(chip);
> +       if (err)
> +               return err;
> +
> +       dev_info(dev, "SNP SVSM vTPM %s device\n",
> +                (chip->flags & TPM_CHIP_FLAG_TPM2) ? "2.0" : "1.2");
> +
> +       return 0;
> +}
> +
> +static void __exit tpm_svsm_remove(struct platform_device *pdev)
> +{
> +       struct tpm_chip *chip =3D platform_get_drvdata(pdev);
> +
> +       tpm_chip_unregister(chip);
> +}
> +
> +/*
> + * tpm_svsm_remove() lives in .exit.text. For drivers registered via
> + * module_platform_driver_probe() this is ok because they cannot get unb=
ound
> + * at runtime. So mark the driver struct with __refdata to prevent modpo=
st
> + * triggering a section mismatch warning.
> + */
> +static struct platform_driver tpm_svsm_driver __refdata =3D {
> +       .remove =3D __exit_p(tpm_svsm_remove),
> +       .driver =3D {
> +               .name =3D "tpm-svsm",
> +       },
> +};
> +
> +module_platform_driver_probe(tpm_svsm_driver, tpm_svsm_probe);
> +
> +MODULE_DESCRIPTION("SNP SVSM vTPM Driver");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:tpm-svsm");
> diff --git a/drivers/char/tpm/Kconfig b/drivers/char/tpm/Kconfig
> index fe4f3a609934..dddd702b2454 100644
> --- a/drivers/char/tpm/Kconfig
> +++ b/drivers/char/tpm/Kconfig
> @@ -234,5 +234,15 @@ config TCG_FTPM_TEE
>         help
>           This driver proxies for firmware TPM running in TEE.
>
> +config TCG_SVSM
> +       tristate "SNP SVSM vTPM interface"
> +       depends on AMD_MEM_ENCRYPT
> +       help
> +         This is a driver for the AMD SVSM vTPM protocol that a SEV-SNP =
guest
> +         OS can use to discover and talk to a vTPM emulated by the Secur=
e VM
> +         Service Module (SVSM) in the guest context, but at a more privi=
leged
> +         level (usually VMPL0).  To compile this driver as a module, cho=
ose M
> +         here; the module will be called tpm_svsm.
> +
>  source "drivers/char/tpm/st33zp24/Kconfig"
>  endif # TCG_TPM
> diff --git a/drivers/char/tpm/Makefile b/drivers/char/tpm/Makefile
> index 2b004df8c04b..9de1b3ea34a9 100644
> --- a/drivers/char/tpm/Makefile
> +++ b/drivers/char/tpm/Makefile
> @@ -45,3 +45,4 @@ obj-$(CONFIG_TCG_CRB) +=3D tpm_crb.o
>  obj-$(CONFIG_TCG_ARM_CRB_FFA) +=3D tpm_crb_ffa.o
>  obj-$(CONFIG_TCG_VTPM_PROXY) +=3D tpm_vtpm_proxy.o
>  obj-$(CONFIG_TCG_FTPM_TEE) +=3D tpm_ftpm_tee.o
> +obj-$(CONFIG_TCG_SVSM) +=3D tpm_svsm.o
> --
> 2.49.0
>


--
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
