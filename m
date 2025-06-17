Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BDE295525;
	Tue, 17 Jun 2025 09:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750151247; cv=none; b=BFDgSOk1YZvN4tcGFzSlgByLG73hfgLIDCYbZ7nEi6+GhLB3ltEiiJjZt9CG99WWgYP9MbPzHuYXgvmkHz0We0xHc/EEz9ZxJliuzmtUgnuCYTW2YRbq+Fk8skefbL7eDw+FD5BjRAPCvIVRYa2XONmIgQYloKXx6xcvbn1vG7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750151247; c=relaxed/simple;
	bh=yepbeMaLbeFrf0k5ysXWpuKbuvZ7XHeHzfq2HuS7a4M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZQ4dhYOPLVRASADn8/A7JFOmlsAQJ+tbtqBa37rD8jk6rtsZAe3Lx4cjnkP0h4uqaiIjXhAelvmMkTEEBybCRqHBAypNvatJe64E4xcUfH47YXogIKe1CcbMn79YAwDqqubIL2kCzi82smKSjtsg6/r+D83FF5oSIFGWDnxb+sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QNHgDxh5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QNHgDxh5"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 701B1C4CEF6;
	Tue, 17 Jun 2025 09:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750151247;
	bh=yepbeMaLbeFrf0k5ysXWpuKbuvZ7XHeHzfq2HuS7a4M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QNHgDxh5HOEE0cpViNxl4/KsDAEqHUWNtltpPz4qNJ43oaOrKzrfEBC1ePCYPqi6N
	 4fzsPTyCWcK9I1xPBmLHQ6bayYH2AGrVnZ/MYMWNj8PZoq0yrsZ4HosBWQ7i0YgpuB
	 1BpMnFwm5FPvFZvCjbILKhiDL175t4C1sWmBAbd11aWU4mfqrrBHORzHQYtcyOFJAB
	 zpsrh+YZXOcwklz3XthHfU8oeQD4HWc6ZV+HjzhjXy3hbxhAvU+GvWw4Ndh548txlV
	 LYuv4lvRXx1pV3JhHdS81N6mVbybCe7DlQd3Xi56wbrmn5bIJBTiqajZVQtapCvSl6
	 lh4dT00brhEBQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67F74C71155;
	Tue, 17 Jun 2025 09:07:27 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Tue, 17 Jun 2025 10:54:44 +0200
Subject: [PATCH 3/5] phy: rockchip: phy-rockchip-inno-csidphy: allow writes
 to grf register 0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-rk3588-csi-dphy-v1-3-84eb3b2a736c@collabora.com>
References: <20250616-rk3588-csi-dphy-v1-0-84eb3b2a736c@collabora.com>
In-Reply-To: <20250616-rk3588-csi-dphy-v1-0-84eb3b2a736c@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, 
 Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750150493; l=1581;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=aJtpf6aQN4QLph0ogcfZ1mD08/jLTu4SOK+/3Mu671g=;
 b=drrf3+HeksVsYIPQ4fnsIhnaijJd8eMomUwXxWI2N4VbIJ2R95gmKEtFtWU8P6IjdaGMzoQxK
 W/+iCOohunKB6elFsuV74lb0DK+H3IULwG7/AvOkAxwHuw1DZoC7vPN
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com

From: Michael Riesch <michael.riesch@collabora.com>

The driver for the Rockchip MIPI CSI-2 DPHY uses GRF register offset
value 0 to sort out undefined registers. However, the RK3588 CSIDPHY GRF
this offset is perfectly fine (in fact, register 0 is the only one in
this register y
file).
Introduce a boolean variable to indicate valid registers and allow writes
to register 0.

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-inno-csidphy.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
index 2ab99e1d47eb..75533d071025 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
@@ -87,10 +87,11 @@ struct dphy_reg {
 	u32 offset;
 	u32 mask;
 	u32 shift;
+	u8 valid;
 };
 
 #define PHY_REG(_offset, _width, _shift) \
-	{ .offset = _offset, .mask = BIT(_width) - 1, .shift = _shift, }
+	{ .offset = _offset, .mask = BIT(_width) - 1, .shift = _shift, .valid = 1, }
 
 static const struct dphy_reg rk1808_grf_dphy_regs[] = {
 	[GRF_DPHY_CSIPHY_FORCERXMODE] = PHY_REG(RK1808_GRF_PD_VI_CON_OFFSET, 4, 0),
@@ -145,7 +146,7 @@ static inline void write_grf_reg(struct rockchip_inno_csidphy *priv,
 	const struct dphy_drv_data *drv_data = priv->drv_data;
 	const struct dphy_reg *reg = &drv_data->grf_regs[index];
 
-	if (reg->offset)
+	if (reg->valid)
 		regmap_write(priv->grf, reg->offset,
 			     HIWORD_UPDATE(value, reg->mask, reg->shift));
 }

-- 
2.39.5


