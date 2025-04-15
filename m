Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E372DFA35;
	Tue, 15 Apr 2025 02:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744684237; cv=none; b=J1tkERyR9/FPD/FJ1iaV+EFN8uzXMpZkdQg08ITW3+8D7hEVyN9SMcOF47chbUXOkJXw3S1MDo7ZBNP/p8Az48nC0D+cEM7z92S5X6+5fKAU/gF8H16MzrtNgWT2izKa6lSOIVp59Eaeofk+PkVwc163Krlw4AEpEUUqiRHOjj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744684237; c=relaxed/simple;
	bh=bIFl+juOYVpR/60HIIXvP4aivi52MXYwHtG+zGWQQtk=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=otVFZKPKR0yR1X1I/LfuXOGdPGkzNsHl+H8uq9oY8leWrEgTi4CyIFRmLl4Aklt4RC/8k/wAu0OKQeceF3YisrRLU7jYzFK700PeuG2K+eqtv5p9NLI0zZqKukIxjRnTJM5JBG/TD7Bk5psvsz9gr+WY+/sHGne2nF+M3qRFpoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=REA2qwO1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="REA2qwO1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68604C4CEE2;
	Tue, 15 Apr 2025 02:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744684236;
	bh=bIFl+juOYVpR/60HIIXvP4aivi52MXYwHtG+zGWQQtk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=REA2qwO1+qTq51dB6/7puZW1sUBNE/BBjCidkZC+/nG/vUnzRscxKVUw0wbF1WzTD
	 rI7Yvwx+hmtT4IJvJJnxA4+0KGZFxMl7rM9ewfn5pm/BJAxklav9XwXLBpfwbnAqA7
	 Dbb8d3tfkvpQ1cec5RRhhJDabPsHhmxHUZCyYVUHeWTvXUnmLSxikcORYm3S4sX7Ah
	 FFrpJJ+7w28f7A2H3iSPKBFZzUdX2se4biRHaE3TDR3xGTf519wseAGz/tO7Ovskbc
	 RZAIj5bLv3a3PEpp7oyRimA2YuKujJw5njASmJqvi8g3i2CzBwSP6ISQ4b6TL4qiLS
	 PQ/aTzpwtfYjA==
Date: Mon, 14 Apr 2025 21:30:34 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, Vinod Koul <vkoul@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
In-Reply-To: <20250415011814.2319719-1-robh@kernel.org>
References: <20250415011814.2319719-1-robh@kernel.org>
Message-Id: <174468423456.2516000.1031965832056252996.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: phy: rockchip: Convert RK3399 Type-C PHY
 to schema


On Mon, 14 Apr 2025 20:18:13 -0500, Rob Herring (Arm) wrote:
> Convert the Rockchip RK3399 Type-C PHY to DT schema format. Add the
> missing "power-domains" property and "port" and "orientation-switch"
> properties in the child nodes.
> 
> Omit the previously deprecated properties as they aren't used anywhere.
> 
> Drop the 2nd example which was pretty much identical to the 1st example.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/phy/phy-rockchip-typec.txt       |  84 -------------
>  .../phy/rockchip,rk3399-typec-phy.yaml        | 116 ++++++++++++++++++
>  2 files changed, 116 insertions(+), 84 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt
>  create mode 100644 Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):
Warning: Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml references a file that doesn't exist: Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt
Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml: Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250415011814.2319719-1-robh@kernel.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

