Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5390E170A26
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 04:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745470061; cv=none; b=fQBSXuEKc0MbdTVLw6ZeHwiDgdvgtdrnMwNdyaa+N8a9uPTWRxT8k8YNthcuQRNryqm7nlOt3PPQFWcnJzVBCK+h5DgJiYKDEI0xSlN7+i0tfZZlBkkhh1aZaBJ2wDk9VOVmCt8veESjxiOJvItYZgVhDXi6wh2pXIOCoBYT+PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745470061; c=relaxed/simple;
	bh=ptuipwHUDCgZKqYL6e0NkqtYwtJGVubt2616v9gIpm0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pjw47GGpY5GEKn8a7kvOSXsVJVEu3SDuHx+aTL/Fyup2WMXjQDKjYseB2MzaRk2KHDNnR3/0fOiquG617MXYCOZKxAQ6edSRSB5Cxur03JMfonkNg39eRNPFNT0sWmKqTPF2jB3ZPI3Y3FmTcqqE2dN3e6N2jzumLzr5kyhE12E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ii0SDCVw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ii0SDCVw"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F61b013152
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 04:47:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=EOpmjHuWdoyxtbl0lXVyHn
	PEnYkVQY0jb3AUJtDtsSI=; b=ii0SDCVwQ09Myqek9hu7mOMmEeUahRsfY1YJCM
	TMxDembBNPFtL6PIg/Y7J13KDvAbgirWPswJwt9NHS6sQPIQP1thbRkq6ZPbbMf2
	b+E4RhbvsDSWmZj6m1w+/zeAmbEOPWateyDXbWKNVDej3jI1E3PGbGrPKzr0xlAu
	MLt1xpS3tITrkLH0dA1cTXGSriNOYPW1whFXookNE6+lIekvyLYJt72aP4vsGy3u
	CeS5tJf8JnGp7LzlapqXgm56+YqO9JE45nvc6av6eCaeFGAPPFP8s0BWDvV//4HT
	LXEfZP9tJGd8dlGmqtcWzNNtHfLJq3JqyDxeWlDDTTyt798Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2c86j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 04:47:38 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2264e5b2b7cso5410405ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 21:47:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745470057; x=1746074857;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EOpmjHuWdoyxtbl0lXVyHnPEnYkVQY0jb3AUJtDtsSI=;
        b=OvzeMJRtn5fuPFkU2T32R2VBCshEIBg06Fpbz0925U5ngujQne3wk2vYXXZBoRYgzS
         PlnL9+ARdwD2a9CWbqcFpBEE6ciLVvyjjnIu8OQbHIyRt1HNXh14/vHZPd4dSwj0veE/
         DPqtazAwUj59kYk8vZDIcd2EkYMOnjI5cTdzajv9k6/Ai5cbpxxB53b+Kou7RwrOIuXu
         7QTyvgXOpMRvyj3Q4waBCueuXb4eDMi/r7YsdVOY1J/pD84AgMtlyx3csgYNHCiNOZIo
         1XOauVuKnz5eVxfYZipkqRxPiRoDgVLxdPFMnYE+N6EqopA1WYe60OsUFTkDJgz27qZu
         xucA==
X-Forwarded-Encrypted: i=1; AJvYcCXSwgZ+VpvPK6L3VJETdBhoszVBotA1nrpGaPztcv+BPncJJMQ/DQzj+UFqzRcLi5F7h4nO/q3KJ7zqguo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNM8xIWt2c4PM2JvCQkrQ8SbLB5YF531qBKn8f8TtfdfFYcgTT
	ArDmrDBKAMyplWjrTrAZCeY7Ir37oYpb7WIK6EHbed2xBRaPz/hS53wxZnRipFn3ycYS3GLMgKp
	XJxG+oX/th8ZcUZqYetyJ65XnRLp/ZGNAsD9WlsK+nfMzteueZoiUYhFsM+gU8ck=
X-Gm-Gg: ASbGncveg8+NlAJux03xW5lrVne0Y64oeL1l8qHKt697pXYiQQD9qVXt6M9kpRNN4DH
	YUUPi7nCAgdL5AsyBGNlMQvY22vI6YokaAm3cgVFgABTNyqjt+RBCTKdfMeYkhdHkkZd9A4el99
	JHjhw793PeX3wKDgmqsTthco+IWOymh2rWCb4vAeNS0rVlFp1XdSo2if/CM3cL54MHAi7Ahp8pM
	/mwDp5MDuY3Qn88HcRvpf9dQ8CYfRtVrVoewMUOMVH1Z+UITx0Dh24AsAoaBAur41c5fwrb+iMw
	3sZdtCicAHvB5TFipdR4lwYEng==
