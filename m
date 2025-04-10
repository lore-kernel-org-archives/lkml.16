Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9E120AF77;
	Thu, 10 Apr 2025 07:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744270172; cv=none; b=ogJ2CbSWRURZoL1KkeME7vjV098ZYYCd3AtdP9+ZjT66/qqGjE+5WlmQ0FhKk83U+I56hJLfykdFkNCaSXeXDtnie8d10Br6IFvJOI+/bCmO9/DONhVBeLyoF56728BhzwWCwn4kQ4vt2V4ogAW0IEuGs+7Zg05BQHOXYpDZA74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744270172; c=relaxed/simple;
	bh=OGYNRgQopSq7MTnNOOCJV0HUeFVtR+nQ/5cCkY8zlEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M4S3yXYcCMwGiVr2BH4RXSA10rAoChW26Q1cPZBt0ja0/PyGB/e86OeP9luKhLRpNVc1aiCmng66xKBTjUn4ZVaJLI7YlB4CSZuCCP8EUzGP/ko0N45GfXIpUcF//GFH2RuZirFrVszev9ZbPSecGfDmrt5mr3DTtV03EaGB1bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fp+Sj79S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fp+Sj79S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45765C4CEEA;
	Thu, 10 Apr 2025 07:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744270170;
	bh=OGYNRgQopSq7MTnNOOCJV0HUeFVtR+nQ/5cCkY8zlEg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fp+Sj79S4PEoDdHd6SL77A77I9x4L+/H97awloSYzSb+qwGjS24WULW21oAyEHdqt
	 Y/Vn3YBpduLwtwnj/TQlwBerBpkFp8FEhxIQT9ff1wOZxRcO/nO0jWVwa47Q2QoCV3
	 frDGz/4bVhWMLdQQEchkiC14TgOUdeQ5LNi5wZG/KDmB5GSPY9kg04+5LySqFNH59r
	 imdd3x3+ttQKh4BN7uYs+vbhbdiIlw6hFlJFnYfMYZNAYFsUqZthXzJrERV7ptk4uI
	 rXcn1ONdmlnesAWGhy00P30R8Imhv9luMalQ2zbhgRG/B+ryBd9YqgxJPifImfh+U5
	 RTPHZ2CpaqHFA==
Date: Thu, 10 Apr 2025 09:29:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nipun Gupta <nipun.gupta@amd.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, krzk+dt@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org, 
	conor+dt@kernel.org, ogabbay@kernel.org, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	derek.kiernan@amd.com, dragan.cvetic@amd.com, arnd@arndb.de, praveen.jain@amd.com, 
	harpreet.anand@amd.com, nikhil.agarwal@amd.com, srivatsa@csail.mit.edu, code@tyhicks.com, 
	ptsm@linux.microsoft.com
Subject: Re: [PATCH v2 1/3] dt-bindings: accel: add device tree for AMD PKI
 accelerator
Message-ID: <20250410-flat-violet-bull-a2a0b7@shite>
References: <20250409173033.2261755-1-nipun.gupta@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250409173033.2261755-1-nipun.gupta@amd.com>

On Wed, Apr 09, 2025 at 11:00:31PM GMT, Nipun Gupta wrote:
> Add binding documentation for AMD PKI accelerator supported for AMD
> versal-net SoC.
>

A nit, subject: drop second/last, redundant "device tree for". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

You already got this comment...

> AMD PKI accelerator is a device on AMD versa-net SoC to execute public key
> asymmetric crypto operations like ECDSA, ECDH, RSA etc. with high performance.
> The driver provides accel interface to applications for configuring the device
> and performing the required operations. AMD PKI device comprises of multiple
> Barco Silex ba414 PKI engines bundled together, and providing a queue based
> interface to interact with the device.

...

> 
>  .../bindings/accel/amd,versal-net-pki.yaml    | 58 +++++++++++++++++++
>  MAINTAINERS                                   |  8 +++
>  2 files changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/accel/amd,versal-net-pki.yaml

That's a crypto device, so goes to 'crypto' directory.

> 
> diff --git a/Documentation/devicetree/bindings/accel/amd,versal-net-pki.yaml b/Documentation/devicetree/bindings/accel/amd,versal-net-pki.yaml
> new file mode 100644
> index 000000000000..2dca7458f845
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/accel/amd,versal-net-pki.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/accel/amd,versal-net-pki.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: AMD PKI accelerator device
> +
> +maintainers:
> +  - Nipun Gupta <nipun.gupta@amd.com>
> +  - Praveen Jain <praveen.jain@amd.com>
> +
> +description: |
> +  AMD PKI accelerator handles the public key asymmetric crypto operations.
> +  The driver provides accel interface to the application for configuring the
> +  device and performing the required operations. AMD PKI device comprises of
> +  multiple Barco Silex ba414 PKI engines bundled together, and providing a
> +  queue based interface to interact with these devices on AMD versal-net SoC.
> +
> +  Link to ba414 datasheet:
> +  https://datasheet.datasheetarchive.com/originals/crawler/barco-silex.com/34b540b9dc5db40c5bc01999401cf1e4.pdf
> +
> +properties:
> +  compatible:
> +    const: amd,versal-net-pki
> +
> +  reg:
> +    description: AMD PKI register space

Drop description, obvious.

> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +

And the resets? I understand from previous email that there is a reset controller.

> +  iommus: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - iommus
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    bus {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        amdpk@20400000000 {

crypto@

> +            compatible = "amd,versal-net-pki";
> +            interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
> +            reg = <0x204 0x00000000 0x0 0x10000>;
> +            iommus = <&smmu 0x25b>;
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 96b827049501..11f8815daa77 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1154,6 +1154,14 @@ F:	Documentation/networking/device_drivers/ethernet/amd/pds_core.rst
>  F:	drivers/net/ethernet/amd/pds_core/
>  F:	include/linux/pds/
> 
> +AMD PKI DRIVER
> +M:	Nipun Gupta <nipun.gupta@amd.com>
> +M:	Praveen Jain <praveen.jain@amd.com>
> +L:	dri-devel@lists.freedesktop.org
> +S:	Maintained
> +T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git

Are you going to apply patches to this tree?

Best regards,
Krzysztof

