Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2945BBA34;
	Sat,  1 Feb 2025 19:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738438491; cv=none; b=JnMMR5H+A9UH3sSYVeSj0HEQqNCegqCpjG7XNTGSKKUCb5QIUe8OkfPHeIex79G5lFphJOGHLCWTVS6skS6aI6aVFdeqKS6IBqb1rEX/3ZFdyqOJ746g70eRaQn7bDEcGhPNgO5YLGO0Sox9RkXbow5FW08oCWN2NIlS8Hhfy8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738438491; c=relaxed/simple;
	bh=i4/W2OgcvhJahRYbMhMmclq8ngFw6aTVHUcFCFCdR6U=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:Cc:To:
	 References:In-Reply-To; b=ET0JzjnaNbaFFeBkx/7nO+WmVwZUpMXoadAwtVvMepQRcXOKowmyHpPdxF3tT/K4MeNHuXL0yEBBYHaJh9T2gxRowZ2b4w4RsYUwSW2wZeDe7+WNZg6Hz6Sn0qQtPIcejuQwQ3EjL1wXw+CC/jnbo8DC5Cw1yGxj7IMAXy8C4yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=qQ7llyaV; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="qQ7llyaV"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1738438483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BfG3HrCxqbeW5d3xVI8UwlzmsQZXhlzTGj9IMuqNOT0=;
	b=qQ7llyaVhB2SxjVamAxxz57OJpCMdoc1XoqY7AqFyGnlmhKa5nxkzO9EYkQHqCUebYZw+l
	+t74MgRSaJHqcCP6CUSfDc1JZLug746pseESsF/C00HDMv2FCLLCoo2dL8p8wROnNGKHZP
	k7m1zrXwUmm3OcGxLeAYoXtoTlEz5Ov730JEGpA01JlUMnLIKUCjcDvabCH0UB+V1/JmyR
	7k4cjAAV/6fuxznNjXCBPzpPHV5EO4rWtdSIuaFsIDwTLVaQlafkmYLHh0kItGjZILBaaU
	Aw/x5eocbnHbN2C4cUEOlPMU59/mQ+mPr3tYEnis3TWXRJCtpDKNZYs30jm82Q==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 01 Feb 2025 19:33:56 +0000
Message-Id: <D7HCZSPU5TZH.MEWHEM6398EB@postmarketos.org>
Subject: Re: [PATCH 0/2] Add support for Xiaomi Mi TV Stick
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ferass El Hafidi" <funderscore@postmarketos.org>
Cc: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <~postmarketos/upstreaming@lists.sr.ht>,
 "Artur Weber" <aweber.kernel@gmail.com>, "Karl Chan"
 <exxxxkc@getgoogleoff.me>
To: "Ferass El Hafidi" <funderscore@postmarketos.org>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Kevin Hilman" <khilman@baylibre.com>, "Jerome
 Brunet" <jbrunet@baylibre.com>, "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, <linux-amlogic@lists.infradead.org>
References: <20250131200319.19996-1-funderscore@postmarketos.org>
In-Reply-To: <20250131200319.19996-1-funderscore@postmarketos.org>
X-Migadu-Flow: FLOW_OUT

Hi,

On Fri Jan 31, 2025 at 8:03 PM UTC, Ferass El Hafidi wrote:
> From: Ferass El=C2=A0Hafidi <funderscore@postmarketos.org>
>
> This patch series aims to add initial support for the Xiaomi Mi TV
> Stick.
>
> Xiaomi Mi TV Stick is a small Amlogic-based Android TV stick released in=
=20
> 2020, and known as `xiaomi-aquaman` internally (in the downstream kernel,
> u-boot, ...)
> Its specifications are as follows:
>  * Amlogic S805Y SoC (believed to be mostly identical to S805X)
>  * 8 GB eMMC
>  * 1 GB of RAM
>  * Android TV 9, upgradable to Android TV 10
>
> There are multiple variants:
>  * 1. Green PCB, manufactured in 2020, known UART pinout (helpfully=20
>    labeled on the board)
>  * 2. Blue PCB, not much documentation about it, presumably manufactured
>    between 2021 and 2023
>  * 3. Green PCB, manufactured in 2023, known UART pinout, some layout
>    changes compared to the 2020 variant
>
> Among these variants, there are many boards using multiple different
> Wi-Fi chips.  Supporting all of them is out of scope for this patch
> series.
>
> As of the time of writing this has only been tested on the 3rd variant.
> It is believed that software-wise all three work mostly the same (if we=
=20
> don't count Wi-Fi), but testing on the other variants would still be
> appreciated.
>
> The devicetree is based on the Amlogic P241 DTS.
>
> Ferass El=C2=A0Hafidi (2):
>   dt-bindings: arm: amlogic: add Xiaomi Mi TV Stick
>   arm64: dts: amlogic: add support for xiaomi-aquaman/Mi TV Stick
>
>  .../devicetree/bindings/arm/amlogic.yaml      |   1 +
>  arch/arm64/boot/dts/amlogic/Makefile          |   1 +
>  .../meson-gxl-s805y-xiaomi-aquaman.dts        | 311 ++++++++++++++++++
>  3 files changed, 313 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aq=
uaman.dts

Superseded by v2: https://lore.kernel.org/all/20250201193044.28856-1-funder=
score@postmarketos.org/

Cheers.
