Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B1C221F33;
	Thu, 22 May 2025 20:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747945845; cv=none; b=TZgBvQKvPGy42PnqkBZAGVNkjruu899XSuiycjp+lV57P7zhEXnO6WIPvjg4EUqMHGmTlS5v2/5NsYPwkozsyudSu5Mpueht8/CI2cyFJSRf7r9VGpYB3iqDTSdEgyGtR4KDLObXz6ELQgpgIQ0tWixWc357Sg3lENlny8zY7Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747945845; c=relaxed/simple;
	bh=rqJt2LeqXijI9OuagfbU1dZUmmQmO9he9zCJF0F/Ycc=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=H2HmDNKG/Y/MNG23dUeh1iKKRHX4c2HbOtOFio9ijKEi9MxhzCyCTxTf0Y2DuJ2z6kxPBr6OcEDq1pFhS501TM/YjDRUvqPzOHlKntxJoVGobMBS8+Enf19SM0b8wsAIMZST4vP0zhYhwbzTIkfEldPkcIPUx6VoHDRXQanmN3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S4hZYky9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S4hZYky9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6437C4CEE4;
	Thu, 22 May 2025 20:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747945844;
	bh=rqJt2LeqXijI9OuagfbU1dZUmmQmO9he9zCJF0F/Ycc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=S4hZYky92s+Oqrjudop6ZcTUc2bJaYuAfpfJEUxfrRSgPCkyzNoKi/1nq/5tyCcbD
	 OMwhtuPt+jKpPa1gdreK9zhHiTqjUS7Zb4kS4ZP46nl+8YD5YYkhk6bMY/TQbcA8D+
	 szMQVT30Dk7Djdv6duQ/tg7p01y8OUL39sh4yR2ZYGj3pNtLZ9pxAB7NqS9PCtA51d
	 2HNhVOOgh5hYcAzplBxFUBgGuvpYkH2CVIXZttVbgkExEJMlbA/lPQYpVqejIwhlhA
	 8ULi+lcaqBLTqkGW4hEa+g3DBc8SLzl1Zto1HFjQeL1UUjGjWzb7v1a9yi4c798S8t
	 NwBMZVagl+h6w==
Date: Thu, 22 May 2025 15:30:42 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Robin Gong <yibin.gong@nxp.com>, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
 devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>
To: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
In-Reply-To: <20250522192325.1099680-1-martijn.de.gouw@prodrive-technologies.com>
References: <20250522192325.1099680-1-martijn.de.gouw@prodrive-technologies.com>
Message-Id: <174794584287.3722828.5721121369955097366.robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: regulator: add pca9450: Add
 regulator-allowed-modes


On Thu, 22 May 2025 21:23:22 +0200, Martijn de Gouw wrote:
> The PCA9450 has support for forced PWM mode on the buck controllers.
> Add support to control this mode.
> 
> Signed-off-by: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
> ---
>  .../bindings/regulator/nxp,pca9450-regulator.yaml  | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/regulator/nxp,pca9450-regulator.example.dts:25:18: fatal error: dt-bindings/regulator/nxp,pca9450-regulator.h: No such file or directory
   25 |         #include <dt-bindings/regulator/nxp,pca9450-regulator.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/regulator/nxp,pca9450-regulator.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1524: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250522192325.1099680-1-martijn.de.gouw@prodrive-technologies.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

