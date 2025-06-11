Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B919A1A725A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 16:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749658448; cv=none; b=b2/HSHfRMPt5ZaL46Qo92Nd1UKByWojgLuYpOcA5h5HURWZkFviFCxOAzJBmJTN+l8LmsZIZ1zcYj8s1Q9TOAz+8APdgSEeWVByYvK6l7pCtRAbcOOuVBxET2jG1UNMpt5TObUpKgE1q6elZ6E0/0DkK+kYQAv9truQ6Wi7IjXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749658448; c=relaxed/simple;
	bh=EBSr7VcZwrJX9WQADv767eRuRO+Fqfa161/jwkrav7U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QQ+lGpWtPG8s7O+lhKQT/rjw9nU4dcZhdxsnEqzKUMjN7J4mkNUG2RA6MyzUb+m9kI5zp6t/whHGFzdYis1ogcgjLj8ca0tOyBppJiElO2A/QD2fy8Lail57dOTHQRLt/z269h+0z9anSSQisZ2X9og3XyB1CVCW8MRw718Hp50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MNWD3ah3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MNWD3ah3"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9DES1027165
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 16:14:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vC+xxtvYYgCeXhh6pwXkgGaTGJbI1B8K+txHJMCvu4E=; b=MNWD3ah3YQDWEqvJ
	g/y1aZc0m4DzG1wwg+tA1HD1kZvPtHSnX/4EkVKTjGcEYKWsaR4km4jab9ADHva6
	R4O9M6YroUyY1gDcs+DGw8Yd2td2kxA4xORKUJ4WKN3w7KnjGUo9hvSevVi5NVzK
	mcWIDbPGElQw6bDSp6u2U+75/2gugHw+rIVnBPCrJec/u1eOB9V6TzF4TjvBPXc0
	RjF2Bw2u8Lkx6VwXimsvmrEzzKJfcwZat/UKzLEOcf+Id4QZzOt6lNxFcrYnE8DD
	spfarTr+Sw7fPdoOHLkIhOsYtIZ/A+/BL7Txcy74OuO5YyS5nCEBiqeZ+0VoJB5k
	XEj4uQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ccvdh0y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 16:14:04 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-74299055c3dso81962b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 09:14:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749658444; x=1750263244;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vC+xxtvYYgCeXhh6pwXkgGaTGJbI1B8K+txHJMCvu4E=;
        b=kdgKMWTR2h3VkPcBAXTZl3j0AEPpRjURN+MKASuT6RLtD4N6vQLdgYPlcG8a1C4O16
         Gp71MA2Xi1FuczGqWtL65zemgCxsrainXAFntDq2DYixD4RsJ/5b5wywba3bzwYY+nmz
         6jIEcfA5G+WT+uJWwaieXOlEAW0fn3sB1PG9YuS6U0npWUvHCcExx8wtlNfdFoMcRLQW
         PXXfbYdsEJobpQOrs34YDc7hPkw6s5d82Q4T1qM2bePHkCK2O1sOWZJxR6V5KNxszvTp
         76C/K6AuoF4iWCAN3G735nMuokiLhFI36yoEg/MGMz8yxeCTSbKvwu/PClcBt4iG1MWg
         kQvg==
X-Forwarded-Encrypted: i=1; AJvYcCWtpmP9TuHrVbygtNT9kP0B/AS+is1N1D5Q56Pes33FtrYfby3VpiqlEnZsXEJttU6O6IKqMlDj+dTuMnE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyL9S+vJNobfUZRo8cPn27UXCOsu3oEYKxhuJ3bLPfWJIIXULCF
	BT04tVtZGSAmCajFQle3BS6cDvrIgfTjvLDf/7kPivbPI/sT0OnPU2RbNWwiVezRqtD5PhL5EYI
	r0S259unifw0hNEvE0TgM8bP4U1MOToBPBUOoKIAF6307uq5NO4KXLTN7/NZH+6hB6Nw=
X-Gm-Gg: ASbGncv8aci1zqHwPAIZXAPzuWqtwseCPJJRB73gtD73dU1NTc4hVmhYQpXEcWRJwpS
	5qgT8Hjkgplu0C2u5D5aKRUgBmvSplmtOuKZC2Qewqmdi3OR//XEHPiA/lai+BsFSKAZCQir7cJ
	oqSlWB9rPwA2cEWOXqebwiBdbnPaGcx1xJDBh+UEyuiM6/0ROkfWwKjrIR3GEE/4A5Jukf7wF0U
	F1JOqhIXiBdWTzASZk+jVYueBBhwnMasgKnIKqtIfyOsd+TWDzUjGV6SuRFAKNvil2teUbKmZxE
	KUH57CZj01Ss3ycw1a/aoDrHBu/XWMCpZZMRLyC/yAUt812FqhgSwbrMkEc=
