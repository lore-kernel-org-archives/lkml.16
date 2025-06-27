Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40CF2EACEE
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 17:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751047021; cv=none; b=YgeRK6cwhGHW7i0RHXL/PmByQckLMmIdEfxSifJHKfuJ7TOd2jgEZMUHmWCV20XrvSyc4zdiODpT+joytkX0CL5I59Ci0f7DV/3E9m7kFIs+3sha7Iw7Vkyp2mwQcAunv9qQUX5vUueo5SpXpMLDJ7agAOHmeuZVO2+SQhmjzPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751047021; c=relaxed/simple;
	bh=czkJe6P8edZl5EJS+azo4RH37Yqc0TlWj4Ti1g4vPok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mx+TT0fuJ2WkE2eYj6Zq4GnrrxzMiTaSyRPgYqovfEZEN/nPHDHykFEfNJLmvgVINWUl8XYMyt1GovLhunqFUQnkiYGFV/qCOI36KXF6ySZypy+4M2EzRGskkUlh0afhHztiKrhsPStHo695HFdpfKwqlTdC/Wxt6DZcAyCLJQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com; spf=pass smtp.mailfrom=gateworks.com; dkim=pass (2048-bit key) header.d=gateworks.com header.i=@gateworks.com header.b=TcGQxK0L; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gateworks.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gateworks.com header.i=@gateworks.com header.b="TcGQxK0L"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6065251725bso98178eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 10:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks.com; s=google; t=1751047018; x=1751651818; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rbuYeB/znMRVmNnp22re7GbKA0GoKXipcQWP3fhXkwI=;
        b=TcGQxK0LL1xmK+4WgMNJK2tg+QT96agnb/e7l3rrHyLhmsr3ZhC+vx3yHCJNIchnFB
         PBR93wKQLUhXU92rIy0fSJlqdawjEz+7UIeTjD6S2Xb1N8AKkOZBqEht6KTzDiadTeoI
         WIj4GVmOyDGr1T1xMBJAKIks1Rlo/XS6HhZf6f/yQOwHlhEV9id1iPq7CO4Fr43Unpu+
         iUO58ayVWqHdw7pvIlNWvTsVbK9ja/vmYtdnNEJYQd0vdJn/eE0SA0YsS2alXIFT06Ly
         lto4TTlYLpMXGoKJlxXXx1YUvevfPav/OhxqF1E47b00rkf03PxneRwvGTercQSAKuxI
         51mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751047018; x=1751651818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rbuYeB/znMRVmNnp22re7GbKA0GoKXipcQWP3fhXkwI=;
        b=miVee0Zjp8OZP9cKYikKE0nqQjb4TmoKf+5305CUwXxeIeKVWMAtiR9qExpHdJ3OoZ
         9E1kF2iKVBmLNzihCt49hyDToirNmzRkB8gxXTt9aku2FaR2btzYD8dmFn7cPi6o5Zlr
         oH2RzVREoCiYauJkVyfN3nJP5lgxA42MRZ2sLR1QI08F7kmSa+bwBC5qGeuV0YBNONmx
         fXvdhnGf6jjd2rPCX8pwB8nyrJIMm6tHQ7TdSJtI2dc9y12N5Bgpvs5WCvmmgfKveiXX
         CUbsgF2vIY/uAiQC0+qIiOrmH/R6Zzjnm+i3qj3D7HFEvI7+7SjWflrQKr/vvRfVAeGb
         G3vQ==
X-Forwarded-Encrypted: i=1; AJvYcCUA39YnfLYx2p715EdDmN7NLEceJ2S/iRGR48mPWzXmvJ0tUcI/2wyP1GCdSqVJD/tbeua/dX/3lXIVVzI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxO3eunSp3WifeCOegepd7mY73IpvE52ZcAKtFd0S/CT98NCMr
	79y2lWmfO3VCcXi8T2WNb4mupwQaVu/kak6hkUVHXnyrDVNTTk1uYtjXlf10nzvgeVOsYadw4Mq
	qwkl17duJpw1NET70rONbuS+dq+hJzVRbEHnHSBQm/g==
X-Gm-Gg: ASbGncuqY205Gryh5NbYLjlWxSDb2XimyIalDTIXHvg9fPiK+Ru6gvPDGCPFMtudgaU
	ka59mUaXmmgyRaAS6tvRYgkoD3OqNa11B9FnWFbbj4DfOzMNR/0fxgks6gyTNtLRe/5mLIDqnDL
	+vimdKctBgtFrxlskjAdWlZyRtz6HGNX/rQ8mk4K7BGZUtNKQuVLN9Gw==
X-Google-Smtp-Source: AGHT+IHn/O+yw4sdAQD7guPzO4j4/3MQOR3FH8Nb/hBYMQX3XW0mdG4bsbuqDOKcybzRbPj3Ume9tDS47O4jmJlhfy8=
X-Received: by 2002:a05:6820:994:b0:611:b561:258e with SMTP id
 006d021491bc7-611b90965aemr2849488eaf.3.1751047017799; Fri, 27 Jun 2025
 10:56:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620213447.56392-1-aford173@gmail.com>
In-Reply-To: <20250620213447.56392-1-aford173@gmail.com>
From: Tim Harvey <tharvey@gateworks.com>
Date: Fri, 27 Jun 2025 10:56:46 -0700
X-Gm-Features: Ac12FXwaCCVUyBeRU0CpBhDP3QxyDWYKIvfZAtJZ7SnZG3kcRW-1EnKbWFLlM-8
Message-ID: <CAJ+vNU0caeeC6in5dO_jkkbYNAnTL7drBZcmNBsstbrPWqUkHw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: imx8mm-beacon: Fix HS400 USDHC clock speed
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 2:52=E2=80=AFPM Adam Ford <aford173@gmail.com> wrot=
e:
>
> The reference manual for the i.MX8MM states the clock rate in
> MMC mode is 1/2 of the input clock, therefore to properly run
> at HS400 rates, the input clock must be 400MHz to operate at
> 200MHz.  Currently the clock is set to 200MHz which is half the
> rate it should be, so the throughput is half of what it should be
> for HS400 operation.
>
> Fixes: 593816fa2f35 ("arm64: dts: imx: Add Beacon i.MX8m-Mini development=
 kit")
> Signed-off-by: Adam Ford <aford173@gmail.com>
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi b/arch/=
arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
> index 21bcd82fd092..8287a7f66ed3 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
> @@ -294,6 +294,8 @@ &usdhc3 {
>         pinctrl-0 =3D <&pinctrl_usdhc3>;
>         pinctrl-1 =3D <&pinctrl_usdhc3_100mhz>;
>         pinctrl-2 =3D <&pinctrl_usdhc3_200mhz>;
> +       assigned-clocks =3D <&clk IMX8MM_CLK_USDHC3>;
> +       assigned-clock-rates =3D <400000000>;
>         bus-width =3D <8>;
>         non-removable;
>         status =3D "okay";
> --
> 2.48.1
>
>

Hi Adam,

This caught my interest. Where in the IMX8MMRM do you see this and
would it also apply to the IMX8MP? (You've patched your IMX8MM and
IMX8MN boards).

Have you encountered any issues when running eMMC at HS400 due to this
or is it just something you noticed in the RM more recently like with
my recent patch that lowers SPI clock due to an obscure RM note [1]

Best Regards,

Tim
[1] https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=3D96=
5976&archive=3Dboth
