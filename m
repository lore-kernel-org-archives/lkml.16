Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577BA17E0;
	Sun, 18 May 2025 22:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747605921; cv=none; b=KGNkwbxQdbS2E50+Yw1IEjlJRt+DFaHtZ0mTF52JVC7W6wDOwdrpg+Du6LH8HfI0Le1ncWtoXntN6WMkovdSVXzAE2W/NtFeq32ZD0Zc4r+7kl5bLfUbB6fE7P9wORiibC5Q1fp5Fq6LXaO3itPxbb60aHzuZ8iS92o5k5SUD2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747605921; c=relaxed/simple;
	bh=GxQwZk7LGV/p9yqalxZZep4/0rY8eeu4nT0SYp8nucM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r2Yj4wSGDnXEXcU+Daz2/mi7OpAE1Y8KHvL0qbvJZVwltZ/OXXycz8Q/lGCDt4ly0RMvfOoUf+fDCNLPvrfJLOdA+Fv2vfZA0OiK59jxsxu9OBvFlSm7nvcp4fmrxR6h6arb+A/q05clZlVDXTtKVZLcceVi5DpaY3SdrSGqrtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=TnndYMgA; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="TnndYMgA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=liUtdoJ/xU4IQHWaOQbDn7BoXn7VV03bnVxdZQSMveU=; b=TnndYMgA1PAjUk5axz5JKVv35U
	oAEWcAXeK+nXJkXwOWcKidM8zUiqM4d0XJ+PrEljuhUFdOmNvuhldp8T8LqCZXQfA89YPnAzZlYpx
	9lLEmlwcbQETJHgb9cSiGnxNkU4Vri+M3owvIBcX7vXfcDekheJedxUFCGR44SOg7QAsZvdAJ1jHk
	6gZNpWXWdk2LpG+M8Qd9KtHEY241RKjhclmWQZwTCDNUmWW1cNZKDw4npN/aCpzPBhfebJWR/VBy7
	1ain0NMXsdtPI7j77wn66pGIfgFNx428otChJ/QflmOTAYBmLpy1j38tBDMMhz4zoKxfravSRxY5m
	JKkuw/vw==;
Received: from i53875a50.versanet.de ([83.135.90.80] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uGm7y-0004gv-Bx; Mon, 19 May 2025 00:05:02 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ziyao@disroot.org,
	kever.yang@rock-chips.com,
	nicolas.frattaroli@collabora.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] Fix some warnings about PCIe and pinctrl on RK3528/RK3562/RK3576
Date: Mon, 19 May 2025 00:04:42 +0200
Message-ID: <20250518220449.2722673-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Inspired by the issue reported by the kernel-test-robot in
  http://lore.kernel.org/r/202505150745.PQT9TLYX-lkp@intel.com

fix it and similar issues in all of rk3528, rk3562 and rk3576.


Heiko Stuebner (6):
  arm64: dts: rockchip: fix rk3576 pcie unit addresses
  arm64: dts: rockchip: move rk3576 pinctrl node outside the soc node
  arm64: dts: rockchip: remove a double-empty line from rk3576 core dtsi
  arm64: dts: rockchip: move rk3528 pinctrl node outside the soc node
  arm64: dts: rockchip: fix rk3562 pcie unit addresses
  arm64: dts: rockchip: move rk3562 pinctrl node outside the soc node

 arch/arm64/boot/dts/rockchip/rk3528.dtsi | 136 ++++-----
 arch/arm64/boot/dts/rockchip/rk3562.dtsi | 242 ++++++++--------
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 353 +++++++++++------------
 3 files changed, 365 insertions(+), 366 deletions(-)

-- 
2.47.2

