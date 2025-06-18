Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53575944F;
	Wed, 18 Jun 2025 07:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750232737; cv=none; b=Qw7n/nlBc0bfi6//2rAIgA+P1ZGCt7+C1H/gfDdla/HFUt9OTuQNHSK7Hzi48it6SeX4NgwVFQ7JTPWvAwz+2Y2wjKKabMSZ147ZMcaILqRyPTSzf2+A/EP2GG5Sl3huhiu0XEXKX6T0whiDWULb5X/N4JEWn+a8IMqz+KjxhhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750232737; c=relaxed/simple;
	bh=1JdQ904uDrVw5CrNkcjW/fEGquyhcUzIxxmQVdihypM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aWUYPTAceMbcsyzSvRN3KeZL+8SbVU3JcHwLqnd/TT1OBVP5rSqwdQkZreuSdbaO0MYlFiMWeMHMDueTC+FqbjloIg/LYDjuu/6cM1BME4f4BwtPioMn5/R6tqtcoYWW2lFHTgAFWlVwxjP6JsjZj6R3nXlOhLzubnJLR9Ox05Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=TU7G28jr; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="TU7G28jr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750232733;
	bh=1JdQ904uDrVw5CrNkcjW/fEGquyhcUzIxxmQVdihypM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TU7G28jrXco5LKBo88MJI++Q+39OFW5Pvy4t6nHJ5tPRAk0w6CKZmVmBE3WTXlXlI
	 PLEo4d3UQc/w9X3mft+gsnDzSFFAIPnsQqnrJ+oikqcfzyKzkXZwoICJ9McYwo1QXk
	 hL0rKRkyOjZlHT0TkrdI6pjN4TvztXLDSM5fNujhhxRkbFglMvIwjINvFtIWmYPwEO
	 +ISZiLO3Rcw88JONnttSfqNs1vZhf9JdUDzBAG0hltjLPquofmSwhsgdX8Laq/kXEs
	 tJihM2MU5HArPpBR4E+H2T+Rg3F6rNasL8DX8i96/IT9QUX8qvv90sJL2fSDz8eVC4
	 3cvpFD+KoynVg==
Received: from [10.40.0.100] (185-251-200-162.lampert.tv [185.251.200.162])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A548117E0F99;
	Wed, 18 Jun 2025 09:45:32 +0200 (CEST)
Message-ID: <e9db11c2-b02d-4fd5-8927-7b5857089533@collabora.com>
Date: Wed, 18 Jun 2025 09:45:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] dt-bindings: phy: rockchip-inno-csi-dphy: add rk3588
 variant
To: Diederik de Haas <didi.debian@cknow.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>,
 Kever Yang <kever.yang@rock-chips.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
References: <20250616-rk3588-csi-dphy-v1-0-84eb3b2a736c@collabora.com>
 <20250616-rk3588-csi-dphy-v1-2-84eb3b2a736c@collabora.com>
 <DAOVBOKLXLS2.S9MXDD29X68J@cknow.org>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <DAOVBOKLXLS2.S9MXDD29X68J@cknow.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Diederik,

Thanks for your comments!

On 6/17/25 16:12, Diederik de Haas wrote:
> Hi,
> 
> I'm (unfortunately) not seeing any @rock-chips.com recipients ...

Oops, I meant to include at least Kever, but forgot to do it. Will do in v2.

Cc: Kever

