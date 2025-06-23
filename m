Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF10E7260C;
	Mon, 23 Jun 2025 14:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750688529; cv=none; b=b/0h8QBSQnGZHEkaffwxSVcxvm+alfEZFR8E4V8BnJjpyszDJhq1Ag9LSi1q+KuZMShtxTC29idQ4F6cx8X/46j1F0ZGaWjJc+Ql8BlzjyHRfe/sGRBYqy0p/JEz2uPpONg/piXMECjWbbXsbUEb/oSmBY6MCN/+micMDbl7vaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750688529; c=relaxed/simple;
	bh=M8/FB18nORJdfDyegU9zi8E3Z4snaCgnu0tkxZFO1MA=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=g76cpCNTSLrwv1oBNrC3ClFrTsfzKnl4esk+yvtj+5ahx8R07aCg1/ugHb2NBp15c8cMjOT+iJcmpoFiWJV/EkJSZebaE2ELIwcsfYbWw4HUYYBYG3vwrdwVA67U72XocXEIHQyaPAamYkj2GRSiI0O8+l4PWYPFPn3YYusJ9mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=imQ0wxZS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="imQ0wxZS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13C01C4CEEA;
	Mon, 23 Jun 2025 14:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750688529;
	bh=M8/FB18nORJdfDyegU9zi8E3Z4snaCgnu0tkxZFO1MA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=imQ0wxZSqqpK9O+CKmtdYgA7zX444k0D+P/xGxcsMHNi0t5HHoQFbzfyUpLJ/INPy
	 Ae7mEAFxSUkYY7TIccBy1jdNxc84YLUSe4DaTp+gaUiPdx2P8814uacmsuv8OXzfwF
	 tX+tl7fkVGFELnjSKSrOh7LC5AGSgp+wVq5PyPGMrK8gK4PKyJZOsIXodHOBt4fWg0
	 1J4/qtxL7YIIBzj1bN012w/fC7s/DgLpgAcAphyKoWD04o255JAy+4aBYhKup2yAyV
	 ewmgZgb8vmG+e0QFViZ7udLfHuXHqYZGp2Ln5vwN+3tYLOfmWmuhjHtKMEuITO3GBL
	 LRbEDXQEX4lFA==
Date: Mon, 23 Jun 2025 09:22:08 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: lee@kernel.org, linux-kernel@vger.kernel.org, conor+dt@kernel.org, 
 linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org, 
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, 
 kernel@collabora.com, devicetree@vger.kernel.org
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250623120038.108891-2-angelogioacchino.delregno@collabora.com>
References: <20250623120038.108891-1-angelogioacchino.delregno@collabora.com>
 <20250623120038.108891-2-angelogioacchino.delregno@collabora.com>
Message-Id: <175068852802.3230004.1923972457454728043.robh@kernel.org>
Subject: Re: [PATCH v1 1/2] dt-bindings: mfd: Add binding for MediaTek
 MT6363 series SPMI PMIC


On Mon, 23 Jun 2025 14:00:37 +0200, AngeloGioacchino Del Regno wrote:
> Add a binding for the MediaTek MT6363/6373 (and similar) multi
> function PMICs connected over SPMI.
> 
> These PMICs are found on board designs using newer MediaTek SoCs,
> such as the Dimensity 9400 Smartphone chip, or the Chromebook
> MT8196 chip.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/mfd/mediatek,mt6363.yaml         | 98 +++++++++++++++++++
>  1 file changed, 98 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt6363.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/mediatek,mt6363.yaml:
	Error in referenced schema matching $id: http://devicetree.org/schemas/regulator/mediatek,mt6363-regulator.yaml
	Tried these paths (check schema $id if path is wrong):
	/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/regulator/mediatek,mt6363-regulator.yaml
	/usr/local/lib/python3.11/dist-packages/dtschema/schemas/regulator/mediatek,mt6363-regulator.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/mediatek,mt6363.example.dtb: pmic@4 (mediatek,mt6363): regulators: 'oneOf' conditional failed, one must be fixed:
	{'compatible': ['mediatek,mt6363-regulator']} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/regulator/mediatek,mt6363-regulator.yaml#"}
	{'compatible': ['mediatek,mt6363-regulator']} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/regulator/mediatek,mt6373-regulator.yaml#"}
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6363.yaml#
Documentation/devicetree/bindings/mfd/mediatek,mt6363.example.dtb: /example-0/spmi/pmic@4/regulators: failed to match any schema with compatible: ['mediatek,mt6363-regulator']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250623120038.108891-2-angelogioacchino.delregno@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

