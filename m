Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908402144A2
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 07:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749626283; cv=none; b=Vv3rYzdNsGAF5yJ9kkIZxdX/M8g+luew23b5isILFqy8V3ZzAfcbOQ2w28t/dSG9BY4VbFu7UGV6ynTrEo8GdiqLWTNxPGWlvy7hK20sGS/LDjz+mEo6Rm7EDvd0Uo5W9JiMaivpJOZWlJzuWdVLL5oURN2qmz6sbb3FihdyBwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749626283; c=relaxed/simple;
	bh=QNeImmfSFEHcHoVT5BWJstzzNsO907LECLn5apjX4dw=;
	h=From:Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:
	 References:In-Reply-To; b=i2VUeARz27NOoptBGjx+HgT/Uy8n1uYjKyIwOavqEXqSU9MWQ+8mkP6yqHYEf/IGWsrF91JOXDyDraUMfaTDRp4q4MAXMGeqlVAR+itE0TmZCqLY6ENr77PEU+8juovLusqTO+64Tl7ZzIya3NNCdzjhOTbE3mT45qhkXLAbL+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DK8+GNVC; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DK8+GNVC"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-450cfb790f7so44049595e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 00:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749626280; x=1750231080; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2UV16KNGvk2B5yuORUC0PMOaWLyG4ZWITjVZAENXr0k=;
        b=DK8+GNVCctgCOT3R8znvJ0egCudv/7L1EeMCt2B3Qa9nd99GeRoLWpn0GcTnu7yGZx
         ZaDHLcQv4t54r1evoncJMbPPfX0QBiLTlpNkqgXHyOBHWgbxNPhweBxIDxq0007x8gIx
         vSgKg3es/TKsiBy7tZjTK1vYqSmniCnS6ySYHgpRzckBmIct0QddYfulHgalvZjksk7F
         nNKy3Z3Cqkyi/7EYsGctGuzLp+rKN5Ov8phSeHd2Ad7XccfeHSIkK92BrFZ183AOnLqf
         GwtqnFfKO/Idclm/x7ga7HwPuEiil23cMT8IV2uT60fWPxLeY10/baLZYlE72y5FXqgt
         4nMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749626280; x=1750231080;
        h=in-reply-to:references:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2UV16KNGvk2B5yuORUC0PMOaWLyG4ZWITjVZAENXr0k=;
        b=u0k5pBM/A41vPhejcM4efwMbpsMz6z4pciX0X2R6umDj1L+4Ia3o14fYYY4oPNjQlH
         oQNgrdDlR12h7MIGCxsu/kWHukOyO0oRgin1iWbLRW9GTMR6jqkV4w+amT3MaTHXUE6E
         Eam4g/tBK7q5t2BkbkRJ5VugGdobCYqCjfk13q2Qn3rtqQaocOJv2JY/dv4u2w4pcHjV
         5qCw9cBLQA3q+n9RKEHrXo3zuqaG9rvTGqOR4DqqnFI5oFeFYQ7kd4R7Vcwr98N4wZPQ
         KcT7FtDyMaM4PAG6CpncCnMCyWX3XYXA8qJJ4qhyse4Rispqse1eMzb3lSsnknzLWDbU
         dA/w==
X-Forwarded-Encrypted: i=1; AJvYcCX5u49EV+99AAaqWvCWb+kTgdceFDB0quht7dO4JBuGUg0vRadyZXgY0aHI6q0EoPLWoF1s/4S9e1qh+nw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMY6lWkkXm3LnYN8Ya6v+H0A8LEOqYRviJAooq1RWxkPz6xvsT
	MXOSKr7E/9i5gNZXAoW2uvvn88jHwmt9EpQkWAl0skOK0rbPehNBVF3z
X-Gm-Gg: ASbGncsyeQZ6D3qrjQ1PMicj163fd0HIxYzE0Oama7HdwGKNv1m5EjyB49E1Baxirie
	6yk5s/L4d8d2gx+U05DOF54qk1FhgD/4H6BtlwvQt6i5zFrmYtYqYmL7QCijRZNEbB0Vcuo5hf6
	gGKtnSm0oCx25N5JAledUcUAIzdRjJJi6x7rN2ZaxcCXkTDNRsdw+T6Q5Nsp5OPD5iu9ha8oWE7
	NG2OiXuCiDUHFTJJesGwoR9zo2qqWEGrvj2sP4GhKmZ5meMy0s88fwaXNrjC9jHlV1l/tvhKewy
	ps4MgJWcYuLubJF8e7AesR5kDsZHkG9kd5BGHc1/dyPkl0xKRZIfPcZ9ND/gmdwWhn16r46fHVx
	JAjKo8eVILjGYeQ==
X-Google-Smtp-Source: AGHT+IFT1pbBYNbS/cZPSP4PTxvgVaj3pNGhmXxZlh1AkFam1XP972B4SbHd1fccSvHvvnUVHTpBrQ==
X-Received: by 2002:a05:600c:3d13:b0:450:ddb7:ee4d with SMTP id 5b1f17b1804b1-453248cb4c2mr16102345e9.24.1749626279675;
        Wed, 11 Jun 2025 00:17:59 -0700 (PDT)
Received: from localhost (a95-94-245-170.cpe.netcabo.pt. [95.94.245.170])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45325176cf5sm12154925e9.21.2025.06.11.00.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 00:17:58 -0700 (PDT)
From: Rui Miguel Silva <rmfrfs@gmail.com>
X-Google-Original-From: "Rui Miguel Silva" <rui.silva@linaro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Jun 2025 08:17:58 +0100
Message-Id: <DAJIR40MBKSP.11QTS156Y7NH2@linaro.com>
To: "Bartosz Golaszewski" <brgl@bgdev.pl>, "Rui Miguel Silva"
 <rmfrfs@gmail.com>, "Johan Hovold" <johan@kernel.org>, "Alex Elder"
 <elder@kernel.org>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: <greybus-dev@lists.linaro.org>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, "Bartosz Golaszewski"
 <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] staging: greybus: remove unnecessary GPIO line
 direction check
References: <20250610152036.86099-1-brgl@bgdev.pl>
In-Reply-To: <20250610152036.86099-1-brgl@bgdev.pl>

Hey Bartosz,
Thanks for the patch.

On Tue Jun 10, 2025 at 4:20 PM WEST, Bartosz Golaszewski wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> As of commit 92ac7de3175e3 ("gpiolib: don't allow setting values on input
> lines"), the GPIO core makes sure values cannot be set on input lines.
> Remove the unnecessary check.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

LGTM.

Reviewed-by: Rui Miguel Silva <rui.silva@linaro.org>

Cheers,
     Rui

> ---
>  drivers/staging/greybus/gpio.c | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/drivers/staging/greybus/gpio.c b/drivers/staging/greybus/gpi=
o.c
> index f81c34160f720..1280530c8987a 100644
> --- a/drivers/staging/greybus/gpio.c
> +++ b/drivers/staging/greybus/gpio.c
> @@ -192,12 +192,6 @@ static int gb_gpio_set_value_operation(struct gb_gpi=
o_controller *ggc,
>  	struct gb_gpio_set_value_request request;
>  	int ret;
> =20
> -	if (ggc->lines[which].direction =3D=3D 1) {
> -		dev_warn(dev, "refusing to set value of input gpio %u\n",
> -			 which);
> -		return -EPERM;
> -	}
> -
>  	request.which =3D which;
>  	request.value =3D value_high ? 1 : 0;
>  	ret =3D gb_operation_sync(ggc->connection, GB_GPIO_TYPE_SET_VALUE,
> --=20
> 2.48.1



