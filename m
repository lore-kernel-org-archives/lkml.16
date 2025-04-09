Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF7B191F77
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 14:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744209084; cv=none; b=SYzQ4JJWyL3zm7k2VjFItezmDKLlKq2nZs2tdCSz/mbPuLkrzoncb/ZW3GektYTu0el2o28L1WskYu+h9/5i8KxcWLdq9OOMRe1r6tE6lxrRUOuZoivUzX/qKxLxBXN41Dng5ykGiqG289+gPWuuYWV2QwT3liWDWbY5CHUAwKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744209084; c=relaxed/simple;
	bh=/A0/E6RW+zz/Q3F9MNhOyGXOFashPLIF47QpTHlLk50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AlnuuVZqrqJPozbaAZi72htL31AsU3myGT0xn2MWhO3NKzUfMN2U8z+4/YNRMjaPodh9G7gZeGnY1Cfep9Z3zGjWU/D0pidMNAJrGjoPXeiBfrFK4ZNLvszmKvMIzTP+GFreQ5vYurLBAKGgkfhva2p65xJg0f/xAvQbfF7mgc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d0l6Y8rM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d0l6Y8rM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744209081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bWzyml1e3e0sFCXu/PTQRw2B8guy4dfIE5xDJUgcYCI=;
	b=d0l6Y8rM170aJ85v1aSB8DjnHwDe8SumBL2NtsZqg3kTltpA4SnWGTyzIMyGVA6KWSBymd
	RRHMjd+PaO/tw/avX3kTbBOtBhxUGIfK1vqF28CbakRvqSdT5d8Jgj1vWwH67EH/LNCEOQ
	gNehPM91yeQrWVmZ9yTl0PHMFQ55etc=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-345-cY_tUuzPM0O_UigJ6A7HXw-1; Wed, 09 Apr 2025 10:31:16 -0400
X-MC-Unique: cY_tUuzPM0O_UigJ6A7HXw-1
X-Mimecast-MFC-AGG-ID: cY_tUuzPM0O_UigJ6A7HXw_1744209076
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-2c8757f7d36so339630fac.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 07:31:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744209076; x=1744813876;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bWzyml1e3e0sFCXu/PTQRw2B8guy4dfIE5xDJUgcYCI=;
        b=qdrKdbp9wWociogQRyG7l/+YiNFSiNXhNfOScdkl1wjAJGqmDpK1SdG86Q66/2Oe3l
         neDAx+3nPKwEnzgtOAuXOmAsZnTlYShee76kMM1ymLiYUaocssaaSiJw5oTbrGGMZ51j
         f9Oeyy0oqk0a3pLBGZkrFQOCF+wynGLqTsiJpdpqYnLkrqZyRde2se8eEMGun6FWAQ8t
         tLEo+XGM+uxIWQIn8KvsSOKkOTeABmT0eSfMhl9byFMhA1/zvf+/USbpGWJKtQaCG6f8
         1K4PL1HEQ67/bRbsbUG8OMCHgi7xDnOquvM/jxrHIkWqqKhsh3sSkUUksvNFUIxaxgY7
         7gbg==
X-Forwarded-Encrypted: i=1; AJvYcCV97XS+YnDP7puHeCHquew0Dz+N/8aU+HusvaPgV/LoRvm/NgnoCaGp9Ej2ESA+a+Qv6clQxWYqeFECOGg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKaUjWgrAhJJQwzEsa+0/eaSKVUHrq4p5DOeHayIHl1WU5Jxmp
	e1/0q2Ti4udzQrNuUyYBbNpYBrdEeKdpZqlOp7rT4C4YVPY04/kAFz5Bn/BofgfnzgLHTd9hPwJ
	qlDM2Qf6jkGolDI81kGoBQGHfxgsH4aIaYHmk8V2wh9w8odWGMO2IWNWwZmutZCuNgwpGDCNiYP
	sxNWGdMVSo/lYWaxAsH0HSX54ZCs/ZwVvrYIf3
X-Gm-Gg: ASbGncsxC0ny2P7SJ8BgTtCZYrdsJNrqIMYo2geQHDJtl7Oe3TQske7j81ZEhBed12f
	gxANnkA0/979lHQG6rH2WE/yG2cnyGXxDH5vGAQmaIU17TTZoB1QOhBCpeWnKcoWBgFot
X-Received: by 2002:a05:6871:6184:b0:29e:32e7:5f0d with SMTP id 586e51a60fabf-2d08df909f5mr633841fac.10.1744209076138;
        Wed, 09 Apr 2025 07:31:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEj15/sfKzjsjKYtAN6/sg9JG469/cZB1MFteleubs5OfTolZvlG+wELSU/pYcsvOH+TTr8CnoX3erw61YVCr4=
X-Received: by 2002:a05:6871:6184:b0:29e:32e7:5f0d with SMTP id
 586e51a60fabf-2d08df909f5mr633832fac.10.1744209075809; Wed, 09 Apr 2025
 07:31:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409074529.2233733-1-ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <20250409074529.2233733-1-ciprianmarian.costea@oss.nxp.com>
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Wed, 9 Apr 2025 16:30:58 +0200
X-Gm-Features: ATxdqUHzKWaL37Ln9vA_iKRnaJ2sqIT6FJHzwrfyAc7evIoEaSOKgMOMRDePQYI
Message-ID: <CALE0LRscnNFzo-tdjBdQQSi=1EdMveX-eSXyhpg_Bdp6EFiKgA@mail.gmail.com>
Subject: Re: [PATCH v2] hwmon: (ina2xx) make regulator 'vs' support optional
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, s32@nxp.com, imx@lists.linux.dev, 
	Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>, 
	Eric Chanudet <echanude@redhat.com>, Florin Buica <florin.buica@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ciprian,

Many thanks for your patch.

On Wed, Apr 9, 2025 at 9:45=E2=80=AFAM Ciprian Costea
<ciprianmarian.costea@oss.nxp.com> wrote:
>
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>
> According to the 'ti,ina2xx' binding, the 'vs-supply' property is
> optional. Use devm_regulator_get_enable_optional() to avoid a kernel
> warning message if the property is not provided.
>
> Co-developed-by: Florin Buica <florin.buica@nxp.com>
> Signed-off-by: Florin Buica <florin.buica@nxp.com>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

I verified that using the following patch gets rid of the kernel
warning about using the dummy regulator, and that the driver continue
working as expected.

[    7.247679] ina2xx 2-0040: power monitor ina231 (Rshunt =3D 1000 uOhm)

So,

Tested-by: Enric Balletbo i Serra <eballetbo@kernel.org>

Thanks,
  Enric


> ---
>  drivers/hwmon/ina2xx.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
> index 345fe7db9de9..b79e9c2072b3 100644
> --- a/drivers/hwmon/ina2xx.c
> +++ b/drivers/hwmon/ina2xx.c
> @@ -959,8 +959,11 @@ static int ina2xx_probe(struct i2c_client *client)
>                 return PTR_ERR(data->regmap);
>         }
>
> -       ret =3D devm_regulator_get_enable(dev, "vs");
> -       if (ret)
> +       /* Regulator core returns -ENODEV if the 'vs' is not available.
> +        * Hence the check for -ENODEV return code is necessary.
> +        */
> +       ret =3D devm_regulator_get_enable_optional(dev, "vs");
> +       if (ret < 0 && ret !=3D -ENODEV)
>                 return dev_err_probe(dev, ret, "failed to enable vs regul=
ator\n");
>
>         ret =3D ina2xx_init(dev, data);
> --
> 2.45.2
>

