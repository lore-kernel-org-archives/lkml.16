Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F531369BB;
	Fri, 31 Jan 2025 19:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738352518; cv=none; b=C5S6a2emB5vU+4cRIwhXrhCG6WYdgp7W7xsfpvhX5ir8IF3DMN6tyx0WK2o9PJmF4/aVFSFTiSeTlONpnE3cBrLoaGU+DNINlTunr4pF64g1Qk7+13OSx7rN+MYJZGKgm2vqFIeyu22vnpbgfOJO8uhWJ4e5PsvgIlDo9xxrxIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738352518; c=relaxed/simple;
	bh=XWzFnKPzYR4DVPFYN8XLbs3QmiWQpk5rnJJzQjkDw2I=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=EWnaZNSbDrZ+W+UvlLsJbCm160k5AaJ0RQWMHygRt2y7ct/cZGM/kVSAnbyoBAFO9nLxDGjZABfCy6K6Efe3IU6pbBeV5T6V6iWbTz+69+ld6saNeKDiVlbCwR6U0hW7pmlSrJypm6x2CNrCLTL8M7BUYcrZd6nfUN+r2ika2FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=plWHxWEb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="plWHxWEb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B833BC4CED1;
	Fri, 31 Jan 2025 19:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738352518;
	bh=XWzFnKPzYR4DVPFYN8XLbs3QmiWQpk5rnJJzQjkDw2I=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=plWHxWEbMJC1F4ABC8O3Gl2FOnbL/u4d9cUPGSpuFfwQ/fJ2Kr2SaZplBJPsOrnsd
	 BAFbx0QofgJQ0XU9Fp7s0FpsXvx5AZOsk585hZ1O/tQH4gs+kzjC5a0RNxYlRI4Etw
	 H6V8T5/auDeMMmErrm3vRjbb3OiVola9vy4QJjgE2i4LOavG/TKJ5HWyY7VGJsisTr
	 C7uTf505KGrR3m7n3O4jAFSe6d6uEc8ovXVae2mDANozhRgkHzQYGjJdBdDH0WIZg5
	 WXXA/Qqo0V3nufyEDeqofdp0ZhTB2+PZx3gOeIVGkKSI7XlhQE/W2p2dDvwkNHej9Z
	 ZI5xjqzd4uuYw==
Date: Fri, 31 Jan 2025 13:41:56 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, Ray Jui <rjui@broadcom.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, linux-kernel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Stanislav Jakubek <stano.jakubek@gmail.com>
To: Artur Weber <aweber.kernel@gmail.com>
In-Reply-To: <20250131-bcm59054-v3-2-bbac52a84787@gmail.com>
References: <20250131-bcm59054-v3-0-bbac52a84787@gmail.com>
 <20250131-bcm59054-v3-2-bbac52a84787@gmail.com>
Message-Id: <173835251253.3936353.15748613970933991457.robh@kernel.org>
Subject: Re: [PATCH v3 2/7] dt-bindings: mfd: brcm,bcm59056: Add compatible
 for BCM59054


On Fri, 31 Jan 2025 19:13:50 +0100, Artur Weber wrote:
> The BCM59054 MFD is fairly similar to the BCM59056, and will use
> the same driver. Add compatible and specify the allowed regulator
> nodes.
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---
> Changes in v3:
> - Split regulator node into separate file
> - Removed quotes around compatible
> ---
>  .../devicetree/bindings/mfd/brcm,bcm59056.yaml     | 26 +++++++++-
>  .../bindings/regulator/brcm,bcm59054.yaml          | 55 ++++++++++++++++++++++
>  2 files changed, 79 insertions(+), 2 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/regulator/brcm,bcm59054.yaml: ^(cam|sim|mmc)ldo[1-2]$: Missing additionalProperties/unevaluatedProperties constraint

/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/regulator/brcm,bcm59054.yaml: ^(rf|sd|sdx|aud|mic|usb|vib|tcx)ldo$: Missing additionalProperties/unevaluatedProperties constraint

/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/regulator/brcm,bcm59054.yaml: ^(c|mm|v)sr$: Missing additionalProperties/unevaluatedProperties constraint

/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/regulator/brcm,bcm59054.yaml: ^(io|sd)sr[1-2]$: Missing additionalProperties/unevaluatedProperties constraint

/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/regulator/brcm,bcm59054.yaml: ^gpldo[1-3]$: Missing additionalProperties/unevaluatedProperties constraint

/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/regulator/brcm,bcm59054.yaml: ^lvldo[1-2]$: Missing additionalProperties/unevaluatedProperties constraint

/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/regulator/brcm,bcm59054.yaml: vbus: Missing additionalProperties/unevaluatedProperties constraint

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250131-bcm59054-v3-2-bbac52a84787@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

