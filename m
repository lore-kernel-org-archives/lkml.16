Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33CC433AD
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 15:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744214229; cv=none; b=rDhYkrtX5c6cE9xBCF+AMMC6KLoSlWyt11nr48M83GM8jRlMBD9XxqNFOukPlrFGQydUgFYddBoaarQJNWB8t7M/7+cKmy26bjZO3Eo75qSv4ytJALWCDrjtcLB6UqGcL3+OHhjywUHKCcRDLfkP4BU2PGMIdCIjW08NKCwu2NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744214229; c=relaxed/simple;
	bh=vZ4UtV0YCp/8BPlelI83srF2nhfkBguAM6K/Nwbd3mo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bBJSFud1I6uduttWWuZVPYLHAKmEziPWpBilDHdjjXJovS37S8s0ANQ4RO8rCuGDuRv2gJLDqqCC9dImVnuqQRyXcFJYAlG2fidlFJN4yr5DzV41zG2WrJenFHjGGCm6VkKZI7EQiGenEmq7pKjVTX3kMGJhssM0O8GkOORyeOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=hesGYYwS; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="hesGYYwS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=yQbxOoSLTwxzL4wS/MBYOfE+a3MJPq00D/vrLwQ1d0U=; b=hesGYYwS5F3GcAqA8A5Dwd96If
	ho2h/ZHeScwGuPj/FxvbV1XCnchR/uN6Int5rk6tTEVuzhoLXoPhGnNj1CNt2/W2H1Ewvcct4bM7f
	wlSBjENpWPE9KXMTID7vO2c96ZVIFh6bIS5v7wUCo/YPCZykfeBnI+/I0KE9PIUWYI7KfVIA472q1
	bWCMxJUz+/asmu697KrTJPDGfHY0g16uAKMoh5XaZnyS9bwInZBjDo+Ca94VM+LKia6romo6VfYWq
	VM2PdtpQ2EeL5DlUJ3VnXxg87X6bhe/zfH9SN/5/YkQ/9WuuUjVITlCWEqkFRLWQF98XJlA3dQmA2
	BKNxhe8g==;
Received: from [77.26.4.178] (helo=edoras.jupiter)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1u2XnG-00ECwp-RJ; Wed, 09 Apr 2025 17:56:50 +0200
From: Jose Maria Casanova Crespo <jmcasanova@igalia.com>
To: Melissa Wen <mwen@igalia.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Emma Anholt <emma@anholt.net>
Cc: Jose Maria Casanova Crespo <jmcasanova@igalia.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] drm/v3d: fix client obtained from axi_ids on V3D 4.1
Date: Wed,  9 Apr 2025 17:55:03 +0200
Message-ID: <20250409155504.1093400-2-jmcasanova@igalia.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The client that causes an MMU error is expected to be reported.
But in the case of MMU TFU errors, a non existing client
was being reported. This happened because  because the client
calculation was taking into account more than the bits 0-7
from the axi_id that were representing the client.

This patch masks the proper bits to do the calculation and
limits the returned clients to the expected axi_id ranges that
V3D 4.1 and 4.2 use.

Fixes: 38c2c7917adc ("drm/v3d: Fix and extend MMU error handling.")
Signed-off-by: Jose Maria Casanova Crespo <jmcasanova@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_irq.c | 33 +++++++++++++++++++++------------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_irq.c b/drivers/gpu/drm/v3d/v3d_irq.c
index 29f63f572d35..1810743ea7b8 100644
--- a/drivers/gpu/drm/v3d/v3d_irq.c
+++ b/drivers/gpu/drm/v3d/v3d_irq.c
@@ -186,24 +186,33 @@ v3d_hub_irq(int irq, void *arg)
 		u32 axi_id = V3D_READ(V3D_MMU_VIO_ID);
 		u64 vio_addr = ((u64)V3D_READ(V3D_MMU_VIO_ADDR) <<
 				(v3d->va_width - 32));
-		static const char *const v3d41_axi_ids[] = {
-			"L2T",
-			"PTB",
-			"PSE",
-			"TLB",
-			"CLE",
-			"TFU",
-			"MMU",
-			"GMP",
+		static const struct {
+			u32 begin;
+			u32 end;
+			const char *client;
+		} v3d41_axi_ids[] = {
+			{0x00, 0x20, "L2T"},
+			{0x20, 0x21, "PTB"},
+			{0x40, 0x41, "PSE"},
+			{0x60, 0x80, "TLB"},
+			{0x80, 0x88, "CLE"},
+			{0xA0, 0xA1, "TFU"},
+			{0xC0, 0xE0, "MMU"},
+			{0xE0, 0xE1, "GMP"},
 		};
 		const char *client = "?";
 
 		V3D_WRITE(V3D_MMU_CTL, V3D_READ(V3D_MMU_CTL));
 
 		if (v3d->ver >= V3D_GEN_41) {
-			axi_id = axi_id >> 5;
-			if (axi_id < ARRAY_SIZE(v3d41_axi_ids))
-				client = v3d41_axi_ids[axi_id];
+			axi_id = axi_id & 0xFF;
+			for (size_t i = 0; i < ARRAY_SIZE(v3d41_axi_ids); i++) {
+				if (axi_id >= v3d41_axi_ids[i].begin &&
+				    axi_id < v3d41_axi_ids[i].end) {
+					client = v3d41_axi_ids[i].client;
+					break;
+				}
+			}
 		}
 
 		dev_err(v3d->drm.dev, "MMU error from client %s (%d) at 0x%llx%s%s%s\n",
-- 
2.49.0

