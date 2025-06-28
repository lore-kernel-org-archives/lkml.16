Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E6C21D3E3
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 03:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751079770; cv=none; b=si4+sdehmbmm4ifJBMP2AjslNsiue7y+yrs3HOf95An36WvgtRScqopOyW0Z6etD/znv9cL7l1V0FcBi1DXn+TSAK6si3J5tnBbaI/TcELR3XtKMnHGUafNEx8ZXIwf1K8+eE021u/wVVrVbUhPA+j/yyueN2tIsEQ2TLVJ4DNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751079770; c=relaxed/simple;
	bh=on2BHgBcWkoYT/ewSpxz+0Nn83q7soVlm475P3sXIOM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PYkoJDDWRULBX9eyu1FndM+zJ3NmO9+XuFv4EW+N50drzT12Zzu3T+uvvxN5Sg4N+MN6bdsooJI4/kpnKq3nQE2r5WY7cNF9ReBxSIjGjkg8jQdZz66lVX1vhV8UQ7OcgxVknCiFCJFd8NwS0qvVYn2YGpUi4XBGpEyhXyVdnlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YIz48+P3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YIz48+P3"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55S28swe024145
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 03:02:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5aR8fGjAivIsW8Z1WVaLdu7x69SPiAPyD3BZFTe1eAA=; b=YIz48+P3xsJXg6wd
	1+L1uf4/U9lp4P+97DCeZK9z60HcfCWiCuAPDmFhVJWhd+rPk9W3cxtGm2jBrDKZ
	9A6UlpxGZ7WXAW2i676ZQ61jT4m4dO5Vx7Ic99WwpvbjDnYWxnhtikius2Mw7Yq7
	rw49iMfS9AK/0r0qaWsK4cFALEl/GuXRMfIDROukP9275u7QownKubnKesR+Z3Qs
	tU1sCb9FsA7pG+VWGCvaekZ/p6b3YNJqyvIYhZuJBpMaSeF39bQgoF93v9tw5KP5
	WtNA+NdSQcQaZw2U0kXIvhbFk3o6ewx8rHK7sAF7ULi15Ti/2WDi4UxfJNLXre1i
	X133ng==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bvg1sk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 03:02:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c955be751aso424129085a.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 20:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751079767; x=1751684567;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5aR8fGjAivIsW8Z1WVaLdu7x69SPiAPyD3BZFTe1eAA=;
        b=ioGPgcnIHZSft2rgBZ1c+LFrDmFam0ZpWB3pQnzR+4vF91XiulT6O7XdP2C2x0lhRc
         gMKvnlZeiX/V1pqOjVNpWQ40k44bpY2VxqOc1LIdF6eGfkMfoCOaAT/RgR8RYP+LtCju
         bOGyJ5/BFKjvV8poaCB3ERcuw6qIkn71O8oHWU213V8lpd1eocJ/Ijncrbj6U4bMxU7j
         aF+xxFXclVaKSjE6v5yT25xjtnmAJoYr5p5ea53iGI1r5xbmYD5W8QuaBuOVbBFRyc0H
         YVhEPkH5ItJVQ6l//zQwn5woKdTt+tx82e6O8h8uAe1/r6+ZLJ2aMFWxxg0aSWZPjyS3
         JrQg==
X-Forwarded-Encrypted: i=1; AJvYcCWWBmp9F0e7zeFJBwBlRT99ADKXSbZptw5dojLOHgrAqGm066BRzo5SdnCv/0mxZ2c9cjsjhW1YXEpSvcM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCo2YxglZ1jeyLnr4ymMv4R4wpuM4lU2n6SfVv/nKXhllRygLZ
	zZ4c+1GtVv+zTBtN66NZqstAKXEspPSjFFZ/dZpcqxYSgnD3DZOoKQxrfzn/nkf5jL2x8HHY6No
	D6C4/0mYaSnb7NL2YBPM1zzHxofHUxNqoK1SKtDD/ARe714LpakEQGC21Y5Skoiq9QZw=
X-Gm-Gg: ASbGncuHt4cJVbWXrk+IL+m6RpPrRQx6dHdMoB5L1dhXsPZyuUWqoYAf5qNkx6pzDVl
	Y7TFjO90zmwW0qDHpwmRgWjchKuxSGCiKsV0NPWDubY4jCnZ1a1aKxbk9AioT/BtUqwVD4HpXrj
	879qq0NGE/PBXnnxbotMQQK3lndRyZG2w7r3ld7XiGs/kfw+r/uv+kiWLxOC4gc/EO50yurYRs9
	Jy1q7ctqx6jDnNZ0EzYlEGBHvrBWvQRtLHwGqn4ZslAy8PJ/uNJnOt8iJ8JPpYOxi3tjTgqz0EE
	X32Rs89hX6OdRC/fEFyutWmV1gz3najO9Ih0zMkEZEDjfXhfrfV276C+89kFbAxoptnyxNK+ygp
	ytN+PHeKtLxUeW9F65BIrolkEq5Mv43aNcDs=
