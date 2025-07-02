Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5640289E03;
	Wed,  2 Jul 2025 13:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751462909; cv=none; b=j2BHqNzOKXzsn4V42RXAveU24kuXh1unkugBb+TgIu9E1U4QCfin1xmGP6BsNckf9HFoArDOhoHx/aV5s7NloNXukmK4J5yK7TAxBhW2tTA8/BD5/xGofb6ZvABd2xQSGXXAQPSLIQPt0hRro0rZ3X1yPKEpwcA5djY0p1FINzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751462909; c=relaxed/simple;
	bh=wkmkkZivDEA1UxZm/WS0P0Mc3cKQij1LFXnN/TyZv7I=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=SziU1ZE23Gh05cTCzKRzT0adyMSfRgKSoZfCbxLI/iKuI8BvUT+LZtmdMUgoLc+2R+3d/X+Pr/vDWorGgYoM1C912iHT7cbsNX3W8rjmb0Vw/kAD/PwosmTxgGktkWG5SxUFaxKcuuC+FwfMA733y8Ztf+Je5Nu+iMnTotTr1sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pt9YTI+t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pt9YTI+t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 261FEC4CEED;
	Wed,  2 Jul 2025 13:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751462909;
	bh=wkmkkZivDEA1UxZm/WS0P0Mc3cKQij1LFXnN/TyZv7I=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=pt9YTI+tMGuYoDA8HXTHtUWsI29ivxk0ww/xQbHDQyWJ0TP0xsuFtwMFnzysFfyxD
	 MVRG8P+pyJ7h14t/sQcvsm8ieaMhSD0dBqaNhV0am/ID6Lb+nDLZK1IjpMCdtYYT5z
	 aO3tj3f7WxrB4iOV4xTqtNSuyPzrhj6Xytl7RX4Qara99G9kvPl/foVjQI/kNv2FG2
	 JlrhvK8A3Saig9cUSHKDPR23mQBMud6GeF62rrODKCgf8fQhkdHV9LO3ZROHfC3iOU
	 pXGgwo4KqMzm49iosSizxauCE7Bm/FqCJ6WvGkMSpialapgw27m4oF5HWX4Zn5u0vE
	 x1NaCIK/+kbGg==
Date: Wed, 02 Jul 2025 08:28:28 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 Richard Weinberger <richard@nod.at>, Conor Dooley <conor+dt@kernel.org>, 
 linux-mtd@lists.infradead.org, imx@lists.linux.dev, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-kernel@vger.kernel.org, 
 Vignesh Raghavendra <vigneshr@ti.com>, Vladimir Zapolskiy <vz@mleia.com>
To: Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20250701212455.3106629-1-Frank.Li@nxp.com>
References: <20250701212455.3106629-1-Frank.Li@nxp.com>
Message-Id: <175146290647.1131327.11939010351638573167.robh@kernel.org>
Subject: Re: [PATCH v2 1/1] dt-bindings: mtd: convert lpc32xx-slc.txt to
 yaml format


On Tue, 01 Jul 2025 17:24:54 -0400, Frank Li wrote:
> Convert lpc32xx-slc.txt to yaml format.
> - add clocks and partitions to match existed dts.
> - allow nand-on-flash-bbt.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - fix miss 's' at partition.yaml
> - remove ref nand-controller.yaml because existed dts have not nand child
> nodes.
> ---
>  .../devicetree/bindings/mtd/lpc32xx-slc.txt   | 52 ----------
>  .../bindings/mtd/nxp,lpc3220-slc.yaml         | 96 +++++++++++++++++++
>  2 files changed, 96 insertions(+), 52 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mtd/lpc32xx-slc.txt
>  create mode 100644 Documentation/devicetree/bindings/mtd/nxp,lpc3220-slc.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/nxp,lpc3220-slc.example.dtb: nand-controller@20020000 (nxp,lpc3220-slc): '#address-cells' is a required property
	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/nxp,lpc3220-slc.example.dtb: nand-controller@20020000 (nxp,lpc3220-slc): '#size-cells' is a required property
	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250701212455.3106629-1-Frank.Li@nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

