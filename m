Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7B226B2D4
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 07:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744962613; cv=none; b=dGSLcc3pptYflbvX+rVhbB7oYvwKje1WaVHDzXA0UMOKFT1cFiv8En3HTa7wrB9pOpGcSZB8amoItls6yW99lFax2vni76BEHQ6FnTODjEqJltmQSC6DTTpvCjP8WZA2C0qI3HIY0Unt6IWu/uu6MTT9jzKO1o0OKUqtnuoyzJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744962613; c=relaxed/simple;
	bh=Y9uutO6VV3TG77pyFKkBldePkthNdxaT024tE84FCsw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F4LbMfGHJWKkSCsX8RbPRroPOY5P7DMAWqDotf6jvfM8rlRGh93//h0Y5WGt+WapZ9EFg9Z1XUiSe4jdsLLfbu0tCKRalRARZ53yVsHM32FHTIORdKgKbQUpdvLaaw2ka0X7QwxUYTNMVDhnICiSEv7fj8QorufFQg1zfvfdoSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iYKPR/ex; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iYKPR/ex"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I2mISu008153
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 07:50:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2dtqbcPgqz2zJYzOOCZPN2LLL9rO3nXwWq5S6LuNoqs=; b=iYKPR/exe+ut/Mpr
	eS4JIZIi01DhpzQ3ga6kufc2EGvbOECQ+fEA3ZPnQ8TvRYIuvTIWHp+fDAaJXUb0
	WtwIMw1IEfbrPqym6qZMxtAlH5Z69H7+6g1Z4+6zDHAVBvJRu6GKjAeJg4+whvdw
	xjz39rBVFghOnlrMLH0mgt8szvKijbFOQ5EJp6ME785yIMwNT2tHU+ZlXpKvmt/I
	tavY78yIOPYjRVx2aDvxq+PChZOPOHDK7foWqrsz0X+Mxyx7H3qVbMNtOlL4SvPa
	hyYFGm2do1734sEWFJyWGCbvbcT2g7Yn5L4AyACq2AuTTFduoOo1cHoFj+it7Ngi
	AHap1Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygxk97m3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 07:50:11 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e91b1ddb51so29453356d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 00:50:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744962610; x=1745567410;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2dtqbcPgqz2zJYzOOCZPN2LLL9rO3nXwWq5S6LuNoqs=;
        b=scgcuM+uQYCLg5iX47epS5PVrCEdPhnSdHwCXo8625+ljV4WzPgBQuJ/OKhYQ6PTnj
         B+C4dcWlseumVMyWUTPvXvBgbxzxjaS/yTbB/GgUIQs1X535AVBo7LJY97ktXONkbmPj
         uLtt4iFkxFTy1kk05zbZ+xhNZ0E3KGRVyD+w7n7u+OcwD5+Ujuv49lQZOuHxGtPXBnSw
         sdQ9l+m3eDDgDpUL6Dz1gZGRsGoh65F8BfSIH16ZXvzRI3bQgsyDrAyY0Pxvou9nlIKY
         1I9JvKbQKFjdWtX12wpKPNa4jp1eiCbYbcyPePNTei66JySeI0xJz4k1/4X1Purljace
         fphQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxfi5FfC559wR+YDq2P1KVMZfpiJ6gXrf3jtruC/XWsmA7rXHd7bcczu/UjG0eP5nu0SobTzQjZEuxQ08=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+hLcl1MxA89wK5AEiVywp4cxZwjO779U5uwAWNg0J0vtZVqz7
	yciFMTP0X7sskOeVDW3+VXqzq7xFebgNk8RVChIjYw4PqqkLibCSQtJHmRjkobQLmf5/TTxq2Ya
	q/tVmJLsiBWCFgaGsfjna/WuudlvPUEvSQiLYhZK1gxw6W2+oG9qvINbEHaxUtBc=
