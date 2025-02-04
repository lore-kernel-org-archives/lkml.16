Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77FC14A4F0;
	Tue,  4 Feb 2025 11:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.91.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738668662; cv=none; b=W+owU0gfqTt28W9y2H7ZYbuaxTRjDs7/25VZy4ptN+2nriNiT0o/y+XY0EHF8Cv4dy3JFh7yNvYcW2auzX3O0N6YrQdTytsSnIqsVqSdUlJWPOE+GOu78O3dqnuMRQRml/6bL4rT4H2URZ2WCFd2dEv8O+NOnIp+xV3slUMNAOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738668662; c=relaxed/simple;
	bh=f5HFvIdNi4O3uif682xT4pifMyF0HEkwYJoK5hIi9T8=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=dNNPdQR+gyitPpBU7EuBiJmaxetK0Kxxd6BSVLEZJt7WG5OJ6OWGrSeEzPeSJ24jO+c8TiBDxmpc+ghY4EVqtqxvomXkqHqW4hYwTjbcCFghLP8BDHvNA5gutp7R+zlbRa0QFyw28RqcQT6bVm2NyQjuAQ9yr9TBLNfUcnKePzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=VwNSkxld; arc=none smtp.client-ip=116.203.91.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="VwNSkxld"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1738668658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T0ByFQ1hfW7/1rl9uUZJmLCdb3tgomr5Qb5aE/AvrfQ=;
	b=VwNSkxldkoL/CDcEHD9jZJfQTdQ47coBYK0EPMRHI4bJUy28UlVOhmdoDPCZKyyvqmy54e
	TsczfWyHbPejwr69j7cemJBteYrz2F31ECEvkuvrzhMs2l0YJGlx9FU4QnckKYDrbMzXBH
	ZD5caEb8HCPGpGcmML7+yYKDCsSjx1ZD7nvRI9HWNW3H2jwNIwJLG30yxpPjhqORw/Imwf
	kw+6FjCeRB1zf0V3PhZMb6jGBTbgKNzcCUDwnJV6kmNH3iCwIECgUWxPtWX+pjUYvzCnA6
	CctHHSWNHL6nn2qkeo24+RR5YRFZYeo0Ms3QghqPQqLD5yuTKRQ78ZUmf9t6KA==
Date: Tue, 04 Feb 2025 12:30:58 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Quentin Schulz <foss+kernel@0leil.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Jagan
 Teki <jagan@edgeble.ai>, Niklas Cassel <cassel@kernel.org>, Michael Riesch
 <michael.riesch@wolfvision.net>, Jonas Karlman <jonas@kwiboo.se>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Quentin
 Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH v4 1/4] arm64: dts: rockchip: add overlay test for
 WolfVision PF5
In-Reply-To: <20250131-pre-ict-jaguar-v4-1-c971e2852e8d@cherry.de>
References: <20250131-pre-ict-jaguar-v4-0-c971e2852e8d@cherry.de>
 <20250131-pre-ict-jaguar-v4-1-c971e2852e8d@cherry.de>
Message-ID: <78c91324ff7b2a8e8f0d32b8e84b01e8@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

On 2025-01-31 11:40, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> The WolfVision PF5 can have a PF5 Visualizer display and PF5 IO 
> Expander
> board connected to it. Therefore, let's generate an overlay test so the
> application of the two overlays are validated against the base DTB.
> 
> Suggested-by: Michael Riesch <michael.riesch@wolfvision.net>
> Reviewed-by: Michael Riesch <michael.riesch@wolfvision.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
>  arch/arm64/boot/dts/rockchip/Makefile | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile
> b/arch/arm64/boot/dts/rockchip/Makefile
> index
> def1222c1907eb16b23cff6d540174a4e897abc9..bba9b2f1c761040545bea561878e9b63f8c29488
> 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -128,8 +128,6 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-roc-pc.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-rock-3a.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-rock-3b.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5.dtb
> -dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-display-vz.dtbo
> -dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-io-expander.dtbo
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-armsom-sige5.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-evb1-v10.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3582-radxa-e52c.dtb
> @@ -170,3 +168,18 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += 
> rk3588s-orangepi-5.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-orangepi-5b.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-rock-5a.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-rock-5c.dtb
> +
> +# Overlays
> +## To build one or more overlays, overlay application tests must be
> added below.
> +##
> +## dtb-$(CONFIG_ARCH_ROCKCHIP) += <name of overlay application 
> test>.dtb
> +## <name of overlay application test>-dtbs := <base>.dtb
> <overlay-1>.dtbo [<overlay-2>.dtbo ...]
> +##
> +## This will generate each individual DTBO listed as a dependency of
> +## <name of overlay application test>.dtb **AND** make <base>.dtb keep 
> its
> +## symbols (like when DTC_FLAGS has -@ passed).
> +
> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-vz-2-uhd.dtb
> +rk3568-wolfvision-pf5-vz-2-uhd-dtbs := rk3568-wolfvision-pf5.dtb \
> +	rk3568-wolfvision-pf5-display-vz.dtbo \
> +	rk3568-wolfvision-pf5-io-expander.dtbo

Obviously, virtually the same comments [*] I made on the patch 3/4
from this series apply here as well.

[*] 
https://lore.kernel.org/linux-rockchip/77b5d0efa6e56bb391575aeeb4d1be80@manjaro.org/
