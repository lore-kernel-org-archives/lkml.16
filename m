Received: from mail-m32116.qiye.163.com (mail-m32116.qiye.163.com [220.197.32.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAD3297A6B
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744714057; cv=none; b=RwFAnPtFaClZXjRXM1fhtAouSKeSKVKqnoLaWe9W8jH4xkP0k+FFNtRedS46bZ3OLtB9jupIWATl7wDbnUhXicuorlu3eKhIDj2Bwr0OqIgxbNYYivaIm3MiAsiHvX1I0QwPew2cLwFH3Nhm33PCoUYuogIL30MQObp/qUkfVh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744714057; c=relaxed/simple;
	bh=wGyH8dR879c1Yntymn6lTYF/BXVna5s0dxzC3XD8q6k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=okAIqV8h9KrAyYFXBTW22OOMmuCRlyFjBZvbR6VrVbNQTjlW520rg7o0rrLAxiUkzskZe/UfT6hKrgt6DPpZmXbqJNqWlO4NbTLr2UYwHTcxjhey0DKvTI46eQphwCBhCX2yhx0pgRxyj5UzVFZswoczr1s6Kw3c9n+u7OfmwKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=ZEQsGoQr; arc=none smtp.client-ip=220.197.32.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="ZEQsGoQr"
Received: from localhost.localdomain (unknown [103.29.142.67])
	by smtp.qiye.163.com (Hmail) with ESMTP id 11f2f6013;
	Tue, 15 Apr 2025 18:32:09 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Finley Xiao <finley.xiao@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 2/3] nvmem: rockchip-otp: Add support for rk3568-otp
Date: Tue, 15 Apr 2025 18:32:02 +0800
Message-Id: <20250415103203.82972-3-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250415103203.82972-1-kever.yang@rock-chips.com>
References: <20250415103203.82972-1-kever.yang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaTBpCVh1NTkxNGkxOH0oZQlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKS0hVSUJVSk9JVU1MWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
X-HM-Tid: 0a9639019ccd03afkunm11f2f6013
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MQg6Tjo4FDJITxgxIh8tIh9D
	ED8wFC5VSlVKTE9PTEpISkhLSE5DVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlKS0hVSUJVSk9JVU1MWVdZCAFZQUhCTUM3Bg++
DKIM-Signature:a=rsa-sha256;
	b=ZEQsGoQrNsEKpBCqw4Z0Loc4swUmTJodmrcKn6wQI4dgqGTQNz0k2zf/E6xDi9ZKpMcGmgcXDxTnfpWu7r+mj9bghqnwPJoj1QHMbuxlmZ1BTt29+Lq3lF3TwK+PFobULl2CbK9QUfdNU9/0afu7YW7nQKzf1n9bH5qxuEIsE8A=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=3WtYajYvmFhZ8aAdgWvECPsAEGnYPULDIqp3fCwCsOI=;
	h=date:mime-version:subject:message-id:from;

From: Finley Xiao <finley.xiao@rock-chips.com>

This adds the necessary data for handling otp the rk3568.

Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
---

Changes in v3:
- rebase on rk3576 and rk3528, changes suggest by Jonas

Changes in v2: None

 drivers/nvmem/rockchip-otp.c | 69 ++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/drivers/nvmem/rockchip-otp.c b/drivers/nvmem/rockchip-otp.c
index 45bbb6147fb7..cfb69bc58869 100644
--- a/drivers/nvmem/rockchip-otp.c
+++ b/drivers/nvmem/rockchip-otp.c
@@ -27,6 +27,7 @@
 #define OTPC_USER_CTRL			0x0100
 #define OTPC_USER_ADDR			0x0104
 #define OTPC_USER_ENABLE		0x0108
+#define OTPC_USER_QP			0x0120
 #define OTPC_USER_Q			0x0124
 #define OTPC_INT_STATUS			0x0304
 #define OTPC_SBPI_CMD0_OFFSET		0x1000
@@ -184,6 +185,58 @@ static int px30_otp_read(void *context, unsigned int offset,
 	return ret;
 }
 
+static int rk3568_otp_read(void *context, unsigned int offset, void *val,
+			   size_t count)
+{
+	struct rockchip_otp *otp = context;
+	u16 *buf = val;
+	u32 otp_qp;
+	int ret;
+
+	ret = rockchip_otp_reset(otp);
+	if (ret) {
+		dev_err(otp->dev, "failed to reset otp phy\n");
+		return ret;
+	}
+
+	ret = rockchip_otp_ecc_enable(otp, true);
+	if (ret) {
+		dev_err(otp->dev, "rockchip_otp_ecc_enable err\n");
+		return ret;
+	}
+
+	writel(OTPC_USE_USER | OTPC_USE_USER_MASK, otp->base + OTPC_USER_CTRL);
+	udelay(5);
+
+	while (count--) {
+		writel(offset++ | OTPC_USER_ADDR_MASK,
+		       otp->base + OTPC_USER_ADDR);
+		writel(OTPC_USER_FSM_ENABLE | OTPC_USER_FSM_ENABLE_MASK,
+		       otp->base + OTPC_USER_ENABLE);
+
+		ret = rockchip_otp_wait_status(otp, OTPC_INT_STATUS,
+					       OTPC_USER_DONE);
+		if (ret) {
+			dev_err(otp->dev, "timeout during read setup\n");
+			goto read_end;
+		}
+
+		otp_qp = readl(otp->base + OTPC_USER_QP);
+		if (((otp_qp & 0xc0) == 0xc0) || (otp_qp & 0x20)) {
+			ret = -EIO;
+			dev_err(otp->dev, "ecc check error during read setup\n");
+			goto read_end;
+		}
+
+		*buf++ = readl(otp->base + OTPC_USER_Q);
+	}
+
+read_end:
+	writel(0x0 | OTPC_USE_USER_MASK, otp->base + OTPC_USER_CTRL);
+
+	return ret;
+}
+
 static int rk3588_otp_read(void *context, unsigned int offset,
 			   void *val, size_t count)
 {
@@ -280,6 +333,18 @@ static const struct rockchip_data px30_data = {
 	.reg_read = px30_otp_read,
 };
 
+static const char * const rk3568_otp_clocks[] = {
+	"otp", "apb_pclk", "phy", "sbpi",
+};
+
+static const struct rockchip_data rk3568_data = {
+	.size = 0x80,
+	.word_size = sizeof(u16),
+	.clks = rk3568_otp_clocks,
+	.num_clks = ARRAY_SIZE(rk3568_otp_clocks),
+	.reg_read = rk3568_otp_read,
+};
+
 static const struct rockchip_data rk3576_data = {
 	.size = 0x100,
 	.read_offset = 0x700,
@@ -311,6 +376,10 @@ static const struct of_device_id rockchip_otp_match[] = {
 		.compatible = "rockchip,rk3308-otp",
 		.data = &px30_data,
 	},
+	{
+		.compatible = "rockchip,rk3568-otp",
+		.data = &rk3568_data,
+	},
 	{
 		.compatible = "rockchip,rk3576-otp",
 		.data = &rk3576_data,
-- 
2.25.1

