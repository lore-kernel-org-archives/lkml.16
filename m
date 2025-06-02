Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896C66ADD;
	Mon,  2 Jun 2025 07:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748847958; cv=none; b=RIavMOu4VvuDrrmC178tDX5UhmMdhJN0M/mzjIC/b2F4+jVQsknyLmFVcDogmrjOEXrP+5aWNGvAJAeK0i7liq4uohtFx4CdF8ptdGoCvpn4kugBzFdZ/y+1m4J3VyrgLn+ITAd7Sb1PVGBPzumum4YednvSLtm7516TjFQuhY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748847958; c=relaxed/simple;
	bh=3Zpf+Qil/YamO+qg691NiwhwZgCq5Dm12QIEOCFrJ6c=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=HZbwQANqbptp0hVkiN5MNTzSv3cmBVWghyCppFaD1tCTgmrCmVukcrDED5KaLL2/iMRl3R0kRN/tMTGM04LaYpC1UOjEn/E2taSehiTz6SS2A+pRhSAJ5tl1OGbTKNXDTTVXA2zSdvMqIU/G3/d+9du/7iipPcerfWUI88qf9V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=etUHg7kT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="etUHg7kT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB657C4CEEB;
	Mon,  2 Jun 2025 07:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748847958;
	bh=3Zpf+Qil/YamO+qg691NiwhwZgCq5Dm12QIEOCFrJ6c=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=etUHg7kTonia1iJXlF47bA1+U3Jo/kbCY0MlSz+el5nFAhOkEFfmEm7b/imINjoVU
	 DwsuDKEMWSga885lYX8J+HnjqXmV881U32GnZWArkfBnmjeoUxTBd+YdYRxN08wn1g
	 /u2hj8bjAsPM8NsM2A1CRTS5Dam2Nf0LQ42GuZfVEAlMtFLbjtVmuhU++bfdPtUqmF
	 Pkl3WPlSkpwXqYJawUaWwce8dVQAHOzdhGu6KD6uePzU4lveXH8RPj4veguo2pH8pm
	 B4IUHgRcFTWHXbuku119cB0cjTEErAjMLTBG8h+35c+UewGdt1eK/TYia+bUvV+0Ql
	 9frlkRJvZUEWw==
Date: Mon, 02 Jun 2025 02:05:56 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: claudiu.beznea@tuxon.dev, vigneshr@ti.com, krzk+dt@kernel.org, 
 nicolas.ferre@microchip.com, krzysztof.kozlowski+dt@linaro.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 miquel.raynal@bootlin.com, alexandre.belloni@bootlin.com, richard@nod.at, 
 conor+dt@kernel.org, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org
To: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
In-Reply-To: <20250602053507.25864-2-balamanikandan.gunasundar@microchip.com>
References: <20250602053507.25864-1-balamanikandan.gunasundar@microchip.com>
 <20250602053507.25864-2-balamanikandan.gunasundar@microchip.com>
Message-Id: <174884795608.25189.1492407932074912521.robh@kernel.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: mtd: microchip-nand: convert txt
 to yaml


On Mon, 02 Jun 2025 11:05:04 +0530, Balamanikandan Gunasundar wrote:
> Convert text to yaml for microchip nand controller
> 
> Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
> ---
>  .../devicetree/bindings/mtd/atmel-nand.txt    |  50 ------
>  .../mtd/microchip,nand-controller.yaml        | 169 ++++++++++++++++++
>  2 files changed, 169 insertions(+), 50 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/microchip,nand-controller.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/mtd/microchip,nand-controller.example.dtb: /example-0/ebi@10000000: failed to match any schema with compatible: ['atmel,sama5d3-ebi']
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/microchip,nand-controller.example.dtb: nand-controller (atmel,sama5d3-nand-controller): #address-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/microchip,nand-controller.example.dtb: nand-controller (atmel,sama5d3-nand-controller): #size-cells: 0 was expected
	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250602053507.25864-2-balamanikandan.gunasundar@microchip.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

