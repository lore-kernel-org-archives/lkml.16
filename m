Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3349222ACF7
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738750743; cv=none; b=s3TTx2fYoHb+Rxh6CZGlk+kbu0cdQ6XIZGhM2YBtfhCj6q/vNLw4yLtrEuVceZ3vGNnUKhrEFpAyhyxT56X/CTakCgoyyk9JBChANs/TZsDtuxHnlFCsF/vX1uVgoMI11IearbQtf1yAkOMESL5jWoLqZJOpRtc3WAjx1RbsY7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738750743; c=relaxed/simple;
	bh=KH5IH78p9vo/PXm3xnmdcXmgu0/0wfHUy9rjQhzDvlE=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XCQR6X1IXynwODA6I5XxIjbp7FfmnrLqNBBaX2TW38pbNz4LaJ4xQqlavbfkQhor87mAcSAdd0idtSengijRz1bJQZENO3P26+rItKmrgG39iA+Bnw8qt6LSjocIuTrdKkeFmZPRG4oB5lIcYOG0XKlou1CqaLB0bNFYCfUj0+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=k4VLtuWS; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="k4VLtuWS"
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 960333F85B
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738750739;
	bh=qdkmBfYX7XaFvkbF82y8TuYeK5Pl9Wtpk+6BoGjJ8iE=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=k4VLtuWSQRs/8uYBGxLp+arP3XPQprBigvNxph6xLBgIitDLIAzWJnyNmLsN+P2D3
	 cpmJDALZ9WDZlpARZc15NTdP0n7pkDVEhWssJi1CC7Q5osLDHvIdzWNEhq6EAV84sh
	 nEsCp9dfM1OZDLvWjRzV6ydQ0Suu41BZrbOgYqsr84gZO2iPPje21WnjaC9JpvT1mM
	 tIvBWpJknA2mbNb3aG1W7bw0dAG57FtdylYxkQPXalH1sZHp9XFqg6d5p4FzHKOLyw
	 yfUvBHCcb6So7F09L3RoxNlGeu7opik10qU5T5Q6oNClouijf3O58AW7m5T7LtJoBs
	 Gu1JyxvScLZow==
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-2b81005da56so226565fac.0
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 02:18:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738750738; x=1739355538;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qdkmBfYX7XaFvkbF82y8TuYeK5Pl9Wtpk+6BoGjJ8iE=;
        b=A6MoAcbTqBSBrFeqYtBhNT820rpRNRMABOBw+qu5r43ENsjP16BzWOHw7MzK4UgMb+
         JRWyVUXHM0ZqR0D4kF1QrzBu5zLv6WQ/AgM7tfwD7zsmit2M83JrBtuaf3AH40ruhKC3
         PfLavFx7XNPtznqA1liAVh3gfk+6+OUckGFUXUDz2a7Sa1EHLWOKIvafedXv+Vcby+dl
         JymuMn5wxEsHcrTh49kr2CxbkUck5SifAxHY7hwlSlTnXPER3vtDiPi/Af/yVJ2zVA6q
         5jRx5jtEzkh9S7yxngADANUQaY2+TfrqMQLNRcvGsuLnl6nvx32Z+S6GSCcJ1Dr43gBv
         Hiqg==
X-Gm-Message-State: AOJu0YztavLPJb9jvtwQfbtVwQXKVierKLJ6kJXgqhAwYkIXtR9PQbv9
	LmU7jbZ1iqYDYZYW45Gxy14hjrGrOczeMwGUaHH14cSKlqcmf7Up8IN/mxf9wm+dmi122aJOej3
	uPVUiSR43x99GH3uCuOTWVk1zzUMDMO5/Tj2EedPU2as6yDuff5OKASC1tkmlTX5E2POiQsvMp2
	oM5oD1Jw2fIMyMwi7ybi+U2m30GOzy5/UKrPhczhKnUFXE2ucht8uh
X-Gm-Gg: ASbGncszzB0Eb2NsQ58tiBeBktVEF03M80zuvYCYvrfMGYnOSY8BwhEq3OqnOrRWLrX
	5t5IpOuUE2jfq3jzhEJqxIf1lHtLV1A+p24eOzycm17aJ05SDhxS8JpF+J/gpZ7XcS5FRTdXHns
	qxdf+3hmHfm1ecgEI=
X-Received: by 2002:a05:6871:e084:b0:297:285e:f9f4 with SMTP id 586e51a60fabf-2b8051adca4mr1499630fac.34.1738750738564;
        Wed, 05 Feb 2025 02:18:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF8qpmyypodVkKYUm5sF+zKulTYncfI/CugaO758DUSia69BHhLRf7V5DXO6RaNISNiLy1Da5yWB2DzQ0HOlGA=
X-Received: by 2002:a05:6871:e084:b0:297:285e:f9f4 with SMTP id
 586e51a60fabf-2b8051adca4mr1499615fac.34.1738750738324; Wed, 05 Feb 2025
 02:18:58 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 5 Feb 2025 02:18:57 -0800
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 5 Feb 2025 02:18:57 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20250203013730.269558-3-e@freeshell.de>
References: <20250203013730.269558-1-e@freeshell.de> <20250203013730.269558-3-e@freeshell.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Wed, 5 Feb 2025 02:18:57 -0800
X-Gm-Features: AWEUYZlXlKzbHypA-jASfEJOP33KWqL31P4KBU9ridEeOOm8C_Po6yFU92yHqVE
Message-ID: <CAJM55Z9s4FMCmGaGPGBdcJWxoTNO1gupMLAq2a1fExiho5W1jw@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] riscv: dts: starfive: jh7110-common: qspi flash
 setting read-delay 2 cycles max 100MHz
To: E Shattow <e@freeshell.de>, Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Hal Feng <hal.feng@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"

E Shattow wrote:
> Sync qspi flash setting to read-delay=2 and spi-max-frequency 100MHz for
> better compatibility with operating system and downstream boot loader SPL
> secondary program loader.

Here you should be explaining why these values better describe the hardware. To
me this just reads as "u-boot does this, so let's do the same" whith doesn't
really explain anything.

/Emil

>
> Signed-off-by: E Shattow <e@freeshell.de>
> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> index a5661b677687..8a59c3001339 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> @@ -317,8 +317,8 @@ &qspi {
>  	nor_flash: flash@0 {
>  		compatible = "jedec,spi-nor";
>  		reg = <0>;
> -		cdns,read-delay = <5>;
> -		spi-max-frequency = <12000000>;
> +		cdns,read-delay = <2>;
> +		spi-max-frequency = <100000000>;
>  		cdns,tshsl-ns = <1>;
>  		cdns,tsd2d-ns = <1>;
>  		cdns,tchsh-ns = <1>;
> --
> 2.47.2
>
