Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A50E22B8C1
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 08:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744793073; cv=none; b=CSZl25rm5I8HfymFjIJh1sv7ECj7/RVvQpZwPMQXd7C7Hq5YJShTutX6RtxhKQCa0zrWremwrjraxcnDGANI3DJx4qOxEL/m4UarlZu6RSHzJjHI2J0I25lSVi2eLiQdP/UMGcTzSCDbsAStL8QP3gbdX9+E9aPPMtrLZ1tf1QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744793073; c=relaxed/simple;
	bh=FcxBn5vOvH6LTMNix8siy9uaMgg1aQmowQ6KuwJ+Dak=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S19NqiqnxmpwUsBTHgp3VRvIV2t4WzGmxkpkZg45d2fxRZb2VHISvNxB9mFwy4OJCBWW9F0KzY6i3P59JMM2CaA9MkDlySheDieWu797f49j/NmshfgazaM2u3DV3DI6/9tt1p6fJ+KruZs8Zr9GsVCFdT2ayk3Y23n4NsB/2fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pgVsDHZs; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pgVsDHZs"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30bf1d48843so55481151fa.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 01:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744793070; x=1745397870; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O1IYgQGQySvCTGgqkhWJANrOLKSKyieKUnDMio/le4I=;
        b=pgVsDHZsSWf04VSOVfTZVDKsqqUCGSpqhHZzvSZHPdpoqV6vnaT0bN1pE97ZSe73zT
         3RFbPOiEMIAfvQchoHxreR9dzCcy14b80SA1k5yQyRbawQLZIlYYdkeXLqdQ0f5aJiBm
         nvRlrNH8lmkrXfBh5jvTahQbvZ/Fmn8NNKWtSEWW7y3jwJzZYCkvbB1KHIlwlKyaw+WZ
         Bal2IcBhuOuTLb3riVyRyA7L47sNX2f/bsLaFpA2crK0oRZGiGbTKSM9K3YVxnI5k6Yc
         jajIlCG4oLEkopZmMU8J0rRaanTww43xKxa14I6GVfDk3hiqJ9IXOp9d6u6cU08mE9WQ
         9jgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744793070; x=1745397870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O1IYgQGQySvCTGgqkhWJANrOLKSKyieKUnDMio/le4I=;
        b=hIjXzdYd41e++NNVyqPtzEelsiP5ranW5NgHVOSHZ6gSac4y1313gu8KLRqPrUg7ht
         A0u7yYRgXL2fckTyF399EYssixLZzTpKeriELSlpezf5pj1jaXboUBt3pxNDILMmTwxX
         ZlvwxKGKgoyI16vf9/cbHP9M66M4oeQ+azTumnuDYrwGmzPGgsjwKg+ZHqB4/CI/gl9R
         QZJDdC8JQeYeWTtg9T644y8ynNO+F5J/puewLxUbnqIgOUT7cJG9i98jH3CaGV0chiSu
         0N10svsuDtRTPuOOX++8dr67vG16THI/g0oosIcQ5ojNQN0WC//b613NgG1SS1BTpTCE
         OAyA==
X-Forwarded-Encrypted: i=1; AJvYcCWu8Y43V9WjQ/ERpT3tzODOfl9fh+0KWlrzEyS2mDEG6GcVhBnhVX+1PC2PO3dbzKH7w3Sepl13qJHHAT4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrMezp3eWx8B/V0WePX9lgmBUL9IsmpRofH1K+oxhj9GKtGqSz
	VIxuuAcJCPYz0jXTWFRqARc5sTgmkuz1/Lu/c+/+a3rmAVA9+GWdr6bYzbJZgsTbJZeGs5/10/S
	NyT61USFbenGButoIEvJFIb7Tqj/aqnhS4bVApw==
X-Gm-Gg: ASbGnctQQbdDA7NQas/WyzN4IJUFOrI05kqFdQnt1UhOrOl5WDRYz4cV2daMrXooI0I
	jdiEGSMc/xAlF0wAGF926LjFc7iTwA8Hl7qWAey5zdWzhXw31ZJ7YsyPq1xv2ucRErHbW0Tf0Fp
	lPhDgqPKjyfDvKB8hD8Hz9pw==
X-Google-Smtp-Source: AGHT+IF/KObRzQGLOGJXTieeYEIieF6fnHP4NY79IKbkR8x70xmjAMurAou1CuBnifYtmivSixCLXlbWvJqq6TV1V1o=
X-Received: by 2002:a05:651c:512:b0:307:9555:dc5e with SMTP id
 38308e7fff4ca-3107f68c28bmr2719431fa.3.1744793070015; Wed, 16 Apr 2025
 01:44:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415111124.1539366-1-andriy.shevchenko@linux.intel.com> <20250415111124.1539366-5-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250415111124.1539366-5-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Apr 2025 10:44:18 +0200
X-Gm-Features: ATxdqUHl0l8qpIz_CHDL8adLmAWi8nEktZAOLLdcjJV96VS7uhwiZGkXbeJSdz0
Message-ID: <CACRpkdbvnL0z1x0An2Bhv1TdQxaz4vtBpVBDXUe+LCK68FM=dA@mail.gmail.com>
Subject: Re: [PATCH v1 4/7] gpiolib: Call validate_desc() when VALIDATE_DESC()
 can't be used
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 1:11=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Call validate_desc() directly when VALIDATE_DESC() can't be used.
> It will print additional information useful for debugging.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

>         offset =3D gpio_chip_hwgpio(desc);
>         if (gc->to_irq) {
> -               int retirq =3D gc->to_irq(gc, offset);
> +               ret =3D gc->to_irq(gc, offset);
> +               if (ret)
> +                       return ret;
>
>                 /* Zero means NO_IRQ */
> -               if (!retirq)
> -                       return -ENXIO;
> -
> -               return retirq;
> +               return -ENXIO;

Totally unrelated change - but I'm fine with that :D

Yours,
Linus Walleij
