Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CA326AA8C
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 08:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747643669; cv=none; b=MIjdQ9IogxxdVvR3SOrFgYdfuWfV/TLf7xhho4XknB21X8nAxq5hqRS5/ZKV3MD3Eex8tLeSuOQZFw4wQhqB2f9z3SUu9fbqlRShyN0PKg2Rezr6kjmv/k0stQasG2mfV6Dj+P7kbpuEWSO4k4EEW/kpxavTQrrCB65JHOSTImY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747643669; c=relaxed/simple;
	bh=fqBew/FA4DoCqTsvrtKiOphEfEC/JCHBHSYBznSUuYU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sx6TKsidljOs1gs8NNs/GenfXDGdO2qwj4xscmPYrG0RE7cAz06Q5JRyxlGKGMC40G/JEu+BCZvWJmUkBpAnqe+aRQ6FCngN2zSUSwlIBObdF9Y9rI4hSsdU9Kj8+SRUUeVP0EaqDWThh3oFtMwU4KaFAyAU3EsjRYH+xgoMqLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O9C0kV7R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O9C0kV7R"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54INvls7030233
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 08:34:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lyEF3SaC2uCwCA8G8SflI+3/OAOcfqozcvxOAxElUuA=; b=O9C0kV7RE333OnX0
	RUJbHELNfSXsniZBtX7T6FdL9GedxrjzyWhR5i5FwIRn5qo3K4aUSP4Cf7+8ILCu
	XZN4d0E30U4q/QyjrUUwBtbP/q2g//Ptucf4K43synhoGIFIaJXXJvWQ0SsR/0lM
	Wbuq3guAdFf1Bx6Rx47wi0+yGF+2jt3z+C3K0B24Ez8J+OLXPmHHOxDrm6lAsXlB
	Ljo9pE6RYDiq4lRcmWL3RkID+OrBO2XtTqr5q8ILb+7Hs/svOXsJSGkGqXQ1oXOh
	pCoeCNOzQop2l6a0sedSVHGFGs3b0z6OvIS0P6wXjYZ72K3ZLyJM28Jzbuwals/1
	MD/OpQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4kmk9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 08:34:26 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-742c00c9044so1060667b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 01:34:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747643665; x=1748248465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lyEF3SaC2uCwCA8G8SflI+3/OAOcfqozcvxOAxElUuA=;
        b=M+YWwfzOtkbR/4e5z+s5ZdB4cpRNPZiOjxmGtsnEjrx/KKJP9ZoIxdVyOqufpJUaXg
         5/0gegwdD9QxlU2ooSVun5GXsDiBnE3mVXuki151xHeIcmGq5N/fhwjR+ZdNLv7wW7uh
         QCWccaZWHh8qprQmPDD98OFyMKUCnJKx9tiV2vQbxhgsqvHlGmlPEmxUQTd01c7dGouE
         mxamyVEPIcCPz6THi+WJTt8N61k4OSBKet/LQUsGMa01MBc1QVmoHxF4gdOZOc6ln+sW
         Ry8sUu/I023UEt9dXculT0gtPyBXUj21+Qc6Mm2NtZ0cwJ5xPFNd86iQ9wBUn2obsc5j
         ozqA==
X-Forwarded-Encrypted: i=1; AJvYcCVbqezdsf3gZYQmJd0y9YX3ia88YlHqhTU70bTDzHV9oyyf3xJohG/jGe0XeJmQsc+H7RtUgKtZwBf9QvY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhLFelrJjabLGGer8wklXJoxpRy9qkdYtFjobq/TNQyIB5lmge
	6gb0GNG+j5Y0NtYHr7rWGv8RAL6gjbjm2fIBLRrHPOfblbnpPWd9B6MA2qOcFggQLrcqRDmVpWE
	Mn5/WRiD5K9i0gxqyeQYwPUbrS4/LwTnv8lAFpmuzDSzPoUO3XaSzDfDeJMVUf/k3Cb0=
