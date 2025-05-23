Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DC62957C0;
	Fri, 23 May 2025 14:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748010209; cv=none; b=PFW3xQGuXF57LKY6aKDKO/y5QSvr0XEonjyCym86IQJY7tN2lpexSi3Y2UdRpN48L7w7vOfaw8EMHRNQa/BYQvTACUgycGLKlQdN0o0nBinRxWaSCFjwN8lmDapOKHy0IwbExa/9BI3XfivWOMmxPtuRe6YGZsaiWZmbcdzNEdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748010209; c=relaxed/simple;
	bh=Bp/ucb/GTjVrDZZD7rUyDOj4GMDaNKCX21mkeadmdjY=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=cj0D3OhEjNULRVs/zLuC574MKz/h3HpOINYmwUPaSJDfN3IsaHS2HRQl4evaoqs7Zfx0zuYJGZYgiOtjXGsuXBgB1AU0iPi+NQM59y0DjTRSVVeWTtUUK0+eB0Xq5sHAankYzgLn2dqtS8/qODFH0Ge2MVh7x953NDMcBFtyouU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qKl5oe0E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qKl5oe0E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74677C4CEE9;
	Fri, 23 May 2025 14:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748010208;
	bh=Bp/ucb/GTjVrDZZD7rUyDOj4GMDaNKCX21mkeadmdjY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=qKl5oe0ETeD+POG4Zxk/4FSBGnnuze7xxrZwHMCOwa8vbZIDtedHy47PYkI9T319L
	 eLvGVEEiadWGWc9rbeGJpdthDtnj18pLjtHUY6NHJqxvssrOQ+TRYeJOr8scU9NxiW
	 sbAkA4nXOc1KfJj53cH6/9qZxdsdVCq+MnA1N75zeRluRkpNyxkhmpilh4vHPvFKmf
	 wr0QX3EuxtpCT2ksuQYM4iWN3alcipTfH/m4Tai6aQE+ZViJY8Jq4ph3GtGI4pKlPd
	 jIZNjemc/m5UVwAKMt+ANALKZYjZecX9kjRXHzMCwBCkKqr3bP9jCNlugj7GmnhxKg
	 aQ6LKOwRTgPSg==
Date: Fri, 23 May 2025 09:23:26 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robin Gong <yibin.gong@nxp.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
In-Reply-To: <20250523131214.955970-1-martijn.de.gouw@prodrive-technologies.com>
References: <20250523131214.955970-1-martijn.de.gouw@prodrive-technologies.com>
Message-Id: <174801020316.1711348.10193654747801258488.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: regulator: add pca9450: Add
 regulator-allowed-modes


On Fri, 23 May 2025 15:12:11 +0200, Martijn de Gouw wrote:
> Make the PWM mode on the buck controllers configurable from devicetree.
> Some boards require forced PWM mode to keep the supply ripple within
> acceptable limits under light load conditions.
> 
> Signed-off-by: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
> ---
> Changes in v2:
>   - Add the header to the binding patch
>   - Improve commit message
> 
>  .../regulator/nxp,pca9450-regulator.yaml       | 14 ++++++++++++++
>  .../regulator/nxp,pca9450-regulator.h          | 18 ++++++++++++++++++
>  2 files changed, 32 insertions(+)
>  create mode 100644 include/dt-bindings/regulator/nxp,pca9450-regulator.h
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/regulator/nxp,pca9450-regulator.example.dtb: pmic@25 (nxp,pca9450b): regulators:BUCK4: Unevaluated properties are not allowed ('regulator-inital-mode' was unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/nxp,pca9450-regulator.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250523131214.955970-1-martijn.de.gouw@prodrive-technologies.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

