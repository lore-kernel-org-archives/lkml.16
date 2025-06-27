Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502A625D906;
	Fri, 27 Jun 2025 21:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751060095; cv=none; b=YIevwUXtyfokOdjuViJPZCJE0aNBxdFhDOtAhZuHg2kw8g3y4hYgmj6ejb4fUJn2aXYTyvS8ybCinFA6iNl88+oiji6OusMQFFPKVBmHkYlkH0RixHDz1TSecGsWC/rYY7yucp77IasYvrYOUyGwYBFypzJGS5ELf5LoA943BAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751060095; c=relaxed/simple;
	bh=zDxcpATlxc/Xh8U0U+KtEf8oiXFU2XjfI0G0D8EaqQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U91C/5XucszjhzNQovqLnnO3lmVxS/gpMvuQ3D7K6XLsStxosIq2Xa6+fydNZ3sirOMx2YIzbvARzmEo2ZeHvrbjgYpsVMGnbVw8kxx7HQrkIp1PDgvbJI0kghbaFigtshDkXi5LRTf69klXvdb9tWIHn4olVGDLlQGUgXYdM+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d1CTpwJH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d1CTpwJH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5CFAC4CEE3;
	Fri, 27 Jun 2025 21:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751060094;
	bh=zDxcpATlxc/Xh8U0U+KtEf8oiXFU2XjfI0G0D8EaqQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d1CTpwJHnQwqKrl2xNH8xRpw5kLaRBQKnMk03iQ56YATlXbgBelLS0emjVWcNtLtt
	 3o9xNsv560f0MiHFveA6HAcZeKZxdKmzL45J0ZN4uOwr2rzSXLvx1kcMUEeRzap7MH
	 BF48sOe2Wv4C+NUobBsTFwKMlQEDBkd6iosqrllwebh6/s49Yx/Z+DbRSRgQsDKvGj
	 PM7nGRnCrvXhC0KJTrOiCt1o3AF++naEfTql19XhD8AvNM5dUhBcAY+LmPEq0n4JBO
	 +xlcl+Jb6cU7fqTeU5tgHCZmIP1Dl7fAUzAvfBggziUHT0FLHiahsogGpFBGCIRc0C
	 IcL6aWuADOWpg==
Date: Fri, 27 Jun 2025 16:34:54 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Cc: jdelvare@suse.com, linux@roeck-us.net, krzk+dt@kernel.org,
	conor+dt@kernel.org, corbet@lwn.net, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: hwmon: Add Microchip EMC2101 support
Message-ID: <20250627213454.GA179652-robh@kernel.org>
References: <20250626113351.52873-1-noltari@gmail.com>
 <20250626113351.52873-3-noltari@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250626113351.52873-3-noltari@gmail.com>

On Thu, Jun 26, 2025 at 01:33:50PM +0200, Álvaro Fernández Rojas wrote:
> Introduce yaml schema for Microchip emc2101 pwm fan controller with
> temperature monitoring.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> ---
>  .../bindings/hwmon/microchip,emc2101.yaml     | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/microchip,emc2101.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/microchip,emc2101.yaml b/Documentation/devicetree/bindings/hwmon/microchip,emc2101.yaml
> new file mode 100644
> index 000000000000..e73f1f9d43f4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/microchip,emc2101.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/microchip,emc2101.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip EMC2101 SMBus compliant PWM fan controller
> +
> +maintainers:
> +  - Álvaro Fernández Rojas <noltari@gmail.com>
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
> +
> +  reg:
> +    maxItems: 1
> +

> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0

What are these for? You don't have any child nodes.

> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        fan_controller: fan-controller@4c {
> +            compatible = "microchip,emc2101";
> +            reg = <0x4c>;
> +
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +        };
> +    };
> +...
> -- 
> 2.39.5
> 
