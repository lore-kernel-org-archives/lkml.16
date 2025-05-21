Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E78263F28
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 11:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747827466; cv=none; b=cEmriOCzPATOpxAfBhGktQm+F+O0kzU/zyP57g654gvbQcfg+g6LyFkHjLfst0kwf8Ic1wh/TObRN2xQYX0mrJjDW2d67Dq4bAIAhxBQD8RYph48TlRIuY8xBjJuTnwo2tdH6ELuLyTnsaoypdnFWsGJj045IB1Zd1tqNNLfmn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747827466; c=relaxed/simple;
	bh=XcaL+5Z7bgSBdkiuHqFGq8pdqjCHNTu9fqjja6BLB7o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LBvbrHopYgH4Gg0VlGVALQV21Ttdt85k+i7lYPWwQP6NmFV6IwEvFHnPSFNMqvqK7aOBcHvXl2AfxpHwBszoQmoS3I/JIYMc8IPFpcofXVkKnidQPN0te1sIGKyb9euhWzqtbsT9muoy+f6a6NQNak/g7pIbhcc0qaJ6qQG2JnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=WiPezokK; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="WiPezokK"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30effbfaf4aso73102511fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 04:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747827461; x=1748432261; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VCrdqzJOZ+r5b5uVV31OhUBXHQ/N/WAYYeoHpygOTPU=;
        b=WiPezokKElfI0IvpG3yZNQIfJNwdrp9dbdNAJYI9d8Gvs7Spg/6kce35FVrI9xY7uY
         a1mAE9UA6VR7Z0Rb8RsEdmtki1bKkz73qAMmOAbfjhPiCljgp0YlcaBfYLIN8k8velpF
         YYeFJFr5ARylu3RX7VHwDy7MgpsM7Bezx/2PKAL1Rq8CDEaIZ5AkMAVmotPvy0moNRb8
         TeiLwnqgikI7TELejoUvzAAfRUgNdRLWDMtxmBrApY7tBgBlBzXjMushJ6iwtb3lJboA
         WeUKqhVIVV08IZvSqPPZ1I8M1BJc5gb5sb2EpYmIbFIuU6GMeyJ+lqMjvLiCi/eQl5cr
         hg4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747827461; x=1748432261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VCrdqzJOZ+r5b5uVV31OhUBXHQ/N/WAYYeoHpygOTPU=;
        b=jR1wHxH+wny8vJGWAz2s3nyKQTay3godB8zDQfE2HA90vn8MdDa8F1rAHYPyvMvSI0
         0QxP58rcNPGeTsLy0d/o37eYq4JLyT2Ys3AllZKvU+XMI8ylUDtEgriw1kq53pX/yEQD
         zYKcehP+thIWBGPBd3wOkubMl8hcztYbjisiFf0Fpr3FpfT9ZCr6vIuA8oAjpsDmdDbh
         yT8J0oh0NH0/3dlP2iDYOGpxXxPMtOUW9zBGwxd85DASPG8I9QG1o5D1v2Eenajt7tdU
         e0ebe9iFqDcFeyzJdEIGjRVb7xDq0ixQOT7u3kFmptlvFvjgvM+H12Dy1RJHNwBpk7+y
         +zRQ==
X-Forwarded-Encrypted: i=1; AJvYcCURFa9oQww7vqydMsdl6uIEhhEz+CGYjXhSmf88W8l48xBzPEsYYMyvnptvdKWOwkzANinlgrP9tmhUWN0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzocPg+wRA/3GigPcwNROgyQ0l/wk4ryEvVImUCEMsFba6RKi/8
	oTawGcqZrpiIiYpE/lKwFq7tGTCnNZWt1e3yhZx8nZkuipaRkfEliFWcgz+03Is0RUnsrJwpuTE
	iGqFz9dHs4RUx1/kf2FCsppFvJSVce0E08veuw0Ep4Q==
X-Gm-Gg: ASbGncuFe/TujYsOpBBCm9vljXgXdCgp0dZvBcyM3BP5S84VG9nYG2whB+zQWmKfdm2
	qJrvx0k17ssRy4xRKzyeSw2PYaDxJqE4zVeJIHWeGwj/L+d9FkIqdakvxbZTTYyLJkmVpba/spg
	xTt/c/7RNmUJYPZQH/SX1oNak1T0Vk9wO3YQ==
X-Google-Smtp-Source: AGHT+IFCo/ALKgv/Z21C+aw3mBdutX5RxjX/Wo2w4n4aM5gHN5BBDyHXag80H/nX8q25xzSbb6mE0D2HY4rNGDEyJkM=
X-Received: by 2002:a05:651c:b25:b0:328:604:9da8 with SMTP id
 38308e7fff4ca-328096986cdmr65342161fa.6.1747827460855; Wed, 21 May 2025
 04:37:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250511133939.801777-1-apatel@ventanamicro.com>
 <20250511133939.801777-14-apatel@ventanamicro.com> <87zffhk66f.ffs@tglx>
In-Reply-To: <87zffhk66f.ffs@tglx>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 21 May 2025 17:07:28 +0530
X-Gm-Features: AX0GCFuAf4tllvQPgn6FepAG3j7A7eRcGCaf4Wy67Bn_I5YzI5K6i_uIISbee40
Message-ID: <CAK9=C2XPsYMpNmd+0XfDduVY5r5qregABk=CggOCXac1ouoMnw@mail.gmail.com>
Subject: Re: [PATCH v3 13/23] irqchip: Add driver for the RPMI system MSI
 service group
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
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

On Tue, May 13, 2025 at 12:28=E2=80=AFAM Thomas Gleixner <tglx@linutronix.d=
e> wrote:
>
> On Sun, May 11 2025 at 19:09, Anup Patel wrote:
> > +static int rpmi_sysmsi_probe(struct platform_device *pdev)
> > +{
> > +     struct device *dev =3D &pdev->dev;
> > +     struct rpmi_sysmsi_priv *priv;
> > +     int rc;
> > +
> > +     priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +     if (!priv)
> > +             return -ENOMEM;
> > +     priv->dev =3D dev;
> > +     platform_set_drvdata(pdev, priv);
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
> > +             return dev_err_probe(dev, -ENODEV, "No system MSIs found\=
n");
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
> > +             if (is_of_node(dev_fwnode(dev)))
> > +                     of_msi_configure(dev, to_of_node(dev_fwnode(dev))=
);
> > +
> > +             if (!dev_get_msi_domain(dev))
> > +                     return -EPROBE_DEFER;
>
> This leaks the channel.

Ahh yes, I will update.

>
> > +     }
> > +
> > +     if (!msi_create_device_irq_domain(dev, MSI_DEFAULT_DOMAIN,
> > +                                       &rpmi_sysmsi_template,
> > +                                       priv->nr_irqs, priv, priv))
> > +             return dev_err_probe(dev, -ENOMEM, "failed to create MSI =
irq domain\n");
>
> Ditto.
>
> Thanks,
>
>         tglx

Thanks,
Anup
