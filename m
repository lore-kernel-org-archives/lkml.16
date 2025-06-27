Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184C82EBDE5;
	Fri, 27 Jun 2025 20:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751055246; cv=none; b=RLxxbyL5lVYRpmxzz90yOecbTRrffNWTs5UXy+7+szSB67fXBs9NCt0FVNGZWHkq3OSeqIUUvuyn9FIEGjI+dJ+oAxzCq8iWutjnpYx0PaxaBJQebwgdb3y8znCfd6RKB5W4c8yoWOZzeYVQko2OZegRvJSBKiqx/qEsh0snqeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751055246; c=relaxed/simple;
	bh=VYYXKd4DVhfkDjJTOWxBgy92/r8CsxVv0INxt3+97j4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qECGyPvz9BuEJy2b0hjmHV3KASnS+9Z7n79ke4lT124Pdjs08gavrROk7RczdF5ABbtjszcprKkwQMu7cwx/uZQkG+GWDAo0tAI7+uDVvLGVXJP9x+34cEcqBOXEyPqa76y5+GRjOC9uxVMjzVVfNlhfYiA+8hCqhLvXXLuhOXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z/h+Thul; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z/h+Thul"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE296C4CEE3;
	Fri, 27 Jun 2025 20:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751055245;
	bh=VYYXKd4DVhfkDjJTOWxBgy92/r8CsxVv0INxt3+97j4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z/h+ThulbxEHu/znIGjOtmBfK3QVP+9m7X7rsOhRBfipwgL6fy267ecQXtR6nHCIW
	 ei7Z5DrFQx44UYPwalMOGhWVIG4TKI+2bXYZYYKBCou+ua3RmCMQgj4cRaGCMwHEbL
	 g55YQfwq2jk6wuTm2CgadnwpR2YOOY9U60KRa+e6VUD51yWgMuXukMZm6C6VCnfYUX
	 18vhQka3tjURh0/9ZNbxCHJVJlSkpSsSHNchQAJinehUZq+C9v1Vp4SL3fUY82HOcK
	 a+VoYgRb1akhChMPxA3wf3yzWqHV1IFMlEbHCS9jcdPbboSq4Aoqq3Xc3FxTfIyfTO
	 LYEsckce9Rftw==
Date: Fri, 27 Jun 2025 15:14:04 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	sudeep.holla@arm.com, cristian.marussi@arm.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, arm-scmi@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v1 1/2] dt-bindings: firmware: Add MediaTek TinySYS SCMI
 Extension protocol
Message-ID: <20250627201404.GA4156149-robh@kernel.org>
References: <20250623120136.109311-1-angelogioacchino.delregno@collabora.com>
 <20250623120136.109311-2-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623120136.109311-2-angelogioacchino.delregno@collabora.com>

On Mon, Jun 23, 2025 at 02:01:35PM +0200, AngeloGioacchino Del Regno wrote:
> Add the MediaTek TinySYS SCMI Extension protocol as found on a
> number of SoCs, including MT6895 and MT8196.
> 
> This includes controls and power state notifications for the GPU,
> CPU Memory latency Manager (cm_mgr), SLBC, SSPM and others.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../firmware/mediatek,mt6895-scmi.yaml        | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/firmware/mediatek,mt6895-scmi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/firmware/mediatek,mt6895-scmi.yaml b/Documentation/devicetree/bindings/firmware/mediatek,mt6895-scmi.yaml
> new file mode 100644
> index 000000000000..98a5b81983b1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/firmware/mediatek,mt6895-scmi.yaml
> @@ -0,0 +1,22 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2025 Collabora Ltd
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/firmware/mediatek,mt6895-scmi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek System Control and Management Interface(SCMI) Vendor Protocols Extension
> +
> +maintainers:
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> +

This schema will never be applied.

> +properties:
> +  protocol@80:
> +    $ref: '/schemas/firmware/arm,scmi.yaml#/$defs/protocol-node'
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        const: 0x80
> +
> +additionalProperties: true
> -- 
> 2.49.0
> 
