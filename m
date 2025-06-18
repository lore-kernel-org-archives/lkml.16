Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59971EEA40;
	Wed, 18 Jun 2025 06:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750228356; cv=none; b=TQ0yE6fkjdtkcbUG5e89V2N3SU9ivFtm+dcEZJJwN+xAMD46sXiHa6Y8z2QaB/vnkYgegUBFnqO/cERbW3P5EO8e0ZTuV39BMei4NNLpUEYw4PJNDusfUB4DJU4JGatoF1eAcZYhncvbd5YogIgQfQ6WAoMd7GIpOIOAwVwlDUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750228356; c=relaxed/simple;
	bh=y10M8imfJ9o9x4GicbvPGTG3FTDU5rk/ab+BdMuexKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FNeeulgpb4KcEoWQHVFrOnDIJV4XAOuVslenBYK+G5laRlo4T0bsIIi10wNi+2tHj/gH35MIrwHfm/C3XjJ8fILO+jJhJ58kJJOuxHk2WelsgFEDT9gBOT8ldeZH6GaTt7HBc36OzoxsRerO/SL7G5q8WW2z3V0FY5HH2Zkl0t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=T34ktW0o; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="T34ktW0o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750228346;
	bh=y10M8imfJ9o9x4GicbvPGTG3FTDU5rk/ab+BdMuexKg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=T34ktW0oHpuFm0dNOITwZ4sMW7CMFEoqqP5DDtdOZrPLpha+3GfXyd02Cli/vadBU
	 LlWPVtA6T+zvqc73KzuhZ/CnssL5rl721ZEmYcCqUTsL6O7BE/Z1rDLNKY7u6pKSDs
	 yPsimWcGx4Blwgtu5smzFikqknZWd7TgPR08HJT6kQJSudRYAbQEitAJvfV+6nJCIP
	 Fk3YMS5kFx6OZd8Ra1zChjmdjdyC+6KirckL/a0YjlfTO90bjUj6evempYqSQw3pf3
	 Rvhjqv6TwLKI8xV6X97d9vFRM2ErqWaKIMVpL+lClT8Ei9Z2efKav1ncp9VY49nAQo
	 aWLfOCHHBszqQ==
Received: from [10.40.0.100] (185-251-200-162.lampert.tv [185.251.200.162])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C91F817E0863;
	Wed, 18 Jun 2025 08:32:25 +0200 (CEST)
Message-ID: <8ba2f458-4a66-44f6-8528-4654cfe379ff@collabora.com>
Date: Wed, 18 Jun 2025 08:32:25 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] dt-bindings: phy: rockchip-inno-csi-dphy: add rk3588
 variant
To: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
References: <20250616-rk3588-csi-dphy-v1-0-84eb3b2a736c@collabora.com>
 <20250616-rk3588-csi-dphy-v1-2-84eb3b2a736c@collabora.com>
 <0f2b8934-9b3d-4913-b734-b4fe7f0c7d0a@linaro.org>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <0f2b8934-9b3d-4913-b734-b4fe7f0c7d0a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Neil,

Thanks for your comments!

On 6/17/25 11:31, neil.armstrong@linaro.org wrote:
> On 17/06/2025 10:54, Michael Riesch via B4 Relay wrote:
>> From: Michael Riesch <michael.riesch@collabora.com>
>>
>> The Rockchip RK3588 variant of the CSI-2 DPHY features two reset lines.
>> Add the variant and allow for the additional reset.
> 
> No names for the new resets on the RK3588 ?

I left the names away because TBH I don't see the value in them (in that
case).

Downstream uses reset-names = "srst_csiphy0", "srst_p_csiphy0"; and
there is no better description. One could guess that the second reset
corresponds to "apb" but this is just guessing and we would still have
to guess/find a proper name for the first reset.

Amazingly the mainline driver does not seem to do anything with the
resets (unless I overlooked some implicit magic). Downstream does a
simple reset_control_{assert,deassert} before configuring the PHY. Now
if the different resets are handled in bulk mode, does it really make
sense to address each reset individually?

Best regards,
Michael

> 
> Neil
> 
>>
>> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
>> ---
>>   .../bindings/phy/rockchip-inno-csi-dphy.yaml       | 60 ++++++++++++
>> ++++++++--
>>   1 file changed, 55 insertions(+), 5 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-
>> dphy.yaml b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-
>> dphy.yaml
>> index 5ac994b3c0aa..6755738b13ee 100644
>> --- a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
>> @@ -21,6 +21,7 @@ properties:
>>         - rockchip,rk3326-csi-dphy
>>         - rockchip,rk3368-csi-dphy
>>         - rockchip,rk3568-csi-dphy
>> +      - rockchip,rk3588-csi-dphy
>>       reg:
>>       maxItems: 1
>> @@ -39,18 +40,49 @@ properties:
>>       maxItems: 1
>>       resets:
>> -    items:
>> -      - description: exclusive PHY reset line
>> +    minItems: 1
>> +    maxItems: 2
>>       reset-names:
>> -    items:
>> -      - const: apb
>> +    minItems: 1
>> +    maxItems: 2
>>       rockchip,grf:
>>       $ref: /schemas/types.yaml#/definitions/phandle
>>       description:
>>         Some additional phy settings are access through GRF regs.
>>   +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - rockchip,px30-csi-dphy
>> +              - rockchip,rk1808-csi-dphy
>> +              - rockchip,rk3326-csi-dphy
>> +              - rockchip,rk3368-csi-dphy
>> +              - rockchip,rk3568-csi-dphy
>> +    then:
>> +      properties:
>> +        resets:
>> +          items:
>> +            - description: exclusive PHY reset line
>> +
>> +        reset-names:
>> +          items:
>> +            - const: apb
>> +
>> +      required:
>> +        - reset-names
>> +    else:
>> +      properties:
>> +        resets:
>> +          minItems: 2
>> +
>> +        reset-names:
>> +          minItems: 2
>> +
>>   required:
>>     - compatible
>>     - reg
>> @@ -59,7 +91,6 @@ required:
>>     - '#phy-cells'
>>     - power-domains
>>     - resets
>> -  - reset-names
>>     - rockchip,grf
>>     additionalProperties: false
>> @@ -78,3 +109,22 @@ examples:
>>           reset-names = "apb";
>>           rockchip,grf = <&grf>;
>>       };
>> +  - |
>> +    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
>> +    #include <dt-bindings/reset/rockchip,rk3588-cru.h>
>> +
>> +    soc {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        csi_dphy0: phy@fedc0000 {
>> +            compatible = "rockchip,rk3588-csi-dphy";
>> +            reg = <0x0 0xfedc0000 0x0 0x8000>;
>> +            clocks = <&cru PCLK_CSIPHY0>;
>> +            clock-names = "pclk";
>> +            #phy-cells = <0>;
>> +            resets = <&cru SRST_CSIPHY0>, <&cru SRST_P_CSIPHY0>;
>> +            rockchip,grf = <&csidphy0_grf>;
>> +            status = "disabled";
>> +        };
>> +    };
>>
> 

