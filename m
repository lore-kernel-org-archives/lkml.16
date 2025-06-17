Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B5E1DE4E5;
	Tue, 17 Jun 2025 13:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750167841; cv=none; b=M30CvqPktIIByXK+vrqn6w8F0WX0M7wwdNH6gG/TVkcpfdaKRS+Qxk1bI6air/rAlzNpXGohdiStZ+aI0F+xU0Jx8YvlB5f45KSc4/00ph9w0y5LesKkG8iaIRx4MYwgN+EV+e74QoREFUTi9YiTRXtMR0L4bENBNCYCANsqmhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750167841; c=relaxed/simple;
	bh=sEgaAS8/P8uAA+q4Tevugwx8QH0Jyz9OE26t4H0UCyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cyfl8pVxgawfdOuMzXGekUQMxp8JVnttKMpRA5Z6lM9Cq36zF+mYrsh4glJQ23LczS2u/veOaQCdNMCC6eTrD4tVICGbu+H9KDwummlnppNsJ+lG9DQMZnuMikthVgcDvTLIuj6wXuNHO+36gsUzwRxmcqqaIYsNEDjoD8h1K7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VomeLmSo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VomeLmSo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90D7AC4CEE3;
	Tue, 17 Jun 2025 13:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750167840;
	bh=sEgaAS8/P8uAA+q4Tevugwx8QH0Jyz9OE26t4H0UCyU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VomeLmSolsLQ3Xe0vJ5cxJzwu6goEfTFlc1mzihy+DRFo/8jfT94SqSZf5mhWXHkb
	 SSBYR749aY9a2vVBgtmzgmZLO9+6dj1bq8Dz5qQo8QWhiike0rvkA9EfMm8B6/ZvJL
	 q+FlEGTd7XEH9o3ab0T3kM5m6zw+7kYG9o8xs/bdHB81aBV4L6wGksPcgyObCDqbHq
	 D1pijcCjKB5SUcmaHu7hepJWPhNbFdvcJjKnTH27+JPkPJGCfDiQASJ3u5YRlIkzCf
	 /remcfwstu8879VqY6pAmAZS9n8+Inp03w5lgIQ+zI/E6R2b/lM9wliLFaSlpgmYQ+
	 h6HtWgcdte/9Q==
Date: Tue, 17 Jun 2025 08:43:59 -0500
From: Rob Herring <robh@kernel.org>
To: Joy Zou <joy.zou@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev, frank.li@nxp.com,
	ye.li@nxp.com, ping.bai@nxp.com, aisheng.dong@nxp.com
Subject: Re: [PATCH v1 1/2] dt-bindings: regulator: add PF0900 regulator yaml
Message-ID: <20250617134359.GA1895818-robh@kernel.org>
References: <20250617102025.3455544-1-joy.zou@nxp.com>
 <20250617102025.3455544-2-joy.zou@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617102025.3455544-2-joy.zou@nxp.com>

On Tue, Jun 17, 2025 at 06:20:24PM +0800, Joy Zou wrote:
> Add device binding doc for PF0900 PMIC driver.
> 
> Signed-off-by: Joy Zou <joy.zou@nxp.com>
> ---
>  .../regulator/nxp,pf0900-regulator.yaml       | 179 ++++++++++++++++++

Filename matching compatible. So drop '-regulator'.

>  1 file changed, 179 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml
> 
> diff --git a/Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml b/Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml
> new file mode 100644
> index 000000000000..32e2ded92e2c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml
> @@ -0,0 +1,179 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/nxp,pf0900-regulator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP PF0900 Power Management Integrated Circuit regulators
> +
> +maintainers:
> +  - Joy Zou <joy.zou@nxp.com>
> +
> +description:
> +  The PF0900 is a power management integrated circuit (PMIC) optimized
> +  for high performance i.MX9x based applications. It features five high
> +  efficiency buck converters, three linear and one vaon regulators. It
> +  provides low quiescent current in Standby and low power off Modes.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nxp,pf0900
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  regulators:
> +    type: object
> +
> +    properties:
> +      "VAON":

Don't need quotes.

> +       type: object
> +       $ref: regulator.yaml#
> +

Drop blank line.

