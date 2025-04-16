Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B12C1C5486
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 15:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744816608; cv=none; b=G+wn/c6NHM2AxfetOVmbwse/Hi7hd6TCypJa2+U+2xDZQ0oPtkHuAuQpWFjBROz/WJSkotxzEP9WDtozWBLYP4661p8OpUJfR5si9BNGtcnSPnuGREMF3gzMMJTRmRFLv53V+GvVkZhf+iJIZh2HpERpyRXpIAbW/nbDNKcopxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744816608; c=relaxed/simple;
	bh=M1x4RC5EOfQHcSo8roVtiUUlf0cHzDGTolgxIV9gtKM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A/GOtWNg963fewTLsqFga+q98wpNC/FcJXleDQDGzCh1AqPYG6DTwnzW8xnBYizvvQU9HiVAmCdt9882nBLGSaTWZP0pZewMoyxFs0QSjBvqzrUWfqP5NxKUvxCY9ACzaK6Ge5SOqHzE/UhN7vAh8myvwMBdFj7oSl4wJGSaZ84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CgmzKSNt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CgmzKSNt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744816602;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UAiRJ+rVIwdO2WdbVlHtwPy5PkHyBBI5D1qW/1GoN3k=;
	b=CgmzKSNta2kSiPu1DS+sN5o3X8Jg+aNjBD0wmp0w/obDWSGcdmIB4ve08JN/1f4C2OlXZf
	t/zNC6poC8EBVtmVR7HD9XAyDuPxgazA4+WN7WvsT8OhU2oo/8PhaIxRIkzTPqq7aSXmy2
	U2GVqVoZoSYefdJq4Ab8mYeelKNL6Y8=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-246-Dn0Dvxc7Ol6MN0Zul7Evkw-1; Wed, 16 Apr 2025 11:16:40 -0400
X-MC-Unique: Dn0Dvxc7Ol6MN0Zul7Evkw-1
X-Mimecast-MFC-AGG-ID: Dn0Dvxc7Ol6MN0Zul7Evkw_1744816599
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-5496d38f725so3700155e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 08:16:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744816598; x=1745421398;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UAiRJ+rVIwdO2WdbVlHtwPy5PkHyBBI5D1qW/1GoN3k=;
        b=RjNvZEqA8LnhuQEdszulQiMVTfovdYZ6qMJbyA/9za/HSbXPT7keEhrM4ci/xeFmO5
         1afywTde1yPwQOSQWh37tpggUiXJNYpia7ZxH4FVkmDxMWsKlQU/Rat4EC8EBrIEDR9u
         yWtDtMSe9zyc3GB/TL1X9vVnesoTIsnfV38byPOJp4wMgA9Es/wCxzIyGIS4IH4ivNqs
         Wqi+xxHQbi1rSp2XF9Wk78SL0r1LF6PMBqcwVnV3FCUzM06Rs3XDvcF6Ptu2gXfQ9nRb
         fWP0h5ZTgVSyS4Dx8gGliYfVV4b9Zsc/uUN4s4jdTqmRxbnud4ULSSALHy5Ir4dw5wS7
         Q4Ww==
X-Forwarded-Encrypted: i=1; AJvYcCUCppPxRoaoxlNHlUX/V727w0NosBqWwiITjI56V5vTFN9Dg7H3aZLCpdMfbYGaQLc1gWu8ccMxVd3+tcI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwssuxIAC4LNwx7mVCVmhZpR5uYfW8DVrWSuo79HJbcx3sWoXwy
	aTePM2+tITviXBf5oVF9+MF/S7HNB0qqZPyqoPrZwY7Tc3S4so9I3Hy+bjibZDbXR7UahsVSh9d
	r9EViX1/11X9hEn2M85ADXRB25qGn9+HulVi5ZTMJ1a5kOEsqUCx7NbcGfaerXwmGKsFRzicUf1
	T6ZWoTV3oyahG8U/rVwAxkGaiNyh4FUttCe5zPHPb/lcQ/uqM=
X-Gm-Gg: ASbGnctA7YLFmMM9LTEEmbkesAOJb6pXeWI0s/J/GPdQXZU/r2r+bh6UnrsIN5u1h/N
	ZjoM7PEfc1tU5OchmEdBYu+mZs5bfLOtH0tkpCVV9HOrmC6WTCCZbHGL8x+WM/9wjwqqV2w==
