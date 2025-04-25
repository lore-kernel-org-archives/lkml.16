Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07B021ADC5
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745603247; cv=none; b=onJ1p+t1PM/qvaewWFw8/49sG2bRxi8UK7ALxYY2iOlz8/2SfP20SjJ/sQrKMq/6OMN7Bz4+lsrDaRjY8z6ivu9m5s9Z8EjMkISHtlWRzeA9qZzBC6eKJs1g0miSBrJ67xFjb+xbDE1SQE7P2ekCwivJaoBCigZaIf+G4NSp4Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745603247; c=relaxed/simple;
	bh=FDMCvMj7/PXLNCw1GpXL+w9RnufE1DoZqoZIjeR8HUU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cGeEf17bj9YkeYKpNrtxw2ypkEz3GbBlg4VfhxgiEnm+JNh4SashCH72nAvLyBHQMhTGh9VceeTn0sTmDJjYvKDjedaVdZgkSXRiyXVQlkRlgYMnIYKIUtavjyh2/RrLmFj4tDG3hZ5frNfvL6G4gM6KSUxsYRy9ZA5ILUg8WS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EPQKad8h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EPQKad8h"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJvtC011485
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:47:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A0WlV/ORzBoIjlEcynq13EUQZNwykShO61g0I+cym80=; b=EPQKad8hO+29ci5N
	HJSfcbOEZie5Zo97e1xlAqtTeSokTebKcepERYbR3CIiNftn468nuauTdYuAC4AM
	yxpHX3LkNSDtIyudDRIhAHTt55kTnQkAWc+mlGZQDUyDWRAAxVvuOg1yXLC78vh4
	6MGaT+ofKWo7DnWLlmrqruCmgCQBVgPHgDTH7ZlLMitNshPapGRu1+MHpgEsmrg9
	caVldj/irbs2dMDQgjOGMIwOINIg5POo0w3jNGKwcDZaTbBfVI9LGF5WPy9ygoXD
	Q59l0wUyvWUpDxQgN/p1FJ9S8Fbmkiv6+XK0aaFc/TKXuP1hZMHl8FQfPlecqcXv
	i1srbw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3stgh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:47:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c0a3ff7e81so441732085a.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:47:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745603244; x=1746208044;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A0WlV/ORzBoIjlEcynq13EUQZNwykShO61g0I+cym80=;
        b=EylPneFkWUXyTR+QgWWB9qPVzvT80/5E7CeJFHg1T6lG098RYj5cVmr8rozZZD6A0W
         0CzhfKyIXq+CxYV7ZZahKeE7eztCmTtK4SHd6JwNfXyFJAkP7tk5GpprN/0T2iAJnxn0
         dpNvplgiALg3KMmbVKmuuyPnTT7/6SwMv0hNU+isIY1Al+o0lkOwdyR8IkPr4Sq6BA/+
         E0DMvZFcDuuAlVdJ0iBiOrDWtxqs9+jkLHvfb2cyPn9BvprCo0S00bPMhuGf+ylrAh59
         Un6T2J8Jj01AJe1poQhcOQIbKoSlS7aqPei3nRy2vUuOXCriR37uwAToNesL1KT9MwX9
         8QNg==
X-Forwarded-Encrypted: i=1; AJvYcCVhHD+jOABkKN86tZ23ZyYlO94M/s01AWhheP4XryUL5+WC0rnx2cMVJszDjQqyLbGXs2QWZcHYqpdgGNc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywezoip+WBnVlmzbuf+aaOWW7MNeRyjf0uBO/PWPaWpmy6LOPeI
	MS8othfWgLC2DuFEolIRsODshYsDLxNFOZ5uw+FctAn0wip3vbSoNpVZO5G20llZNE+M2A0gkVm
	C0xhRpCjl10qwwxgzL2aflMXAvsm77s84WGntqHaxYPM1ioSBmEae7RFO0wUHMds=
X-Gm-Gg: ASbGncuA+F1hwF/WuvGx2R/VM0VG1lUpNmKTgaCPUMUUMH2H5t2jddOYGVU8i1TFBfB
	ot9JWVNPao+GRX+00FrhDg9pWV0GiTWf/t5lAHdRzQIdJT9XmxnN6NHht3ke+4eIMz5ZXOQNcVK
	OXItEaTIXPPPYcKPkMLXr+Ga51YPLpV9mwXe+22bO2Q3vLcE+h3ZtVUfN91sojjPPLCxDuqEDsV
	va7jJYWAzoWg0Sr/ezdFf30iIbYVZBOu+UOvgK3rASU4qvz8mIekHQAxqsT8AUN9UvR0SLZHWJe
	TvssBRFnEx8U0msQPD2RlrWNym9ZkizL/bKQ7ZVMzYYKacJ8EU1JxMraFWjXqnQM7HM52eB8Eta
	BoeRl1sQljUXLqi/e5dQ36CER
