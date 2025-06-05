Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB4828937A
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 18:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148425; cv=none; b=tarBmokdJL4gcqYHfkrDLLaMX0Va+SwN5s4VZ+/d9Dipi4xnZYSPkB+CE7vtphG4vWVG2z0UCiUkODcU93fZxA7/X5o7yNuGbUMA2OkSomK3Jzku9K8x8jK2V2ph8MQN60zqk3Zz04qQB0pSfZXE3WAsI/qwIf9RMk6d5UUDi04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148425; c=relaxed/simple;
	bh=Yc9/xrKw3NesAc8iIakavO1+bxkLrBo6rWFNSTz0mhM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yt63Z4s1irSeNJ7oQKWaUrxwRpnwLtgubZxrY2iVRSP25ybIlUBS32jygnXcuV3wqQnqs2rkgRfANXj4hBEe0qEbTDU1PC24X/T8VV5UDLdJCKelj+zdz/WhSaKljNDGRTTCmgEIIWm1S0L+IBIoHw72S5ikccEAwJ2XT58lhbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ceXA9Wbu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ceXA9Wbu"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555I06f9020310
	for <linux-kernel@vger.kernel.org>; Thu, 5 Jun 2025 18:33:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VHBzJXi95z6
	O97WECG8ege8Ip+1ENafn5APqxEppLk8=; b=ceXA9WbuldePiP1fwN6+udy+e1k
	zqyUbAgBYusWJWfHYY4kfFm/K0aawt/sYiW1G8BSm2EE0nTADmh60oO7FVz0vQMR
	z/tF0PAbx7foEOk99mZtnt4zHGmpblk0em+WjnIKT6Zc74UFxpG3rXjmBWPpsLZE
	W60X/0laxlF+KYplboT16JvyXU6EAApu3SPYzU3f/43CDr7TSQa/eWApHT3uV6fW
	5EJmuRZ+J6pX9bLeQfeEhhs920qfkyS777SN2amt0KYFv2EUYfo+vpzzESp/BGB9
	hQfgixpIwqPw9LEG+Q7YY4/Hxkf6xl5cdU4uRviMZgtv+uUqIFgr3mh2o2A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8nta2v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 18:33:38 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7480d44e6f9so1258044b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 11:33:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749148402; x=1749753202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VHBzJXi95z6O97WECG8ege8Ip+1ENafn5APqxEppLk8=;
        b=Po/xe/EQY43GNLM8QHbIvQEGuEJcBS9QyPTgtMHacmQCqp4V2FsayeYNUuA6x/YE3X
         I7hRXmgvv5vOHLCMws9d1H9tc38/vLgXiRqoxPqjrX8uqMJ3HsHXXLZtogCtv9FlnOHz
         ZN1JNGKb8KPENLavaOxypULfbh94x3IjiOuLs7VNmhguD6Un9EjLcUgo8sNiyMcpvH7Z
         Mv0UBcEAk4Qq2k9ByTYyBIfsBbkGWRkqMbZxIIp2PDLU0Vk2a9CZNJCMS7P/NGpdNZJq
         19mTUPFjRBVhk1mbnYfoYOUvWe6nTdq/w7bVbFwgHFoDllhg0tlSCM/RLzv6CPuyW54t
         1YQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVNwAd4WpttkBf89nxOfXliRwoejDiQemrAoWPicqevPnp/EG2wNtnzdVrBuIAWq+vUB+krSpMSAsks/o=@vger.kernel.org
X-Gm-Message-State: AOJu0YweHFhD+o/mGEok9rIqvLXALdfcCmLQykjpi5Q3HAgCISKhVknH
	j5gNXNRtoSRdObxkd8dACIdULCZpj+lpA5RvzGfv0ANKnttucEIelJSqSqvv+uTzdx2PDKY0JpA
	9BkEZBoYjqawv8BTjy/OQxJd37U+mncJzVie3WQ/VYhi5DtfMuVN0nR/xkp3bGe5PfcM=
