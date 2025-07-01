Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12D323506D;
	Tue,  1 Jul 2025 16:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751387577; cv=none; b=c5jej20Q1UbasyI8d78vBbezA+Y5hmAw8l8q8qNcgDvJu5EpUyvMHgILHoS18gTqya6lYAXFBgyXO1DbzzOBdsLlqHUnft6A66K/uQN2WQRONxJcNw0o4lfqV/0NrbmXQEdfeq/ybl+9/qg2tbld3t4Uq+og0WGAhr8I7I/WGSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751387577; c=relaxed/simple;
	bh=DKU+hY2Pi8zMDGgIyWh0V+54nxG1K37l+J7KI53nCWY=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=sp67S1MUY8Tyz3W7sTmABOtr2Zf9mTLvv0Kdw1JgylVKaJZk03fkLfZzq74/PF/80nHsnm3lXTr78JVoPLWarFZxwZhEiwc4yNvVZWSzVKwnZ9WSoX0G2CR0FpMfR1EhndUeIxqySScuf3nkf6WdrKEnGUc5Df68ZjeAS2G8eO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KzHvv04W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KzHvv04W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 759A9C4CEEB;
	Tue,  1 Jul 2025 16:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751387577;
	bh=DKU+hY2Pi8zMDGgIyWh0V+54nxG1K37l+J7KI53nCWY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=KzHvv04Wn0A1brDCcoyn5UjpHQJF6OUINA3RUK+fdO2OVhy5EEjoxUwYnOhjS4pCB
	 JmDT0tmx21+fzo/fop3OHhS/5PmQgErX6Q2Tq48UZfWV6fCwu+g7jK76F46It89A2L
	 fKuxxQ0WFN9L2jM/ds8giXe0TACzG3+3ds/nqB+c0Nidvitj5T8HHzGcLCy86HBsaV
	 JAWXBWeF8Ny/roZYO9D6TNlkIIYzXt3moX4mow5JBy9uv1r5NNUvUB1CsvE0y2/dw9
	 CMCMSGx8av8q3tFegW0J/5XRPdsFqNTkeu4OYHyJRWw5/2t0GaY7hnKXcd3faSOZCz
	 oMEJ4KNxXXHzQ==
Date: Tue, 01 Jul 2025 11:32:56 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: laura.nao@collabora.com, matthias.bgg@gmail.com, 
 quic_hyiwei@quicinc.com, devicetree@vger.kernel.org, kabel@kernel.org, 
 kernel@collabora.com, arnd@arndb.de, ulf.hansson@linaro.org, 
 linux-kernel@vger.kernel.org, conor+dt@kernel.org, khilman@baylibre.com, 
 pjp@fedoraproject.org, u.kleine-koenig@baylibre.com, 
 linux-mediatek@lists.infradead.org, nm@ti.com, tudor.ambarus@linaro.org, 
 m.wilczynski@samsung.com, drew@pdp7.com, krzk@kernel.org, 
 linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250701151149.136365-3-angelogioacchino.delregno@collabora.com>
References: <20250701151149.136365-1-angelogioacchino.delregno@collabora.com>
 <20250701151149.136365-3-angelogioacchino.delregno@collabora.com>
Message-Id: <175138757651.1874576.12579481478499163218.robh@kernel.org>
Subject: Re: [RFC PATCH 2/3] dt-bindings: firmware: Document the MediaTek
 Hardware Voter (HWV)


On Tue, 01 Jul 2025 17:11:48 +0200, AngeloGioacchino Del Regno wrote:
> Add documentation for the new MediaTek Hardware Voter, found in
> MediaTek SoCs like the MT8196 Kompanio Ultra for Chromebooks and
> the MT6991 Dimensity 9400 for Smartphones.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../mediatek,mt6991-hardware-voter.yaml       | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/firmware/mediatek,mt6991-hardware-voter.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/firmware/mediatek,mt6991-hardware-voter.yaml:44:2: [warning] wrong indentation: expected 2 but found 1 (indentation)

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/firmware/mediatek,mt6991-hardware-voter.example.dts:39.35-43.11: Warning (unit_address_vs_reg): /example-0/clock-controller@16640000: node has a unit name, but no reg or ranges property
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/firmware/mediatek,mt6991-hardware-voter.example.dtb: system-controller@14500000 (mediatek,mt6991-hardware-voter): power-controller:compatible:0: 'mediatek,mt8196-hwv-scp-power-controller' is not one of ['mediatek,mt6735-power-controller', 'mediatek,mt6795-power-controller', 'mediatek,mt6893-power-controller', 'mediatek,mt8167-power-controller', 'mediatek,mt8173-power-controller', 'mediatek,mt8183-power-controller', 'mediatek,mt8186-power-controller', 'mediatek,mt8188-power-controller', 'mediatek,mt8192-power-controller', 'mediatek,mt8195-power-controller', 'mediatek,mt8365-power-controller']
	from schema $id: http://devicetree.org/schemas/firmware/mediatek,mt6991-hardware-voter.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/firmware/mediatek,mt6991-hardware-voter.example.dtb: system-controller@14500000 (mediatek,mt6991-hardware-voter): reg: [[0, 340787200], [0, 12288]] is too long
	from schema $id: http://devicetree.org/schemas/firmware/mediatek,mt6991-hardware-voter.yaml#
Documentation/devicetree/bindings/firmware/mediatek,mt6991-hardware-voter.example.dtb: /example-0/system-controller@14500000/power-controller: failed to match any schema with compatible: ['mediatek,mt8196-hwv-scp-power-controller']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250701151149.136365-3-angelogioacchino.delregno@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

