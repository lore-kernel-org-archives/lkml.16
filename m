Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD00F28C841
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 20:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747773900; cv=none; b=fmoq4PUsx3oTiyVyEkClx2vya2K983dB/fLZ6g9uIJmYU9UeRSj8u+3o2JxFRmRtSewLyVhbJRjoc1HPL7ZIEL0XvLWggbg7sHrib+TUfG0D7kuLGLDzgnz/f0KnrRYS5gG5/ZHSedn17B6aM1DFOux5ujSmhkSQ+0tr2Halgfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747773900; c=relaxed/simple;
	bh=fX3LnzT2rmBafYy+QSdGUQeHRA967rMH44ZJQ5KxcQo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AgMkxtaXC/CcRhHv6sJIXeJJnhFLzPxNUKfkPzukqwRA+S7SydxxhULRYjRjAk4nM3Lxel9ljojxQGjKCCrEyI62XIjAqhwndp7pM1dHawQX7igp/7TlQ6KCAcmP1dxq9SUbHVCf4uWV246XuEjQHL5DEsANcFjl+9Vi/nfbqI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bqeIfzI6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bqeIfzI6"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGdb4A031948
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 20:44:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ykPlUua1WYJOj8gRH4+W8xOqCf2Wt8uktxwJQmda3VQ=; b=bqeIfzI6O775RuX9
	XEgANszm+qJzkfQrZA3KYborl8uhrcVVj7Eg/e4CGQ9prJkt+SjWbhrrBrwCLGuW
	/p7FkazLnkV5ThJYB4slpamVeZF/RIxhAVbmbW492wt34VyrPi/jh8dUL1kA6HYc
	DXmx3mwqFIyhbxCkwYb/KeeHS1mnt1/ibX2JsumDUXgzvYoD42Q0XFfoNssuEJdA
	yn4K5nxeESVgo8zQqBMiy9VQqrkjpkjhynxrHFB4gDgwF63uaetFniueJekZ5OTj
	ZdPul4yoexnADtMLaS7A8A/rsNTFOyXkE6Vncq8eeME/A87MWQZPWz6YiDzUygMb
	sDdbAA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf18kq3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 20:44:57 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8c2ad9cf2so71160156d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 13:44:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747773896; x=1748378696;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ykPlUua1WYJOj8gRH4+W8xOqCf2Wt8uktxwJQmda3VQ=;
        b=hvRlgnBCdYMba4YmdrUWV4n3U4ERZvijefuCe9ukJhVxCc8f0FfIge1puQjIORI/DS
         1akogmHJQNd08rqI7EW1Rv6YR9sVeci63MfefAi7myauflEuE/+3NOKCOKEqvYlQs/Hu
         ui/B3wA/g+BBe4v5EAbsjoY6mugLA2jtCWUFqokWIxsST1P56387sRT1LcgORaJi0Zl4
         G77QVzAGW83a8YLWWgM95OhvHtsy8KuU42BAuFdQfumaaIHECWv1vjTXn4XfCgcXYd++
         LGC2ffKaMKlFtGAIQMSnzjJxJosj+vibUc5/Zr1Uf3EoEb7CKT9+pHJMfHYAGCJyzoSO
         z0GA==
X-Gm-Message-State: AOJu0Yw3WdCDSQpq3DWKa0kMPfsZ4dwI3I5R2X0F/P2JtGk6kD0H4/rf
	R3DLMQB2O+8xcXiBgTv+wU9jL5M58oEBYl1x9wg3yOSa2C80Gr8RpXedM4a0WuVaBRSZEL0pJD1
	MCKNN4+z+g0Lp6IMPzE13fk7UTrInZSyZzqEx6tnZbFcDoD2cL5tgd6ytiSSErSTJwGg=
X-Gm-Gg: ASbGnct1RZQ67lXixhMbyc4NQeM0+fqQExNF7sayhAEhxFNtwZjBx2EGhKtn64xg20l
	Xz7YW0GV70yIfuof9gZ1C+DYGs819vtk0H/oXECTJCWBKRaxDmasHIvxnyNtFz9JHIpqw/0djUy
	XjIHwKbKHBx2cctfwBLzs+ZitMif0j5q1SC3De1s/rW0Kbhpk9FMbhWVJYRDEjN4vRWSILhmWJM
	kcGZK8RpTJEdLibav1CPPPFMtjWlWru0F0Dg+giPPvZPILk3u8i+rixSnkQXP1iX7ngeno1GkQq
	fLSIzVxI+yId2D+VYFg+QeIY2M0YF92uDLTh20WgbrFbvo7P3CStEVgbXxKc5/SgQ9hZcafqonk
	/ZBtDDojtJdr0qxklEoOxpg+/
