Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E45C1AA1E0
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 02:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743043797; cv=none; b=bM7b2kp9B6uGKE0s5h2RS4smX0/q1FDfQ4QqVH7l6mV9NMLsjJg1wayQ/1VhLZmrIvaLRawiL61Cs7O7b8Lyny81C2cRjMt551au1EngfhvTKpTdHL0NWL6lnkU68LGaoJg79sF9d60mm2XkhciKmEIPLx255PX5GjEVOB8VYlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743043797; c=relaxed/simple;
	bh=Q54O5th54Yr683QpriCePZEsUmE8QEGP6/Tb0ZslXTw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=A6PojqY+b16/mAKPziKWRgqlKwoniH4ZEZuJ87iAT/qllbsBkbk8yqqqJFIhNjq46lRK2X15RUPduCkuqwUXMUgey07kkt4c20Ej2wTMg3GWlVGPkQX00niqWcqDOOQKWvJxf7TcX0K8kG0SZP4/C2Y+2ji0m1Ki5+Zl6GTirHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kA07C0iw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kA07C0iw"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52QFJq1c009030
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 02:49:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=H8iGPFMmyVn
	6gQMq0G1OkkASBSaasB5q9GB5dI1pqRk=; b=kA07C0iw3juVIv5Iw+h72etKYA8
	7PqCWIn245QBdd8az7NTzpb/gdcDSL4z/li/1P7Sv8bt20PR1Wqe4DPYlYH4IPdC
	9Pc9gPBbiwVecl/ZXHimnN/lyfkD8qxYR0B8pZ75tQeMYKHMcc0jOHQxMvxlf0J9
	f+p4rmQDGaUSvqNFuOOKSmgzDpMD4w6D9zd6xuc1Hser7nqTFq5U9KGzlM/rGjnT
	vhiyfk0O9ZPb3LC2yxLDNB7SCa+qFDN6cybJ6EvknyNFnxonuA1a0b7L7G4uDxev
	SL0dnNRBui59EE8BiD4tznIl8gsNI/xcnCZtIBkrmtgCxqby+i4qogqDr2w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kmd4q3du-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 02:49:55 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-22650077995so14097815ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 19:49:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743043795; x=1743648595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H8iGPFMmyVn6gQMq0G1OkkASBSaasB5q9GB5dI1pqRk=;
        b=SbGUS8qHxaLvvirbak3UsAxKU9XXETIro5dkUdUa0aWUhWjWNHYTQV1xa7+yjs6Pjr
         v7x6Tx2St7ot28iQCc2drR+k/SDRr9iFeXkLHxR/ROYZ4YgVSlZSrTcm7eocOn9yy3Y6
         GVAa5NeETVZ9Ig2r7fIb7hUMBJAxTmVDApjnRvZqzEFevUXN6FIOQLKtja/ed72g9hPK
         JtNsD+8qPHblwbKh6i2lcLgXaVdx7zC3Di66qHtvHEoBBAvsYsUu3mlb27C/aWrRrxOJ
         OFldYCDwB0fROGj6o+DicuhhN8Haau29TcI/KrDS1YLNpsUPXaCj693jd5E/DDRnEDhD
         nmCg==
X-Forwarded-Encrypted: i=1; AJvYcCUSfKH325yjRM4CI/Qtmv3V7JaBgWri/r0BqAmEBgY9LxZAv1zkGujcjsgcj3A4PAjQSyuRoMKkAuWDLYg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzpP2t9FCrRxlzMmiZ44KwiZ6SF5xWYp9giWNmLDwd/3c6xnNx
	I6xH05OpXdF6ldlCC7vUlKCPJDMccHoaM5Te14eIg3fFVRpJ7ashst48uj3915TOez17ZUkBo/6
	K2/0cGmOxYx2ipDknP3Qb1+qx+Oldbma1V2NOMhsiI4j2EtaXK+9LUlJNpF9jakw=
X-Gm-Gg: ASbGncuvLulR0Kt6EFUtkY/Y3uiN5hFR58hfhdZ+P5UOUH3nRDINv43STzsxlV05PTJ
	6fUZUKy1AnXqK2pp/ZEmJQVEd26cCWmeZoUmPY1iNfs2cW34OpdqwQ3ZmfajDZrrCQmU6kk9Nga
	d9PIgF1u89EfNQacmqdFBrBpN0gGlxfA1WYvf8DI4eNMiIFQfc8GWiWSiY8Sp23RyiE/6rB3XIh
	AlOi/kSSthCm4LaI5N3c0O8MuOnYo8hEfzPQs3onayVpfGPUodjHuz4x/OEFpJXjfudeuJJHdvu
	tUK1dAAagEH2tFE5Ym9H1AOprCd3QZ/pVxH1YccastY6ZlBfGHEdxgkcF1APja+Ta3mcTduScxQ
	=
X-Received: by 2002:a05:6a00:ac4:b0:736:52d7:daca with SMTP id d2e1a72fcca58-739610a5b56mr2766930b3a.18.1743043794662;
        Wed, 26 Mar 2025 19:49:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhadWVzXuXudN7ZI3JoVA9KX4BVxT9zfAo12+PNeyFUGmjuLt8mHIeoFIhjG6qR8qbF/v+iQ==
X-Received: by 2002:a05:6a00:ac4:b0:736:52d7:daca with SMTP id d2e1a72fcca58-739610a5b56mr2766905b3a.18.1743043794299;
        Wed, 26 Mar 2025 19:49:54 -0700 (PDT)
Received: from jiegan-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390615874csm13511878b3a.143.2025.03.26.19.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 19:49:53 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao <quic_jinlmao@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: arm: add CTCU device for QCS8300
Date: Thu, 27 Mar 2025 10:49:42 +0800
Message-Id: <20250327024943.3502313-2-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250327024943.3502313-1-jie.gan@oss.qualcomm.com>
References: <20250327024943.3502313-1-jie.gan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: J6Z3dvXIV_oPvWruriblDfgnS0u4PoBr
X-Proofpoint-GUID: J6Z3dvXIV_oPvWruriblDfgnS0u4PoBr
X-Authority-Analysis: v=2.4 cv=QLZoRhLL c=1 sm=1 tr=0 ts=67e4bcd3 cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=kgaVu5s5ZSICvDejui0A:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_09,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270017

The CTCU device for QCS8300 shares the same configurations as SA8775p. Add
a fallback to enable the CTCU for QCS8300 to utilize the compitable of the
SA8775p.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../devicetree/bindings/arm/qcom,coresight-ctcu.yaml     | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index 843b52eaf872..7f3aa503da53 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -26,8 +26,13 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - qcom,sa8775p-ctcu
+    oneOf:
+      - items:
+          - enum:
+              - qcom,qcs8300-ctcu
+          - const: qcom,sa8775p-ctcu
+      - enum:
+          - qcom,sa8775p-ctcu
 
   reg:
     maxItems: 1
-- 
2.34.1