X-Received: by 2002:a05:6512:2c03:b0:54d:6624:7b42 with SMTP id 2adb3069b0e04-54d66247e48mr576343e87.57.1744816598425;
        Wed, 16 Apr 2025 08:16:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3ayFwaEzggSbeRHl9gpANOVjLepAYl8lkVhaugJiLlYMw8LXYokNbv5SoL6Uo9DDIWbwEIuBJv6ZyCN3swbs=
X-Received: by 2002:a05:6512:2c03:b0:54d:6624:7b42 with SMTP id
 2adb3069b0e04-54d66247e48mr576331e87.57.1744816597889; Wed, 16 Apr 2025
 08:16:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414131053.18499-1-vdronov@redhat.com> <CALrw=nHS9UnMMwXfYo_6goDi==DD5feeemxqAXXAWvA0yOi_cw@mail.gmail.com>
In-Reply-To: <CALrw=nHS9UnMMwXfYo_6goDi==DD5feeemxqAXXAWvA0yOi_cw@mail.gmail.com>
From: Vladis Dronov <vdronov@redhat.com>
Date: Wed, 16 Apr 2025 17:16:26 +0200
X-Gm-Features: ATxdqUGA6_I76BbKTO7kxmlu0Z96pk8FPseQLZOKSHJWvthQOiM4lc5IlSEWACA
Message-ID: <CAMusb+SHmr49Kv+3NwsKKC_di=uOM6svisTEVm7LomGTBFr5OA@mail.gmail.com>
Subject: Re: [PATCH] crypto: ecdsa - explicitly zeroize pub_key
To: Ignat Korchagin <ignat@cloudflare.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, 
	Lukas Wunner <lukas@wunner.de>, Stefan Berger <stefanb@linux.ibm.com>, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 5:53=E2=80=AFPM Ignat Korchagin <ignat@cloudflare.c=
om> wrote:
>
> Hi,
>
> On Mon, Apr 14, 2025 at 3:11=E2=80=AFPM Vladis Dronov <vdronov@redhat.com=
> wrote:
> >
> > The FIPS standard, as a part of the Sensitive Security Parameter area,
> > requires the FIPS module to provide methods to zeroise all the unprotec=
ted
> > SSP (Security Sensitive Parameters), i.e. both the CSP (Critical Securi=
ty
> > Parameters), and the PSP (Public Security Parameters):
> >
> >     A module shall provide methods to zeroise all unprotected SSPs and =
key
> >     components within the module.
> >
> > This requirement is mentioned in the section AS09.28 "Sensitive securit=
y
> > parameter zeroisation =E2=80=93 Levels 1, 2, 3, and 4" of FIPS 140-3 / =
ISO 19790.
> > This is required for the FIPS certification. Thus, add a public key
> > zeroization to ecdsa_ecc_ctx_deinit().
> >
> > Signed-off-by: Vladis Dronov <vdronov@redhat.com>
> > ---
> >  crypto/ecdsa.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/crypto/ecdsa.c b/crypto/ecdsa.c
> > index 117526d15dde..e7f58ad5ac76 100644
> > --- a/crypto/ecdsa.c
> > +++ b/crypto/ecdsa.c
> > @@ -96,10 +96,12 @@ static int ecdsa_ecc_ctx_init(struct ecc_ctx *ctx, =
unsigned int curve_id)
> >         return 0;
> >  }
> >
> > -
> >  static void ecdsa_ecc_ctx_deinit(struct ecc_ctx *ctx)
> >  {
> >         ctx->pub_key_set =3D false;
> > +
> > +       memzero_explicit(ctx->x, sizeof(ctx->x));
> > +       memzero_explicit(ctx->y, sizeof(ctx->y));
>
> Isn't this already done with crypto_destroy_tfm()? Or am I missing someth=
ing?
>
> Ignat

Thank you for your input, Ignat, most appreciated.
Indeed, the memory for ecc_ctx is cleared with kfree_sensitive()
in crypto_destroy_tfm(), you are right. And people at FIPS LAB
seem to be okay with that (for now).

So, please disregard this patch, I'm sorry for the noise.

Best regards,
Vladis

>
> >  }
> >
> >  static int ecdsa_ecc_ctx_reset(struct ecc_ctx *ctx)
> > --
> > 2.49.0
> >
>

