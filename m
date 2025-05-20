Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1B2281344;
	Tue, 20 May 2025 19:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747769107; cv=none; b=ZMWBAxFBnQpgkPggsDqqK1ERUJB+XbZAKCChcpTfn43srjqL6U7ydOEbnfTwtSldQZoBcBxVgP73xJ3nLF8E/DDYAH6PfSaT6VK936eUvoy+GXRKUO9zn0ii4NOZRea8F9R2ufeCEXJ1Z6X/tnefhuF0t8vU+UCzdukCS2KMhDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747769107; c=relaxed/simple;
	bh=wYtGxquDyb/uwRox/J1ebRNegYN8+f58D8Ohb3JJlS0=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=FGneyhUKzFNY1HNOgaeT5qXrRpBH1jyr0HKy6sepP+WnSijo5JUVu+32l70QReZbfP7dgxiCxBNZwkLtjLEacE8nZyfFWATff9H57Inat/hj/L3Fbuui81fm/EPt1NH2LJT4ifhgKXyYzyUUJPKtDZo3+mLMweqAch5jk+9V2Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mq4MwtoL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mq4MwtoL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B60CAC4CEEF;
	Tue, 20 May 2025 19:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747769107;
	bh=wYtGxquDyb/uwRox/J1ebRNegYN8+f58D8Ohb3JJlS0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=mq4MwtoLo5Wzyd5gbzrmxP+oV99rqMPjNFLimTHDS6kh+QWK3DB/s0UQU1SvFt2fl
	 z9G3eV17jA4/SCAfvUQ0gSpKXkJ4IOALf+MPQqyeEUjXcgnMr+PBiiE+yFs4yKOVdm
	 hjbPho3BuMrnPe+Y7HP2NefU2baF+2TYGc/n55HdbvJonXj/i3tSuCefsT8F3fZXAi
	 /zx+ap7FTN5+FV0heRFKqSTgsoO/ZjJKIR0wsh8aQnxVFbqc53v0I6Ly9wlevXiw4Z
	 hZcfEhDcYIeP2iuGFjrTw85RmvD0oMV28aiboXDYmQQP3ULxuU88QtkO3bykWaqlqj
	 uGVn8MAz4sHHw==
Date: Tue, 20 May 2025 14:25:05 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, 
 Nicolas Le Bayon <nicolas.le.bayon@foss.st.com>, 
 linux-stm32@st-md-mailman.stormreply.com, Stephen Boyd <sboyd@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>
To: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
In-Reply-To: <20250520-upstream_rcc_mp21-v2-1-3c776a6e5862@foss.st.com>
References: <20250520-upstream_rcc_mp21-v2-0-3c776a6e5862@foss.st.com>
 <20250520-upstream_rcc_mp21-v2-1-3c776a6e5862@foss.st.com>
Message-Id: <174776907578.1216009.15135400439348545740.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: stm32: add STM32MP21 clocks and
 reset bindings


On Tue, 20 May 2025 17:28:37 +0200, Gabriel Fernandez wrote:
> Adds clock and reset binding entries for STM32MP21 SoC family.
> 
> Signed-off-by: Nicolas Le Bayon <nicolas.le.bayon@foss.st.com>
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---
>  .../bindings/clock/st,stm32mp21-rcc.yaml           | 204 ++++++++++
>  include/dt-bindings/clock/st,stm32mp21-rcc.h       | 426 +++++++++++++++++++++
>  include/dt-bindings/reset/st,stm32mp21-rcc.h       | 138 +++++++
>  3 files changed, 768 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/st,stm32mp21-rcc.yaml: properties:access-controllers: {'description': 'phandle to the rifsc device to check access right.', 'items': [{'description': 'phandle to access controller'}], 'minItems': 1, 'maxItems': 1} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/st,stm32mp21-rcc.yaml: properties:access-controllers: 'oneOf' conditional failed, one must be fixed:
	[{'description': 'phandle to access controller'}] is too short
	False schema does not allow 1
	hint: "minItems" is only needed if less than the "items" list length
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250520-upstream_rcc_mp21-v2-1-3c776a6e5862@foss.st.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

