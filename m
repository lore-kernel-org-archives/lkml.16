Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92EB2DFA56;
	Thu, 17 Apr 2025 13:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744896717; cv=none; b=gF4XhKIcxZdriL8TRzsvZr01tDdGW46DxpieQWbm8ov1Q3woeHvl5g0Nziwfet102UXEX+KOodLm5jhK5+BbMdcllBuKb7pm1xdjnSSZFpazsZcWiwCW9uU/kPQf+W6blViDvqFFVG8K3ESx3T86RtA3egcv9QoBGafJThEn3w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744896717; c=relaxed/simple;
	bh=zfrzax3mWQXR8qlR6MDGWvmUK0vDJj6YaPGr03m2Vo8=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Ggw4off1V27JRz0XB4FPCeAD566NnShrga6GomM6wznKv55YCiyLL4D6nlpVfcGffG+JJ1PXMMFLDvf5JipA1sJgU4Um7uMDkTNd4dgnnAJVCr5HHv+BVCn/eNhAu5zjJfFylLcxEvFifj+jgEacB7teKAQQkMPZO/BoFDlsMJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pVjmrjYU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pVjmrjYU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03EA5C4CEE4;
	Thu, 17 Apr 2025 13:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744896716;
	bh=zfrzax3mWQXR8qlR6MDGWvmUK0vDJj6YaPGr03m2Vo8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=pVjmrjYUu5O0NoIDjMzVXG8v4ILt1lM/qibhB/8NXY9tBhGRgYs+At83h7Ey9sixL
	 9YnZ8F1p5sZ03KR+VfvLZAEATteT8WrW5jXBHAVwkmtK4yT1YvkZgzzwtoi0OCG6cl
	 BOyfQ2w8nXCcXw+hxPHIvZ+XGfT7d8MSaaWe4463RUZ5cuAE8ffn9WOJ9Q3SY8dR5l
	 TbSmviz4r7WhBG+DKcnhcc4sWxRRorqu4kuQRZsYnwvFNcK18LwFUKCr5zmBkL03rA
	 iHrevWGyTD8dkIHSL8yXyBV4wv4yYeQf/Uqb0NwG0dMHpy2tQos2rxbLWgLkpjk07D
	 JkiXYsih/QVjQ==
Date: Thu, 17 Apr 2025 08:31:54 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-kernel@vger.kernel.org, Yashwanth Varakala <y.varakala@phytec.de>, 
 Jan Remmet <j.remmet@phytec.de>, imx@lists.linux.dev, 
 upstream@lists.phytec.de, Fabio Estevam <festevam@gmail.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Teresa Remmet <t.remmet@phytec.de>, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Benjamin Hahn <b.hahn@phytec.de>
To: Yannic Moog <y.moog@phytec.de>
In-Reply-To: <20250417-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v3-1-ccb885b38ffd@phytec.de>
References: <20250417-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v3-0-ccb885b38ffd@phytec.de>
 <20250417-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v3-1-ccb885b38ffd@phytec.de>
Message-Id: <174489671445.1639679.13539167647516312025.robh@kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: add imx8mp-libra-rdk-fpsc


On Thu, 17 Apr 2025 14:01:12 +0200, Yannic Moog wrote:
> imx8mp-libra-rdk-fpsc is a development board based on the phyCORE-i.MX
> 8M Plus FPSC SoM. Add its description and binding. The
> imx8mp-phycore-fpsc som differs from the existing phyCORE-i.MX 8M Plus
> (dts: imx8mp-phycore-som.dtsi) in its physical form regarding the ball
> grid array. Other differences between the SoMs are missing SPI-NOR on
> this SoM and 1.8V IO voltage instead of 3.3V as found on the existing
> imx8mp-phycore-som. As a result the imx8mp-phycore-som is not compatible
> with this new libra development board.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Yannic Moog <y.moog@phytec.de>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml: maintainers:0: 'Frank Li' does not match '@'
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#

doc reference errors (make refcheckdocs):
Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`rt_link<../../networking/netlink_spec/rt_link>`
Warning: Documentation/arch/powerpc/cxl.rst references a file that doesn't exist: Documentation/ABI/testing/sysfs-class-cxl
Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
Warning: lib/Kconfig.debug references a file that doesn't exist: Documentation/dev-tools/fault-injection/fault-injection.rst
Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`rt_link<../../networking/netlink_spec/rt_link>`
Documentation/arch/powerpc/cxl.rst: Documentation/ABI/testing/sysfs-class-cxl
MAINTAINERS: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
MAINTAINERS: Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
lib/Kconfig.debug: Documentation/dev-tools/fault-injection/fault-injection.rst

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250417-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v3-1-ccb885b38ffd@phytec.de

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

