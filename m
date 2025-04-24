Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0877221710
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487045; cv=none; b=CEhOCu6HUacUdbOiHgB3heqnmuBboheX9odxF/1i2oJKWH4VSv7fBFAvVHT638CjW21yvnZ6ZPf7EORQm6N7S/TN/zhoWNzV4thbWIjabzqNjTbXh0r8eBMT4r/ls3RQw3cuhgDGgUyXXaSx/Jw5Hqwhd0Ty8f7dZuhD/7dzNbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487045; c=relaxed/simple;
	bh=2IiFHS57P0Bigwh2VE2RlX6r/1GVPFLOqjH2EKejpCo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kqig07aiECIFSgpxCRA+uIOcUyQzG3sxrr81w1rl/4+350J5D9YrpESKebDcE1ybL1CNi7d0obLwq96yMj1rARAxV5v44aJeKUcqbv/fzP3M7oS+7Ab+LTBQ5YCgVWM3Pp2CSvxw9V+l7MYU/0ihDMvvyuaFoDkRDRZzFY8WvbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GeAz1bXC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GeAz1bXC"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F5kT007498
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:30:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TZ+vVgitO0Ee1t7phggoG27ofzaDJceAaCxWE+985z4=; b=GeAz1bXCbdwy0tf9
	c9Ii80LxEJDaDB/AQ0b1vGzUy8runmhLtDvNXcihUdAJe8LfwEqH/z5cpdr2m0PV
	hQBf3ciHAJ28B1TxoU2A2D9SaaMggw2DJGKYCYxTIzIIrNdh9Sm6jXqSkT3LLugB
	ZyTVd4ksFdJOylM7lLbHoDjA763KuX6TCll8Na95dVDdX0iXsyteIlr2lL0tPGD+
	EufdSYI4jJgekOtTm5htNa8AYd0JJyuTYG14GKUX+Gqjr6YfAaG499SKNXqilgIc
	4BOGPCU7uQF2qHFI4Q6JlWHc8DoRvNxoQyEk6VPhzuopIBrKzhtFRwVbWDDrO2RJ
	Z2OhmA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh1mypw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:30:41 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6ed16cc6e39so15765846d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 02:30:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487028; x=1746091828;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TZ+vVgitO0Ee1t7phggoG27ofzaDJceAaCxWE+985z4=;
        b=pb9BaWTyWO9H/k3JK35k2YxF70JdnTwtqofr8ZZPgRIWW3ZpaEboG16BYFomRnFnvs
         YP2VVQ5t3rFPhuCiIoJALGPPae8patlj6ATch83qtRFztDryEobfwPT8DkZ2qnQi7ble
         O0sJMWVRk1KzLI9Y0hJpUxJh4SUkfVeLu+UXa8Ns9lfPKlThJfKZe5l0Qch1kngBwaO/
         Z8S8waHmRkYxRhq/1DSamhkopAXJtzQ825BBVN5cUzmTeRY96+IUujCHx+6vT2c0/Zzt
         qMJ9Ze1HVJplFGl5Fapu6mNIpeSbD/c4mkrVofwMGfHeerNhI/To/bdUURRCxQOb1OIy
         dzXw==
X-Forwarded-Encrypted: i=1; AJvYcCX1uRJ24qRWK4OJDLpeMxUnD6hViDeZyXOSsiWMR0exjDAnOpgV/7522KF7DRKpOeza4XTh9eg3jNVbqS4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5mL4EHGPhiI32CZeBZhE3VjsnXUiPVu+nEdCAISNh2uVU1hYX
	EzBwlzErPgchVPSW8BS1XWc8hw2Vrisw2UQ67y8/Tz1xOPRGGVJwR2slNucfwuZzw/2wsdRFOye
	0aKkJ8c1md0ep6mgxnabNcS8xbWGGiTU1IHQM19sKhPHOPDzd3QZFggZN3ilktFc=
