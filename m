Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68622727E2;
	Wed,  2 Jul 2025 13:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751462910; cv=none; b=E4QYsGWVCrxXlEkXVobZajC9u+7MaKcIrNcnrtaMqieVtv3fvwr+PqXx8f4/8/T2KnJOSPGyYYdKjtOGY47AW2AxxW4FLrqwKOrsQKapdwmaaIGdE1qB9qrN/WPhy7OS3qI2gocnpib2IisP87VE+HMyDgufhF/wWhR6C9teGiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751462910; c=relaxed/simple;
	bh=s7dPMDSNFCaxgnmXl3jsTNsiVKnZxD23neqgWnhUH6E=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=XpZn3czYLY78BzUezaUwSdheSMF5LmoXi25HCuw+8ls0h4dRfT8vdRqlYibziOD6wOldRAPAFIj5Qss/PtlgCaDiP6H+67VWdoZH601tfBkaU/Vz+m365SuJs4ClTr1q4KgBpmvSRwoWS5fLLHVdSPCWlu5fDo3Dll1URVfLwZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cnaI9L1O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cnaI9L1O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40A67C4CEED;
	Wed,  2 Jul 2025 13:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751462910;
	bh=s7dPMDSNFCaxgnmXl3jsTNsiVKnZxD23neqgWnhUH6E=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=cnaI9L1OWTrKRNlCI4KsY+Atqx8R1kDdC5c/OC0xo5+PomSudEdO3KrPRFL96mhLP
	 0E4qYktzHnRZlW+fyuxxpATSfRKYuRLdco3vymq0BtAOy0r7Kvk2kiRg0WvOLCYl71
	 46ilTbvTphSUThoDDK9ohos5adiyiuZAjH0EpZ8c9qd1rBOnERdg1u7M8uEOE4vrFW
	 +aFWXdGSZCVS/QriSL9i5YCbq8NzVfvlxHG406eE7MM4EZ22diFt3vc+dhJi0LlWnV
	 lnOMRN8L9txAdDGVTGDkvBxrxI8iJk3G1NxkoUdlwq+xN0UFXWXqwp3fOrBupViVcV
	 XKjYst3PKGJqQ==
Date: Wed, 02 Jul 2025 08:28:29 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vladimir Zapolskiy <vz@mleia.com>, linux-mtd@lists.infradead.org, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, imx@lists.linux.dev, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>
To: Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20250701212525.3106709-1-Frank.Li@nxp.com>
References: <20250701212525.3106709-1-Frank.Li@nxp.com>
Message-Id: <175146290703.1131376.6667811203278241042.robh@kernel.org>
Subject: Re: [PATCH v2 1/1] dt-bindings: mtd: convert lpc32xx-mlc.txt to
 yaml format


On Tue, 01 Jul 2025 17:25:24 -0400, Frank Li wrote:
> Convert lpc32xx-mlc.txt to yaml format.
> 
> Additional changes:
> - replace _ with - in property names.
> - add missed clocks to align lpc32xx.dtsi.
> - allow partitions subnode.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - remove nand-controller.yaml.
> - add clocks
> - update examples to align lpc32xx.dtsi
> - add partitions although no mlc users under upstream tree. It should be
> similar with slc case.
> ---
>  .../devicetree/bindings/mtd/lpc32xx-mlc.txt   | 50 -----------
>  .../bindings/mtd/nxp,lpc3220-mlc.yaml         | 88 +++++++++++++++++++
>  2 files changed, 88 insertions(+), 50 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mtd/lpc32xx-mlc.txt
>  create mode 100644 Documentation/devicetree/bindings/mtd/nxp,lpc3220-mlc.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/nxp,lpc3220-mlc.example.dtb: nand-controller@200a8000 (nxp,lpc3220-mlc): '#address-cells' is a required property
	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/nxp,lpc3220-mlc.example.dtb: nand-controller@200a8000 (nxp,lpc3220-mlc): '#size-cells' is a required property
	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250701212525.3106709-1-Frank.Li@nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

