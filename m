Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B53C2AE68
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 12:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747054069; cv=none; b=f+vLKy/QnlDQ9RxoWZy6h9iw+ev1Tu9lAyYJldV7KlzG16V67VoLdVr8L4k1MS2/kjDJipEi2/X/xCZYulKSK/aQHlGsG66r7JvbuTWCYp/4xv0mSeuDGMA8Ahs9ofVruqMtWk9iGUFPvUtBSlEXb3vmmEbSPop/ylRI8eMCsP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747054069; c=relaxed/simple;
	bh=uXsu7jH8yVXs4V58qXRyevJOKQZzPHtuB5q75Rk/5aI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LWQ3l1l1/30qhLs5NGgB+5Hw+siYjvf6MWaQ0G6bgw4tXI6UpKPx1kLwNY0MtZ/E/WNjWn4zYfL8059vyMIvouQYrhwv/YhpckMFypgI9Sh0j+417H6Pc5AAl+VbIy2ABjYZganDjtMb3escsGDe2lkKTGmwgMeQETG6hdKEVnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=cGbEwpQ3; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="cGbEwpQ3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=4a
	n3GeKBTudslqJaw/NeBqgOS4NHJwbOQHtDOLQOmp4=; b=cGbEwpQ3urxmguwLZG
	6WqUJ55fUpI4A8g3EOK5ethJ0EKKEzDGOTCHu2yfhS7oAsGJNG+M0k8Klurf5KMs
	ySImhowU+BYn9uCUl7DmhM9dPPTYjJSL/Mq4RGk/kky3d+U+a167QtLHeHeZYMav
	GcZ4J1CR9/DON/oUFHBGpwpj0=
Received: from ProDesk.. (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgC3chWY7SFoQ+_OAQ--.62400S5;
	Mon, 12 May 2025 20:46:25 +0800 (CST)
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
Subject: [PATCH v5 03/10] drm/rockchip: inno_hdmi: Remove unnecessary parentheses to make checkpatch happy
Date: Mon, 12 May 2025 20:46:04 +0800
Message-ID: <20250512124615.2848731-4-andyshrk@163.com>
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
X-CM-TRANSID:PigvCgC3chWY7SFoQ+_OAQ--.62400S5
X-Coremail-Antispam: 1Uf129KBjvdXoWruw4UZF45Jry3ZFWkury3Jwb_yoWDXFX_KF
	18Wr1rCF48Zrn8A3ZIk3y5ZF9FvayI9F4fuFs5t393JFn7JryxJ3sxCrW3AF9xWF1YyFn5
	Ca1qvr1UAFnIkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUeb4S7UUUUU==
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0gNLXmgh5MDGsgAAsd

From: Andy Yan <andy.yan@rock-chips.com>

Remove unnecessary parentheses to make checkpatch happy.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v5:
- Split from PATCH 9/10

 drivers/gpu/drm/rockchip/inno_hdmi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 82c62400b2e1e..7b4c952f26922 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -1124,8 +1124,7 @@ static int inno_hdmi_i2c_write(struct inno_hdmi *hdmi, struct i2c_msg *msgs)
 	 * we assume that each word write to this i2c adapter
 	 * should be the offset of EDID word address.
 	 */
-	if ((msgs->len != 1) ||
-	    ((msgs->addr != DDC_ADDR) && (msgs->addr != DDC_SEGMENT_ADDR)))
+	if (msgs->len != 1 || (msgs->addr != DDC_ADDR && msgs->addr != DDC_SEGMENT_ADDR))
 		return -EINVAL;
 
 	reinit_completion(&hdmi->i2c->cmp);
-- 
2.43.0

