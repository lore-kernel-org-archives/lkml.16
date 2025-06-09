Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE131217654
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 17:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749488691; cv=none; b=PjuvNQSIT3pS3Nl59birq9CZzCOg9iuZZAt/Q4nswhR+41YCSp5TkoyjNW6VWUgwa8gDkomm/R/z8X4D4s9j4APJjviEskxJr6yd78qYuZ+/3RQjkg131xdf79rDO0NiVl0gzFYiY/PlRMKxpqrKOw7O6kD/Cs92GEvZlsEn1ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749488691; c=relaxed/simple;
	bh=hqqVwI2DtCjfh9orO/cac6PjLKpP78bMvl+SrAmC4zM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sePmv2z1/CvWW4C81vgh49+xXeOL/EaRFOIcjbaEvkz+A4s7CfZ7tnYMFXBdG4cTT/4Kkfb1qG8ZJXxGSkLCMRwd84jJbdr5M7pZx+0eJPoQE2eTPAcUD+YjcXuViKAKGLifL3LQHHIapSmYvnI8xJvR+4DSFdajyttUm5xSXdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DFmIYHui; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DFmIYHui"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559G2xn4003755
	for <linux-kernel@vger.kernel.org>; Mon, 9 Jun 2025 17:04:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=F2gwz9xWCvt
	M03RmugvtKUkXIvbzjxIu6DI5yEMCZHg=; b=DFmIYHuiFIm2j/q4DYDF2lOaPG8
	vjM9yH/w87pXIYloXTsVEv6twpb0jWJTThbJ5MI5E0qF62wKbc9U7Fp0TDtjRWLc
	wCEEtwHQRq6vpOJx6QP1AmbYLKWCnG9k2IvJ4TuLCy8ZhifcLUjKNQxj7pVJwbYP
	4Yegyxruw4YrAtOdmVGWabtnkku3OHKY891DhWSrI44pGjQovrwAIGino3cb8xWB
	DDhYSlIbQB0U9CXFbyd3t0/nctrNrKfXZ5voRuN1SyCpELXsjGJ2PDqh8lu2tJDP
	9X+JdtTE1vu6G8XfCMatQ9gTnWduivB6yBJFxKfvtkLVbqz+joXoCu5Heuw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2y1f61-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 17:04:49 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2358de17665so42895095ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 10:04:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749488688; x=1750093488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F2gwz9xWCvtM03RmugvtKUkXIvbzjxIu6DI5yEMCZHg=;
        b=iCg86Mq14F0ylPbgi2lk1LnF12M9+MWkY7wMwtV3ttKB3bOkov6IrxfXoHQzcBmR1J
         j1tCguGRt5n4xLR7aUaI9KJWrr7bopedUZT1V0qvTbthSUvqeOlIgHr7A50dJbWMKg1k
         vvzG9l4AHFcPtVUmBBYrDVx2Ah2u0EyqEEfkzv5me3ULfg4Lsx77ov0E99KqFdLxY4Hk
         ps7LjyFtQxC0iAbAqwiQMnIutI2S98F3NThImzirBTJr1kN6sb4B+oG0KBLQp/VpPIJL
         jzovQfXLpDS+zv1E88TsDP26iNQ6giZt/jHww54z9QTIqPVIjqzGAMKDwVboNNAJN88o
         QdVw==
X-Forwarded-Encrypted: i=1; AJvYcCUNHCay1x7g1GFSER37bq7Lu0g6G0tRkofjGNbj2kww83+gnEbuyxriH/tchMwsa7wPjzHuE1Y4e3xlFAg=@vger.kernel.org
X-Gm-Message-State: AOJu0YweX586OVWsHO32k6zpX6A1SR0fKfJ+N3dE1TJ2juSMrGV75fJS
	VD2b4S9DiCmHouCnD39Cogw1coTFpWDUaN0SpiH7fFuN+95inloQb9cEpXXIqMff8TRACUPoRNh
	T/CotHglshoU4OGWviWeIjsUJ1An7tdSHMpdJ2WUeEyiII0tkPc+yaPzvIECIoZB7Pis=
