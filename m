Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37493EEB3;
	Thu, 12 Jun 2025 00:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749686831; cv=none; b=ek4XSrTd+eD+hmPlBNuVxp3fUu+NqYm1e1QqwSq3QhIIDz4KaMHRuvtt4pGaFyzdTWaVcGuNjJnOq+RWI5AJvjjGjct3iYCKpSQuFion6f2BqpMxEagx1mLjEnET/UOPwUPFlWMvwG5XP4YxKIu2O3stkFNhfvbJWYhdy7W3mMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749686831; c=relaxed/simple;
	bh=yRYgNOrFzerntUpYZUAnFZjaYQw5HPRxPmYpNq0gGLM=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=bfrRbEBM9tpwy6V8GrsNhmSV33kSGAlo0wFXuBtRpOcMHbTXPZeHkh8BKynO6JAfNdaAeTiSukjhIUSYMcfaCC+owM11+Cl5yNUfna7COiXXgfvcOtxALNe+jkPyKfNfhh0ovORruAlSuvL0DmKdyZMHF3BE82nvZIVUsfRTQyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j5tJviB8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j5tJviB8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 882A0C4CEE3;
	Thu, 12 Jun 2025 00:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749686830;
	bh=yRYgNOrFzerntUpYZUAnFZjaYQw5HPRxPmYpNq0gGLM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=j5tJviB8EasXTx8SQtB+WZlImJ+injl+BY+LghLAzTRK6EV0mf+X8Fy/6vydxaHPm
	 8/Wi5p6xaCh8IPj5K+BtAwbgDTXXKg9OajBzJ9lBSVPkHtUFUo5xxvgyO1na297Z2p
	 u7OmoBnscetyYh0y2UPHHl7IpINwavShRVsZWaACaW4IcjVOy3a7mwYAizYhvYnyqi
	 ZHbueN4c5Me7dhvgycz3CB8ky2NPmzAOa4FZnNXHQpPrKzxPYcgqVrXmYBmHt7bMfw
	 DXAyuljwnDNesr08zxQjynfGMJCO+j4PJJgdnCzabyNMy7o65gGzKoQJVT3LDvCYKJ
	 OWK8r3ZWcdLjQ==
Date: Wed, 11 Jun 2025 19:07:09 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 boerge.struempfel@gmail.com, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
To: =?utf-8?q?Goran_Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>
In-Reply-To: <20250611113039.304742-3-goran.radni@gmail.com>
References: <20250611113039.304742-1-goran.radni@gmail.com>
 <20250611113039.304742-3-goran.radni@gmail.com>
Message-Id: <174968682958.1745530.8791331337713653562.robh@kernel.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: arm: imx8mp: Add Ultratronik
 Ultra-MACH SBC


On Wed, 11 Jun 2025 13:30:37 +0200, Goran Rađenović wrote:
> Document the Ultratronik Ultra-MACH SBC, based on the NXP i.MX8MP SoC.
> 
> This board is manufactured by Ultratronik GmbH and uses the compatible
> string "ux,imx8mp-ultra-mach-sbc".
> 
> Signed-off-by: Goran Rađenović <goran.radni@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/fsl.yaml: properties:compatible:oneOf:130:items:0:enum: 'oneOf' conditional failed, one must be fixed:
	{'const': 'ultratronik,imx8mp-ultra-mach-sbc'} is not of type 'integer'
	{'const': 'ultratronik,imx8mp-ultra-mach-sbc'} is not of type 'string'
	{'const': 'fsl,imx8mp'} is not of type 'integer'
	{'const': 'fsl,imx8mp'} is not of type 'string'
	hint: "enum" must be an array of either integers or strings
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/fsl.yaml: properties:compatible:oneOf:130:items:0:enum:0: {'const': 'ultratronik,imx8mp-ultra-mach-sbc'} is not of type 'string'
	from schema $id: http://devicetree.org/meta-schemas/string-array.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/fsl.yaml: properties:compatible:oneOf:130:items:0:enum:1: {'const': 'fsl,imx8mp'} is not of type 'string'
	from schema $id: http://devicetree.org/meta-schemas/string-array.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250611113039.304742-3-goran.radni@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

