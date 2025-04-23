Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D7227E1B9
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 21:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745442622; cv=none; b=amoZzdrMJoUZSWrdK9pMbA3TTwXYdsVkikbn6dTE8o0OR1PPjb4pNJEdeENZBKU0hY29UUMiCNOmIdOerDflTAH+AzRBXWiand6ofmTRnBoStCv4oNAntSXosUzwiHiiQZWns0xKX/TKAVehB7ecR2KmW+lkgO8US2C9f78mVCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745442622; c=relaxed/simple;
	bh=26I8qPadGBI3Rlea3V7F1/zcNl+apgLPCwuzy3KLrpc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Us9KqKx7j34JOtY9mvnGwHr9GX1t3/F3UdtqLuS4zit89ghNLc9Izh7K7lhA4fUvEahnS54GKsGc5d0KtwkyhM6QyYB3Feo/pbda2GISqscEhAfCO4K3IMw5RSQTBjAbWmKcYuIVldm6aOLgjOKmq/dGKdXNH0ftglV/SSEhoa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S3rNxQJQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S3rNxQJQ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NB2rne021819
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 21:10:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JRXCPSZfKz+DlXPuaTXqEvhoI/h4QSedlOHHVJ7bZgQ=; b=S3rNxQJQeBYGSWL/
	FklUW8brM5mIAZCTknzBnKk2OG7cWU0hVc8vwVCA7kOSWsL/fQT0tZexhPFhXuot
	ZFI9Rm6TzEIL/cfKz6Wqqw5PDhCYB0Ob61XztyV0t6oXOBg08CF6ShVc0qUJtNtr
	XdLVCr9JdNH6KXTI0wB7uf45vBMR+dDiDurhmhsyUbZg36sQ4i5OLNalwEAJAj+z
	mx6t7gRGr6+LmAWOFBnaWoPFxkMYt1qR+aLJL2dmoARazZJh7mnuB7pYgUJvBdTW
	ZcH/MegmorIl0TL8gh9wajEsWtavZozgzxCo9V4wZSX/NDh4l+3HQWSFJxxkrFkQ
	N77+Gg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh23dwa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 21:10:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c09f73873fso36791585a.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 14:10:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745442611; x=1746047411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JRXCPSZfKz+DlXPuaTXqEvhoI/h4QSedlOHHVJ7bZgQ=;
        b=RgMCb5nYm0IuWkhbypIRbj36ErM6hKVc0Bx7kvMUtotIxxp9r7iqaL1MxxVpgkHnN/
         af+TGRakSP7kxuUgaGg0JOd8mNokS8o08mwluDznYB3fNoiG5tYAQxOKjBwj889w4XzY
         hcYNXLF9oRx4qp9DmvF504vtQpJ4k9XTXUOB4JQj7PqOSBAvTIMfDg+MObPHyM1jsNXf
         AqGXdiaYGakL4IwLuHHqwMCm7Vg3bGur246PZbdnVESZxSmTvTVQ3x53/cFgnGHK9mh0
         FZ79dXBJz2JCJAqBygjHHWh/1S+vFhIfXy8LBeuBtmtslMsYCey+ic5ouJtlw+METOj6
         zlMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVD/zpGr64VYv8YzmXYRwKGhOO4DhmM104Ti8eMerzCYfQdlVRwlxMaxO9ozS5K7pbyH2XDW4zDHh/9UK8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyefn1SZndWAxMBYiVhi/Udz/DKuZOFkVSfxOYMsJeMjrs/Uh1R
	DtuEcOgT833/c3jMKrZ/qvFoWGziCV3DrIIEKRTng8oAs7Q/rfybe53OL3s/CAkgbsrSUQnxesC
	cn/hPk8+PPMu+cLkHtO32db0PA/c2zcrviM9qogcfWO0QeG+oH6Cf9db0G421IR0=