X-Received: by 2002:a05:6214:1cce:b0:6e8:f4e2:26ef with SMTP id 6a1803df08f44-6f8b2d853a5mr303605746d6.31.1747773896228;
        Tue, 20 May 2025 13:44:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExse+TXH1VriLP4f0U2rBvd0pIcWTRd0DsJ4Y79tLbGTK08qfgjRloMVmoV33Gc93nL2+Brw==
X-Received: by 2002:a05:6214:1cce:b0:6e8:f4e2:26ef with SMTP id 6a1803df08f44-6f8b2d853a5mr303605316d6.31.1747773895791;
        Tue, 20 May 2025 13:44:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f163ccsm2497950e87.39.2025.05.20.13.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 13:44:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 20 May 2025 23:44:44 +0300
Subject: [PATCH v4 2/5] phy: qcom: apq8064-sata: extract UNI PLL register
 defines
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-fd-hdmi-phy-v4-2-fcbaa652ad75@oss.qualcomm.com>
References: <20250520-fd-hdmi-phy-v4-0-fcbaa652ad75@oss.qualcomm.com>
In-Reply-To: <20250520-fd-hdmi-phy-v4-0-fcbaa652ad75@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-phy@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3088;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=2R5NhT4/9vDNb/+f8UkhB7hzE5bEH/Asz87X2bNQLwQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoLOnAdDwo49oDYbS1+t5ukVG1d9uFbRIxpBN+H
 Tz8Z0JgZ+iJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCzpwAAKCRCLPIo+Aiko
 1XhcCACv+if9OWNeFEos1mVk7rlmiEnK1NhPAIrFf8t3Q2zI+I/VveqtxklSEp1Q8Iq0ggj3NFw
 junUhBnk6cLbZa06b6uxSaIwKd9GbYwSX1ysiZjwHunNJy3T3mW4YXRPF1HLVYirwIgJNGhumoN
 Gm1pWzwUWCVhYUEGkxtbJMQeQERwFdmvMBSa1gfgqNjWrVNHGio+VS7egsjwgC3QJiyqZkTA9tU
 yVA3DWtsoEhmOuU4AiBK295kU1jCA47DWuKhSwU3EO612CPAsAhtM6C3qT1xK59vNtPrbYoxN8X
 ZTEF4T5Y3rAJ4VY90TbNdqxK2m1mY59Ar+P5ymM2uzFl7+wu
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: CbVe9G9piSFayTHr1QjejqswxqAfIzyb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE2OCBTYWx0ZWRfX5s7Q3n1lwAGv
 biN1pDR3owN0suDoSKmHt0dDsVlWC3k7lAax7y0CqD/ts5SJXhB3UOcvQ2tYa3m3fPNRSm5+5x8
 xxhS/xYRg3z4XpOV/BRrxTK7IUGpR26NwPqf1WAjzNJwY/6ZETjRj9jo/Kr707g71k+XDhxdRl0
 EhjwLRbT7tUljnAQ/JebE+6cK7BaAH2CzRLvXFhxYXwq5fJ1+dMfPKpZkvDdjQEMf8+5+neG/jA
 J/EVerYc90RL5LWWVniwdzA8ylOFlFMPSEUSSoTtlkRRuqv9N21U0T/5d/TybWoAPNmpNX7uu1/
 qxNxYZaHXcm7zFn3Y4cp+8qy+LNJIU7e2Yu94TLW9Pjj3VjavtsX+HSB4XuDrmC9eTsboqVT84U
 oM1ftXU1JiMdfv2SLI1mCoG0HTSFtDbbhPDIhlxnxX2cocl/BiXDvl0BdPtHXjJ8VRfM1ZR9
X-Authority-Analysis: v=2.4 cv=F6JXdrhN c=1 sm=1 tr=0 ts=682ce9c9 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=O3Nj34nO-tYaQW5E_hgA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: CbVe9G9piSFayTHr1QjejqswxqAfIzyb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_09,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 adultscore=0 mlxlogscore=806 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505200168

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

