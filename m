Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1890B2144DE;
	Fri,  9 May 2025 14:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746800232; cv=none; b=LlIaHvLhB4FNLMh0RY+LOQAbRBCbBT/WDZJzZrjzNijtGRPLKTMy0hh6XSErhD3q4QnksugbQhiW6sv6X8WmdtO1rEIR7BH7wLoTSsTjfdsWaRmLNJDrcWxpS21umWkIlxDR3QQnOlzyof/TPqZXyztmw05axPHbH7g+0QvDBYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746800232; c=relaxed/simple;
	bh=C2itz+S6tPrdRTXNErSUQmD0CIJnv+xn5PWfAWtHGgA=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Mp061x4SwIKkSepI+ttmN3KAonU23UFMt8D1L8FcAyKc0VFX9ibUIWzOiJpkk8jOx9rRQeeWaN8z8ilS/7lx71ZbUqGPLum+JsciBL69LOH2KXVhyIZgAuS0ICcNerVfTGyc+egxIfwYU45OQaDiRB8ENOp/Y/u2am6sH6w2U/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tGRcYZSp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tGRcYZSp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0CE7C4CEE4;
	Fri,  9 May 2025 14:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746800229;
	bh=C2itz+S6tPrdRTXNErSUQmD0CIJnv+xn5PWfAWtHGgA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=tGRcYZSpxo55IxBJrhfzT9uplJbSWhfz+KHCY3evtuJz8Y5j1YJLDL8cr9x3XcL8w
	 FheP+ALCKZZh4DaaNwi5R6gpCpVZc2HSXoNn0XkozhtpZzenIlrbm1nWMV+eNQZydJ
	 HhJuvGnsjNdymeaIalQrDvtKQFtFxZq71e6tL7aGpIW88IwwQl9aYX37qkMESjaCsP
	 wwr5mggIiFNr+0w/+PV0uExN3v8+CAt6e0lak7VeRDF3nazivlti3Pefa3WNktYOmd
	 3CZotQPcxpNUCvQdxmXJ9/OyIZ0P106KmMpN3My0xLcfNsRIY0LXSIeQv6+SQUqqYp
	 kUYqb02LfjYmA==
Date: Fri, 09 May 2025 09:17:07 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, kernel@collabora.com, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
In-Reply-To: <20250509-add-rock5t-v1-0-cff1de74eced@collabora.com>
References: <20250509-add-rock5t-v1-0-cff1de74eced@collabora.com>
Message-Id: <174679985488.3369444.8126092781297328766.robh@kernel.org>
Subject: Re: [PATCH 0/3] Add RADXA ROCK 5T support


On Fri, 09 May 2025 14:31:40 +0200, Nicolas Frattaroli wrote:
> This is a small series, depending on Sebastian Reichel's ROCK 5B+
> series[1], to also add support for the ROCK 5T.
> 
> The ROCK 5T is quite similar to the ROCK 5B+ and the ROCK 5B, so to
> share as much DT boilerplate between them as we can, this series
> reorganises things a bit and then adds the ROCK 5T .dts.
> 
> Link: https://lore.kernel.org/linux-rockchip/20250508-rock5bp-for-upstream-v2-0-677033cc1ac2@kernel.org/T/ [1]
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
> Nicolas Frattaroli (3):
>       dt-bindings: arm: rockchip: add RADXA ROCK 5T
>       arm64: dts: rockchip: reorganise common rock5* nodes
>       arm64: dts: rockchip: add ROCK 5T device tree
> 
>  .../devicetree/bindings/arm/rockchip.yaml          |    5 +
>  arch/arm64/boot/dts/rockchip/Makefile              |    1 +
>  .../boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi   | 1012 ++++++++++++++++++++
>  arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi   | 1012 +-------------------
>  arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts    |  105 ++
>  5 files changed, 1131 insertions(+), 1004 deletions(-)
> ---
> base-commit: 19c541fe872387798a25df947f56a26212aa9a97
> change-id: 20250509-add-rock5t-fde5927de36b
> prerequisite-message-id: <20250508-rock5bp-for-upstream-v2-0-677033cc1ac2@kernel.org>
> prerequisite-patch-id: 02bf159533bb53d2cb1b6c8c7caf1d3fcfbfa4ea
> prerequisite-patch-id: fc153d1d48f19d63520086a6eaadfec2db960470
> prerequisite-patch-id: f445b893edf31ccf3311e146a53e5d24861c2475
> prerequisite-patch-id: 5dc410a438ad5a7aa8962e380d2733782f5d7d18
> prerequisite-patch-id: c70ae0e30be2a3385d2f2a09f474ff2b76293843
> 
> Best regards,
> --
> Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: using specified base-commit 19c541fe872387798a25df947f56a26212aa9a97
 Deps: looking for dependencies matching 5 patch-ids
 Deps: Applying prerequisite patch: [PATCH v2 1/5] arm64: dts: rockchip: move rock 5b to include file
 Deps: Applying prerequisite patch: [PATCH v2 2/5] arm64: dts: rockchip: move rock 5b to include file
 Deps: Applying prerequisite patch: [PATCH v2 3/5] dt-bindings: arm: rockchip: Add Radxa ROCK 5B+
 Deps: Applying prerequisite patch: [PATCH v2 4/5] arm64: dts: rockchip: add Rock 5B+
 Deps: Applying prerequisite patch: [PATCH v2 5/5] arm64: dts: rockchip: add USB-C support for ROCK 5B+

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/rockchip/' for 20250509-add-rock5t-v1-0-cff1de74eced@collabora.com:

arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#





