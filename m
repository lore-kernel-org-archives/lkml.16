Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1091B14A60C;
	Wed,  2 Jul 2025 07:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751440567; cv=none; b=OL8AfuYJXWgZCB8kKRJnw0YUCJJF/O4UywNr0vTFfxiPQrGjpQra2P4yoXgrt6TYkNhjU2453frtT3oAviJ+9PJmmmwgT8udVAl9IjrfzgQ/x2OcVCaOmcKv/Ns4SqsladUEUrzB+9wTi+ch1I2hOAOS5VeGq/YD3oFYOGr8Fss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751440567; c=relaxed/simple;
	bh=uuuPtNcVey8RE2kFPOXint0yiPIHAawaHehEcmz1wBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mYa2hTOjX1hXaSBk776Drsp1UDHMZsGXQvcZZWYGDBU7i/0iI5T0Wbz8IiOTGxiFQHM3V6PZOD+lsoHY8efAL6IQzYb8PuOl9lj1ctBximXS/35Hz/5uQQ7c4F0qq+O8rQHHOS4BqT708jdIp1RNxxvGONaC8mDX5k0Bw4BSBhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fni0EvRW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fni0EvRW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED44FC4CEEF;
	Wed,  2 Jul 2025 07:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751440565;
	bh=uuuPtNcVey8RE2kFPOXint0yiPIHAawaHehEcmz1wBE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fni0EvRWJdQyx6IRNG6gmmCoz2nj+h9CK/XrmFqrwAbCiUNsvBaKEj6RwsKCKJ7FR
	 0+PElKm1/A1DDcYWHQ72WuOvyauOTPRE5KBa5Y85py1psG/sud4sr0Gda6TJyjHdRT
	 /oPBdwoy9jbMwpyY/18GTSnwGigJSWSBmB7mNCCHcAJkcFY3yFhASAjoDwCz+cjd2r
	 hRMxKCDsJuyzlXO8ML4moqyR/SwpMUdcIjMUiSaoLVP8VyHN6sJ0orfHVIgYB+6iFM
	 NJpnEd7UUbV7QHbHi7KULoe5f8KhrVPQ33ZFyay3O4zDlSIiHbziKDFkQVTq4LDRj9
	 R728Nw4TYrnWg==
Date: Wed, 2 Jul 2025 09:16:02 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?w4FsdmFybyBGZXJuw6FuZGV6?= Rojas <noltari@gmail.com>
Cc: jdelvare@suse.com, linux@roeck-us.net, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, corbet@lwn.net, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: hwmon: Add Microchip EMC2101 support
Message-ID: <20250702-silent-capable-ferret-397cf8@krzk-bin>
References: <20250701181228.1196102-1-noltari@gmail.com>
 <20250701181228.1196102-3-noltari@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250701181228.1196102-3-noltari@gmail.com>

On Tue, Jul 01, 2025 at 08:12:27PM +0200, =C3=81lvaro Fern=C3=A1ndez Rojas =
wrote:
> Introduce yaml schema for Microchip emc2101 pwm fan controller with
> temperature monitoring.
>=20
> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> ---
>  .../bindings/hwmon/microchip,emc2101.yaml     | 79 +++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/microchip,emc=
2101.yaml
>=20
>  v2: add missing properties.
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/microchip,emc2101.ya=
ml b/Documentation/devicetree/bindings/hwmon/microchip,emc2101.yaml
> new file mode 100644
> index 000000000000..0966559d373e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/microchip,emc2101.yaml
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/microchip,emc2101.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip EMC2101 SMBus compliant PWM fan controller
> +
> +maintainers:
> +  - =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> +
> +description:
> +  Microchip EMC2101 pwm controller which supports up to 1 fan, 1 internal
> +  temperature sensor, 1 external temperature sensor and an 8 entry look
> +  up table to create a programmable temperature response.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - microchip,emc2101
> +      - microchip,emc2101-r

Nothing in description explains what 'r' is.

> +
> +  reg:
> +    maxItems: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  '#pwm-cells':
> +    const: 2
> +    description: |
> +      Number of cells in a PWM specifier.
> +      - cell 0: The PWM frequency
> +      - cell 1: The PWM polarity: 0 or PWM_POLARITY_INVERTED
> +
> +patternProperties:
> +  '^fan@0$':

This is just 'fan', not a pattern. See other bidnings.

> +    $ref: fan-common.yaml#
> +    unevaluatedProperties: false
> +    properties:
> +      reg:
> +        description:
> +          The fan number used to determine the associated PWM channel.

I can tell you: 0. Cannot be any other PWM channel.

> +        maxItems: 1
> +
> +    required:
> +      - reg
> +
> +required:
> +  - compatible
> +  - reg

Best regards,
Krzysztof