The "uni" PLL is shared between several PHYS: APQ8064's SATA,
MSM8974/APQ8084 HDMI, MSM8916 DSI, MSM8974/APQ8084 DSI.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-apq8064-sata.c | 23 +-------------------
 drivers/phy/qualcomm/phy-qcom-uniphy.h       | 32 ++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+), 22 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c b/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c
index cae290a6e19fcb7fd68fe6cd0229b9b00d47131c..dd9929429f9a0e2f265180e8d3f390451d91adde 100644
--- a/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c
+++ b/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c
@@ -15,28 +15,7 @@
 #include <linux/platform_device.h>
 #include <linux/phy/phy.h>
 
-/* PHY registers */
-#define UNIPHY_PLL_REFCLK_CFG		0x000
-#define UNIPHY_PLL_PWRGEN_CFG		0x014
-#define UNIPHY_PLL_GLB_CFG		0x020
-#define UNIPHY_PLL_SDM_CFG0		0x038
-#define UNIPHY_PLL_SDM_CFG1		0x03C
-#define UNIPHY_PLL_SDM_CFG2		0x040
-#define UNIPHY_PLL_SDM_CFG3		0x044
-#define UNIPHY_PLL_SDM_CFG4		0x048
-#define UNIPHY_PLL_SSC_CFG0		0x04C
-#define UNIPHY_PLL_SSC_CFG1		0x050
-#define UNIPHY_PLL_SSC_CFG2		0x054
-#define UNIPHY_PLL_SSC_CFG3		0x058
-#define UNIPHY_PLL_LKDET_CFG0		0x05C
-#define UNIPHY_PLL_LKDET_CFG1		0x060
-#define UNIPHY_PLL_LKDET_CFG2		0x064
-#define UNIPHY_PLL_CAL_CFG0		0x06C
-#define UNIPHY_PLL_CAL_CFG8		0x08C
-#define UNIPHY_PLL_CAL_CFG9		0x090
-#define UNIPHY_PLL_CAL_CFG10		0x094
-#define UNIPHY_PLL_CAL_CFG11		0x098
-#define UNIPHY_PLL_STATUS		0x0C0
+#include "phy-qcom-uniphy.h"
 
 #define SATA_PHY_SER_CTRL		0x100
 #define SATA_PHY_TX_DRIV_CTRL0		0x104
diff --git a/drivers/phy/qualcomm/phy-qcom-uniphy.h b/drivers/phy/qualcomm/phy-qcom-uniphy.h
new file mode 100644
index 0000000000000000000000000000000000000000..e5b79a4dc270f25d8979f51bf4acd6c76998032e
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-uniphy.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2014, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef PHY_QCOM_UNIPHY_H
+#define PHY_QCOM_UNIPHY_H
+
+/* PHY registers */
+#define UNIPHY_PLL_REFCLK_CFG		0x000
+#define UNIPHY_PLL_PWRGEN_CFG		0x014
+#define UNIPHY_PLL_GLB_CFG		0x020
+#define UNIPHY_PLL_SDM_CFG0		0x038
+#define UNIPHY_PLL_SDM_CFG1		0x03c
+#define UNIPHY_PLL_SDM_CFG2		0x040
+#define UNIPHY_PLL_SDM_CFG3		0x044
+#define UNIPHY_PLL_SDM_CFG4		0x048
+#define UNIPHY_PLL_SSC_CFG0		0x04c
+#define UNIPHY_PLL_SSC_CFG1		0x050
+#define UNIPHY_PLL_SSC_CFG2		0x054
+#define UNIPHY_PLL_SSC_CFG3		0x058
+#define UNIPHY_PLL_LKDET_CFG0		0x05c
+#define UNIPHY_PLL_LKDET_CFG1		0x060
+#define UNIPHY_PLL_LKDET_CFG2		0x064
+#define UNIPHY_PLL_CAL_CFG0		0x06c
+#define UNIPHY_PLL_CAL_CFG8		0x08c
+#define UNIPHY_PLL_CAL_CFG9		0x090
+#define UNIPHY_PLL_CAL_CFG10		0x094
+#define UNIPHY_PLL_CAL_CFG11		0x098
+#define UNIPHY_PLL_STATUS		0x0c0
+
+#endif

-- 
2.39.5