X-Gm-Gg: ASbGncumuQt2yuBOqFnZcg9kTfyKWr5oUpu8eNh/iZsy9fQfDO2+roXI35a8Mi2K2Gf
	2UQ7uePBqaAm/83nk7Y6ajF1qEAjRCLpGhaMVZRR2fI50oZHxs/8PsGgkxam9oowewGVAYU0f4H
	deH8RSy97x3b5nV/LkQaWAB3hI2bsRkwZuXVBY84ZVyKW4o3JZsINk6U1E+lPhip6K8JesVC0Cl
	2V8an0dDgzcNhol6CuFuKdEE/FZ2Zg2qNfVmTbBhgVRM+dxC9vzaXY00X5n/hG1oQnlHMIIkRw0
	QIHNnBiCOiA8mn/M2rxXn7TttgqBdZwyDxnoLnXrJJA+I8mFaiepPUWBtM2p8995G/IBR8aqpBM
	2A0Yay50BoTfxOdYDPm3POOmQ
X-Received: by 2002:ad4:5bcf:0:b0:6e6:6b99:cd1e with SMTP id 6a1803df08f44-6f4bfc1da40mr29820986d6.26.1745487027897;
        Thu, 24 Apr 2025 02:30:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnpSqDj4Yj7waYtWavXO85eCg4746V1n57mMjk0jgaE+hvzrSPBmolL9okputlPpS09V2cHA==
X-Received: by 2002:ad4:5bcf:0:b0:6e6:6b99:cd1e with SMTP id 6a1803df08f44-6f4bfc1da40mr29820646d6.26.1745487027524;
        Thu, 24 Apr 2025 02:30:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d1b9a304sm1820461fa.99.2025.04.24.02.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:30:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 12:30:05 +0300
Subject: [PATCH v3 01/33] drm/msm/dpu: stop passing mdss_ver to
 setup_timing_gen()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v3-1-cdaca81d356f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3649;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=sURLU3QRO4lBSIODQBucrC/9R5zvezCH7Xkam1qgsTU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCgSpsfUttjT/E6RZYKlS5nYVZCE+2yoZls12h
 D4PfcXaHZqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAoEqQAKCRCLPIo+Aiko
 1bTFB/92pxDvmbvS+yabonuD1bCGKJY1BKkJm6f8na4d/gMftQ1VQUbSnqYCO9cU6vZhMrL+dLZ
 0fC1YClRxEtSzSqhFHU2kR6/0CRnRGt9AK40wFlV42PLNkotShDhBLDNMy+j2fmve2qdCeGH4vs
 nUkgTSxi9weAx9T3ow57fjVNPSx+u2D4sxBZBobPaFPr6Q9d1tLoNx8HFAMihc8GDzNrC6DU8A+
 7z5NF9vPqLCmJo00slWXzHl6cxMfs/qDmHxT9wHNFXVS07DLAK2OgqpglhhmGTtVQg7atcqdeDq
 oyChjjymCjHzxjJImyQLDrYx46Ny2vdpwjPUUBkXEVZa7yua
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: OG5rrnXBocZqyIIrrx4hsKnkHdxZgQNS
X-Proofpoint-ORIG-GUID: OG5rrnXBocZqyIIrrx4hsKnkHdxZgQNS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfX2JB/hXvu39y1 ddlNkZyWmIxQyvLYqsqUCswNphFreh+65yKZ338mst9ZjhZOLAzcH++P1T510ysW5rlXqRS/lrv cHNxdSaaWwDSidiNJC/D0rOtZmmifreMdZ8K4UXr4qtuH28qOUt+4IHm+0RD22qWpo1oVMi90D5
 hY2B7qItE34P54/26olDut9Fz1dxvMHcC31TcWfIzYBLBPdwhwuoPrRHRW01hxlv2LcGZVEoWYV p2oi9J3/WwleMxu2yRcZz5cfmgBgHnecFqOlWoD7RYzzPxM4fj78RTAkGcpmFIxUvXMy7N14zpm KHTY+5U78+yb8SC9bnlJUil0Rw24GQL+BTNts2xPD0/FEpSpB4BibjQCJTKtAdFdMY0MKBh5TXy
 ikVzmt7ONw9FYJpFGy+eIq8lFrGDrbjLlaS42KJpNGy5nWrnb2GTvleSpyfv2OL47bGuL7T/
