Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3E3257422;
	Mon, 10 Feb 2025 22:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739227530; cv=none; b=XIgyj6UdfCxQUVGWuFIL6tWbJVLJKqZ055RywGn4rTvm9Lidb+S38YpTw3pvidChmCTWcGsf611NGKVWRIU9DkHZD/EUjd03tpWrbKoGJyLXhuuF+4YJtNPF5BZGFXi0KUpmBaAinc7roZ+A4oHcrNE1A8TY3U8EJpbBouX4uVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739227530; c=relaxed/simple;
	bh=BVJxFp26hQxuOIjb9WU7dvu3gglWDB0wMQRce6wT38g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CMDieOmOrvPA7Fn+FXmuyfUdQZD2DhDg+4DJ4WhdLk5oY9KXk8o0Fny6FpSBnzp/KtDfZjCFCCXvIxipchvMp4vVeXfYMnpfm6UHhZ5I21TyHm8tnqdNMJ29wSy45jZuT0eClC30qItmoTDk1a0Vm63+j+jXSc9Lxz/ZUfWL+ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=YqhHgqVH; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="YqhHgqVH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=x62ijsNCPVrYm4nC3upourBy1Fy9pOeygf/DPMb93sY=; b=YqhHgqVH1KmLYmM/0G8Qrd9shE
	QrvKslLO7KYJHV7Y5VsxF+kqxmBz0NrRW/VoWvt45H2dm0gOjApe63HT0gmPgGr5xg4ccsYi80k8r
	3TY2tNpQBPHPlpNh2p+HKUDtulJK+3Dm0CxBkKGy3xpM2qSn7FNWva7lTJHuav3wx+QhOI+Sym/Yk
	l7QzHEKP9ICHj8w+wvm38p67E1QLwq6talLoRL5hyegiaBXJ3c2/x/DEbfJXib4IQn96KgTpst02Y
	BD7QmLQxVPR9t1RcHyeNC9y0yVCqxp050KdLnAps2PcN4Eou+9RzsULU1MsKYJrt67YVvK7jnq/2C
	LD2Gf2bg==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1thcWq-0008Re-Si; Mon, 10 Feb 2025 23:45:24 +0100
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
Subject: [PATCH RESEND v2 5/6] nvmem: rockchip-otp: add rk3576 variant data
Date: Mon, 10 Feb 2025 23:45:09 +0100
Message-ID: <20250210224510.1194963-6-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250210224510.1194963-1-heiko@sntech.de>
References: <20250210224510.1194963-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variant works very similar to the rk3588, just with a different
read-offset and size.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/nvmem/rockchip-otp.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/nvmem/rockchip-otp.c b/drivers/nvmem/rockchip-otp.c
index 3edfbfc2d722..d88f12c53242 100644
--- a/drivers/nvmem/rockchip-otp.c
+++ b/drivers/nvmem/rockchip-otp.c
@@ -274,6 +274,14 @@ static const struct rockchip_data px30_data = {
 	.reg_read = px30_otp_read,
 };
 
+static const struct rockchip_data rk3576_data = {
+	.size = 0x100,
+	.read_offset = 0x700,
+	.clks = px30_otp_clocks,
+	.num_clks = ARRAY_SIZE(px30_otp_clocks),
+	.reg_read = rk3588_otp_read,
+};
+
 static const char * const rk3588_otp_clocks[] = {
 	"otp", "apb_pclk", "phy", "arb",
 };
@@ -295,6 +303,10 @@ static const struct of_device_id rockchip_otp_match[] = {
 		.compatible = "rockchip,rk3308-otp",
 		.data = &px30_data,
 	},
+	{
+		.compatible = "rockchip,rk3576-otp",
+		.data = &rk3576_data,
+	},
 	{
 		.compatible = "rockchip,rk3588-otp",
 		.data = &rk3588_data,
-- 
2.47.2

