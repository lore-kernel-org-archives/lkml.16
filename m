Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C169239570;
	Wed,  2 Apr 2025 12:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743597166; cv=none; b=Iy+S4v3Rqn4M9rMewLUTjRaSZlK8bCN3nuPlVCWYf1X3ct6O7MMPsp+CvGl6lHidX6Lh9S3q8tPEqynnlcML2ByaJHyuq+nE0oDaakfx0/mAY/cLtKqBr+CgHvIiSOPS/cialyefgmaQ7+0nTyhEu61ZscNcj0GOFQiE1yw/mIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743597166; c=relaxed/simple;
	bh=tOZz0L3GVjXW2ZtzMwyl/yYNyYzyFJ+GZZpA5ROpJRY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=elF9FxipESejZbz3hQ4g7YEZ+cyTdLNcMOPGjRWqoTiin0HBtDMferZqwZyt+oXmLjenFAN0QPW/DGAsqC6md8ashBMkIKDxD8cw6jPuT3tfA5ex0TMxPF+NfzqX1ac2F/6bcxsJmsRmRkqK7Dz4AacDS8ET2aq3M/k8xtw1fO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=MGTwIXCl; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="MGTwIXCl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=SAmBQ
	fQ4gtVQYYiOf9e8DZppYPFI9MirWXA6gFfsoeE=; b=MGTwIXCl6X63pnKuYAA0r
	pXDerXH7TBHXky8AaQZOE3YVkWYj7hrNbRQl9F7ffYA9A2/7BYHcTXEJO5429OB0
	Qh4s+pyuAJfJwbsjBzFf3HG8m3GbJnnTghIrD6UkgaYt4MMUppHNtk5lmuoWmCc8
	PBzyuDtQF8fIlHIv6oVfgM=
Received: from ProDesk.. (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgDnd405Lu1nJwOJBA--.36321S5;
	Wed, 02 Apr 2025 20:32:00 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	hjc@rock-chips.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	dmitry.baryshkov@oss.qualcomm.com,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v3 3/7] drm/rockchip: inno-hdmi: Simplify error handler with dev_err_probe
Date: Wed,  2 Apr 2025 20:31:37 +0800
Message-ID: <20250402123150.238234-4-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250402123150.238234-1-andyshrk@163.com>
References: <20250402123150.238234-1-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgDnd405Lu1nJwOJBA--.36321S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7uryfXr4fuF1fJr4Utr1xuFg_yoW8Aw1Dpr
	ZxJFyjvFy8JF18W347ua15Ar1Sya1Uta18CrZrGwn5Zw17Zrs8try3ZFWFqrWFyF95Zw4a
	y393Xa4UZ3W7WaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jJkuxUUUUU=
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0gMjXmftK+o5ZwAAs5

From: Andy Yan <andy.yan@rock-chips.com>

Use dev_err_probe simplify the error handle.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

(no changes since v2)

Changes in v2:
- First included in this series

 drivers/gpu/drm/rockchip/inno_hdmi.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 483ecfeaebb08..e891d42dd08a4 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -885,29 +885,22 @@ static int inno_hdmi_bind(struct device *dev, struct device *master,
 		return PTR_ERR(hdmi->regs);
 
 	hdmi->pclk = devm_clk_get(hdmi->dev, "pclk");
-	if (IS_ERR(hdmi->pclk)) {
-		DRM_DEV_ERROR(hdmi->dev, "Unable to get HDMI pclk clk\n");
-		return PTR_ERR(hdmi->pclk);
-	}
+	if (IS_ERR(hdmi->pclk))
+		return dev_err_probe(dev, PTR_ERR(hdmi->pclk), "Unable to get HDMI pclk\n");
 
 	ret = clk_prepare_enable(hdmi->pclk);
-	if (ret) {
-		DRM_DEV_ERROR(hdmi->dev,
-			      "Cannot enable HDMI pclk clock: %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Cannot enable HDMI pclk: %d\n", ret);
 
 	hdmi->refclk = devm_clk_get_optional(hdmi->dev, "ref");
 	if (IS_ERR(hdmi->refclk)) {
-		DRM_DEV_ERROR(hdmi->dev, "Unable to get HDMI reference clock\n");
-		ret = PTR_ERR(hdmi->refclk);
+		ret = dev_err_probe(dev, PTR_ERR(hdmi->refclk), "Unable to get HDMI refclk\n");
 		goto err_disable_pclk;
 	}
 
 	ret = clk_prepare_enable(hdmi->refclk);
 	if (ret) {
-		DRM_DEV_ERROR(hdmi->dev,
-			      "Cannot enable HDMI reference clock: %d\n", ret);
+		ret = dev_err_probe(dev, ret, "Cannot enable HDMI refclk: %d\n", ret);
 		goto err_disable_pclk;
 	}
 
-- 
2.43.0

