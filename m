Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD472882A5
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747670668; cv=none; b=AKbcL1u/9PidFR9c9iq9QCI2nT1khimVve8DoC/wORzVaGC57OUN/BkynkN0vgSnxj06m1kN1lAc8wlwGPLA6Ht7QlhhYc4pu5/E85KQe7wVck1uIQd6DFioKw9k8W1d3F86sbAegh+oFxf+Sq8DIKMxiPPh3a+Ywop/3wWN7yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747670668; c=relaxed/simple;
	bh=gc0vVx0GR1QL0WZ4aduY3sTg76CawVXY7x7dNDLAinY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pBmT7Vuy2uNZ/Bk4fha/x5h9DOeZET3gmo4hlY4jbUmSPB20CGYnJnYW7YmZGDWPe0lBlVzrcIsQGkmRK8+j2HtUWPyYXTID+DLRaNPHdAtbVvPhe/JcZ3JwgCR4vytmW1PWXq0aNixCEqI5ZjPP5pDqV4ANeCSCLl5l5yPxRbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O15bjRQr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O15bjRQr"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J8fhNC003169
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:04:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QsdXMngD9SpY831RMUEtLxHZK24x3eyrHN3Zu861eo0=; b=O15bjRQrwouQ4gH4
	/OZUS+7lB2JzWiYwAYee3JeZeLdnzfCvuRPuxD8OzXCjaJ0QsEDeiDOxCKb+rMBq
	ZBPWOU15UXsj57gErb6CG4YgYpfzSKQUWmBiVuBDa6urlO+A01FnIXv739AhZuay
	UewdFVWZnq3zqhKY93d+2H7GYd0GQ3RMSUhdYcUHtsr3xW9fOcfgBRTwlLk/0rt0
	bwJsGM2ox4iG4bfKkcQhhFw9YS6Ze2wOHPthyScWIZWirOcb7QVG9uGT/L0KQfL5
	Prr/jy1H23u8fqWMdavrStaAgwl/G6OAvE7CMddxZ7qDav+T/8oGcrYWPEif3W2+
	Zqygig==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pkr9vwfu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:04:26 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b26fa2cac30so1588916a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 09:04:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747670665; x=1748275465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QsdXMngD9SpY831RMUEtLxHZK24x3eyrHN3Zu861eo0=;
        b=owXu9FA2EMIbg2sajHJbnBmlksbNPURzhyuIhrDlQHh35SAIDvExZc6CG8axctBRt7
         zjGsWELkrjZWQQ93C6QhkCi2ddlWpWKLrHvWJDTIPdk5NokKAyj/IRoHxpob+8im0DYr
         rvpzs1Yi19y7E+9gG4soCbqvNmzHEF/kPUoBz348A+4eWqBGPmWW16xDnKiItn8JbBKZ
         07MkVIgK24vczDsDhgboQmzL6uex/wHHm8WPeDw/4ByGeChqBI2jIGenuYt//AycUhLT
         OIscBpksa04itAF7gi9KRJPcqWT+PnPE4UyJ0ql6d5fvhKsTgWdAFbTyraBY+VDeU70x
         Tb4A==
X-Forwarded-Encrypted: i=1; AJvYcCUwhFFl2tIIq/zpVjmB4a4OmGPYDPtQ3P5H0shzzgowX9gN3k2d+BLY6bNWOdWYsiHdKGSsz4862apkKCI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6WcFhn7e1EnH+3pXcNorYI+3JrhrqJakyJQpm6ETGENPKPE9R
	0VF/UwrgKhtgt9hqAWeHKa45ruPiZn5UInkajdP9GIz+deBMCUEX52YK3gSdfNF8Otyn2LA3gR4
	gujRKt1viBRk/rgra9btDC0/A5BVfP6OcB6HFNCV0cRjTtrCckxdb8uu3/bVVf1HAQmCuN995WB
	Q=
