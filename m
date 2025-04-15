Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C2D28F501
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744705775; cv=none; b=uMSc9vVPfPP8y+nAPbvWgh8MgtgZZedDonV9lFjAy8eiZDQKOrsaXJ//iy0YPEX7eS5+IjsDxS255duSi/VFHQppbIK9hRThbeOC9IAbqwUHPyBXU+b7uQRq7/MrV+p/OhfuCtzbjTKSEiMr8pWLaCrrvlbjOZOjSdGVzDWiRmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744705775; c=relaxed/simple;
	bh=JqF91dZIOXlVj0NeUvRp3kehfD9MyoxzqTqimBqYe6Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CLFuRlT6xQSMxq30EyZooJCmWZ48PuIoPlxnU5Ujy2Na7VsXdFchyXKM7KjjmlH2KCAwyQYv1sIq1b4f4v5W6342QRSmVPYIpWiN0ogi7T7IT/Hv4Ibhc8LX3oPzPWqOI/5e/r8CDbxM2Iy0NTWZUsTsTcxXj4LoL/lYxr7qauY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xcKoYDLx; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xcKoYDLx"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30dd5a93b49so45722831fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 01:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744705771; x=1745310571; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JqF91dZIOXlVj0NeUvRp3kehfD9MyoxzqTqimBqYe6Q=;
        b=xcKoYDLxvj3EDKKIoYmqrloJhQUGDIAD4FnRAl+jCsC/9yTvpdYylTMjy2u9pjTZDm
         iJHzKKKpiGezLUik1oYSkGqKlUfuwu+XIynzXRZPFjzPcixRITHxg7KTovOiKmMCqCrp
         7zj4vV6YGkzGG4keXPSmeTlg3DT/DuOclA8fNQKL9ZtW9SvBe0kX3KJAgZlPO5uZ4lpS
         1hdylfNtjy0/LSkfjZUJjbeOdUVDCVoQpS5MwiwNCry5THCEesNNWYq4wCfGL3slEHBz
         3512Mnav27ajcuCqt5TmQo2nQRnMgUFj5c2I/Frf0NooRvo5rmfZLw1mEhUDqecTy2n+
         mWRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744705771; x=1745310571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JqF91dZIOXlVj0NeUvRp3kehfD9MyoxzqTqimBqYe6Q=;
        b=MPDsaIQvpHjkpMKaN6dCrVE+Nv4wk4eDzb+QqkwJux48szomcN6zlwwkb01L/QejKE
         aVATKT/0Bi31eDh4VJToNOK8GvTd4I6xKvNtFZLHhjvxWsnv9UcHEiOJQTiGq37ZMJ7+
         mVq9zf4bGvHPHRyJ3bV5R2/sIwHZoOzkgYLtSdDJYueL/YEjmYLmdSx580SR6FuSGR1r
         lHnL0kGp5bYEbGwBREotyPHtsfUR4NR9iFl3TSTYfMdBAk0U4FG1QcwY6SUkEM1/yl+q
         vOQY/DI/MYly5Peednbfi1tUpGRBRsKex6VmyQq93OOF94yeYEHddam7AyCfG9KE1Qk4
         ZDvw==
X-Forwarded-Encrypted: i=1; AJvYcCVH+tNKtNEFCo7yofbDAAgRAxmBIl/FooBtux9rm8OEMErwC/lHi5zxbj7zfv6T1x/P1k5JRsIccVdpZy0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTcKMo2Bvfs9XdQ8/uOHZlDxuoEz/5Vd5HwmmXuxhFwR2j5jDL
	Jakvivtb0nV/0lPoPZGIX8dugTky2IxKU6Juo9Qss/xAaZ10sZ0WHqHKHUx3ENA/2pDhIX5Hqwb
	2G2ZinD9gHFgqgypJMfDNYd99C7Ny08QCKmQj5w==
X-Gm-Gg: ASbGncsW5JvNdXAZ6bVsuQ8CjjROMDGADqgsvd6ig08i63NEDqL8J3T0pphTJ3GyhhB
	afBo97lP++D+Mi/SkqRu999UU5hSQqtuqg6iGRVBr5ulhlgo7C4uPmf1ZkMvi4BZQCxEz8NhIjl
	UZmAsUv6/csCN4rhU+IdJ+ew==
X-Google-Smtp-Source: AGHT+IFjWv4YN2TLRK+8gIXeTMozvedsriPJva3Us+iyvNvjh4tmGiLADPX3P4ddGuJK/i6+QCaKD34pqB7ZlhiSFww=
X-Received: by 2002:a2e:bd08:0:b0:308:e54d:6195 with SMTP id
 38308e7fff4ca-31049a021d6mr45079331fa.24.1744705771136; Tue, 15 Apr 2025
 01:29:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-gpiochip-set-rv-bcma-v1-1-fa403ad76966@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-bcma-v1-1-fa403ad76966@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 10:29:20 +0200
X-Gm-Features: ATxdqUE9g7RM0HJPsiRtWp5uefAcSNQmT280xjEtFgRSUBBli2MK8hnSPFDk1to
Message-ID: <CACRpkdbu01ivd7AX5vn6App2UXbCFMPCMK5FBoJJvHjV52Q5YQ@mail.gmail.com>
Subject: Re: [PATCH] bcma: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 9:10=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
