Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9798920CCE5
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 16:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749658449; cv=none; b=B5E1QSgf2kKPft1n24OKeJuOcLjHOEMAZXQFX4cbQ9CA9i5mLbIcnKvZBNlk1AQY7wD6Sd4Z/Lj1osV8vJwQ1cvgM0W+ujC4Ss5jdtFfF9ZNMvTGv0exxexypPm8yfpOlM72ht+7Mo6I4KdSVFICIMs0bAXDGwxexiS/n1r0Vk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749658449; c=relaxed/simple;
	bh=KgmN6Z5U1HBDuCEx3knea+7L6zP1BXlcij2mPYCuio8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ejf1jL67xX8kUElIP5goolUhdjOqCYAImmavr1KCnJmKGIVfRTkfQs3v5yruVZlG4etuyiikKNRqPdc4nfMm2zmrij03hOu1ZSkwxR9FHw/zTDJe7Rzh/L8tclh/Gar+X0bbr9oo3NcOLxo2KnJHVTYeUohynaeAoj+W0Tnjtfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pRSNC7R6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pRSNC7R6"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9DEMP019607
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 16:14:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GH2j/JcGCi/wRGQ9dQsBU2fKYdtjABlsIMmBhcg0SgE=; b=pRSNC7R6l5HnmRsq
	Scnjy8EdxHE1eJmHy9ZUbZAHkX8hC30QotCClFjZ3pNSON3KxyhSz6Oo0+F/24WE
	5r/hzrSpnTcFpocwRCW0w26zWx/n6q9ptqLi9ABqjXZ4R8i+rtzZu8uM9v13astM
	YIxexQdGRM7WMPScyf3oLUwix5uCDdN2pIhqfRtoUFk/i8yNBQuUnTUuvoGtC7rW
	H9sH8oS+0VDXP5mONn5IBw0Ng+gDpkJaX/9alty3gELd7c4145JggGTHAKMyTWXl
	BGqleD2qrXDTtFhVE8Nxi3Sva+otxjR8V2KcTQYF4tTWQUOjyfFN4DR9n6l3HkcN
	fRoN6A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474eqcnkf2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 16:14:06 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-747cebffd4eso28833b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 09:14:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749658446; x=1750263246;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GH2j/JcGCi/wRGQ9dQsBU2fKYdtjABlsIMmBhcg0SgE=;
        b=DUPQc/hFLwqLDQ3HnGlYpJ1HvhTfvfeenZeszKqKQUZlmoMHucXLZ1yYpcnitPh9Wo
         hrGVY2wcabCk21kBFHtu6j4nKKwISfPeOqALAVmXSP25o0/YoXiRUsagUp9WPNIJTnIH
         XWWU7G/IrtkHhU/p68gDH6K/BhE1LoVzGmLSc8kBGfzO/JzlmlVc/FefpIYb1D2qhBf8
         4RhhZhdsEGkQM2xeyB1sb/N9CJN0yoGBLlJXwnyw2+YpyUw0P2R3gS/jXdCSJoV5TuF1
         mZvqNRUovMakLvYo4BbRrVJyihkXW8xmLD/okUGfkiAvxN2BPY4d3U2jA8Ca6Jv4LjCr
         5YXg==
X-Forwarded-Encrypted: i=1; AJvYcCUEieFT3NnhuwR6P2lxV0+HoDariBV616gzehgq3w2XNQvDdoQbryHisWMWJ+qaQt+jJ/cmTfPCIhjS53Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzM3oW6TyhP3SJxPfwCeci/SnjT6TM7bqZJESbIcE+mYvBKu7TC
	+FMnlHBejCLNAivh1qlBcwXgyKarmakk2tb/UB+Mx2SK9IwT2FuGep5olVZ08LLGVQ4Mbasziuv
	kPFJP6sekyrl1Qcg7jxocmEKevwivnwbyEESp18eEnrAFdJrb8f52ibpHiY+G1AS5xA1M4WGZ/t
	4=
