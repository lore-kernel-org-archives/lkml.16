Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CC526B2DF;
	Wed, 23 Apr 2025 20:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745441342; cv=none; b=QpX1Nsyho6Y3hkgKGlrb2N9jVbXHsibqxWaKaLo7pfp2jRreZ9KvW5byj8+chXjQ0DxcPfTgRKejHmMOQFDCoJRrtm6vGSGPG5R/f8htbGvbqT8Dlai4k08nl6PESoxEphhjfNnv7IEwMiFHcZSuD4rXEB0+LGXDJUIW2AmHuf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745441342; c=relaxed/simple;
	bh=5RGhKAeaBreTh9VWG4EzD+6h2QPBnL+J7yh0wfrjIk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q6zt7R/312xc7vPhGeuBJW850Gcyn6CFlT0Dd3hlfOPu47E30N/7i9ONwpRvdT8W4BZeAKw2jQZ2yvtOZBpC+L7ha04+JpCesQuW4VV1WoDZP4XTgDlUM1A7SnoDdhrlhq7I00oEK8Ha3g/NIvKQEAYiubJOrsGaAOgtXKnW1pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=dkoOvwuD; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="dkoOvwuD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745441336;
	bh=5RGhKAeaBreTh9VWG4EzD+6h2QPBnL+J7yh0wfrjIk0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dkoOvwuDSavrmBG4/mjqPJmqID78hvqezOcjLGZfV+fI2+XSq2hg+ZOO3graW23Cc
	 jmuhsAjPqiFrIMFMjWa6048+3NJg/A3SlQlP5VvFqnvuIeBmXHH+tRcPKh8H7cQNBu
	 Yv0c1Pqo8kzR5gtk5HnPiEBW65EDtcPH6RpgEshfkKo62D2wgMXbSQiXLrrYgG46n8
	 Tk9903y7h+3OnSMUvKiWM6ALi8jFD/kUe8Cv6F0uJkVC/YBYb5IV/xYWRiIq4aYxsN
	 foqHrbq1lfwbfCJUpTdtNomL6WhByRulyCm/MbHp+3LRk1+ASMaVKDafQszTK9Qor+
	 2nZ+9115szOYw==
Received: from notapiano (unknown [70.107.117.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EF7A217E0649;
	Wed, 23 Apr 2025 22:48:53 +0200 (CEST)
Date: Wed, 23 Apr 2025 16:48:51 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: mediatek: mt8390-genio-common: Force ssusb2
 dual role mode to host
Message-ID: <2da6560b-8444-48ae-bb01-397756cecbc0@notapiano>
References: <20250331-mtk-genio-510-700-fix-bt-detection-v1-1-34ea2cf137f3@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250331-mtk-genio-510-700-fix-bt-detection-v1-1-34ea2cf137f3@collabora.com>

On Mon, Mar 31, 2025 at 11:25:52AM +0200, Louis-Alexis Eyraud wrote:
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
> ---
> I've tested this patch on Mediatek Genio 510-EVK board with a kernel
> based on linux-next (tag: next-20250331).
> ---
>  arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> index 60139e6dffd8e0e326690d922f3360d829ed026b..3a9d429f0f14b501ae41551dfe7272f242345138 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> @@ -1199,7 +1199,13 @@ xhci_ss_ep: endpoint {
>  };
>  
>  &ssusb2 {
> -	dr_mode = "otg";
> +	/*
> +	 * the ssusb2 controller is one but we got two ports : one is routed
> +	 * to the M.2 slot, the other is on the RPi header who does support
> +	 * full OTG but we keep it disabled otherwise the BT on the M.2 slot
> +	 * USB line goes obviously dead if switching to gadget mode.
> +	 */
> +	dr_mode = "host";

Hi,

while I agree with this change, now that this controller is fixed to host mode,
the connector child node here which is supposed to probe with driver
usb-conn-gpio, which would monitor the ID and VBUS lines and change the USB role
as needed, will fail to probe with:

  platform 112a1000.usb:connector: deferred probe pending: usb-conn-gpio: failed to get role switch

as indeed there no longer is a role switch registered.

For that reason, I believe as part of this commit you should also disable the
connector. Since role switching is no longer supported by this controller,
there's no sense in even trying to probe this driver.

Thanks,
Nícolas
