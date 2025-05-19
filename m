Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B74328BA83
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747670721; cv=none; b=SLtgGHRplwREU4aXAPDzAgFUHl+1Uy6IXo38rlr8LpYEDvrlMNymAlSW/Ba9BAgEG6rxjiWBImZhXqoxHRPNBHZyALVwXfibywwW9tuuCzJs4ZXY2Vha9yoBtqD1LTJ8xPcWa9hxsq0+/pvoycp0y4tAX7WZ3Chvx0JjU+RLy0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747670721; c=relaxed/simple;
	bh=t2rqZbeYk+R8xNWDXho+RFV9ioO4+IpUNxIqyujbeME=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TzVjWXURDEZmd6W4TvgUSgOUS+db3954wfBsGZFKMKrafu3tb7Y0acFPYk+FYtkhtsb2/iFKIxJzOjHb/BPMMnyDxsoXVXnFJ6bRrBzq7k0r41Ydw1qVW/xO7TKkM5d399Hgu6IOMOGiEJbzCNPhfnmx6x1If1bwACPHq5Bkft0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=grqgZ2fF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="grqgZ2fF"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JDhfbc028704
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:05:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YsTiHmb7isyOGDE8/KruduhKbyDLygH1h/oqB0G8slw=; b=grqgZ2fFQ9BTdgqv
	yCZh6AL7rJj+RInWywzUr/B2eIKUI+OtTXjAbpiKxSG4DjW67IXaoiXdRP3Nqjmo
	8Bt4N2yzjYWY1yExF4ajwKmphNSFaCDpAoFhiVLf3B+En52caYR4MSyQsxsPHtb4
	gN9yJRQVM7+tXlHt/JvOys5LOgp7wUokyrDLd/sK7K1GN7jdwn9jKIR+w945iA18
	g38J0RmIop2JuqzvP1thKIoKqnczIueyoAVmadeCDiOET9w0UrSkvHeUqGQyeYbt
	IS7/06FZKSIDfIdUEytVdcfYQP+ojeOzOzfM1HfQ64s+/1+NN7pB2leZ1LI8ttVX
	0ZSQfA==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pju7cvxg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:05:17 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-400b1222c6dso3888880b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 09:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747670717; x=1748275517;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YsTiHmb7isyOGDE8/KruduhKbyDLygH1h/oqB0G8slw=;
        b=LNqzuv+eKv8xmhRXhTfrNgRLmfyUg0SZyvwLbVADPUjbY6Xie5PpZQ6TnzWmcXs/1V
         4tFftEarOz7ZYV71/RtslgSbbhK/UEVz+XNfqe+CkFjVrN56B7T+uzY7E1XsZHe9kNLN
         hnvIeld0ww4jNMKuUiz8SqZrbo9RN0HZ834g/7G8jwKFvb4+p1UI30reOWJXhf//bXuy
         qYXqCi6gSZLOETkYjKGifKkw+uUZQExQY/6ePeyAhQMhbfllIW7Y0py5svnubXfwtD4X
         4nVQ/nenZmU3HmDIdU1cE4l3pmRUow1SRbMn0hXHXGKWQGeF8ulAcYvn5dQJHcAimBm2
         WVDg==
X-Forwarded-Encrypted: i=1; AJvYcCUNJD5NiRdfoBQM7VCaeIyVpwXP1qCr/sYY18d72fNlsF6ew50UCtaYOY8pWxySyvg4jTF9W/nQzA69bYc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCSN9aBbW6CjLiLmFOt3cdXMa8l5dnPP357G1jP1V6xpon61m3
	fBKocgzrcqYsbd8+TUYDnrYI1wDIda9N/KAoToYpLK7gYVKxCsvmcYNkqYBBJAxjW2531L3HkXS
	aKaclHUUKZJ1dxXenQEV/4yuug3fh1hYzJGNvaKjjZdEbixalAVFcSf5GQoWuJs2gQNNQu+wIaX
	o=
X-Gm-Gg: ASbGncu+xBebdLYzT/J9zBHrZw2hblcomWRyGGR8DQJJQVUhdEs8sarAbRlQ7YzYTNG
	gcXM28bxfjXTnyXF/rdDtWHNOYh8kK95wQRIuFpC0RJ5EYotXGH3bRNqAlI79LePPjCxSW/jMo2
	HDsEnOCY2XE5XcAGiWcLgnvdOeYOjGTrhPsE0XBA0nMJWbbRU6IBsmgWB7H8nNkoRmcKyuSUPdI
	O2Z+dfrRgHr7BSDCCc0yM12AFxUn2jST0BvFabQ38eTuKJ0Y6PRzBb1XfBX6tX1HF3EucmxERZu
	4ErbzVmGHWb1+lc4FC7aOUyUIbQj0NQzaE5Q6xsDL0b5mH/+uGulp7f1pspb1i9DBVV3JXq4g0F
	8n9jqNT9fHFbUn4nC2L2FwiNF
