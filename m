Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1783278E49
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 08:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747643677; cv=none; b=LuY/hF4ybx6Lo5ls9aUFtvBAKsCNh3kHTOzzZ+0wtE7Wka3qvFCgFEDQGC6G/ywEYQfOXuap3/De5kTduMP5Dq4zsnuH2dnmFW6r30BbP3UYC7JBO5Bzdc6J39F786ykFqctjASqv0R/mfbI7F1JBSuJQkdk72PGF/ov0ZG4lyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747643677; c=relaxed/simple;
	bh=TsLhbYEG4W2UZwLu98GnAPHGkYHCo0Vd/d+EIez/5IU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V+6QxYW9dbEvq1RNTuYpaDOxUluqppZMqmcyc2r6s6DPXfaX56VJZMLKuV8+/uAz18xWpAn907iQyjZ+8eZxIN2DF6AtWYkufxRoCsaq0AwuTA0NYLASgEJ3bezyx08ceJUc1Y7NcgYmWmYmdCeDHDC0+3272ugPj+ICIuBKIYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ahi/r0cb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ahi/r0cb"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54IMtCIl026158
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 08:34:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q3i9LWuFQVKGnOBRD8v7wh7A2ciM2J9NI+q99j6RIhw=; b=Ahi/r0cbJmnnirKs
	k8TyuQSJic0aSrcFWjC7aeBYOXp3hEoCJrUngrtXskoF2w0dspWvMQhq6KErqCTk
	Tr8+68FszJYPpfiqtPs/Lp2F0rGWUMHhcxjhmBp1fOZyT6+sHrxZXyJaVy+t4z2O
	n3h6OAvIG/YjLKaDMiACu90nn5xbdAzoOFbNeWMxIGqDPcgu4e7OvHS9p+wEP9iD
	eOwflDW942j3XEe61kapODxtzksW78T3xXPybmzTablastoJBh+/W/SpR7IvnS7+
	bwOIbh7cyarvhPp03nMZTWlZ6uL3jMpOplXwj0LQ+mB0pHnTpBqXXbMpdmvW/Ucc
	OYeSUg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pju7bmkt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 08:34:34 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b0e0c573531so2809500a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 01:34:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747643673; x=1748248473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q3i9LWuFQVKGnOBRD8v7wh7A2ciM2J9NI+q99j6RIhw=;
        b=Voe0L/XxsCFRMk+qg7YmEcqWYkycVPO3MinYXjrEnFp7MBjo1qdsVaOlhjV8pRi4re
         CxeqbihpFTpJU7INu/CcnnuCTZIbBZlZWh/t+GxrM30NmLh9GNENtYq2SM8LHDo6M/uQ
         u4eZF5RSGo79i0oD3NwUYJ7ZHnbXAGaDfdqziRCwgYEI7y+sjtZoFIg5jN8tq4bjHWVI
         LV2mjN4VMrI9ERlI8xppR2yOIwV8LFPtoDTtiWguhwv+wbO5BUKEHr5E1H+uF75keXH3
         ZVmAsVcQ1vYlGHvwR0O0EdSyP6mh6kgNQVL/C1IrMgnGeuNU4ec9+8C3jfT+kDDjU1ZE
         pGIQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/wPNno0W8PpYf8MY1crLf4znwLrU/8vlwYhkEI++Tnlt2w1wKqfwTNGwxfKoMSWce7AjkMGcUo90RI18=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3WnOJPsNTOs6BHAaSRpw9R4ha9dLaawe6FS9ZGQVLNZNY5nsj
	cxYOyqaMT4Tr6pmdipKehGtlTbOE6ViVCqfKnbBv69q0HvK1tPcVL8Hsl2B+OxmiOwHi1ziIjaZ
	OTve8BkYkNAFSY6OEXHzC9X1X/mRn2cFBXKhjOvnCuGwAqzbIgt9q2jDcYNSnIaIn7TA=
X-Gm-Gg: ASbGnctzO8ka8Dhp+8lwdvVyvzk51Fqby4YF74p+CC2am6ph0uDtzhy29ITkBR8fXhP
	bANRljNO3YLLxfmTXn9Uo0h3Ls2xaOeFvRqvHFOGxgmdDY9BSb2JMotY4U9T4NuoATUa1mntQYw
	jJoEklSE562omhwrteLkcZobF4y7WHQ/1JWhx5YZ5bHcAf1EgJJDS5lUJ8CQ49HEqICsdCZiaYe
	oeUaEb75zFnNAWahtWEY5pa4cApk9NT/I3k0boIJIHqd18YJQtXxTZo3NALMsrIXYqGC6AJvc8c
	RBdBHIlgHffuT3mwL8jdJbO9LINCWmnLY5fOuS/qJ6EtqymhzQd6zgpBWs18S3aF4gA3PGIural
	vqlT61R5SdbDkq7NDYO6LRojJUkWJuYFm9s0XwPUSfkx7rQY=
