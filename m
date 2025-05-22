Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F209A2BF3C8
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747940656; cv=none; b=krP8ofENJzY8kRylKtPU8nPHvtBKs4l8NEV9haqpDWudaze/0IE+B+CRyflOakMyAGCElzy8E4kPlkaX4rvm8X+eSyNbMCSrFSRhNSvD2leEByFiagX3CZ2YdO//mGfdZWymV7tK1cHPRtTA622T97d08CwymL9bQUKzO81uHSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747940656; c=relaxed/simple;
	bh=fTuNHOrZR8+UE33Sy3Ln0Euz0vruyL2hvOfzibR0RLY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EWMMyPQWPdVB9BgoTLfzLoGsyj0gTAxPTXOgPB5cj9SGD7f9MztGryfSLFOnMbf2Xl9Zz6pp/Tg8HiCTv3L81BXekNcFY5CW/e61pqmH1/a2Mn5rC9sWjU8E4VUJ1qdLIkGFAKHH7feBMc4uWcjvA/9y7LIUN8TAgJfFZBcxT08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UamWd7ZI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UamWd7ZI"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MHCQjG001325
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:04:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tuF7BT/smpyZ5hksDUNBWNXde57Xof9XJdw38MQS0rY=; b=UamWd7ZIFliem7G3
	biad8ghYhaYxm7+v/HQ0u1vTpLv/Kp/R+1WwBmXlZCa9lLQzUauD2yotqJz8jFC2
	Aob3MGt4xNCeOtNFD4GuKcozmE+ycDTWLQBw7hkvkiLJp2qcWKVyw9ZTkrvBhiZy
	PGZlVrdsbgTGGMASZ7pe4VlGT+a/h5gngetKGz/MCnstfIFFwIHkDP7ut7pW6yg+
	vaG8rVsDtUq2Wxp3jKnAWym6i+1nt4cuvYUAyUOey/9eQYa0MvYUJjSrWBmOWC2a
	JRCmM1nnJmusTwy+AvHWDbgyBSoNo15NFCwPz/utXwct75Ct/oqLqYX3YMjNKZVJ
	4ky3xw==
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s95tntff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:04:12 +0000 (GMT)
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3dc8b60169eso2966795ab.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:04:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940651; x=1748545451;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tuF7BT/smpyZ5hksDUNBWNXde57Xof9XJdw38MQS0rY=;
        b=gByRE34q2UhVO+uxT0mjQAsHDWxB8MWGEQDzg1VHE9cNGJch0xjx1a3sJ8RO+bJBcP
         CRhLriYdVkvetyoHsYE0VK0hoF8JMp2Q1G8Pm1fBDkWQ856yBMo0Zb0pBHFUhtzvf6tC
         g6Nikm7RtuuQX3hu2fXqdoc4PG7lD2TA6lYLQCe96LNz0K3BzJnnvGTd8meWXOLBWJhB
         QxY5R84adtsnUPETB8RfSi40CF8YEGdxopt7F5P796kuc3qib+AQagICBGbNkQC6WDss
         ufrBi8QwLHIn+3yD7etAxaju/VR2rT6b20ta4YV6gBohURguF/cJ8zAkvgyht7ps8XnU
         F+iQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgDP4ZxxdUZtlm7N53kDDeY/ZTMwwjeFEQTrPr16uAcep3jH2yvhzXY5vIwdAI0st2fse/I3BuMjgGl90=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfdY5XxnMjMIDOlzkyrbWL/MoGnpTHDyW3SzBxGqCUGPq59Fk7
	k8nTRiwNlyWMOywa128id2PTIFLtm4o/SiOjL3XKA6gu5l/vuYJFVLYY5uHZrr+o5iVhqcQx5/q
	bOoRhIMS53H9dwUreftu/1R4I+iazLuIDvcgwVnRGH7EM5W9sBJAFTWl9UoKq8yvkd6A=
X-Gm-Gg: ASbGnctKKA7WaZzVfdfNR/LWZtabK7XXj7xQrihj6HaZ33SOEJFwyD4i9BZreYmVaGp
	oA7T7M2xdiYecIM2Pr/Ua1RFNadUbnHnE6JZDGFED7DR6k/Z6spBmtmfODzZaVcFzrklbIhshWz
	xHNUKR7kVmgV4WLPBJc7gA/mwcip/3LUfd/v2LDS+j/49LgmXHYDgLaowYgCAoyuEfb2rJYzNK8
	E9T349snX8Dh7DGbDFYlpGF7YQin5iCsgXNjj3HCiaChLVo3BJo7IzHz6uEimNkjz5rcib5LeEj
	5ntaGQHut4y5ZHAxaDsBbM9FypWvuBAxZ3TkfygdrdGZsRCFwktcbjZbLz45StNJYKTfw795jgY
	lNjxh/mTa9p5omOlaOCp13k/g
X-Received: by 2002:a05:6e02:1fcf:b0:3dc:6615:c0a2 with SMTP id e9e14a558f8ab-3dc92bb10ffmr9217275ab.1.1747940651120;
        Thu, 22 May 2025 12:04:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKwx1VFjT/7lIiX0OUkq4jsGktrukNf/vR//viyzkUZqWvQ9ptNiCoeXJJ2QcNjV4QDDaMkg==
X-Received: by 2002:a05:6e02:1fcf:b0:3dc:6615:c0a2 with SMTP id e9e14a558f8ab-3dc92bb10ffmr9216855ab.1.1747940650730;
        Thu, 22 May 2025 12:04:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703c2f3sm3482506e87.214.2025.05.22.12.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:04:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 22:03:32 +0300
