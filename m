Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29CD0268FEF
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 12:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747054069; cv=none; b=ueG8i2rIIbIVVmFQeloR0i8EZ6i7tYaJHsgloXmjIA01+4ToLYazQLBkubEsE1MnGyBVsHpQFEPaY5Ap6pSnKbfvo8fOIiXfYyR3GzcDhP+pdC5qYWRT6Ut22+4mBx6Tp7w89b9sJpFB2jQn6rceOtE+lmn23j+nVZ+2xJoFQRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747054069; c=relaxed/simple;
	bh=3m6kRTDNq2S8HTnX+DD72JLmY6w1xe6OW0/zxiDhR4o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QlFPxa9JzfS7NSFCGd3zXG17V3sC6388OEfqcctH4yQ610EEqiYJQmCVtPirVI7upC55gFgm+IWZXED6+eeHw6JL3DrN3oWN6fDbmFjRT9PBMxLQkmH7goRwi6QBBUfa1jwiMetwo7iQ7q47diCs5J3r3iiMsfBR6hUJhrZv6oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=SyabuS8O; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="SyabuS8O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Rk
	lIkmPrOmsT98b/PoJKEZlaxWXv3nBZ0SUzoEELd/Y=; b=SyabuS8OJkdWRTSru6
	CLzuLZvTm+YP3ZkThzxcfpGyu+kKt4UD0vJQoH3fjUSajZrNgZFSzcA50aWc7h1g
	tXT38zqg/nEqkyPtrUDzTifxXlMpWqsbtQHCmHI7pYs1fvECQDc/IloTt1jQRHxM
	H3wFyyFaAnVLVe+MkL7yJv190=
Received: from ProDesk.. (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgC3chWY7SFoQ+_OAQ--.62400S7;
	Mon, 12 May 2025 20:46:27 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: dmitry.baryshkov@oss.qualcomm.com,
	heiko@sntech.de
Cc: jonas@kwiboo.se,
	Laurent.pinchart@ideasonboard.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	hjc@rock-chips.com,
	tzimmermann@suse.de,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v5 05/10] drm/rockchip: inno_hdmi: Move ddc/i2c configuration and HOTPLUG unmute to inno_hdmi_init_hw
Date: Mon, 12 May 2025 20:46:06 +0800
Message-ID: <20250512124615.2848731-6-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250512124615.2848731-1-andyshrk@163.com>
References: <20250512124615.2848731-1-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgC3chWY7SFoQ+_OAQ--.62400S7
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFW3Zw1rJF48KF43Cw45ZFb_yoW8Kr47pr
	ZxCF15tr4fGFy8Xr17ZF1kArZIya4fJ3WYkrWxGw1Syr1UWr9Ykr93AFWfXF98ArWxZ3Z3
	trWkKay5Wa4jvaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07je38nUUUUU=
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0g5LXmgh5MDG2wAAs5

From: Andy Yan <andy.yan@rock-chips.com>

Putting these scattered initialization code together is helpful
for the following migration to the DRM bridge driver mode.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v5:
- Split from PATCH 9/10

 drivers/gpu/drm/rockchip/inno_hdmi.c | 30 ++++++++++++++--------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 2d41cf59752f2..82f2904ed7a3b 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -620,6 +620,21 @@ static void inno_hdmi_init_hw(struct inno_hdmi *hdmi)
 	hdmi_modb(hdmi, HDMI_SYS_CTRL, msk, val);
 
 	inno_hdmi_standby(hdmi);
+
+	/*
+	 * When the controller isn't configured to an accurate
+	 * video timing and there is no reference clock available,
+	 * then the TMDS clock source would be switched to PCLK_HDMI,
+	 * so we need to init the TMDS rate to PCLK rate, and
+	 * reconfigure the DDC clock.
+	 */
+	if (hdmi->refclk)
+		inno_hdmi_i2c_init(hdmi, clk_get_rate(hdmi->refclk));
+	else
+		inno_hdmi_i2c_init(hdmi, clk_get_rate(hdmi->pclk));
+
+	/* Unmute hotplug interrupt */
+	hdmi_modb(hdmi, HDMI_STATUS, m_MASK_INT_HOTPLUG, v_MASK_INT_HOTPLUG(1));
 }
 
 static int inno_hdmi_disable_frame(struct drm_connector *connector,
@@ -1299,27 +1314,12 @@ static int inno_hdmi_bind(struct device *dev, struct device *master,
 		goto err_disable_clk;
 	}
 
-	/*
-	 * When the controller isn't configured to an accurate
-	 * video timing and there is no reference clock available,
-	 * then the TMDS clock source would be switched to PCLK_HDMI,
-	 * so we need to init the TMDS rate to PCLK rate, and
-	 * reconfigure the DDC clock.
-	 */
-	if (hdmi->refclk)
-		inno_hdmi_i2c_init(hdmi, clk_get_rate(hdmi->refclk));
-	else
-		inno_hdmi_i2c_init(hdmi, clk_get_rate(hdmi->pclk));
-
 	ret = inno_hdmi_register(drm, hdmi);
 	if (ret)
 		goto err_put_adapter;
 
 	dev_set_drvdata(dev, hdmi);
 
-	/* Unmute hotplug interrupt */
-	hdmi_modb(hdmi, HDMI_STATUS, m_MASK_INT_HOTPLUG, v_MASK_INT_HOTPLUG(1));
-
 	ret = devm_request_threaded_irq(dev, irq, inno_hdmi_hardirq,
 					inno_hdmi_irq, IRQF_SHARED,
 					dev_name(dev), hdmi);
-- 
2.43.0

