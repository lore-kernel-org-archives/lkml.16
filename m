Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2765E21CC47
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 18:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749493488; cv=none; b=DCBU6Lzg4GmSUGL01a9/HfLjhc5KzZvXb25F/42b0zdydl6cjk2+kDT4Wo0SwrG7YNsxbZNQl1rUqKw66O7V3g2JojtMJ3tQqQ7vRsixSJ3KwrAgjKswvppLEI37qvklwBxmW2ti6XmFHuqTueHAEKhNaOMyJlvlItbAnraiXcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749493488; c=relaxed/simple;
	bh=Nw5R6/u/rNV294XNdLAIM6gmpeegWVncNwNovOkszVc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u7IK4nQjEc0WiYj0IPFYFdqJtYhXnn3YWtdsAvcLiUVvARmVIEmRiYwvwd75bqz+PPQ4mBGLW7VxHNNJui2ftsuopaGY2rn9zZqjSl4dk4p06wAE3E6y+DVOGlGmxoQj+Xil8O5UQBSiuJnQJvSzJKYEAn+vm2e2b+gRTT/aiis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=camXxapc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="camXxapc"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599HdgY031223
	for <linux-kernel@vger.kernel.org>; Mon, 9 Jun 2025 18:24:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wDKSo0B4Owx
	KLMBW6S+ptTFSRqNPn23bmUpGk8ww0sU=; b=camXxapca/C/5sga8qhF50Bxhjt
	SNi9SsTxyiRTTSRo4DiMOYHTmJIyznRy+nIm4KDSepuTlI9zI2V/Nv1SVFme4ppy
	xGz6ND1y8MjBFX+E/YWoQVeYv9Yi5jrzitoEX5XnxIzhA2bzI20f5oaJTpcNC9rK
	x3pdqu65IFoqIuQHNc9Dfmb7+el7sREE6HY/Fevb5kpdPwJCPmCqDcpK0g6M1EIu
	Lzbtj/pE5qH640sgzDdUEBAAKrudRZOEwJagqickt5+q4D0xvUALIPxwVtFBWkWq
	cx12eOXdsfHOly3DJmTLE1pBUmZj94gUou5T9GEEcRgQg5nxkI683CZ9GPA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474e6jepn3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 18:24:46 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-235f77f86f6so30116495ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 11:24:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749493485; x=1750098285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wDKSo0B4OwxKLMBW6S+ptTFSRqNPn23bmUpGk8ww0sU=;
        b=EUuFEd+j+meKWJq8aZ0jNOShtR82ZuZXF++AABzoYbOF9FN7ZM4HcDpjmjPGn0QpPt
         TAQITyClwMIYDn2R+ycKMkVrqtHMzmCsaTX1TCJXTOQCTkl9YIkjSgCiREdHkjoRZU/Z
         2uzFTKVsMUvLF79jvnKoG4lR+Qx1m+8/HnhQ3GSMlwDyKXwZvqdwyyoDIfptt2zHY2hX
         0iWhDcZNLWwr5VZmpnQW0XFDChDyfZ9rxXJPMRMNldsOG8sW3J5T5/bVl9IF8Kmmesbw
         3hLFlXbfVOKZY7QOvedd5wI7QfRDEq90uncbyd6duRJsvM+fYEuS19e3OGG7n9YYkHkt
         OUog==
X-Forwarded-Encrypted: i=1; AJvYcCVzisIRL5v5F6aG09ThCSZYSb95vG7BT89P8rAp0/+Kl+UjD5N1w4smPs6CFptlJR6UhNmyRaWmOW9LJvc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCs4bTSL51ResRK09vOBRGtuaZ5CTNaQWnewTDlI2pTMrVtOWr
	3gnKVpTfuoNAvK1dXxPIcO5IZga7RL8CbRil6gbZXthJYc0zlyw5gBbRXaC7QDQPGcrOWfyFaJy
	e4pa2RwovwhSCpSDZUvzC/HVipdi1sEt5Hnb6dCYUZoOpqlLTU76gOibVbA3CPDqSYqI=
X-Gm-Gg: ASbGncsGQl2cV3Hr1IvU+2zud+YHozpab3tHsf9Gv3rSSh9HWRtfwmM1FFC7AqiLI53
	R/j3GUuHvdWLiacIUpireQFfy3F9s8qYdcydUgSdSUG6NNWVEiUqXloV+++HczoUqcqxbJlPFpe
	jxrqtQJzjAMYfEqmW3wdahb8LJSA2GeZYEPhzWh+0oKTnvtiOlYEelAVTLxwd9tF0avaq2mB1Ls
	3jbn9QqPtFPE76lORUrRyLL1fWwi5oHYiniSVVXf8gK5vk//VYIiHRHe/oBfTPSbuoMuq9iTNFn
	zyDT52hwhgHdjjA8LYRTkg==