X-Gm-Gg: ASbGnctxQX9zGlh0MD24PEckKDod4Ane1+1s+pAwfPIsrf0j5Wm3iFibLbUSenNFv5I
	k8VFoViBOgSei57F0i6XYS6pFUCgFdOVMYmMzckNCy/COiuks6Q5n0FVXyfseURl4uigCQqXHaW
	nUbkXXNRJiu6xTiJnOKqZGW1DlgvmRXbcml0gImYjSTJX+PAkmOaC/V+8izhrDo8fGXO9AnY2XD
	7Tvi5ZvbDSjB+utVVQVbxb1Bq62FDpTCswBzS29HDhkhYTfAI2YNpx9VHWgCn/kfUYdfm3qga6e
	doBNrSkN2cYu3woT2kJh4fVndKI3TpPK
X-Received: by 2002:a17:902:d2c5:b0:220:d257:cdbd with SMTP id d9443c01a7336-23601dcf348mr200552555ad.48.1749488688248;
        Mon, 09 Jun 2025 10:04:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6Cia52Pz9TP+vPUc/qxfkyKQnpKKCfw3Z7/NYylirl2PJBjN0RgEB3Shvrl9SsiqWE2h2gg==
X-Received: by 2002:a17:902:d2c5:b0:220:d257:cdbd with SMTP id d9443c01a7336-23601dcf348mr200552095ad.48.1749488687819;
        Mon, 09 Jun 2025 10:04:47 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236035069f3sm56821685ad.231.2025.06.09.10.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 10:04:47 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/3] drm/msm: Rename add_components_mdp()
Date: Mon,  9 Jun 2025 10:04:34 -0700
Message-ID: <20250609170438.20793-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609170438.20793-1-robin.clark@oss.qualcomm.com>
References: <20250609170438.20793-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDEyOCBTYWx0ZWRfX7c0LAbCASg+G
 Nj1g2rUN0poJIqsxCZPp4NHrYpTHgkzEMvKtaUE9ToV/2uzmrvloi/3M9X5HBIAsX7/B30DJrbn
 k//Lzy+WP0PQTqQQZLdMgXhPCXotIHo1sTLBzH/cfBtRGg3yCEbbFS5Dp5H1kamK3fggCO7ysIb
 /+aatu+4va1dqs0iheLcdgTyue50ArJoJoTr+hCkkwlIaNOkmy+HBrMWbxBfxz2Rf0mQjSlMI5q
 XooEsJR0O+5PWQQ9JFC99SWOS47sIqSp8E5PznI6Fz971vc2w7hIMncJjU1ousT1puliB7QtmfS
 t8SefSpXoK7sjQDJiwvmB1i/QLIvIxA5KDiQ+4VZDiiQaHmPgs9cI24pp5zGIWV07OCM+gB9lTF
 VGtcQ3sfsqypz0NSKeYJZH5x0rtjG3zHC8e4NIycE9eCn6GtATtPojyWZgsgdBwWqR3Bs6uq
X-Proofpoint-GUID: XCMVyzYIKoOJPa4JmwsEItEUore2DlAX
X-Proofpoint-ORIG-GUID: XCMVyzYIKoOJPa4JmwsEItEUore2DlAX
X-Authority-Analysis: v=2.4 cv=f+BIBPyM c=1 sm=1 tr=0 ts=68471431 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=vt6ngUXDG6_mDpkR7fcA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_06,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090128

To better match add_gpu_components().

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 710046906229..87ee9839ca4a 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -852,7 +852,7 @@ static const struct drm_driver msm_driver = {
  * is no external component that we need to add since LVDS is within MDP4
  * itself.
  */
-static int add_components_mdp(struct device *master_dev,
+static int add_mdp_components(struct device *master_dev,
 			      struct component_match **matchptr)
 {
 	struct device_node *np = master_dev->of_node;
@@ -997,7 +997,7 @@ int msm_drv_probe(struct device *master_dev,
 
 	/* Add mdp components if we have KMS. */
 	if (kms_init) {
-		ret = add_components_mdp(master_dev, &match);
+		ret = add_mdp_components(master_dev, &match);
 		if (ret)
 			return ret;
 	}
-- 
2.49.0

