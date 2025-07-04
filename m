Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843942FEE1F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 08:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751616337; cv=none; b=MbQY9pmkYvcqkTRfZhbsDmJ5f4UFbp9BMS+iWTLAxqGQAyi3xrZEg77e3BTynLeEc5HNyWsu1eEH2gcEpRx+85iljeJbfgakPEjoJ1Xs57bLkkGEP6NBxmGXE3Bb/AglIPW4vHSEtBkAElRTdI6KRvmAXmyf9YMlCv0lHNvd8dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751616337; c=relaxed/simple;
	bh=gLSnd6giDnfbWcxYXT2wcpNKMruUI8d8nbGjFJ7L3e8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O+znqIB836kdgtVjgMagwwbC3MBHS5PCPrUYS6R2gdmgIpm+YMVkVp8LMM21s8qDgUJwKls2my+GmBHcf53PTsN5vjW0T2iH3pb2ZKYWGABRAq5uzkULs5WOsNuXgHHg1qYzaU9s1Zl0JsjwdxKUTA6Kl7W1hgyiVjLYKa7tOfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IVfgHXpt; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IVfgHXpt"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-32ce252c3acso3795401fa.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 01:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751616333; x=1752221133; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gLSnd6giDnfbWcxYXT2wcpNKMruUI8d8nbGjFJ7L3e8=;
        b=IVfgHXptx3+ju7va/qniKcTy30vstmHwSGutSFL+XdxVUJUqloDkJyoHfJ/hXDDRwx
         cFq/Cl1AJyywMKM2ykx21EyhEbygSfQTOtIY3JmKJnCNDcjr3orJfGfpZbWS5MGAGJoc
         uiCGqcrO3xO/YrgaFKR2mKZI02P1+jmtnRoTdIJarVZrxyalDIeAmDd6g52EF+p5vH6T
         DL1UtS3kQ2rgZ1yUxe0pDJJz/WEfdeKH5yaP2Hq5Ye7f7j3aOTONOYN86Ooc7no2Cws+
         zbv67o13LZx0gh4Ea9j4Ad/7qdh8Pm6X2tXcwDf2YM64bVSzNrm/ijV79CSiR846Hz2D
         ICxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751616333; x=1752221133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gLSnd6giDnfbWcxYXT2wcpNKMruUI8d8nbGjFJ7L3e8=;
        b=tUl/G59CZ2ONheObtliT4kEWEyfZrHnT5txqZ6WOffjPYO9nPWh52dEvGPo2Hz3jZe
         Doe1Gn5N57/xN2kg3TT2PrLcQ1Pmc+yQNSj6/6OW4fGVPSHzFgeAUie2u03JAMSb6QdV
         /JOHNc0+Z49Sic2AEl1cS+MNI5DjlzDOwdUG9HBlbNPJiucTTmQ/mzdLZgz1DXoHPHy8
         pj7Bj5dsXAQjjEX4UkAVr/PbDZ2IgdbSzqHNYD/deK6F8aYWRM7t9lUgQNskkGzmHVJd
         2D4PXIBqfjJXcmHFtOtccntCuvj1kGq3zJQ6ogj8PLGupputOtIv9BBkXlioDPhkmpL7
         tOew==
X-Forwarded-Encrypted: i=1; AJvYcCWBYguO5MniXmHApwUhf+Hv1t1c5lKIaHmoaCOSOYTDsbI22Tr8PxbYlQiZPaDJ/HNTWRGvSrs1dpmmnq8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYx6Hmjrr/XGD2z0Q6zLWbRDtfkRwzw5zBOomzcbDYT6byL6o1
	dgcKmirqHrOXPTxmDneulh4hZFIRf3G/NzjjzpenRTE/lnwz2yktjgrgzEO6H33vzmYVv6MeWCk
	ak6DjfRcAlDuE2ozNhdrXRjAYNN7d+xPQndUATku3BA==
X-Gm-Gg: ASbGncs831F6fmBb35kiWhth8ZPDVh2wkWdM2FJ+SHfO5MA3KpXb+xLBJSDEgMWWral
	IGMksNOyCoa5Gwv20rTXLAYtEgI8wYsaBxu92NJSGNGyPrZtZXV3xQCfd+hJ1n9xUFG6ZXjM1SA
	hBaJIObIR+ryZnlOSjDLW5bG3EewRzXaIS+IBiarcuBgU=
X-Google-Smtp-Source: AGHT+IFctPLcSJg4ykfhGL/MZ+g9vuXZvLZVkJpJyt2M2asLefjSEl5BwFpp7OuvBfV1YT/bzHqI/PtScrnLd3/qkSk=
X-Received: by 2002:a05:651c:411a:b0:32b:488a:f561 with SMTP id
 38308e7fff4ca-32e5f5992cbmr3352351fa.18.1751616333296; Fri, 04 Jul 2025
 01:05:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630-gpio-sysfs-chip-export-v3-0-b997be9b7137@linaro.org> <20250630-gpio-sysfs-chip-export-v3-1-b997be9b7137@linaro.org>
In-Reply-To: <20250630-gpio-sysfs-chip-export-v3-1-b997be9b7137@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Jul 2025 10:05:22 +0200
X-Gm-Features: Ac12FXwBzNCj1y-ZrLdw9OXFh5sOrrWzfZ4fOjTViVGgzsj5minz_lC6w5id4wM
Message-ID: <CACRpkdY0DcuXD5sY-RSa_uCbHFcOB=CRoiTdENM7yQg_oQssPQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] gpio: sysfs: use gpiod_is_equal() to compare
 GPIO descriptors
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, Kent Gibson <warthog618@gmail.com>, 
	=?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, Marek Vasut <marex@denx.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 2:37=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> We have a dedicated comparator for GPIO descriptors that performs
> additional checks and hides the implementation detail of whether the
> same GPIO can be associated with two separate struct gpio_desc objects.
> Use it in sysfs code
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
