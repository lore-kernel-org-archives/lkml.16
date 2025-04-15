Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CD62367A7
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744704770; cv=none; b=RhmJz+L6s1iUBZdMq3lqBTKjf3x/roxIdVpmit+mXaM5DLBb3BATvboBWcGk/s4f8XYr3B1U9lfX1+RubIDSoVDHUvLYsQeDWpvLKxf4pfRxFFv9rq6AqMkWXohZ6ahhFCD/hA1GyasVewvrM4WjcfVPslfEZe/xI3mmChZLL1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744704770; c=relaxed/simple;
	bh=oMQ66CbHQJJBtHLgDZmcsDHGaqtdPcskr+CKZx1O8+s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ft6EK3OydLNxkCtaUFug+ASivZ/FTsnn2YuD2EXjWE6fLwY/U26eDTcFmX8FmaeOEPQyQbTum+vRohczf38NxbcByafjUxGZprxixx3c1Bvjam6b892lXpsstf/vm79ncwaaKtAi2fz2N5ePw+9K0zjsu9tPunG3oaiiBgxiVk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-05 (Coremail) with SMTP id zQCowAAnYgr1FP5nL84SCQ--.28067S2;
	Tue, 15 Apr 2025 16:12:37 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: vkoul@kernel.org,
	kishon@kernel.org,
	heiko@sntech.de
Cc: linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] phy: rockchip: samsung-hdptx: Remove unneeded semicolon
Date: Tue, 15 Apr 2025 16:12:00 +0800
Message-Id: <20250415081200.349939-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAAnYgr1FP5nL84SCQ--.28067S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZFWDuF4rXw4DWw1xKF1UAwb_yoW3AFb_C3
	4xWw47Xw1kJF95Kw1DJ3yxu34qyw1UWw1ruaySvFy5Aa1DXw1Fqa4fZr43Ja4UZrsruFWx
	G34qvFyfCry3tjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbsAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	Jw0_GFylc2xSY4AK67AK6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7VUjWSotUUUUU==
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Remove unnecessary semicolons reported by Coccinelle/coccicheck and the
semantic patch at scripts/coccinelle/misc/semicolon.cocci.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index fc289ed8d915..bb49d69a6f17 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -1507,7 +1507,7 @@ static int rk_hdptx_phy_verify_hdmi_config(struct rk_hdptx_phy *hdptx,
 		break;
 	default:
 		return -EINVAL;
-	};
+	}
 
 	return 0;
 }
-- 
2.25.1