X-Gm-Gg: ASbGncsCd8vT9lKTZQHIhvtOJDcpoG/Ci34SPzRrs7RwTB45Xf2XLaBPL3SXezCMTgS
	mfNWEXZcc9xo4PiG6Fi6HVsRul77a9Gj4lt/5z7fc4Oi/kPVvRZpBqIC/MWd5/e1lRdPe/+yCqS
	Ystgya91ivWITv74o4/8a5FfIKH28hiiTDvSiqA6tMwfGlR87Krbfnmw9qWUkaBIpT8hmgAPSz9
	4Uz03VYLCfJAzi6BvnShq9xgZpJIfMd/iSxmMkffpRFzDuOixXZw1tHYGDiGTRNOSlz4H7a+PKf
	YzEAF1ch/txnpiOj8+VGjw==
X-Received: by 2002:a05:6a00:1a8d:b0:73e:2d76:9eb1 with SMTP id d2e1a72fcca58-74827e80628mr887803b3a.10.1749148402062;
        Thu, 05 Jun 2025 11:33:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBuTKC6/naA3f/kWh7qz2oby28B2fruyWvYz+LKZRKvKVwuNe4K9bJXRX956fiwilQlAHacg==
X-Received: by 2002:a05:6a00:1a8d:b0:73e:2d76:9eb1 with SMTP id d2e1a72fcca58-74827e80628mr887775b3a.10.1749148401687;
        Thu, 05 Jun 2025 11:33:21 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afeaba2esm13094969b3a.49.2025.06.05.11.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 11:33:21 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 38/40] drm/msm: Bump UAPI version
Date: Thu,  5 Jun 2025 11:29:23 -0700
Message-ID: <20250605183111.163594-39-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: CXXr18v0JHJbbA7-RRPDF2r4NBx_uZqw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NSBTYWx0ZWRfX2+41LNGGBZo6
 OfqRgWTXWJjsfMP9v6xVCMrLFdoF6KgmSX+w5VxxfJU4QuuLU65DLXWXOLHU5VZDdwkRaaucWNc
 yKrjok9T45xwLf4TO6ZvS2wc8AuyeAXHb+y7jfhdZ7B+Gs/Y21AwcM50Hvp/lZVppQ/kC740aUn
 w/x12CXCpQ+MTXM3/L6umrWdfWWqg5ef4MbK6aDkLubM6tOL/u7sPwng9en0HenZX2puTbEGLPP
 Ls0cCML+jGeMnNqaPW51aFgeAdCHXp5gcBMUky0vqbr1IoCBWhvb6dFixXAgWZ7olrWUIFX33ZV
 FUn5bz02Fdv5Z9r7vzLQhI702P+F8nUt3AqWya9PH/Vb1d8cFYl67VeR4Mqg7qj+Ay3DObNWYAD
 nm5BEcV89Lmx8Enkh4gfx/gJygK4F2NuEoAXdooK7pAVCGxd5PQCJxUfB7dvb5qZX5qbIPmv
X-Proofpoint-ORIG-GUID: CXXr18v0JHJbbA7-RRPDF2r4NBx_uZqw
X-Authority-Analysis: v=2.4 cv=UphjN/wB c=1 sm=1 tr=0 ts=6841e302 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=KgEaFMypzpKrXJt10QQA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 malwarescore=0 adultscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050165

From: Rob Clark <robdclark@chromium.org>

Bump version to signal to userspace that VM_BIND is supported.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index bdf775897de8..710046906229 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -41,9 +41,10 @@
  * - 1.10.0 - Add MSM_SUBMIT_BO_NO_IMPLICIT
  * - 1.11.0 - Add wait boost (MSM_WAIT_FENCE_BOOST, MSM_PREP_BOOST)
  * - 1.12.0 - Add MSM_INFO_SET_METADATA and MSM_INFO_GET_METADATA
+ * - 1.13.0 - Add VM_BIND
  */
 #define MSM_VERSION_MAJOR	1
-#define MSM_VERSION_MINOR	12
+#define MSM_VERSION_MINOR	13
 #define MSM_VERSION_PATCHLEVEL	0
 
 bool dumpstate;
-- 
2.49.0

