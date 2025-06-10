Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C35D24728D;
	Tue, 10 Jun 2025 18:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749578903; cv=none; b=aK7oQDK3G9tOEg95C/YEeGFXqP1UIDvwEZ9BwEVq1CZAVD/NPof/gJU+/jmEeEvNOOHvZj8Kq2WW5nYaOE+BalaokGgSPWqQDqT8qjvVq1FlhwJ7+/fKvGRN3o4C5cLm/0a8YB5kmebstsFM2Iu32R5zgHAcxI0QJ2jQiIvtVGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749578903; c=relaxed/simple;
	bh=EqLBaFrOMBGQ7zuSKchgyUU5IO7yC/PR2AFrIa0Lguc=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=NWhh/nOxuIkLk6ntZUAAdm+sck7MLjGLqBRI7na4VQML/nJR1CRi9xfvp1v09etQ4yaONd46hhbmCsskXgCMhuvL+iKhFWTdCySElbnVnfjn74STRyK4tHzh6iuXgRHsO1hebO49KoYU5/A0GqbXSFoXo10Tz4G1vJeb8g8aBRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C4X6Ytvx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C4X6Ytvx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4B3EC4CEF0;
	Tue, 10 Jun 2025 18:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749578902;
	bh=EqLBaFrOMBGQ7zuSKchgyUU5IO7yC/PR2AFrIa0Lguc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=C4X6YtvxjNpCzlR1Bfd/uK4KIHTn08RKsw9h+sQqFVu++ch1HzPm5Sb7a0LUKSFCr
	 zcGersk+Ab0EW6D/F8A/Fqy6EBrSjCeqoL4aJtCGzalh8XdjGLuiIDbMjU4J/PDxeF
	 e09b/Z6WmqyICn8P2i4nTOMONatoAGYiehJmX8VqkuJsA0LUuVoMgHez5j1RrBDleM
	 ikKLTWU1MTN6SZjSZBSWCSFqmgHyu+fwaTO/R53MExZCiP7gsejtuvFTHiTb0gmNhd
	 gp4Xqno3mkhXX9cA1CfLRRrCEbg1gW3vmV2u0QgbuMkVhNGHoS+MXEANOfRRphhd7G
	 ymwpq6B1xElpA==
Date: Tue, 10 Jun 2025 13:08:18 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Marco Felsch <m.felsch@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, 
 Marc Kleine-Budde <mkl@pengutronix.de>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, Shawn Guo <shawnguo@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <20250610160152.1113930-2-laurentiumihalcea111@gmail.com>
References: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
 <20250610160152.1113930-2-laurentiumihalcea111@gmail.com>
Message-Id: <174957889856.2397515.16063954809229071708.robh@kernel.org>
Subject: Re: [PATCH v7 1/6] dt-bindings: bus: document the IMX AIPSTZ
 bridge


On Tue, 10 Jun 2025 12:01:47 -0400, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> Add documentation for IMX AIPSTZ bridge.
> 
> Co-developed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/bus/fsl,imx8mp-aipstz.yaml       | 104 ++++++++++++++++++
>  1 file changed, 104 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml: oneOf: Missing additionalProperties/unevaluatedProperties constraint

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250610160152.1113930-2-laurentiumihalcea111@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

