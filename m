Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167442036E8
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 01:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744682164; cv=none; b=of5vELNF8b9BHraX945r/PQhwVz8DY3iw0Z78NtmTufHHDvJXpkDX9SJEOQdodN6ymGCEwUrx2hIghfO1BTmoBgsK8zM/c17I5QxoBmCRJgWL7sRLxTCAg6alcGf+lRaadOsr1OmDEL413Ye84iE48nr0+rRZa2l0BK4pYFephw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744682164; c=relaxed/simple;
	bh=yMMexKHaP35ncA/UtPAuHzx232WGQY6JiFigxlioZqc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZEPNtLue+DM+BRE0BQVKHDs67xLqMke0sq9eoS1p05+ZpWEByeTrFVJSDp5TYbhpFgMbetkevToFIGqLY+h9KSdvE/mUyyDH9rL1FyzxJ+L96Jcd0S54SJdctNmIBdQw7mnsZwREaKEZPclugzEt2wbkGUc6EjVGZJ1YJYsVcCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-01 (Coremail) with SMTP id qwCowAAXvf2ivP1nhmvrCA--.42931S2;
	Tue, 15 Apr 2025 09:55:47 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: suijingfeng@loongson.cn,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] drm/loongson: Fix return value check for kzalloc
Date: Tue, 15 Apr 2025 09:54:14 +0800
Message-Id: <20250415015414.4150082-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAAXvf2ivP1nhmvrCA--.42931S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Gw4kZF45XrWkuFykKr17ZFb_yoWxurg_Ca
	yavrs3WFyDJFnrZw17Cw4jyFyavFyruan3Za17t3saq347Xr18Za43ur15Xa43urW7XF90
	ya18uryfZrs7KjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb4xFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJV
	WxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
	JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUd-B_UUU
	UU=
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

kzalloc doesn't return ERR_PTR, delete unneeded IS_ERR test.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/gpu/drm/loongson/lsdc_gfxpll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/loongson/lsdc_gfxpll.c b/drivers/gpu/drm/loongson/lsdc_gfxpll.c
index 249c09d703ad..50b9f45db5b0 100644
--- a/drivers/gpu/drm/loongson/lsdc_gfxpll.c
+++ b/drivers/gpu/drm/loongson/lsdc_gfxpll.c
@@ -179,7 +179,7 @@ int loongson_gfxpll_create(struct drm_device *ddev,
 	int ret;
 
 	this = kzalloc(sizeof(*this), GFP_KERNEL);
-	if (IS_ERR_OR_NULL(this))
+	if (!this)
 		return -ENOMEM;
 
 	this->ddev = ddev;
-- 
2.25.1

