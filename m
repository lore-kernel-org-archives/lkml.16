Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7CF28F94E;
	Mon, 30 Jun 2025 17:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751303914; cv=none; b=iXK67Ju+Uv8LXmRljXjK2vB84gN9yWyBYgqtIHmqKqvKmdgYJCKYMM7vIgttZqQ3OyM97KuRLBYDCFYk6F0mUn+A8yjNZtfkxnLcG2SMN4mbz7d7lm57ibsdjwbZNQyNGyzpI0MvdWH/LdWfNT58arMaQ0LwvPY0SidIH8JXWRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751303914; c=relaxed/simple;
	bh=mxYeHt3z88AgCGudK+INGVx9B4a5/myQ8Rf/7nEuHZ0=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=TgTcGI2Imb6QHkjH/WTKdlTbC1Pu9DWaOw/wXfuDIJTylg5Kfm1iRNiP6SZudhOPrBgPkna/LeAljGCCOmSNxw0TvB6zotNRtgqIqj4RP+SLU+c3yu12ZTc9eBm5S6S5v564M/f+1hucHAgpJquQgzZsHiaAUcGiPpP/8jsD0N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=RCGZNPi9; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="RCGZNPi9"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id E1D8D25D5F;
	Mon, 30 Jun 2025 19:18:23 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gncVtwY-5rfM; Mon, 30 Jun 2025 19:18:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1751303902; bh=mxYeHt3z88AgCGudK+INGVx9B4a5/myQ8Rf/7nEuHZ0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=RCGZNPi9UixpOry4GnMbNnJlUiGyXPRr1zMTtiRKWNggma3UiKcmkpHY0cDI17jGC
	 ET3e86sOvmVGOUDlIELumexcK6pIKC/vr/GqJ2Wy5p8rN+YtlBeFRkJXuL64rsgjrk
	 rfg5Gy6YEI4lV0BEfTS8SWLcp6yvjJG2oZaQVNriU5SpLAr2xef90z2/JFfz8ylDeI
	 qAF1lQq7SqaIpbpxU3f+ISharf/1xorxFN9Vg/xba+Lrik8H3xzaEFRN6J9QCxndSN
	 HbjMyTEatTqsDoXzr+xX7qbAc1Wav35i4eF1xNfddWs7mnic3gtp2P2dMtXCh6S87G
	 36HBVqzPDKTOw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 30 Jun 2025 17:18:22 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: panel: document Samsung
 S6E8AA5X01 panel driver
In-Reply-To: <80055981-3624-4165-af0c-3b60c345e8f8@linaro.org>
References: <20250625-panel-samsung-s6e8aa5x01-v3-0-9a1494fe6c50@disroot.org>
 <20250625-panel-samsung-s6e8aa5x01-v3-1-9a1494fe6c50@disroot.org>
 <80055981-3624-4165-af0c-3b60c345e8f8@linaro.org>
Message-ID: <4b9e44b14395ff4c64eba1bd71e63150@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-06-30 15:29, Neil Armstrong wrote:
> On 25/06/2025 14:41, Kaustabh Chakraborty wrote:
>> Samsung S6E8AA5X01 is an AMOLED MIPI DSI panel controller. Document 
>> the
>> compatible and devicetree properties of this panel driver. Timings are
>> provided through the devicetree node as panels are available in
>> different sizes.
> 
> Wait, why ? Why not multiple compatibles ?

The panel dimensions is the only thing which differs. The model name,
controller, registers, and functionality are supposedly all similar, so
I believe this is fine...

> 
> Neil
> 
>> 
>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>> ---
>>   .../bindings/display/panel/samsung,s6e8aa5x01.yaml | 78 
>> ++++++++++++++++++++++
>>   1 file changed, 78 insertions(+)
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa5x01.yaml 
>> b/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa5x01.yaml
>> new file mode 100644
>> index 
>> 0000000000000000000000000000000000000000..23dae6e961ae01c99de93bf4b4a067f2953f8edf
>> --- /dev/null
>> +++ 
>> b/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa5x01.yaml
>> @@ -0,0 +1,78 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: 
>> http://devicetree.org/schemas/display/panel/samsung,s6e8aa5x01.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Samsung S6E8AA5X01 display panel controller
>> +
>> +maintainers:
>> +  - Kaustabh Chakraborty <kauschluss@disroot.org>
>> +
>> +allOf:
>> +  - $ref: panel-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: samsung,s6e8aa5x01
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  vdd-supply:
>> +    description: core voltage supply
>> +
>> +  vci-supply:
>> +    description: voltage supply for analog circuits
>> +
>> +  reset-gpios: true
>> +  width-mm: true
>> +  height-mm: true
>> +  panel-timing: true
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - width-mm
>> +  - height-mm
>> +  - panel-timing
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/gpio/gpio.h>
>> +
>> +    dsi {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        panel@0 {
>> +            compatible = "samsung,s6e8aa5x01";
>> +            reg = <0>;
>> +
>> +            vdd-supply = <&panel_vdd_reg>;
>> +            vci-supply = <&panel_vci_reg>;
>> +
>> +            reset-gpios = <&gpd3 4 GPIO_ACTIVE_HIGH>;
>> +
>> +            width-mm = <62>;
>> +            height-mm = <128>;
>> +
>> +            panel-timing {
>> +                clock-frequency = <73094400>;
>> +
>> +                hactive = <720>;
>> +                hsync-len = <2>;
>> +                hfront-porch = <62>;
>> +                hback-porch = <26>;
>> +
>> +                vactive = <1480>;
>> +                vsync-len = <2>;
>> +                vfront-porch = <12>;
>> +                vback-porch = <10>;
>> +            };
>> +        };
>> +    };
>> +
>> +...
>> 