X-Gm-Gg: ASbGnct9sVy0jO6rXiBda+s57orZo0EugvG5fg91vGRE1tD5D0S8uuShL2r7JBQV1oI
	MW/ygnQhvhSFyAto6ka3J1J368a8aRSKS8s4TdSv7ZaQGOvZ02PQEjfD4X2y5O5nAJKL35X/oKT
	nYDVVZherqB6DWrXdg0r1/4gaaBaLuJF3Oy9GfWlAt0o3P42Lu7LnTwr0pTZHrMWIlKVnbgtLhT
	/nWitf+fvkqLheqGeKKt//yMIFb8j88eBDNqEEPkMjqGGoiEXD9iI6R4M0BIsLL7oQCz+3SNCd0
	UyzSS1OngjsWu4Kl1Ua5tpOqBQtxXXOveUlh2+Bco9R14fa/fBibx3iMFxVLosgELtar+uV4e+A
	33p085YLKj9Iwv+9dqUi5Q5g4
X-Received: by 2002:a05:620a:2984:b0:7c5:a951:3518 with SMTP id af79cd13be357-7c956f34a34mr46304185a.39.1745442611588;
        Wed, 23 Apr 2025 14:10:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHu9UktEg24Y6pBfXuYiW9VCkLD02oK4oHuXzlXTXwu2vpQ+/Rw+H3gqu922br8qUWbb1+zzg==
X-Received: by 2002:a05:620a:2984:b0:7c5:a951:3518 with SMTP id af79cd13be357-7c956f34a34mr46301085a.39.1745442611259;
        Wed, 23 Apr 2025 14:10:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3987csm3852e87.59.2025.04.23.14.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 14:10:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 00:09:57 +0300
Subject: [PATCH v2 01/33] drm/msm/dpu: stop passing mdss_ver to
 setup_timing_gen()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v2-1-0a9a66a7b3a2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3649;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=sURLU3QRO4lBSIODQBucrC/9R5zvezCH7Xkam1qgsTU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCVcqXsu4xhdRSNpxf1vhPNERvfOkWG3poRbfM
 CrhAy+HVq2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAlXKgAKCRCLPIo+Aiko
 1ZEkB/4y8zKnbxVkHnCP4niz6CVZfFW4WHfBUHAkpxHYVtB7lCvcxwr8n17GJUt/CauoNb6Q7Wi
 wIH2wpZWXjtshGwzfjK8ZYNQ10OEhtzquVChrXHpOI8q8a5sopy0A0IRjPuD60fuJ6cKdF3UsLb
 BxbT/yQqQviLLgwqzzVF0OPU2ErCSViHmcrXcJMTgXBzj+ORyxQk5NzFADvHJHJxGv3/CiHkSTu
 5TWZgb9KJmilekStX9MSsMvWpgt09mXU9CfCVsQEBqrMZpBY6dLUuJzdH5eox2uJ7T4G0DShHGn
 WPKCDVkVIGk9TJIXQxD8fn1Ax0zfViyM8M2jhytBSCsWsukt
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=EtLSrTcA c=1 sm=1 tr=0 ts=68095735 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=Fc1Z5Xec4v_XsjI5eh8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: IomAQ831HClgST2EY1NM0zAR40okxY6j
X-Proofpoint-ORIG-GUID: IomAQ831HClgST2EY1NM0zAR40okxY6j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE0MyBTYWx0ZWRfXxw1QLodH7d5K sNWgoNjOFh5UKt3Wyj5QCtv54HDwPCuvH/o1XDkh8IWtnfbuzcb+SHaew/fFlVndmEVEFavHK0L YHWfrRU8JkPzqvWWwAB1V7DQx7ncQVs8D5dB89RjebyUVtq1K2nYY9e5MZlRgXgEWwM0dZTz7V4
 na9gthV+cgJgdZ+49DIJXrAFm10uzKKG8zDD+bpyOF1o20VjrOHqdmEjSr0CMes/3fAnob4wSJB NKo1ioAYmm20w/uLDnjZaakXEwh8ON+NoB6/eoo8noUX5x29Ci42HjvVKmJfuWJ3LbWFHahYz4T YzcP3zBV7fdTv0g16Qlg05O2ozLgjC3CH7tJCsjPKzGp+rQNBiJTqZiCVMMxN3GPBupY8Bwqxt8
 3ElHnntYrt8e9R2wjxm0fPMemP9KMlosmCZHwJIeawZryNJ7oYiSxjZI/R1tuj+MbZB14hYq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_11,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230143

From: Dmitry Baryshkov <lumag@kernel.org>

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

