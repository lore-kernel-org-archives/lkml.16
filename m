Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0C0217F34
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745603240; cv=none; b=c7f8l4BlwfShhConXjCfUJlrpUb5WPZ+ixcdB4fFEpM5nnOsOq9cFkRdJAjGoF/UwvXt0BUO8EYlgfrn+dHO3bjEEayf45auq6Gya76UFNwODs/UFjCwA5C8g7u6amW8PPPUvv9LNUkqUC2HYwyFhPSJcP7/hpSmJF9x3A7EwPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745603240; c=relaxed/simple;
	bh=WRG9dHTLQ2jwnkCiRxmgtVZUE3m+6omsipYnyHhT2vg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JU21B1TRvgBo2WF/Xsa7D8oB/iZ6ij9cU2XWLu8TBrsbsR1PwBcS+30v6hWvydH7XIMW8kvXpL8ODNlzpNj5nNe+0wA3cQjqC1fzIjFLDPm6GFSKqlrBfTZqMWe9sZhSO1N4DmOL+/JB/de822Y5EOcGr4Qq/l+DMozD8xZ5zk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OoM6afEu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OoM6afEu"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJpiu031931
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:47:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X5Zt92XUDy5ouQWe6YZM2smr3YjZQjLfBRQBMqLOYPk=; b=OoM6afEuRR4Kz4H1
	5KrmI+gLMaBQ5ITBcMnsNIL/ItyRiR2v9+ft1f4LDy85mxiSM7pHiLvpU/IBx6k7
	2xveUSf1+o8aagk8PvHHSCHX+aY5qUrElYn+9JaNW2q8JA8hQrO3XFoYR+C7PSo1
	CegOi/Gid8aoPMTB8xJlvKvCS1kZj4KolqOOBKLjX3GJKbcs2hQb5/+RS+hNVeAs
	uCND8JdPgeRKClU7Mc9PsjZwX8Jr87wfQ2BTX50Xw5lJgXsBhQj5jByb9YShgkDc
	oeZsV5F72LMFwJYqY1ofXsI/9rLLFar9HVyzvqXOJTiHIjzMlH53+7nawNVTb8jY
	EfqPOA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgy9utn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:47:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c9305d29abso438528385a.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:47:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745603236; x=1746208036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X5Zt92XUDy5ouQWe6YZM2smr3YjZQjLfBRQBMqLOYPk=;
        b=vtz9SI4PNYQmXyJOcv4WF+NqCJNgCz4g8SJCSGe4oj8g76gIyD7UnmfXJp+nljVVEC
         8BdXaQMEtAw2Jj++gAYtkpa2Mlfg2mEXzDXIfWKcwLGlQqhVKBakKKt6hWahMurr1jkl
         nG2jScTajUgv5WUYS0RgPY14Dklv3Po7eTeY9XC/MPg6Ed9Fekyz43mKZ61VMnhAUxhU
         Muq3gMOkW5MjcYSTTGFWUmzSdWGHfQTNzQ7cIxDX/wkvfxQWymNclBrpSvM92lAwQ4Ce
         abjTaVUOFXuRt3XHPJn6MgpGk1Dzs53G9wkcH14Ov//O2GXC3157FfY7kt0zLSlojGKA
         twew==
X-Forwarded-Encrypted: i=1; AJvYcCUTZ4OJk8ry21bJd5NWUY3qSoU05Kv8okI5qHGh4YZo07clBDnKVW4tDAvXXR7DmaykCdfI8Pywqx/k754=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa1sOcyam0C2ATqbuE1UkR6dWLyAgJlweqEh6JYr3VrHhUshkA
	Mt1ngUVSrnsFVogzThMee5dnulVOC7v+ocpz069ixto8U9XfMtfCy/uYzIEJjBpJ/2WqBycCvAB
	fashTSjfmby6FzTTsNEdyWgIrY6vkYnnyhPLgzQHEmp8OOMfBBAtmYcNAQDzjwlQ=
X-Gm-Gg: ASbGncuRGODnAQn/pkZTXGgoA47ZvU4vMIwUQY0c67/YeJwicR8u7yhCtT00JmTam9F
	qyiBzTMLIUnAujoRpPft3VWkIvloM/MEcK+YhWfwixxGsTvYy8PlSX2zYJ9reE7qAk/vPNuFW+c
	rMSYIJksOUzUOMXI4r0pzZdE06KJpqEe72cz6qwb8QVSnx0Qi02DyKzvPmNLERKcdYSSVl4zIgt
	7W2zR4iY266ZoiAGqWmzf6hmh9ZoBKwuzaftwHTw9pr8o5TFFzTDK3rsAAnFr6i+qWxKFcWQ801
	P/5fun6Fac6vt0aUWYSwOhyuGI7mk8DYLJ21HE8sCwt/A3EklUrH/VbjDkK+srq/L6yiVNI6ix2
	DgvBsA/oFKKD+7pZ096RxT/UH