Subject: [PATCH v5 13/30] drm/msm/dpu: get rid of DPU_DATA_HCTL_EN
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-dpu-drop-features-v5-13-3b2085a07884@oss.qualcomm.com>
References: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
In-Reply-To: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2871;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4PLdtBToyaCTWjSOru20Q+hzOpy3/IdoLPd2nM633h0=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ4Z+yV/vzMuZf2fFSGU9dFwi9afmwU5BYZepFX8sV0XIn
 k0xZ+jsZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEQk6w/1OSS81s11H+vyA+
 ZPOVU9yuR0o2LTFn7Va7vvjEoeneUgpX9yV6c5uY97SpJAkZ3FGYtyQh0//SKw8xFaU9CqUvpA9
 HC9ypLFA3c97aW1Xdz/hxyUWr3kOK28+cO7Rz1g+uuNdz7y7/E60k85IhwV6waapwr4brR/1Zpt
 kL64NbmDcHtoUndUu+DDqdfuntbZk6q4X/qkN23y5eJvm44m5QS+OzSs+Htz+/O35SaefMu8lsG
 iqF9Vfaop6c73m7ppg7cm762sdcZc+NK96qb9xs4yO8sH/9/GWeLKUJZXIZVuod6eUxZbGn36/Q
 S0gSMQivEmR7EBuxuLdDP6IroeLcVV6NrTecmBaahu0EAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=QKBoRhLL c=1 sm=1 tr=0 ts=682f752c cx=c_pps
 a=i7ujPs/ZFudY1OxzqguLDw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=BlGH1-kmwhya4yQ-KWAA:9 a=QEXdDO2ut3YA:10 a=Ti5FldxQo0BAkOmdeC3H:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: OE124zaZ3liKw3YTJp0pv5RKJlg60h1Z
X-Proofpoint-GUID: OE124zaZ3liKw3YTJp0pv5RKJlg60h1Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MSBTYWx0ZWRfX9nHUwR8VnZtR
 EOfBtMNhe3e3veV5+uhmexIlFSPHEb8Kf+jNkdctBvnY89YccLvcUu5khRYZSuUL8KXH9XKgcCe
 TII9UrzD97K36vs1MY7sHmRj1EUcmuLSnzMNy1XrrMxZCUx3KI396gOZpQIS8lUQQ7hvuGOcxai
 Lx4if6lqbUoSyONdged+ZJ5RNU0CKGOU8KFLwFb6w8BBCfFWgEAU35wYXEy3UZO9n9dy/nkosh+
 kmIjJ5mgAOiRNJuAV/fVJsm5utKZ//0eFFKGRJrKJZr5CUJPrKf9cFdlsSTOAzLY61VftSWND7p
 hSZtZP3y2j7kp0KQBpi9u8E9o4tuhGUB1bxNZXhubCJFg3wSq1sMF++0Bt9RlBeA69KAZ2dJA+E
 3PpMRL0Qy0gpp6bwSGp7J96XKPhOFbE2bkPWMBerxMzMOiKvT0sLoSzCcCiKWreLOqH9f0QR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220191

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Continue migration to the MDSS-revision based checks and replace
DPU_DATA_HCTL_EN feature bit with the core_major_ver >= 5 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c    | 2 +-
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 5cd87b13e839e7ad60356cde162405fdfb6f9498..1244dd59648d11123c507a1369f28f952d047fd5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -106,8 +106,7 @@
 
 #define INTF_SC7180_MASK \
 	(BIT(DPU_INTF_INPUT_CTRL) | \
-	 BIT(DPU_INTF_STATUS_SUPPORTED) | \
-	 BIT(DPU_DATA_HCTL_EN))
+	 BIT(DPU_INTF_STATUS_SUPPORTED))
 
 #define WB_SDM845_MASK (BIT(DPU_WB_LINE_MODE) | \
 			 BIT(DPU_WB_UBWC) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 3b6133e1bb581741fe87b049ad0c89bf30b76019..bf6b2392efb47fa8c3e3c5d17f1a72341872e18b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -143,14 +143,11 @@ enum {
  * INTF sub-blocks
  * @DPU_INTF_INPUT_CTRL             Supports the setting of pp block from which
  *                                  pixel data arrives to this INTF
- * @DPU_DATA_HCTL_EN                Allows data to be transferred at different rate
- *                                  than video timing
  * @DPU_INTF_STATUS_SUPPORTED       INTF block has INTF_STATUS register
  * @DPU_INTF_MAX
  */
 enum {
 	DPU_INTF_INPUT_CTRL = 0x1,
-	DPU_DATA_HCTL_EN,
 	DPU_INTF_STATUS_SUPPORTED,
 	DPU_INTF_MAX
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 1d56c21ac79095ab515aeb485346e1eb5793c260..8f9733aad2dec3a9b5464d55b00f350348842911 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -237,7 +237,7 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *intf,
 	DPU_REG_WRITE(c, INTF_FRAME_LINE_COUNT_EN, 0x3);
 	DPU_REG_WRITE(c, INTF_CONFIG, intf_cfg);
 	DPU_REG_WRITE(c, INTF_PANEL_FORMAT, panel_format);
-	if (intf->cap->features & BIT(DPU_DATA_HCTL_EN)) {
+	if (intf->mdss_ver->core_major_ver >= 5) {
 		/*
 		 * DATA_HCTL_EN controls data timing which can be different from
 		 * video timing. It is recommended to enable it for all cases, except

-- 
2.39.5

