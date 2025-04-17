Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43362221717;
	Thu, 17 Apr 2025 07:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744876367; cv=none; b=dq2HOv8ZIp48fKaiNmoO4QWOb5u9PbmOLlyktqNR1jyZu3VY84Y9P76DnkXt4HDnxUxxDq5ikVvNkIVYY58/bN1wk+v+KFgA+n2DEldj3wneee00RpiRZBcTNSff9RnyNbAi40zOVzQIPqyMcBHVlvmxnK2ea9IRgxXXxjM4RlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744876367; c=relaxed/simple;
	bh=jSjQf0LL4J7XSdLfjv/tKoEHMcOwtnu91C0FyO/Ek64=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=e85ue0krCRgJRIW8P46wpPjiWOqrTHxdG+g8s5aVQJ1c0V/fw42n0RrbQy7QTHWwFhIGBYWZg1yHi7TpjQq148j7cAQK4HvgCexP2o6xaP2cwbsvDSrRNIyfxKWu/lB8QgaGV7z9ICVD9GMJ6g7qNMMj5lqSmHo8O2Kuzhpr5n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aAyZopxZ; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aAyZopxZ"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22438c356c8so5476325ad.1;
        Thu, 17 Apr 2025 00:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744876365; x=1745481165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4ZssPyP7r1aptpoME6vap7qJnyiEzwndArjYxrVKMoc=;
        b=aAyZopxZrG8hL2TF/J3hC25V45otxZ+FNsWDUAP4GXLavORyE4Pn1WyGRc4AD5qUoR
         oORxDEC5ruW+U527MnxRQj6cOW50/T0/1ZNSW6huosSZw3CQBXIwadGuquvTCLYNb3a3
         4f3WJBX5bs3rymub6CwvxEO7hWcBsFoFvNIPk+uc58jwTYjz9Bv+fNqdW/kpcJYWI/dA
         e7vK700BOnCxRQfkiE+biB4zHBxvpHAdmZ3XL1SJNe2DxmLl/DGcT/HvhGHyPBSkvSR8
         AN1bvdObM9ChU3UnLdaPcTCzGu1RfOf9TOrpCggYhDKJ3ihIrws7TwDSeuAnNlfjKvJ4
         hmPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744876365; x=1745481165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ZssPyP7r1aptpoME6vap7qJnyiEzwndArjYxrVKMoc=;
        b=BRjNWZ36y2c5OZODTjpKppn4+PHFPTrI9cqAgHC8acHzbLMJbWev1vtwJRRsJqyfSt
         qMfnsU48uU1OJ9jlsmZNgKG8+6kg2LkPw4fouBAMU6as6+Sm5wW90UKo3jtnNtmGtosw
         RT60jefIpKd768xvp7AA3soIQeDdalm2SkTwl0xPtT2Y7egSDSBFqmVuJdDvD9XLXS8d
         VuJSv2e8M/S0TEENBP4eL2LNn8Jg3dPsL1FJIpqDNm9WlnC9YEgfIpDTbZYl5nkRwc7G
         zt4qxEet2FV1bz+nwAkSLUg/Oi3bkC6TGyID11ewDWtDE/BUZDbxZ2EjhCpaNzmZxS+v
         rKpw==
X-Forwarded-Encrypted: i=1; AJvYcCVFCO5R6Ga5C70OyGCkWCyKF58tp3M+hlvGzf/GPw72i0PKUaVRJhD974RqiDxkwbnSyjP+8b+b9JAWTqA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtH4SOpK97Gg2a3f6dM6nTQcSd5QCuFRTWME31SKOSaJ/N9cel
	DcMJpzD/KYJ/jk/O/tYaJfkbHJplf4dPAwtAkGGu1rMmyLd4XcOb
