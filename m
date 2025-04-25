Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CB671747
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 14:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745589843; cv=none; b=pW6rwbA2MC0EHdpN4UXu3fPDDyx09iIyIKzhgXfgfszTGs9QKULWg1+DMY04Akwbx7FLG6BSCBKmVsO87X+W+GjLW39Cr+3LAHimYUKBCovRqQTmsUT1KVCl/YGpqrETFWtAlLBiopSZFLAHHYqYm+9/ah4uRAdGgplaLooFSMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745589843; c=relaxed/simple;
	bh=DVCmG2ZyZCvXacKusGEsowZKmCF8wz9Wy3Q4QPySJ4w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XmEUnobhr9kCqMR+5ZMYZgMOMJM6yWgmaFLsk3k4w5G4mTYqK6kNsDqK/YG6Sd1CGfZQLGqof3zQAq2RC2aFcDb7N1p1+GYfiqE3jiy8kd+Hvybo0832vlMbfMr4JRGhRLhVAZyOHLsqMrAyiBWmjAUBV83uZAKp6HmFhhw+Zxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EpWdRIDK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EpWdRIDK"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8T9We023852
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 14:04:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ZwK+b192ZD+Z7O9cLlbngFZXkc3t1Peta+8
	UE3ITQMU=; b=EpWdRIDK6JevcHIUtggjEtQ1+viDeQtowwEOowUEyRJYvBvL/sO
	ZxJX+66/9ctPiHoPSm16ftKHZH/TbTHZ7SuCW0MWJMMNBvfSu/40L6WSvzLnaOPM
	pZuhbSNWd3hwPNriEd+e5586R1qardvudYRxr29Qvhk6DqGXA/JGQQerHdJJaN6V
	ZFv30hcJMPNUyZissIP1jXv1pHYjnRWIkuJuqBdTiufJXr7ShBJ6ZW/QXTFD/an6
	gIE9LaTwYJaJTAZYtWft/068JHwu5Y/+v9nlAJF9MJuZhDtjBnJlm0wGw5QZ7Fbm
	LV2Ml4ut2b+TFjihc4ngLCy6IIn+9zbt8Hw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh1s8k4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 14:04:01 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-af5a8c67707so1441558a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 07:04:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745589840; x=1746194640;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZwK+b192ZD+Z7O9cLlbngFZXkc3t1Peta+8UE3ITQMU=;
        b=v/eEV3QTeYitJeH/zWT1V0G9uWIdEPKKA3rPHCh05kG/p+CGAPtqx3odLfbEh+43cR
         /i0qY9jxGR3v6A8GKSEbCfCc6cb/mN5eUXqWiXYrB+kYA2eJa58aQofPl0Ul/jHYWOjU
         xVbba1ST3QtQ7+tm85yPwU1cfBfOViZKZE645oR6hVDM6KOeZf1WU/uRhJGLymPcgO/B
         Oc9MHeT3TpyiYo4c92YHoypGXvTd5CncV4d7PXYRRULTJUpfnXjztq0tgJj2EdESRakB
         kGZEiDYTbyXZNkNjD+wwQzW6t5ePmnCc6VcUfasgANnC5HWgtuYYozj8HNpZXGhJNQ4D
         qNxw==
X-Forwarded-Encrypted: i=1; AJvYcCVIWD6RNkuE4YlzDz2aWGxTClIfGN7RfjviX+tnc2moG9ku/o4GuxznMuLco6i/J+kmO3ki18C0ugzsY1I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz0H87uKUtiP0aClh6ecNrF3hwu4mBrCXzNBy4tDRPEYgBxlj9
	FQldrDlkRMgKAL21w9oPerVjimlxhVWgq9BLDWPhARoy+2oKwOy15pU46bne+Olz4IwfN6FIG42
	0Z2f8KQx/i/mcXgwOd/UET1ulrBjOaR43gMDbsrM4+v5X6rEoh/59rhN2bbyqmto=
