Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C03290BD5
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 09:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750151233; cv=none; b=LMoAaDfbWEgtoH8l6yn7mVsf1EntUv/KbY5kIJAAO2Kn97oL6D9Qcw8TGNocMSBL83ClkwxFZwu16YJqec6xe3KcGDa0R3ZX4dV9MokIWsyXpSZ+P9WkBJPSqXIuqjpqqkPvCLJbAmBN/Ww4kJCJeIiSkuNAqCFRcIt8OR0wt1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750151233; c=relaxed/simple;
	bh=Vn5omH7xMvt1iEtCLJWJvK4XrcA+3vcYMlQkxOXLM/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f2TISyasYKf+3OkoT1UPff1P+iyJQdTAwnyxdWALEnJobdQDDQhZMcyI7dAYIpCwBi5NOPwwthesxFgYQgWD90x+6LG5Df+kNyCcWv/XqSq0Z8Df9tPreO4ZzkfNlCm9MAikPLpN5iq8pylJLUt0vXs8iOEZbupwGhpcDPw4Rzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V1KirzYT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V1KirzYT"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H7PLd8028159
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 09:07:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Qly2EdwvT9V
	KNW+eXeSW4hrs+ShzHfZ0sLmUFke1LiY=; b=V1KirzYTdvewPve4ZhqqrTPVYAh
	mR1kMmckSPeVElmcI24KcJbXd8tH6RKYDWkGlaYzNM9W0LSeqCDEbux+idDTi4z2
	vKTJRXKaiisaRl2n/Dd2A48lUSsengNgNHMm6+9bVpEFPDA0e/UMQ3OZcb7nmBHV
	1klalkHEX14NbZG1X+CI8PibVAdmq8o6IZGwuGMAav0xikj4QZwTl9ZIUIqm5sO5
	24WeqDLkrTYX21MIN6bfbQyon2eXQxU3CYubO2R+QFTq9yueB1IiJfkNmnJuUwEt
	/g+BSkoPsxdaNnIuiaplrwBoxVGDFECNQV2Xi1Lt5RLS+93EXxsElpu+mHg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791f77mta-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 09:07:10 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-235842baba4so45335075ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 02:07:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750151230; x=1750756030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qly2EdwvT9VKNW+eXeSW4hrs+ShzHfZ0sLmUFke1LiY=;
        b=AEJyDbtdWDIFlLtcUvTi3gZWnGJY2yWLCBbTonzikrRrqBkER8HejHHgKCgw8oznYG
         Vc1HxRqEvOE3Xg6sUHMthDL5/K384laI7j4KCk9qnWgZx7aR0K7eJbYxcHsgR/pemrQC
         HteOITaqGJgeg9ho+hHjiwEuclBZ23LQYJltaQS4UqjYVA7HU9m8kmjG4g6JW5w7XM7W
         clAHPJd4vszrawTy6Y2+zccL9yeR3rgofaCJyNGlJBqiY/MA17NdZZgQpCcSm4Z9uDcV
         +tYWKVWt2Wfbq2Gm2oOno9T3EZem6+umDqPVISsTc0BUu/Se+NqhNJin8gCYEx1sKscE
         fyXA==
X-Forwarded-Encrypted: i=1; AJvYcCXhbwBHnstHfHvqCyGHbyLXjO8kdinhQgTBo9S5j1pBc50GA6yA5TnxcECHRd/AWbmhKXNFjsXMX48rfgc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2B/kPutOKpL/rttK6H5GAee37n/DUuiQgob7v2YOdyxVNkoUG
	4Zxqo2jccj8zMYRdQsegu6gO5UJZ0luQ0hCNtJ4As3Ty0qGv8DM8l1RyhkMlV7Xor29+t3Cw8B4
	woQzsTufPel2w7apEjr1xOEuiIdinP3uPdxZZePJOXtWMFsaKcaEduPiCX4TXhlQgX0U=
