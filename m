Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47C924A072
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 23:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744845406; cv=none; b=RYtpC5FTjnmyapxjSToul3BJEjXeWlhyX8OJRx3ooFJEH7KOIW6wFGgdK0U2CFpuIAF56ZgiLC2MhGbDtE7vs4EQwRKj/9AOAiNV/UvqYXeboXszunETohvw2cnQGaoIiVV6pLS+8bva+erguaYD/vQBdTy4/yOWi0GSzIQfKM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744845406; c=relaxed/simple;
	bh=WwCvGbKN1UfpAvbEF24uDaZkMcpdSei4ppmMTFjiumY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QDqoAvWbjuJ4HmRuQNUy3++2YGi9D8j7VP88d7BuKLFwmp52yqLSNTLQeedQV+Nm9exnWsXwUuTbDtarpHvugErOScO8QxmwbbylKY8JaNd2ALlTUmo8Cv7lUpotzwgBmdZx9EMBnd928IiJUZq3al8lHk7YLAN7qMNyuWHQPFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CUFuv9n6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CUFuv9n6"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GN4eAq021310
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 23:16:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	boXGEJ9vm7laFVs45kpF+i7DaEsEXFuWOHSJOklGi48=; b=CUFuv9n6cu9dJ6RA
	JIEgzi9FgUs3jeH+iS/ZP3QIRRa2bL6rZT1mBLBMivucrzsHDBMYkouke1qaaCwX
	C5LwYCgJc23IMmSCzERCLiCpKKBmhUeOaJ8fHaSKemslHpUVVK4FNr/xPuiLORfF
	fC2EvPotuPLM5xUSbuu5GIthziqknKMWjQXSnzwFgYmieJcj8i8lr6uL8OWvCC3I
	7iwnJso5A3m9rDJfZx6GA7XKM8ArZHfKh6B2UIuzIgibMOLxV+5L/0dLLjExe8GB
	SeMeJKopCs6XqTIsNJYUUBcCL1GGfsntO4jeYwIYQilYAQ/UWno5bgfKqUu0CQ9w
	LOJ8zg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygj9cyve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 23:16:43 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6ead629f6c6so3615966d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 16:16:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744845403; x=1745450203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=boXGEJ9vm7laFVs45kpF+i7DaEsEXFuWOHSJOklGi48=;
        b=v6g9cW0Z3R4iiNRw51UIkDqATGyQ3mwD9IF9eeXLi7BN4zODQ3N3YbOLrStFDo4hDi
         9HzytLlrHMWCy24BR9pLi0GNOyekv0lI+jCTcCe7VBFz6kDbTT0BbCfeXrcqYuZ3KS6k
         6V1kL4Q6oQwWFfprnWb+tQcv81qEgEojwYjeosuP8x8rgWLysrCyjxFM2vl/oXy6l6Tx
         re3B+qMf9gHP+P0cdJ4yIAka5qVhg2deMYQggM7VFuOZ8z2A4JYE7pIl3dvJovGG1Gvc
         VXqfmyCiGuE/Dr22mN5eVUq2XXfKS9Ozq+vOvtxumSPFqrrSyqlkXUhMrX3RDAEj8tjm
         OETg==
X-Forwarded-Encrypted: i=1; AJvYcCU4Ey/6B+kBlSPAlZWTE1bheBDAGbMTnqlEFzzSTnJBBtChmBEp2f0b4JImmnD13wpuTIeBH5IyiY58hKw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yygg/JS4jboyuNa6WzJYfRgWPQe1tCc9m2HkH5634Os+PqR+hJF
	KfCE1KeDCiqv1m9QJ/lftK3xXfpFM9ZFV77e7zsTNLBS3GWoiHcODB5IFAltONy0IHX6v0MYzT9
	SKDTq9Q8QR3JVi0ZuSMf1fajw3jIsalHKG0oL3yRWpLvNBOhfKgtowrLJk4asx9U=
X-Gm-Gg: ASbGncvE3QTfmzBK69atvwyJrCHiRjV721ikLTAQ6Di1zpYWP4sr2xfvZ+1CxdifQfz
	lDJ4u3amGkjVj2vuMaoAlYCzlPdbdM3PUT37wwSpxNxdNYQl97rcZx56wC0K4OIMZqD4BKnCL9i
	ERLYE1mau5SagRWeFWLKcEJkDeoR7chitTtf43MLXqJXjoAoPyJV9hLnrLlZfOcaCsUoSAHcJY2
	GBqDz1b+uHraGKqOLefpewWo7ZYAmLHQDWQ1zUCFBeFVwi1qXxSDUwwilBWi1zzcc8vQO6BGCrb
	oSESO//JGrTajm5XRFl/OP+OC2zfgLol0x0HuipIsYaAeuc+xCxXAgr+UxytG4zALHvefTKpdvF
	e4+6swh4YnYYD5gs9To6fmAHa
X-Received: by 2002:a05:6214:1bc7:b0:6e8:ad15:e0b9 with SMTP id 6a1803df08f44-6f2b2f93f11mr62673526d6.20.1744845403267;
        Wed, 16 Apr 2025 16:16:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrCA/KParNAT/BTiVkOPGzVpXZDtDs1mXEDaoU5nQ2DaTF35AM6o6LLomN2aXrq0eD1fuNmA==
X-Received: by 2002:a05:6214:1bc7:b0:6e8:ad15:e0b9 with SMTP id 6a1803df08f44-6f2b2f93f11mr62673186d6.20.1744845402926;
        Wed, 16 Apr 2025 16:16:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f4649d79esm26062181fa.15.2025.04.16.16.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 16:16:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 02:16:34 +0300
Subject: [PATCH v4 04/10] dt-bindings: display/msm: qcom,sc7280-dpu:
 describe SAR2130P
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-sar2130p-display-v4-4-b91dd8a21b1a@oss.qualcomm.com>
References: <20250417-sar2130p-display-v4-0-b91dd8a21b1a@oss.qualcomm.com>
In-Reply-To: <20250417-sar2130p-display-v4-0-b91dd8a21b1a@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=934;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=IJ0quqH+dI7r+sJavUIADWzzAqD1L2X/CIVzw9kCDtE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoADpREQ+V7HPJ8Torzzts6HtQRTIhAKzsZTV1i
 6mzzSWqJhSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAA6UQAKCRCLPIo+Aiko
 1TGhB/90c4LcuO7eAM0tlDSCT0Wt9jESwJSN8QH2OFqAKMujsiEdY37WSv8L/DM+BixUIfPBTj2
 31qmCQGMszanECSZ4FTb1zxAEhZOiY4qAoRR+GnrhdBEhRoPY7FkfX4KLOgnZLSG6kpF1YOrjuy
 NbcW7bv4lHopOvGtTXtjf8/DOv8m7UyKkst5z5s74ugy9sAu5yGgPIOeOlYJV1gGwJkaqFSxSQ7
 qYbd5PaLxQ7zdj+Weyf3x6JPiLsqOZlb4AW1WwqrYVxvv6Djqhk43/YxnlWVg1S7ROHu7fhXI1H
 zQy3Zdtn+yHPOtf8wBpnd5uGKVdFL2WD/SnOJz7C7Ttz973T
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 3Nt-XfJj7GSuvt8LAztUZChBbO0ZEg1j
X-Authority-Analysis: v=2.4 cv=PruTbxM3 c=1 sm=1 tr=0 ts=68003a5b cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=P0d4iQPpJQof_2lRNe4A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 3Nt-XfJj7GSuvt8LAztUZChBbO0ZEg1j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_09,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=914
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160186

From: Dmitry Baryshkov <lumag@kernel.org>

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

