Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A236189913
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 04:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738643043; cv=none; b=bk1KaqjPjv+mHWqfGsFQl4jqFS51W0WVN0DenmoOM9Mkyjmm66qOn6d2DkW1gy0N9Aw3tZPIO1tr8rfnxATO45oW+0JRhmWC4H4a5nF0rHnZ22Xf4TWZOICm3W9QlAZq+MxLKFbCEXif0azwn/BR/wil0rwfTKU/j8LwPaluUwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738643043; c=relaxed/simple;
	bh=nxkKWfEGElnDHDYpMY9QNZVpKp9xiqkF73rcZPqYbkw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=crBsvuoCSApLe5PlPee2Pc22CEP5CdunjvtyYXEO+xvuvNTC7qBZPSqTEdv4kXUppKlNlv5jiubAVgTLYPkMg2oWRWPYKvvKwlYEA4AgH6XLsTnKAfwSVcIvMIg8JaBmZTXxnQZDkXJ6h5E2ztPkXTSs+za2BqzE4kgwoYdMgNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cJJeoPzB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cJJeoPzB"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513KQhfU026980
	for <linux-kernel@vger.kernel.org>; Tue, 4 Feb 2025 04:24:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OpQ1wqnVdVlF+fVFCGFn5AWkm1b36ebsa+hYlEcKIWc=; b=cJJeoPzBNjKrftGH
	e77cEcWJlKbXseJM0rsexHWHmuVrGijHC69cI5zgeldWhok9wneSqYmFr8aBCTg9
	WNekBcAs3kIzFks+yNQiK7NZPZ7H5IFPdOY2YCVF7T+x5q6s1KTbDyaERN6JI7og
	jr8ZK4FrSE1PIQnuSxaVQQLOC+gXCk88qNQMk7Q9Qnhw46RVq4kMfPH/E0nRl+pH
	gjlTjJVBGvORNpy4Vcj144hsKdQhAPxyKzJ+68vQqJYmDL8nfQw9RzGBVZK3WilI
	1IfJAMsZVHVlCK+m8wDpTvvBhAAZVjygfYjxzwO3gl4YBKNiX0Ov3qvvH+9vrvBd
	0z5R1w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44k4ufrtcw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 04:24:01 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ef9e4c5343so14627617a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 20:24:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738643040; x=1739247840;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OpQ1wqnVdVlF+fVFCGFn5AWkm1b36ebsa+hYlEcKIWc=;
        b=EP4GwahNYf8x2cKULXZyQQ3Gv888o0YzHTsmU1nGvtdL35b6Ugigv8lQgnDxZR16Dz
         zf6YihGHxIA0xODg6fi2f2Y8jUfyPp8X83LMvcEtgaou8j+KvhNnKxVLYHuuFs4vLXyP
         v3kVOwbE/W+H2KuL6sC9iGZde04Jj2lUDoLMOFCUjBOyCGrLihQWT13pC5+aO3QR0+7E
         sooQu0mrFOeuipyrMpAZSgKj5fUPQf/atBwQwxHWmINzovETukU0L71WP5dAhAKSBdz9
         N1DGF5S2/+KbXppHrCdABZGBoNXOrf5+xalL663RJYIzMfjn816L2X9kmO53kqUD4v/c
         fOgg==
X-Forwarded-Encrypted: i=1; AJvYcCUl7PXEdousQDJvYNz46VnaGYkOHTP8oL97sJ99vXwevTPGLpXz1wbvdaiN3nDiAomU7t/8+As3E1SizHM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIVQu17YKRkVZWAJMQ4kM6wB2RVvnlPrSbNbTPawVxZLMOgZmm
	lRcf+eK2x0Wyf7FsrUAsMQE3XP3sAXc3FaI/hRGUbLTIJU3lxfT0rRpQRTn1VRTkEkgS5y5/vro
	6p5oWogsrPe+WaEj8vGoSKRXgFiERB+IYZp+s4CvUrwewPYzLotZBCympCAepHqU=
X-Gm-Gg: ASbGnctUf5nkZRNb4Oy1TgHcPwCNqBzCNpg8S9Ql+VCE86OXTu4/+4Utt0CbU7E2wZL
	5iKe7Wp7S2nFDi+LEJ3T9NR6w4UGCUE7spbOfUnf+fzWe7xmCIlfwobBRTUfZ6PYwf9N1qqDXDp
	hgdC/Oz6yvO2AHFH2sIxgPNtnAlR1/rc00dFIOarHaJeJvemzEQ2SqdHVk7IzFzDxIBY9Ro7VGL
	qYLOCfohIjqMFS5+D123O6ak1JKrRe8LY39PDYBAt+/1tb/VQ3DVHTj/e5IzwvRqHiD6aSxCq1k
	+zWtZFyqpF6Q6Eqhdnu2gKz7qGya0Uf9/XT2uKHqLczKGPqIayhLtgTQkCYqMk2x9z1zS7jM5HJ
	Hpeapzu5U39GEIbNFpG42fszPyavPlg==