> 
> On Tue Jun 17, 2025 at 10:54 AM CEST, Michael Riesch via B4 Relay wrote:
>> From: Michael Riesch <michael.riesch@collabora.com>
>>
>> The Rockchip RK3588 variant of the CSI-2 DPHY features two reset lines.
>> Add the variant and allow for the additional reset.
>>
>> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
>> ---
>>  .../bindings/phy/rockchip-inno-csi-dphy.yaml       | 60 ++++++++++++++++++++--
>>  1 file changed, 55 insertions(+), 5 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
>> index 5ac994b3c0aa..6755738b13ee 100644
>> --- a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
>> @@ -21,6 +21,7 @@ properties:
>>        - rockchip,rk3326-csi-dphy
>>        - rockchip,rk3368-csi-dphy
>>        - rockchip,rk3568-csi-dphy
>> +      - rockchip,rk3588-csi-dphy
>>  
>>    reg:
>>      maxItems: 1
>> @@ -39,18 +40,49 @@ properties:
>>      maxItems: 1
>>  
>>    resets:
>> -    items:
>> -      - description: exclusive PHY reset line
>> +    minItems: 1
>> +    maxItems: 2
>>  
>>    reset-names:
>> -    items:
>> -      - const: apb
>> +    minItems: 1
>> +    maxItems: 2
>>  
>>    rockchip,grf:
>>      $ref: /schemas/types.yaml#/definitions/phandle
>>      description:
>>        Some additional phy settings are access through GRF regs.
>>  
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - rockchip,px30-csi-dphy
>> +              - rockchip,rk1808-csi-dphy
>> +              - rockchip,rk3326-csi-dphy
>> +              - rockchip,rk3368-csi-dphy
>> +              - rockchip,rk3568-csi-dphy
>> +    then:
>> +      properties:
>> +        resets:
>> +          items:
>> +            - description: exclusive PHY reset line
>> +
>> +        reset-names:
>> +          items:
>> +            - const: apb
>> +
>> +      required:
>> +        - reset-names
>> +    else:
>> +      properties:
>> +        resets:
>> +          minItems: 2
>> +
>> +        reset-names:
>> +          minItems: 2
>> +
>>  required:
>>    - compatible
>>    - reg
>> @@ -59,7 +91,6 @@ required:
>>    - '#phy-cells'
>>    - power-domains
>>    - resets
>> -  - reset-names
>>    - rockchip,grf
>>  
>>  additionalProperties: false
>> @@ -78,3 +109,22 @@ examples:
>>          reset-names = "apb";
>>          rockchip,grf = <&grf>;
>>      };
>> +  - |
>> +    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
>> +    #include <dt-bindings/reset/rockchip,rk3588-cru.h>
>> +
>> +    soc {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        csi_dphy0: phy@fedc0000 {
>> +            compatible = "rockchip,rk3588-csi-dphy";
>> +            reg = <0x0 0xfedc0000 0x0 0x8000>;
>> +            clocks = <&cru PCLK_CSIPHY0>;
>> +            clock-names = "pclk";
>> +            #phy-cells = <0>;
>> +            resets = <&cru SRST_CSIPHY0>, <&cru SRST_P_CSIPHY0>;
>> +            rockchip,grf = <&csidphy0_grf>;
>> +            status = "disabled";
>> +        };
>> +    };
> 
> ... which could hopefully tell us what the value is/should be for the
> *required* 'power-domains' property, which is missing in this example.
> IOW: the binding example is invalid according to its own binding.

Huh, indeed. Hm. Why didn't make dt_binding_check warn me about that?!

TRM Part 1, p. 1097 states that HDMI_CSI_DPHY is in the ALIVE(PD_BUS)
power domain. With some creativity one can interpret that the CSI DPHY
is always on anyways. @Kever: Could you please elaborate on that?

> (btw: you can drop the 'csi_dphy0' label)

Will do.

> 
> And hopefully also for rk3568 so we can add it to rk356x-base.dtsi and
> you can add it in patch 5 where it's also missing.

I recall a similar discussion [0]. In the RK3568 the CSIPHY is in the
ALIVE power domain.

Note that the PHY must not be confused with the HOST blocks, which are
the MIPI CSI-2 receivers.

I guess the correct solution is to make power-domains optional. Further
input welcome, though.

Best regards,
Michael

> 
> Grepping for "csi-dphy" in arch/arm*/boot/dts/rockchip returns:
> - px30.dtsi
> - rk356x-base.dtsi
> 
> With this patch set applied, we'd have a 3rd result: rk3588-base.dtsi
> 
> For all the listed compatibles, it's only actually defined in px30.dtsi.
> 
> Cheers (and sorry),
>   Diederik

[0] https://lore.kernel.org/all/D4QNJ85V43NU.YD01E8AB4116@cknow.org/

