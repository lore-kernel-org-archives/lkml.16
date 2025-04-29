Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701261990D3;
	Tue, 29 Apr 2025 07:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745911819; cv=none; b=s5xXL2Wu8T810HZ5Q2boYRiWjnZdxW8paVHgayob24PXn8DlxmLF5i9FvpoaR68EHhY+2CZ+NWiGyJh0mJcxaq3Na1qeDig42kHHNn1Y6DPwMEKWYDWf4gv2yfL8qRKjEXl4T5xIqG7nCAi1Y2apqOnAL9bayVh2eb9t43bWBmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745911819; c=relaxed/simple;
	bh=MK2qRsy+YSNDUuvgz1V3nC2n1Q5estuIm9vk+hqa+EI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FSxzA7L30/Kjlkq71GDOyMuevA/3kN7q9b1D4gXzpO74N14i9BCFV2V65s1OSFXBXgATpWca5yllqzYdJ5Cr+gPBIbHZ2HAblaVL5ilyY7fmUCma66TVQALwiRnRn3dgN7AxTp3Pby/LYoBJVrR39fpxxfxcMX1yrn9YOeIW/MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M6eS8gjj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M6eS8gjj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80B05C4CEE3;
	Tue, 29 Apr 2025 07:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745911818;
	bh=MK2qRsy+YSNDUuvgz1V3nC2n1Q5estuIm9vk+hqa+EI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M6eS8gjjYvDXEGvIN3fnM1fxSviv4VOr47zNBgJrpDweUjyN/lxKDt4+OCwxO/tT9
	 Kkl0TTllDqUgIN5VIhvtnncaQW1L7i1ZT9WFXWV8GopoXkBlz0WTTqSgFV7LGP34nj
	 0fN8U7Dpk+2YtJS0fPlEisR6pQhXFHlc5HTQZeDqiw7ATlsk6sky6Ib3ViW5GR/Y2k
	 YOCp4iXz4HZ1oN3oWXcNB1jOxMtuX/HQogAG9D5gOtuoUumQ2XEWrO/CDYmowNR3Gi
	 nm2rot91TU0KfI8NUhhT2MJJ7RNzeUyx4ei2PczoviYBiKAMfuKIZSUS9m7U1D1/Le
	 sZwISJXZ6+xIA==
Date: Tue, 29 Apr 2025 09:30:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pawel Dembicki <paweldembicki@gmail.com>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Greg KH <gregkh@linuxfoundation.org>, 
	Shen Lichuan <shenlichuan@vivo.com>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Charles Hsu <ythsu0511@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 5/5] dt-bindings: hwmon: Add bindings for mpq8785 driver
Message-ID: <20250429-dragon-of-imaginary-blizzard-e54cbb@kuoka>
References: <20250428221420.2077697-1-paweldembicki@gmail.com>
 <20250428221420.2077697-6-paweldembicki@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250428221420.2077697-6-paweldembicki@gmail.com>

On Tue, Apr 29, 2025 at 12:13:35AM GMT, Pawel Dembicki wrote:
> Add device tree bindings for Monolithic Power Systems MPQ8785, MPM82504
> and MPM3695 PMBus-compliant voltage regulators.
> 
> These bindings also documents the optional "voltage-scale-loop" property.
> 
> Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>
> ---
>  .../bindings/hwmon/pmbus/mps,mpq8785.yaml     | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
> new file mode 100644
> index 000000000000..e2a3958a61fa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +

Drop blank line.

> +$id: http://devicetree.org/schemas/hwmon/pmbus/mps,mpq8785.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-device.yaml#

From where did you take such code? Drop.

> +
> +title: Monolithic Power Systems Multiphase Voltage Regulators with PMBus
> +
> +maintainers:
> +  - Charles Hsu <ythsu0511@gmail.com>
> +
> +description: |

Drop |

> +  Monolithic Power Systems digital multiphase voltage regulators with PMBus.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mps,mpq8785
> +      - mps,mpm82504
> +      - mps,mpm3695-10

Keep alphabetical order

> +
> +  reg:
> +    maxItems: 1
> +
> +  voltage-scale-loop:

Missing vendor prefix, missing tests, missing property unit suffix
(percent? bpp?)

Or this should be just output voltage in microvolts.

Best regards,
Krzysztof