X-Gm-Gg: ASbGncuGS7BxMICECvrNqphWGulDuNvxpr+t4WSKR26DaP25VjAEHAqZsG53gbB/q1N
	n5lxn0PDLyOm5IQFtmZE77y8pJzOc35YxTceaPxkfwwHIdlwnzQAqWJL0HNaFbAC/zgTGyLba+I
	CMCHeXX+GBeKxKOq15qC7nwnweVicmUDmRk2jM5n3Z4O7Qao9fqWZ+nnYAawbzPu5BIPnxt3SAI
	Y7lxGlpEbzw65dd2JEeeQQwyreCK8boXHvigOIrIyED/povJ0HDEJlnXZv2gR9a/MgKk+U3yX4S
	+KewwdCehcQ3qS6C3RNWji/bcHPSmlp4549L5A4gEv9/tNpZp0spctB/+ITykW0A1VRzeeM=
X-Google-Smtp-Source: AGHT+IGg7mk2q02EkrNJj2cn6ix4tiECOBp4llx5PS+RF4nP0Vz96bv5xDiqFdl5R1DzMn546mJagQ==
X-Received: by 2002:a17:903:1b6c:b0:227:e6b2:d989 with SMTP id d9443c01a7336-22c35983ce8mr85992745ad.44.1744876365449;
        Thu, 17 Apr 2025 00:52:45 -0700 (PDT)
Received: from purva-IdeaPad-Gaming-3-15IHU6.. ([14.139.108.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33ef11e8sm27230485ad.11.2025.04.17.00.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 00:52:45 -0700 (PDT)
From: Purva Yeshi <purvayeshi550@gmail.com>
To: irenic.rajneesh@gmail.com,
	david.e.box@intel.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Purva Yeshi <purvayeshi550@gmail.com>
Subject: [PATCH] platform/x86: intel_pmc_core: Fix uninitialized pmc/map in pmc_core_send_ltr_ignore
Date: Thu, 17 Apr 2025 13:22:29 +0530
Message-Id: <20250417075229.20540-1-purvayeshi550@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix Smatch-detected issue:

drivers/platform/x86/intel/pmc/core.c:501 pmc_core_send_ltr_ignore()
error: uninitialized symbol 'pmc'.

drivers/platform/x86/intel/pmc/core.c:501 pmc_core_send_ltr_ignore()
error: uninitialized symbol 'map'.

drivers/platform/x86/intel/pmc/core.c:501 pmc_core_send_ltr_ignore()
error: we previously assumed 'pmc' could be null (see line 479)


Prevents uninitialized symbol warnings detected by smatch.

Ensures map is not accessed if pmc is NULL, preventing dereferencing
of uninitialized pointers

Add defensive check for pmc and map to catch any unexpected edge cases
and ensure all required pointers are valid.

Signed-off-by: Purva Yeshi <purvayeshi550@gmail.com>
---
 drivers/platform/x86/intel/pmc/core.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
index 7a1d11f2914f..e674b940e29e 100644
--- a/drivers/platform/x86/intel/pmc/core.c
+++ b/drivers/platform/x86/intel/pmc/core.c
@@ -462,8 +462,8 @@ DEFINE_SHOW_ATTRIBUTE(pmc_core_pll);
 
 int pmc_core_send_ltr_ignore(struct pmc_dev *pmcdev, u32 value, int ignore)
 {
-	struct pmc *pmc;
-	const struct pmc_reg_map *map;
+	struct pmc *pmc = NULL;
+	const struct pmc_reg_map *map = NULL;
 	u32 reg;
 	unsigned int pmc_index;
 	int ltr_index;
@@ -480,6 +480,9 @@ int pmc_core_send_ltr_ignore(struct pmc_dev *pmcdev, u32 value, int ignore)
 			continue;
 
 		map = pmc->map;
+		if (!map)
+			continue;
+
 		if (ltr_index <= map->ltr_ignore_max)
 			break;
 
@@ -491,7 +494,7 @@ int pmc_core_send_ltr_ignore(struct pmc_dev *pmcdev, u32 value, int ignore)
 		ltr_index = ltr_index - (map->ltr_ignore_max + 2) - 1;
 	}
 
-	if (pmc_index >= ARRAY_SIZE(pmcdev->pmcs) || ltr_index < 0)
+	if (pmc_index >= ARRAY_SIZE(pmcdev->pmcs) || ltr_index < 0 || !pmc || !map)
 		return -EINVAL;
 
 	pr_debug("ltr_ignore for pmc%d: ltr_index:%d\n", pmc_index, ltr_index);
-- 
2.34.1