X-Received: by 2002:a05:6a21:7002:b0:21c:faa4:9abb with SMTP id adf61e73a8af0-21f86725e41mr5990061637.20.1749658443793;
        Wed, 11 Jun 2025 09:14:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1AbsaLs+Qh4Et0Dv8tLq0lT4GI8TdVK+xPhvb4cHdeQO2njFhkxJ5Zk1PmTPCVdukje/UZw==
X-Received: by 2002:a05:6a21:7002:b0:21c:faa4:9abb with SMTP id adf61e73a8af0-21f86725e41mr5990014637.20.1749658443185;
        Wed, 11 Jun 2025 09:14:03 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482cdf1c41sm9443708b3a.149.2025.06.11.09.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 09:14:02 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Wed, 11 Jun 2025 09:13:56 -0700
Subject: [PATCH ath-next 3/5] wifi: ath10k: Add missing include of export.h
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-ath-unused-export-v1-3-c36819df7e7b@oss.qualcomm.com>
References: <20250611-ath-unused-export-v1-0-c36819df7e7b@oss.qualcomm.com>
In-Reply-To: <20250611-ath-unused-export-v1-0-c36819df7e7b@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: 5Wv8OhagLj-ui51eq5f2MJ2tcguIr28h
X-Authority-Analysis: v=2.4 cv=TsLmhCXh c=1 sm=1 tr=0 ts=6849ab4c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=E42zS0385_rVDwRnvgkA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: 5Wv8OhagLj-ui51eq5f2MJ2tcguIr28h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDEzNiBTYWx0ZWRfXyMe4VUW9Pjy5
 Zq96xeUUE77CY+OmQER365FCNTbU6sCTkoe9/IHB7wbew0Fwy5R9fCgDL75hBoUnYvIkiY7N4Td
 sSrC805PbY3xvL4FYneqIVH/nEdqmnyG5Lpk+8DtUvfQ0JCfFDjDhiVES1pxLWAEv/yVc7JwYeZ
 XpnIUhvsuL0XXoKSQg4hYJg+ug4bD6EBs4iwMkdYMWwwpixw+tLD+LhxEO2zvqQQvGTD6hOe/VF
 MdH9UPNP19kILHZ9IXgexZFvlsqItZiXr9skNvVvjZfmvqfi+XxQpXS/ux555S9x0K/mL2KOr+p
 xPrjh0i47umrH3Jog7SITNbgXFXdQuIECDWdKcAuljD8710vQowuSdF9RkczspTLWxxZQqt0Cl4
 VqH8JABX40sk1KmMQrX6Q1eYKwnV629zMq97mCwJI/rW46OdyaWsfVbQQv6Prg9h1hwSqzhZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_07,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110136

