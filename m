Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8357528BA9B;
	Fri, 20 Jun 2025 13:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750427669; cv=none; b=m5WlQI2E2J6ToI2v6PAQ5YrH6jny8J1euTHztvYM51UyGf8UcUnTfQ7j1UihYfKtpOL9lYyhQf8HN3kDaqXv9RNkf+jk4gq/DGX3yoKwX0Fq84aJnJJQXKLZDW4CBSpUgUKnzp0mz5URer4pkBVfWdZ7ugaJTGodVknxF/KJlq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750427669; c=relaxed/simple;
	bh=BvpOIHIHPayXbBCg+AnWxp8p+upzdU7E8EkS1HC85sU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qbwf4uH34IweB/Op7/FGEO/URB1T5ZwMQguUngvhEvKnpB1AT3mXy0VGl7XlMX7/MW/34ij3CqMdBXgf1zhz5yKg8QlLA/BDNaoHTe/YKxDRXQlauDHgAfn7Zlv4XwxnMfVgtxTxQwORtfXgC63ykz9bW/F94ZaKOXlP5+4WD4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6700516F2;
	Fri, 20 Jun 2025 06:54:07 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 342DF3F58B;
	Fri, 20 Jun 2025 06:54:25 -0700 (PDT)
Date: Fri, 20 Jun 2025 14:54:22 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: arm: sunxi: Add Xunlong OrangePi 4A
 board
Message-ID: <20250620145422.26fdd14a@donnerap.manchester.arm.com>
In-Reply-To: <20250619173007.3367034-2-wens@kernel.org>
References: <20250619173007.3367034-1-wens@kernel.org>
	<20250619173007.3367034-2-wens@kernel.org>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 20 Jun 2025 01:30:03 +0800
Chen-Yu Tsai <wens@kernel.org> wrote:

Hi Chen-Yu,

thanks for sending those patches!

> From: Chen-Yu Tsai <wens@csie.org>
> 
> The OrangePi 4A is a typical Raspberry Pi model B sized development
> board from Xunlong designed around an Allwinner T527 SoC.
> 
> Add its compatible name to the list of valid ones.
> 
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
> index 7807ea613258..c41d0a0b89e6 100644
> --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> @@ -996,6 +996,11 @@ properties:
>            - const: xunlong,orangepi-3
>            - const: allwinner,sun50i-h6
>  
> +      - description: Xunlong OrangePi 4A
> +        items:
> +          - const: xunlong,orangepi-4a
> +          - const: allwinner,sun55i-t527
> +
>        - description: Xunlong OrangePi Lite
>          items:
>            - const: xunlong,orangepi-lite

