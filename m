Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAD02040A8;
	Sat, 12 Apr 2025 17:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744477767; cv=none; b=Xj2bPrtRO4nfayeTVDfh0uNhoa2RK4zOwpt8/dhFpmqR4BSBS0pKi1b772ofXjImduhmitcC6MNkRVZftlcj/81YAiaGAeDcriSwXOwe9vJqIj8TZLePUtbIvA8NewAiX6z6K/6OMHUyXwnv/tqbp/PGKKumEfNaU9HR0NeiKLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744477767; c=relaxed/simple;
	bh=3ld2o6Mj/F94jH7yDDeMdOra5lZxxX/tPTJX7Yh+cYE=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=p0Ta4r4AFtCEI9JEnQ7HfzG2+DDUGUfvuyQX+ary5uT5lwc8YJmBIM44XlQSofGFxAlSjFMSuZZwEeyojq+RnUi7F5JTAIUYsT2MjjNRSQymxvYY86CT2XI5YBsDCvGhmEk6J4K2By2EhL86OpKTfE14s1OKZ7tyRkTdaNSVfXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IWRVIa6s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IWRVIa6s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08093C4CEE5;
	Sat, 12 Apr 2025 17:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744477767;
	bh=3ld2o6Mj/F94jH7yDDeMdOra5lZxxX/tPTJX7Yh+cYE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=IWRVIa6sQUgho1AjQlyyF1dR2vufCEmTq5gfMz6DO89U8OuHsnIbwwUFu1fxxmr6+
	 BLz2rnOjdLDRYzOxg7nfywH0THh5hUeHHf1E/ZwEUFt/2pgaUo/c2Ng5kYhiKKNXFJ
	 Al+SEkYxWCrzi7MUCzebwi0KcDKaAUClL3IZEI34S7THE1Cx7GAUT8OtdTKm4x4xmu
	 wf/ddAueD5ctLxkxcb7AnVLoDyZbdiaU5BnTBRt2sGw+maqs/GpQOPjbsBw9I6gBpZ
	 q29EMBZGXGGSU4CbJYJ+x5ELE8ADYaX37sNResOcYTYCLnhx4IbIUclRItuVsF4wNR
	 x8LOU/42YAXxA==
Date: Sat, 12 Apr 2025 12:09:26 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, Crystal Wood <oss@buserror.net>, 
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, Frank Li <Frank.Li@nxp.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-mtd@lists.infradead.org, 
 Naveen N Rao <naveen@kernel.org>, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Richard Weinberger <richard@nod.at>, 
 Nicholas Piggin <npiggin@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, David Airlie <airlied@gmail.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>
To: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
In-Reply-To: <20250412-ppcyaml-elbc-v5-4-03f0e577139f@posteo.net>
References: <20250412-ppcyaml-elbc-v5-0-03f0e577139f@posteo.net>
 <20250412-ppcyaml-elbc-v5-4-03f0e577139f@posteo.net>
Message-Id: <174447776475.1354537.103427368501741372.robh@kernel.org>
Subject: Re: [PATCH v5 4/4] dt-bindings: memory-controllers: Convert
 fsl,elbc to YAML


On Sat, 12 Apr 2025 15:16:05 +0200, J. Neuschäfer wrote:
> Convert the Freescale localbus controller bindings from text form to
> YAML. Compared to the .txt version, the YAML binding contains a new
> usage example with FCM NAND flash, and a full list of compatible strings
> based on current usage in arch/powerpc/boot/dts/.
> 
> Note that the both the compatible strings and the unit address format
> are kept as-is, for compatibility with existing kernels and device
> trees, as well as unit address readability. This results in dts
> validation warnings:
> 
>   Warning (simple_bus_reg): /example-0/localbus@f0010100/board-control@1,0:
>   simple-bus unit address format error, expected "100000000"
> 
> Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> ---
> 
> V5:
> - fix reference to fsl/lbc.txt in
>   Documentation/devicetree/bindings/display/ssd1289fb.txt
> 
> V4:
> - no changes
> 
> V3:
> - move this patch after the GPCM/FCM patches to dtschema/dtc warnings
>   due to missing bindings for fsl,elbc-gpcm-uio and fsl,elbc-fcm-nand
> - add "simple-bus" again, for compatibility with existing DTs/drivers
>   based on discussion with Crystal Wood and Rob Herring
> - fix fsl,pq2-localbus compatible properties based on mgcoge.dts / ep8248e.dts
>   (was missing "simple-bus")
> - add board-control (bcsr) example again, now using the compatible
>   string listed in Documentation/devicetree/bindings/board/fsl,bcsr.yaml
> - remove interrupt-parent property from example
> - rework the commit message
> 
> V2:
> - fix order of properties in examples, according to dts coding style
> - move to Documentation/devicetree/bindings/memory-controllers
> - clarify the commit message a tiny bit
> - remove unnecessary multiline markers (|)
> - define address format in patternProperties
> - trim subject line (remove "binding")
> - remove use of "simple-bus", because it's technically incorrect
> ---
>  .../devicetree/bindings/display/ssd1289fb.txt      |   2 +-
>  .../bindings/memory-controllers/fsl,elbc.yaml      | 158 +++++++++++++++++++++
>  .../devicetree/bindings/powerpc/fsl/lbc.txt        |  43 ------
>  3 files changed, 159 insertions(+), 44 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/memory-controllers/fsl,elbc.example.dts:29.23-34.15: Warning (simple_bus_reg): /example-0/localbus@f0010100/flash@0,0: simple-bus unit address format error, expected "0"
Documentation/devicetree/bindings/memory-controllers/fsl,elbc.example.dts:36.31-39.15: Warning (simple_bus_reg): /example-0/localbus@f0010100/board-control@1,0: simple-bus unit address format error, expected "100000000"
Documentation/devicetree/bindings/memory-controllers/fsl,elbc.example.dts:41.31-46.15: Warning (simple_bus_reg): /example-0/localbus@f0010100/simple-periph@2,0: simple-bus unit address format error, expected "200000000"
Documentation/devicetree/bindings/memory-controllers/fsl,elbc.example.dts:82.23-89.15: Warning (simple_bus_reg): /example-1/localbus@e0005000/flash@0,0: simple-bus unit address format error, expected "0"
Documentation/devicetree/bindings/memory-controllers/fsl,elbc.example.dts:91.22-97.15: Warning (simple_bus_reg): /example-1/localbus@e0005000/nand@1,0: simple-bus unit address format error, expected "100000000"

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250412-ppcyaml-elbc-v5-4-03f0e577139f@posteo.net

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