X-Gm-Gg: ASbGncsxAjzVGNFIgLQYplL8zdHH8nLL79V3zvZAW11Vxl+TNGBy3Wp763svKA3TqDO
	QjoBZ8xHlHKg+iRYozH1U+pl/y67g4iMbZCXF5wrqKVg1G98UvCFMh9EFliTmIEXmrGx68WyzsM
	HVx3Ka6tZqibzXsC8dkfZlvLLuDkBn2qeeA5xw/Bm4SmyUBatNOsDcwu/s1hFULq60piExp0mVh
	jkoGzlPWUyPa7/rmqbxEEoeij1S8mCw4r2XGg1R/7AWbDyCnRi4CixwrbbOX1ykxaRh4RhwlUYj
	raUwcbaPGQv8Z+LbZq455O6cRxIXgtE+Gx9AqN2sKyVpIeghQd2H7uGDfMIQtw==
X-Received: by 2002:a17:902:ef45:b0:234:a063:e2b5 with SMTP id d9443c01a7336-2366b1224a8mr179419845ad.30.1750151229665;
        Tue, 17 Jun 2025 02:07:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOtX4HvuLhem2kJyZ83xaYVvt9E2oOIf3GftGjva6d/NVHBthTT2N3GFudpNlTYUanrft4LA==
X-Received: by 2002:a17:902:ef45:b0:234:a063:e2b5 with SMTP id d9443c01a7336-2366b1224a8mr179419395ad.30.1750151229257;
        Tue, 17 Jun 2025 02:07:09 -0700 (PDT)
Received: from cb9a88ed5d41.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1bdb39bsm10017370a91.20.2025.06.17.02.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 02:07:09 -0700 (PDT)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Mike Tiption <mdtipton@quicinc.com>,
        Sibi Sankar <quic_sibis@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: interconnect: Add EPSS L3 compatible for QCS8300 SoC
Date: Tue, 17 Jun 2025 09:06:49 +0000
Message-ID: <20250617090651.55-2-raviteja.laggyshetty@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617090651.55-1-raviteja.laggyshetty@oss.qualcomm.com>
References: <20250617090651.55-1-raviteja.laggyshetty@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA3MyBTYWx0ZWRfXwXTVXLh+qB1+
 Z2BY/zaB6V/BIcFA0hyPqBTIBm2pgRd9ItpozV98IVguZkVlAOZtWcyETQEI3Z/R5q2WUT5Bfum
 TKO7GhU4EveHbTlLCNYcxwUNjERjpUWq4O9t0uISfmixhETI2eOjNWWOIaakUF9HMnMZGw1lfUu
 XbjpV1jHG5MR7qdN9ybtX4yg1oqj0lWq6pqm2LsqIjA0GQlVDsndUyiDHBm7I28P39Fb2jNUQ4A
 PINlpJ2ey4pmx0NyR66ojiwk+xJWu6C0lt/6dE/1c1Aae/EcSNJsleIC7dqxrs8znf0DOfHOwc0
 WOd92eMjiFxi9Pqtc3gHYsM0/Z+5p3JnvI9g/NDqel5jm5xVeAti96tKCRzeyfUDEB+41lsgs/H
 Sfsswefy46iafMM5UF/2TEDigMZK0xuxTYFoaa4OY66C/GjPEoUkA7EfWsnZCD+Zs7dZlETE
X-Proofpoint-GUID: cwAon_q9xtTI99WJ96YHT_XMa8eKzB-E
X-Proofpoint-ORIG-GUID: cwAon_q9xtTI99WJ96YHT_XMa8eKzB-E
X-Authority-Analysis: v=2.4 cv=FrIF/3rq c=1 sm=1 tr=0 ts=6851303e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=n01AJKLZCHBDCBjb8ZAA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_03,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 malwarescore=0 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506170073

Add Epoch Subsystem (EPSS) L3 interconnect provider binding for
QCS8300 SoC.

Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
index cd4bb912e0dc..64ad3898abb6 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
@@ -35,6 +35,7 @@ properties:
               - qcom,sm8250-epss-l3
               - qcom,sm8350-epss-l3
               - qcom,sm8650-epss-l3
+              - qcom,qcs8300-epss-l3
           - const: qcom,epss-l3
 
   reg:
-- 
2.43.0