X-Received: by 2002:a05:6808:80b2:b0:401:e61b:fe9c with SMTP id 5614622812f47-404da74dff5mr8212323b6e.20.1747670716695;
        Mon, 19 May 2025 09:05:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEe4piQ562b4IOVlspGzW1msi0MQVT0roIPekkjKhApRunVY8STLa/lKHyb7Sfjigf0Vz9hDg==
X-Received: by 2002:a05:6808:80b2:b0:401:e61b:fe9c with SMTP id 5614622812f47-404da74dff5mr8212292b6e.20.1747670716365;
        Mon, 19 May 2025 09:05:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f6f1sm1919378e87.248.2025.05.19.09.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 09:05:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:04:29 +0300
Subject: [PATCH v4 27/30] drm/msm/dpu: drop unused MDP TOP features
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-dpu-drop-features-v4-27-6c5e88e31383@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1094;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=35MNqdGvRYdhOY1x12AD2ENSpIyXidrM7J4u6sckI88=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoK1Z9GtkSD7GO8np7rUoAPPvY9u3OyoyXxiVmR
 mTnJv+kZ3CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCtWfQAKCRCLPIo+Aiko
 1dmuB/9l91KzLmh6ICG00cmsuDjo+lRclidTnIkHB3cZDpt7aXjjXGYF1PL6rF31Ybg065aUiry
 EpsHViQ4PU24UoL74miDjFbJHl7PxouVD5uwXewnDqeBtSSu11Gr1EWqB3tMBkhBgv1Cy14reAD
 vV6B4+cUXHeykRD5f+tDnXmqNCmAltwySmMPfErk45931ZGXGcuU7DZU3dzg7/Y5kINZZWMc7N0
 eoBVL8UT8817QgJqv2Mu8Bgb0EIBTrYD6q0cbiTTEH4WiGjm2XFAjZZZ99LFlwdCl5ZkZH03xKa
 yqIfL0vk+wVXXvMxQBGfFYYqOD3aVT6Ki2OT55m+v+I5fYcy
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=XKEwSRhE c=1 sm=1 tr=0 ts=682b56bd cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=8brcGD95nZB0FecW0AkA:9
 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: SC39VL1bqk73NgFYMZdOdQ4JMJxc-_Ml
X-Proofpoint-GUID: SC39VL1bqk73NgFYMZdOdQ4JMJxc-_Ml
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfX1GZA1Tz8/m84
 Ck3UrPkbotICoe95dt16+gwfN6s7PmcNkBeiSmLcW82pDSVV5CfVuedLxFyojMut2pyf1+awJqJ
 pM/pGgxk5YeKfw1nOBgRKvpCY+TWign/wVJRkmOi62Pv7VdNK54iuBH7K8YByy5LefZQVFqpU9e
 WEwmI65BpNhlXpAXn9+7SnRF4RpZraa2Y36TfNlqh4GF4i+O0QrEvYG7+s6pf/O+LNjkqkZSzfr
 5BNORZm8cI1EtKLobSE7pJK1pPM9ReB3XJuOqPaNlm7YmFcSiBx7r9BCR+qTYwPa7Sne0JtF11h
 WF75CxTyZDD7/eMDCMe7X07jnh4qmqAIe1mrm+6pCkufK4QMLn+k9cBuaS1HJRpB9HeQ6qC+dMQ
 y8nyT9NfE+EY24ZIG+8oAUYcfYrJHii9+O4wu+HpolX9aN34QooNKQgDB/plrmyY4hkFGFD7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0 mlxscore=0
 mlxlogscore=722 phishscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190150

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Drop unused MDP TOP features from the current codebase.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index c582ef1ffe022f2e92b1b80cbab97ff41a2acfe9..9658561c4cb653ca86094d67f7b5dc92d36d38cd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -28,19 +28,6 @@
 
 #define MAX_XIN_COUNT 16
 
-/**
- * MDP TOP BLOCK features
- * @DPU_MDP_PANIC_PER_PIPE Panic configuration needs to be done per pipe
- * @DPU_MDP_10BIT_SUPPORT, Chipset supports 10 bit pixel formats
- * @DPU_MDP_MAX            Maximum value
-
- */
-enum {
-	DPU_MDP_PANIC_PER_PIPE = 0x1,
-	DPU_MDP_10BIT_SUPPORT,
-	DPU_MDP_MAX
-};
-
 /**
  * SSPP sub-blocks/features
  * @DPU_SSPP_SCALER_QSEED2,  QSEED2 algorithm support

-- 
2.39.5

