Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABD123C8D5
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 14:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745590668; cv=none; b=l12PTApq2lsgqVojj/iMMJsn4ButR/ZjEnTOVwzD2pt+Qugzsod5bA4ClWCpWO2mM4/s9mKpglx3icr5oAlcu0nqtTyJiOoEnyyCSNpTCNjSCEMJ3BnS5jBjSEDJ6vnUqPCNRX5uT8S2WkJK8sKPQjWPNXWU2xrT+2DvDi7Ef/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745590668; c=relaxed/simple;
	bh=BZhn1BsYPMezYI/+h5i91Uy7LJ1qBouu5TAx2ZQwFRw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nmax9vYNWI1zau4K/KSRSaDKsv2HvQyASUiBQ92dRKK48/3fMAsNdlZvlw4WaMPDhiDfm4ffxU0lD5AM43XFqAJ81xFVOIEKN77BWJIjBtpoZkr4hXS/ZfW3wLiPgk1gCUW5MtPqVXw9ULMI2am3n0qlwsSWX5OtnYl8nksDBnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=TvW9Zx7Z; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="TvW9Zx7Z"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=sM7oqKLyYP571Y9Dfl29bOvk2BWbvZHGztoSxElnFJQ=; b=TvW9Zx7ZQg3NSpnY/MFOrJMCU8
	KlDFzbxBFtgU0An/p+X8kBhYYkz5g5Wxx8eD6j9L7SrPNZ62dSFaO4V4kI8tZGbpoMST/e8x27vHA
	Rs2oIAdW392VAf+fzlt6tsF3lMV22ToUN2pYMeGbIN/92i4omavO4GNyJVSwQXm8Pxd7Fc53DDnms
	d2MVU/7M9uBqda7fLTNy1BFZ3srz3WBb3qwHTdj7Al6KelGTg2mc6IE1kYRDAhsdqs+YqOIHW5okf
	KFi1zAQxTtCd+YvwtCgMJ5j9tLQwOaZ1uqkKIt1+SNEQuKkG5nV2FasH8DFC0Z319PZPORHIwU9W6
	tbbGju0A==;
Received: from [77.26.4.178] (helo=edoras.jupiter)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1u8Js0-008MK6-Iq; Fri, 25 Apr 2025 16:17:36 +0200
From: Jose Maria Casanova Crespo <jmcasanova@igalia.com>
To: Melissa Wen <mwen@igalia.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Iago Toral Quiroga <itoral@igalia.com>
Cc: Jose Maria Casanova Crespo <jmcasanova@igalia.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com
Subject: [PATCH v2 2/2] drm/v3d: client ranges from axi_ids are different with V3D 7.1
Date: Fri, 25 Apr 2025 14:25:08 +0200
Message-ID: <20250425122522.18425-2-jmcasanova@igalia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425122522.18425-1-jmcasanova@igalia.com>
References: <20250425122522.18425-1-jmcasanova@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The client mask has been reduced from 8 bits on V3D 4.1 to 7 bits
on V3D 7.1, so the ranges for each client are not compatible.

On V3D 7.1, the CSD client can also report MMU errors.
Therefore, add its AXI ID to the IDs list.

Fixes: 0ad5bc1ce463 ("drm/v3d: fix up register addresses for V3D 7.x")
Signed-off-by: Jose Maria Casanova Crespo <jmcasanova@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_irq.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

Changes in v2:
- Use imperative in commit log. (Maíra Canal)
- Fixed Typos in commit log.

diff --git a/drivers/gpu/drm/v3d/v3d_irq.c b/drivers/gpu/drm/v3d/v3d_irq.c
index d6ce1324905d..2cca5d3a26a2 100644
--- a/drivers/gpu/drm/v3d/v3d_irq.c
+++ b/drivers/gpu/drm/v3d/v3d_irq.c
@@ -199,12 +199,33 @@ v3d_hub_irq(int irq, void *arg)
 			{0xA0, 0xA1, "TFU"},
 			{0xC0, 0xE0, "MMU"},
 			{0xE0, 0xE1, "GMP"},
+		}, v3d71_axi_ids[] = {
+			{0x00, 0x30, "L2T"},
+			{0x30, 0x38, "CLE"},
+			{0x38, 0x39, "PTB"},
+			{0x39, 0x3A, "PSE"},
+			{0x3A, 0x3B, "CSD"},
+			{0x40, 0x60, "TLB"},
+			{0x60, 0x70, "MMU"},
+			{0x7C, 0x7E, "TFU"},
+			{0x7F, 0x80, "GMP"},
 		};
 		const char *client = "?";
 
 		V3D_WRITE(V3D_MMU_CTL, V3D_READ(V3D_MMU_CTL));
 
-		if (v3d->ver >= V3D_GEN_41) {
+		if (v3d->ver >= V3D_GEN_71) {
+			size_t i;
+
+			axi_id = axi_id & 0x7F;
+			for (i = 0; i < ARRAY_SIZE(v3d71_axi_ids); i++) {
+				if (axi_id >= v3d71_axi_ids[i].begin &&
+				    axi_id < v3d71_axi_ids[i].end) {
+					client = v3d71_axi_ids[i].client;
+					break;
+				}
+			}
+		} else if (v3d->ver >= V3D_GEN_41) {
 			size_t i;
 
 			axi_id = axi_id & 0xFF;
-- 
2.49.0