X-Received: by 2002:a05:6a21:498:b0:1e1:a647:8a54 with SMTP id adf61e73a8af0-1ed7a640d32mr38481743637.20.1738643040155;
        Mon, 03 Feb 2025 20:24:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGOQ7Av7ChIT5Sfd9Y3FCRFBK0BvMkRxWFgYagW1fOXHmqJfop4BkVtnVNZpzYrIs3wnrErtA==
X-Received: by 2002:a05:6a21:498:b0:1e1:a647:8a54 with SMTP id adf61e73a8af0-1ed7a640d32mr38481712637.20.1738643039750;
        Mon, 03 Feb 2025 20:23:59 -0800 (PST)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acec04796e1sm8897144a12.58.2025.02.03.20.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 20:23:59 -0800 (PST)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Tue, 04 Feb 2025 09:53:41 +0530
Subject: [PATCH 1/8] wifi: ath12k: eliminate redundant debug mask check in
 ath12k_dbg()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-unlink_link_arvif_from_chanctx-v1-1-675bd4cea339@oss.qualcomm.com>
References: <20250204-unlink_link_arvif_from_chanctx-v1-0-675bd4cea339@oss.qualcomm.com>
In-Reply-To: <20250204-unlink_link_arvif_from_chanctx-v1-0-675bd4cea339@oss.qualcomm.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: iUM9pBgI_02n8QryihldKnzyWN8N4Vom
X-Proofpoint-ORIG-GUID: iUM9pBgI_02n8QryihldKnzyWN8N4Vom
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_02,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 adultscore=0 bulkscore=0 mlxscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502040032

The current implementation includes a debug mask check both in the macro
expansion and in the function __ath12k_dbg(), which is unnecessary.

Simplify the code by removing the redundant check from the helper function
__ath12k_dbg().

While at this, rename the first argument in macro from ar to ab since the
first argument name in the function __ath12k_dbg() is ab.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/debug.c | 5 ++---
 drivers/net/wireless/ath/ath12k/debug.h | 4 ++--
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/debug.c b/drivers/net/wireless/ath/ath12k/debug.c
index ff6eaeafa092cd12e572430ed0f1c7aa21b78377..fd9796b5ad3b9feea5c7e78e8a88d361049e08df 100644
--- a/drivers/net/wireless/ath/ath12k/debug.c
+++ b/drivers/net/wireless/ath/ath12k/debug.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <linux/vmalloc.h>
@@ -63,8 +63,7 @@ void __ath12k_dbg(struct ath12k_base *ab, enum ath12k_debug_mask mask,
 	vaf.fmt = fmt;
 	vaf.va = &args;
 
-	if (ath12k_debug_mask & mask)
-		dev_printk(KERN_DEBUG, ab->dev, "%pV", &vaf);
+	dev_printk(KERN_DEBUG, ab->dev, "%pV", &vaf);
 
 	/* TODO: trace log */
 
diff --git a/drivers/net/wireless/ath/ath12k/debug.h b/drivers/net/wireless/ath/ath12k/debug.h
index 0aa7c8ccb14ccb9de28a78ca3d2b2a7bf6e481c1..ba0e4da3bb761a49fb81e3efcb61557df8ad1942 100644
--- a/drivers/net/wireless/ath/ath12k/debug.h
+++ b/drivers/net/wireless/ath/ath12k/debug.h
@@ -62,11 +62,11 @@ static inline void ath12k_dbg_dump(struct ath12k_base *ab,
 }
 #endif /* CONFIG_ATH12K_DEBUG */
 
-#define ath12k_dbg(ar, dbg_mask, fmt, ...)			\
+#define ath12k_dbg(ab, dbg_mask, fmt, ...)			\
 do {								\
 	typeof(dbg_mask) mask = (dbg_mask);			\
 	if (ath12k_debug_mask & mask)				\
-		__ath12k_dbg(ar, mask, fmt, ##__VA_ARGS__);	\
+		__ath12k_dbg(ab, mask, fmt, ##__VA_ARGS__);	\
 } while (0)
 
 #endif /* _ATH12K_DEBUG_H_ */

-- 
2.34.1

