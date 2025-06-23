Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E54124DCEC
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 13:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750683874; cv=none; b=gzbHaPW4/fXPXgKxJndQybg68hNJAOpcibJ7oYCASspe7gPSP6rEiwKiVzmCEVdrdGI5uXBY/Kr5bnGAL59Cg6KEPtskB++OtX0TaMmSfNnpW8XNYFNyoKkR8vvu2N3VB0zqaLMWe06Ru9eW6ygUOyT+P3NmSzvMhcPJMwRCsr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750683874; c=relaxed/simple;
	bh=ABdaqENSYXTRrd7yvdzoF7IPntxPkFmQXQe0yMEyiF0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RLfkbmfI7aFdZ3itAqmIZWilMO3pinn+CRq4mnOFPSK6LXTz1hRs8YAxYjji4Vfwse03+eCr3Obj7tTa65g2sRdATj+OSJUqhLKhE4th5kixaBKbTHCsnM0bdp+b9Bd1FoFHg63XaVVAZhLM1v85xxxWWUgRAksj/RQEvkhY2H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FZJDX5yS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FZJDX5yS"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N7fRTv021627
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 13:04:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pHDxcJKGh2U
	UCfNalxcaB+TVZcoQtFA5ClAelCMQb4o=; b=FZJDX5ySkicGCxpZrKDuvXe4MXS
	QCHVE4Yb0QgK+DNL2qmhp9/Bio4nl03xoYkPfasiuo4qZeXaluhwyn4WjP/6WTad
	X2kNoXp+/zJaEWfsdlUcX3suJj6QQFfIDbBNKiR5HQHcf5N703HJBHzVbCwjsbCM
	NZwLFaP3a7yXgk61+9hs3o6geBX6fkJg58DwducQMxDG5wFvXEiWrx3nB1aGiOaf
	yvzCrwnZNfxDdeHRNGmttFvoj/cuBpWkOTRZMg8TMcHobjOG+MsCEECocxvtVi4A
	x3pQVeiXN94B52E044qvMShTVua5GQdBC8U52htO6UG9GVBbexv/gNFo8XA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rprvgt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 13:04:32 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-749294392e4so67409b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 06:04:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750683871; x=1751288671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pHDxcJKGh2UUCfNalxcaB+TVZcoQtFA5ClAelCMQb4o=;
        b=LluO6IDhnVdFvmExJ9o4gCBiDNxGjLgBlkdNybiKnMBoWS9B5cfznmNofBB2TJUpOV
         5JV5a5zVp582MRJwWuB1VUZFtUFoOLF6rXPjkjQfl4TkQmikuin7XgbB/JiVspr0uoFy
         V7H7xOnSzOwa4dD3EHoh6Pk2a7+ctKzZWxU7hkcR3WMeu4anuyPMQmTTJIuSLTAUntFk
         7Z2ZY+Io6GCmxIkJJXagDSj/ELybwoVFhlS9UzDdQcySVyN8y9CTGaHn/lfwYx6kTBzE
         Nq+y0F0whp4bAQZ6eliOEG/nkeiYm/8XiO666wz0fB/T3WB6g3VOb29jtYtZFAtewtm8
         3w3g==
X-Forwarded-Encrypted: i=1; AJvYcCVFz3mw75SRbxvKetOUuYVwi2HA8rq8+0uivt/e7eQfHHbn/2LG7sX7NZN4yNr1KwSmg50hVmDhn4za9k0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxroNFGNK3DIsB5CqcJZH+6/6Hp9bcJtk1wYXOZZOhxdTlRCOBW
	G96hqcleGIs6ftahUH3+NWMlP6faJTDExw5xASgx4CXliO41bWYMY/EwwkRtZPPY79XDaFeJ+GS
	XDVtqj/zxl/4MJaVn51ihhaKOze5VIJLcTarfbAQ/MVXPR+omY172ep4tn6XgNZlswts=