X-Gm-Gg: ASbGncsYXsCuMzXJoW6jOXLZ9pj91ai55fMf/PjqOjFFVyknHY0snmKwXT8QNfQ5wUj
	iSqT9+7XATsEpOo9mTmbd4GtwYhVd9yfoPJCSs/h48Tw8LR5DvCJ1C+bUEFSQ6F8zCvFWnVzQkp
	XrM5JRgxSKQJth8PxBsFMYGUhhrGD79t0zM1w35UYvl9SsMcbwm3quSzBfueRCipDr6cW1XZ+uE
	sX7exwIrLGWCekHDE3DAhykZvj2AlCKcrw5p1AHSmmB6w4Iu0aRP9ZtSwOlHSzr2EGvel4Fv2CL
	jUevnpIsoO2eTDfZscrADJh7sbNHDoGQjiVeuxDRDKUSHa8GMk/sPfUPHkA=
X-Received: by 2002:a05:6a21:3943:b0:215:dfd0:fd21 with SMTP id adf61e73a8af0-21f8672f2a9mr6863596637.34.1749658445451;
        Wed, 11 Jun 2025 09:14:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhF50A00ZTd8vFQ+6dCgRXF844Xy0RmBjMaSc4ILELsZo+JvEhAIFYPQ0WDZr7mZZy0t8u+A==
X-Received: by 2002:a05:6a21:3943:b0:215:dfd0:fd21 with SMTP id adf61e73a8af0-21f8672f2a9mr6863542637.34.1749658444992;
        Wed, 11 Jun 2025 09:14:04 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482cdf1c41sm9443708b3a.149.2025.06.11.09.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 09:14:04 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Wed, 11 Jun 2025 09:13:58 -0700
Subject: [PATCH ath-next 5/5] wifi: ath12k: Add missing include of export.h
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-ath-unused-export-v1-5-c36819df7e7b@oss.qualcomm.com>
References: <20250611-ath-unused-export-v1-0-c36819df7e7b@oss.qualcomm.com>
In-Reply-To: <20250611-ath-unused-export-v1-0-c36819df7e7b@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDEzNiBTYWx0ZWRfX/dxmz5rXt7Rv
 X186+M1JOhHjOKkocAECUv1vRevRAdfWC0XDTijLJWcY/vOzDIvsgbu7mTljh0qNTBnncEGfLWe
 7+IA2KdaaGNO9vT0XSG5OpxZpr/rWEFdd7gDuQxtzykzOgJtgL3X8ghhr0HzvvjSKhJ9V+ayMlg
 opDSSXMxlWxI6lytkidxehYorUvHgJB01abPSiMW7bSFQm2rg/RDVF7wGJXI8DKfsrqcjrreIIZ
 oYV32zAcvUYAAPGHfyfZ1Mda1AITCkjE27XQy1towrw5DB2Yu7L/fZoXHeRMSpOovF8F9TNzgs5
 Ea9Dt8kR0qLpW3MNOBL/L6cdP8qUuwJwlHGLvhp/E9YR4NdmTAkkxeIUFTMe10FA0dZoemGOZO0
 3Qx9oiootTIDI2bF3qYsCE+80fzdCaf8/wGQG+eRAMJKBYEENV2JEmxKjYmyDOI9h8UqfEcz
X-Authority-Analysis: v=2.4 cv=Q7TS452a c=1 sm=1 tr=0 ts=6849ab4e cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=xduYLtDgZ1illbjtIHAA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: kGh_M19BiLOAruByaBKs-DgGZtX2CsZK
X-Proofpoint-ORIG-GUID: kGh_M19BiLOAruByaBKs-DgGZtX2CsZK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_07,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110136

Commit a934a57a42f6 ("scripts/misc-check: check missing #include
<linux/export.h> when W=1") introduced a new check that is producing
the following warning:

drivers/net/wireless/ath/ath12k/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

Add the missing #include to satisfy the check.

Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index ebc0560d40e3419130e4caf01c9b91bd9affb3bd..ee0ac2e4e74b4b7a700b68a2077aa5b9938362c0 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -2,8 +2,10 @@
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
  * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <linux/export.h>
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/remoteproc.h>

-- 
2.42.0