> +       unevaluatedProperties: false
> +
> +    patternProperties:
> +      "^LDO[1-3]$":
> +        type: object
> +        $ref: regulator.yaml#
> +        description:
> +          Properties for single LDO regulator.
> +
> +        unevaluatedProperties: false

Move this after the $ref.

> +
> +      "^SW[1-5]$":
> +        type: object
> +        $ref: regulator.yaml#
> +        description:
> +          Properties for single SW regulator.
> +
> +        properties:
> +          nxp,dvs-run-microvolt:
> +            minimum: 300000
> +            maximum: 1350000
> +            description:
> +              PMIC default "RUN" state voltage in uV. SW1~5 have such
> +              dvs(dynamic voltage scaling) property.
> +
> +          nxp,dvs-standby-microvolt:
> +            minimum: 300000
> +            maximum: 1350000
> +            description:
> +              PMIC default "STANDBY" state voltage in uV. SW1~5 have such
> +              dvs(dynamic voltage scaling) property.
> +
> +        unevaluatedProperties: false
> +
> +    additionalProperties: false

Same with these.

> +
> +  nxp,i2c-crc-enable:
> +    type: boolean
> +    description: If the PMIC OTP_I2C_CRC_EN is enable, you need to add this property.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - regulators
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        pmic@8 {
> +            compatible = "nxp,pf0900";
> +            reg = <0x08>;
> +            interrupt-parent = <&pcal6524>;
> +            interrupts = <89 IRQ_TYPE_LEVEL_LOW>;
> +            nxp,i2c-crc-enable;
> +
> +            regulators {
> +                VAON {
> +                    regulator-name = "VAON";
> +                    regulator-min-microvolt = <1800000>;
> +                    regulator-max-microvolt = <3300000>;
> +                    regulator-boot-on;
> +                    regulator-always-on;
> +                };
> +
> +                SW1 {
> +                    regulator-name = "SW1";
> +                    regulator-min-microvolt = <500000>;
> +                    regulator-max-microvolt = <3300000>;
> +                    regulator-boot-on;
> +                    regulator-always-on;
> +                    regulator-ramp-delay = <1950>;
> +                };
> +
> +                SW2 {
> +                    regulator-name = "SW2";
> +                    regulator-min-microvolt = <300000>;
> +                    regulator-max-microvolt = <3300000>;
> +                    regulator-boot-on;
> +                    regulator-always-on;
> +                    regulator-ramp-delay = <1950>;
> +                };
> +
> +                SW3 {
> +                    regulator-name = "SW3";
> +                    regulator-min-microvolt = <300000>;
> +                    regulator-max-microvolt = <3300000>;
> +                    regulator-boot-on;
> +                    regulator-always-on;
> +                    regulator-ramp-delay = <1950>;
> +                };
> +
> +                SW4 {
> +                    regulator-name = "SW4";
> +                    regulator-min-microvolt = <300000>;
> +                    regulator-max-microvolt = <3300000>;
> +                    regulator-boot-on;
> +                    regulator-always-on;
> +                    regulator-ramp-delay = <1950>;
> +                };
> +
> +                SW5 {
> +                    regulator-name = "SW5";
> +                    regulator-min-microvolt = <300000>;
> +                    regulator-max-microvolt = <3300000>;
> +                    regulator-boot-on;
> +                    regulator-always-on;
> +                    regulator-ramp-delay = <1950>;
> +                };
> +
> +                LDO1 {
> +                    regulator-name = "LDO1";
> +                    regulator-min-microvolt = <750000>;
> +                    regulator-max-microvolt = <3300000>;
> +                    regulator-boot-on;
> +                    regulator-always-on;
> +                };
> +
> +                LDO2 {
> +                    regulator-name = "LDO2";
> +                    regulator-min-microvolt = <650000>;
> +                    regulator-max-microvolt = <3300000>;
> +                    regulator-boot-on;
> +                    regulator-always-on;
> +                };
> +
> +                LDO3 {
> +                    regulator-name = "LDO3";
> +                    regulator-min-microvolt = <650000>;
> +                    regulator-max-microvolt = <3300000>;
> +                    regulator-boot-on;
> +                    regulator-always-on;
> +                };
> +            };
> +        };
> +     };
> -- 
> 2.37.1
> 
