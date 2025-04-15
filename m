Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4650217A306;
	Tue, 15 Apr 2025 00:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744677004; cv=none; b=ZFZ12ac5p0qVkyUbH1kDuqpsh3X0d8JNGYP9olFtd70SoG8jdB5Men6Q3DLu/S6q8VSfMZy06kc/W9YyjkYuTdzRupHqvfdIuAUGv2wKMrg9dragt+d3jEZy+5M1OmZ64KESMEa+fMcqKl89kStRIXsuDz/xlDQo/siHp9aVXtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744677004; c=relaxed/simple;
	bh=I813wV1g/WIA6BY+EHdHQRWe4RgiC2zmO2F7GmKy+nE=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=kaU9fK/5T2SuK8PgJNeZCV7Tp/fGqeLydlR/u8g1Ou2bVjHf5NpraMGIWHglOxSbCO55CA257GG1d4bUyRofG3nDbtqvyz1PVYJutgAQvi+hKdh/4mvPo5HxVfMwW6hbKoAUbGVv51QNfl1+rnvDzSCD7LIuZ4by+Z7hzGNEpWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LMKbyZl7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LMKbyZl7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 941DEC4CEED;
	Tue, 15 Apr 2025 00:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744677003;
	bh=I813wV1g/WIA6BY+EHdHQRWe4RgiC2zmO2F7GmKy+nE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=LMKbyZl7mEsiaIPEtIdqbWP4H1Ipny5a/CZFjuYKI7RI1ix3URXs43Bu0GZIvXiLW
	 ZhI6WPM+sjPJQrWYke2oGagT3ChhzR5KaGiPVCLa8QxQsIx9lvb5I5LTywPAAjQY/l
	 lZTLq2bB5Xhw1Ju+MPLs216vXWhIi+JgGjuR/5JlRsKTnNf6V1ppSshQY4tzuQOp3O
	 CyOGIAMRSuG9pnw3Ktade0T1nR2t08CAPcajYvp515BxHHUQqXY58AxxLVee6XTqcU
	 kNzOPiyADnnpCGYqPhBvmhMImfG9HEQvf4C1/rD72XOR+J4EWWR6iXTYVZ72Y6r2W7
	 Qj69ckNJtBt/Q==
Date: Mon, 14 Apr 2025 19:30:01 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, linux-phy@lists.infradead.org, 
 Conor Dooley <conor+dt@kernel.org>, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Vinod Koul <vkoul@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
In-Reply-To: <20250414225311.1913480-1-robh@kernel.org>
References: <20250414225311.1913480-1-robh@kernel.org>
Message-Id: <174467700194.2177524.2394978588221841695.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: phy: rockchip: Convert RK3399 PCIe PHY to
 schema


On Mon, 14 Apr 2025 17:53:09 -0500, Rob Herring (Arm) wrote:
> Convert the Rockchip RK3399 PCIe PHY to DT schema format. Move the
> example to the GRF binding as that has the complete block.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/phy/rockchip-pcie-phy.txt        | 36 -------------------
>  .../devicetree/bindings/soc/rockchip/grf.yaml | 13 +++++--
>  2 files changed, 11 insertions(+), 38 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/phy/rockchip-pcie-phy.txt
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/rockchip/grf.example.dtb: syscon@ff770000 (rockchip,rk3399-grf): pcie-phy: False schema does not allow {'compatible': ['rockchip,rk3399-pcie-phy'], '#phy-cells': 1, 'clocks': [[4294967295, 138]], 'clock-names': ['refclk'], 'resets': [[4294967295, 135]], 'reset-names': ['phy']}
	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/rockchip/grf.example.dtb: syscon@ff770000 (rockchip,rk3399-grf): pcie-phy: Unevaluated properties are not allowed ('#phy-cells', 'clock-names', 'clocks', 'compatible', 'reset-names', 'resets' were unexpected)
	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
Documentation/devicetree/bindings/soc/rockchip/grf.example.dtb: /example-0/syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250414225311.1913480-1-robh@kernel.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