Commit a934a57a42f6 ("scripts/misc-check: check missing #include
<linux/export.h> when W=1") introduced a new check that is producing
the following warnings:

drivers/net/wireless/ath/ath10k/bmi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
drivers/net/wireless/ath/ath10k/ce.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
drivers/net/wireless/ath/ath10k/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
drivers/net/wireless/ath/ath10k/coredump.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
drivers/net/wireless/ath/ath10k/debug.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
drivers/net/wireless/ath/ath10k/htc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
drivers/net/wireless/ath/ath10k/htt_rx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
drivers/net/wireless/ath/ath10k/htt_tx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
drivers/net/wireless/ath/ath10k/mac.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
drivers/net/wireless/ath/ath10k/trace.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

Add the missing #include to satisfy the check.

Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/bmi.c      | 2 ++
 drivers/net/wireless/ath/ath10k/ce.c       | 2 ++
 drivers/net/wireless/ath/ath10k/core.c     | 2 ++
 drivers/net/wireless/ath/ath10k/coredump.c | 2 ++
 drivers/net/wireless/ath/ath10k/debug.c    | 2 ++
 drivers/net/wireless/ath/ath10k/htc.c      | 3 +++
 drivers/net/wireless/ath/ath10k/htt_rx.c   | 3 +++
 drivers/net/wireless/ath/ath10k/htt_tx.c   | 2 ++
 drivers/net/wireless/ath/ath10k/mac.c      | 1 +
 drivers/net/wireless/ath/ath10k/trace.c    | 2 ++
 10 files changed, 21 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/bmi.c b/drivers/net/wireless/ath/ath10k/bmi.c
index 48efdc71d54dc699e1d43d01507a7a30c9c495b4..52118867ecde5c71b36361e3393d7579116d8be9 100644
--- a/drivers/net/wireless/ath/ath10k/bmi.c
+++ b/drivers/net/wireless/ath/ath10k/bmi.c
@@ -3,8 +3,10 @@
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2014,2016-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <linux/export.h>
 #include "bmi.h"
 #include "hif.h"
 #include "debug.h"
diff --git a/drivers/net/wireless/ath/ath10k/ce.c b/drivers/net/wireless/ath/ath10k/ce.c
index a89a7491a76c8b25c38a56cea4196bfbbae277d5..7bbda46cfd93c362b0d8c53dc5e8ad7e8621cacd 100644
--- a/drivers/net/wireless/ath/ath10k/ce.c
+++ b/drivers/net/wireless/ath/ath10k/ce.c
@@ -4,8 +4,10 @@
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2018 The Linux Foundation. All rights reserved.
  * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <linux/export.h>
 #include "hif.h"
 #include "ce.h"
 #include "debug.h"
diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index fe3a8f4a1cc1b774ce27112ef7dfe6adb0b4dc2f..760d0a9ab9c2ce54717860e1c810d2b063f75e47 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -4,8 +4,10 @@
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
  * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <linux/export.h>
 #include <linux/module.h>
 #include <linux/firmware.h>
 #include <linux/of.h>
diff --git a/drivers/net/wireless/ath/ath10k/coredump.c b/drivers/net/wireless/ath/ath10k/coredump.c
index bb3a276b7ed584f4d4e7418b2e4cf7d913114869..50d0c4213ecfdce975638c66bcdebe35b6ce9d3f 100644
--- a/drivers/net/wireless/ath/ath10k/coredump.c
+++ b/drivers/net/wireless/ath/ath10k/coredump.c
@@ -3,11 +3,13 @@
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2018, The Linux Foundation. All rights reserved.
  * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include "coredump.h"
 
 #include <linux/devcoredump.h>
+#include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/types.h>
 #include <linux/utsname.h>
diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index a0c1afeda4ddf3649ceea8adbca23d771d17dc93..6410d3961e76ca2b4191052277c2072638db4b8d 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -4,10 +4,12 @@
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2018, The Linux Foundation. All rights reserved.
  * Copyright (c) 2022, 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/module.h>
 #include <linux/debugfs.h>
+#include <linux/export.h>
 #include <linux/vmalloc.h>
 #include <linux/crc32.h>
 #include <linux/firmware.h>
diff --git a/drivers/net/wireless/ath/ath10k/htc.c b/drivers/net/wireless/ath/ath10k/htc.c
index 2da08dfebd3e7b56b149a09b5372aa0bfb8538d1..ce9b248c12dc6c0c90a9a7e081e428d439465ede 100644
--- a/drivers/net/wireless/ath/ath10k/htc.c
+++ b/drivers/net/wireless/ath/ath10k/htc.c
@@ -3,8 +3,11 @@
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <linux/export.h>
+
 #include "core.h"
 #include "hif.h"
 #include "debug.h"
diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index fb0d5d4cae3a1c1bcb82c3bf83d57d79c3661f07..f12243d6bee171eeccf4a57e8001cbddfd26733c 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -4,8 +4,11 @@
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2018, The Linux Foundation. All rights reserved.
  * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <linux/export.h>
+
 #include "core.h"
 #include "htc.h"
 #include "htt.h"
diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index 9725feecefd6fb0f073761fbacf26d6bdbaeff15..c1ddd761af3e9ff987fcfd3a55b8747e48783b9e 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -3,8 +3,10 @@
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <linux/export.h>
 #include <linux/etherdevice.h>
 #include "htt.h"
 #include "mac.h"
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 07fe05384cdfb13924a956f7d672042b782e166f..730a6eadf093378d93844a444841fd5826f720bf 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -9,6 +9,7 @@
 
 #include "mac.h"
 
+#include <linux/export.h>
 #include <net/cfg80211.h>
 #include <net/mac80211.h>
 #include <linux/etherdevice.h>
diff --git a/drivers/net/wireless/ath/ath10k/trace.c b/drivers/net/wireless/ath/ath10k/trace.c
index c7d4c97e6079f006383b864b1bdb2fc0ee1569c5..421ec47c59bdf9967ad18e2de0182a488b9c5a03 100644
--- a/drivers/net/wireless/ath/ath10k/trace.c
+++ b/drivers/net/wireless/ath/ath10k/trace.c
@@ -1,8 +1,10 @@
 // SPDX-License-Identifier: ISC
 /*
  * Copyright (c) 2012 Qualcomm Atheros, Inc.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <linux/export.h>
 #include <linux/module.h>
 
 #define CREATE_TRACE_POINTS

-- 
2.42.0