X-Received: by 2002:a05:620a:1727:b0:7d3:9e75:6953 with SMTP id af79cd13be357-7d44399cea1mr913295785a.52.1751079766770;
        Fri, 27 Jun 2025 20:02:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeIaPbr6Eb6DCFi+U0O1m19Bb2BROvDh0XhxtlAu0XGoBDUeVMqWy1lJZwa8PIlZmHgxATKw==
X-Received: by 2002:a05:620a:1727:b0:7d3:9e75:6953 with SMTP id af79cd13be357-7d44399cea1mr913293185a.52.1751079766356;
        Fri, 27 Jun 2025 20:02:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2cec36sm652162e87.180.2025.06.27.20.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 20:02:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 28 Jun 2025 06:02:37 +0300
Subject: [PATCH 3/3] dt-bindings: display/msm/gpu: describe clocks for each
 Adreno GPU type
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250628-rework-msm-gpu-schema-v1-3-89f818c51b6a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8307;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=on2BHgBcWkoYT/ewSpxz+0Nn83q7soVlm475P3sXIOM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoX1tMJ5CQdX181Qavk2jRBSkDutKIttOYQLspI
 dO14GTIeq+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaF9bTAAKCRCLPIo+Aiko
 1Xt3B/4s/QVV4Tn7GK5YrC9I1uckXq9WeLcot75I7GKrsJVje+7LzUciGGirOrkTpC4SFrZbNRp
 WQ1F9qSOUpWQxcoqdEiOPuDnMIR6/T5IRfkXgGEck+VR0rk5D6HK7ek68vU6XKZIgACVCsDzZ1x
 XdF/vHHOV+FviOcFLmqQMmzxQA27jMobKgqDAnnGX7Rvaa7XEXbNmVAmlU7bozTiutDP7ZBuRAB
 WnV9AIMFgLYLyRcMLNT31R7X4OTo/1YuV/BvJIH0zf/SAwkzujl7S8guuhCJPkgeIatQhoDYsyM
 ZlNo3fNNCDcslxx4+/tFv3Blco1ZYqbK6BkpzLxg7rFf36nF
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: bYna_78wmsUg0tU4FmpBGUoNSObY0EWj
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=685f5b58 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=iX1fKmmLQLlQjSsTkigA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: bYna_78wmsUg0tU4FmpBGUoNSObY0EWj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDAyMyBTYWx0ZWRfXy/USEujnXJ9J
 ZTlDhFdmhxdICAHWCiJZNgbNzLb+bAZJxGI7pNh5kO67SVHuDRXIcmMr33La4nFf+8lxdunfGwY
 b18UQAXIeE0WY709PsMfW9jvAt31JoFYHZAjdDT8CGHHn4XiLcxKb7VrXgER+sQ1s8yuqashtn2
 SkE4eUHx8vm33aXfe+MlM6hHx0XzXU0Mxtan54o3GnvjEFuJjJMFkTr3omhYm4dixnZUe4qZaBF
 L3l9NXQ9Vc9MW0q6HrJIEnIuep1VESP3y/Vs7O7/TD+qV5kVASBTBkwDzTJBSuCsDjWM6FIqsU/
 VnTta6mMg+jAYEojB04BRfvrIeRzJDjpqMqRdflH3cemeahIPCJKciMGRV7Sdt/ll37Y8cacuhY
 ir6eQti34r7Wlw5V50y3+GzVsrSE69jSbRJ9blHNvS92LLs0AVg7mDdcGe1wX/0O7n7AcLxT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=793 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506280023

Rather than having a single list with all possible clocks for A3xx-A5xx
define individual Adreno GPU types and corresponding clock lists.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/gpu.yaml       | 220 ++++++++++++++++++---
 1 file changed, 194 insertions(+), 26 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index af43527188cefda0c127c4674d4667203972f583..7ef80f9fac8b2927b2a69100a7f6c729d9d188ab 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -146,41 +146,209 @@ allOf:
       properties:
         compatible:
           contains:
-            pattern: '^qcom,adreno-[3-5][0-9][0-9]\.[0-9]+$'
+            oneOf:
+              - pattern: '^qcom,adreno-305\.[0-9]+$'
+              - pattern: '^qcom,adreno-330\.[0-9]+$'
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          maxItems: 3
+        clock-names:
+          items:
+            - const: core
+              description: GPU Core clock
+            - const: iface
+              description: GPU Interface clock
+            - const: mem_iface
+              description: GPU Memory Interface clock
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            pattern: '^qcom,adreno-306\.[0-9]+$'
     then:
       properties:
         clocks:
