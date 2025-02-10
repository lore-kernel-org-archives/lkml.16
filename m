Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B48199E80;
	Mon, 10 Feb 2025 08:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.91.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739177400; cv=none; b=H70t8sbW/9sGGFRlds+p2Go31SpkzQQRP0EjyXQ6SGn6lCtSvKHRFmGHE+k14vrIOwX1Q2rPzkYyIsL/xhdovMxz88ocEbmOoo5pziRvHwlaPqn0aEZlRPIeLlrn00v02ljyRFiW34TGW8Onfqe3f2UdUv84NeuZL1q4u0mUvOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739177400; c=relaxed/simple;
	bh=CrwKdj1J64f6M78bkyEmzP25ZI9WQ9q/zjaw5yN6R+I=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=TuoGJbg+tCu4vONYqgzy5IDCOkr17u3sEGL1jpWJ2orlxi69JznFTw2SLXnt4IJ6jJT18KRPRIKjotLQokYEpXXx9AtW/BrjKwjzF63ULERx/gH+8ySB0xksomItIFcC03FngkS4DGLIKGTNgVXFrI3mviie27CgaLXv5Bi+v3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=apK48Z2K; arc=none smtp.client-ip=116.203.91.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="apK48Z2K"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1739177396;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B79H1R61oCw4NxuugBEJsuBD9DKQfMNqY967OoXnNoM=;
	b=apK48Z2KD7nszxtxErgLqwgEi+u7UGYAoEYij+0rfYm+e3gpvfskVtACBWuzwTEYgckVeP
	Hn6m11CA+hcvNMHyvvlc2MeTDy0jzR/5/iIFarkW+eykEh2dsU8TgfMRyv076BXg53AgD1
	44A1biG4oOdkXtjXs1XfhGXmM4UYxGh50LW7KlPXZBj/tWGPspbo8kWRCstNx5PGBOleiU
	9jycWpdbzzHVa+mRGPMJgYBMk6r7HGMr9Gue8KJtnL80/kFLjy4yfA1DmUk4pxzR0b46O1
	oMN1Ox0PSoj99ylwOVQsPWo4APzCXbnztldvtOLMoKxsyL8C4aDEBQ8XnAJSYA==
Date: Mon, 10 Feb 2025 09:49:56 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Quentin Schulz <foss+kernel@0leil.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Jagan
 Teki <jagan@edgeble.ai>, Niklas Cassel <cassel@kernel.org>, Michael Riesch
 <michael.riesch@wolfvision.net>, Jonas Karlman <jonas@kwiboo.se>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Quentin
 Schulz <quentin.schulz@cherry.de>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 3/4] arm64: dts: rockchip: add overlay tests for Rock
 5B PCIe overlays
In-Reply-To: <20250207-pre-ict-jaguar-v5-3-a70819ea0692@cherry.de>
References: <20250207-pre-ict-jaguar-v5-0-a70819ea0692@cherry.de>
 <20250207-pre-ict-jaguar-v5-3-a70819ea0692@cherry.de>
Message-ID: <adbb6ac05bd21ab7be9bec664587469b@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

On 2025-02-07 16:20, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> According to commit 40658534756f ("arm64: dts: rockchip: Add rock5b
> overlays for PCIe endpoint mode"), Rock 5B can operate in PCIe endpoint
> mode. For that to work, the rk3588-rock-5b-pcie-ep.dtbo overlay needs 
> to
> be applied on Rock 5B base Device Tree. If that Rock 5B is connected to
> another Rock 5B, the latter needs to apply the
> rk3588-rock-5b-pcie-srns.dtbo overlay.
> 
> In order to make sure the overlays are still valid in the future, let's
> add a validation test by applying the overlays on top of the main base
> at build time.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Niklas Cassel <cassel@kernel.org>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
>  arch/arm64/boot/dts/rockchip/Makefile | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile
> b/arch/arm64/boot/dts/rockchip/Makefile
> index
> 02f98abe1df10f44f2ac27ea5f6c6e6c6334724e..8f93e0c4d6032d0ca2d93f44384c027e53aa5efb
> 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -196,3 +196,11 @@ rk3568-wolfvision-pf5-vz-2-uhd-dtbs :=
> rk3568-wolfvision-pf5.dtb \
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6a-wifi.dtb
>  rk3588-edgeble-neu6a-wifi-dtbs := rk3588-edgeble-neu6a-io.dtb \
>  	rk3588-edgeble-neu6a-wifi.dtbo
> +
> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-ep.dtb
> +rk3588-rock-5b-pcie-ep-dtbs := rk3588-rock-5b.dtb \
> +	rk3588-rock-5b-pcie-ep.dtbo
> +
> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-srns.dtb
> +rk3588-rock-5b-pcie-srns-dtbs := rk3588-rock-5b.dtb \
> +	rk3588-rock-5b-pcie-srns.dtbo

Looking good to me, thanks for the patch!  The employed approach was
already discussed and commented in detail in the v4 of this series, [*]
so please feel free to include:

Reviewed-by: Dragan Simic <dsimic@manjaro.org>

[*] 
https://lore.kernel.org/linux-rockchip/a3b98e3d3a2571ee75e59418bb3b6960@manjaro.org/T/#u
