Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84F01DB92C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 03:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751079764; cv=none; b=ChW5BuidI6RKXuM8tO/GAEKprcVo4sr1ecnZuSRMoJ4s3w4TY0yM8UkVNVmY9SiMvZBYJw8XE5nKgePTw2H3zdN9m8aQuWzpuGRFY7ckwXari9ePBwUUouKamOvUtYdCkjqU/711RtMoQQ+JuEr5aZXWDSMyPFWOoutdcNQ8hjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751079764; c=relaxed/simple;
	bh=9YGIHaPZZVo6xs/Nujkqpj0XLB0+skv7YqMwQaw0Vhk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aJ5+gvWYB0PVTFGYiQKIgViOuZILJIqZbSVp5ZTieRx1A72hAIA9uGwlHcfkq7cpCUKVu16q/tSkx5CfOeA7Kia5ACK2EIqtfLc+hhh8NQT1emXpgQ5f5JQO22qa+5kpLppbZEzzwVxEXGECLji7jmPVptmKJCWH4uNRHqDMn+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hnuOdl8P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hnuOdl8P"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55S0hK3K019229
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 03:02:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pn8lRprkqEuCtVcvMr9gW99dcctgojrtSe4TTaHQ1lI=; b=hnuOdl8PyC/YIDJp
	X68NVOQ312PUDICEvpyATg3ejvJz60foBVljFVZmBQYrZzUh5sjeqFLnlefVmvFq
	jkApPpDz2nCHT1NJ+WQRhg3rtzoBAVvml4Gh1QyBYECAQ0uyMh4ebVW9cpimTXm7
	xjsjKU65ZBBAF1QzjWg6RzvpG2ggcCuweSnaOw+PfEcShLBJoLhRgSXEQuqc5e5K
	jC+OtcV9gk/DqLlrr36y/5SIuGpahVYRNrTOyLQ5zeUcn32NI9e8fuKoebH/Ic8o
	8HYiT2cwTGi1ek8VtoOVjafFHeRQxrupJo1fqyGqH+pAaqGgczkknmLXE5IfEsxk
	6LiSdA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63k053r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 03:02:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d099c1779dso49763285a.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 20:02:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751079760; x=1751684560;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pn8lRprkqEuCtVcvMr9gW99dcctgojrtSe4TTaHQ1lI=;
        b=NcKuDWUUO0C15zg21yPBjIER9m8Z3Ra93hdahj3sy3fEZl+AMRSm3iJ0XmuCNQpnNp
         /RBPX9ed+JqGizH4WoIoexz5B4QiseXrzlAvlpoxTFXbKGYUD4CN06AmW620ZbJPplrC
         1Pp7aDQBt2dmRGdRWZ0A5NOSu8P8BIJAL4R0sxEFCv1ATK4lgUaPDYx5xO34A3FQ2ZmV
         pI4X8qe1/Yr0lSrUCGy704F7r+ICD+7HGhAoFucPwcs9r61ERiQrVIHo1FoTFrNGWNHe
         jPWdAcCZDr/k3JB4kTft74wDIRZHOofLyjKaV2qPGlRzBvFw4+me6B55JB1EQbYPlCLL
         xBaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXtO3PjsC1vdE3XtjY92lPTEsEGWjHnkLl6gSbmKxPksv6cZ/7E0V4nSF9L1riEDJsh2G24o86leT3s7o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfpfhsBNbvz7OQyHmrNXI4VAmlbd5o8CgfQk0Gw/5DyVrnKG9L
	4S4x1HKc2npMJLOF0k3ruejwJG1vrjJZAh07QPyq3Z6CrzYSNs0uEtCfmT1VB1nDQnlIcfRsT7q
	3r/hJZUHpgfTkstNZQVyudKAYJgfsc4asxten/KPfD5EbtLw6hU3tF8ll+rUXXgFzs48=
X-Gm-Gg: ASbGncs0pAXCjyq2GWRSWENqlYUo1Ju71xC0I9MLoRObpJnZNRx7fEhfyckgJx1nL5V
	mUZmNb+jMY3GTvkAig8H0sW2N0uzrQPrb67JRh0Uf7JLGYveZWmNi5f7pJ4cVWdowjDRqfw+Qb9
	3BYq00D9ASUD6oXdhvRLED9wz5SYUTzFL0Y0DWBb3XJB6m04Ji/Sx6H6K9e2PpGqn4MEB1glY0I
	UfuEooU4OuuktwjUJDya3ZNSEK868tILQUpeOJ7ztVAmmkEwTyQw7wDwooLEFEZur4JRwkzFw3g
	OGHmOMlV1T7iqM1JSuWjeG3CYsgcfkihCi2+W2evpQsBLo9d6QBCWygTHKOPYsmuVIbABJnUs3C
	u4LXYDWCJFDidrwtgolVn9LM+p4txvMPO29I=
