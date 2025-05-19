Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0498B28C00E
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747670724; cv=none; b=aEoVM/1qyOjvHvPFovTj0EUwPppwblkWBmyjD4lHSplwIJ3MQv70PFmw67Qbm+T7sDYTUFBOv7efq2xBpEacW7YmuOBRRyvJRFJiwvaSLDlIWImw4wWFrhqKqNgOotjdaz5gvyJQ/4/JWm/xLb3A3alffkE7GIfw5iejdaQFZFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747670724; c=relaxed/simple;
	bh=6IJBiuFHFdT/qK/ZNhpN98vBXCMeU2gfknfyhqpu6MI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fg51ZnG1fBA6CXM5Khd8k9QDwEDRYVhjGGicMWx9F0jD/FAnLynsBMNvgvQ82ILKZuDfB7C/AMyqpQQLzRnUtJz4Usggy7GVcrSRZr2k9sL/7ivl0pbsqVJVedEwNIm9d1/8CKUIbJOZunSIPjGjEwoJyqPxpArvh9vmHRFRHLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MlCcQVgr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MlCcQVgr"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9RTcP020427
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:05:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aWCYVrEOdgn0YXXrxgnbqeolLsmmtMUaNpkzWfiOXzk=; b=MlCcQVgrCh/zQBVZ
	p1sMHcEbsFpAUzSwCWUndtM4MVuAIJ1hD6dQ2kWqaG3h3ZPbJFhM2p7g/d7dW3Fh
	67Do7yKIor3TP1c42oIO46GwA3BaNWNcy3WgISuypR2EP6Y0RdIEYfN5slf3mZHi
	YsbygYecViZEJpe7lZj5YYfW8oLwd2Gjam+r803wrpkvHMenygZMDz8lYfqF6TUK
	f/mXQi5ZGEPf6oFCPlpNcnYC7Z3ydN8+C3voLErQ5Bs5QXlE3+YKaMoyKxzTzKf/
	zm7gNTvOWWWL7PNYawgEH9S0BbjlbE1eMhPKVz3evRLvWk6fDYwRp6lqkmi9+Xix
	vFdVIQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjnymxw3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:05:22 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b1442e039eeso2872636a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 09:05:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747670720; x=1748275520;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aWCYVrEOdgn0YXXrxgnbqeolLsmmtMUaNpkzWfiOXzk=;
        b=opBHi2Y3Ea2ikXI+z/MxbOtKADQBy6uLgwuyV6p8WkMxxO2OCoQypbO2LBrEgdgjDJ
         SKzrdtICPxo3LPAbTEwrNMlL8pGJkz2ed6ekgfZv1p3SznbvIZ4KKRvtlTAnVhamo2he
         ZzORSHFmrdfApxdXxTKpbuDJxuxYeFadm2Tu705RnyG+LFsrgJvJZnRLDCOCgFZ7kY3X
         oP4SM08ID+gFk0DdG4DzK2meyWegAzaIiDZZRqFrpr3hZdqioD3twYQ50dnW8Yz9m/0n
         NLxhMsN/nxDCzBll1i/UDq/GDGsM2nOPBsxivBfpxxsc8tEnw+DAyLhbXdqTxGLYLC6O
         wVhw==
X-Forwarded-Encrypted: i=1; AJvYcCXlIySeIMTLHvdeCNthscoU+NTnHFg92YCO8LysSGCUwfJWSstyzd2HlEm5XKvxfkHpnG2XutNZEz17EzU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5VYZu09TxJGW8O0kn6SN2Q7Gsys5KWFP4duD7/LiHy2CZB7Qd
	3Ar2WE2C3N0Qm4qqqSfePRE/PIvhBJ3lzqs3PKAtquI3DBcDW3OnsXhxI/l3DV819xkdZnycKkR
	0vyxfkSsArpIYXFRKZxIcgqdK/9DxXwuxHIwtYd7LOz16y3L/DOyHoQemaSLIvr4IsH9bewfq5+
	w=
X-Gm-Gg: ASbGnctJwrIf82n9H90upK8gozebpj7OUki+woEtMokPQSz7OJbSgrWM5E63ld5mDXY
	P/Z10r5xyLTwQTDLPJP24MUgc1lsuNUV8J+ZkCGsXZp0uttp0HMmGV/9oX4dIyWxCXikeHgplJd
	+3G8N/CKVyTl2IWMFmCeRKgd5dSRXbHBjHqnntlQJH2+23+7DhVHQdlOuRILj8Bm+HSdf6Fd6MZ
	HEoF2xdD7jqxkyy6mn26Brl5VShx5PxsJMCyHV64ZtjaLp1VSpv6xe7gVj3hdvNwmUjQ14xpMnj
	Xj2u6d4ELjK75ZMV9VNMz1S3UJbl06nZ7Xumso42ObRurKQy2ik31ZvVZqkt98o8Wg3UrV3wAIy
	Xe7IPtxsPaEOzBJoKrTjIMOYv
