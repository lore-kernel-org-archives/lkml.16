Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8AA2F8C4A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 17:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751651082; cv=none; b=p6tDzD0fuqGezcO2XUbxp3moRKP8Ea3XS3Zy8OkIC6s+9us4URWiZTAVbKONJslaAjHnkC5xz/2/S3JHXNJ7oCQ9EKaU1tpZEnmAZjv4/JBmvvjx8HhI63QIbqVSL8j8iiZpVXbOiLLXvHIuyjxUf92rQ1j5WLEXNZqQtoSUMmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751651082; c=relaxed/simple;
	bh=DBt0DNfX83od0+B5jUw14M1HaALXNhk15W6Z6/5Vg8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oL5HwadE1OtbrvLqJQBEE2qNbeMnpAih8pO4Ctc+6ANnJK+4bd4lLhk7zNu2qW9ZGmDupT58gqotPkgzfOjIRo8jA2W/zxT1LcM6EQdxNutKpTQPh9bFDQgJXt9C3nM18vEHZhh75cZPSBFDkC+HJt/WP4ltOAnhnuutjEkneUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SP2f9R3I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SP2f9R3I"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564Diq6e028664
	for <linux-kernel@vger.kernel.org>; Fri, 4 Jul 2025 17:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Ln9K1aZ7occVpcksNgIQY1Xb6OInD1HFG8L
	+w5gb4lw=; b=SP2f9R3IZG/DoJI+RUU3QJ3PvGBOAV/A/nJIWA4cAVoqnofiY+u
	9nLvPSYvT9mXGDGLbSsmVNLcfRY+dmHhFo/Op33lTZvWiNocrDCtbuXOGyl1WZXu
	ePiyu1opSy8b9shUreWgzOWL4jfN0LsDnxP3GU+mAD/wp0HyWo7RmMPaY88xeUwz
	hftUSUYLo5kbNSyqX73Rl7PJkYStocg2dwg7JxsXtm3AjAyS3KMTXYfjKk2X0XfM
	0UnGE0o9LalVoL1WFqxq44xIP2GvWuqrNuVY16T9NV3qFZrdgPzbDHA0J4qInbAa
	OU9vXg67MbIFIzzyloLHFOF5uuZQx2BIS0Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bw4t7s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 17:44:39 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b362d101243so784312a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 10:44:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751651079; x=1752255879;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ln9K1aZ7occVpcksNgIQY1Xb6OInD1HFG8L+w5gb4lw=;
        b=OHPDKC0lQdVBHndzxmTVdfqW0Z2Mbc48x+IEuq4pcdlbu+04Qq+beZtn5uvuAcQVhA
         i7Eg2CdIFYtoVlsGV7KKC0QPQ9aw2ebwsIMxizduthdOElSA5ZjGrAcZZz9F53BOyodM
         tO8rUHlHIYHWGJ7FNJMJ68WCpZwFuuWO6vppcXY1NwNj0LaRsG48OEZtA7uAB9mOlv2M
         tBwUlx3yWbXZfbvFuPT8wXuh2Y+PWmIQRITDplH/yqqXAAoAgBSYp1pIFLILO/YRDyJp
         IqFRzkN6U1a20/QLbXioGLRptIraEMohMxBwW1rOOWaUovTqGRB2iJ+PxnYxqRfiRUYS
         hq7g==
X-Forwarded-Encrypted: i=1; AJvYcCVDZgWk2SpkdeTixQLv0z682cilCszeKBMbAb+hZk41MVhIUtKgf7YSc01aWqXJ+47T9YqzVaFNn+PhZpk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYOc6DIWl/qy11tsNOq2lRns0CXfn72nClNKYkFusnIDwLTw0K
	kn3cySsjINlNhQORqFEqseEgP2vaarO9TQF6TGU/bF1fmreUNYEeH+VgEtipOGn33W2F7Tirlgj
	sJXM/76z+JETEddEC5NruYDIWoBzOP0sLNSRQCgQI3EOq9XUN1JJ4yND2Njlzc7hgvh4=
X-Gm-Gg: ASbGncufFtWOIXrwpoOFJoZysAeN5TvqhFriRIX26GI4u4J8wKhXr0UwciFVKQZ8Lut
	I/xhFjU+wHObTPE554VXJ3+oOS3WGrFvcKDAyqeKL2ImQ0MG9iKhBHg6kb2lTyo35jtqti6X4/L
	0ihww87TrlMJYZYTZLaSWSjJRKEAW+VEyMdG0qlSBkBt4jcETAHFf6jpx4T4NouyzwVrlzoMvcE
	acOCVJqb2BidQ+Wri4yVFyD1uyXsvxBIuycBusgBfCPZs3e1UcZnPYH5O7RuBUXw833EQHh3xHO
	r6R3jO7SadU0JUB6wjZFQpIUZcGWLyq4mA==
