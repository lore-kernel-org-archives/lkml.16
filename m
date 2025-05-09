Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE74213259;
	Fri,  9 May 2025 14:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746800225; cv=none; b=clPV3JrCseA9o1X26sT95yddkc9ILLVcuQi4HuIQ/tYWHnjnjmyDlo4E4bZTQVEs3CzkZL6N+G6RM1q4xGsSjUxj9HchDrD0JLX9bpFdZ7xD2pm0cA3R/VtEhc0wBnobmxyqu+hheh5G/OZ3MutDWB41VCNK2ZkHiraJ/KJyx4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746800225; c=relaxed/simple;
	bh=hA+Ww4vy1WmPC6ngKo3l3xg9yMIXdOIipY2osC7nGmc=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=IOOq0mI46RONrskURKpJBvN6hinN+QczvtmeajvXsE8JwigEgebE0uJsVFDjYcViGskuZeqC/5pCCP5gw0cA64n9uvRKowse+8uA3bgusQXZGIvZ3tHGbtgAhQjiizzjXBbQMU3yJ+I2RuWWKkUO344slg1WCzZEksdJONzVa9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U2q+dLGs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U2q+dLGs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45D22C4CEE4;
	Fri,  9 May 2025 14:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746800224;
	bh=hA+Ww4vy1WmPC6ngKo3l3xg9yMIXdOIipY2osC7nGmc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=U2q+dLGsfJg1tCC/qbSehXOGekZyB7XemA6wb6gUXoawYhZ+aDMMv1ZFbMY6HUpnk
	 c0YdwDI3/EMUekz8/xrb6JXfyG901ARY8SI/7eHeCInnyqkMA2WUq2N90dBSfCfzj6
	 OQg5vMMlZ3a0FA+RxzGx82RhqHFQuvVr8CVLcotvKvRO03yk1A3itW6ceiqgtL5MLe
	 1YFpGUCZp7wIwrFgIuLpj2XX0QR7O7NXHG0UiXXBNXFjaF0deecP7Gw6O1lMJruu+x
	 53aKcIrEBamUjrpZPCimc6wIRyWbcGG7s/uFAPGdZyF9ISyrRXsYyg0xdWAV5r5mwR
	 ebvEuOrTGbDJw==
Date: Fri, 09 May 2025 09:17:02 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, kernel@collabora.com, 
 FUKAUMI Naoki <naoki@radxa.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
In-Reply-To: <20250508-rock5bp-for-upstream-v2-0-677033cc1ac2@kernel.org>
References: <20250508-rock5bp-for-upstream-v2-0-677033cc1ac2@kernel.org>
Message-Id: <174679985287.3369051.14227124355079340433.robh@kernel.org>
Subject: Re: [PATCH v2 0/5] arm64: dts: rockchip: add ROCK 5B+ support


On Thu, 08 May 2025 19:48:49 +0200, Sebastian Reichel wrote:
> This series adds support for the ROCK 5B+, which (as the name suggests)
> is an improved version of the ROCK 5B. It also adds initial USB-C
> support for both the ROCK 5B and the 5B+.
> 
> Changes in PATCHv2:
>  - Link to v1: https://lore.kernel.org/r/20250324-rock5bp-for-upstream-v1-0-6217edf15b19@kernel.org
>  - Replaced DT binding patch with the version from NAOKI
>  - Dropped unused pinctrl for vcc5v0_host_en from the shared DT
>  - Moved USB-C SBU DC pins to board specific files, since they differ
>    between Rock 5B and Rock 5B+
>  - Added pinmux for SBU DC pins
>  - Rebased to latest version of Heiko's for-next branch
>  - Disable USB-C on Rock 5B for now
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
> FUKAUMI Naoki (1):
>       dt-bindings: arm: rockchip: Add Radxa ROCK 5B+
> 
> Sebastian Reichel (4):
>       arm64: dts: rockchip: move rock 5b to include file
>       arm64: dts: rockchip: move rock 5b to include file
>       arm64: dts: rockchip: add Rock 5B+
>       arm64: dts: rockchip: add USB-C support for ROCK 5B+
> 
>  .../devicetree/bindings/arm/rockchip.yaml          |    5 +
>  arch/arm64/boot/dts/rockchip/Makefile              |    1 +
>  .../boot/dts/rockchip/rk3588-rock-5b-plus.dts      |  129 +++
>  arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts    |  970 +-----------------
>  arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi   | 1082 ++++++++++++++++++++
>  5 files changed, 1247 insertions(+), 940 deletions(-)
> ---
> base-commit: b7caeb9545db25649eda36ce593b70cc2aa804ab
> change-id: 20250324-rock5bp-for-upstream-fd85b00b593b
> 
> Best regards,
> --
> Sebastian Reichel <sre@kernel.org>
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
 Base: base-commit b7caeb9545db25649eda36ce593b70cc2aa804ab not known, ignoring
 Base: attempting to guess base-commit...
 Base: tags/v6.15-rc1-40-g425af91c5802 (best guess, 2/3 blobs matched)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/rockchip/' for 20250508-rock5bp-for-upstream-v2-0-677033cc1ac2@kernel.org:

arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: /edp@fdec0000: failed to match any schema with compatible: ['rockchip,rk3588-edp']
arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: /edp@fded0000: failed to match any schema with compatible: ['rockchip,rk3588-edp']





