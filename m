Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC4821C18C;
	Fri,  4 Apr 2025 22:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743805284; cv=none; b=ouWn8wZ5Kv+Gsne+hzna9h7F4uyzGW+BBZiOw2bPoShjmTIz2KzKXjhDkGlzIC79K+KAzqdIamSXacuijcc8UCRms5jRxd7i17RGkj+aNIP4Qzj7R4pabNRmNtsSySS4I9w3b2kcMzJO6aVGgHC8t2UeujPzm92KyHGxVRAEZVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743805284; c=relaxed/simple;
	bh=7eTq/+/tHSezJmCcxzOUrQ0fGNRkpQ2yL3p6VtTrj6c=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=tY5ZLqq6+CPse2i/ZH5sNWDac+wzmFWH7Z39bBxUV5Cx8s5Ui0bqNrXIUJBF0PW4LJSY9Y86lZHqw63IFpvUZypLhknBRzGZkehzVSIn25v/nr/4bBr3Pz54uhr+J25eVBM99a1gBU2unEBirhugvCuBaCTLRuvhTRTM+AfNK6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XxmXfRxI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XxmXfRxI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0186BC4CEDD;
	Fri,  4 Apr 2025 22:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743805283;
	bh=7eTq/+/tHSezJmCcxzOUrQ0fGNRkpQ2yL3p6VtTrj6c=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=XxmXfRxInqmGGSMNGeAHqvZZOI/7yWE4UCk8el82OuOx+QVhlTipB7wXF3A3TRuXl
	 TA0fMRRLqDdQCSSK9IoYn/7BEk8ta4ECParWhZNOeIRjMwj6XJYGHULi5sWTDwnPfL
	 4cHhOaXNG9gz6UAb6D/9sJXhw4Xg2QYnxEpTBX3d7h9FAlCCVpM55uHWoHWn03dU9I
	 7R5eqLYOZwsQ6h1EsZvYcD0EXN2E7CW3eBXiHgXN8MWNVthHcbZquuZKOnipdSp/Qy
	 pAu5rSbpNjQtgA9OoQCkkyhDbLyQsWPk0OQ6XmT1dKlMnqjb4/l2HuoOShAfRULQyR
	 dMmPdAVVi32cA==
Date: Fri, 04 Apr 2025 17:21:21 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Frank Wang <frank.wang@rock-chips.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Zhang Yubing <yubing.zhang@rock-chips.com>, 
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, 
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, Kishon Vijay Abraham I <kishon@kernel.org>, 
 linux-rockchip@lists.infradead.org
To: "Rob Herring (Arm)" <robh@kernel.org>
In-Reply-To: <20250404213958.400852-1-robh@kernel.org>
References: <20250404213958.400852-1-robh@kernel.org>
Message-Id: <174380528188.571034.1832542310029442555.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: phy: rockchip: Add missing "phy-supply"
 property


On Fri, 04 Apr 2025 16:39:57 -0500, Rob Herring (Arm) wrote:
> Several Rockchip PHYs use the "phy-supply" property, but don't
> document it. Add it to the current known users.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml   | 3 +++
>  Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml  | 3 +++
>  Documentation/devicetree/bindings/phy/rockchip,pcie3-phy.yaml  | 3 +++
>  3 files changed, 9 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml: properties:phy-supply: 'maxItems' is not one of ['description', 'deprecated']
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/rockchip,pcie3-phy.yaml: properties:phy-supply: 'maxItems' is not one of ['description', 'deprecated']
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml: properties:phy-supply: 'maxItems' is not one of ['description', 'deprecated']
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250404213958.400852-1-robh@kernel.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

