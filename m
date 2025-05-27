Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7275D226CE8;
	Tue, 27 May 2025 07:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748330887; cv=none; b=qC8JmubRYooVx0j16O4Oy/UTjebD9Uk4W4CuvKL9j20BAXHvVZgPAq5LLZrzsaDT+aKnHy2VXJxjsHQ96K3IIc3oDW8Yo0tIDw012sx/kuDw8MakjS/UMEcoF245R/+qz/wOY74TetjzrMpby0tXPDJV7mjVP2QP8JK4FDSAenU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748330887; c=relaxed/simple;
	bh=XVQsHomBmGb1LhclIkasP5SGZ5XsvwTi9n6tsMPgyY0=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=WvmnMfnZPw8n/utPxhXmBd8fAKpvz+SBRFbzSxaGZ7Pms1Mg55XsOyEvTyrfwH/uk7Lfjief2mH2O+ZM84TmwxOUAIPXV3O8CRknWX1VkBvMP+xp9e8Cbpo2rwE93s5AxkkFqQA+pZR+lakt7K9P9LKKhxnXmtxYnaHKqobZwpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=skjocDyS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="skjocDyS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99D8EC4CEE9;
	Tue, 27 May 2025 07:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748330886;
	bh=XVQsHomBmGb1LhclIkasP5SGZ5XsvwTi9n6tsMPgyY0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=skjocDySfnd0Cx3lKYucz3c8YOKANMO1DxUJmuQc7e5uEcnauo0XOWOxySV6/aNRM
	 b88/HyISicJURJ5O5/gsdSzKIprrvVJca8eslCOv/NrQaEbhhfuKik7RkdwIg4WO+W
	 UrWFnNSXFnjw6LE22MKdJVP6nF0kCdayK1wABuPeQfD4/5xMF6lFHuJbfoyWwNIwPA
	 xjD6j53pn1F1x2c5X5d9eduZeIUyCiBS+L1X03blgL/peQpUPPuoNXGBJQYWwdqLmk
	 cHO0u6owwUYVnswkUhCaMGZ/u0vRHrgVkJxjmvy41CNCswJGnMThfTcp+mjdcxuFT1
	 +IR7tmkRzG7bA==
Date: Tue, 27 May 2025 02:28:04 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, Shawn Guo <shawnguo@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux@ew.tq-group.com, 
 linux-arm-kernel@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Matthias Schiffer <matthias.schiffer@tq-group.com>, 
 Fabio Estevam <festevam@gmail.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
In-Reply-To: <20250527060400.1005757-1-alexander.stein@ew.tq-group.com>
References: <20250527060400.1005757-1-alexander.stein@ew.tq-group.com>
Message-Id: <174833088465.3257570.17816254353983478375.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: add TQ-Systems boards
 MBLS1028A and MBLS1028A-IND


On Tue, 27 May 2025 08:03:54 +0200, Alexander Stein wrote:
> From: Matthias Schiffer <matthias.schiffer@tq-group.com>
> 
> Add two mainboards for the TQ-Systems TQMLS1028A SoM, based on the NXP
> Layerscape LS1028A.
> 
> Signed-off-by: Matthias Schiffer <matthias.schiffer@tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/arm/fsl.yaml:1594:13: [warning] wrong indentation: expected 14 but found 12 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250527060400.1005757-1-alexander.stein@ew.tq-group.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

