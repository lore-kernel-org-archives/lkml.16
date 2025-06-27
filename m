Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FD81F419B;
	Fri, 27 Jun 2025 19:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751051852; cv=none; b=PWIUWIykVZgw9ljoUv5F2H+f48y3cv+XEKF1zXhpE7AFIFvfKLxOSz85dcfeLPijwikWN+9Hp8tx5cPZfmNKZy6ubJOS3rE8SPHqSAQtnZYOTy4vkV7zHWdmdbXkxwQghA51sSRC5QAfqqKsnvaLlmY06n0DPU1UgnCWCJkH/E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751051852; c=relaxed/simple;
	bh=4tIY5Xv1aq93hm2eYGyz9mdC6DOUVIOyHjZ+4y79CfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=heKClivohQ+CJCNhLYY1emnM7phdOvATrmhkBN72RSJp/iQa9f/Vr3cyGwWsoe5Ah/+0TzchRgpQDv+BGhm5Nsq9Bbe9oED0FmkJjesRxW++bEdLVP4Ab6jL5VjBH+jMBS6Lqu38WtDRYdD5JTy1AVz9Sc8s8dBIxAQVhkt6+uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MrokVCE/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MrokVCE/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 891C0C4CEE3;
	Fri, 27 Jun 2025 19:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751051851;
	bh=4tIY5Xv1aq93hm2eYGyz9mdC6DOUVIOyHjZ+4y79CfQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MrokVCE/iHGDnWfI2S2bpRHqVDTYWrOZjsS0Notwml4J1ce0uUyE0NYLMuxXrF4lL
	 Gv8LJBYbedx1LqCCpBGikDCZggPY3HiPXy/DFIDkU5pmH4TC3mD7if3RPMp98TUkPx
	 eOh6yRKMGs3LvXWwt/R7PUQpnz4M50xkqBZGg9wqFmfpn3psUG7Y4Oq3430IkwNbuJ
	 Ym9DWQ7ES8tkLTsb4ybKl/bsoDxb0/i1Ae8lFNy+RBRCDTqZij0bd3e7EPK30+atEl
	 QZhPzW6UwC0SH6Zj6DBR3tOnr1tIHtauojq/XTNg9+HePZ38UAfwwgREf4uO+E0Orp
	 1F1HqILr8Mhzg==
Date: Fri, 27 Jun 2025 14:17:30 -0500
From: Rob Herring <robh@kernel.org>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Diederik de Haas <didi.debian@cknow.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Collabora Kernel Team <kernel@collabora.com>,
	Kever Yang <kever.yang@rock-chips.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH 2/5] dt-bindings: phy: rockchip-inno-csi-dphy: add rk3588
 variant
Message-ID: <20250627191730.GA4025458-robh@kernel.org>
References: <20250616-rk3588-csi-dphy-v1-0-84eb3b2a736c@collabora.com>
 <20250616-rk3588-csi-dphy-v1-2-84eb3b2a736c@collabora.com>
 <DAOVBOKLXLS2.S9MXDD29X68J@cknow.org>
 <e9db11c2-b02d-4fd5-8927-7b5857089533@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9db11c2-b02d-4fd5-8927-7b5857089533@collabora.com>

