Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E1027054B
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 21:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745442621; cv=none; b=pcNlD0Nu8QWLzhN0KzHEn0NeJYP+A4Zo3ch+hZdC8l0bRDIe2NucwrH0fNZuSuPq8hSPwAixQGo7JoIxth1cEP6NVn2E1yNutz9hBVALby9rdxLj5yHCmpFvl8vW3b7NkvT5JFwbRDs2LLfLkb8VjVP+v0W5Ozi8s6QLwr6U9Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745442621; c=relaxed/simple;
	bh=e5RFSzWCSGoqvoTAM8ZdpnqVn8jIYnUbmNjrRPWxMFI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fE4joKhGOBCAtSMVM+urkwtt+mLUF00fTNtpaLfkypQ1Y3PgZa+W8kxv0Zqb3EBUF+76L2joKUqq4CBrO/OSDxwS7KXQ0xdXNOByvgc0RPdiU8qhP+PeKR4CnP6iHIsHsNhTVIljTCZgdEZXnVowuSO+TFywbicjt9rTidZyw34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eNDHNM6+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eNDHNM6+"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NBo82N013353
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 21:10:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nrVtWH6tESq1UP3QtmhPrfd4OSTJbd5wusMpKFP/3tQ=; b=eNDHNM6+9WJEUQLL
	P2DTjnamaO8f7mcaoiVLnGovumC8hrx5b0+VcGyZMZwNVqgFL589EyDEmm/aL6pt
	hFvPfKrxO/fzmLIwR9Wv1a87CZiqO10Z/ogWM5n/2v1RSFPEOpp5dnx4YNaIr8VI
	FPNfyc4Bfny5653P6Ee9YFkp5fPZSbnKJZbh1l0lCWMB3q1eBBCZC0QkZbUYc/4h
	90EJcO41wJt2fQgb1hYNZF1dAawwUPvk2SyBJ9kmoasb0fUbJIIsFvljnPoWmAWf
	OmmzvHsxd/zUuxUwPlpuU+5LuZsW0NiCHtRgOoidhEWn5I7nvYkyzq3vEysNsaEI
	w/jaBA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3bcx6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 21:10:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5e2a31f75so82756985a.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 14:10:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745442618; x=1746047418;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nrVtWH6tESq1UP3QtmhPrfd4OSTJbd5wusMpKFP/3tQ=;
        b=BcXZv82/2mRKSTfUvm4NBNGdJfvLVGD3Tgb6+guraPaJafKD3dj8SnzF0cmHY5cXha
         VtOyiSgiqStGeD4RNR9UZLZpA4BIQr1zmEiEzSyKuiWIZFoluQWoI2aUGykD4rYvNAB/
         0EHk20mCrOOWrQLOJUuKA/VMMXcvs4E1XRsUkUG00jbBepotuh5dGUOI6UdwHblLHwXA
         whlFUiRGG2pYPXxyIwcDe6OFBJi5zzkeXBUAtRPMFq8ggJ1kK8yeAJArD2bAppzx48aE
         4maxvbjhn8P0/qqAr8fXks4NOgY3BYpmP0Lu2dZeRFvOHxwmd+Smwk3VCa2V5XUIFvNB
         3uzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzH7YYUZE7iafUJyop/SIbOHBfzZwG2oVLM0W0KdT9kK4+qLck70OMe5rRn9ae5miGcOtxVdNzpJv63Do=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2bZiJOlDwddDiR3XywQTztL2ZCbyeE47oejhgWK4i+YUGPr+1
	Oo+B3n9mExzqQWWyVvyPSlBv39jaLr+jcHZ9zlX2FMSMz7A6NateG62KV6WxZ8zOQvScrNgwGfH
	xxpuObhCcIRUCIexwWWiM9SYLWlRhpCOINPuCXcVaJ10y1crWCQTFAAFY627hdiY=
X-Gm-Gg: ASbGncvgrfOfCOBF3iY8B2Fo8EDPSoy1PIZCz9HJ3SYzcN9rYDtZRhUh4yaIUCe875b
	QpRhaUHwle5yXe7LTU3ITKmlMYViIWxRw2WF3WXg/gfqymwXNvOq4YQ1IxEgnmJsKksIQX1glam
	TL8Y2G9XttTy8Sq3NK90ljhZ9Gb9TNW8pehJWzk5GxjmZaXIws3FF2jfm1C35chvppa1sKfu5PM
	U9zz3CKBqnGusgiRswL1qb+lYHv71lh919woaIEzkFTsQ6ieDkOhj0hcPzjVPRzaim2ZYEhlxYo
	KScR1u3AZ/tOwbQB876XN1ancATzCtlbAvNuLqfQbLmXhPa02+8El6UgBu+Y4jjcyJs2RfkDw0Q
	Ug9bUOl05587CdmjYTdIZ6OdZ
X-Received: by 2002:ad4:5c82:0:b0:6f2:d45c:4a25 with SMTP id 6a1803df08f44-6f4bfc9677emr2898636d6.41.1745442617996;
        Wed, 23 Apr 2025 14:10:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdN8j3WxVtC4umEdxXTXJ5CwdHR5VLabTb7DZpOIhVSxnxjki9ZdAxSPM6E0yzlSTACN9uGA==
