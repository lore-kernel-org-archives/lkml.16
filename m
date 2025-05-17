Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD2786340
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 03:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747451180; cv=none; b=mk+sML/FJN6iz0Mebxo+IU2jJZkk21BZttwCeTqvQqOqMUlZPz/K75zmO0/NPNHP/ajnHgsS15Gqfay87ZTCBJoW4aZpPDiuU06kbVg7mTUUUUuKPzX+gxmXFMwFobKmMImXY2DeC7oX5NDgwbjtJ8umbZj/8uTOdz0RWkVLoKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747451180; c=relaxed/simple;
	bh=zv+Z+CObrsv4IbS6imh34PEuvxtDkiDj8Pr8uiF06Bc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jogJ9plGl4rtX97gTr5cOAsbW3ZdrzCxSPp0tEmUeZzguFCMnd7UDTJsnhnWJJ7r9TfHF1AryIm36j6gliRTL9Q8BA8XHhzyZ0DNv9LzcXjNqQx3KVIegueDXQUM2VwBrz//qTzegRGJAevnzohhdfL43Uy50lDIxnsr6B8oq1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F+UuBIjp; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F+UuBIjp"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4769b16d4fbso17078291cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 20:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747451177; x=1748055977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZZGXEhveDuCitdT22/K4UxFR+ROBomEnJNWF8hsYQo8=;
        b=F+UuBIjp1K9iNiTh50e2DlnFHbfdAHUO/uDnMLku+0OG2fcZlMxajldRGux2ZBuyBP
         BEBCtKca7ad6xefqaq82iOoPId9MU3XHZO2FPfVY5JPiK3+pXFgGW00uVOxV7cnBHqdS
         cDiFf45DaibaUE+HEZugTiYKsYGW6fHyOa/e8INWEHLY2W3WbKb+9AS1uPrGBGNAOp+0
         pSWc5JD2MRpRdopKfD989L1vQ7wktKsGtlbvSbgTsozxLWlTM9LmjJEDpCC970G6Uy/A
         nmxKLKNvfbJXqlvs1T+FQgZqvQbThuGsKMze96l7PkoYcmO1WuSnBSVWg9SG2/9HZogk
         yGzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747451177; x=1748055977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZZGXEhveDuCitdT22/K4UxFR+ROBomEnJNWF8hsYQo8=;
        b=lqPdHFOeMDF6Z5JCQj3Sx5ATbUHuIYGrXcUK3Gp/VWBcTC7h7heo/BMMPRBkahXQ9K
         RNUCrYc0HWsHdKsmY9IAC+F/2IE5aYKgVVqrM8ZFOXxkATVCqLyaXTNxwTNHPdwuib3M
         wC2tS2ItGqDbW5d68+P09M8X8gtW6Ysbs41KQTQ22Q9bFGFWFWgpxvBP3CJGgPmAdGqw
         TcdCiQj69mzXLTDqHaiY9CN2jx4knAaOXzHxMDG2857tHJLl3DUI4ztapi82rolP1l5j
         TXS2t8DVISKtKVfkB+kW95LZpBKk4b4bzhATAUMjJdkuCSP+1bTogPz/+u7yxmEFlIOY
         BrHg==
X-Forwarded-Encrypted: i=1; AJvYcCX5U1nA8g2eDzOLa0Iy0c5CX/WqmGtyytNBRvxgzOLiZHFtQ13IdoVxX0GNvR7UIzad+stZ/xpNL/bBj3A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSL/z4HIWAJc1IR1gzOavNineoPGlnNSu6mcRDc0e0M+kYGUrX
	0kt1n7MV7lLDMXhXmk3BAMU9Lou3lYFzG1M1k0mSXzVDckTg0hqIf2I=
X-Gm-Gg: ASbGncsyg2wwv8C55pQGP5gAXng6tEAezQU1W/I1HvEynb7isjpXQ4d+gDHtCTSAn2+
	5eoHK+hHTG9GuMBXMKifJg8fhYINq0LlkZteJtEBJX9mk3W0YOogsW8hm9/5g8ZEMtMjx7hG0vm
	x3gamg7i9vMIieilzz8XL5rIwQ7xOO6SJzWmya5A8sudSPbxma1m5s4B6cdF3nEEquT969jQFnn
	LZO6ZSOgoWpYIrgPEyY7BokAK/U0d7556viRwVj2OAhb7lnoR6lUHtvq5Q6sXRSjyHRTFpcuRyV
	ivlHt1oNHZOHZ+qVLAtZLZAeC+OUbwq2fw5ykflxxWrQG67hDLQyd1OPuAs+lKoNoxO0cwp87Dc
	w
X-Google-Smtp-Source: AGHT+IGC2KqqWdKSLgraq4ZAjWt6t+IYKKHBmiJqJ15wcpjY1936g/G59NR3qvc/8AmiYG0AaW0wow==
X-Received: by 2002:a05:622a:2447:b0:48b:512a:a919 with SMTP id d75a77b69052e-494ae3500acmr97122961cf.3.1747451176587;
        Fri, 16 May 2025 20:06:16 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:e487:156f:5546:ce07:3a5c:a2f1:3741])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494ae3cd517sm19165721cf.10.2025.05.16.20.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 20:06:16 -0700 (PDT)
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
To: harry.wentland@amd.com,
	sunpeng.li@amd.com,
	siqueira@igalia.com
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	jihed.chaibi.dev@gmail.com
Subject: [PATCH 1/2] fixing typo in macro name
Date: Sat, 17 May 2025 05:06:09 +0200
Message-Id: <20250517030609.818725-1-jihed.chaibi.dev@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"ENABLE" is currently misspelled in SYS_INFO_GPUCAPS__ENABEL_DFS_BYPASS