X-Gm-Gg: ASbGncuAk5dbRSA5ANzztRCT6nESb+kwqHfXZh31JO8f4zlpROHnmvoKFR5Rc+k0sGI
	eRaeTvuJRGflJtOwLOJtd1W1iQ2HVIEgOc5UsskqIHtWxMqrE1LPSDKdTgHn09YIdvcQEAtU0c5
	PQ10GZGX6lc4rvgI//BwI+c5itCGJJlQGSvNT35OqMrAt/Be99FVxKCIXu/zWkC5dgezYDle/Bo
	/5+xg0+QjJBJW8x2XhSXhKBzDucJHPIlyYbUdM8lCxm8+GFnPjgGGLcH0JxMCxwdjE//5O2URxt
	pE+EcjIhzfMyd2a3hIEDO1mDaB4NzlLhsJkYLknQPHpTmnyXHGz/a3QMqzthnhq+mIqGiGOsCXX
	lhoJb9yKcluPfFITT9zRKej5A
X-Received: by 2002:a05:6a21:3189:b0:1f3:1eb8:7597 with SMTP id adf61e73a8af0-2170ce8b3c7mr19611701637.35.1747670665415;
        Mon, 19 May 2025 09:04:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAgP2IpHkPQc5mpQRAJ6cLOgiawQf+qDVCqKg7kLh9hrIasJ2kAl7ht4NNQm+BB69NkOXXsQ==
X-Received: by 2002:a05:6a21:3189:b0:1f3:1eb8:7597 with SMTP id adf61e73a8af0-2170ce8b3c7mr19611662637.35.1747670665007;
        Mon, 19 May 2025 09:04:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f6f1sm1919378e87.248.2025.05.19.09.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 09:04:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:04:07 +0300
Subject: [PATCH v4 05/30] drm/msm/dpu: inline _setup_dspp_ops()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-dpu-drop-features-v4-5-6c5e88e31383@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1413;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=tqpu072eQ+5A23S4ttcnG6A8dqH81CwtIIeKlnCS8Qo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoK1Z6J3GY8B6sAJkvuS5gDSIB00Ld6uwXdzuLA
 WEc4uG8uZiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCtWegAKCRCLPIo+Aiko
 1YeaB/94imUZK2omzTlTl9/OQoGQVUgiYj8QkPc2PhQnu5YxOeIs+2KgLQVCdE7OMLRm/45k467
 bptb05cQ+3z47kX9uDr9/unZdbVMoOIEQA+zc5Cl02URSnlvtvHADVRLoFAx2WuhXSuaTohnQYS
 Wul3+N8m8tI/Ek0fsoqnFYa2PWPs5wwYJq1miJaKWTe54EXP/scEKCMqojzInJr+YgqHcr5Z5W8
 87fznBKE8psaVEC5gqPyFqhCgaKqWPSyAsLj8MPtcitLrUj8ZlmhrrcbqfPsVAocRuP5bK5QMTl
 SczLhhnV55Cue4zUsxiKBmO/++PXG7iOosq7RqEkdhHpu4t6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: zweLSxnM7xYG85Z-W-tZlNx8-kWzx_bl
X-Proofpoint-ORIG-GUID: zweLSxnM7xYG85Z-W-tZlNx8-kWzx_bl
X-Authority-Analysis: v=2.4 cv=DdAXqutW c=1 sm=1 tr=0 ts=682b568a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ezFYmCdhRMHQQexkQpIA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfX2rYIhiMm2uXt
 7e2qaw9EjXi4EE9ts/toP2Spcbgv24n9zvBTn2VFGBp70GD0vCEUBpAO/cRawEjO67oCpURf/A+
 zNR8ha10y1+1ue3T+LYGRri2eFjiqUXpYpCofOyW28R1W4ULbeYBs5MqSFc03TIgbhMusm5sWkm
 NVMfgba+aj6aKytXGjywSTNmVDOljP/YhmANejJzgz33qBOfceESj4cKPduYyWv5h0iJ/gN+z0q
 O+rFz3/S5fA2qIkrdM26evfEE6WV1LRaIzocNG1ilI7s2K8tcZ1OzexosErDpZW2I2qqfNj4EKr
 VE4mtHYVKtwsoBYqX+UeB7BJ/WXi99eIEVSVpPeUr6GRI8xwcLdD20nA9JsqmqWoW4AjFrA5T5a
 z0xGfx5hER7iim17H7KVYh+ljQC9baz3/euuYZls/x4QCbWeEY7KYyd0JPawGOfxWDb4ytSO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 phishscore=0 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190150

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Inline the _setup_dspp_ops() function, it makes it easier to handle
different conditions involving DSPP configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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

