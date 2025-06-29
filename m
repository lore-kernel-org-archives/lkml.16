Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A886B2576
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 17:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751219882; cv=none; b=GazksXYiNiqAOk+7xb6iLvV2R+5MrlxYAvBrJbkenlVACnrFMzFJtqrxvAYuupP3WntXhzL0K2Z5xSHzb39Y7YqOO5n2eVkJotGTqls1pmVol17iV644lt7E4g2FGajxlHcdjT0seDAmSqhipLS/VwscaTqPazQZlBSyrjWFMQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751219882; c=relaxed/simple;
	bh=8VRY7iIYKKOvXmA4IBdMWrQNmFCY6oynst33IJndO+Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=e5vsWFxMkoqhXX1OqCyWaPAUzGnJqGQ5cnR3ZFcbihTDxRa4PSqNDLPrBk2QHrmEnpqUE4riTgjnb4dt1PfXOUT7FHekPPr/uJyfTF8WLcQfzsZspx2uPXjaklDfywv2EiTYdXD3dcP24+bEnnv4XJhC+5jPevIu8AGVaSRlNYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=huKwrJcG; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="huKwrJcG"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2363616a1a6so7397325ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 10:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751219880; x=1751824680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=juEvSB7UCwmkXNJ/c/ZylWNOoOCKrXw9+aV2K2pHk2k=;
        b=huKwrJcGf97kkBBgd5qCcodOebVLePHfcgOY/9zMDHv4sP8PGUEOYSQ9w9TKOySo00
         rT0aOJaFPqolYPuvWt3SVLDYLMtoFqftu+q8wi8s69iVbMc9dgwNZpk5kBfRascR1m/C
         DZVCs3m2aF7VZDQUF7CKYtmngKCNBlU+jpxmvwIMy90ngOZ/mcEn35vr2ueFUeKvpaDO
         iCvumFQw35GQs/F2BQEKvyVtEjk/chArlMaLa4k2CR1w5yqBGvOwsqVgTiSfr24hgg8k
         CJ+KAFDu4whc1ztr0s9l4sA4vp3NcShXdSA6S1KwlxfSgc1POvkRuQxeqGjdnMKDWQTt
         9pTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751219880; x=1751824680;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=juEvSB7UCwmkXNJ/c/ZylWNOoOCKrXw9+aV2K2pHk2k=;
        b=ZrrHxdMEPmOl5lYXTAafVzwLXg1e2yBJPO+pLP2DwrqRhYbeQsoKPeVMesRMzJ9AAZ
         nKQ2JhHGxWVmlkbTKWv361P6S/vi81qdP+E2sEv2vz6oUrwymm3EMCIsizd3vQoPSP2+
         JvIZVBqHDI7I3X5kcryNlNOF/ZCMNET5j3kIbbdX+Je58m+R15NNtALfaTpmCbnFCYs7
         EscdVHFUIGqAJBR/9xQHtbJkj/aowditf/Wz2dQNYUOZD1H285Oc4QSlGUxHvfd21pma
         h5scpyFsfveHo/xppwGtkn7HQx1hFit92bJohXH7CFT/KkI4kBzaMkJSGP+hBNNVkw9u
         89zQ==
X-Gm-Message-State: AOJu0YyV/BBeAupDx10wFe/BH30RRsj551Ctlie6mNbTA5rPPRWsYbJC
	MLd3rnWfBxy9F/Ko6NxorrJwBMBVFA0E/rYPQLXuOGLJoti2uZcfqHbR
