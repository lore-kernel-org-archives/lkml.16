Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB90023F266
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 07:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743664281; cv=none; b=PW8/8QgAZNBSZkVDvhI9CRV1IBGQg2z58NtJ7OqJdGSBas+Q/1JdHFAc85rtNHavLvFwqUAntKPTzvChz0EhZW+c7TT36Y9K42p7NaOtG+vjG6GcdL82v+r+2pU7Zi8pVLIYE/n6lKhl1OJ7rMVijc+74NFhUsHU1vwpEH0Z7To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743664281; c=relaxed/simple;
	bh=vJ0Do/5yInpJts5TcS9oFarGP2cYAYOdQDj3i6kaNC8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HzEBnIF1KLCU2zr3g7f+G4XOi4uNGMigMg4rw+zvOSo3w5dDFiptUZ4Sh2ek0MYm/r8PP18Rj5WpZHie5bLrro99+QgVzGL2XmFRRcWmTKo3zDZBY3y3MVr565Ek8UUulxr16ikiOzOpq/Io4SVFqlsGXHxed57XCnF5cuTouyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=riYps+6s; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="riYps+6s"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3061513d353so5758671fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 00:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1743664278; x=1744269078; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vJ0Do/5yInpJts5TcS9oFarGP2cYAYOdQDj3i6kaNC8=;
        b=riYps+6sKJPSvRgNGshxMnSp0eYbkkbCMuLByP48sowp/ixmosWHsFey7dzgyiHwEy
         JGpIucDX3a16ZATLwQ1OkfFwq1vHTrAE2XIAGsHy4y4vM09N8q9RHPeHkH1jPCh5O8sT
         TN92hj+RqjgYOjIfbA+U/i6DKsBKWgutvh0Bd9T24zsfQ082k+9He3XLM+SDgtPL1w/V
         nUVN3JPq3wDtUDC9DtGfPPasLmpNMM6Wz6uLdwv6Jeey2rQy8sj3xPNxe6D2f8FxEoql
         ouAtd77f/tvehFO/8kqi8VVRnK11ZOE+zuKzWjH5pWk7Wvp121PgcsGgvJs6QrB9B+iK
         mieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743664278; x=1744269078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vJ0Do/5yInpJts5TcS9oFarGP2cYAYOdQDj3i6kaNC8=;
        b=k0+sHr9kOYElNa8UN6xfZZhsBEoOsYWzY5dMa0iGonl1kByWNn0azHBzq5HxBrqERr
         9w7M9uOMEqHnqRxxKDbuRDB6Tmnn7WQ/VJvNSLuaNfUzma9xtPDuE87LcFFBhCx0DwKt
         OGZ2Q//QLnR6PtT73bT4MXBpowfsuEulTJL80W4WlsMtsjQLE7F9zLQ69NBJEyQDekb3
         LRatkosjHUa+d/4ods34k38c+oeYjaQixG4IUoaYLoW/3cdZZtXstSjAofyNgxPZfp6B
         8wWOdj90CxYJ24qfh4mUErT4EhSPw2t9kRZris0gE0eAyDjubCRNQ5Sy+Y8/X+d1SYrb
         SLKQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8PH+kMXFfoirFUDwy9zo1DkHu/n9rVrduBU2CB/DCNw8pvXzqdidZU77YSvW/HGzg+7av924LYb/8HY8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+vAZOOuWdOyKm2aNCzNgKux9MJgS2/m4H6osWYy9Bbya8rjZt
	dDFGSqxbo02rZfYUNUyg1QNAw7P2bJ02/NOcJSE5m5RO0flvOwAcNZd9ig/GS91h0rbLqglIHpx
	Jh4YEiQojI1mNmzWUilE4niIO1j8fbtrVPjqQGg==
X-Gm-Gg: ASbGnctMGlj3D8EzSXgAjU0ogmapKouX/4YIvgmLwovXxQscHK6bsx//0YTvQNXaOxG
	fDaA4ok6AugpGS5k58jP+e7UzxnWKEiPgMas/DwseYDdyEYGta4dB6drVFZrxTA3857r8uLwluR
	MbQx3Q+cMQUHKpk2xjkFmks96q/q8/9l9rWl3b6msLqMm2R+bzMfHo3HUN
X-Google-Smtp-Source: AGHT+IFkpl28huUxLnkOG8+JoZRPAuyoYj8fAmCyXd4tv38/gNFXW7fiJiUp5ulgWcmnVTNmKGEylZ2WlPrLdyIQcMA=
X-Received: by 2002:a05:651c:1475:b0:30c:7a7:e87c with SMTP id
 38308e7fff4ca-30ef91e9c23mr19952681fa.35.1743664277849; Thu, 03 Apr 2025
 00:11:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402132634.18065-1-johan+linaro@kernel.org>
In-Reply-To: <20250402132634.18065-1-johan+linaro@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 3 Apr 2025 09:11:07 +0200
X-Gm-Features: AQ5f1JoNoWRTnOEMbH9dyhhofmJuk8_vYCLRQWl_3nQ0kPEBcd2NI2XoNIkV_Zo
Message-ID: <CAMRc=Mfpm8=q1mkfNfjPtogbh1S9PKU+w_2yMP+oE_Gj7-qemQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] PCI/arm64/ath11k/ath12k: Rename pwrctrl Kconfig symbols
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Jonas Gorski <jonas.gorski@gmail.com>, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	ath11k@lists.infradead.org, ath12k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 3:27=E2=80=AFPM Johan Hovold <johan+linaro@kernel.or=
g> wrote:
>
> The PCI pwrctrl framework was renamed after being merged, but the
> Kconfig symbols still reflect the old name ("pwrctl" without an "r").
>
> This leads to people not knowing how to refer to the framework in
> writing, inconsistencies in module naming, etc.
>
> Let's rename also the Kconfig symbols before this gets any worse.
>

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

I'm re-adding the tag here as otherwise b4 will only pick it up for
patch 4/4 on v2 of the series.

Bartosz
