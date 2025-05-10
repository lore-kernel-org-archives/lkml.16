Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E102367AB;
	Sat, 10 May 2025 16:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746893654; cv=none; b=fejZmtzRAmR52Qekd3vtOkeV2Elk5FF1XVDyP+V3s8KeVSkdykVYEm8UoeF9YDUJKhaUcyPafm23uUeODQfr3PnEDeiw4yPej7khAyWwkKj47OF9+E7Uq+CdlZ2gbUUcpWr+N1t7+/b91mEBHNlShaLH2p4gC7oJD+gaPJqkq2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746893654; c=relaxed/simple;
	bh=DJ1nueSyMMR0CUhC7XhVV+H098JV17Y8cQljeokVAoA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OctlBmzYV2yCjuFnZmHgw9PKSPui7N+mfSEmH6F6zTLT3AdNsO5P+j3TK3ymUWq1+1+MG4OjHm/GRFEXMNJPJPiwZ9YyKzdfTQQRqbDGLRiWIuHrlgshcPg35h+9iZEymTFh6xcbfl3rHj38luUS+fzHTj4pWh87hihbzGq87Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=WF/gySV5; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="WF/gySV5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=JLIN5fxRX4VOtH6/6HLlKgRiyWKCDkOklPEcf7jmrxQ=; b=WF/gySV5cbJfWSI0l5mxymQ0NC
	TdmvJNEqSyZ9xgsaK3ykNDAizyDrVJWiBS32MJhm/xd2vyg2dJLsOfiFLk3InaRMXw1jzryunuzxF
	6K5kEkUvgbMQovLYcjAPB6YpQvOZhqmwa6w6sZ5rULhxfpLnIyGr5otfY7fqun1WkWTlQhGFuKBCb
	+I+yb81C+s6BUyq2xhMnPbXZ/wMYfLhTE7Uvg1QTWvPl8JF3aLfMtDT4cMhYCHfhT4TGXza3HnDts
	jLCLZ3MhqBPfCFklDqv9prIlH+1cW9NO1wK5022wjMPMGafEmdyHI6CZv6UW+Q2Nkamus+YzA+LmQ
	XAZqsdGg==;
Received: from i53875a1d.versanet.de ([83.135.90.29] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uDmpZ-0000dK-JW; Sat, 10 May 2025 18:13:41 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	Frank Wang <frank.wang@rock-chips.com>,
	Yao Zi <ziyao@disroot.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Johan Jonker <jbx6244@gmail.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Junhao Xie <bigfoot@classfun.cn>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Finley Xiao <finley.xiao@rock-chips.com>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	devicetree@vger.kernel.org,
	Diederik de Haas <didi.debian@cknow.org>,
	Rob Herring <robh@kernel.org>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Dragan Simic <dsimic@manjaro.org>,
	linux-kernel@vger.kernel.org,
	Jimmy Hon <honyuenkwun@gmail.com>
Subject: Re: [PATCH v7 0/5] rockchip: Add rk3562 SoC and evb support
Date: Sat, 10 May 2025 18:13:29 +0200
Message-ID: <174689356073.2086280.3221223912483379818.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250509102308.761424-1-kever.yang@rock-chips.com>
References: <20250509102308.761424-1-kever.yang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 09 May 2025 18:23:03 +0800, Kever Yang wrote:
> Patch series v6 remove USB and watchdog nodes, for relate patches not
> land recently although they have got review tag. Let's make the main dts
> get land first and then add relate dts node back when the driver patches
> get land.
> 
> Patch series V5 remove [v4 1/7] which had taken by Manivannan, and move
> scmi-shmem from soc node to reserved memory.
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: rockchip: pmu: Add rk3562 compatible
      commit: 01ccbe64f9e5702a530cca614f203d71462c67e1
[2/5] dt-bindings: soc: rockchip: Add rk3562 syscon compatibles
      commit: 472a4e77a2070ffbf47eb6c934ae56d362eae992
[3/5] dt-bindings: arm: rockchip: Add rk3562 evb2 board
      commit: b7016249819f5b61c5e59cea36e8c261091b48b3
[4/5] arm64: dts: rockchip: add core dtsi for RK3562 SoC
      commit: 29d0ba2d31b88fae0841daea3e3e1382d1b6687d
[5/5] arm64: dts: rockchip: Add RK3562 evb2 devicetree
      commit: 77f1ddac57404cc8e8e73e08ad405cd1f7b353ac

I've moved the PD_foo constants to their numerical values temporarily
and prepared a patch to move them back after the 6.16 merge window.


Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