X-Gm-Gg: ASbGncsUfl4cJwKEJE4XUwE0kc2dKSCsfa7+lfe3Ubm8guk5CAafLunLuPaN9ysH9zO
	F3m0WTvZeft8z8FB5ptVcOpLEamd8lKNT3g1qVYReXgcFV4/pDz4N2hCWpmQUbmac42qTtxRSwE
	yxJZ93QdqVLBsgP6Wp+U1lKOo9WdvmI3L0gakd3JCbHKwIEVtQxl6a7rrHwCe+aAK/LZjjWP82Q
	/C/gAG5/oKdekaHjS7JIU+J29iVwLS8ru+oNPtUXK36rakTtTmIo0N3M/WrfM3fCc7gb5jRaaCC
	taHiQhAeVLz2OvwNjqHlyRpVbElRz34W1MKDn5yp9Pjy0PUtHNWwv19S1IYR+8Vj
X-Google-Smtp-Source: AGHT+IFqB1Z5OPJqFWjLXBP2Tl5BXSP+82/IPvRcMKQStT10n5+RvvJ8+Lg4AGx0fZixqvrKevEvLA==
X-Received: by 2002:a17:902:d483:b0:235:880:cf70 with SMTP id d9443c01a7336-23ac43d3001mr159736365ad.14.1751219879723;
        Sun, 29 Jun 2025 10:57:59 -0700 (PDT)
Received: from pop-os.. ([2401:4900:1c96:a08f:8018:9b6a:6fa5:a5e2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3c4b2esm64676085ad.211.2025.06.29.10.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 10:57:59 -0700 (PDT)
From: herculoxz <abhinav.ogl@gmail.com>
To: morbidrsa@gmail.com
Cc: linux-kernel@vger.kernel.org,
	herculoxz <abhinav.ogl@gmail.com>
Subject: [PATCH] Replace the use of scnprintf() with sysfs_emit_at() in several show functions to format the output into the sysfs buffer.
Date: Sun, 29 Jun 2025 23:23:30 +0530
Message-Id: <20250629175330.5834-1-abhinav.ogl@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This change improves clarity and ensures proper bounds checking in
line with the preferred sysfs_emit() API usage for sysfs 'show'
functions. The PAGE_SIZE check is now handled internally by the helper.

No functional change intended.

Signed-off-by: Abhinav Ananthu <abhinav.ogl@gmail.com>
---
 drivers/mcb/mcb-core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mcb/mcb-core.c b/drivers/mcb/mcb-core.c
index 9b8c40a6459a..c1367223e71a 100644
--- a/drivers/mcb/mcb-core.c
+++ b/drivers/mcb/mcb-core.c
@@ -107,7 +107,7 @@ static ssize_t revision_show(struct device *dev, struct device_attribute *attr,
 {
 	struct mcb_bus *bus = to_mcb_bus(dev);
 
-	return scnprintf(buf, PAGE_SIZE, "%d\n", bus->revision);
+	return sysfs_emit(buf, "%d\n", bus->revision);
 }
 static DEVICE_ATTR_RO(revision);
 
@@ -116,7 +116,7 @@ static ssize_t model_show(struct device *dev, struct device_attribute *attr,
 {
 	struct mcb_bus *bus = to_mcb_bus(dev);
 
-	return scnprintf(buf, PAGE_SIZE, "%c\n", bus->model);
+	return sysfs_emit(buf, "%c\n", bus->model);
 }
 static DEVICE_ATTR_RO(model);
 
@@ -125,7 +125,7 @@ static ssize_t minor_show(struct device *dev, struct device_attribute *attr,
 {
 	struct mcb_bus *bus = to_mcb_bus(dev);
 
-	return scnprintf(buf, PAGE_SIZE, "%d\n", bus->minor);
+	return sysfs_emit(buf, "%d\n", bus->minor);
 }
 static DEVICE_ATTR_RO(minor);
 
@@ -134,7 +134,7 @@ static ssize_t name_show(struct device *dev, struct device_attribute *attr,
 {
 	struct mcb_bus *bus = to_mcb_bus(dev);
 
-	return scnprintf(buf, PAGE_SIZE, "%s\n", bus->name);
+	return sysfs_emit(buf, "%s\n", bus->name);
 }
 static DEVICE_ATTR_RO(name);
 
-- 
2.34.1

