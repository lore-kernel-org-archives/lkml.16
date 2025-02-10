Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FF0253F34;
	Mon, 10 Feb 2025 22:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739226772; cv=none; b=EOCKb8P27I0fQ5/3cQVGYwcDRZfap8lRUMFZ/NKZE1tWfYCP1ocxcuJ4W2QJ7x6/6UsQs8x78TYU0D5Ztt4Twsm/bnuaonKtq4rwYcO4CG6E1i4o1JsMaW9W1UpSqWelmhMgF6vu9CnX2T6o1bPHTU9VF60bXoemS+kO7z1HQag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739226772; c=relaxed/simple;
	bh=Be/S9wejoLNlaFFJb1yzC+zkuobb1yX3lX/voglLalI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t9JijQ/6dbvUjywrQLeADlEQrAAdij9WrJobhRJSxxZRtV+kY6Lzm4umM4xt5HwSmY0PCKhgin4AydS0V+41vXCagU1GiZ9WaojYvAhxBY1QZobn+Kw6YoBd45WZFYsdw4dtJEUFuE8niviwtGGzv2pYAKMBQY5hBwnZzfOyfqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=KQx4IXFN; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="KQx4IXFN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=C8lPyp1bEijzK7iT320e9XZGAhLFEPTQgrUvk5jBPAI=; b=KQx4IXFNJL5vV7eAiGmhZkA1eh
	dkbm7i7f0satR1STmER7NhHbuYLgQMSu10QYONFacXh4acrTAK6+gfw/6hREN8yK4yTwqT87z1Udg
	BBAVrs9JY5Pj50yyr0iPsdSO2znO8ghDvKfoyTMr60+wvOsvaYM1u/ZoZUPtn2su5hw7OEinNdEO6
	OvnM7tK1fIIFoCrVsg4m6WVR/V6oJ3Aqg8MFY80w8tkHDIO1tcnqEIbU96EBGFYjJFMuqE/vYb9zT
	zTZOXAZZ36nv3lczVrizPzEgsrYp4USeYV8ut5atmPI3rFkdHTj3RPkvaH0s40Bs/c3A39dB9NGOb
	WjnEBH9A==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1thcKb-0008Cw-DG; Mon, 10 Feb 2025 23:32:45 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: srinivas.kandagatla@linaro.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	detlev.casanova@collabora.com,
	sebastian.reichel@collabora.com
Subject: [PATCH v2 0/6] RK3576 OTP support
Date: Mon, 10 Feb 2025 23:32:13 +0100
Message-ID: <20250210223219.1193346-8-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250210223219.1193346-1-heiko@sntech.de>
References: <20250210223219.1193346-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This enables OTP support in the nvmem driver for rk3576.

I expect to pick the clock patch (patch1) and the arm64-dts patch (patch6)
myself, after the nvmem-driver and -binding patches have been applied
(patches 2-5).

But kept them together for people wanting to try this series.

changes in v2:
- fix register constant in clock definition (Diederik)
- add patch to set limits on variant-specific clock-names
- use correct limits for clocks + resets on rk3576 binding

Heiko Stuebner (6):
  clk: rockchip: rk3576: define clk_otp_phy_g
  nvmem: rockchip-otp: Move read-offset into variant-data
  dt-bindings: nvmem: rockchip,otp: add missing limits for clock-names
  dt-bindings: nvmem: rockchip,otp: Add compatible for RK3576
  nvmem: rockchip-otp: add rk3576 variant data
  arm64: dts: rockchip: add rk3576 otp node

 .../bindings/nvmem/rockchip,otp.yaml          | 25 ++++++++++++
 arch/arm64/boot/dts/rockchip/rk3576.dtsi      | 39 +++++++++++++++++++
 drivers/clk/rockchip/clk-rk3576.c             |  2 +
 drivers/nvmem/rockchip-otp.c                  | 17 +++++++-
 4 files changed, 81 insertions(+), 2 deletions(-)

-- 
2.47.2

