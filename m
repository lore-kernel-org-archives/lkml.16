Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA901F3BA2;
	Fri, 11 Apr 2025 15:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744384780; cv=none; b=hVpGdJY3RVYwu16RdhXvR5QSA6aptZjyT7VdBU/HvPaoieXVUpyOQt0O5QzsHsYQ2PJz5DRzFUmrMvfRBzu1LFdX26mzpK0K4ExGUx4cGCpRWYpV+k3+0QdF4rbSkJ22hoP3/3QF8ZhsDfERkp+6K8cDROOnLyer/+Z0mBsghuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744384780; c=relaxed/simple;
	bh=vK4hBPEXs8FNoXNcakuV1C4xG7hZYj/TGbBMPIdQDTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZB9DhrT9lMQ/1RZAM0kU/r55G/8ff70yM6clxtL/sx/i6VEGI1AIPAuIdMLAIyCE5YCYgBldcVI89wHyKdxa3U1+TjrU4mvJ3tzaOBYwOiIoH0SHqYFQTAkYBO8viQ8wXsPr5H4Iki6ejelPZRApsNquNaGL5l4QSNSoVR36hQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V1keGl/U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V1keGl/U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9645FC4CEE2;
	Fri, 11 Apr 2025 15:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744384779;
	bh=vK4hBPEXs8FNoXNcakuV1C4xG7hZYj/TGbBMPIdQDTE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V1keGl/Uu6TBpFoOv7sGSO8j/L1duKmpvUyzGeMphzNSVrghWWyrDGX+zZE4hFYrI
	 qsBkUXvqjDNgTPM3q+qyq4y/wUyPFHZHefZ3OGUEoYWjuQaogeP4XgN9N0swNfZ5gs
	 iFioleiJiVLOTzyRq0kZElX0DLCNLl8pIueakWNbdyxF6vmYshKksgDf/mUCZWPAbP
	 kOX7RpyJq5GgY3Cynd0/g5QaPCx+5W+MNMflhVp/rBPh0sFe7XEfqSnv6lF1mmk7h+
	 ZO4FyW0MUN4HFEK7RsMl9digzBtVetFiG2Bnkdot5sYR2aokSGfXdQoio7TkOmoy8Y
	 gQgf8z0uD5zkA==
Date: Fri, 11 Apr 2025 10:19:38 -0500
From: Rob Herring <robh@kernel.org>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/6] dt-bindings: bus: document the IMX AIPSTZ bridge
Message-ID: <20250411151938.GA3265073-robh@kernel.org>
References: <20250408154236.49421-1-laurentiumihalcea111@gmail.com>
 <20250408154236.49421-2-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408154236.49421-2-laurentiumihalcea111@gmail.com>

On Tue, Apr 08, 2025 at 11:42:31AM -0400, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> Add documentation for IMX AIPSTZ bridge.
> 
> Co-developed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  .../bindings/bus/fsl,imx8mp-aipstz.yaml       | 104 ++++++++++++++++++
>  1 file changed, 104 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
> 
> diff --git a/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml b/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
> new file mode 100644
> index 000000000000..3e2ada7fcdf9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
> @@ -0,0 +1,104 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bus/fsl,imx8mp-aipstz.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Secure AHB to IP Slave bus (AIPSTZ) bridge
> +
> +description:
> +  The secure AIPS bridge (AIPSTZ) acts as a bridge for AHB masters issuing
> +  transactions to IP Slave peripherals. Additionally, this module offers access
> +  control configurations meant to restrict which peripherals a master can
> +  access.
> +
> +maintainers:
> +  - Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> +
> +properties:
> +  compatible:
> +    const: fsl,imx8mp-aipstz
> +
> +  reg:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  "#access-controller-cells":
> +    const: 3
> +    description:
> +      First cell - consumer type (master or peripheral)
> +      Second cell - consumer ID
> +      Third cell - configuration value

Generally the ID would be first though providers can really define 
whatever they want.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
