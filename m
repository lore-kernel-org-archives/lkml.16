Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C96B529C35A;
	Fri, 27 Jun 2025 10:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751019609; cv=none; b=tq16VYNtbS8AMJrra/EAnjjZE/ZKX8//S06W+L2LXOjgUTWXbKblK0pd13QPkX11bQff8oKZmkw9HlUDkC+1P+1vxMuRHNNHqqc53UXhBNld4u6GED3uz9mmidLkZMDD0+M2kgXscoJOIFbTueBPIuaxcdXfCexS8BtS9kYSu88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751019609; c=relaxed/simple;
	bh=jTfy56VKrhd6hNQCfld48UEIWeICt41zZaAP0xWM588=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MwnEU1AyRnPcq+oTQCXxE4NkLIrKKfD9QBd+/OJZex/+DAsx8lP6UZtvlJZSN6zKorTFvMe23aefoGoNDk3h+jA5VRlDdSd3OMxZwHdUVlm+WrpgG/mH+ALVC1/TVGZj0oQHqIPkdqXnLGDnECdaxsm8lYRJRs6g4+knxHDXZ68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 844841A00;
	Fri, 27 Jun 2025 03:19:49 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 597F23F58B;
	Fri, 27 Jun 2025 03:20:04 -0700 (PDT)
Date: Fri, 27 Jun 2025 11:19:55 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, sudeep.holla@arm.com,
	cristian.marussi@arm.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, arm-scmi@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v1 1/2] dt-bindings: firmware: Add MediaTek TinySYS SCMI
 Extension protocol
Message-ID: <aF5wS6rlr_njXPQ_@pluto>
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
> +properties:

Can we add some general description too.

Thanks,
Cristian