X-Received: by 2002:a05:620a:2b48:b0:7c3:cd78:df43 with SMTP id af79cd13be357-7c9607acbb3mr577616085a.58.1745603236227;
        Fri, 25 Apr 2025 10:47:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXc63YgasBioIfPyv4s4+i+5SA3kwzq74Oh0ca2GCZsKjTjH6+xDOPmc2+pgsugmJAfdYlyg==
X-Received: by 2002:a05:620a:2b48:b0:7c3:cd78:df43 with SMTP id af79cd13be357-7c9607acbb3mr577610985a.58.1745603235745;
        Fri, 25 Apr 2025 10:47:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3bd4asm673193e87.84.2025.04.25.10.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 10:47:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 20:47:04 +0300
Subject: [PATCH v3 04/11] dt-bindings: soc: qcom,rpm: add missing
 clock-controller node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fix-nexus-4-v3-4-da4e39e86d41@oss.qualcomm.com>
References: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
In-Reply-To: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Lee Jones <lee@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1206;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=WRG9dHTLQ2jwnkCiRxmgtVZUE3m+6omsipYnyHhT2vg=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQwb3qVnBjhOjN1cX+3w9/23Xn69pkQ8NPkfkSe3mub1L+
 X9cRYZUJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAmsmM1+1/BgueLbZkWFJT8
 feC4w3nJitqObYpF1zjVRU2a5Gw6N4b0FOU5Z8pk6zYn7DP6bshlpnVCdJ1RwgttdoEW/R6N+wz
 hX9uO7LWaL3s9uugT2xZLNvOsS6YsEnEqypxqz+L/h/1lfc6w22SLlwCrWixDkyxLWFyh3m/Ztc
 FfZ3ewbHJdwbLhoZStQfa6XXfX9V5Uyq2q9NSXZEt6w8ujpDG/c8516aK9Ki9/9/55LVDPfWyZx
 XwGF0HB305LZ7dODN1keeipGnfl6eSCO9kLZwp/6G6x/Zzb3iC655TRNMHWjhL363qh8/+ps+fl
 8bKvWCjQ82cJ/87pNxafdFha/XJNk+jSZ7da/lxwYXAGAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyNiBTYWx0ZWRfX8Q4M851ukKps 0yZC2G55c7qDEFFHfH+tmI065cVJBNFgNeWMtZY3ke99DajgVRxMJWhOMc5OI9Urw1HqurK5iyT kU5OD3Q1EDii9zEkCmuh3nOovklwGGzzjeKlA0OQ0KdbtbKUoV+TfK6VnGd8R0PCX/Ng/uDjS2i
 Wnnz1Wm0N+tXWchl6PwGytCfPQpI5+k9loKBNXFE8Fp1wLkaj6yc07ixsAemgv1stVd6So2cLZM lWMG6tybr4UeNlMrgMnD1dcLf+w8G6U3fMSV0HpnE9DB5+wSi2wkQW+8l+mQtwI5cpUIKacYHp5 jte9b6H1XmIsQXL0ozIfIyngMUksuQshgXaMuKUP6HKM19VDsj2dyiyVxIvAzOhyy9cMpKwkAeY
 ci7oG59tTcj/vYZXXaEVvR3vCXcuZeweZSapab/tVvbL4jJ7w7X4WCPpGhJBM6qAw8Yhscpj
X-Proofpoint-GUID: eMh6k50G5oU8YIruN3xuPi0V8iTadtCJ
X-Proofpoint-ORIG-GUID: eMh6k50G5oU8YIruN3xuPi0V8iTadtCJ
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=680bcaa4 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=-Z_mRg2wFor0aBS9cE8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250126

On Qualcomm platforms in addition to regulators the RPM also provides
clocks via the child clock-controller node. Describe it properly in the
schema.

Fixes: 872f91b5ea72 ("clk: qcom: Add support for RPM Clocks")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,rpm.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,rpm.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,rpm.yaml
index b00be9e01206d1c61802dee9f9ec777c4b946b7b..10956240df0856a4241d6032d3aff7d447af9ce6 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,rpm.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,rpm.yaml
@@ -46,6 +46,14 @@ properties:
     description:
       Three entries specifying the outgoing ipc bit used for signaling the RPM.
 
+  clock-controller:
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        contains:
+          const: qcom,rpmcc
+
 patternProperties:
   "^regulators(-[01])?$":
     type: object

-- 
2.39.5

