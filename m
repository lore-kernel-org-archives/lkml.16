Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C8B4C79;
	Sun,  9 Feb 2025 20:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739132013; cv=none; b=oiNW/IPDE2Ypk4OFcRrKRamfWcme8Od0Hmc1k38NvX+7HW/MtAzyewDieDl7Y4xuCrYT6SDm4Q/Rwmk/aQqNSZYJJdPQ9hyGKfQcCNpkBWtQ+FxE13aMddSYGA9hzgsgDCk/91Njz4N3Wqcg7niO0M7pYt5jN4u3+UaNZOfHwp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739132013; c=relaxed/simple;
	bh=mxKJJ9z0kfIFgP0ZaVWskkVDmXNCZ4NZHLOhggPQ2U4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L9Y6Yjss9O37Ac8OmVDoOaZco6J7k4eN0KSj9LvTFqMG6PAhDE5qOpfWghSPmOMOPjmGRi3ODLjq9WZ2bBwP8EY5+lJCJzjef4Vd615Kk651cWXrmRw2aUEu9wCDLRqpwzLUd59BlzV7LewPNlMP8fo2xacziepfSqsNFGN8HOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=TU8uQTRz; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="TU8uQTRz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+TJoRP+50bwcv+IqsrAa6iNek+2v+7TMWBQgaAIIUIw=; b=TU8uQTRzaIDYXOdzkbqFz1dT4v
	ehFyakRsQhbSJo0zUO2n5dFS0TBqARQARqUjjalx0YxFaZ3od9n4jYeKl2gjmvODFn8ZQYu64rtar
	21W31c7bLmwesc7d0OzS7NkUvUE/1x/ZbS6xTm/gyrzWlVcIgTwUiq46p2ul5hWx3ZJxuwMwmJFNL
	Lo/1LaZaclt/DQ/RyDMkBTBw7M9qIRIaBK4EObOPZ2aluOUhRVOcCntgN/xOo8kawr6Uc8C77YC69
	u4N0ANK/58PWaF7+RnbnUf+vydM1I0xkqU4jzCejKHSBMmmZEYxLToawy+/OmTO8MWVjz98qyO9K7
	VcofyvJg==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1thDg3-0001Vx-UW; Sun, 09 Feb 2025 21:13:15 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: vkoul@kernel.org, Andy Yan <andyshrk@163.com>
Cc: cristian.ciocaltea@collabora.com, kishon@kernel.org, krzk+dt@kernel.org,
 robh@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v3] dt-bindings: phy: Add rk3576 hdptx phy
Date: Sun, 09 Feb 2025 21:13:15 +0100
Message-ID: <8470934.EvYhyI6sBW@diego>
In-Reply-To: <20241231092721.252405-1-andyshrk@163.com>
References: <20241231092721.252405-1-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Vinod,

Am Dienstag, 31. Dezember 2024, 10:27:11 MEZ schrieb Andy Yan:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> Add compatible for the HDPTX PHY on rk3576, which is compatible with
> rk3588, but without rst_phy/rst_ropll/rst_lcpll.
> 
> In fact, these three reset lines are also optional on the rk3588,
> they just used for debug, then they were removed on the rk3576 IC
> design.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

With the binding more in the driver-realm, I guess this should go through
the phy tree?

Thanks a lot
Heiko


> ---
> 
> Changes in v3:
> - Split from:
>   https://lore.kernel.org/linux-rockchip/3330586.aeNJFYEL58@diego/T/#m02151cd8591d7fe92cf30ab69701ed57c1944c06
> 
> Changes in v2:
> - Wrap commit message according to Linux coding style
> - Make "rockchip,rk3588-hdptx-phy" const for "rockchip,rk3576-hdptx-phy"
> - Make declare phy/ropll/lcpll reset line are not exit on rk3576
> 
>  .../phy/rockchip,rk3588-hdptx-phy.yaml        | 62 +++++++++++++------
>  1 file changed, 44 insertions(+), 18 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3588-hdptx-phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3588-hdptx-phy.yaml
> index 84fe59dbcf48..7a307f45cdec 100644
> --- a/Documentation/devicetree/bindings/phy/rockchip,rk3588-hdptx-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/rockchip,rk3588-hdptx-phy.yaml
> @@ -11,8 +11,13 @@ maintainers:
>  
>  properties:
>    compatible:
> -    enum:
> -      - rockchip,rk3588-hdptx-phy
> +    oneOf:
> +      - enum:
> +          - rockchip,rk3588-hdptx-phy
> +      - items:
> +          - enum:
> +              - rockchip,rk3576-hdptx-phy
> +          - const: rockchip,rk3588-hdptx-phy
>  
>    reg:
>      maxItems: 1
> @@ -34,24 +39,12 @@ properties:
>      const: 0
>  
>    resets:
> -    items:
> -      - description: PHY reset line
> -      - description: APB reset line
> -      - description: INIT reset line
> -      - description: CMN reset line
> -      - description: LANE reset line
> -      - description: ROPLL reset line
> -      - description: LCPLL reset line
> +    minItems: 4
> +    maxItems: 7
>  
>    reset-names:
> -    items:
> -      - const: phy
> -      - const: apb
> -      - const: init
> -      - const: cmn
> -      - const: lane
> -      - const: ropll
> -      - const: lcpll
> +    minItems: 4
> +    maxItems: 7
>  
>    rockchip,grf:
>      $ref: /schemas/types.yaml#/definitions/phandle
> @@ -67,6 +60,39 @@ required:
>    - reset-names
>    - rockchip,grf
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - rockchip,rk3576-hdptx-phy
> +    then:
> +      properties:
> +        resets:
> +          minItems: 4
> +          maxItems: 4
> +        reset-names:
> +          items:
> +            - const: apb
> +            - const: init
> +            - const: cmn
> +            - const: lane
> +    else:
> +      properties:
> +        resets:
> +          minItems: 7
> +          maxItems: 7
> +        reset-names:
> +          items:
> +            - const: phy
> +            - const: apb
> +            - const: init
> +            - const: cmn
> +            - const: lane
> +            - const: ropll
> +            - const: lcpll
> +
>  additionalProperties: false
>  
>  examples:
> 