X-Gm-Gg: ASbGncub+7kAyFkgxKjjbeHlLYdj75YxGu41uA7CD2ROf+Hvxy+LBdo9OrjP+vN16lK
	55EC+Yh7xbd3jPYu94i9x04vYvWzRrlTJjOQqu6oa1jeCyFnLstcd3RHVHq4O3T/fGePYC8THLZ
	O7A6h9WRjoYOS1aixRC6/bhrtZRVi+zyUsifAbpetWWO+LDd9uHFEPHvrACu5iUo024xbwqGnOQ
	GI/jGTkm1i8VPepGcqDNT4djxW4h5Tf4jLqRsvLEeiiqHcxi8qdtRxE7BVgTQjyTP685iqVoSoo
	8CapJMkZyS8J5vLSzypXpmJnV+KNU9qh+GDK2xoQJQahPUxPkwNtbN6oom1s6FKi7zDewg1uhEK
	rdPoLfQvKshp9zZ6Y7uiPD2kXcsG0CX3UUYZADL1JsSB7gcg=
X-Received: by 2002:a05:6a00:2790:b0:737:9b:582a with SMTP id d2e1a72fcca58-742a98de014mr16336818b3a.24.1747643665221;
        Mon, 19 May 2025 01:34:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJQTKw6lhnL36oUfmMNkC7r1OozD6njZlSoHl1rvqW4Fnyq6pePRJv/f81pLWmiXlgsxToig==
X-Received: by 2002:a05:6a00:2790:b0:737:9b:582a with SMTP id d2e1a72fcca58-742a98de014mr16336787b3a.24.1747643664821;
        Mon, 19 May 2025 01:34:24 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf5a2cesm5705475a12.9.2025.05.19.01.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 01:34:24 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 19 May 2025 14:04:01 +0530
Subject: [PATCH v4 1/5] dt-bindings: sram: qcom,imem: Document IPQ5424
 compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-wdt_reset_reason-v4-1-d59d21275c75@oss.qualcomm.com>
References: <20250519-wdt_reset_reason-v4-0-d59d21275c75@oss.qualcomm.com>
In-Reply-To: <20250519-wdt_reset_reason-v4-0-d59d21275c75@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747643657; l=935;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=fqBew/FA4DoCqTsvrtKiOphEfEC/JCHBHSYBznSUuYU=;
 b=4Tg02kg9nftr++Xi2EeCTYjzRNEjyorie8LjM/S9D3N1KpNzzT2t+nX0iGVl4US5bQP8KHmI/
 wD7HrED7G3bB7A1tEayBLv5Z65ywx40IJjm/NtYMtIZ8KIAhA1KzutY
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: oYGxw2RhMxK9_8VSbVY8BQhgI3XNNqeI
X-Authority-Analysis: v=2.4 cv=C4bpyRP+ c=1 sm=1 tr=0 ts=682aed12 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=7sp3e_VSdAcdU5CosJ0A:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: oYGxw2RhMxK9_8VSbVY8BQhgI3XNNqeI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA4MSBTYWx0ZWRfX3c2w6Ns99B7b
 GBApV8OHANXR7sFG54CKrM2lJEa1ysWB2zeFf4f+J11qnIqOVxX37uKlfoIZ+aY8SbFR8NrCQI+
 nC2RSOwXUf81Z4B3vSknxEo4UmXZ+mFUjLxrbX4FIxs44KPgkIBluAIUphX5geIc1tA8p5eKm83
 yzrhVBoqjOVEW7Xp5ecI/Fa5vzz3+vb1UVR/Xsegb3qBLOqOslL1mFyab9gx6D55Erp9KGaa1Dt
 rx1ozUkrOgbw/Gn3tIrusKWafIXtT95gpQKzwmrUtqXlWHLjd5nZlrXjJfV7uVBohE9xC51gcfp
 ZiymUKIom8Wn/Ye4lpqRCHrpq4UBW55XVYC2WWvppIZVjjlAi1538BNwTrxNqV3HZGGK6Nqb70a
 RBh22c79WySF4ZTleCVd8mB1beGPj3jkPohHCslGPYdUiFhGlY743SH4mQ4Wyie3gM4bVLNe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_03,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=993 spamscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190081

Add compatible for Qualcomm's IPQ5424 IMEM.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v4:
	- No changes
Changes in v3:
	- Picked up the A-b tag
---
 Documentation/devicetree/bindings/sram/qcom,imem.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
index 2711f90d9664b70fcd1e2f7e2dfd3386ed5c1952..dec1b1ee924cf1386f559eb262ea864f2788c165 100644
--- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
+++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
@@ -18,6 +18,7 @@ properties:
     items:
       - enum:
           - qcom,apq8064-imem
+          - qcom,ipq5424-imem
           - qcom,msm8226-imem
           - qcom,msm8974-imem
           - qcom,msm8976-imem

-- 
2.34.1

