Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49BD2FCE2B
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750877966; cv=none; b=i8R8Td6GaXj4RMIcIIrMq4NHh2zwtyhhBDQJu7Ki5aEv6vOqUZr9hfL6CuByiqsW2MrKxd/r2de7R28HFaOAU5+qdPXP5nRuj5TududUeKRCYsKKRLgZJqWgjScQ9STPfI98Mbbwg7V6kKp4MnGAcJFWNZPTKn1R+liIlQSzorQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750877966; c=relaxed/simple;
	bh=Yc9/xrKw3NesAc8iIakavO1+bxkLrBo6rWFNSTz0mhM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GfNc7Hl0Njv30Ss7G59U9YIdKur805ErquOqxRI7/4oC5PAIVvUMqbigunsBQ08ZwceGxCePdU+eIvBaj5U0h7B8ZC77JDbMTxyIXxqABWut9XJnxCvAa5wWG5z8kZXooOnMK2x5/+EuTtaNS1JqHl6ApeXRLjBh1spcSPkJ5XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aXY8dKKs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aXY8dKKs"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PCdV7N019166
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:59:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VHBzJXi95z6
	O97WECG8ege8Ip+1ENafn5APqxEppLk8=; b=aXY8dKKsLj/cT/1qK7TVhpav/7L
	UPP86Cr1vsRkmb0BWeGizTgB/q5Qx91qYGLq8/lts3a5LNr2x4p4SZJMxRi6bGKN
	PwdFBELzWvU5FTiWkhGYv1H87BJINRiiCtbtgu1VM5LAka/a98HsKnzn99H3Z/BP
	wv9VzFGfQIkEI3RH+C85UirTfCdKiWozEJjC7NbYofLAq/TjiR/ciwrYsTSGHfV+
	XMvkAZbexekRF4xD85S7FROndkdWfJQdRUw8E0XlKBV5vcCCRmVP8BJrNWSB6y72
	AK1KBhhS7aZiISGhY9EFFKEMbsLPy38kgK/uJOZIxLkkiZiNSfIo1hYUYwA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfwy7vh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:59:23 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7398d70abbfso257432b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:59:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750877962; x=1751482762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VHBzJXi95z6O97WECG8ege8Ip+1ENafn5APqxEppLk8=;
        b=P85zgfr7PE8XTWWXA1QdbPNWn5CvHiz+awJmz1Cn/lbtHC9N29cdDUhqldUPBc6SMa
         I7ZV+BvdmDhBhk8y95GrAeDPitLgrbHSGFECxAN8ygpQSz8jwIrhgBCJtInX4jgGnNMF
         KwCYeJLxYmJhpaOK98aX7kbL+KZhH7x2u2UxsPn0GpzriIS3KuEagzWEn3mTGn02/ppH
         ufb04++Cx62yTqWre7q5myGXTHL5/gZ76kYu1q509l2QJyU8rJ2oopJFB/7xsuyfGxCl
         hafDqEdecWWY9UCHnBFmYOOqdDnwSd0A2GukfXhq0/CztTwPCbOcISK4Kln/QuY6eKek
         ihWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlgzVLPVpY2ffzFytCyBg7tzL99hNXjjbIMoK06xlywgF0ksPaUrZExbgvvF/NxcO5Tq4UrcGx2/NyKXM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaAVhKaEoYtW4Sp3J8B+h4mTFQ8kSeJrYHJzhGmon9EunUiJ14
	3ppTadNbfTO0tloCJ5r38003rI8UXZe3SWH3x4WAOj/vBbuilBv+V1659r4tW4gayLaBXKfCVF0
	nuW+a5CoROHchG6eiiF4MBU30kH1zRogUQYLLREh3hZ7UfICoF/EB5yuW6Ywu+utgksk=
X-Gm-Gg: ASbGncvHW8RmOaVqCXOa1AVl9GkOvrwGxKdPQ43NvcJdNTRyUKBue9xZlLvYNAo/ABF
	RYfguhQdt3G3p+9HZfTnCzRr5bEm9/T+RAJ0YINYh2YzPA27u4WB1cHYXzQobgCCJ5qOj89VjmW
	YjBmqnzZEEokHSIW1LvttsZ+pe0x7ZHhOVXNP14OcWRPINOVxnJ1sGQogsbpBgfgiMxHuRLnqrZ
	rVkitQeQEuRfs5AUsBQ5rMf82lTUhLKmq1Qc8hpGo/ZqxUgVRPbSQmAVo1f6JJowAVhnQNnj5b7
	EUBYdSLW/j7JJUFSrMPKslnanWOsLJrl
X-Received: by 2002:a05:6a21:596:b0:21f:5598:4c2c with SMTP id adf61e73a8af0-2207f192b9fmr6464792637.13.1750877962243;
        Wed, 25 Jun 2025 11:59:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdvmmyyyzB3Yjf1DpzF4jlr0xSFd/MY9FsPMtHRz/B0Yw+Ld6nyFDHhrmVvlIxCATF6VP5Sg==
X-Received: by 2002:a05:6a21:596:b0:21f:5598:4c2c with SMTP id adf61e73a8af0-2207f192b9fmr6464773637.13.1750877961841;
        Wed, 25 Jun 2025 11:59:21 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749c889d219sm4961586b3a.180.2025.06.25.11.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 11:59:21 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 40/42] drm/msm: Bump UAPI version
Date: Wed, 25 Jun 2025 11:47:33 -0700
Message-ID: <20250625184918.124608-41-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: YCwffKY7dyzu3hKFn8hDQWkDAlBDA6B1
X-Proofpoint-ORIG-GUID: YCwffKY7dyzu3hKFn8hDQWkDAlBDA6B1
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685c470b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=KgEaFMypzpKrXJt10QQA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfXziMc8IC/mkH6
 ruX50Dz1N+zDTxtIiXiXZ6g2EzMMGlkrGqfPbN3FV9RxKS08mf01auPw4WffXSgpYDXvcdmfbiy
 MFbolpHfhI3nVtGmvqUGA95Ze8uxJdSvivRn0YjyzCdUEaX3nC8tp9ENDbi1X1gDTP2qj/K4nGw
 ZYkySO9Y83a4kY6CTTMFvmePvWPpTNdtbWFP2IZHRLbSENaMdNI3YZhKror0Fy8uQT7ke2jtkzw
 Nayim7p2OD96yZk2eEMNRCL2vKirzm+LetHc6rByWt/tOTqkq6TVc9Bp0S2nMMD58br/W2mUi4s
 mk4uaxWv2qH1zHoP2JKhS8qjBe++BKbqJ3Gt7AipiV/5kDCKyKdgVvQ68KuQjZz9PWfcex1z3Ka
 Rfi3ZgLrabj/nEVV73vI5TCJkGU17VLGnFbuLOG9bOBizXgM54/9MDlQAe/L3iLXJiDwcYbF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250143

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