X-Gm-Gg: ASbGnctJKWgLZhm7ANf9l/mQX0wdpvZCfemtibB4YSbjGICSW4phDe1PK1W2PNYS92K
	JinBhlA+64e9sIiv5aL6r/arI6dNzy5xs8nUiJdAR+W+rv/9bG3DQ/zTG4rAOhSXNIV4USzJo2J
	i62dYD+veKuujC1pRMnAjtLmv8LNAM3l9vzTM5fcNag5F5oRHEwDBxemED5vC66jfzGtmgz58Q/
	Mpi9TTzvGE2eCygumbdjW11IKaqp/vF/ppnYG4ycADNFH1PTM5/4R5+Sfp9jsGbxrGo75cHsOfF
	RjrSXQBCEAONxPWLOU//fMzZxKLfT6TsuLD3zYtqQI2ual/xEtxx/1XZzwJASMbZQhLbIV4ZEqb
	QtbkooYlemj+N+YUxCDY5vH6q
X-Received: by 2002:a05:6214:d0c:b0:6e8:fee2:aae7 with SMTP id 6a1803df08f44-6f2c46846dfmr28951836d6.39.1744962610259;
        Fri, 18 Apr 2025 00:50:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOd3cRqGE1P8KpWy78lHx9JINBULPKSL5YprCIzeAWjS2E3hNvF1FIPQQX9/FweoUbxXDxkg==
X-Received: by 2002:a05:6214:d0c:b0:6e8:fee2:aae7 with SMTP id 6a1803df08f44-6f2c46846dfmr28951586d6.39.1744962609895;
        Fri, 18 Apr 2025 00:50:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-31090863bd0sm1649061fa.113.2025.04.18.00.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 00:50:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 18 Apr 2025 10:49:59 +0300
Subject: [PATCH v5 04/10] dt-bindings: display/msm: qcom,sc7280-dpu:
 describe SAR2130P
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-sar2130p-display-v5-4-442c905cb3a4@oss.qualcomm.com>
References: <20250418-sar2130p-display-v5-0-442c905cb3a4@oss.qualcomm.com>
In-Reply-To: <20250418-sar2130p-display-v5-0-442c905cb3a4@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=934;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=IJ0quqH+dI7r+sJavUIADWzzAqD1L2X/CIVzw9kCDtE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoAgQpQLS4T7hY3QMRLBYKCNlxp6QGzMPUhM1mE
 2syy+Wzk+CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAIEKQAKCRCLPIo+Aiko
 1VrxCACRtXhz+Ws7y/U5mibKKWs1K47mVF3B6oHwu+dbQIpu9R3+cXU8iKVJt9HMUTGg4siyX1D
 eaGaX+pRmZfZCSTCiiZOAXCYxiBEfPXmNgwVdbuDhbfIx0iBbB+4Qcsk24KJc5G/V0Oo2H9Cbt7
 IjHJXi3lpg5HVGAGap1QasV6tALnitBsO9fdF3ko45GlgCzt2Cr6iLyqiHYOqMD0EOP+kRsL2eU
 9G5ILpyOE34prwSBrY5jXHkCWobnAYOtRcHrDUGoji3osXOGRxmh2EQv+nGN/Anrc5XFbGk3keN
 ZLZw5pdrhmvM69zzdCa2x81QxcPDgCtWuEwLUBFy9bg8N4Hc
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=68020433 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=P0d4iQPpJQof_2lRNe4A:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: jduXIWJMBzDBGsCj0wjMQvGgNY8O8NZ1
X-Proofpoint-ORIG-GUID: jduXIWJMBzDBGsCj0wjMQvGgNY8O8NZ1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_02,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=919 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180056

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Describe DPU controller present on Qualcomm SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
index 6902795b4e2c249c2b543c1c5350f739a30553f2..df9ec15ad6c3ca1f77bebaab19ffa3adb985733d 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
@@ -17,6 +17,7 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 properties:
   compatible:
     enum:
+      - qcom,sar2130p-dpu
       - qcom,sc7280-dpu
       - qcom,sc8280xp-dpu
       - qcom,sm8350-dpu

-- 
2.39.5