-          minItems: 2
-          maxItems: 7
+          minItems: 5
+          maxItems: 6
+        clock-names:
+          oneOf:
+            - items:
+                - const: core
+                  description: GPU Core clock
+                - const: iface
+                  description: GPU Interface clock
+                - const: mem_iface
+                  description: GPU Memory Interface clock
+                - const: alt_mem_iface
+                  description: GPU Alternative Memory Interface clock
+                - const: gfx3d
+                  description: GPU 3D engine clock
+            - items:
+                - const: core
+                  description: GPU Core clock
+                - const: iface
+                  description: GPU Interface clock
+                - const: mem
+                  description: GPU Memory clock
+                - const: mem_iface
+                  description: GPU Memory Interface clock
+                - const: alt_mem_iface
+                  description: GPU Alternative Memory Interface clock
+                - const: gfx3d
+                  description: GPU 3D engine clock
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            pattern: '^qcom,adreno-320\.[0-9]+$'
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
         clock-names:
           items:
-            anyOf:
-              - const: core
-                description: GPU Core clock
-              - const: iface
-                description: GPU Interface clock
-              - const: mem
-                description: GPU Memory clock
-              - const: mem_iface
-                description: GPU Memory Interface clock
-              - const: alt_mem_iface
-                description: GPU Alternative Memory Interface clock
-              - const: gfx3d
-                description: GPU 3D engine clock
-              - const: rbbmtimer
-                description: GPU RBBM Timer for Adreno 5xx series
-              - const: rbcpr
-                description: GPU RB Core Power Reduction clock
-              - const: alwayson
-                description: GPU AON clock
-          minItems: 2
+            - const: core
+              description: GPU Core clock
+            - const: iface
+              description: GPU Interface clock
+            - const: mem
+              description: GPU Memory clock
+            - const: mem_iface
+              description: GPU Memory Interface clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            pattern: '^qcom,adreno-405\.[0-9]+$'
+    then:
+      properties:
+        clocks:
+          minItems: 7
           maxItems: 7
+        clock-names:
+          items:
+            - const: core
+              description: GPU Core clock
+            - const: iface
+              description: GPU Interface clock
+            - const: mem
+              description: GPU Memory clock
+            - const: mem_iface
+              description: GPU Memory Interface clock
+            - const: alt_mem_iface
+              description: GPU Alternative Memory Interface clock
+            - const: gfx3d
+              description: GPU 3D engine clock
+            - const: rbbmtimer
+              description: GPU RBBM Timer for Adreno 5xx series
 
-      required:
-        - clocks
-        - clock-names
+  - if:
+      properties:
+        compatible:
+          contains:
+            pattern: '^qcom,adreno-506\.[0-9]+$'
+    then:
+      properties:
+        clocks:
+          minItems: 6
+          maxItems: 6
+        clock-names:
+          items:
+            - const: core
+              description: GPU Core clock
+            - const: iface
+              description: GPU Interface clock
+            - const: mem_iface
+              description: GPU Memory Interface clock
+            - const: alt_mem_iface
+              description: GPU Alternative Memory Interface clock
+            - const: rbbmtimer
+              description: GPU RBBM Timer for Adreno 5xx series
+            - const: alwayson
+              description: GPU AON clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            oneOf:
+              - pattern: '^qcom,adreno-508\.[0-9]+$'
+              - pattern: '^qcom,adreno-509\.[0-9]+$'
+              - pattern: '^qcom,adreno-512\.[0-9]+$'
+              - pattern: '^qcom,adreno-540\.[0-9]+$'
+    then:
+      properties:
+        clocks:
+          minItems: 6
+          maxItems: 6
+        clock-names:
+          items:
+            - const: iface
+              description: GPU Interface clock
+            - const: rbbmtimer
+              description: GPU RBBM Timer for Adreno 5xx series
+            - const: mem
+              description: GPU Memory clock
+            - const: mem_iface
+              description: GPU Memory Interface clock
+            - const: rbcpr
+              description: GPU RB Core Power Reduction clock
+            - const: core
+              description: GPU Core clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            pattern: '^qcom,adreno-510\.[0-9]+$'
+    then:
+      properties:
+        clocks:
+          minItems: 6
+          maxItems: 6
+        clock-names:
+          items:
+            - const: core
+              description: GPU Core clock
+            - const: iface
+              description: GPU Interface clock
+            - const: mem
+              description: GPU Memory clock
+            - const: mem_iface
+              description: GPU Memory Interface clock
+            - const: rbbmtimer
+              description: GPU RBBM Timer for Adreno 5xx series
+            - const: alwayson
+              description: GPU AON clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            pattern: '^qcom,adreno-530\.[0-9]+$'
+    then:
+      properties:
+        clocks:
+          minItems: 5
+          maxItems: 5
+        clock-names:
+          items:
+            - const: core
+              description: GPU Core clock
+            - const: iface
+              description: GPU Interface clock
+            - const: rbbmtimer
+              description: GPU RBBM Timer for Adreno 5xx series
+            - const: mem
+              description: GPU Memory clock
+            - const: mem_iface
+              description: GPU Memory Interface clock
 
   - if:
       properties:

-- 
2.39.5

