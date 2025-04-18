Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3E51A76D0;
	Fri, 18 Apr 2025 11:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.209.48.109
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744976011; cv=none; b=HVKU3REaqTJrKkTKh3N9zNk5wmcYbXi4Q0Fug32hC+kyO+fVL5/UQdx8Zoi75IGmK24S4E5NGRvbEj2rEBunoD5mMU3CVOqc9wiiO0iVoS+s2b4JVapRSLRRlOYPfzNb/ymPmlkBsXUVhrash8t+3Sc6T5rljC6rHZwz8ttbxwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744976011; c=relaxed/simple;
	bh=e6rlj2nAUi+3MFA6AwmTZAAxAPEUfup+8CkpaIdBm8A=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=j+SwrAkJC7xTAAltW+/gwperd65YEGYbMm7Nejp/Tk0jPWzdqwaMnJXjYwGwt/NgdOv5Mve511Rw6SXbcNOPHsZPfpnZCguXabYabP2AtM6Fw2LJf+2myiQppH+mrf2ta+0ylMyoi9vjb+ZU8SBK/IEnFAMzvzWuI+KSXLA2V+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=agner.ch; spf=pass smtp.mailfrom=agner.ch; dkim=pass (1024-bit key) header.d=agner.ch header.i=@agner.ch header.b=vxSi13ww; arc=none smtp.client-ip=178.209.48.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=agner.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=agner.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=agner.ch header.i=@agner.ch header.b="vxSi13ww"
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 460E25C3AFC;
	Fri, 18 Apr 2025 13:25:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1744975500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dOzG+fEM39s2zzvOzq9Nh3CClcu3NIbRag3rdoSGJsM=;
	b=vxSi13wwKpcwLfzRx7RbsGs7XfIfI+2RcWMld/VZs16VBmE9bazgiOWAHKTJ4NKwxGMQCJ
	pj6i9gBkfQBtUTXqlip0C9bi5pzSFkfnE8/DMhYx4NnfwJ5FyqUhhL3LoROsE9d7dWKnXz
	fRUsS+BwEoqnYnnBC5BP0dgRHkFZMHA=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 18 Apr 2025 13:25:00 +0200
From: Stefan Agner <stefan@agner.ch>
To: Frank Li <Frank.Li@nxp.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alison Wang <alison.wang@nxp.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: display: imx: convert fsl,dcu.txt to
 yaml format
In-Reply-To: <20250417151934.3570681-1-Frank.Li@nxp.com>
References: <20250417151934.3570681-1-Frank.Li@nxp.com>
Message-ID: <9fe744c4deaa9154e201a39874b54f75@agner.ch>
X-Sender: stefan@agner.ch
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2025-04-17 17:19, Frank Li wrote:
> Convert fsl,dcu.txt to yaml format.
> 
> Additional changes:
> - remove label in example.
> - change node to display-controller in example.
> - use 32bit address in example.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Stefan Agner <stefan@agner.ch>

> ---
>  .../devicetree/bindings/display/fsl,dcu.txt   | 34 ----------
>  .../bindings/display/fsl,ls1021a-dcu.yaml     | 68 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 69 insertions(+), 35 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/fsl,dcu.txt
>  create mode 100644 Documentation/devicetree/bindings/display/fsl,ls1021a-dcu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/fsl,dcu.txt b/Documentation/devicetree/bindings/display/fsl,dcu.txt
> deleted file mode 100644
> index 63ec2a624aa94..0000000000000
> --- a/Documentation/devicetree/bindings/display/fsl,dcu.txt
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -Device Tree bindings for Freescale DCU DRM Driver
> -
> -Required properties:
> -- compatible:		Should be one of
> -	* "fsl,ls1021a-dcu".
> -	* "fsl,vf610-dcu".
> -
> -- reg:			Address and length of the register set for dcu.
> -- clocks:		Handle to "dcu" and "pix" clock (in the order below)
> -			This can be the same clock (e.g. LS1021a)
> -			See ../clocks/clock-bindings.txt for details.
> -- clock-names:		Should be "dcu" and "pix"
> -			See ../clocks/clock-bindings.txt for details.
> -- big-endian		Boolean property, LS1021A DCU registers are big-endian.
> -- port			Video port for the panel output
> -
> -Optional properties:
> -- fsl,tcon:		The phandle to the timing controller node.
> -
> -Examples:
> -dcu: dcu@2ce0000 {
> -	compatible = "fsl,ls1021a-dcu";
> -	reg = <0x0 0x2ce0000 0x0 0x10000>;
> -	clocks = <&platform_clk 0>, <&platform_clk 0>;
> -	clock-names = "dcu", "pix";
> -	big-endian;
> -	fsl,tcon = <&tcon>;
> -
> -	port {
> -		dcu_out: endpoint {
> -			remote-endpoint = <&panel_out>;
> -	     };
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/display/fsl,ls1021a-dcu.yaml b/Documentation/devicetree/bindings/display/fsl,ls1021a-dcu.yaml
> new file mode 100644
> index 0000000000000..7246c89271a8d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/fsl,ls1021a-dcu.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/fsl,ls1021a-dcu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale DCU DRM Driver
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,ls1021a-dcu
> +      - fsl,vf610-dcu
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: dcu
> +      - const: pix
> +
> +  big-endian: true
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    unevaluatedProperties: false
> +    description: Video port for the panel output
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +  fsl,tcon:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle to the timing controller node.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    display-controller@2ce0000 {
> +        compatible = "fsl,ls1021a-dcu";
> +        reg = <0x2ce0000 0x10000>;
> +        clocks = <&platform_clk 0>, <&platform_clk 0>;
> +        clock-names = "dcu", "pix";
> +        big-endian;
> +        fsl,tcon = <&tcon>;
> +
> +        port {
> +            endpoint {
> +                remote-endpoint = <&panel_out>;
> +            };
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 65e0716554203..02504134e1f5d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7894,7 +7894,7 @@ M:	Alison Wang <alison.wang@nxp.com>
>  L:	dri-devel@lists.freedesktop.org
>  S:	Supported
>  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> -F:	Documentation/devicetree/bindings/display/fsl,dcu.txt
> +F:	Documentation/devicetree/bindings/display/fsl,ls1021a-dcu.yaml
>  F:	Documentation/devicetree/bindings/display/fsl,tcon.txt
>  F:	drivers/gpu/drm/fsl-dcu/
