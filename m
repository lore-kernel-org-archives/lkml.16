Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6849926463F;
	Mon, 10 Feb 2025 20:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739220715; cv=none; b=qXEnxL8uASH5mKAaYuXfbJgbZQaRtVv3KCmgjLLoUouKKtOYh4vm1cZ8PXFekCpDHqAuKdPOgzUJNqwSXDKuDvGoq3n2Fge2LAWhLTkaXxfDIH+Ho4nBMWrnVfcz1saCPGdQi6XIhBOucgyjl5s0A1kIYjF/zKQZoiD4e6Jzobw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739220715; c=relaxed/simple;
	bh=RxpXyNGpflCdnssLRRhb8Ns+pTx3+ninfLnPHadeZhA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y4WA09ZZPi4tB+wKgTxWpaFFF9HVT+Ag6yTe8QZpgWh4Bk9idM5HVuF+CDf9vyDxpg2UqWwAmDuDdu7ipX4y9GMj4KD1wrtoDmAyt3tJA4rHPLhF3QzSeE/AyJnhhZidcccQ/OdrkbFp5Mbx5QF+1e4OKjvz1Q/AvR6TBcNssPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=DhQgYNue; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="DhQgYNue"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=z5oKt3XXLHGHJrEW0fq5xJQ0956ey9sHyzc1yPBS9mo=; b=DhQgYNuegMfRUdP6y+pJ7b0F/p
	hvXTQ3yf3WsjmvC1T5fTdnFP8Zyu4/wR1MV+QZ/pS5lbskN3TcRF/YcWhQ01JbHfkq02fM5+bg5ZL
	MW9TtwP9/fMVaOIvBvkT5hYKQzo/KCjj7cOmS8lZtjrZtHI45iT3dvsKXiqkfODAuno0qf9DwKT1d
	cLSGup0x1PK3sDOeXcmCK5ChAlhXErijQLUd/syNHP13CQbXUi9IDtm4YEETofliQLdNrj6nAn7+6
	0iYS8704BbaFro8wdfdjknpqqwF7/VgzsgKoMubZ0UmEVCtM2unxY+Wv2erP93WnTkzXUQkrdBk+i
	GagVWZdw==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1thakl-0007Ka-IT; Mon, 10 Feb 2025 21:51:39 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jonas@kwiboo.se
Subject: [PATCH v2 0/2] Rockchip - add Firefly ROC-RK3576-PC board
Date: Mon, 10 Feb 2025 21:51:24 +0100
Message-ID: <20250210205126.1173631-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds a second board based around the rk3576 SoC.

changes in v2:
- add Rob's Ack on the binding
- move ethernet-phy-reset control into the phy-node (Jonas)
- some sorting cleanups

Heiko Stuebner (2):
  dt-bindings: arm: rockchip: Add Firefly ROC-RK3576-PC binding
  arm64: dts: rockchip: Add devicetree for the ROC-RK3576-PC

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../arm64/boot/dts/rockchip/rk3576-roc-pc.dts | 736 ++++++++++++++++++
 3 files changed, 742 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts

-- 
2.47.2