X-Received: by 2002:ad4:5c82:0:b0:6f2:d45c:4a25 with SMTP id 6a1803df08f44-6f4bfc9677emr2898126d6.41.1745442617513;
        Wed, 23 Apr 2025 14:10:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3987csm3852e87.59.2025.04.23.14.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 14:10:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 00:10:00 +0300
Subject: [PATCH v2 04/33] drm/msm/dpu: inline _setup_dsc_ops()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v2-4-0a9a66a7b3a2@oss.qualcomm.com>
References: <20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com>
In-Reply-To: <20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <lumag@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1652;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pmq5vBCUeBdexnqWIWU7CFkRwfE1mAJP/nnHW7qtnOo=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQwZnuNb5wrJr2VbZ3pd+aopnix4TOpr1KLyK1dm40YaLo
 TjxYH0nozELAyMXg6yYIotPQcvUmE3JYR92TK2HGcTKBDKFgYtTACbC68/+V1bWfIVXc9pcFg+L
 DTGGD1+m+nowevZq3BG/rC/IsLS48/BzL7V+afY2xgXJ6l/Eqx8HX9nG4Tttgu7h5teiAbXHZyT
 H9XJIZi6O5+CTk89dvcjUMbTmid6K7xOMFq/U2PGgpMW8cWZWRajNKweWTqHfsy/qHFBxUvz5gF
 122px79fff+FlM0cor/fxhW/Oxa6sVzebOtuEx+6vWLJgntcFpXZ43b8qc7X8lnkw74naxoXB9n
 laH98IN75Z9PMrqVntY/Tzrzyf/IhdoG138tORHz5/qaCXPU8eOBwftvqIuLPBb7de6nNSXrzd3
 mtbPbJYyrW++JcXGmhcmX+7pvWqF6uSmmrsaSorP334CAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE0MyBTYWx0ZWRfXzUzxxLSwWkWp qgqH9IifYDmUYxFPhZX/7pl8jvLm55dlypMeBTkvq7LqviYvIcgwvEyso9smfeK780KEfR1prrW tdNqqmX+bXlznrd5u7DO8HdInry5a4no2mwp2TVAyGAW7pHGIMdT2CcAK3c8W8oNGP0c20g6lYe
 CgKO4yBD1muaeWAn/Pz7CeiX/cnyp8hS9Thc4GPE+qtGktuuBdIsgS1W4OJBvLUbipuAC7VzUgM nHYPqJP+OVPpPa3zS0dsj5eGYB+d2gETM/LBxr0wplWD13ic5ckQSiAQ0ExCQIAOlSDvXYVzaCb 6W0YuVvum5ifYRD7nbVNbt7D7/9jY3KbS8hj2eKM3W2s6Cz0WFlcAH0JQjxtn2ZclLJiTmH+b1P
 7NEUnXKfNC24B0lduhI5vDUOQGiGeouWa/AE6DZ5hHxnhAmS2B1q278N4mjcnnsZOpkrI/kA
X-Authority-Analysis: v=2.4 cv=bs1MBFai c=1 sm=1 tr=0 ts=6809573b cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=aBwJmt2KlYBR8C_sNNsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Z7Ufm1HGh3DAH6xTbBQHX4XSFhu7Ljuc
X-Proofpoint-GUID: Z7Ufm1HGh3DAH6xTbBQHX4XSFhu7Ljuc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_11,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230143

From: Dmitry Baryshkov <lumag@kernel.org>

Inline the _setup_dsc_ops() function, it makes it easier to handle
different conditions involving DSC configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
index cec6d4e8baec4d00282465cfd2885d365f835976..c7db917afd27e3daf1e8aad2ad671246bf6c8fbf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
@@ -181,16 +181,6 @@ static void dpu_hw_dsc_bind_pingpong_blk(
 	DPU_REG_WRITE(c, dsc_ctl_offset, mux_cfg);
 }
 
-static void _setup_dsc_ops(struct dpu_hw_dsc_ops *ops,
-			   unsigned long cap)
-{
-	ops->dsc_disable = dpu_hw_dsc_disable;
-	ops->dsc_config = dpu_hw_dsc_config;
-	ops->dsc_config_thresh = dpu_hw_dsc_config_thresh;
-	if (cap & BIT(DPU_DSC_OUTPUT_CTRL))
-		ops->dsc_bind_pingpong_blk = dpu_hw_dsc_bind_pingpong_blk;
-};
-
 /**
  * dpu_hw_dsc_init() - Initializes the DSC hw driver object.
  * @dev:  Corresponding device for devres management
@@ -213,7 +203,12 @@ struct dpu_hw_dsc *dpu_hw_dsc_init(struct drm_device *dev,
 
 	c->idx = cfg->id;
 	c->caps = cfg;
-	_setup_dsc_ops(&c->ops, c->caps->features);
+
+	c->ops.dsc_disable = dpu_hw_dsc_disable;
+	c->ops.dsc_config = dpu_hw_dsc_config;
+	c->ops.dsc_config_thresh = dpu_hw_dsc_config_thresh;
+	if (c->caps->features & BIT(DPU_DSC_OUTPUT_CTRL))
+		c->ops.dsc_bind_pingpong_blk = dpu_hw_dsc_bind_pingpong_blk;
 
 	return c;
 }

-- 
2.39.5

