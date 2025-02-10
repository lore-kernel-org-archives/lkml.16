Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C6719F103
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 06:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739168626; cv=none; b=hO/KlCzGnyChvzhaO7QPqjCpyZjDxVdlomIRHyAKGgHESICGFtdyHYvxgAdR24xCom0yK0hKpPAamPPN/n/IuXEmx2DdAzGAfGQ6D/hg0KL/SNzYGq8ied0HdxIoJ/aamaaAgIw//e+arTznZldhXTNQnQTo+5tybDkiaBd0Ud4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739168626; c=relaxed/simple;
	bh=sSWmWND7PMCagtRzqn+MwQqanUhItf4e7rsAwo9DNSA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qrtGtITa2X+RByb17eRpUWN3/b/DADuvcTaJeulyIeLLEV/5AgDmtGcDGL4+iw75AYllyxw6YbEhiDfUdyVDtbXgrk6iLch+WAk7kKenpu5BtIOszkjtb5i7x5EW6ZKUtfmWSB2K3HJW0ThiyoufRk1RUl5Eifw/zEffa43fpYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J+5ftA69; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J+5ftA69"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5f6497fbccbso3085040eaf.0
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 22:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739168623; x=1739773423; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FDzwE1C9OW6aHE1z2WW5gUQXUKZ/REkoyeXBwX2ZCXo=;
        b=J+5ftA69lCY9REWqPPJFTtih8kmxBOcA1knbCG1JqiHq2KDeYxBSBkWVLelSPkRH2c
         XdvMPQsn4VQGDHGeCb8jZnge0nW+i/vm5VG4hEoFTjQPvwKbcB6RjWInEP7Epg0hF8vF
         IpWWE3plpkTLWmB0phvYe/CzOjRdVouy9TR5KOnGcAQXNlLFNBt/HgCwlxuwugYR3wvU
         ZmkiIO0G/EeOVbfZfxfDg8L1/7og24NDzv1BtWd6BB1ji+gUatrrdCvn853VZwcuSiP8
         PZ/6k45v8ma0fOLlNbKjgOeT4Co38yzefA9KPP5iYRaTLTs9z8+amhSUEvJcegDcOCyx
         vaMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739168623; x=1739773423;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FDzwE1C9OW6aHE1z2WW5gUQXUKZ/REkoyeXBwX2ZCXo=;
        b=Bdqv38e0n2sqH1VmOCB6mrmLSigzszdfnKsDOvus+SYOpL2VBCAOYGS0DkkjIIbzK/
         Ar2bLV5930Fh2Blbv00lRVfBUhxnwq82/r7T+iDFSEFkgL7zBlvjfwZQEbtumw5YjU2Z
         OYIRCu9Nla2cEOzPpSIeblJzU5ixJIqQH35KKe0uhbmzMad7N0wbrVpZi6nvHZGKXmsn
         YrWUZMpxrBiVYqWeic4lAugSFMqlFmAvTYxEA98VnM06WluMUkbCwQGeFhcBc0yxQp/d
         mqtTUaV6ZYkmpoMO4GS9xcW1VjS58slZjekBERuc1QMsPCxHIYuRM7GGaEGbZvhJrdSm
         O6Ig==
X-Forwarded-Encrypted: i=1; AJvYcCUd6zzyP65b312z4R3VvzwVZBfPl/Nl9Q7AQ1cPjCdtEoGV4mkMcCujF75d+UFsfHggRtFa6+E4K5SkYQ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCpdNNORxRxVgfYOHHYBY4uxSs4V9F5CPvebma4pBZiVgiXA5l
	Jgffo/bAUY4TIkeqA4rDXudq/j1jfgY4d8a3DN15yD1vSl0yx6cErCrLQLbo1jkHbq5VA6Rfrxx
	46YyPJ+blyIpihuCXg4Bv7LgLSJcr7sMccz8I9g==
X-Gm-Gg: ASbGncvCrhtdVL1ztUaoJgzAiFInSgIz3/gGNnc+3xqfL0BrkwCT7dA8Lt5/OuHsV48
	62GYCJQ9Eu5unMDL0Q/gK2g7Zvbv6DdSzn0BzUlxX6zWmwxn6YnEh5L6jWVERcnmFatBpeALpsg
	==
X-Google-Smtp-Source: AGHT+IGZ70BM5o0FsBd1A+vRr7iVndFCpaXO8wXRz7nxGxTT6qFDFTzE/2SfzxTsCk6ZlSydNNQa9XmNNdh8W4sa/LE=
X-Received: by 2002:a05:6871:628b:b0:2b7:5726:c931 with SMTP id
 586e51a60fabf-2b84015e5bcmr7187697fac.5.1739168623404; Sun, 09 Feb 2025
 22:23:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206-gs101-renppt-dts-v1-0-cdfe993fb3c5@linaro.org> <20250206-gs101-renppt-dts-v1-2-cdfe993fb3c5@linaro.org>
In-Reply-To: <20250206-gs101-renppt-dts-v1-2-cdfe993fb3c5@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 10 Feb 2025 06:23:31 +0000
X-Gm-Features: AWEUYZkw_qqo6LotzQULApj6C-Fj8yrQyxpjnxhL_NjpfmlxfYtcYPkHgHvpKlk
Message-ID: <CADrjBPr9k7QnkFzrY_4Q8A-yrQjErVBaHv1x=oOYacCamn4BuA@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: exynos: gs101: align reboot and poweroff
 writes with downstream
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9,

Thanks for your patch.

On Thu, 6 Feb 2025 at 13:08, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> For power off, downstream only clears bit 8 and leaves all other bits
> untouched, whereas this here ends up setting bit 8 and clearing all
> others, due to how sysconf-poweroff parses the DT.

That indeed sounds like a bug.

>
> For reboot, downstream writes 0x00000002 whereas this here ends up
> setting bit 1 only and leaving all others untouched.

For SYSTEM_CONFIGURATION register Bit[0] and bit[31:2] are reserved
and say "type R" (rather than RW for bit[1] so it seems correct to be
leaving the other bits untouched?

regards,

Peter


>
> I noticed this discrepancy while debugging some reboot related
> differences between up- and downstream and it's useful to align the
> behaviour here.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---
>  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/bo=
ot/dts/exynos/google/gs101.dtsi
> index e78dcd506a5c..4f45bfeb33c0 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> @@ -1401,13 +1401,13 @@ pmu_system_controller: system-controller@17460000=
 {
>                         poweroff: syscon-poweroff {
>                                 compatible =3D "syscon-poweroff";
>                                 offset =3D <0x3e9c>; /* PAD_CTRL_PWR_HOLD=
 */
> -                               mask =3D <0x100>; /* reset value */
> +                               mask =3D <0x00000100>;
> +                               value =3D <0x0>;
>                         };
>
>                         reboot: syscon-reboot {
>                                 compatible =3D "syscon-reboot";
>                                 offset =3D <0x3a00>; /* SYSTEM_CONFIGURAT=
ION */
> -                               mask =3D <0x2>; /* SWRESET_SYSTEM */
>                                 value =3D <0x2>; /* reset value */
>                         };
>                 };
>
> --
> 2.48.1.362.g079036d154-goog
>