X-Received: by 2002:a05:6300:2414:b0:220:82c7:309c with SMTP id adf61e73a8af0-22608fb3070mr3625366637.7.1751651078744;
        Fri, 04 Jul 2025 10:44:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8Jl4EFpWHf5IwmZK4Vr8g/FAU4AIrSYjd7kWPFYX4w68L3NQh92fr5lAW9BcjJu7BoJ7+og==
X-Received: by 2002:a05:6300:2414:b0:220:82c7:309c with SMTP id adf61e73a8af0-22608fb3070mr3625338637.7.1751651078312;
        Fri, 04 Jul 2025 10:44:38 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce4180dd8sm2731263b3a.100.2025.07.04.10.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 10:44:38 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/ci: Uprev igt
Date: Fri,  4 Jul 2025 10:44:32 -0700
Message-ID: <20250704174433.693630-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: O3SdHpeh-6NnLAcbzTklabGRNpjHWvRW
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=68681307 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=8iDXaJqXtVj3SukbGHsA:9
 a=3WC7DwWrALyhR5TkjVHa:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: O3SdHpeh-6NnLAcbzTklabGRNpjHWvRW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDEzNCBTYWx0ZWRfXxAQGv4eQFGN2
 aj+6dTLOxdgB3frTaWgNGlDM0dVvWw7nZJtinESuFkN0rmvAFyXqfO/ll/rNhigsBenNZXK995S
 l/VIz1X1ybiyPsi/U9r9wOC2dh4qOivXPPBJSiLpowhJBBI93ct7njKMz3ZjlBzea/xvivS2IpI
 ozJKZfPodL9PtlihfaPrX478mtkB73WMLO2I9wvzesg0Ld2YDp9SVJ6S8to0x8DFe1mermVJgJX
 OEVx4wyaqQIdr6LZgZVWWrIbg0S7AmrXYa2ADlY5qOItavEty+Au4CLq3H3k8glfKRRCYLF+C8e
 rXEDLRJd6GFMxCLfIfA8Fhk1C6gKW/+WOzOKvKWPl5xgCPYeOVvZ5bcUBuJO6ORAQWKcHmKpgsZ
 HEZEhNCyYSS10vLsi65doUjlu2AyFBjO8Qy4TRPnWPuk5D+XArgB45Cl+3hFgoWfenHJMUHn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_06,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040134

Pull in igt updates that are a dependency for VM_BIND, and will reduce
msm_mapping flakes.

Skip msm_mapping@memptrs on sc7180 (the test should be checking for
preemption support, and skipping if it is not supported).

Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/77
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/ci/gitlab-ci.yml                             | 2 +-
 .../drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt    | 5 +++++
 .../ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt    | 5 +++++
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index 6f9b7beddcb3..d502d146b177 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -5,7 +5,7 @@ variables:
   UPSTREAM_REPO: https://gitlab.freedesktop.org/drm/kernel.git
   TARGET_BRANCH: drm-next
 
-  IGT_VERSION: 04bedb9238586b81d4d4ca62b02e584f6cfc77af
+  IGT_VERSION: 129d5b10baaadea1d6cd6377341c4cb42e7ee6fd
 
   DEQP_RUNNER_GIT_URL: https://gitlab.freedesktop.org/mesa/deqp-runner.git
   DEQP_RUNNER_GIT_TAG: v0.20.0
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt
index d4b8ba3a54a9..154b047787b2 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt
@@ -32,3 +32,8 @@ kms_display_modes@mst-extended-mode-negative
 
 # It causes other tests to fail, so skip it.
 kms_invalid_mode@overflow-vrefresh
+
+# sc7180 does not have APRIV, so memptrs is not protected.
+# (Preemption is not supported on devices that do not have
+# APRIV, so this is ok)
+msm/msm_mapping@memptrs
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt
index 022db559cc7d..a9bb3e1ad75c 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt
@@ -23,3 +23,8 @@ core_hotunplug.*
 # https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/162
 kms_display_modes@extended-mode-basic
 kms_display_modes@mst-extended-mode-negative
+
+# sc7180 does not have APRIV, so memptrs is not protected.
+# (Preemption is not supported on devices that do not have
+# APRIV, so this is ok)
+msm/msm_mapping@memptrs
-- 
2.50.0