X-Received: by 2002:a05:6a21:9183:b0:1fe:5e67:21af with SMTP id adf61e73a8af0-216219d18e0mr21996853637.30.1747670720442;
        Mon, 19 May 2025 09:05:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRGw+2xgpgtgdFOPHQKkmBXnPLv9iv9BYNbokVamaYo0cwZzI9+rfZEq7etlPcP7JKFvfusg==
X-Received: by 2002:a05:6a21:9183:b0:1fe:5e67:21af with SMTP id adf61e73a8af0-216219d18e0mr21996802637.30.1747670720058;
        Mon, 19 May 2025 09:05:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f6f1sm1919378e87.248.2025.05.19.09.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 09:05:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:04:31 +0300
Subject: [PATCH v4 29/30] drm/msm/dpu: drop ununused MIXER features
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-dpu-drop-features-v4-29-6c5e88e31383@oss.qualcomm.com>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
In-Reply-To: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1119;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=dxmFi52JXvJ1CCkpTL5KufBplkJro3M21X2ntMDmC8s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoK1Z+0x0FUsHIrIe0Eg95z4tvJvjpvHMbEaErh
 VYR6GD3cX+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCtWfgAKCRCLPIo+Aiko
 1dGBCACT/MY/vz/hMHTlHhFJBlS+WzI1JAEi0dsryovjblh6D5tWPLnsfC1quu2IqIb+e0xkrKu
 cv0NJxNDDZFC8wPMMdvErAlhZ9IPICyuhAeGWpcSKRqxUiIPkhjYfVmYeZs6t2tgh4ZYvCl/Atk
 WsRltJdOxYgLGwEiq99ie+NLyqGPBQ1TS6INtkAToXrCuzWDG5Q8Rk27eobt9dT3Aq1Sozfd1QE
 3LVnBTyL28x0VRyIlIC5JpicKU7FI8v/D/kJawLOCcQie4QbyKT/+9CPWjreSdFYPlF4ti9S8PC
 OP/xhMBx7cTX1vxSfTXqXqAgqId3jZpDMMmsZ15ELCbIGYbE
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfXxc6oH1THligh
 MAOJaPXtB1RSwyn1iXDc+Mvp3UU8qstUj4T/xIsIJBPPlJ5vHOVxq2KRMKhuyJsjFvZ1TzVKOEj
 wrVxEPpgTDv0rGvLryZ8IDYYrGZs+54URUbnLmt31fXlBFYrPLCIuVs7l8rh4LRGxhJGqAomOVr
 fDVsDItsXcVXXLWKBurBiYpNrQK/qvbITQUu0wtio3riZjGtFDUYCOGVYPWhU5Ti2Yl7U/CfEmM
 I1TbV+vBs2pFauVbZ26VBYRzaoH7w1vhuZSdLD/qirUF5nnBAAvKXw+7VfzlgBtNk6zGb5CZ/Hk
 3Dj8+4FLZUWPNNOvf1omWWyEXBCGlNSzXy1K7UMJpw/LydJ7b2t/rmBfFlRmAzctzNKspgFZpKo
 sEojWfKwnzd6EpSIvvHRCvHflRQ8/kqohGbTMAF0xW5qTxRwpdNZDBJY3hylKBYqF2jwQGlP
X-Authority-Analysis: v=2.4 cv=Z9XsHGRA c=1 sm=1 tr=0 ts=682b56c2 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=87smWpNc5u_ETeg062IA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: c_8iZPL04zeF0NKMd2dtyutnDrG6E1B_
X-Proofpoint-ORIG-GUID: c_8iZPL04zeF0NKMd2dtyutnDrG6E1B_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=902 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190150

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Drop unused LM features from the current codebase.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index c1488a2c160b0e2ab08243a6e2bd099329ae759b..d51f6c5cdf62f3c00829167172ef6fd61f069986 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -66,16 +66,12 @@ enum {
 
 /*
  * MIXER sub-blocks/features
- * @DPU_MIXER_LAYER           Layer mixer layer blend configuration,
  * @DPU_MIXER_SOURCESPLIT     Layer mixer supports source-split configuration
- * @DPU_MIXER_GC              Gamma correction block
  * @DPU_MIXER_MAX             maximum value
  */
 enum {
-	DPU_MIXER_LAYER = 0x1,
-	DPU_MIXER_SOURCESPLIT,
-	DPU_MIXER_GC,
-	DPU_MIXER_MAX
+	DPU_MIXER_SOURCESPLIT = 0x1,
+	DPU_MIXER_MAX,
 };
 
 /**

-- 
2.39.5

