Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10C627FB3F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 18:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148362; cv=none; b=blP/eq/YEhUz2exHc/a0/t6/Tcwdl8/Y7DhGmP6+mDGz7XYFxnmuE0kwl7ftyWiXN9iSnuZLdx/87nwYv3XhQ6zdbmUUbx0zDXAgooIldoZ/bGULFIUo0lP07okDrSOkABg6YvOvIovl/GJfP6DpKOVne5qlx7SM3e+iFdNofPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148362; c=relaxed/simple;
	bh=CbdUzDS0r5evR14HE2y2m9T+o2DmOJlOXmMaAhyMoOI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PGUAdk4NALYuqGFz1IHp7gC78SnSpxlXh23ktO2bsoEH/K4fXIf88EsEE4D/+0CHnJwsk+pdiRkl8fp5qNRyUH1XGS0ZUTt2JBIYO/M5Yilflo8+a8TXRY5pswvQCeMRLDcQ3sr7ow+8eq5vK2/BYrzh83jP1s/pDhWp2AW2AZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TdAgdvEx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TdAgdvEx"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555AGvbG023897
	for <linux-kernel@vger.kernel.org>; Thu, 5 Jun 2025 18:32:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vb+Q3ccg7Qa
	sQsi7gj8/5KoBXUBkdYd/cEtWLqH67ms=; b=TdAgdvExjgLyGj34idphX4xSZZ7
	pgITHojzHMnYNLmEHWmE4ZKRINmCWwMX2v/X9Bb1lCsAC/BXVtoG7/9cXZwKhEqh
	cftJJCR1uhcgs8LQ/FvCcVbuS/AFDM6Hs599yk/7hqAieIUmy8FekRqeZIxwV2t5
	ZBDkDCf8Blm4LxPgQ7NzmScNC5n1fNjVTAkx82Le/2vMFA9CIigDoV5gZTwiMKOm
	HeyPvANF+SLmQ3aud4HAprnJH9KDH9COrJIcobX18Ckmc+TF9NNtxutC5fbhxN4t
	jPJn3m1/0pgkL62zsyVZgzVV6A+8CiS9ootUTpFz3I6AIFRsGhSqNRf6C9Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 472mn04kac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 18:32:39 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-235e1d70d67so11789225ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 11:32:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749148358; x=1749753158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vb+Q3ccg7QasQsi7gj8/5KoBXUBkdYd/cEtWLqH67ms=;
        b=fN2F/1AHia8AA9lqhaqBt1pZ9Zes99ct/6E3ZrSK032ZCG2j+exKn7D7G/Ft8weHv2
         j5teLOB80zcwKLfVOyDLvMQhHoEpy18oCpafJ8S+jX6rBDDGB8Of1AxYnoMQZFeZ1tvh
         z+trUqqconc3Gw2ATWNVJ/GsIk+x10deK5fHx6YPkJndQUiqPNETX8R63Wa2piEP+kX8
         vi1h8r6OcbxlA8x0fP7r8U+7fXjr82vid6V/gu9kF24LP6SdO/Gbsmg8Qaa+RL4UHrDx
         Kyfg8myg5u4hgHtgaszya8P9QPF+A5P1k2uGD+0BG1l9LBqvK+qkuJjqHv8piYDGX+Ug
         82Rg==
X-Forwarded-Encrypted: i=1; AJvYcCUjy6JAgtVrpuoMkc2CSe6MZ34Pz49DpowAC5m02XX88C3WGvn2edLnO09CwZWRv5yR6x4rbqG9YGuYU90=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1SnvEY0yEwDV5lB7eAejs4ORrhVYv7E6PCkLqcgxm4ZOHlwNl
	Jy3xhyaXnhyaSr331eNdYDw72iB/TLk2vnxWZvhTQ/OC4lzf2/yRVRCzYfDkVexpYdlEXFXwcgZ
	MsBH/Jm5cUovfmwQYv3cbTYO/CZhJkgG5r0axwEO54yEJe6WTNV1PBprlkuRJpZwCTlE=
X-Gm-Gg: ASbGncuMu3bbyezNP/OWngPrVS+olVWQPrjIxdVcaoHw9jNTdHi7XhqJBR0dbUI8aS0
	VsVihYew4ehIy7xXB2A2rVJ0KKAQz61pLSPRpSNn/DUhtDhrdq2wl4oTItB453Q3kiDV5slqJnP
	lohDkwx9+d9ZyRKJ6ZngJzJBd58OaJfjIYJ89uh5R04BL2wzhbwgGZgn/sWpTMni4DBonqfd+g7
	RfaSATfQPPcJKbA2bH0tLky5/gX2UfzRmywTZunzVdDSJQuagK9+RiXY67FRrs0L2Rc+bHjm7tt
	dVi7U4yS/m7qHV6Z8ntlKw==