X-Received: by 2002:a05:6a20:7fa7:b0:1f5:5ca4:2744 with SMTP id adf61e73a8af0-2162189ef47mr16769124637.17.1747643673278;
        Mon, 19 May 2025 01:34:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkog3pLTR6wQhBvQeivAevxsoJCv2JZBKSEW+h0R+Q7bF8fXq9mejEIQNqo0rSHrTjINqnmQ==
X-Received: by 2002:a05:6a20:7fa7:b0:1f5:5ca4:2744 with SMTP id adf61e73a8af0-2162189ef47mr16769088637.17.1747643672863;
        Mon, 19 May 2025 01:34:32 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf5a2cesm5705475a12.9.2025.05.19.01.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 01:34:32 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 19 May 2025 14:04:03 +0530
Subject: [PATCH v4 3/5] dt-bindings: watchdog: qcom-wdt: Document qcom,imem
 property
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-wdt_reset_reason-v4-3-d59d21275c75@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747643657; l=1835;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=TsLhbYEG4W2UZwLu98GnAPHGkYHCo0Vd/d+EIez/5IU=;
 b=OyCJmSO5oVigl8JwR5QSAjSTJGL1WO0OhSspgEdH0DngJj+D0n8HNy8BGLCS50hozF0K+BY5G
 VqaROZdDVKIC3mA82cHdtMbTNVAdiR7GQGAAn39So0tJPJpk0C2V1vN
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=XKEwSRhE c=1 sm=1 tr=0 ts=682aed1a cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=hdD7v9c95OJ3thUhsDcA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: hFVLMfMwmS85QvsAbZslv-vH_M0yBPlS
X-Proofpoint-GUID: hFVLMfMwmS85QvsAbZslv-vH_M0yBPlS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA4MSBTYWx0ZWRfXw00r9T4/5ZnD
 kSE9n1mVLEzKcI8BnuMVqMpsYYUOoJTnphc976LLEYhjjdCrahE5RZ8v/tgiYabwySD9tJZVy5S
 VMuwJt1s5rYCiM7LWV+ZARbEEo3+p7VffolK+i4ohsVb6yq13gvpX2SbT7pQKkLt9kbd0J8bxLr
 yE1aOEvYHF2yFP/RN7uK0ImtfxhLJ9NgAXLgGj6QWu+WGDFNUjVCr9flcRTemF4L845SBUo2oIU
 ms+h5lUJr0SmkHDLrSYL9/k3vzNHV39xjzB1sIdSRA7dCZzjXI0AZw8IsnSlyRI6vW2JIDqywL0
 NBiJZX3BRFT0qjD9poMPoNLN46feHmT6mYBbPTBtvaAnItE0lMFvtqC1J9fStsefl4Y4ez/NABl
 D6BWz50qHCs0xdKiWrnmd213yKBb4tK9wQYu0UBXqKC82mc7005xsFL8lLkG1Xjs9iLb8m67
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_03,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190081

Document the "qcom,imem" property for the watchdog device on Qualcomm
IPQ platforms. Use this property to extract the restart reason from
IMEM, which is updated by XBL. Populate the watchdog's bootstatus sysFS
entry with this information, when the system reboots due to a watchdog
timeout.

Describe this property for the IPQ5424 watchdog device and extend support
to other targets subsequently.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v4:
	- New patch
---
 .../devicetree/bindings/watchdog/qcom-wdt.yaml       | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index 49e2b807db0bc9d3edfc93ec41ad0df0b74ed032..bbe9b68ff4c8b813744ffd86bb52303943366fa2 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -81,6 +81,16 @@ properties:
     minItems: 1
     maxItems: 5
 
+  qcom,imem:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      phandle to the IMEM syscon node that exposes the system restart reason
+    items:
+      - items:
+          - description: phandle of IMEM syscon
+          - description: offset of restart reason region
+          - description: value indicate that the watchdog timeout has occurred
+
 required:
   - compatible
   - reg
@@ -117,6 +127,16 @@ allOf:
       required:
         - clock-frequency
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,apss-wdt-ipq5424
+    then:
+      required:
+        - qcom,imem
+
 unevaluatedProperties: false
 
 examples:

-- 
2.34.1

