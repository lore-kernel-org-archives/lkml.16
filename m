Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DEB17BA6;
	Sat, 17 May 2025 13:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747487907; cv=none; b=W1QLRmuug/WBvRWkinwmha7D5DxlDrD/n4XnV9kdfnWXBjSRioTmhzQxEkv2JrXlSKkldAk4Yx61CoMuOaUtZCNX0ebCYNMuL95CMS9v4QYO+Lg0C68+4U1TQI/kaJ0IFzvCJ3maR7Csh9NKoMFoXeyaAnY+kx+KLm0lBYeBV/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747487907; c=relaxed/simple;
	bh=cR6ux1cRzEhA5LhXUkm5DYutXCMT68lq6F2Uh63Yabk=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Pk6z5uT8HAgtxyFJsMvfeoJcIPgrZD0/YrDvWrLoTUrzXkGghFIpFBois5WxA+C/YeetU9zEqEF0yrV4iq8Blr4M/OKLZKAO7SpiHLhRf/saZG7xmf4mM1hK/LE4TUSofnYgBeacX53l4LRV4da9tz97DgTiGcEqHpq4L+jLc7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b14pDGxB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b14pDGxB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B33D6C4CEE3;
	Sat, 17 May 2025 13:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747487906;
	bh=cR6ux1cRzEhA5LhXUkm5DYutXCMT68lq6F2Uh63Yabk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=b14pDGxBDD2eyfJWePBsv+ZfurVz+xE3Du6uzuBxPP0voFHaXx6cFDvkm1iF6tFG7
	 RJk3EOT7KxurgzIbJgbKs89K+U56YylqkUsZTOBCxsG7t81t0PTBKm0cZln/MQn9+j
	 v2yIX5i5kbeMR/Qddzd2U7rJJEw9JUjNHsF79LS4+0pKiYGwXIBNNMlOE2Oly4cVI3
	 oacSlpCTtp0czQM2Bf/vYlaAKriJNSH63EkIS+e/emlmX34juR+5Z4OQWdBvkXTMsD
	 y6aGoFQkS+xlBGiVTf7of+DHv4stOkD6X0xsVskCo25qppV0AguNLj/lbTvKZpzkKC
	 okV0o0JyhAf1A==
Date: Sat, 17 May 2025 08:18:25 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: sfr@canb.auug.org.au, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, 
 linux-arm-kernel@lists.infradead.org, heiko@sntech.de
To: Hsun Lai <i@chainsx.cn>
In-Reply-To: <20250516012402.580468-1-i@chainsx.cn>
References: <20250516012402.580468-1-i@chainsx.cn>
Message-Id: <174748776864.930436.6066844378633879191.robh@kernel.org>
Subject: Re: [PATCH v3 0/2] Add support for Firefly
 Station-M3/ROC-RK3588S-PC


On Fri, 16 May 2025 09:24:00 +0800, Hsun Lai wrote:
> This series add support for Firefly Station-M3/ROC-RK3588S-PC.
> 
> Info of device can be found at:
> https://wiki.t-firefly.com/en/Station-M3/index.html
> 
> Changes in v3:
> - Update the name of leds
> - Add more cpu nodes
> - Update mdio compatible
> - Fix the order in the node
> - Add the default serial port(uart2)
> 
> Changes in v2:
> - Fix rgmii delays
> 
> Changes in v1:
> - Add support for Firefly ROC-RK3588S-PC
> 
> Hsun Lai (2):
>   dt-bindings: arm: rockchip: Add Firefly ROC-RK3588S-PC
>   arm64: dts: rockchip: add DTs for Firefly ROC-RK3588S-PC
> 
>  .../devicetree/bindings/arm/rockchip.yaml     |   5 +
>  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>  .../boot/dts/rockchip/rk3588s-roc-pc.dts      | 926 ++++++++++++++++++
>  3 files changed, 932 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts
> 
> --
> 2.34.1
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
 Base: attempting to guess base-commit...
 Base: remotes/arm-soc/rockchip/dt64-31-ge463625af7f9 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/rockchip/' for 20250516012402.580468-1-i@chainsx.cn:

arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dtb: /edp@fdec0000: failed to match any schema with compatible: ['rockchip,rk3588-edp']





