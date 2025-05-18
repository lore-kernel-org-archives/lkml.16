Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD8D1C1F05;
	Sun, 18 May 2025 22:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747605923; cv=none; b=VOIc47JnVZLK9U8isCRBRF4qoiEuvkJ3JodPaXdGleo68p45Sa8rULZIjlDidXDsaIFYBJXOCqnpu9FhC/9AIxklNsDtcYvHThg+M/EO8R+CYna64WCf5p8Y5EZgGBCxDzLQNcTDnEaZc2oqO0egMwBiKihE/hAqs9tJBs0omTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747605923; c=relaxed/simple;
	bh=3yP7bMH2jkvcANwa5lLh/klZmT0dwOlq2ra0BALxO5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h0FcoTHYBQWHmDjc3yxT1CJhtirVdoYAWlJl4QS+CDbcfpcehVBWSdX0ZtO9+16+sOWL5fYXZlRDoOQ+sMDdgHUlMwTNxo5bmckwHCclJ3bzz0ux92Fpa/7IICcxNcgbI21CUz1Wv4Sg332zcCRF5Y13qnuhcBF6vFDfjrdd57c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=BIDI9BIF; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="BIDI9BIF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=GBMtNI6cTtuuD6FKdLMsNoUStz5+7O3bDHN29nw5LRw=; b=BIDI9BIFqqrHzG9df7pynEaLxP
	gchll30OIePpoSQ0XgeGkB1/cF7YXTk6kioXpeBZfcxcC4pOWpE3BeCtdRDnAxENlyfDjQg2JdMlR
	KKFf0ulV3w+81HTR1eezkPFakVARPsUDNIElbIQhjjkOErBxIrqipPtzwuejnP51BlMKiCjxNArSk
	5O35CJbz4zb3uUuPKfmJrVbmW+5dtnIWcWVjYX0nB5RqF6Un/z6r2OJNC8OEW65pap25nlvzqi5SM
	/fE41RP0nOmHQ39EaGctpElz3D1fCUSDEyobqzfWB+r7zTUlvbmrWB5IpCr+wPVO667yHrE/8UgVa
	4+b0gyJQ==;
Received: from i53875a50.versanet.de ([83.135.90.80] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uGm7z-0004gv-SL; Mon, 19 May 2025 00:05:03 +0200
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
Subject: [PATCH 3/6] arm64: dts: rockchip: remove a double-empty line from rk3576 core dtsi
Date: Mon, 19 May 2025 00:04:45 +0200
Message-ID: <20250518220449.2722673-4-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250518220449.2722673-1-heiko@sntech.de>
References: <20250518220449.2722673-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two empty lines between nodes, is one too many.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index 0e0a37849874..b6e946e68b09 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -2000,7 +2000,6 @@ i2c5: i2c@2ac80000 {
 			status = "disabled";
 		};
 
-
 		i2c6: i2c@2ac90000 {
 			compatible = "rockchip,rk3576-i2c", "rockchip,rk3399-i2c";
 			reg = <0x0 0x2ac90000 0x0 0x1000>;
-- 
2.47.2

