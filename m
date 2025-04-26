Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF83F2066F5;
	Sat, 26 Apr 2025 21:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745704010; cv=none; b=qQ+Ng6WgiZgITko42V/Oi+vmidYSpN/Ks9VQA6QntJnkUH0CrfIwEYGthfY0AstzVl3eObS6/cnCXC1clJmj5pD954NWFYmoa/BtPWKQsqf+of+NBah9v3Dpr198OYU/o+G5TP8Du05M7sZYeOa1FEYSMfa9ObMXLoNkkeZTwo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745704010; c=relaxed/simple;
	bh=ynv/wfwjZEk4oIq6re7xnM18SfXROFg18WZyQV945Os=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NvNbblBTF0fJ9mlTJliWUQep4p83hzTH56VbHvKQ2YnGiG9ng1CNdbfk6GpOy1XgeC2yKSL9K9tGHiaSvIxcSAQhob+ssJbcnqTOby68bLXFgv2xxJfdVHBrP2B1RVRQXWzrZg8vQr5Q8zoQTr+qZVFx2L3IQ6Qm3hh+irWGUeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=JQtUD51f; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="JQtUD51f"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=nzrNCfIbltJDUh80KeXlbQkeQ/0zkPnKqxcq0vFHnCk=; b=JQtUD51fZGQQxc8ThllDYRda/J
	UsYh90YKpgmHy6rd9JUOG9a7+SmcJR5UnWZ51MWF2l8hTlfGtV6phO5NyLN/qVSKNi4HU4BrRdbAA
	3dnXjheeTjG30PyUATW7xQXKD4PQZ18OvqlXdKb7BvV7B6/e9lFI7q3DehiofZL5tm72sBfbMYfl6
	/fDi/XafR845N/ZOXejcqVDt6npFcjfBk3vOm+6N9ti6CAkYvmdsbQjFG/EGnAmkRyLuRFoaqvvSs
	Ntp886f6adFTCfffJ+UaOSsyZ9H7o24mifmqjNIVSDHRqemOnHT8WyFmJHIk8H7j5drkcraRTqOZp
	Rua6IaAw==;
Received: from i53875aba.versanet.de ([83.135.90.186] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u8nLr-0001OR-W1; Sat, 26 Apr 2025 23:46:24 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Kever Yang <kever.yang@rock-chips.com>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Alexey Charkov <alchark@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Add support for RK3588 EVB2 board
Date: Sat, 26 Apr 2025 23:46:11 +0200
Message-ID: <174570370119.31943.10378973370072965130.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250418014757.336-1-kernel@airkyi.com>
References: <20250418014757.336-1-kernel@airkyi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 18 Apr 2025 09:47:55 +0800, Chaoyi Chen wrote:
> General features for rk3588 evb2 board:
> - Rockchip RK3588
> - LPDDR4/4X
> - eMMC5.1
> - RK806-2x2pcs + DiscretePower
> - 1x HDMI2.1 TX / HDMI2.0 RX
> - 1x full size DisplayPort
> - 3x USB3.0 Host
> - 1x USB2.0 Host
> - WIFI/BT
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: rockchip: Add rk3588 evb2 board
      commit: ebabb3cdb89eee8853157a6daeed9d3f5a46dce4
[2/2] arm64: dts: rockchip: Add rk3588 evb2 board
      commit: 013dd238a822c940e056504fe644bd0a38c5d806

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
