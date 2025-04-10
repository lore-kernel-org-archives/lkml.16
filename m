Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7FA28EA5C;
	Thu, 10 Apr 2025 21:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744319485; cv=none; b=VS/j449MCyancEVE050MV0Li1Srgf942JfSkA+s9FxNPaxjvngc5kmhkhTJroSmhoE7tgE3W0qmz5SNNgdLtxQU/iwrC2zCeoBqGwF+C3keeJFXmlooDhxNl8sVUJgMsiyk869XCHyTJJYLL9ngedCpcNjVZCAIPHghFLdp2R2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744319485; c=relaxed/simple;
	bh=owtnRJWwM8yKkJmYEoQiWQDaxSjXp0C7FQsxarVWC9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kc3TkVG3I+NpVrfVLYC3LRbHVbIDF5CguXLbKVpCpMXrqyrp0vj2Vxpre9cZ6gQqEifA7Yofxn6SIeU0pHIdfPmR1D7bO550ly/5LmHTwVCOQDb0LkPiyMVj1VzisyUZF+Lfv1VkcgH8p0FYe12fBQQnmiDiS9mUNYmGTFFtaFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rkEMYfFO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rkEMYfFO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BF6DC4CEDD;
	Thu, 10 Apr 2025 21:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744319484;
	bh=owtnRJWwM8yKkJmYEoQiWQDaxSjXp0C7FQsxarVWC9g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rkEMYfFO8PkNupW9d53Fn+Gf8hLHqpXXnFBqrr4YHQ+uXfsfFycXhKSeCia8matlF
	 zQOaWWBWviVuR6W/FCo6YVIw254fwMVQCtqE+P+/irD5u3rZQI+mZVMybVzLXHD9z9
	 XGujbwykQyPlGuSVyfocqgCS49KLORfNgbm5G0ZHfF6fl/QuVxX5wFCOf7ikf7EAlX
	 /1x4xcxwEj6vTw+fhJWYX7qvgMchl9Ni102t6obZMqBa15ZPU0YRXq0nOgABs2AfuW
	 UDGi+qYxJVRN/ELF3KV4II6z0Fc7EHY8yhIHz8gcbLoMRxUSeWTAj+TEI5gP4wz+m8
	 Kp3eiepPvvPXA==
Date: Thu, 10 Apr 2025 16:11:23 -0500
From: Rob Herring <robh@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	kernel@collabora.com, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: phy: rockchip,inno-usb2phy: add port
 property
Message-ID: <20250410211123.GA1071510-robh@kernel.org>
References: <20250407-rk3576-sige5-usb-v1-0-67eec166f82f@collabora.com>
 <20250407-rk3576-sige5-usb-v1-1-67eec166f82f@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-rk3576-sige5-usb-v1-1-67eec166f82f@collabora.com>

On Mon, Apr 07, 2025 at 08:09:14PM +0200, Nicolas Frattaroli wrote:
> USB connectors like to have OF graph connections to high-speed related
> nodes to do various things. In the case of the RK3576, we can make use
> of a port in the usb2 PHY to detect whether the OTG controller is
> connected to a type C port and apply some special behaviour accordingly.
> 
> The usefulness of having different bits of a fully functioning USB stack
> point to each other is more general though, and not constrained to
> RK3576 at all, even for this use-case.
> 
> Add a port property to the binding.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
> index 6a7ef556414cebad63c10de754778f84fd4486ee..3a662bfc353250a8ad9386ebb5575d1e84c1b5ba 100644
> --- a/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
> @@ -78,6 +78,11 @@ properties:
>        When set the driver will request its phandle as one companion-grf
>        for some special SoCs (e.g rv1108).
>  
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description:
> +      A port node to link the PHY to a USB connector's "high-speed" port.

I don't think this is correct. The HS port of the connector goes to the 
controller. The controller has the link to the phy.

If the PHY is also what handles USB-C muxing or orientation switching, 
then it might have ports, but then it needs input and output ports.

Rob