X-Received: by 2002:a17:902:fc4b:b0:234:8c64:7875 with SMTP id d9443c01a7336-23601d96e8dmr6602415ad.38.1749148358328;
        Thu, 05 Jun 2025 11:32:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhgBS88FiFnJWBPK5j4gpjhnAM+FBu71NhFYDWj/9txYixjz/XfgZjlMTKenwua3ROM/Jrug==
X-Received: by 2002:a17:902:fc4b:b0:234:8c64:7875 with SMTP id d9443c01a7336-23601d96e8dmr6602035ad.38.1749148357957;
        Thu, 05 Jun 2025 11:32:37 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-235e1e4ec12sm30594695ad.11.2025.06.05.11.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 11:32:37 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 10/40] drm/msm: Refcount framebuffer pins
Date: Thu,  5 Jun 2025 11:28:55 -0700
Message-ID: <20250605183111.163594-11-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
References: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 6L2EFGPaqPXsoesUmD-F5PfOxeE-G2mH
X-Proofpoint-GUID: 6L2EFGPaqPXsoesUmD-F5PfOxeE-G2mH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NSBTYWx0ZWRfX0/x2okmqiTGL
 ROeqDg400UBm/i6lkek0Hg0YHmUE4bK86DlK3YmGC4DlClFkXQfOrKPOiF6tcpohnRuUlTYqOOM
 GKgcpdIen8x/jGBIYdBGd+u0v8KRxVFDzsm25iCSIssnQllKbl7iRsb9c5SVf0fmuuvaW/0wmI0
 PSTV98QQJc7yjJ5vytGr0ufIwE20Ybnwn+QRYR0zeVZZDrT9Ux5LeZLa+NRQHGd4H3nH/QGK/Vj
 OP4YRVukmePOO4sZ0Sr9lfiBBDuxivPN457i3/MXoGPFdSZtmEsGBIzQKkgQWVoMB3EKSvUzwL7
 GnKSKbYt8xklGO02+6I9ZtIYALAxxUaZxxHmoyaLeP/YQo+7IbnhjSMtalqxRAsrlNe4aqkb/dK
 AcosGk65ip+wl4hGcYJubtJnsrqEgdAWp2xffrm3Xr7+dNhoEqIeL8XSsmypOvm2sQvZTlyI
X-Authority-Analysis: v=2.4 cv=Y8/4sgeN c=1 sm=1 tr=0 ts=6841e2c7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=MhmIxDhvR8qEtQvFyXAA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0 phishscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506050165

We were already keeping a refcount of # of prepares (pins), to clear the
iova array.  Use that to avoid unpinning the iova until the last cleanup
(unpin).  This way, when msm_gem_unpin_iova() actually tears down the
mapping, we won't have problems if the fb is being scanned out on
another display (for example).

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_fb.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index 8a3b88130f4d..3b17d83f6673 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -85,7 +85,8 @@ int msm_framebuffer_prepare(struct drm_framebuffer *fb, bool needs_dirtyfb)
 	if (needs_dirtyfb)
 		refcount_inc(&msm_fb->dirtyfb);
 
-	atomic_inc(&msm_fb->prepare_count);
+	if (atomic_inc_return(&msm_fb->prepare_count) > 1)
+		return 0;
 
 	for (i = 0; i < n; i++) {
 		ret = msm_gem_get_and_pin_iova(fb->obj[i], vm, &msm_fb->iova[i]);
@@ -108,11 +109,13 @@ void msm_framebuffer_cleanup(struct drm_framebuffer *fb, bool needed_dirtyfb)
 	if (needed_dirtyfb)
 		refcount_dec(&msm_fb->dirtyfb);
 
+	if (atomic_dec_return(&msm_fb->prepare_count))
+		return;
+
+	memset(msm_fb->iova, 0, sizeof(msm_fb->iova));
+
 	for (i = 0; i < n; i++)
 		msm_gem_unpin_iova(fb->obj[i], vm);
-
-	if (!atomic_dec_return(&msm_fb->prepare_count))
-		memset(msm_fb->iova, 0, sizeof(msm_fb->iova));
 }
 
 uint32_t msm_framebuffer_iova(struct drm_framebuffer *fb, int plane)
-- 
2.49.0

