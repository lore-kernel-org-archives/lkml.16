Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F341F17E8
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 17:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749488692; cv=none; b=a+4PuqiC+u64QDsJi/xDSCOWTNcTIr5HyPRFWg89I2Rf6AzLNM3f+zYJdWfmELs9V/pC7iYDj7gcgmOokqWzJyZihCt3xlFWv8vj+5/4/D3FjHc8vv/VpngzzzrdqZm9shZlWImscg/x8cV58u2Fy9fGZWHtLmGV32/+6l/UtDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749488692; c=relaxed/simple;
	bh=crq1IlqnKk3Vke1cuqo69ya/rFBgSDJLDgfHj6Dz4PQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E1o3Rv6U5L3oqHMFP78r2dHhzXZLtYExiZ4FUHfIT1qVs3A3jxG4vGZiXc/gvRjvbCRMV/RdcO+Hf/E01/cDk9MLYWx9EiCokF8Ba+/MMPm7m+piGUnDOOcaawj9ucFqCp2G37TQ8LAz+kqP/ujXaBporEMS/12s+yArx0ZJftU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jFlIHAJW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jFlIHAJW"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55995v7l026990
	for <linux-kernel@vger.kernel.org>; Mon, 9 Jun 2025 17:04:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6W/371YKVn8
	zY+sgrwBLaaDGncwtCHPm73vufdI0Knw=; b=jFlIHAJW7s0p0FYHzBnfKk//Jbs
	VM4Z6p2u44RLC8bDfVfumcgJQRvycWQFi4JH3/ojlWcq3nbke/Kr3fLJz+vbDx15
	8ZIovZEa5E5KuF2ZmJ78+jhhfDzPq87m3cYW1YFJqCnzyMP/364oP1RD7faHPPqD
	lbr3YPuX9qrJNhrJLeJ+uUmLbFG+iqJFVY2q3wCbdNSTBCp1aUzicjn3ZENPWpy6
	GKitUW3DlS7KMfA08gPznUeCUBjAZKd5MEaIexUl+hMx9nzPaz1e9p+Ejk7UE3RY
	/qf3Bd9zRoRuwjmqJb3hikSgbW+C8KSl+4/x/0cn1qqOqTsZ1derLMC0bgg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dn66mdx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 17:04:50 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7377139d8b1so3709397b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 10:04:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749488689; x=1750093489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6W/371YKVn8zY+sgrwBLaaDGncwtCHPm73vufdI0Knw=;
        b=hUtreilDdxsKlr6Bzq5h9m5KljolfDFyT/PIqQyOmoXWI+PdwNA/xVXIpyWHokwsi+
         eTwZ+e2eW8TWGHsyAChnPXP3MLhPyYIGKmi4venVyUgJLf/91vv1gbekiOcF+Zl00usj
         tonFOyUM+pNUptA0LTy3KYr54cWXdOz8cEFL5+/6wPYmpyxZmfvEg3icYIAFbfymWsnO
         k5Trsy4LsIbTWDKAT0aHdvtjQNvLpx6V6H5SfkIORE9gcupMGVL9dMHAD/4tMAfdC/24
         dHhd7dhWMlvf5kh1X1EIIw4pecOJc9gFojKM8fiQmW/oLfZTkMDoBWYZr8VedVE1/8pv
         qOAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPRqvmyFg33rOJGROKfgsqWFFO/MJwGVVQXYPBTb7Fb73C2uBU1pGnNppqDjRAwV3cCST4e2iAVbprHuE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh+riHsjyY9M/YHZMjRTAOEuPs9ycVWkYgwTTH4GgQ85ZPAsNp
	V9vOKq4cRmW2qTUR2G/PE4ZkD43wz74SPclVKKRxqBFp9ju7vxjQTxTyQSC5QcTUw39nXvch43f
	tRQh4WmI0nyDqD1Ddfr4Ecmjh9bN32J/PpJIlw8Go/WgsxFDqk3Y3W05zMOuuzLHqP2g=