X-Received: by 2002:a17:902:e891:b0:235:f55d:99cc with SMTP id d9443c01a7336-23601cf68cemr203520005ad.2.1749493485377;
        Mon, 09 Jun 2025 11:24:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2xRWfunGxYuE2OM2dbnnHB5b46Yn438TRpEDL3+xKAueWZPA4Xlpunoydd121jW5MCcyDKQ==
X-Received: by 2002:a17:902:e891:b0:235:f55d:99cc with SMTP id d9443c01a7336-23601cf68cemr203519705ad.2.1749493484921;
        Mon, 09 Jun 2025 11:24:44 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236032fcea0sm58136435ad.103.2025.06.09.11.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 11:24:44 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/3] drm/msm/adreno: Pass device_node to find_chipid()
Date: Mon,  9 Jun 2025 11:24:36 -0700
Message-ID: <20250609182439.28432-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609182439.28432-1-robin.clark@oss.qualcomm.com>
References: <20250609182439.28432-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Id6HWXqa c=1 sm=1 tr=0 ts=684726ee cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=DSfSXdSXGXaEfb08ihoA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: plucRCxDdsHBQzt_bWJX0ohqzpyPKOyF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDEzOSBTYWx0ZWRfX1xLYNEhFsO36
 9rYg9xOd0hivQAYSQEj0RWdHRTOym/djBlnWy5TtqC2BWsJwMDwcGPRrLKOHvmIw1G3sFZyVmIs
 RhMRXS2UXq0mNX+2dbaavl53lM7z3uaTJc9qkbf/psvy1zrz9KldXBKIihc7+bWmhl+aPv6Z4YQ
 wvvFFmGXG7liPdbsHMwisEiq8rC2C5v8dgsdHtxtQ1vBBpG7jJJEqjxdnDG7mL8C7hiN/SBWmlu
 jVRO3rTn2v9sx8JsVhJhBM2JHkC1VH31pnI4/88UXY0J9z0tnD8Me7JIGzEpjEcrCAnwyn9Gg0y
 dhP91/QifJMOVzyCvQOvxvsI2frZe1LEqGbArmiNSuVD4vhqFoywLwN7UU1KvisUYjmaCNOXL+Q
 5B7VjsjA/HqUM6BFOGIU4+clGi7ElAABqgwoqeaMPx9x0wVFQWMh1KmB0fAIX6n1RoZB+6Ew
X-Proofpoint-GUID: plucRCxDdsHBQzt_bWJX0ohqzpyPKOyF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_07,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090139

We are going to want to re-use this before the component is bound, when
we don't yet have the device pointer (but we do have the of node).

v2: use %pOF

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 6b0390c38bff..778e6ae7f137 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -133,9 +133,8 @@ struct msm_gpu *adreno_load_gpu(struct drm_device *dev)
 	return NULL;
 }
 
-static int find_chipid(struct device *dev, uint32_t *chipid)
+static int find_chipid(struct device_node *node, uint32_t *chipid)
 {
-	struct device_node *node = dev->of_node;
 	const char *compat;
 	int ret;
 
@@ -169,11 +168,12 @@ static int find_chipid(struct device *dev, uint32_t *chipid)
 	/* and if that fails, fall back to legacy "qcom,chipid" property: */
 	ret = of_property_read_u32(node, "qcom,chipid", chipid);
 	if (ret) {
-		DRM_DEV_ERROR(dev, "could not parse qcom,chipid: %d\n", ret);
+		DRM_ERROR("%pOF: could not parse qcom,chipid: %d\n",
+			  node, ret);
 		return ret;
 	}
 
-	dev_warn(dev, "Using legacy qcom,chipid binding!\n");
+	pr_warn("%pOF: Using legacy qcom,chipid binding!\n", node);
 
 	return 0;
 }
@@ -187,7 +187,7 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 	struct msm_gpu *gpu;
 	int ret;
 
-	ret = find_chipid(dev, &config.chip_id);
+	ret = find_chipid(dev->of_node, &config.chip_id);
 	if (ret)
 		return ret;
 
-- 
2.49.0

