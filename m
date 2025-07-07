Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A70D28E7;
	Mon,  7 Jul 2025 01:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751853379; cv=none; b=DK6izbCuMDbQrNlXi4faMQSPBKCdIEt7SYegVj6WoCQgUFfrNrnLqivdopQfEAJhZVmyc988b9ApR+9tEWD/8MU7fZwLvjeN1SkBgRm//h1Ks91dQ2p0d9SRLPIP+rLegGIBfDfloUm5fxdPO+Uy3rS0atUfmld2X5OKFQJytQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751853379; c=relaxed/simple;
	bh=WhU0KZ3UIQUN4rUiJcwtwTnojok2iaAWunJa00LmijM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=E3hmUKXFJdsLkfamnmxeJYS7VYJJ0XXzXcRUB9NVYMMSlALL+2scmNKZGPCZNxh57yzfOOtyHciPf+SFOyVkl2XpSXu+94SsFRCxwwame/c232L87pDTT6mCE9ft3IdOEQrH5NygxHIqCZ6267lQctV2Y0Uvfc57JeeTjKv24bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52B0EC4CEED;
	Mon,  7 Jul 2025 01:56:18 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 12DC65F7C0;
	Mon,  7 Jul 2025 09:56:16 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20250628161608.3072968-1-wens@kernel.org>
References: <20250628161608.3072968-1-wens@kernel.org>
Subject: Re: [PATCH v3 0/5] arm64: allwinner: t527: Add OrangePi 4A board
Message-Id: <175185337604.2581101.17317086913285770626.b4-ty@csie.org>
Date: Mon, 07 Jul 2025 09:56:16 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Sun, 29 Jun 2025 00:16:03 +0800, Chen-Yu Tsai wrote:
> This is v3 of my OrangePi 4A series.
> 
> Changes since v2:
> - Actually include cpusldo regulator name change and axp323 aldo1/dldo1
>   comments
> - Fix indentation of comment in usb_otg block
> - Link to v2:
>   https://lore.kernel.org/all/20250625131652.1667345-1-wens@kernel.org/
> 
> [...]

Applied to sunxi/dt-for-6.17 in local tree, thanks!

[1/5] dt-bindings: arm: sunxi: Add Xunlong OrangePi 4A board
      commit: bbe7cf4bab161a50ce631c9dd7724df333cdf12d
[2/5] arm64: dts: allwinner: a523: Move mmc nodes to correct position
      commit: 6e2662c07a90e9f782158b7d6eda2766f65e9c36
[3/5] arm64: dts: allwinner: a523: Move rgmii0 pins to correct location
      commit: 84c4a16e00f5aadbb1a3bdecc6bbfee35b7c45c8
[4/5] arm64: dts: allwinner: a523: Add UART1 pins
      commit: 64f2f7bc4acb7928b39cac4a9a932e77b966f31c
[5/5] arm64: dts: allwinner: t527: Add OrangePi 4A board
      commit: de713ccb99345be302adf507274d1b190dd2302e

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>

