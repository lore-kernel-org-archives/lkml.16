Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E1813A86C;
	Wed, 16 Apr 2025 18:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744826426; cv=none; b=bIohtQMkGVneUgupjEGJgC7IOSzn0//Ibv/oheSK02co14TJrrNdhMTX/h4HO5d8XYcIXBsBQHIVwuDLKg+urA8QW+uL27knNhTfF9EJO6viFeecNuxMKkK6lEubew7LmksPnUGW6fInzZD5WzZKYHp2M4r7wMm5DZWXg+JvXfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744826426; c=relaxed/simple;
	bh=NvRCseR8XTCBOHm9X3PzrTsi5/cSHof+nmIAr71ohvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XCsqGxLXFEylM4G6s2M5BZaZDl5y5zmB4DywUOgIo/stGmqKlzu2NXAexgpzXPOYbXuzS4+alyxFL/e4ijXo/wkPLtD+9Oih8XpExmPp1E2nWSORSzhfM2Dg2bWRZXFBXqHPckZcL1M6OTqI1EseR5rFupMOvkzDAJwm9yQC2Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y1eDgWpC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y1eDgWpC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9942C4CEE2;
	Wed, 16 Apr 2025 18:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744826426;
	bh=NvRCseR8XTCBOHm9X3PzrTsi5/cSHof+nmIAr71ohvA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y1eDgWpCO0Sc38BrdWct4412aXZZ2S0Q+H4tXDbo54dYOanjpTE56BeaRFrGjqFsp
	 eKhU8cqZhQYhdVuv5JjZCOAAQFLcrMprQCW+5LpExdMCJfQkn8TUCThBoFwn7LAU6k
	 nDov2HkbKk18xfZOAwLj1CHhzNR4kGUhAsxBCg8xO+8eh1580ba5FK2KhFQ4Ghi32s
	 bXtT62xdUDOvUSPB2E9hdaIDZJHT/v5I2pbeM0B3POp4MS+WS2VkrkmdzRPB7kDZXO
	 80Nv5CAZO2O8KtppTk1gFtnij8ZYCEjTj1kcG6TkHiMHZhGmnAa32JW15Qeyj5dfhv
	 ghSI2i6+t1n6Q==
Date: Wed, 16 Apr 2025 13:00:23 -0500
From: Rob Herring <robh@kernel.org>
To: Pin-yen Lin <treapking@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Kaehlcke <mka@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 2/4] dt-bindings: usb: Add binding for PS5511 hub
 controller
Message-ID: <20250416180023.GB3327258-robh@kernel.org>
References: <20250415094227.3629916-1-treapking@chromium.org>
 <20250415094227.3629916-3-treapking@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415094227.3629916-3-treapking@chromium.org>

On Tue, Apr 15, 2025 at 05:41:59PM +0800, Pin-yen Lin wrote:
> Parade PS5511 is USB hub with 4 USB 3.2 compliant 5Gbps downstream(DS)
> ports, and 1 extra USB 2.0 downstream port. The hub has one reset pin
> control and two power supplies (3V3 and 1V1).
> 
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> 
> ---
> 
> Changes in v2:
> - Inherit usb-hub.yaml
> - Fix bindings to reject port@5/device@5 for 3.0 hub correctly
> - Minor string fixes
> 
>  .../bindings/usb/parade,ps5511.yaml           | 115 ++++++++++++++++++
>  1 file changed, 115 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/parade,ps5511.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/parade,ps5511.yaml b/Documentation/devicetree/bindings/usb/parade,ps5511.yaml
> new file mode 100644
> index 00000000000000..86c75d69ee35b2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/parade,ps5511.yaml
> @@ -0,0 +1,115 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/parade,ps5511.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Parade PS5511 4+1 Port USB 3.2 Gen 1 Hub Controller
> +
> +maintainers:
> +  - Pin-yen Lin <treapking@chromium.org>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - usb1da0,5511
> +      - usb1da0,55a1
> +
> +  reg: true
> +
> +  '#address-cells': true
> +
> +  '#size-cells': true

Drop these 3.

> +
> +  reset-gpios:
> +    items:
> +      - description: GPIO specifier for RESETB pin.
> +
> +  vddd11-supply:
> +    description:
> +      1V1 power supply to the hub
> +
> +  vdd33-supply:
> +    description:
> +      3V3 power supply to the hub
> +
> +  peer-hub: true
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      '#address-cells': true
> +
> +      '#size-cells': true
> +
> +    patternProperties:
> +      '^port@[1-5]$': true
> +
> +    additionalProperties: false

I would do this instead:

ports:
  $ref: /schemas/graph.yaml#/properties/ports

  patternProperties:
    '^port@':
      $ref: /schemas/graph.yaml#/properties/port

      properties:
        reg:
          minimum: 1
          maximum: 5

> +
> +patternProperties:
> +  '^.*@[1-5]$': true

And here:

additionalProperties: true
properties:
  reg:
    minimum: 1
    maximum: 5
    
> +
> +required:
> +  - compatible
> +  - reg

Already required by usb-hub.yaml.

> +  - peer-hub
> +
> +additionalProperties: false

Use unevaluatedProperties instead.

> +
> +allOf:
> +  - $ref: usb-hub.yaml#
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            enum:
> +              - usb1da0,55a1
> +    then:
> +      properties:
> +        ports:
> +          properties:
> +            port@5: false
> +      patternProperties:
> +        '^.*@5$': false
> +
> +examples:
> +  - |
> +    usb {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        /* 2.0 hub on port 1 */
> +        hub_2_0: hub@1 {
> +            compatible = "usb1da0,55a1";
> +            reg = <1>;
> +            peer-hub = <&hub_3_0>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            /* USB 2.0 device on port 5 */
> +            device@5 {
> +                reg = <5>;
> +                compatible = "usb123,4567";
> +            };
> +        };
> +
> +        /* 3.0 hub on port 2 */
> +        hub_3_0: hub@2 {
> +            compatible = "usb1da0,5511";
> +            reg = <2>;
> +            peer-hub = <&hub_2_0>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                /* Type-A connector on port 3 */
> +                port@3 {
> +                    reg = <3>;
> +                    endpoint {
> +                        remote-endpoint = <&usb_a0_ss>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> -- 
> 2.49.0.777.g153de2bbd5-goog
> 
