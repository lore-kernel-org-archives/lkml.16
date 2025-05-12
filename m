Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFCEB29374F
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 12:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747054072; cv=none; b=HP9zwPUkW53ucs4n6KWsmqyFmBHIoAkaUv/DffB9tBWi4UihL+gAxoAxMHVIOLMd71F7rY7ze02BSjm7ToQdfgfSUo9rDvUKRf/AmKwky0NI3hc8f44sZHW94B9NvUyCRdBLjbO0VGnrCFAZDUjz+tFWL4L7gHSSLeH2erkDh2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747054072; c=relaxed/simple;
	bh=hcYfPbFndzTK608drhVdqWy5hbxjEjMmde+Z3vCLOWo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D4f72uKFTNxGcwHFmFjhKnGHZRmrSZ1WNo0i5mJk43JE5E7uHnDPM8NsWNJJXeAiQTjpjygWEvUdzNayGNaTCkhIEM7IcEtC2xrlRdFyUfLhH7Kn7dxx6xs1p7ZsNJbrSoIKBXocquNn7GJx5Z/En3kO0FrvqPnnAixYaJpOPIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=nxkU46cu; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="nxkU46cu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=/f
	llhH49zJ2qqNotPb0/V/XIjS6GRWcrmyUFx3A66GI=; b=nxkU46cuzlAiP651th
	eVdK97/YFrS22d/RhcyKGHWK2FJJTBwK1f6hqgCIBP19sOIE9XFVsgf/1QjCnYOj
	F7jaH8R2AHZIClaUocUdJmrqf8jwaGS5ob1ydcEhP7nS7Jw5ZZ2y4Qr9S8JGtVAG
	9CibCTQBFF3tRjF6Q8w7uHuZk=
Received: from ProDesk.. (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgC3chWY7SFoQ+_OAQ--.62400S8;
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
Subject: [PATCH v5 06/10] drm/rockchip: inno_hdmi: Use sleep_range instead of udelay
Date: Mon, 12 May 2025 20:46:07 +0800
Message-ID: <20250512124615.2848731-7-andyshrk@163.com>
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
X-CM-TRANSID:PigvCgC3chWY7SFoQ+_OAQ--.62400S8
X-Coremail-Antispam: 1Uf129KBjvdXoW7GFW3Zr4DurykCFy7ZFW5Jrb_yoWDWrg_W3
	WxXr18CF4v9rnxJF13A3yfCFyqya4Y9ws3WF4FyasIyF18XFW29rZxZFn8J3sxGF4YkFs7
	Ga1jvrWFyrnIkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU03CztUUUUU==
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqA1LXmgh6hVM3wAAsV

From: Andy Yan <andy.yan@rock-chips.com>

usleep_range is preferred over udelay.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v5:
- Split from PATCH 9/10

 drivers/gpu/drm/rockchip/inno_hdmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 82f2904ed7a3b..f362803060796 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -610,10 +610,10 @@ static void inno_hdmi_init_hw(struct inno_hdmi *hdmi)
 	u32 msk;
 
 	hdmi_modb(hdmi, HDMI_SYS_CTRL, m_RST_DIGITAL, v_NOT_RST_DIGITAL);
-	udelay(100);
+	usleep_range(100, 150);
 
 	hdmi_modb(hdmi, HDMI_SYS_CTRL, m_RST_ANALOG, v_NOT_RST_ANALOG);
-	udelay(100);
+	usleep_range(100, 150);
 
 	msk = m_REG_CLK_INV | m_REG_CLK_SOURCE | m_POWER | m_INT_POL;
 	val = v_REG_CLK_INV | v_REG_CLK_SOURCE_SYS | v_PWR_ON | v_INT_POL_HIGH;
-- 
2.43.0

