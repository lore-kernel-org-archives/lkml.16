Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8669289E33;
	Wed,  7 May 2025 14:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746627474; cv=none; b=NJ0niUYNf4/oJgzBQaFOke/y1VZHk/D2U/7HVuJypImGZUMGM3iXccmUrCKagAgDe7GXfxyRjz8Zru/d5F18uxVFpugZ+eBXAF6IOVhl3V0s6Nrz7wVk0QT+OS8D82chmWLVpBnERT4vUHsa2DA0R7ts084v2uJlUoo52o2mF/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746627474; c=relaxed/simple;
	bh=XCPO4OwtHdklV75ZQexHUDw+NLtN7k5eDz9cWsLCD7s=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=VG+BsSsRpBPb0haT7A/jMzwIHhqPCnFBhpSg9efNewChf2cojK16IYRSDVmbDy7E6+kuU8xFu06I3B4aLUxvg/TyAX2d8Z6shIqDLSVX2A9J1uf2Vspp7mMU3Saifg5sQhk92bVbwKDjNNE/iwol8gWfKSDecpSQl8v9mzVNiZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qs2bW5Mz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qs2bW5Mz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 084DCC4CEE2;
	Wed,  7 May 2025 14:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746627473;
	bh=XCPO4OwtHdklV75ZQexHUDw+NLtN7k5eDz9cWsLCD7s=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Qs2bW5MzeuhyoRfLeHZNePhETq1cuep9TM1AX0aZzNMUr9PnjrD+ikLE7R6NI5/kC
	 sT8P5/a7l15vu7DkzFtpOqPt9jV0uleb9TQDr4MFRa4vZOSIjdQZVfFuLEd1YMgwVg
	 Y7r3hvxC/mFmYpPVity5Vk356zOtJCIiaM2KgLg70cssO++MRkuF6rQH8CBusTBpHC
	 I3/s2GNEJzkOAQwdg93eoOB333RctMzWrBgOJPEsy4wkhgydykSIVK+bk9kSzveOEY
	 LBX2wjMtEUO1cBDwbR0lmtWkc7pHOISw//59HVydxnYJPpA/EM+y93uoCgr7+l5vuo
	 o9cjCGU9eSMlw==
Date: Wed, 07 May 2025 09:17:51 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Will Deacon <will@kernel.org>, Benjamin Hahn <b.hahn@phytec.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Yashwanth Varakala <y.varakala@phytec.de>, 
 Teresa Remmet <t.remmet@phytec.de>, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, upstream@lists.phytec.de, 
 linux-kernel@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, Jan Remmet <j.remmet@phytec.de>, 
 Shawn Guo <shawnguo@kernel.org>, imx@lists.linux.dev, 
 Catalin Marinas <catalin.marinas@arm.com>
To: Yannic Moog <y.moog@phytec.de>
In-Reply-To: <20250507-wip-y-moog-phytec-de-imx95-libra-v1-1-4b73843ad4cd@phytec.de>
References: <20250507-wip-y-moog-phytec-de-imx95-libra-v1-0-4b73843ad4cd@phytec.de>
 <20250507-wip-y-moog-phytec-de-imx95-libra-v1-1-4b73843ad4cd@phytec.de>
Message-Id: <174662747122.1094223.1125259086632722690.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: add imx95-libra-rdk-fpsc


On Wed, 07 May 2025 15:13:12 +0200, Yannic Moog wrote:
> imx95-libra-rdk-fpsc is a development board based on the phyCORE-i.MX 95
> Plus FPSC SoM. Add its description and binding.
> 
> Signed-off-by: Yannic Moog <y.moog@phytec.de>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/arm/fsl.yaml:1372:13: [warning] wrong indentation: expected 14 but found 12 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250507-wip-y-moog-phytec-de-imx95-libra-v1-1-4b73843ad4cd@phytec.de

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

