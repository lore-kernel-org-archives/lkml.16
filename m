Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97CB23373E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 08:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743581599; cv=none; b=qsECH5pjxOM8HqNMJsfi48HHH4Dtdb0XVr7hJcY93MjGl/d4pJWEX0ECVvbQpmVfvesJPQp7PPau0gTsNFENAwNtXbMrdzaHcITMjvva3CUC0eys+JKA9bUmEw+R5IePx4EelZlt3ozhSNNycTH/ZjZsVG4u8gqgtWe9WTk6/Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743581599; c=relaxed/simple;
	bh=w93RkYtfhsYpvj5VoEDDq9lpAvc4F47ifTML7icGMbg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RoDEGRAGGWxp1br2TkNJ1DisYcL+nm1XwdDn1ObwmK4afIPfto0DP5nKwOff4d/6RAX//AgH7CzDZn0A8+IOKdI8Ztfhhjw9IbHD/a1V5PkwKNmyKdBNIM2xJ2V3g9ceiTx2xQbvPeWSbwJOpqJILhml/JaC9HAxi5oY3/rneAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ExeKrk5M; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ExeKrk5M"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30bfed67e08so65134841fa.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 01:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1743581595; x=1744186395; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z5bKkMRbKxlSUJHVqMm4hUmrEWQcNn5FC/pLkQqhEAk=;
        b=ExeKrk5M71A4I/E0XnkK88ktgGsgb1DsyE2/Dxxd+Iti0JcVq0nQUFIffaZxz8kpEW
         rcWaGAqz9bm7QGpP4sIbTW0GTNOb8B7AXw4QL5F4R/Z/RLgwszH+OwfYdrB6m2Un0/51
         VypwSCDr8bWHk0daZ2FNq2O5nu6MJbJRh2DB+B9ntXHgqJEy0Q3i2VWZAiA9Q2cmhgYZ
         M1VQAjPn/FxLqzvAY4pcIRK2m8dTUZHj8iZCQoFZCaTYlZDBf7Usbsg7UImYbLVbNkJG
         XKFLgoVCWYxQY5/P7cJUhL6X4w1tzT7ZX+/SuROS75XutBptZcnIQOaSXI3oqkqSVHom
         2IDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743581595; x=1744186395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z5bKkMRbKxlSUJHVqMm4hUmrEWQcNn5FC/pLkQqhEAk=;
        b=bPFke5S5YLF2+2bNyeA39oSrvSU0FhDOyeTQlrzvcgkpWWqetxZBWRbywy5GzCJvbs
         h974UTSDKYpfLV1svdaocNcIt62plFx0dDTZlKSOsN7Xrrb51RNSXTR73ue+MGHmnyFq
         GFXZiknHHDLj5PV1oivMaHWxSgTQe8Ypnk9S7nUtOuJ+3d3JWeTranqPqIkV6XI/v0XI
         YCCdrLAatfMnvL9PBsJB4ATDKaWFdv57K+t1XjcmUegNKHeUrgzTXISVfHx5F77S6W03
         jc0FGw+Xh5Jg3CGs5b2+vhbDdGNKbFaErViMXrJOCzA4N3NZi+6uHUBy8G+Nu7MvNQo/
         VHHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGx84fwJu+uCmohtryklGNUsJYYDa0JfeFMaazbG9Vhn0OIVORXri+y2jLR246jxub8RLdvo8OZWnLSFk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+DrowLMaDHE6F2ULhCZsra+Oe5pPM3ZBiUvANtYU20kJZfD2f
	tt+DFKFe1gQGnymYxamA747/jCpaXwtgb9AMRHIdGqndYFu++ZRK8ef3HUESfapDaBkMo7EAUdm
	NDL3ZMhj8/ipKTaCxihtlAJBKh57CRBaOLIQo3Q==
X-Gm-Gg: ASbGncuDVCR7LSlhHGPdI+oxOMHeQfyHRwMt4vyWokUcBLdPcMYsmvcSld8YQ8yLEwu
	lDuoue3tDHsFnCH0bnmJfsYnFB8BH2ofRI5oEeEWTMolZ3Ms9lfAbytd0fXFrSDoGzLIb5nCPYx
	ofljg2rdLQ8iM7uZ34+Ha5J1HaZvBmh+ld/aq8xmt5mv7Q5YTeOTtzRK9HHA==
X-Google-Smtp-Source: AGHT+IFkSOGGYa3V9WycrY+gu8XDZN3eeiEk30gJ0tR1xS7OpisGKyrqxHEtle04WwZppsgW2yf3BQ5HfqnjWB9F/Gs=
X-Received: by 2002:a05:651c:904:b0:30b:ee81:9622 with SMTP id
 38308e7fff4ca-30de035019cmr53207541fa.31.1743581594610; Wed, 02 Apr 2025
 01:13:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250328143646.27678-1-johan+linaro@kernel.org>
In-Reply-To: <20250328143646.27678-1-johan+linaro@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 2 Apr 2025 10:13:03 +0200
X-Gm-Features: AQ5f1JoGfVJ9ts98vDCtSYScI8e3HIFmZAN4o5AGXV0GNmnQTKivDH_VGXOT9Xk
Message-ID: <CAMRc=McRPmWu4q9EqYC_3wDCKoniu7Rf308SsKrbCk5rbopFwA@mail.gmail.com>
Subject: Re: [PATCH 0/4] PCI/arm64/ath11k/ath12k: Rename pwrctrl Kconfig symbols
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, ath11k@lists.infradead.org, 
	ath12k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 28, 2025 at 3:41=E2=80=AFPM Johan Hovold <johan+linaro@kernel.o=
rg> wrote:
>
> The PCI pwrctrl framework was renamed after being merged, but the
> Kconfig symbols still reflect the old name ("pwrctl" without an "r").
>
> This leads to people not knowing how to refer to the framework in
> writing, inconsistencies in module naming, etc.
>
> Let's rename also the Kconfig symbols before this gets any worse.
>
> The arm64, ath11k and ath12k changes could go through the corresponding
> subsystem trees once they have the new symbols (e.g. in the next cycle)
> or they could all go in via the PCI tree with an ack from their
> maintainers.
>
> There are some new pwrctrl drivers and an arm64 defconfig change on the
> lists so we may need to keep deprecated symbols for a release or two.
>
> Johan
>
>
> Johan Hovold (4):
>   PCI/pwrctrl: Rename pwrctrl Kconfig symbols and slot module
>   arm64: Kconfig: switch to HAVE_PWRCTRL
>   wifi: ath11k: switch to PCI_PWRCTRL_PWRSEQ
>   wifi: ath12k: switch to PCI_PWRCTRL_PWRSEQ
>
>  arch/arm64/Kconfig.platforms            |  2 +-
>  drivers/net/wireless/ath/ath11k/Kconfig |  2 +-
>  drivers/net/wireless/ath/ath12k/Kconfig |  2 +-
>  drivers/pci/pwrctrl/Kconfig             | 27 +++++++++++++++++++------
>  drivers/pci/pwrctrl/Makefile            |  8 ++++----
>  5 files changed, 28 insertions(+), 13 deletions(-)
>
> --
> 2.48.1
>

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