X-Authority-Analysis: v=2.4 cv=ZpjtK87G c=1 sm=1 tr=0 ts=680a04c1 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=Fc1Z5Xec4v_XsjI5eh8A:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 mlxlogscore=999 spamscore=0 impostorscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240063

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

As a preparation to further MDSS-revision cleanups stop passing MDSS
revision to the setup_timing_gen() callback. Instead store a pointer to
it inside struct dpu_hw_intf and use it diretly. It's not that the MDSS
revision can chance between dpu_hw_intf_init() and
dpu_encoder_phys_vid_setup_timing_engine().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 7 ++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h          | 5 +++--
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index abd6600046cb3a91bf88ca240fd9b9c306b0ea2e..3e0f1288ad17e19f6d0b7c5dcba19d3e5977a461 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -307,8 +307,7 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
 
 	spin_lock_irqsave(phys_enc->enc_spinlock, lock_flags);
 	phys_enc->hw_intf->ops.setup_timing_gen(phys_enc->hw_intf,
-			&timing_params, fmt,
-			phys_enc->dpu_kms->catalog->mdss_ver);
+			&timing_params, fmt);
 	phys_enc->hw_ctl->ops.setup_intf_cfg(phys_enc->hw_ctl, &intf_cfg);
 
 	/* setup which pp blk will connect to this intf */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index fb1d25baa518057e74fec3406faffd48969d492b..1d56c21ac79095ab515aeb485346e1eb5793c260 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -98,8 +98,7 @@
 
 static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *intf,
 		const struct dpu_hw_intf_timing_params *p,
-		const struct msm_format *fmt,
-		const struct dpu_mdss_version *mdss_ver)
+		const struct msm_format *fmt)
 {
 	struct dpu_hw_blk_reg_map *c = &intf->hw;
 	u32 hsync_period, vsync_period;
@@ -180,7 +179,7 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *intf,
 
 	/* TODO: handle DSC+DP case, we only handle DSC+DSI case so far */
 	if (p->compression_en && !dp_intf &&
-	    mdss_ver->core_major_ver >= 7)
+	    intf->mdss_ver->core_major_ver >= 7)
 		intf_cfg2 |= INTF_CFG2_DCE_DATA_COMPRESS;
 
 	hsync_data_start_x = hsync_start_x;
@@ -580,6 +579,8 @@ struct dpu_hw_intf *dpu_hw_intf_init(struct drm_device *dev,
 	c->idx = cfg->id;
 	c->cap = cfg;
 
+	c->mdss_ver = mdss_rev;
+
 	c->ops.setup_timing_gen = dpu_hw_intf_setup_timing_engine;
 	c->ops.setup_prg_fetch  = dpu_hw_intf_setup_prg_fetch;
 	c->ops.get_status = dpu_hw_intf_get_status;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
index 114be272ac0ae67fe0d4dfc0c117baa4106f77c9..f31067a9aaf1d6b96c77157135122e5e8bccb7c4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
@@ -81,8 +81,7 @@ struct dpu_hw_intf_cmd_mode_cfg {
 struct dpu_hw_intf_ops {
 	void (*setup_timing_gen)(struct dpu_hw_intf *intf,
 			const struct dpu_hw_intf_timing_params *p,
-			const struct msm_format *fmt,
-			const struct dpu_mdss_version *mdss_ver);
+			const struct msm_format *fmt);
 
 	void (*setup_prg_fetch)(struct dpu_hw_intf *intf,
 			const struct dpu_hw_intf_prog_fetch *fetch);
@@ -126,6 +125,8 @@ struct dpu_hw_intf {
 	enum dpu_intf idx;
 	const struct dpu_intf_cfg *cap;
 
+	const struct dpu_mdss_version *mdss_ver;
+
 	/* ops */
 	struct dpu_hw_intf_ops ops;
 };

-- 
2.39.5

