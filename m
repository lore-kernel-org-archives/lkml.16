Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E662E03E6
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 09:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751536296; cv=none; b=u7uUJCHAGNnP4fgF4zl18gbpo1pmy51f8HnubVYsvDfcmeBcAoym2U3EW0NwSdCO464ISY0IGMPikvbEs+k8+RoHBCOFom0InJIBQf9FZ6EGEOzZ3Ni6f8mBzhUGlZVYA/XdhSvmPEibu/XM1Q+70BRezNPPVgZkTjLFzLQ2n5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751536296; c=relaxed/simple;
	bh=YpTyljxwyw07U4P0gHb4gnrakvNkh+/hIrM+ABJ+fj0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qb7koBwEXRHHOrIa+aZNmYKz+Hg5bPncyPD5Qz30CVk4NbaimS+8uRu2j9KSKtLnK/DaYgOK7izl3cVjOqZGpH39LCVU4pd9SMPJ3JomOMckUrlUwSN9mrO9HG7IU4bUpyX20NZt/PQ3FzfmoOgYf8DPIvCucJCVyKFwt4uoFpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=2xRyu5kp; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="2xRyu5kp"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5551a770828so4688494e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 02:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751536292; x=1752141092; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fm9C4xWfuuIKIxeM1FG7nAWF3Huvmfev7MnDCCzIEeo=;
        b=2xRyu5kpBk32c8BFiGQ2GK2WOFFJHt38z+jgrUYl5ctvpo/ZGXTPEpt3mUnkXwlSnc
         ONmpIfLJPriVZ9pppbTFbxn7Bc1ccQb9CZLX/d7Mjy2wWBuYacI19cLhdswRa8suDeHC
         Vwviu3AzO0wopJY+YB5NtxbVIwQ/cVE+thlICj84t5BUg5Z8kqEmrKM1+v1f010xkmxv
         NnIQb9F7JWSyn/L+jNjaRL7mmLCiyJVqYn+cdC62FTCgB8JEyC7R3FkHBv+2O+T9lGzb
         ZuFcLFr9a2gSr6sX7eyaDB7hKh5bPq4zJ/PQrGpiP/8OUcnWtSKVy00b5dbaJbphxqJQ
         Hgdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751536292; x=1752141092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fm9C4xWfuuIKIxeM1FG7nAWF3Huvmfev7MnDCCzIEeo=;
        b=JIHaKi7MkauIN/R+ZKIRsrm7U+lZpiIJ4hzu7gKeskDwhTu5mp5lb8ml46Ai0HgwfO
         bMIdcNEQioG34GekrFQ9cdmKXUCyV0Oyijbgav1VfYRRwCECGapwVd3QOWV2g0dlStg8
         pM+VbnNBOGquJ9fMyYwao7hAP2dTios9psUvzyo8qxAcixSkP/Z0TwWjla9yY0h0DGiQ
         aL69OUHtafyB7HRHV0rMCL6HOWRWovmuXqnRoy1zeUUumeQcjoc417N7xZqJmCv9T7Gg
         Dck5ebap/r6svaKLM0uIcnW0mjdmolhAT6S2o4T2+P4i3baVfi99fccLrzCCCY8cz7Me
         qhdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUh4vuMxbK2uSsBxPC+h0r3aO8AR0easNM4RMPbIdc5n8p7t8FixJUoFApa/hjEiaSF4gR8TlgGCJSMZgA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx50Bk07foICKuKTmEBHfPKOSPF1vio+BiITfXpHFcbXWcn1Fbf
	vSgMgEPk66dJxQbpx5blo/TXxp+LZJD/AcQv9JBv9Sa1igZy1e1D9O8E85DHu/gg0wAhepjYVIn
	A5Xhwr6FghSh+qsm35Aq+Yxdc94Q8/bOI3IX3BtTIDg==
X-Gm-Gg: ASbGncvFns2+Jgy3+TaOZejI6A7qFJfL/0CC8uVJPY/X3j83V8KNo6GUiypi/0cdwua
	n5XUIpcV4B8m9MM0Cg+7HXOSkCfgoOboizN/qZfxY2ekyygZAisR91FyiopXp06LDAFEV++Ra6o
	sx6GhL3JuUUuz6EpkbSHaVP5khxAoVfFPhyshKzeDgvFUOefX5Vr2UliPycSyxaqdSuQ5o5btYt
	g==
X-Google-Smtp-Source: AGHT+IFNLwhbBpukbVu0dvBLmLJ9QPZOvXagKslA4IQMG8t7aHrgsvuCJVnQ/Jp0X0+rUTcLV0jdkLs/XNf8N29ZrsA=
X-Received: by 2002:a05:6512:3b29:b0:553:36b7:7b14 with SMTP id
 2adb3069b0e04-5562828523bmr2206635e87.37.1751536292037; Thu, 03 Jul 2025
 02:51:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702164926.2990958-1-s-ramamoorthy@ti.com> <20250702164926.2990958-2-s-ramamoorthy@ti.com>
In-Reply-To: <20250702164926.2990958-2-s-ramamoorthy@ti.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 3 Jul 2025 11:51:20 +0200
X-Gm-Features: Ac12FXyCwoICVUr3Z51apCKRhZU7x6W4kGidAOB345u_C9-RSlabdFl5B5KxSls
Message-ID: <CAMRc=Mdg8_Tq1PWAaOSzzPGUMu6-_3SvOy6F+n_Qv90arVyeLg@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] gpio: tps65219: Update _IDX & _OFFSET macro prefix
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Cc: aaro.koskinen@iki.fi, andreas@kemnade.info, khilman@baylibre.com, 
	rogerq@kernel.org, tony@atomide.com, linus.walleij@linaro.org, 
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, m-leonard@ti.com, praneeth@ti.com, 
	jcormier@criticallink.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 6:51=E2=80=AFPM Shree Ramamoorthy <s-ramamoorthy@ti.=
com> wrote:
>
> TPS65215 and TPS65219 are overlapping PMIC devices. While their regulator
> features differe, the GPIO features are the same. In the TPS65219 MFD
> driver, the 2 PMICs share the same "tps65219-gpio" compatible string to
> limit support for TPS65215 in this GPIO driver to comments.
>
> The TPS6521X_GPIO0_IDX and TPS6521X_GPIO0_OFFSET macro name prefixes are
> updated to indicate these macros apply to both PMICs.
>
> Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
> Reviewed-by: Roger Quadros <rogerq@kernel.org>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpio-tps65219.c | 27 +++++++++++++++++----------
>  1 file changed, 17 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpio/gpio-tps65219.c b/drivers/gpio/gpio-tps65219.c
> index 526640c39a11..3c762103babc 100644
> --- a/drivers/gpio/gpio-tps65219.c
> +++ b/drivers/gpio/gpio-tps65219.c
> @@ -1,8 +1,8 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * GPIO driver for TI TPS65219 PMICs
> + * GPIO driver for TI TPS65215/TPS65219 PMICs
>   *
> - * Copyright (C) 2022 Texas Instruments Incorporated - http://www.ti.com=
/
> + * Copyright (C) 2025 Texas Instruments Incorporated - http://www.ti.com=
/

Should be 2022,2025.

Bart
