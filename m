Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9D92580F1;
	Mon, 10 Feb 2025 16:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739204561; cv=none; b=QiBvIN5HGoESz9YgLRHMzwmZu++dEIzlaHDWEa2nruftV4Sy8mnNqqcuMSb383GtFA2uO2lplZihWibxQOnL5FW9DM5z0nI3HDgJLbTUPSPJZkv3YjpBebr/37nLXReaKFB7Mgf6JNZSCOks7bxewl4rguYEAj/MQkMcJVqbUmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739204561; c=relaxed/simple;
	bh=kXnRrtpV39SwJ3fcBvjLSZwpqpYLRosn3Kr11L23x3o=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=TL7vNGLGDhIzaIEPJrmyfMK9tcR3GZN1rfHJ9G3ILaImzNoVxzclLjzGdh0LEEdewyMbbTCxuheNKYVOAaOtjzVVoNmyeXKasJrStIGJ6YrY3IrKh07uNCZtxrbI2gvIJwvzt8H0VMds+RuHamMjwVlkZZytT7+0k0Y+6VqGr48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hWAtW1hL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hWAtW1hL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15A98C4CED1;
	Mon, 10 Feb 2025 16:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739204561;
	bh=kXnRrtpV39SwJ3fcBvjLSZwpqpYLRosn3Kr11L23x3o=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=hWAtW1hLKsWoLontOWKvHpdOmEO2IITitGT0NfFAEuB4r47VAG76FSqoR2ZWk8vN3
	 P9SyUYgzsYXdvUBdZzbZMFyTTDYvyVnoQzWhAyFfu8Qn+jtCLqgnrfxP2A2xdbyb7u
	 nP6mhR18xxVbTAItzJtEWFVAsRcmqDBejL8nVr+KfFfNgCShUAzPTPbJEYE00yJsWk
	 JW76XLb0f0jt+vhg+Fk7owtwAOZ/YQ+ZM3mN6H4/66bm5/1bJfn5zjr/TKMoHeV0mW
	 /vndejKtUWHaAb4H9QL+O9LcV6VjnAAYCp4xjLALP6CG9ZtmDclPjaXwdzoANNPiOK
	 xBDMskEjK8Xng==
Date: Mon, 10 Feb 2025 10:22:40 -0600
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: krzk+dt@kernel.org, huangtao@rock-chips.com, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, kever.yang@rock-chips.com, 
 devicetree@vger.kernel.org, jonas@kwiboo.se, heiko@sntech.de, 
 conor+dt@kernel.org
To: Elaine Zhang <zhangqing@rock-chips.com>
In-Reply-To: <20250208015757.27594-1-zhangqing@rock-chips.com>
References: <20250208015757.27594-1-zhangqing@rock-chips.com>
Message-Id: <173920411678.476525.17114471153567549022.robh@kernel.org>
Subject: Re: [PATCH v3 0/2] clk: rockchip: Fixed some incorrect commits


On Sat, 08 Feb 2025 09:57:55 +0800, Elaine Zhang wrote:
> Change in V3:
> [PATCH v3 0/2]: As discussed in the email, assigned-clock-parents in DT.
> [PATCH v3 1/2]: Merge patches into one.
> 
> Change in V2:
> [PATCH v2 0/3]: NO change
> [PATCH v2 1/3]: Update commit message
> [PATCH v2 2/3]: Update commit message
> 
> Elaine Zhang (2):
>   ARM: dts: rockchip: assigned-clock-parents to SCLK_HDMI_PHY for
>     DCLK_VOP
>   arm64: dts: rockchip: Increase VOP clk rate on RK3328
> 
>  arch/arm/boot/dts/rockchip/rk322x.dtsi   |  2 ++
>  arch/arm64/boot/dts/rockchip/rk3328.dtsi | 10 ++++++----
>  2 files changed, 8 insertions(+), 4 deletions(-)
> 
> --
> 2.17.1
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


New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/rockchip/' for 20250208015757.27594-1-zhangqing@rock-chips.com:

arch/arm/boot/dts/rockchip/rk3228-evb.dtb: vop@20050000: assigned-clocks: [[2, 190]] is too short
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop.yaml#
arch/arm/boot/dts/rockchip/rk3228-evb.dtb: vop@20050000: 'assigned-clock-parents' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop.yaml#
arch/arm/boot/dts/rockchip/rk3229-xms6.dtb: vop@20050000: assigned-clocks: [[2, 190]] is too short
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop.yaml#
arch/arm/boot/dts/rockchip/rk3229-xms6.dtb: vop@20050000: 'assigned-clock-parents' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop.yaml#
arch/arm/boot/dts/rockchip/rk3229-evb.dtb: vop@20050000: assigned-clocks: [[2, 190]] is too short
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop.yaml#
arch/arm/boot/dts/rockchip/rk3229-evb.dtb: vop@20050000: 'assigned-clock-parents' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop.yaml#