X-Received: by 2002:a05:620a:1a17:b0:7c7:9aed:1f36 with SMTP id af79cd13be357-7c9607a93c6mr549158185a.40.1745603243989;
        Fri, 25 Apr 2025 10:47:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGNeIVbm5YyYTfo1SKrEUDYFsHhFGijcH4+jq9I2UwLvyQSPV6mMmcDq5lpZnJqcOChctv7w==
X-Received: by 2002:a05:620a:1a17:b0:7c7:9aed:1f36 with SMTP id af79cd13be357-7c9607a93c6mr549154185a.40.1745603243628;
        Fri, 25 Apr 2025 10:47:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3bd4asm673193e87.84.2025.04.25.10.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 10:47:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 20:47:08 +0300
Subject: [PATCH v3 08/11] ARM: dts: qcom: apq8064 merge hw splinlock into
 corresponding syscon device
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fix-nexus-4-v3-8-da4e39e86d41@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1454;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=FDMCvMj7/PXLNCw1GpXL+w9RnufE1DoZqoZIjeR8HUU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC8qbVivJ80tpTn9sHqosHf+sN3rHhgA6TY50R
 EOHpfznLIOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAvKmwAKCRCLPIo+Aiko
 1dZpB/9dbNHoyODZwnrfGxWAw5+Tm2ncq2NN1i1DpQvJuLY9y/mELKHs60iMFDnQlZeqZpZ7CO1
 XqPdzr8BukLZ3f/b7hUZRB5nl3nkZLm6iWF49Yeb4wDvlogAZmPMWMBUz08mzEFMekHaxYyPk8Q
 ogA5lM5KszNsYIPF0aGP0tH1urvsEAum0ujEOqvP6vr7IERpq/gYqAvrgx7oIjbaAfJ+BluWgjd
 2CqZ3bsmXZBt1Va+6CfVG+3RWok+6PC0s7JrqbwR36bQdNYPj3z7e16aiglwcJzlv01GPRYDFkL
 UrJGj2qd9oH19OfMU8WBVnFoCxlMAsbn+qOyCbaCs2VMTtdD
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: aIwABKI5UMpEdh_7F0w_d1ZPxMMLcMYu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyNiBTYWx0ZWRfXzWl8xXYp8ddD K9CzPlcCXT6LISdnH1s/uBdckA4LWWQxPTGxI8shaorlA72vSv2dAzUm1uSGDP15m+Y5LkzgeqM wT+/NAVjBPbEbdSzwTyDOW08YByQ3aB03kUdsyRP5zfC3Y9oH6NJ7GnjudziHNl+Fc9jaP+LnV4
 4z8q9sBpOlQL+DZR2C/CpG0UOf7ohGhQLIenLGcIq/wFYVDnKngKf5OcL2dNsRSBjzaADT8KcOL IE+IG7S7ug+gSETLdHD2TVa/wIq7ulCIY1m5LpKB7JXbyI93v6Zf/x6rnTJge+tYA8gvLaKzUog 5f4GcqxVIUgc3DQ3Q8Jlx8oPXvgYSzdAEj3sckYwlgSerPSVNH8z9+jg4uwC9tenAuN3FySV6hW
 SxGoh4uwkcffndU4vGZMprEYycEisLObjf/FsEZzLYHNTv7jk1T4arLql24XMFCSx0/9CJC2
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=680bcaac cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=rbKIQ1AqokDPPu1yVMsA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: aIwABKI5UMpEdh_7F0w_d1ZPxMMLcMYu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=698 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250126

Follow up the expected way of describing the SFPB hwspinlock and merge
hwspinlock node into corresponding syscon node, fixing several dt-schema
warnings.

Fixes: 24a9baf933dc ("ARM: dts: qcom: apq8064: Add hwmutex and SMEM nodes")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index ba99e794dcd2236f65f2f3d8c49213cfdaee5f6e..41f8dcde20819b3134c38dcb3e45b9e5cc24920f 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -213,12 +213,6 @@ sleep_clk: sleep_clk {
 		};
 	};
 
-	sfpb_mutex: hwmutex {
-		compatible = "qcom,sfpb-mutex";
-		syscon = <&sfpb_wrapper_mutex 0x604 0x4>;
-		#hwlock-cells = <1>;
-	};
-
 	smem {
 		compatible = "qcom,smem";
 		memory-region = <&smem_region>;
@@ -305,9 +299,10 @@ tlmm_pinmux: pinctrl@800000 {
 			pinctrl-0 = <&ps_hold_default_state>;
 		};
 
-		sfpb_wrapper_mutex: syscon@1200000 {
-			compatible = "syscon";
-			reg = <0x01200000 0x8000>;
+		sfpb_mutex: hwmutex@1200600 {
+			compatible = "qcom,sfpb-mutex";
+			reg = <0x01200600 0x100>;
+			#hwlock-cells = <1>;
 		};
 
 		intc: interrupt-controller@2000000 {

-- 
2.39.5