On Wed, Jun 18, 2025 at 09:45:32AM +0200, Michael Riesch wrote:
> Hi Diederik,
> 
> Thanks for your comments!
> 
> On 6/17/25 16:12, Diederik de Haas wrote:
> > Hi,
> > 
> > I'm (unfortunately) not seeing any @rock-chips.com recipients ...
> 
> Oops, I meant to include at least Kever, but forgot to do it. Will do in v2.
> 
> Cc: Kever
> 
> > 
> > On Tue Jun 17, 2025 at 10:54 AM CEST, Michael Riesch via B4 Relay wrote:
> >> From: Michael Riesch <michael.riesch@collabora.com>
> >>
> >> The Rockchip RK3588 variant of the CSI-2 DPHY features two reset lines.
> >> Add the variant and allow for the additional reset.
> >>
> >> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> >> ---
> >>  .../bindings/phy/rockchip-inno-csi-dphy.yaml       | 60 ++++++++++++++++++++--
> >>  1 file changed, 55 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
> >> index 5ac994b3c0aa..6755738b13ee 100644
> >> --- a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
> >> +++ b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
> >> @@ -21,6 +21,7 @@ properties:
> >>        - rockchip,rk3326-csi-dphy
> >>        - rockchip,rk3368-csi-dphy
> >>        - rockchip,rk3568-csi-dphy
> >> +      - rockchip,rk3588-csi-dphy
> >>  
> >>    reg:
> >>      maxItems: 1
> >> @@ -39,18 +40,49 @@ properties:
> >>      maxItems: 1
> >>  
> >>    resets:
> >> -    items:
> >> -      - description: exclusive PHY reset line
> >> +    minItems: 1
> >> +    maxItems: 2
> >>  
> >>    reset-names:
> >> -    items:
> >> -      - const: apb
> >> +    minItems: 1
> >> +    maxItems: 2
> >>  
> >>    rockchip,grf:
> >>      $ref: /schemas/types.yaml#/definitions/phandle
> >>      description:
> >>        Some additional phy settings are access through GRF regs.
> >>  
> >> +allOf:
> >> +  - if:
> >> +      properties:
> >> +        compatible:
> >> +          contains:
> >> +            enum:
> >> +              - rockchip,px30-csi-dphy
> >> +              - rockchip,rk1808-csi-dphy
> >> +              - rockchip,rk3326-csi-dphy
> >> +              - rockchip,rk3368-csi-dphy
> >> +              - rockchip,rk3568-csi-dphy
> >> +    then:
> >> +      properties:
> >> +        resets:
> >> +          items:
> >> +            - description: exclusive PHY reset line
> >> +
> >> +        reset-names:
> >> +          items:
> >> +            - const: apb
> >> +
> >> +      required:
> >> +        - reset-names
> >> +    else:
> >> +      properties:
> >> +        resets:
> >> +          minItems: 2
> >> +
> >> +        reset-names:
> >> +          minItems: 2

You have to define the names. Ideally, at the top level and then keep 
this part like this.

> >> +
> >>  required:
> >>    - compatible
> >>    - reg
> >> @@ -59,7 +91,6 @@ required:
> >>    - '#phy-cells'
> >>    - power-domains
> >>    - resets
> >> -  - reset-names
> >>    - rockchip,grf
> >>  
> >>  additionalProperties: false
> >> @@ -78,3 +109,22 @@ examples:
> >>          reset-names = "apb";
> >>          rockchip,grf = <&grf>;
> >>      };
> >> +  - |
> >> +    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
> >> +    #include <dt-bindings/reset/rockchip,rk3588-cru.h>
> >> +
> >> +    soc {
> >> +        #address-cells = <2>;
> >> +        #size-cells = <2>;
> >> +
> >> +        csi_dphy0: phy@fedc0000 {
> >> +            compatible = "rockchip,rk3588-csi-dphy";
> >> +            reg = <0x0 0xfedc0000 0x0 0x8000>;
> >> +            clocks = <&cru PCLK_CSIPHY0>;
> >> +            clock-names = "pclk";
> >> +            #phy-cells = <0>;
> >> +            resets = <&cru SRST_CSIPHY0>, <&cru SRST_P_CSIPHY0>;
> >> +            rockchip,grf = <&csidphy0_grf>;
> >> +            status = "disabled";
> >> +        };
> >> +    };
> > 
> > ... which could hopefully tell us what the value is/should be for the
> > *required* 'power-domains' property, which is missing in this example.
> > IOW: the binding example is invalid according to its own binding.
> 
> Huh, indeed. Hm. Why didn't make dt_binding_check warn me about that?!

You disabled the node, what do you want us to check?

Rob