X-Received: by 2002:a05:620a:857:b0:7d3:f63c:7ee0 with SMTP id af79cd13be357-7d443994e32mr745059985a.27.1751079760500;
        Fri, 27 Jun 2025 20:02:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGB6sLiLugweO26s+56NBhBPiiwhHw8p8mHSNpYn0MXz3xXHY1sPymiLX/dVkwjFIvSygbaNQ==
X-Received: by 2002:a05:620a:857:b0:7d3:f63c:7ee0 with SMTP id af79cd13be357-7d443994e32mr745058085a.27.1751079760122;
        Fri, 27 Jun 2025 20:02:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2cec36sm652162e87.180.2025.06.27.20.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 20:02:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 28 Jun 2025 06:02:35 +0300
Subject: [PATCH 1/3] dt-bindings: display/msm/gpu: account for 7xx GPUs in
 clocks conditions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250628-rework-msm-gpu-schema-v1-1-89f818c51b6a@oss.qualcomm.com>
References: <20250628-rework-msm-gpu-schema-v1-0-89f818c51b6a@oss.qualcomm.com>
In-Reply-To: <20250628-rework-msm-gpu-schema-v1-0-89f818c51b6a@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1390;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=9YGIHaPZZVo6xs/Nujkqpj0XLB0+skv7YqMwQaw0Vhk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoX1tM3ZQjq4fHNRB4zWahpGOQAMg5wqPQjtru0
 jA5BsH+jqGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaF9bTAAKCRCLPIo+Aiko
 1fraB/0ZgBnsS9r93leQrl17L1FgdnbkPwM6M4aMOHWDeMy62TP2r4PIX2Bz6oUb7DsbvzSkIvD
 5DBQ6e+uEoJ/5xfFhapiM7DO4/mXWypigKZxqk8ZUxu/bEgzCyNGryBDMuiyCASKd77Y5qmCZfq
 FRh3t95lu9UQR5xb3uL/pt/v/fuys3dMw2okqnYCa5w6yQmaPBN6wTRDwoqe9kNZTiqkaVByF2M
 SxaOCNCmEeVbvGKwTtsSze05O/DuL9mlGtu+Jm8rN3C4W+WbJaoh1p9mJSHlcp1v9omtZ29y25o
 jNJjxvsfFdS+8BRvmk8/E2mSw8XWisiLxMAG8/P2i9qseZyb
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=685f5b51 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=_Kd42T_lrbdN2LGistIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDAyMyBTYWx0ZWRfXxHJ2dLrleCtz
 aKULtEdospZdrQx5jQVD1ZB7dtzoHT9dN2M51Cc1Pu7HIe6hIw7G/Gi+isT9vHnLYIKsbVsjslo
 VMuWIP3Ch0LRWsKVgotUtNGYucboH7gpnF7VFtZ2kRL2Tr+uqzHGr1yy69ckC9gsphghxqWcKqI
 Ab7ZSapzkAEKeVeZqp8wh+fnGWiMtKhEkGrMRp8O4DLipA2xOjLL9J9CGq/T7y8MKEjrZOgn3o6
 wMluP8cbJox4KgfZ0PpbobyQzX9Hpwj7uoPCnCEhJRKJqwIpSR0ZJlcKoTllmrEp7KXIzGF8dqT
 BfCt82ukv2H/2mK7kjbHt/MYjFeyPvzDHg/o2sqdhk7P4BCU115DYsVqhwJdbp3+v5KPLc5KJ+z
 p5doUjV2LFxkLFN+mHfO52pNCfKVoGzdWo3/+Hu+k2wE1PsWN5WGIrEKP8gHyhMvZCTI/Ckc
X-Proofpoint-ORIG-GUID: 4GwfQ8RKIfYCodDL9bgjsxOqPp5fI6Lx
X-Proofpoint-GUID: 4GwfQ8RKIfYCodDL9bgjsxOqPp5fI6Lx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=967 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506280023

Handle two cases for Adreno 7xx:
- Adreno 702 follows A610 and A619 example and has clocks in the GPU
  node.
- Newer 7xx GPUs use a different pattern for the compatibles and did not
  match currently.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 6ddc72fd85b04537ea270754a897b4e7eb269641..97254f90926030c4a4f72ae5e963af1845f0dbbd 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -187,6 +187,7 @@ allOf:
             enum:
               - qcom,adreno-610.0
               - qcom,adreno-619.1
+              - qcom,adreno-07000200
     then:
       properties:
         clocks:
@@ -222,7 +223,9 @@ allOf:
         properties:
           compatible:
             contains:
-              pattern: '^qcom,adreno-[67][0-9][0-9]\.[0-9]+$'
+              oneOf:
+                - pattern: '^qcom,adreno-[67][0-9][0-9]\.[0-9]+$'
+                - pattern: '^qcom,adreno-[0-9a-f]{8}$'
 
       then: # Starting with A6xx, the clocks are usually defined in the GMU node
         properties:

-- 
2.39.5