X-Gm-Gg: ASbGnctp7nizaVCQ33nicweylXNoQEHfbgmvsTg6EneeP0rA/QWeJodqasBdrCxCzFH
	xrNGT5LMMguOPquIA6l8ZJvj1W51pkoutWUBEB0bjcNBNbyK+PThfF3afoAyLeqgL10wswR+hoo
	tcTAUhZ6yrEc6Q/eMC1gsshioqggiQYqT2PgjdaiJ2NchtSDhMKvD2YSUqRFpOQ7NJwnE1Z8w26
	5idj8Sb65szd9vrqmGFBQQ1UqAvAfNXM47PjkaNfN2WQWPEE0GCyP6/Kb3fLNrwtoo3ILyrC/pU
	hzFGANe11CR/QS8qdJwlS1rK5df+w7XYM7yJl7Oc0hOp/w6mf+ru9w==
X-Received: by 2002:a05:6a00:b01a:b0:725:f1f2:43eb with SMTP id d2e1a72fcca58-7490d6a1ee6mr4405862b3a.6.1750683870770;
        Mon, 23 Jun 2025 06:04:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNx2K0JOd8Kc4Cd+tAf/KCwgszWamGgd6+OdAtY7foj+ETBqCEPWjaYrCYrTcfXyaWLXngqg==
X-Received: by 2002:a05:6a00:b01a:b0:725:f1f2:43eb with SMTP id d2e1a72fcca58-7490d6a1ee6mr4405843b3a.6.1750683870305;
        Mon, 23 Jun 2025 06:04:30 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a46b8b2sm8713437b3a.16.2025.06.23.06.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 06:04:29 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        umang.chheda@oss.qualcomm.com
Subject: [PATCH 1/2] dt-bindings: arm: qcom: Add bindings for IQ8 EVK board
Date: Mon, 23 Jun 2025 18:34:19 +0530
Message-Id: <20250623130420.3981916-2-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250623130420.3981916-1-umang.chheda@oss.qualcomm.com>
References: <20250623130420.3981916-1-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=685950e0 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=_mClcNrwC1fGIE5T0mMA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA3OCBTYWx0ZWRfXw2FXtV8hkjXI
 qqyiFSyhtBaRNW8843lUVdTPR9LtGiuKBFPg5jofqzIk1OhjiUNayMLgv4IZ7fcgc9wpFXPKt7D
 7OpgPNKnfazoBxKVDRo2lpeFBIJi4Vko0/gd7sx/cHYPpC2MbKfAbDfKQbwfCb/w9D4KCk4ukMN
 tLcsuCOcWI1eJ1U4u+jKXgYGo1RI2X4n6ovAujph2SHVykRjBebifBR2HMqFJder8wau/QwHAVd
 CqV2ORP5UO/xfVuFyBRWrDuQBiqf0DtacYX3Xi7l+QKS4SUR+qmtj19KqfM4ubB76CiYb6rac23
 dlq+WhyQj8MxbpIFB7b3WM7bJbH+EtHHBFHU8WIc5ctyyn6fKQp30wGm8juPfcYVDlElfY4pGih
 7PPgvQ7HMv2dcxISKRdFzoye65GCjqiJx+tgWNS9KZhtK3kqhc4cvwCwaAP/6slwEcwQ7uqa
X-Proofpoint-ORIG-GUID: 7mRb1K_8t4tU-FLncP_kKTMGqKWtbKIE
X-Proofpoint-GUID: 7mRb1K_8t4tU-FLncP_kKTMGqKWtbKIE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 adultscore=0
 clxscore=1011 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230078

QCS8275 is another SoC under IQ8 series of SoCs. Unlike QCS8300
which has safety features, it doesn't have safety monitoring feature
of Safety-Island(SAIL) subsystem, which affects thermal management.

qcs8275-iq-8275-evk board is based on QCS8275 SOC.

Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index b14206d11f8b..19823bc91a3b 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -54,6 +54,7 @@ description: |
         msm8998
         qcs404
         qcs615
+        qcs8275
         qcs8300
         qcs8550
         qcm2290
@@ -935,6 +936,12 @@ properties:
           - const: qcom,qcs404-evb
           - const: qcom,qcs404
 
+      - items:
+          - enum:
+              - qcom,qcs8275-iq-8275-evk
+          - const: qcom,qcs8275
+          - const: qcom,qcs8300
+
       - items:
           - enum:
               - qcom,qcs8300-ride
-- 
2.25.1

