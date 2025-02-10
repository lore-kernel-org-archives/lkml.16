Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54C41B6CE9;
	Mon, 10 Feb 2025 08:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.91.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739177336; cv=none; b=bZKEslarTmsMx0IUgGanIbNvB/PHwj3ZJRgzNan3RWNa8gxPEbKvqYooEXkhvJLcRjFKtPbgiEB6gSCkAAWR2I/iyUjKkfBaiE+tpw2LeC1hVSQ2pEGG1zz3rfJ2uxVNyPV8PhE4L1sX7DjFKxgBf0MwK7MPrB3MeFHTAT0tJAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739177336; c=relaxed/simple;
	bh=gRcNiTEcuYFfKLjcXhyfHL+we0NYJGDxDzmjHZDt+KE=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=I900RjxkiVAVSy8NsUNQwPueOWYWNhV/3NiC6CNuskkcGJSAWSi2ElGE/e0epnOfZYxZY21vgxXuS7w1+WFVTSi9x2d6jBI+XOxGdgChhsyCuVqZAA2yYrRix73PQsC9tC0d1LJR8KF2ReAxyfpHVUoDi9n9n1RITXz2WQ9tAdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=gTcXMdx4; arc=none smtp.client-ip=116.203.91.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="gTcXMdx4"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1739177332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z0j1PVoZB6Ql7hiQyhj5xEKSpBifXanaUb/D+ARkh3U=;
	b=gTcXMdx4Inr6Zx9/s7Ch/swcker0C0Rw3/DnT3sassIr++zWUyzWXDsr+m1druPPQkrRk+
	JVzPWZwBUQ/0lLAZVr3O/IVTiqQV9X+3eTQbIMpDfh64aKCWdaBgRualv6ymr8lbcpuuun
	igqKiKXlu4Lwp0Rq/DICyDb3V3B/l2kWvGWPuelNRi8IcWzx0FRbFQajSaMS6PYaSVK09U
	505ZSPdwynIk9mtZt2WiF+PEC+rEVr5nQFF/uKLUuJ1KSpUsrR9RqJsE0CQN5mwARjY/8S
	H5vpydG+KF3npUo2t3+r8eVJReK5X0Kc2QU+0dVRaeqYU1qR0f2llJ1YHfwuKg==
Date: Mon, 10 Feb 2025 09:48:52 +0100
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
Subject: Re: [PATCH v5 2/4] arm64: dts: rockchip: add overlay test for Edgeble
 NCM6A
In-Reply-To: <20250207-pre-ict-jaguar-v5-2-a70819ea0692@cherry.de>
References: <20250207-pre-ict-jaguar-v5-0-a70819ea0692@cherry.de>
 <20250207-pre-ict-jaguar-v5-2-a70819ea0692@cherry.de>
Message-ID: <1b10875ed325a42b4cb0a66b3cf1c39b@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

On 2025-02-07 16:19, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> The Edgeble NCM6A can have WiFi modules connected and this is handled
> via an overlay (commit 951d6aaa37fe ("arm64: dts: rockchip: Add Edgeble
> NCM6A WiFi6 Overlay")).
> 
> In order to make sure the overlay is still valid in the future, let's
> add a validation test by applying the overlay on top of the main base
> at build time.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
>  arch/arm64/boot/dts/rockchip/Makefile | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile
> b/arch/arm64/boot/dts/rockchip/Makefile
> index
> 534e70a649eeada7f9b6f12596b83f5c47b184b4..02f98abe1df10f44f2ac27ea5f6c6e6c6334724e
> 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -192,3 +192,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) +=
> rk3568-wolfvision-pf5-vz-2-uhd.dtb
>  rk3568-wolfvision-pf5-vz-2-uhd-dtbs := rk3568-wolfvision-pf5.dtb \
>  	rk3568-wolfvision-pf5-display-vz.dtbo \
>  	rk3568-wolfvision-pf5-io-expander.dtbo
> +
> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6a-wifi.dtb
> +rk3588-edgeble-neu6a-wifi-dtbs := rk3588-edgeble-neu6a-io.dtb \
> +	rk3588-edgeble-neu6a-wifi.dtbo

Looking good to me, thanks for the patch!  It was already discussed
and commented in detail in the v4 of this series, [*] so please feel
free to include:

Reviewed-by: Dragan Simic <dsimic@manjaro.org>

[*] 
https://lore.kernel.org/linux-rockchip/a3b98e3d3a2571ee75e59418bb3b6960@manjaro.org/T/#u
