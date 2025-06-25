Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF0F263C9B;
	Wed, 25 Jun 2025 14:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750861516; cv=none; b=XcwTQr1s/z8SYwwTinP0X3dJFY1DpOeo67Ajxcp0WxOtXUrAW2TO9dF4zBgiC9ZoAw1dP6l1lxyIJ46sy4IAkUDNPWo8pFaAdHPE2PpTOhg3jA9X6iJrT81bd19Emi6vMW+4xjpdMGijwP1tzc18aTF1TR29Np87LFJBfd6O5+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750861516; c=relaxed/simple;
	bh=gIZwiFDHx2s0parZhM/vFYkw+llVp5IIeVaP9k00Kz4=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=L0WJuooOtvi95aN1DR1BW/ln67bpoofEhdSB0E3hWo8t5s3CUnv4wJKC5zdsNXVLLo7iceEolA2YnQyzvkvQ2M3C0OD39T5krsB7tMYL/IDNasxE7LO5k4JWhwAp7LrpzSaYs+Ay6irCjeD83YMUILnRC7+z3e/+2u4tK96zB3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rO3IxLe0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rO3IxLe0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37455C4CEEA;
	Wed, 25 Jun 2025 14:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750861516;
	bh=gIZwiFDHx2s0parZhM/vFYkw+llVp5IIeVaP9k00Kz4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=rO3IxLe0y98Aa+TBhnVRMW8EDC8jpipS4BCaCL5vCAh2n8+7aeZ7jhaOraQMgb35v
	 iT1PqyGzUNtg7O9wzmOU5+vS+e27TBxlHG0ilpiwnLEV1GaqjFVomclH+G+KxrWMoU
	 ob/Z6p0U7PwOkZo/PU2IQQ9eIMvJk63Hb08IdCNCaGLB07wk36yIyDSZ0qlySmilfj
	 DIwqjPy0oYSULDE65PILOvU4lP9/POFpdgxJ4HYUBAmEeyBzyPYTbSXxBwZ2otCVvW
	 di0loxqHsJOwvrQ5/H/LMqybkU7frVpgsljwSMoUja0Vq+toA69paGMORRPo9UWDmw
	 y6MQtv/UH+OCQ==
Date: Wed, 25 Jun 2025 09:25:15 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 David Airlie <airlied@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Simona Vetter <simona@ffwll.ch>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
In-Reply-To: <20250625-panel-synaptics-tddi-v2-1-7a62ab1d13c7@disroot.org>
References: <20250625-panel-synaptics-tddi-v2-0-7a62ab1d13c7@disroot.org>
 <20250625-panel-synaptics-tddi-v2-1-7a62ab1d13c7@disroot.org>
Message-Id: <175086151529.908340.14015506927066516002.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel: document Synaptics
 TDDI panel driver


On Wed, 25 Jun 2025 15:38:44 +0530, Kaustabh Chakraborty wrote:
> Document the driver for Synaptics TDDI (Touch/Display Integration) panels.
> Along with the MIPI-DSI panel, these devices also have an in-built LED
> backlight device and a touchscreen, all packed together in a single chip.
> Also, add compatibles for supported panels - TD4101 and TD4300.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  .../display/panel/synaptics,td4300-panel.yaml      | 89 ++++++++++++++++++++++
>  1 file changed, 89 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/panel/synaptics,td4300-panel.example.dtb: /example-0/dsi/panel@0: failed to match any schema with compatible: ['synaptics,td4300-panel']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250625-panel-synaptics-tddi-v2-1-7a62ab1d13c7@disroot.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

