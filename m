Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C67C29375A
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 12:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747054071; cv=none; b=qWQK+GW8xSxLbq3sGwct5Km4/A+7Opzu0jz3pHuwKDYzjWdlPWtF2fS9+Y08JaTHV8NX3zYZ76gV2UJllvK8p6AD/yVU6ALazS5tJ7AGuZel1+D9UKGxY8VtaR6oCZHje5tyVXg/N14gXWMKD1/fKfh/0C8qH9A6f5WI7Y4zGrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747054071; c=relaxed/simple;
	bh=FXEAMgy/QZ/2vaFLHRVnXdf18i6dKFzOQcxhXQAi/2A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k3j/wEtX41K9uvAjSk/t3GXb1s9gF6vyG/YE4Y0Lq239mmHmxFwz5fvCcHHbencnbVDmBcAn09d/J7Cqn+aji1rYQdIY8Oe89zx7LT/1Yz5W+RC5XtbwiO6cJPmJz9220GBWwGU0qhYkSPomo5R3i1nytsPYjUVtnAKEBC6xABQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=S9h0zUC7; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="S9h0zUC7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=jv
	nMc/BqFyXtWd3kydBRw6WznkhMsheiUWEV9yI10UU=; b=S9h0zUC7pYvZzdrV/b
	ZLDqwd7iXMmoe+IioQ+LrDFvB6q1Ez42dFbON5cLhQYqMfQsxlyS++Q6h3uXAVOx
	cWeJwLXQHCSaSVY+9tmPRCu2/Ek6lzzCCTVc0sEKpdzCgEOat5//GPEIvQzrjJGk
	BF9AmsrNAZv5T6OG7wjbKnd6A=
Received: from ProDesk.. (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgC3chWY7SFoQ+_OAQ--.62400S6;
	Mon, 12 May 2025 20:46:26 +0800 (CST)
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
Subject: [PATCH v5 04/10] drm/rockchip: inno_hdmi: Rename function inno_hdmi_reset to inno_hdmi_init_hw
Date: Mon, 12 May 2025 20:46:05 +0800
Message-ID: <20250512124615.2848731-5-andyshrk@163.com>
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
X-CM-TRANSID:PigvCgC3chWY7SFoQ+_OAQ--.62400S6
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cw1xGF17Ww1fAry7CF45KFg_yoW8JF43pa
	yUCryUCF4fGa1jqF1UAF4kCr4ayas7KayxurWxWw1Skwn09r9YyFnYyw4Sva43AryxZ3Z2
	yFs7Ga45ZFy2yw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j8zV8UUUUU=
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqAFLXmgh6hVMrAAAsq

From: Andy Yan <andy.yan@rock-chips.com>

This function not only configure hardware reset register, but also
do some other configurations. Therefore, it is more appropriate to
name it inno_hdmi_init_hw, which will also facilitate the addition
of other functions to this function in the following patch.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v5:
- Split from PATCH 9/10

 drivers/gpu/drm/rockchip/inno_hdmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 7b4c952f26922..2d41cf59752f2 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -604,7 +604,7 @@ static void inno_hdmi_power_up(struct inno_hdmi *hdmi,
 	inno_hdmi_sys_power(hdmi, true);
 };
 
-static void inno_hdmi_reset(struct inno_hdmi *hdmi)
+static void inno_hdmi_init_hw(struct inno_hdmi *hdmi)
 {
 	u32 val;
 	u32 msk;
@@ -1290,7 +1290,7 @@ static int inno_hdmi_bind(struct device *dev, struct device *master,
 		goto err_disable_clk;
 	}
 
-	inno_hdmi_reset(hdmi);
+	inno_hdmi_init_hw(hdmi);
 
 	hdmi->ddc = inno_hdmi_i2c_adapter(hdmi);
 	if (IS_ERR(hdmi->ddc)) {
-- 
2.43.0

