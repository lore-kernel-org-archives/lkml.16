Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B191C22338;
	Fri, 23 May 2025 20:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748032079; cv=none; b=qIMcX14JZ//iPdMb01abOoXDMX7A6YBTZgN1gfxAeu8JIfeKunmkHuwTC2mYglKZnPYvun25LeW2oh12CNpBR+BAKuDmiZ4XiABpaAD9Nsq1j05kWb2g2g+TZHvtG7h2Z4d/BHxUrJsmb7DGy7lLiL0rOGC+BWaGVfR25n8MIoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748032079; c=relaxed/simple;
	bh=5pRFCoeXqhY0UnsQRr8ozHb8xSRhaMoVu7vfsBGA6tA=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=BNYsxLMVwNoLOzoinYvFbN1wOw4Ydbf2nNHfyK6jo/ktTHVlR+1MppfHFDwXAy3bNbELzYkX20TR6OEy4ORLwTuUH4nUgx1C4xikTrlSWC5UPZ4GnYkCZuWXCSuXs5sAj0Y10P2yw+LuJxRvYP85oHTp5xkj9gPM3i2RKsCjcsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UNkc/+PC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UNkc/+PC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9CA4C4CEE9;
	Fri, 23 May 2025 20:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748032079;
	bh=5pRFCoeXqhY0UnsQRr8ozHb8xSRhaMoVu7vfsBGA6tA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=UNkc/+PCjIXYzEG7BSY6uIKfD3quwXneLAnthfgZi+klBMDAvmu/IHcGb+5R68ESc
	 bork2SiHf4qJBO05XZNcaqs0OsaQhONpUIJWGu2UxhsSUfjHHbxmePycm1yW21N2NP
	 /QhalNQgaXSJ6hRMGJYd87619xZb5QM+Lsp8s8fknQyWuUujhxppPvBq/sKFQjY+t/
	 Fabg9htfgMbgGXHQ9/HsSgd+MAtEIKAXzitiokDAnKrPONhEV5DKSyS0Lr1il1ITyz
	 Ax8gSrAFfZRGkNXpFt9AIcPEq6z7Igd6hnX4TBGk7/c9nxC7okYDUiBQFuXNZp5FkJ
	 bMDv7+8JCz4wg==
Date: Fri, 23 May 2025 15:27:56 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Conor Dooley <conor+dt@kernel.org>, 
 Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
To: Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20250523191844.563177-1-Frank.Li@nxp.com>
References: <20250523191844.563177-1-Frank.Li@nxp.com>
Message-Id: <174803207693.2936926.13970067014189882058.robh@kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: mfd: convert mxs-lradc.txt to yaml
 format


On Fri, 23 May 2025 15:18:43 -0400, Frank Li wrote:
> Convert mxs-lradc.txt to yaml format.
> 
> Additional changes:
> - Only keep one example.
> - Change node name to adc.
> - Add clocks and #io-channel-cells.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/mfd/fsl,imx28-lradc.yaml         | 85 +++++++++++++++++++
>  .../devicetree/bindings/mfd/mxs-lradc.txt     | 45 ----------
>  2 files changed, 85 insertions(+), 45 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mfd/fsl,imx28-lradc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mfd/mxs-lradc.txt
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/fsl,imx28-lradc.example.dtb: fake-interrupt-controller: #interrupt-cells: 9 is greater than the maximum of 8
	from schema $id: http://devicetree.org/schemas/dt-core.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250523191844.563177-1-Frank.Li@nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

