Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7A423E32D
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751228192; cv=none; b=uYSpE38zlCFlgQeUkHztS5CkZ6A0oB3WdB08Ie+4diZCGcDv2cv5WhNsAGGIeF/IdRH8fahuJZJ24PvBzY86vRG1ks+FWp+lmG7EeiEK/omX4aDfSIVqVVYhWAXPOhF1nqXdHTqny2zS/f504QKhKMWepCn+dmhSJXoKKE0nC10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751228192; c=relaxed/simple;
	bh=LF3WmOXEduF0Yox49Tqnc+p3MIWedMqeUKG9yrG7bm4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oMs2qypukNXu7DLVbCXDP29ggMUxKjnG0ZnTWhilYphN3gqbvr4dUHK/IecldDD+oWnoW8F9oSAvGnDXIOnnf5WqY5f4yHltNQsHl38AF1vYks8GUfvurhUEHxgawT115syf0r78THlChvurim0273NfFhJlh/NDcHA8J0rUQdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e4u/sYh2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e4u/sYh2"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TKC7tO027812
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:16:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gBDfAmEkonF
	ZxrTQANE1o507a0jHlpQ+o9S1Q9lveGU=; b=e4u/sYh26Nu+yUfdzM8Vm2zWilv
	XJBsX7EHwcKoHwP8YGOgaSdTUZZ2vzfbSEGoboK/KdGO1Z8343Ihc4Wjw4yxmsMD
	cZN5TwIeKJDgr0pv6b7dayED+I9nWDQdu6/S9NOZn9VMO8Ml90KzkDNGvglE7QnR
	z88U9I+Xw6H42rEGwHzV4THbVlu78CBK1d1BYeqXKxZoE1Tg/ODFQL6Lf5RXqDAW
	28tic4tDS5qdoKNkmzTFgGaBXpmEe4tgjFbS/JxU1Gd8Y3qYVjjyxWnlgN6Xktsk
	Dugrte7Vxjnrtf+lfibvnFa7rd/VL8o0/Nn/LIIX+TLVXX1C2ImXfjo3vNQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qm2mse-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:16:29 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b115fb801bcso4626588a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 13:16:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751228188; x=1751832988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gBDfAmEkonFZxrTQANE1o507a0jHlpQ+o9S1Q9lveGU=;
        b=sjdZN2SyWeGgjwJevREJbwd0bv95ek7dN8pcPPAGxeK5Yf1ShvIvzMK2+/cJY1WBqg
         sFsQC7v9b2CYc/6s76aLl+0TlForJgaBxOpiIk6BogYuDl5nujCEcrEd1tKNKJzNN9gZ
         uoFfdWH1t3dEmvDioBlbriP9J7+oNbdi17qdNX1LzYuUhXU38vXfNZLC45K2Xldtxl9Q
         4mNh+TxAWA+FRx0ZYEa4pxMfcXxkInBwy5Y0oubXRNVG7mR80BOvyYIF3T9LkjjhN101
         Gz7v8ki6w3qB7x2G2T7098jE4onZBKki9KKFzAeczZozGWkLpWvZbnUJjBRK6aIKq3xO
         x/wQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/ldno0ZHbUfzOm83fp7Xl80l4HtojvSLJZnETAZ681szn6Qf0oiUFwgEnFoajF6TUI42n9Rz8Ii4mop4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg8FciHNg08ip4DI8e/cZ1/7B0JvsvooRzvL7n+1nuB8kkbBYl
	kHYjuhDzoZSWmeACGWm1rMk+GsEow9aRRzFCUwKFpnyt7eA0NnsEkIdnuXCO5SYl1qXKHn7xQzR
	3b9bWqQHxrojGB2QPsSPn1/W2ivGttSopu07wyWdZoWKeSmgJDKz4m67EydcAe52uUCU=
X-Gm-Gg: ASbGncuMJTfk2JQ6z0jGFxlt7YHq7W76lS5bTlnNmDPnTn8gswaXKvXVt5LOU48xAqM
	Ofxneg5qM0aYxIbwQub7CZNkkn0eZZaguSII6eQ+xXavBxzRWUo4Bz3vQ1lamdX4FwW807w7Qcx
	8LrmwgO8RoLgNFnCBNP4nrKTivXjsjbNB2QdLM1bWmeN1blTGeuCidsFx+YlNrkIpT8Tb77IC5z
	LA2yV+y9LEuwSAny/Xz2uupr7rhab2qktNm9biDRME6QANmaA6pb1DRRVjH9gm4b9Vvwo/FAGwG
	1GBTL9hNDdt/hSPAQdPBXr3rYFwVNHqk6g==
X-Received: by 2002:a05:6a20:6a28:b0:21f:53e4:1930 with SMTP id adf61e73a8af0-220a181b968mr17871079637.22.1751228188449;
        Sun, 29 Jun 2025 13:16:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxxbBSzM9ICK5hml2CqQZ7X32XpGFPJlqTsRIpEN5BqVeVXDnuT+nk46z1uPRQyZhJCmaLVA==
X-Received: by 2002:a05:6a20:6a28:b0:21f:53e4:1930 with SMTP id adf61e73a8af0-220a181b968mr17871048637.22.1751228188064;
        Sun, 29 Jun 2025 13:16:28 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af541d233sm7603622b3a.61.2025.06.29.13.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 13:16:27 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Danilo Krummrich <dakr@redhat.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v9 12/42] drm/msm: Refcount framebuffer pins
Date: Sun, 29 Jun 2025 13:12:55 -0700
Message-ID: <20250629201530.25775-13-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=68619f1d cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=MhmIxDhvR8qEtQvFyXAA:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: PEvRSSzeQRp5tquWRJluJXwdGjxgcH-6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfXyP37o0AgYBG7
 igzYb5OiCre3jB3HFuZB103tGNdb6i8Gb8H5pZRCjDNLMjK4ue1n7+iVmqYKikD4ofgqUSPxVv1
 aDtuurBNo5qR8RQ4EYoDJ98Oq0qnRauTByaWeLn6nahElzn5790bael6xVE6XzFF84ocREtVxXX
 A/6iAcUMltKTYeFX8Pb4vZ945kxLkDr9YHOMOT2HNwyvxDgBddgXIsgp4uG2cQTmf2SQvD2qmuJ
 Te671FwSJy7/R1NWSoxBemi3+kPTbJGeevg8Kwq1cm/gjKLsoYvcRw8brRqE1Wq350GTrKVhXOZ
 qO5+5tJmXQk4YMj7CCEuitoqAp/nWr/U7vz8odGAMwpuGDSHHLf5QfZY+PwD3YsCBdH7XDuPrLB
 cLF8AY1R1yAILt0/mGZHy54coMtlwYbRQr3sbPvb5cnIX6MIHivwjX6Ep180sQTqAROuMoF1
X-Proofpoint-GUID: PEvRSSzeQRp5tquWRJluJXwdGjxgcH-6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290172

We were already keeping a refcount of # of prepares (pins), to clear the
iova array.  Use that to avoid unpinning the iova until the last cleanup
(unpin).  This way, when msm_gem_unpin_iova() actually tears down the
mapping, we won't have problems if the fb is being scanned out on
another display (for example).

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
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
2.50.0

