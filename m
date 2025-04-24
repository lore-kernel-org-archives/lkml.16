Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E77221F14
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487046; cv=none; b=Vaktxi2hczyVZm7ENu81XwGSVi21F9t84wUNFLnbBgQbxaCq2wfY1yswaOM9sV7bHA7iHBU0SU8dI7P0+kap4NgZxkQdXtz+8enejZOo0Tqpp0ntG/nWgErPDmZ3Bh1ECHGbNAcUx8VAQXstYPu3E8tDpFhWsVwrl6RCfqNY44c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487046; c=relaxed/simple;
	bh=4p9sBWIN8YkcJelXyV+UcMZ45sgycQrXYsSAAZuvWu4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OGbfRVaJiiCOlOJGTJI2MSFYs66BhJOg8F1jc3vIdyIpyrYiyX9yeJTednLqYNC4URxEYwZ+Zw7gUB2NbD9ANJVPmjX9ZF3TnEZplRRnsnmJSvTNjRReFWquNY6PTA+s/zlnti9+Ry4REpbKoxM7O4nBazwDkWD7bMgUXpkeoj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GdOFmMR2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GdOFmMR2"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0FBB5009006
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:30:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3h8IwCQygULBCYKUzhqZAZ0C4RUrKlRlSMDkS+Z3mD8=; b=GdOFmMR2dRM+TZyp
	glkhuB9JnKoiX4WZbUocXi127fgxsHI9BBa5LCyygPe6fkHgmIrJGdyUTS/it/iA
	ZNw8SBjDeFpKynHrkfdO+GaGro2wPZK3PsGdgf1HnncWKb2txEc+cb5AZwqf8Ep6
	qSDbxnuJQjcdulgUb0YYtpBbmJsmx8BfZThJTNRFV3srR+4nKmNgjQjvEQBouBWY
	5ukDgk3pNeWNvwzyVK35E6eP5Zg8ARcxP9AlURCpnEcjg0cJNOwYK/km4jQjujPe
	uiadU50Ba/fDt/zWqdV5fQ2MntkI6NWvtNc3NU70BK7alx3h3t1pCExX+urdSAIM
	J4nDsA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3cxx1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:30:43 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e91d8a7165so14296836d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 02:30:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487034; x=1746091834;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3h8IwCQygULBCYKUzhqZAZ0C4RUrKlRlSMDkS+Z3mD8=;
        b=gCG/botZDmQ0/zIEJ9QBdRsKEAQeStieFtjEGmgPLhp2g7jGRFzCaOxUltyjRmRiBw
         q2o1a0ZyaMKWg80ZvOtZKW28nDNY7fCG9chn+eG5WWCyuLQbfJe4xAucrPUFfuZZn6qg
         fJe8sXPSStQjrF24V5Fukhpf+kIE2UapX73izczC/x39QVUiKakBIY45kTNArMoHqe1F
         I6F7LQa/5VaBN1l68xJDDyTwRYc5KwX/gmxHQe9Ky4YpLeKr5anOn2kiSLY/xfDpOHbm
         FT0ENJzW8/AyyJnJGNJJ/siAm9DBdzQ4WeiUo2rM5OyrG7wGvFW0x6qkXkKql/MRwlU1
         Rlgg==
X-Forwarded-Encrypted: i=1; AJvYcCV80pfiNIvSw7gllKSrlZSimVZ2znwkMlwuJxMysFsnedhVdt+/mfSak/qDGBXZGdmWdXvaG9sI3GR5JZc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPAN2yFbH/lQUvKQDw5ZJ3cbXE0A6PbxPmztP2b/9qkeYS9qkw
	qITsJqQxXwXRueU2AyivnJeDYV/VpJ5+YLKQS3z1+v+t05FMtV5L4hyr3Vg9PyghBEtp2GLcALB
	kT8AQvuFCI0h618uSwkFujOds6Ei/xPLbgCPdMzghK4Iev/Y0k3ufriTBOAkTeGc=
X-Gm-Gg: ASbGnct58LwUxaEJ3t3M/s5uGoDkR1vD6UMTNGMXq/peipK2Fsdi5lUJr/gjZ/yclw2
	242KwlMPQYoA6SxEXofs2F5uZtu6IHiBSzK4VHmwWbyIDYy2ARPQ3mLdrON5x59kdu/+iAYEgbe
	NDO2YwsAkyOusYz5r7qiqMF5aq/IaOYlGX76xPVgM+qjkgEwFku583u29VtHhnAuub/9oznKmT6
	QAkWUnD/mpDlaRePoCKRqddNFQC2DjnhMmGNknXmjqovugYdKgtKrey/IPBAMDGD2pwBtIT6rgT
	4ATY4AY51dzciQUG5EKtFChNE0at9Qrrl2v7NX0yGUpLOeqj3rHcJ4PyEoIm7TGxYoZGgQxoM1+
	r5glO9ZiDQXKHuiks6PrK4LlG