X-Gm-Gg: ASbGnculTuHWawnO4g6v2JIlFxJqsZsrgEFXw2tTmiRGIyKPMLUdvRkuyAYLrwCNl09
	vxmfUmGoPb3s3hWkdysd5vctfeHEGso+Z+sZJsCXKwH83j+BIzBmXS3kphXHN6aRgoNmaJ86fdd
	BHA8HTAglBqN/d/4iJB+NDxAvOWa1jISrKmcFU2zKXVLWCubm4hH1wtuHHPL54vFbjFvWdhFQ4y
	Rg8HNgeKqVstObfZUOVL+kAODovjY0Zza32v1/YCZZ42DXGV+XGECV4nlAW1q65Phrrbm56dM7T
	x/lu/XgwlYajguVW8M5f7vWM2beua3QnZL22vPs=
X-Received: by 2002:a17:90b:558c:b0:2f2:ab09:c256 with SMTP id 98e67ed59e1d1-309f7ea86abmr4354841a91.33.1745589840250;
        Fri, 25 Apr 2025 07:04:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhLbW2FBKRZYW6QwsmA2nqfdHehuUpVw6ZkBwkNyEDmsL3fAXZEWuVrXlZk2IzXUTPUfB5lw==
X-Received: by 2002:a17:90b:558c:b0:2f2:ab09:c256 with SMTP id 98e67ed59e1d1-309f7ea86abmr4354800a91.33.1745589839858;
        Fri, 25 Apr 2025 07:03:59 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef061c43sm3468697a91.19.2025.04.25.07.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 07:03:59 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 1/2] soc: qcom: socinfo: add SM8750 SoC ID
Date: Fri, 25 Apr 2025 19:33:45 +0530
Message-Id: <20250425140346.1087527-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: zyBtvW9BBFEdmg0C6zgBsWteXRHfcnsj
X-Proofpoint-ORIG-GUID: zyBtvW9BBFEdmg0C6zgBsWteXRHfcnsj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEwMCBTYWx0ZWRfX7dIFloZFT5pL 4pGu30Ea81B1yS+uQK8baJMoOiPPCziGa9i8zgi7E4VAhW1jZ+by6OLywOu7E0+1SdlFBZCoGNN hPIiEtcyrbpgNxFqKC89l4GlPyFzatLb8Qxpoj2VgNu7LmWH5c89c2SobfkFFa1HJri/8WZHB+P
 puzvp8X5j5Xu5o5wcyfh5Faj7b4mljeG9BwpqdrV7V+gG0TrflH4jdxNi2s2tDFMeN7vJCnvdF9 JWtYJX4yjWCqhPz0Naczc7eWrZ+pYDTOI7Jex1faObT3Huwk+q0Fc/lxMKIYM64RR2DlW8zHwFa gmTjkjdGow/InDDzm79EMTm1ZRWSPMXqGIT+4iiuh7lkOKy5RN8KePA8A6NjPLLMHAjjcW+l7Vn
 D7mhifvEkOY30Ewh7W4rD30DMycIBIV8OLKB1vqF7jLs+XUtTQv8Qozu3VGI4bXKUQXn06A4
X-Authority-Analysis: v=2.4 cv=ZpjtK87G c=1 sm=1 tr=0 ts=680b9651 cx=c_pps a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=MeXL3ZvE1JNQxLRkgr0A:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 mlxlogscore=999 spamscore=0 impostorscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250100

Update soc_id table for the Qualcomm SM8750 SoC to represent
SM8750 machine.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 13cf73744bd9..71858de73a91 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -456,6 +456,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(QCS8275) },
 	{ qcom_board_id(QCS9075) },
 	{ qcom_board_id(QCS615) },
+	{ qcom_board_id(SM8750) },
 };
 
 static const char *socinfo_machine(struct device *dev, unsigned int id)
-- 
2.34.1

