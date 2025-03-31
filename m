Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18E48472;
	Mon, 31 Mar 2025 13:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743427671; cv=none; b=T/fDc8Y0DncWm34jcb71bKpIxcwfnyyRy5hxtokxeE/mM5bQICaWZu7+wNkQxrXG+1NiDxWLnQPjA0rA9wW/Dge9d2zli5u/zb2ThP6SgY+iNmCiNdHf7cCk9bNhYX4wBQ3Df5VvQnFstBgWv/X+ToYZfBZBh/MFReshLBoS/mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743427671; c=relaxed/simple;
	bh=glwUne9cizaTnkLrGY1HEwK6Rkb2ZeouVxAPZRgLooQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lfGuM4ubm+qF22keKCG+xAkqU2v9MgtIyawZkokEG2V5Xjat81Unu+5EvAfVRWmt61BfvD1oCuNWQ2tMTfA4Ez62hHGKrEGPgT1+JwEsMdgdtJwXUgQBlYWiH7DYCUe4Q1x5cWcyTJVyNUPdyvqnmtrVRjj60pnYoAk1Suoz9sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=aBXFn7Sp; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="aBXFn7Sp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743427667;
	bh=glwUne9cizaTnkLrGY1HEwK6Rkb2ZeouVxAPZRgLooQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aBXFn7SppLGstmOX2Aj099axN0Kai23N61ot1oeDIKbmvytLRHbIMKQ3AJmOYuIzP
	 YqAcaqDxmw31WEwxvPcjblnPO9XXzIsT9mbqZyukUv7aBmkfW80+oVlTQGY2UerfrJ
	 navlE+bXdOELK1I7xMPw3XfO+/pwk58xHAOp6FZYBWcKJEeBs2Dl33a24z1eCjC51U
	 qZwy6AhmiXbdGNtaHajZbVxhJcX6fRfF2Kn5CuhPGOWHZFhy1rvQ0/2H881O5FI0ia
	 UqZwwNF4rjAiVZBVVyMGbEWUgVA+1Wkhky8EBRpTyyelsRPrUslQp7oEzax1jiVfgi
	 IJEiANm0Dqcww==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4E69517E07F4;
	Mon, 31 Mar 2025 15:27:47 +0200 (CEST)
Message-ID: <10703a6b-3f5f-4611-8545-21aa0e9be660@collabora.com>
Date: Mon, 31 Mar 2025 15:27:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8390-genio-common: Force ssusb2
 dual role mode to host
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250331-mtk-genio-510-700-fix-bt-detection-v1-1-34ea2cf137f3@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250331-mtk-genio-510-700-fix-bt-detection-v1-1-34ea2cf137f3@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 31/03/25 11:25, Louis-Alexis Eyraud ha scritto:
> On the Mediatek Genio 510-EVK and 700-EVK boards, ssusb2 controller is
> one but has two ports: one is routed to the M.2 slot, the other is on
> the RPi header who does support full OTG.
> Since Mediatek Genio 700-EVK USB support was added, dual role mode
> property is set to otg for ssusb2. This config prevents the M.2
> Wifi/Bluetooth module, present on those boards and exposing Bluetooth
> as an USB device to be properly detected at startup, so configure for
> the ssusb2 dr_mode property as host instead.
> 
> Fixes: 1afaeca17238 ("arm64: dts: mediatek: mt8390-genio-700: Add USB, TypeC Controller, MUX")
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
> I've tested this patch on Mediatek Genio 510-EVK board with a kernel
> based on linux-next (tag: next-20250331).
> ---
>   arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> index 60139e6dffd8e0e326690d922f3360d829ed026b..3a9d429f0f14b501ae41551dfe7272f242345138 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> @@ -1199,7 +1199,13 @@ xhci_ss_ep: endpoint {
>   };
>   
>   &ssusb2 {
> -	dr_mode = "otg";
> +	/*
> +	 * the ssusb2 controller is one but we got two ports : one is routed
> +	 * to the M.2 slot, the other is on the RPi header who does support
> +	 * full OTG but we keep it disabled otherwise the BT on the M.2 slot
> +	 * USB line goes obviously dead if switching to gadget mode.
> +	 */
> +	dr_mode = "host";
>   	maximum-speed = "high-speed";
>   	usb-role-switch;
>   	vusb33-supply = <&mt6359_vusb_ldo_reg>;
> 
> ---
> base-commit: 1c4df70331c0dc7f82f724166575c16931ec66b3
> change-id: 20250328-mtk-genio-510-700-fix-bt-detection-2711cbcbb2e4
> 
> Best regards,


