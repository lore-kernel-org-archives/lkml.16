Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E316241662;
	Thu, 22 May 2025 16:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747931284; cv=none; b=doRSK6UsSbdottT4v3H6uAwMnZtmNlj/N+3WnuqxG8a04TLhBU/GU5stE1PVeoo0hvMVoR8F6hqqmyrvustcs6q5rNkPhBFSsIX2fsruI6pdh+onYPqSWEjVQGyhAo3P34Gn96xxibQcfMWHBdOBlm5etglwJbl6ztj0In0dpX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747931284; c=relaxed/simple;
	bh=NyiPQIIfELwduH7AoKb4g6Ijqllck0NOU16OdARE5yg=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=DRyoKsr16ZzFpPaKk05HxOD4NZeQTOs+azWd1gmd2fKz4E4o0DHPPZ6XEYoQdZaj5VSZ7Qi14HXXjJN1kyQV+7a5muF1XSPz+E7SQCpVHp2IGMFRt0udAXZZ++SostU+1URVsKapf7bOCplt5KMo5iL2GHq28vVxuYAtX8FRYco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EU1YcPV6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EU1YcPV6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29DECC4CEF2;
	Thu, 22 May 2025 16:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747931284;
	bh=NyiPQIIfELwduH7AoKb4g6Ijqllck0NOU16OdARE5yg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=EU1YcPV62lPn2CDEwd3NrUGdn48rE5kYlZ++IbC4/dLPjPpxWUzazHIDEyZy8PIar
	 ETTDfZaUNv0/d/Pv8N2uTcYNA1emnk+VG8Ixdnt+p09G3w+mzPxPDKDqzinKn8aB0i
	 52J1sTctfVP/8x4+9fJ2N+I7fJcjBGry3O7ufXMWqbMXV5z3Lm48Qn4JdP8/LHZorC
	 VDasXLPQztgJHAKZFv2TaL0GUo4gozfo6F3OVYobXLYVrJWz8BhcptWQi4ERHeqUlQ
	 BEFLaZcN7HrAOIHCuPEWFylkfAh+KolaaTK/V1vtRboBP49B8TS9N8Cm+9pOzT3jL6
	 g45hOMmMUqvvw==
Date: Thu, 22 May 2025 11:28:02 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Mark Brown <broonie@kernel.org>, 
 paul-pl.chen@mediatek.com, Matthias Brugger <matthias.bgg@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, singo.chang@mediatek.com, 
 linux-kernel@vger.kernel.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 jason-jh.lin@mediatek.com, linux-arm-kernel@lists.infradead.org
To: "Nancy.Lin" <nancy.lin@mediatek.com>
In-Reply-To: <20250522150426.3418225-2-nancy.lin@mediatek.com>
References: <20250522150426.3418225-1-nancy.lin@mediatek.com>
 <20250522150426.3418225-2-nancy.lin@mediatek.com>
Message-Id: <174793128032.2927822.14103783450131636692.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: regulator: mediatek: Add MT8196 vmm
 controller


On Thu, 22 May 2025 23:03:33 +0800, Nancy.Lin wrote:
> From: Nancy Lin <nancy.lin@mediatek.com>
> 
> Add a device tree binding document for the MediaTek MT8196 VMM (Vcore
> for MultiMedia) regulator controller. The VMM controller acts as the
> main power supplier for multimedia power domains, such as those used
> by display, video encode and decode subsystems. It provides virtual
> regulators that serve as the power sources for various multimedia IPs,
> and coordinates with the hardware common clock framework (hwccf) and
> the Video Companion Processor (VCP) to manage the power domains of
> these components. The regulator is controlled by the VCP firmware,
> and the operating system signals its requirement through a voting
> hardware block (hwccf).
> 
> Signed-off-by: Nancy Lin <nancy.lin@mediatek.com>
> ---
>  .../mediatek,mt8196-vmm-regulator.yaml        | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt8196-vmm-regulator.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/regulator/mediatek,mt8196-vmm-regulator.yaml: patternProperties:^(vdisp|vdec-vcore)$:properties:regulator-name:type: 'string' is not one of ['boolean', 'object']
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/regulator/mediatek,mt8196-vmm-regulator.example.dtb: vmm (mediatek,mt8196-vmm): vdisp:regulator-name: ['vdisp'] is not of type 'string'
	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt8196-vmm-regulator.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/regulator/mediatek,mt8196-vmm-regulator.example.dtb: vmm (mediatek,mt8196-vmm): vdec-vcore:regulator-name: ['vdec-vcore'] is not of type 'string'
	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt8196-vmm-regulator.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250522150426.3418225-2-nancy.lin@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