X-Received: by 2002:a17:902:cccf:b0:22c:35c5:e30a with SMTP id d9443c01a7336-22db3bf1a0bmr15774435ad.16.1745470057582;
        Wed, 23 Apr 2025 21:47:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRXAusDnHxqVZy7R8LW483DslzGVuC/HbDJZqxIbATob8CnEvN8+j4rJ9x1uEc3kEzS5ppSA==
X-Received: by 2002:a17:902:cccf:b0:22c:35c5:e30a with SMTP id d9443c01a7336-22db3bf1a0bmr15773985ad.16.1745470056924;
        Wed, 23 Apr 2025 21:47:36 -0700 (PDT)
Received: from [10.213.103.17] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d76ee8sm3589345ad.50.2025.04.23.21.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 21:47:36 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 10:17:10 +0530
Subject: [PATCH] pinctrl: qcom: Fix PINGROUP defination for sm8750
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-pinctrl_sm8750-v1-1-b070790ccbce@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAE3CCWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEyNj3YLMvOSSopz44lwLc1MDXfPEpBQDCxMDMzNzUyWgpoKi1LTMCrC
 B0bG1tQBIeyI8YAAAAA==
X-Change-ID: 20250423-pinctrl_sm8750-7abd08406675
To: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745470054; l=1529;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=ptuipwHUDCgZKqYL6e0NkqtYwtJGVubt2616v9gIpm0=;
 b=hbcY0ql0VRWNSWGKLs0BemjFuqtyHC3PLvTPFrDr5Kcg6ZUkOi9fHtbjOREi+3Iubk06FQDhM
 raADQQ9NeeoAYkwrk+6vhlRguAIqUXqJ14ovV9CA3rcbAzp0DQcvbeg
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: LOu_VYqa4yTKOhJPjt4lE8NiJyE81Jim
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDAyNyBTYWx0ZWRfXxO9puqVCGIWd gcnzu82BDYSX2tWLtrsIiT9jWfk4/iwPpsqcfDUc59JqzeRjuSQ6nHXqKmg6RB4rOpj7LJ7Hru2 pAThsnebd44xsXKow5tShWNozHciZ/dMy8d5LDqwuIgwJfevm/VXIrRvQQxISGCl6dqCRTZK2jc
 dnf7WwfRPT/Bdg3zqz+R80o2yLkwQAApSq/yGugqFEegrQO//kCv5Fpod4qOHTEaj/Q4zaTrrZC uqTa628NqdzybACHOp5YeXPdW5CSpvRw6v0ZgtgAla4O8zTrv75lWDOKnmAtMsQ5BOr8ckBUZfP lLDG5uutYAFdSjq9IWbYRmQcM5mmV3jtEDDDgASGvQsd2NyZBsiu8lHm1tUi6hSBvOe5Gw8LXvX
 VW60keEcYOIWCuejXeGcH5rmrRYe8JVoKy+Vj9sOEJI4VSm4eCu08sJqFFQ3SnR88Cvdn72R
X-Authority-Analysis: v=2.4 cv=Tu/mhCXh c=1 sm=1 tr=0 ts=6809c26a cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=61JurpKn_mCFDXP9eHYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: LOu_VYqa4yTKOhJPjt4lE8NiJyE81Jim
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_01,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=614 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240027

On newer SoCs intr_target_bit position is at 8 instead of 5. Fix it.

Also add missing intr_wakeup_present_bit and intr_wakeup_enable_bit which
enables forwarding of GPIO interrupts to parent PDC interrupt controller.

Fixes: afe9803e3b82 ("pinctrl: qcom: Add sm8750 pinctrl driver")
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-sm8750.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sm8750.c b/drivers/pinctrl/qcom/pinctrl-sm8750.c
index 1af11cd95fb0e69fcc876fe069cc2cd6fd6679fd..b94fb4ee0ec38013d8cde7e45a7d6088a20e3b28 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8750.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8750.c
@@ -46,7 +46,9 @@
 		.out_bit = 1,                                         \
 		.intr_enable_bit = 0,                                 \
 		.intr_status_bit = 0,                                 \
-		.intr_target_bit = 5,                                 \
+		.intr_wakeup_present_bit = 6,                         \
+		.intr_wakeup_enable_bit = 7,                          \
+		.intr_target_bit = 8,                                 \
 		.intr_target_kpss_val = 3,                            \
 		.intr_raw_status_bit = 4,                             \
 		.intr_polarity_bit = 1,                               \

---
base-commit: 2c9c612abeb38aab0e87d48496de6fd6daafb00b
change-id: 20250423-pinctrl_sm8750-7abd08406675

Best regards,
-- 
Maulik Shah <maulik.shah@oss.qualcomm.com>

