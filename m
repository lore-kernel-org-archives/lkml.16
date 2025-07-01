Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C388126FA62
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 16:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751386871; cv=none; b=tHAYjo5AWkLaUtUYaf13T14lNXAw2FoYKcsReayquLRLvZOW4JW6MGWRvmB3tk8pHP8rjiowMvVH1Ws3fogffi02S5sxsQ4ImEJow6uNVC0ftjI70a20M4seB42AGbx3B77Dr6dTs2dZhfBpIbA5wIDL/lKw4asg0pmwT3XFvvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751386871; c=relaxed/simple;
	bh=XFr0UsCyCOcjko1cdlmNH6cXzSCtwggWcwGF5puvtvU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D3XDKfUSR4SvE5GVRapwaWD0kwQW6pcYvwgVC90R6wC3rP4nAxqLd9kJuUKKzoOriSKlVSW0HFOaRBWGQQo3XBkX/uzw8vdN3JPciBJXCdDmuUwhDtceu4zwGNxf6N0s4yquALzgQNxLI5IaaPrEfrh+7wydXsZaET6jeHM4W+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QmIPjjF8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QmIPjjF8"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561FQcfk024827
	for <linux-kernel@vger.kernel.org>; Tue, 1 Jul 2025 16:21:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0+w5ZpBtBKx9XMObDCi7zYvJA0s3GIDL4r9tOJGZS2k=; b=QmIPjjF8scfL9ukU
	mGB22UBepB2VRVfze+b/rcLsoVx2UMIoo6pNo54kyO1ThGCogQ4rGT2hghx7w81b
	R9luX4qyoDMldq/4QLo4slv60zJ9NF9U0Ozy4ppw3yqCGVWQ4HIawnrKyIyyTDXE
	4cuQSm1RKbPaVUO4xvFAWIui2rgF+c3yKNfIP4A9kKmHgCxKw+/MwlMl2RlA5DQc
	zsgnfKB3Bscxph81kuX2XbgPo0/m2whk6tae0mjb+/eiAxcoG+crCKI8I97qR+lO
	w+hwbVozghzlbWZ7/z/hpCukpypfrTTZZBMIEsU5TdwGek3Q3COCrUjjp6+/JMKh
	FI9MAg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9hkd0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 16:21:08 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b3184712fd8so2538632a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 09:21:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751386867; x=1751991667;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0+w5ZpBtBKx9XMObDCi7zYvJA0s3GIDL4r9tOJGZS2k=;
        b=hy+09W++8juFqukOa5ue2NLjvUPClnUefOlwidG4LlKmUjagwJxcg6VnXKZwBVi8Zh
         v0Ak0PF47+BnOy/AmVg+voxHJ7lCXO17wUX7QhtaHx11P+30KLbYj8ixmT5RmPIYxxX/
         mKr9T26KtJnZtZc56TXBfKq12OB4plJKywtOZG2yOobeTiXPIsniHsJlvUJn+UWcDv0h
         0cwWhYA/OVeZvdPewTr2zy5nV9sodfwBYsB9C4yS39XNejtAxJw1SgQI7WkBLvHNTm6h
         RHTOx9z9n1WQ3FHAS2wq8Mwc8uCoiVkKaWPJUT5DGA8yVWii7c+vWctRsMzi9PY62PEa
         c3Hw==
X-Forwarded-Encrypted: i=1; AJvYcCUYEbLx7AddZRjfOrnfnHMcBN5tBwJKiCcL3kstBNAqRrM/PzjlrWIjo4uaCWu9x4hJ+76H2iX831FQjRY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp6PhaNh0uHpZY5JDjmXuOhTJsFoef0/6UHCjXcSn6T6MD4+QS
	jzHELyxysQwimfaVLaXgMSmzwGUPBL1sg1XDlrGTsW7Tn8EA/Y0bXUXW2gmuT1A38gE4yyEvQhl
	wnTUknsmgXiC16+Z+YeskBXAOVLmYVwPs/P/3xPljb9pyWweZSNA0xjkijVSDq8n6Sss=