PS: checkpatch.pl is complaining about the presence of a space at the
start of drivers/gpu/drm/amd/include/atomfirmware.h line: 1716 
This is propably because this file uses (two) spaces and not tabs.

Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
---
 drivers/gpu/drm/amd/display/include/grph_object_ctrl_defs.h | 2 +-
 drivers/gpu/drm/amd/include/atombios.h                      | 4 ++--
 drivers/gpu/drm/amd/include/atomfirmware.h                  | 2 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c                  | 2 +-
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c         | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/include/grph_object_ctrl_defs.h b/drivers/gpu/drm/amd/display/include/grph_object_ctrl_defs.h
index 813463ffe..cc4670316 100644
--- a/drivers/gpu/drm/amd/display/include/grph_object_ctrl_defs.h
+++ b/drivers/gpu/drm/amd/display/include/grph_object_ctrl_defs.h
@@ -424,7 +424,7 @@ struct integrated_info {
 /*
  * DFS-bypass flag
  */
-/* Copy of SYS_INFO_GPUCAPS__ENABEL_DFS_BYPASS from atombios.h */
+/* Copy of SYS_INFO_GPUCAPS__ENABLE_DFS_BYPASS from atombios.h */
 enum {
 	DFS_BYPASS_ENABLE = 0x10
 };
diff --git a/drivers/gpu/drm/amd/include/atombios.h b/drivers/gpu/drm/amd/include/atombios.h
index b78360a71..a99923b4e 100644
--- a/drivers/gpu/drm/amd/include/atombios.h
+++ b/drivers/gpu/drm/amd/include/atombios.h
@@ -6017,7 +6017,7 @@ typedef struct _ATOM_INTEGRATED_SYSTEM_INFO_V1_7
 #define SYS_INFO_GPUCAPS__TMDSHDMI_COHERENT_SINGLEPLL_MODE                0x01
 #define SYS_INFO_GPUCAPS__DP_SINGLEPLL_MODE                               0x02
 #define SYS_INFO_GPUCAPS__DISABLE_AUX_MODE_DETECT                         0x08
-#define SYS_INFO_GPUCAPS__ENABEL_DFS_BYPASS                               0x10
+#define SYS_INFO_GPUCAPS__ENABLE_DFS_BYPASS                               0x10
 //ulGPUCapInfo[16]=1 indicate SMC firmware is able to support GNB fast resume function, so that driver can call SMC to program most of GNB register during resuming, from ML
 #define SYS_INFO_GPUCAPS__GNB_FAST_RESUME_CAPABLE                         0x00010000
 
@@ -6460,7 +6460,7 @@ typedef struct _ATOM_INTEGRATED_SYSTEM_INFO_V1_9
 
 // ulGPUCapInfo
 #define SYS_INFO_V1_9_GPUCAPSINFO_DISABLE_AUX_MODE_DETECT                         0x08
-#define SYS_INFO_V1_9_GPUCAPSINFO_ENABEL_DFS_BYPASS                               0x10
+#define SYS_INFO_V1_9_GPUCAPSINFO_ENABLE_DFS_BYPASS                               0x10
 //ulGPUCapInfo[16]=1 indicate SMC firmware is able to support GNB fast resume function, so that driver can call SMC to program most of GNB register during resuming, from ML
 #define SYS_INFO_V1_9_GPUCAPSINFO_GNB_FAST_RESUME_CAPABLE                         0x00010000
 //ulGPUCapInfo[18]=1 indicate the IOMMU is not available
diff --git a/drivers/gpu/drm/amd/include/atomfirmware.h b/drivers/gpu/drm/amd/include/atomfirmware.h
index 0160d65f3..52eb3a474 100644
--- a/drivers/gpu/drm/amd/include/atomfirmware.h
+++ b/drivers/gpu/drm/amd/include/atomfirmware.h
@@ -1713,7 +1713,7 @@ enum atom_system_vbiosmisc_def{
 
 // gpucapinfo
 enum atom_system_gpucapinf_def{
-  SYS_INFO_GPUCAPS__ENABEL_DFS_BYPASS  = 0x10,
+  SYS_INFO_GPUCAPS__ENABLE_DFS_BYPASS  = 0x10,
 };
 
 //dpphy_override
diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c b/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
index 59fae668d..34e71727b 100644
--- a/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
+++ b/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
@@ -2594,7 +2594,7 @@ static int kv_parse_sys_info_table(struct amdgpu_device *adev)
 				le32_to_cpu(igp_info->info_8.ulNbpStateNClkFreq[i]);
 		}
 		if (le32_to_cpu(igp_info->info_8.ulGPUCapInfo) &
-		    SYS_INFO_GPUCAPS__ENABEL_DFS_BYPASS)
+		    SYS_INFO_GPUCAPS__ENABLE_DFS_BYPASS)
 			pi->caps_enable_dfs_bypass = true;
 
 		sumo_construct_sclk_voltage_mapping_table(adev,
diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c
index 9d3b33446..9b20076e2 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c
@@ -394,7 +394,7 @@ static int smu8_get_system_info_data(struct pp_hwmgr *hwmgr)
 	}
 
 	if (le32_to_cpu(info->ulGPUCapInfo) &
-		SYS_INFO_GPUCAPS__ENABEL_DFS_BYPASS) {
+		SYS_INFO_GPUCAPS__ENABLE_DFS_BYPASS) {
 		phm_cap_set(hwmgr->platform_descriptor.platformCaps,
 				    PHM_PlatformCaps_EnableDFSBypass);
 	}
-- 
2.39.5