X-Received: by 2002:a05:6214:190:b0:6f4:c2e5:9dc5 with SMTP id 6a1803df08f44-6f4c2e59fc6mr12091996d6.44.1745487034049;
        Thu, 24 Apr 2025 02:30:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYiPdy8b33rsIWhjyFiQzIakpdZn+3nbe9+UAF3x7yXZ+JZYFOs7kqMnbbBxaZc8zFD/lqsw==
X-Received: by 2002:a05:6214:190:b0:6f4:c2e5:9dc5 with SMTP id 6a1803df08f44-6f4c2e59fc6mr12091676d6.44.1745487033547;
        Thu, 24 Apr 2025 02:30:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d1b9a304sm1820461fa.99.2025.04.24.02.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:30:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 12:30:09 +0300
Subject: [PATCH v3 05/33] drm/msm/dpu: inline _setup_dspp_ops()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v3-5-cdaca81d356f@oss.qualcomm.com>
References: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
In-Reply-To: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1344;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=TzajbLeXFeWcm21J+7IjoKJq84HYxMWKTI0BXOLnjkU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCgSqIqH1D8iy9QmolQ3g4lkccg43SLzxBrGRz
 ZKYMKQ4OPuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAoEqgAKCRCLPIo+Aiko
 1YI/B/wOv26Yb4VFOEtRUKCRC69FKjk/WGSbZOZIhHasZ47DuPlZbmNbEoWj3roPkKbSqrb3uPH
 NOpCq5/ldcFkEgylrt5/V0ZjR6bLB5HuzX4wXuxWTnURrHP19zd/ELzooZaInwfVPG+Hc1/idn6
 ol84xTej46Af/zW3INNdYLJ0JIEA21ZN29TOb4JxBvFdTzKRT+kv4c25lx7IH+1jDHtKQWVBygH
 bWDJyKfZi+ZEEuwdwcOc1lDE8NVWmm+krlQISZ/DhLGX1zlkx3QqzIDxdLkYkyjT8XwibwAM2u8
 mYX4gdn+arbBz8u+PniC13dEB1hynNsB04Yzth2WfFOPhsIA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: VFC4A0aV_fJRHM3xX-C_uf-Su_hLb3N7
X-Proofpoint-GUID: VFC4A0aV_fJRHM3xX-C_uf-Su_hLb3N7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfXyU0mba7RZcj6 O+GMcQ9830Uk6ctq7cLGIaqiFJoQ0v4MjIEzE95jM38gtQ542e68mX50Uk96GUpm3vxrJ+CHnOP AWK4IiaRIZM7OsepqqdtPjw+evKJMHQ0qU2zwxa0LoBaBlJebSisYYBu16T8t3bxT1Sau26lWVH
 G5uIOfPgfUqYuXxqe2/NpnlWUhfey6y1W2mjQhfB6Et45AWVkxb3W/ZxzOKxByy+3yEf4pmpamE qLxSdViW6UdL650dfxOX3MVrKBxjCwA5b73dKUuQ9O7HxKSFU4KkpOLgPVzcA7QN4C6smyYHZl8 tpg0Zp8K3Enxoi9/r/q0bAuXtVFl10PAo0YePVenrF3N3On9CBWfT+vBATbLzE8WqItlGHxD0pT
 I3f/pD08sB5+I6A5ov+J6NVCI6NO+vDf3AqzlmbNH+dC6lvS34x6j1PJw5H2Mb6Me0+UoWCW
X-Authority-Analysis: v=2.4 cv=Mepsu4/f c=1 sm=1 tr=0 ts=680a04c3 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=ezFYmCdhRMHQQexkQpIA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240063

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Inline the _setup_dspp_ops() function, it makes it easier to handle
different conditions involving DSPP configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
index 829ca272873e45b122c04bea7da22dc569732e10..0f5a74398e66642fba48c112db41ffc75ae2a79f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
@@ -63,13 +63,6 @@ static void dpu_setup_dspp_pcc(struct dpu_hw_dspp *ctx,
 	DPU_REG_WRITE(&ctx->hw, base, PCC_EN);
 }
 
-static void _setup_dspp_ops(struct dpu_hw_dspp *c,
-		unsigned long features)
-{
-	if (test_bit(DPU_DSPP_PCC, &features))
-		c->ops.setup_pcc = dpu_setup_dspp_pcc;
-}
-
 /**
  * dpu_hw_dspp_init() - Initializes the DSPP hw driver object.
  * should be called once before accessing every DSPP.
@@ -97,7 +90,8 @@ struct dpu_hw_dspp *dpu_hw_dspp_init(struct drm_device *dev,
 	/* Assign ops */
 	c->idx = cfg->id;
 	c->cap = cfg;
-	_setup_dspp_ops(c, c->cap->features);
+	if (test_bit(DPU_DSPP_PCC, &c->cap->features))
+		c->ops.setup_pcc = dpu_setup_dspp_pcc;
 
 	return c;
 }

-- 
2.39.5

