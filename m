Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB57254AE3;
	Mon, 10 Feb 2025 22:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739227530; cv=none; b=PCN/fgvBObKPHIj6nBDuKLh+mTv2B7VZHznJhfJH+9weKcdb32EoUbFV4hSA2JobW32BZKgBlnLMcZTOIUIoWHSLofO2IL4/Tb63Z2InSEdBamMQrva08QBoB5D8/EOm7iv/ihHOFJ5UGhQiQSEEx/MAL7g1jJjKAyxzAK2CesU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739227530; c=relaxed/simple;
	bh=BVxPZgKzHyHS2zRy8D9/+2kpxmjJpMpZiYx6yiRcSOI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bUrhjtc8dRsK7qav/ylnNx0icVeNfc2H69+O89BECbHeX82XBJWSd11QJ0EI/wS/+4PNA0wcRKfPEj8QB1EBxIbLyNC+NF142P0x9qniDyOWJknHub+iHGiRELq9E2+gTTFtxcBwm6i/4dHxuHY9ngsiKbmqP9Jtr+JmG+d2zQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=l1Do6j5r; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="l1Do6j5r"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=LrXXAyUOuS7rEeLYNGIPSPz3dA1DubuM1MKnNi6fXrU=; b=l1Do6j5rWvMdrCZXx5aFRWW5Ew
	8o1ONrJQYloMRj1N3UflHnZg9Ca7+KRN/WSD/huX7BWngnkEIT0AQOueUjC5ngCf/pJtjkubC6wVL
	X1ymW7GEFYF5l4BPZD4oAJHxde4m7NClIU0qqTXwzMC+maywSoer44BaW5kCQCiCi2PgWqPYlWB+1
	J8ILB+LAsBYXS12gtSX38FIdPgEL1VmIQwwwuPuIdx47jjqjdukkowyeCWuYz/E0LkKz/aOP/I5fs
	Ci66l+vLP3YAxGkfuD+rpd7VjKRdwI0+ff7wpzT4hCBYzjZkxZO3bY04qP2n0BxweQg8slhAHeaZZ
	XcisWbaA==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1thcWo-0008Re-Bi; Mon, 10 Feb 2025 23:45:22 +0100
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
Subject: [PATCH RESEND v2 0/6] RK3576 OTP support
Date: Mon, 10 Feb 2025 23:45:04 +0100
Message-ID: <20250210224510.1194963-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
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


RESEND, because I messed up my git-send-email which caused it to include
the list of patches 2 times, duplicating everything :-( .

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

