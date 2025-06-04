Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B5228F51C;
	Wed,  4 Jun 2025 13:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749045492; cv=none; b=Rr/+sIC5AKsneErwynahYY0H0MxcFCTbz3XVHTYRFAUwWoZ6OLSdvFufLuCVN2JjFCoID9A51t9mDgBK25HX5dBKiyFxFgdATbLswT/uY7IhfhOFSs89JMohqyAgCeJhvgr3DMFLpwpwqZyrdIzpPzsEITGkIApTlEwiNESPHP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749045492; c=relaxed/simple;
	bh=DmoZb/9o3rHGp2jGpcgoTHMl8Ju66rgQCq7at8FrRfM=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=SlSSsdz3C9QdHG90a5OJCoStEE7C4yyd2Zn5oKtw0v3/Pgv1ftRxVl1d1DstUPbGEMWEenFN+LN35/wuxO7XiIQjHLFuZQezmw28O59jlF4DNGqB8l2qSrxVJwvtexY45oZE4dmbJJu1LYMmW1DJ7LJcxKvQHPpOZB1O9LUy00k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fb1apBZg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fb1apBZg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE84DC4CEE4;
	Wed,  4 Jun 2025 13:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749045492;
	bh=DmoZb/9o3rHGp2jGpcgoTHMl8Ju66rgQCq7at8FrRfM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Fb1apBZg+VOhlfLXG1iDiloTrcIMRFweni9mL+9petMCQ5sqx1/Ay5x4uPlWMHyFA
	 RPU58NRypx5ukcZPLC40Gxx5v2ti+g2uLIGi2YwAxn/yuXikFUdyfGw332fZ9TpAnY
	 3fg0DV30D+fSSS9/2as7/N2zy0B96Mbt9pqK1ZNcio0dXO6IbhCCfnI9/0cCHxzWqn
	 7IHKk1Svq3I+hpK5ouwT71QmpS4xbqTBZFaEhIqjg74QcVUPo44fybVwCV+mYmzGt9
	 7LxVyNiOKoincQzEV3t9EaykZj8625C4CFBO2SDxztmTIIq3J0+Hj8U6s1dcGrcpg+
	 xdi4F/0uPUaBg==
Date: Wed, 04 Jun 2025 08:58:09 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org
To: Alexey Charkov <alchark@gmail.com>
In-Reply-To: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
References: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
Message-Id: <174904540020.3869609.29886103068021354.robh@kernel.org>
Subject: Re: [PATCH 0/4] arm64: dts: rockchip: enable further peripherals
 on ArmSoM Sige5


On Tue, 03 Jun 2025 21:01:12 +0400, Alexey Charkov wrote:
> Add support for the two USB type A ports, link up the CPU regulators for
> DVFS, enable WiFi and Bluetooth.
> 
> The bluetooth part might warrant some discussion and thoughts from the
> list, given that it's connected over UART and thus not discoverable. At
> the same time, there are two revisions of the board which have different
> Bluetooth chips soldered on: Realtek based on v1.1 and Broadcom based on
> v1.2. I'm not sure if there is any way to determine board version from
> software. Mine is v1.2, so the respective patch deals with the Broadcom
> case only, but maybe it's better to move it into a .dtso and thus kick
> the can down the road (i.e. make the user deal with board identification
> and loading of the right overlay)? Thoughts welcome.
> 
> Best regards,
> Alexey
> 
> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---
> Alexey Charkov (4):
>       arm64: dts: rockchip: list all CPU supplies on ArmSoM Sige5
>       arm64: dts: rockchip: enable USB A ports on ArmSoM Sige5
>       arm64: dts: rockchip: enable wifi on ArmSoM Sige5
>       arm64: dts: rockchip: enable bluetooth on ArmSoM Sige5
> 
>  .../boot/dts/rockchip/rk3576-armsom-sige5.dts      | 135 +++++++++++++++++++++
>  arch/arm64/boot/dts/rockchip/rk3576.dtsi           |  16 +++
>  2 files changed, 151 insertions(+)
> ---
> base-commit: 546b1c9e93c2bb8cf5ed24e0be1c86bb089b3253
> change-id: 20250602-sige5-updates-a162b501a1b1
> 
> Best regards,
> --
> Alexey Charkov <alchark@gmail.com>
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
 Base: using specified base-commit 546b1c9e93c2bb8cf5ed24e0be1c86bb089b3253

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/rockchip/' for 20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com:

arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: mmc@2a320000 (rockchip,rk3576-dw-mshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['rockchip,rk3576-dw-mshc', 'rockchip,rk3288-dw-mshc'] is too long
	'rockchip,rk2928-dw-mshc' was expected
	'rockchip,rk3288-dw-mshc' was expected
	'rockchip,rk3576-dw-mshc' is not one of ['rockchip,px30-dw-mshc', 'rockchip,rk1808-dw-mshc', 'rockchip,rk3036-dw-mshc', 'rockchip,rk3128-dw-mshc', 'rockchip,rk3228-dw-mshc', 'rockchip,rk3308-dw-mshc', 'rockchip,rk3328-dw-mshc', 'rockchip,rk3368-dw-mshc', 'rockchip,rk3399-dw-mshc', 'rockchip,rk3528-dw-mshc', 'rockchip,rk3562-dw-mshc', 'rockchip,rk3568-dw-mshc', 'rockchip,rk3588-dw-mshc', 'rockchip,rv1108-dw-mshc', 'rockchip,rv1126-dw-mshc']
	from schema $id: http://devicetree.org/schemas/mmc/rockchip-dw-mshc.yaml#
arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: mmc@2a320000 (rockchip,rk3576-dw-mshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['rockchip,rk3576-dw-mshc', 'rockchip,rk3288-dw-mshc'] is too long
	'rockchip,rk2928-dw-mshc' was expected
	'rockchip,rk3288-dw-mshc' was expected
	'rockchip,rk3576-dw-mshc' is not one of ['rockchip,px30-dw-mshc', 'rockchip,rk1808-dw-mshc', 'rockchip,rk3036-dw-mshc', 'rockchip,rk3128-dw-mshc', 'rockchip,rk3228-dw-mshc', 'rockchip,rk3308-dw-mshc', 'rockchip,rk3328-dw-mshc', 'rockchip,rk3368-dw-mshc', 'rockchip,rk3399-dw-mshc', 'rockchip,rk3528-dw-mshc', 'rockchip,rk3562-dw-mshc', 'rockchip,rk3568-dw-mshc', 'rockchip,rk3588-dw-mshc', 'rockchip,rv1108-dw-mshc', 'rockchip,rv1126-dw-mshc']
	from schema $id: http://devicetree.org/schemas/mmc/rockchip-dw-mshc.yaml#
arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: mmc@2a320000 (rockchip,rk3576-dw-mshc): Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/mmc/rockchip-dw-mshc.yaml#
arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: mmc@2a320000 (rockchip,rk3576-dw-mshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['rockchip,rk3576-dw-mshc', 'rockchip,rk3288-dw-mshc'] is too long
	'rockchip,rk2928-dw-mshc' was expected
	'rockchip,rk3288-dw-mshc' was expected
	'rockchip,rk3576-dw-mshc' is not one of ['rockchip,px30-dw-mshc', 'rockchip,rk1808-dw-mshc', 'rockchip,rk3036-dw-mshc', 'rockchip,rk3128-dw-mshc', 'rockchip,rk3228-dw-mshc', 'rockchip,rk3308-dw-mshc', 'rockchip,rk3328-dw-mshc', 'rockchip,rk3368-dw-mshc', 'rockchip,rk3399-dw-mshc', 'rockchip,rk3528-dw-mshc', 'rockchip,rk3562-dw-mshc', 'rockchip,rk3568-dw-mshc', 'rockchip,rk3588-dw-mshc', 'rockchip,rv1108-dw-mshc', 'rockchip,rv1126-dw-mshc']
	from schema $id: http://devicetree.org/schemas/mmc/rockchip-dw-mshc.yaml#
arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: mmc@2a320000 (rockchip,rk3576-dw-mshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['rockchip,rk3576-dw-mshc', 'rockchip,rk3288-dw-mshc'] is too long
	'rockchip,rk2928-dw-mshc' was expected
	'rockchip,rk3288-dw-mshc' was expected
	'rockchip,rk3576-dw-mshc' is not one of ['rockchip,px30-dw-mshc', 'rockchip,rk1808-dw-mshc', 'rockchip,rk3036-dw-mshc', 'rockchip,rk3128-dw-mshc', 'rockchip,rk3228-dw-mshc', 'rockchip,rk3308-dw-mshc', 'rockchip,rk3328-dw-mshc', 'rockchip,rk3368-dw-mshc', 'rockchip,rk3399-dw-mshc', 'rockchip,rk3528-dw-mshc', 'rockchip,rk3562-dw-mshc', 'rockchip,rk3568-dw-mshc', 'rockchip,rk3588-dw-mshc', 'rockchip,rv1108-dw-mshc', 'rockchip,rv1126-dw-mshc']
	from schema $id: http://devicetree.org/schemas/mmc/rockchip-dw-mshc.yaml#