X-Gm-Gg: ASbGncvSCtfDn6H1sgD2RL+IXS0Id+/JnACymxAGI1Kd2EYgqEib9mT5nij0cNg19wT
	kAMEhqte/+t9xhe1px4urlB4fwFtELzx6LTtQVaTzxG7WmEjSnYea8a+a+sM8M7zr7LTNKWt/Wl
	gZW5ruo5tUCa6Ncz/vJbekgWVh1L+LLrZKy8vm8mPPimcM1nFT/cJrvetX3bI2T/jHFDWCSxxkq
	B+aJdyLWWqzMSc0PaF05RX/1kHHndfxljCZdnQJyka3vrzXqW03My4C1Jqgn+5lZoTYSiDeHoar
	AO6zs/oSfoHGlXXPMGS+OCLbrrg6PGDL
X-Received: by 2002:a05:6a00:4f8e:b0:742:aecc:c46d with SMTP id d2e1a72fcca58-74827e4e9c7mr16970843b3a.5.1749488689473;
        Mon, 09 Jun 2025 10:04:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVMskIvufXApiy1mvHcQX0CnDdei1oN4pY7QtQVLahbgeU0gQD7OlQZ+oMMskVwE/QXOj6Uw==
X-Received: by 2002:a05:6a00:4f8e:b0:742:aecc:c46d with SMTP id d2e1a72fcca58-74827e4e9c7mr16970818b3a.5.1749488689086;
        Mon, 09 Jun 2025 10:04:49 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482af7af0csm6186677b3a.62.2025.06.09.10.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 10:04:48 -0700 (PDT)
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
Subject: [PATCH 2/3] drm/msm/adreno: Pass device_node to find_chipid()
Date: Mon,  9 Jun 2025 10:04:35 -0700
Message-ID: <20250609170438.20793-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609170438.20793-1-robin.clark@oss.qualcomm.com>
References: <20250609170438.20793-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDEyOCBTYWx0ZWRfX4lTHavqCTsaN
 IHskPBvtWXi4tmevM38pkFMyyIxSpujOooNwp0+vPYF08QwE7na+s0vh2CpIMrzikPstkhPfuym
 qekHcpf50wVYHuGDVdtuyNxmSXG/pnAs0CIAigLY5MwRngHPi292eXdr+HygpBP7JTxHGy+276s
 4+FcJE37E3HRNjv3KM3Vc0ktQfoKuk1uXrkArYa5TdoEqBQLfqSidoTsNScE9AVpYnwMaJRtVJc
 0vlG/bG5pVRl3law3At2u5gZ3UEyLCt/FPJRmIrw8rjPVCucEHdwiyGdwopWZazmFIt+OKROuc8
 molxoa2HxGtvdwfoGdhPpB9pNFn0XVZOLNTWKGWJRz0T3LArVXhSQzG6oLx55+eXh3kElIKzplB
 T2KkosCDIg/3U+cKWWl+FMFWeXnXM2eL2Zn11taX0D1p/tMuJzzDM7K+J+2h2hdaTy83Y7O6
X-Proofpoint-GUID: gbrzSIvllkq0WOlTc4JPBqIwvCmLkppO
X-Authority-Analysis: v=2.4 cv=FaQ3xI+6 c=1 sm=1 tr=0 ts=68471432 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=DSfSXdSXGXaEfb08ihoA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: gbrzSIvllkq0WOlTc4JPBqIwvCmLkppO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_06,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090128

We are going to want to re-use this before the component is bound, when
we don't yet have the device pointer (but we do have the of node).

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 6b0390c38bff..504174dbe6d6 100644
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
+		DRM_ERROR("%s: could not parse qcom,chipid: %d\n",
+			  node->full_name, ret);
 		return ret;
 	}
 
-	dev_warn(dev, "Using legacy qcom,chipid binding!\n");
+	pr_warn("%s: Using legacy qcom,chipid binding!\n", node->full_name);
 
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

