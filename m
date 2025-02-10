Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D101E4A9;
	Mon, 10 Feb 2025 08:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.91.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739177210; cv=none; b=gygXXzwTuelM8RWuuRhdHAYlAT61wm95qDnm/aFa4MZObaHL9m0v9hX6yU1Im+Nd/vCV92aIXHGckvZgXmLOrKC1nwsiGyQJ7yQTNiNS+dT7TziXL3POrsz8VohsTmhMps7L/bDRm9o8YVxyFgkgfv1W+geGF1Pj8roOXV7FzM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739177210; c=relaxed/simple;
	bh=/4kXHEmarSCX8A4NDBDloe4JNvYwH+zdYaV0aMf986U=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=G3FiEUgEZdiSZa+M32GLt5LVQHdcHTFJ2Br/JVerDcW3DE751zMu2Q5Y8ci+ozZ60M7j46Rtlw/fuSdFWYlTQYxFMPQj/G+saNFXJhpyI8dHVQ25Baw2Ha6iX85WSUnATEAmILY+ar7e4VkAv2XbE3poAdQJHaBXVSBRksMhZ4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=FT191uYw; arc=none smtp.client-ip=116.203.91.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="FT191uYw"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1739177206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EbyDrglM88cnERsnPEsC1uH+yICet62b/Os+Sq28aDU=;
	b=FT191uYwP/KCBqbxtSSCbsvFflWDIl/xKGmFRAFMLP6eu/VzM1JmnOQ12dNaONnmdu1i6C
	Nqeqz6ASOXJzGJM+UHPA7GbsC7PUZwC5glC+28iIV1fdmpYH5rAqklBDM9l7dbPya125oD
	Te+G1MfM7Fpsuv7AJco/Ow/jSwnsCMyHFOWeXeUVLh7JUa0dQqqfwBXqmsFhDiRXDSeI4M
	LnRtQGV+R876whudS0qA37NElNcG3QeMgnhqr719kysGvj85XGRKc2Vvnot0cjhMTTjtuf
	dG4ahi7DroA2teM7OGL/4275B4d390K0fJwls/6BmtY+VzeufXJ9aH97c8SvOQ==
Date: Mon, 10 Feb 2025 09:46:46 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Quentin Schulz <foss+kernel@0leil.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Jagan
 Teki <jagan@edgeble.ai>, Niklas Cassel <cassel@kernel.org>, Michael Riesch
 <michael.riesch@wolfvision.net>, Jonas Karlman <jonas@kwiboo.se>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Quentin
 Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH v5 1/4] arm64: dts: rockchip: add overlay test for
 WolfVision PF5
In-Reply-To: <20250207-pre-ict-jaguar-v5-1-a70819ea0692@cherry.de>
References: <20250207-pre-ict-jaguar-v5-0-a70819ea0692@cherry.de>
 <20250207-pre-ict-jaguar-v5-1-a70819ea0692@cherry.de>
Message-ID: <ef9133d217bc35f611ef390da8042510@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

Hello Quentin,

Please see a few comments below.

On 2025-02-07 16:19, Quentin Schulz wrote:
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
> 
> ---
>  arch/arm64/boot/dts/rockchip/Makefile | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile
> b/arch/arm64/boot/dts/rockchip/Makefile
> index
> def1222c1907eb16b23cff6d540174a4e897abc9..534e70a649eeada7f9b6f12596b83f5c47b184b4
> 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -170,3 +170,25 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += 
> rk3588s-orangepi-5.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-orangepi-5b.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-rock-5a.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-rock-5c.dtb
> +
> +# Overlay application tests
> +#
> +# A .dtbo must have its own
> +#
> +#  dtb-$(CONFIG_ARCH_ROCKCHIP) += <overlay>.dtbo
> +#
> +# entry, and at least one overlay application test - ideally 
> reflecting how it
> +# will be used in real life -:

Hmm, what's "-:" actually doing in the line right above?  I mean,
it's a minor nitpick, so might be worth addressing only if there
will be the v6...  Also, "test - ideally" might be replaced by
"test, ideally", because splicing sentences together using em/en
dashes is generally frowned upon. :)

> +#
> +#  dtb-$(CONFIG_ARCH_ROCKCHIP) += <name of overlay application 
> test>.dtb
> +#  <name of overlay application test>-dtbs := <base>.dtb
> <overlay-1>.dtbo [<overlay-2>.dtbo ...]

As another minor nitpick, I'd suggest that

     "<name of overlay application test>.dtb"

is replaced with

     "<name-of-overlay-application-test>.dtb"

for the sake of consistency and, obviously, for clear indication of
the space characters not being applicable.  Regarding using "-" or "_"
characters there, perhaps we should follow what Git uses in its man
pages, which is the "-" character (see e.g. git-switch(1)).

> +#
> +# This will make the <base>.dtb have symbols (like when DTC_FLAGS has
> -@ passed)
> +# and generate a new DTB (<name of overlay application test>.dtb) 
> which is the
> +# result of the application of <overlay-1>.dtbo and other listed
> overlays on top
> +# of <base>.dtb.
> +
> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-vz-2-uhd.dtb
> +rk3568-wolfvision-pf5-vz-2-uhd-dtbs := rk3568-wolfvision-pf5.dtb \
> +	rk3568-wolfvision-pf5-display-vz.dtbo \
> +	rk3568-wolfvision-pf5-io-expander.dtbo

Otherwise, it's looking good to me, thanks for the patch!  It was
already discussed and commented in detail in the v4 of this series, [*]
so please feel free to include:

Reviewed-by: Dragan Simic <dsimic@manjaro.org>

[*] 
https://lore.kernel.org/linux-rockchip/a3b98e3d3a2571ee75e59418bb3b6960@manjaro.org/T/#u