X-Gm-Gg: ASbGncsb0jF/TEjoty/l5eS/X6XEyxyupQvXoL71EPOMjab7ue7wc1mh8OcpDmUwycc
	mAxxCKDPK5kkXen8QA11is6ob9v3KbiPUHT5vBckmxB77YmhZijYmUbsu7dsLugYoUmjQ0Q2nE4
	ILocJU7NsiJBeeD89dJsuWHGkJ+BfDR4DiMgYov+Eu430gMdnUtlqFGL0FpeNVsMX0e5RTDJ2Ou
	z3i/XNsmk31EguNuD83afsP4LqanqbNVhGn+4CEiA27VgBqLxIICfzqf08gSUZ8uAe6SBdRkii4
	gtoUs8tc999f6xGgIhNNjoeR8Cv9oVyvhWMemMoNkcYvJ7w=
X-Received: by 2002:a05:6a20:2588:b0:1f5:9208:3ad6 with SMTP id adf61e73a8af0-220a18337a1mr30392728637.41.1751386867016;
        Tue, 01 Jul 2025 09:21:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdDDA7VRG+NDWgAWPFIw88bukUBqM/DPB+EDNZhxmferppqBDMOlnEwSYgc6UqRL52udBz1g==
X-Received: by 2002:a05:6a20:2588:b0:1f5:9208:3ad6 with SMTP id adf61e73a8af0-220a18337a1mr30392659637.41.1751386866521;
        Tue, 01 Jul 2025 09:21:06 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af5805265sm12573010b3a.168.2025.07.01.09.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 09:21:06 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 01 Jul 2025 21:50:44 +0530
Subject: [PATCH v2 1/3] drm/msm/adreno: Add speedbin support for X1-85
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-x1e-speedbin-b4-v2-1-a8a7e06d39fb@oss.qualcomm.com>
References: <20250701-x1e-speedbin-b4-v2-0-a8a7e06d39fb@oss.qualcomm.com>
In-Reply-To: <20250701-x1e-speedbin-b4-v2-0-a8a7e06d39fb@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751386855; l=929;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=XFr0UsCyCOcjko1cdlmNH6cXzSCtwggWcwGF5puvtvU=;
 b=gJ6pDb5Kn9ocK1b4VzRIL1H8oWfTVEUJc9L95LY3O/MAF7x4Ci2ZmVPs4eB2uMPKeUYNs9xCW
 iljqWpYNTajCtBJ1dpzplJyl6f+VNaEjMIm52m+wF+Cybsq6is50ods
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=68640af4 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=gUrcRKAgYtiFYHip7zAA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: MPj-Kk-pFV6ncKbSDXkW5-NO65-0IH22
X-Proofpoint-GUID: MPj-Kk-pFV6ncKbSDXkW5-NO65-0IH22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDExMCBTYWx0ZWRfX/Z3LfhmAaQAR
 xRAQbiaIviPXQtEp+yLPM0VZM/KVU/QNJgRXl9S34Wnl3JUILinCqTesRS8hY9GED7xzbFk/3Zb
 fxmWWtlxDSizrMwf0e7trAAqSODXxEDGlLXeXHWPKP55LCyR8h7Rke3kEfgcGhgpMkHfQ7/2Que
 APVDo6ZSQfOtl9Jy0miGpmx7+IbwKwlm0kgmFi9yTevjwbLr1g85iG3j1k5w4V+kUq9o1xzrcq4
 hLb/m8rHIWKfTgzFYXcZG52OTjExLnSirFNy1I8kgUPtu7JQqarRQB6KHPNLc8Hh8KPfqR9+TrV
 Tecnjfwk6nYi0+Vmfa2Vyf/QIkO66ulLvoB8H/mL/FtLS8P6886Lv3ZBm4l8hnpMjs2HNH7K9TF
 8TH2CevUSkkpUsDafpXD/D3tmP50BVVhq0bupOs1dmUYBJqkO7KNvQuqe0Uz7tlwrDx/IldR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=883
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507010110

Add the speedbin table to the X1-85's entry in the catalogue to
enable SKU detection.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 7748f92919b883bbcea839a61158ab52e6e4e79d..2fdaaf4372d381c351df92b8dcb21da0fcd02776 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1442,6 +1442,13 @@ static const struct adreno_info a7xx_gpus[] = {
 			.gmu_cgc_mode = 0x00020202,
 		},
 		.preempt_record_size = 4192 * SZ_1K,
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0,	0 },
+			{ 59,	1 },
+			{ 7,	2 },
+			{ 232,	3 },
+			{ 146,	4 },
+		),
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x43051401), /* "C520v2" */
 		.family = ADRENO_7XX_GEN3,

-- 
2.48.1

