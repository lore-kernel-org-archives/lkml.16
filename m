Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8224321B9D1;
	Fri, 23 May 2025 15:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748014769; cv=none; b=YmXJbRGrgp1rRRaC7zYUE6EfM0NJLygAiyMwZDiLsMyVD+0XRsaHWbwwL9Mw+cD+8b6tN2h4Oiwa8jk1/Uk2nHSTbApD0btAyOS+Jifqyv2bDIuG7C6BfGeu+9R/2ZjFADFjHelJC2Sm6a7V0eyfZGvJccZGlr8lVwElWZmv3o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748014769; c=relaxed/simple;
	bh=18E7FS0wK8ykgkO6JGPWs5PwkqGlKnE8OBDhCp0GhpA=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=HyfzJXJreykEWzbCXBbVJo/rXy7QCfMpcpevIJbrEVlm1Zp+dfBRxLzkGKNq0BL8iUK9r6SBiXKXn8WlpNUOCoCLjHTZI53RDiMG9FgDXXCz1dbipLHOqdyfgQLNyC3SwCDHtHShMgzUL2HPOeK8nAfqHJ4ZFvyITF3k6/4c16M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BeDMLXtD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BeDMLXtD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEA93C4CEE9;
	Fri, 23 May 2025 15:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748014769;
	bh=18E7FS0wK8ykgkO6JGPWs5PwkqGlKnE8OBDhCp0GhpA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=BeDMLXtDk3uBLTov1EwlX3owlmDei/ILTM9jDa/7oEK+Jx17Ux8RJ5JPDYRNHtMBg
	 8j5tcpI1WhkV99G2z/Bsp0HTRqjAANq8oTXpMUxg3+Pz6WkVM3nPnjtdwQBelRVHwk
	 uZx9rY87CpVgqCHUCKYlOAj8fUqSI39CXShgzOdJiHSO1cmLETA03nIiSUol18cATo
	 b0hyR28UvCMFQjAnC7qYOTp1i7QF813pMe6asQM+Kwu2ZMdnD0cBFlN0EsTrqI6sRp
	 xXVGCDts0VC/jtnI6glXXYEEhK7iPstAzDEZ82KOYNO6nY/bQdo49yGZ2yxX8yQhYo
	 FnO8lHU32+97w==
Date: Fri, 23 May 2025 10:39:24 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20250523143637.536759-1-Frank.Li@nxp.com>
References: <20250523143637.536759-1-Frank.Li@nxp.com>
Message-Id: <174801476428.2004064.2769048577631928560.robh@kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: interrupt-controller: Add
 arm,armv7m-nvic and fix #interrupt-cells


On Fri, 23 May 2025 10:36:36 -0400, Frank Li wrote:
> According to existed dts arch/arm/boot/dts/armv7-m.dtsi, compatible string
> should be arm,armv7m-nvic, #interrupt-cells is 1 and
> arm,num-irq-priority-bits is optional property.
> 
> Fix below CHECK_DTB warning:
> 
> arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: /interrupt-controller@e000e100:
>     failed to match any schema with compatible: ['arm,armv7m-nvic']
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/interrupt-controller/arm,nvic.yaml  | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/arm,nvic.example.dtb: interrupt-controller@e000e100 (arm,v7m-nvic): #interrupt-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,nvic.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250523143637.536759-1-Frank.Li@nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

