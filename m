Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25401F3BB5
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 07:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750057472; cv=none; b=Ts2CYPzU/qRuuL1JUsWc9FYBfvjFvdJIXOQMENhxl2EonosFJQKMze1HwXftHDO06rbaEpE6xVyhDQ2vnzVRdVbafmz+At6T8lK2BNwFSDSv05vprlKnHRjwr+YDoaYN4XaxIBavreJNsTNAWnFd2jsdo0/bhvO4dTVONBEX6t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750057472; c=relaxed/simple;
	bh=ZOHcPPpzGdQk38BOw07YMrFF1gqKRMRweuVFt0is6wU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FOfxcd1VSOQ8PuS6nW4hi4JONNvaDi4dCzoIv69m2BvGRNkDnXdKSiH229WpUg9zXIVmAUgSRAQcpF+kyE2KTcnzJbuULpE2AXMufDdSW8KNumQaUemZmzgx+FSBemj26RSuk5Fn7FC9lFPI6qtaawTjvm2VcsAdLcUqpXQn47g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dRERF8be; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dRERF8be"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55FMeIWS013410
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 07:04:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fw+aggTOrJ5
	+RA9xTss/gBLVYENBQWUKwq4P64eQhiA=; b=dRERF8bemiA/1JgCtH+ZiA/wW79
	E/AG1zEeS6yg5Q79TYXZ10SHciZCEHGFuJc5THXCTtaNlBz0+TZ3K2s3hEnsQ+e0
	0Rn3klNw7Nt8AOzRybm1x7LLm1GUUWzUZp3pm3t4H8VPoMEhVYloy5rdN2WNi70J
	jns24+AQTHF+frdUZSLa2cqm/GQbkNU17FitEhd/6rotD5zK8AMhGugFnkm5mwye
	K9PLSo4TxMSHYNi5g+i8nVWppbD+irSKo36qKLGjlNTawo11qg60sCn3aoGwY3cw
	Pd8BFNvmUn8MEBZsc5DhZKNVoGWEJ2PYDIz5rEmwDASUfSq2F0H4Wn7fTOg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4792c9uc6t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 07:04:28 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-31366819969so3596183a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 00:04:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750057468; x=1750662268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fw+aggTOrJ5+RA9xTss/gBLVYENBQWUKwq4P64eQhiA=;
        b=ItXxZ+of7nL/vh1PRqYiq62iwVSfiSnxriIuN6N8PHrdg4z6k8WgQzctlrZ36HogY+
         Cyv88nu6Oi2hYjxQ/JC4tyvN7LoE3GINxtTQnvkLSsMyfp05R9BXfgcHejRetRycOEoc
         E+sptfN0ZC/Ls0+kF9HWSD1ADvGEID1JEHkdaWKM+CgcmX2dtws3sRfRdmJ4Js7NnJL2
         J0A8Qtyh/3pNv5jU5RrVemOjz9VYCoff5a10A78c1N8K0QHu64lfhYTxzuB0W5fg+3jB
         5W62UYIc2lxjuL7JFysHvtuqH2XLYnzJQNwxLPICPrF4CHC2dOowYI5UwSNHu8MrAnx3
         Dx8g==
X-Forwarded-Encrypted: i=1; AJvYcCUr5byMwdQ1oNsUoRR/oqiBd/zW4op8dVLYSD00pbo7NUKqLuuGyImxg3rjpwVoYLcWsZj0CUwWM9sAAio=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHEUGjmKfwkiN+9bzXa2ERZpEswTZTIInFipEhB4zldkqCZ4lT
	c5dCm6dPW4PT3GI0I7vjQpJTLzT0Gc+QFrEVmGiGkSWNhoPsjXvKYn/nuxlrqUMPmi7uSaj+6iM
	VkMQL6OQRFLhOE9q6P6FXC9/JzW0fcoV1SWeCtrx+CCGr1QFvkl7mi01sJ3VHo6nWdtMHZzvUs5
	8=
X-Gm-Gg: ASbGnctvvzUrJxCbQysqnvwNzlzUZh3ajHdZHn2hdFJejxM1DUeQfDBaoOFGSwMEdkW
	z07v8xwfbwVfCEv403H+lBW+Z/h0MLzQmZU/UvWKqYfT9A1T2nzR9MdNttHisPHk7hLMxgERWrQ
	R3r5DraN7gYwaPHo+kzXHeTdMUkvJV4umcv4wSdJvZawl4BragSQGR82sL8CjgnEnYoZWvEuhJ3
	D//ugvfaU5zg6LAOvyJVfwM2sYZ7cEC0lnHnshzrUQZcoM9/niDrZwSgLiAeN2yCuI1X6g5DDVg
	y7fE8tt/M3e4tNi+F2sVs8jlc6RkAkSpMcHyrRuXkBW9+4zZHwYYrF7rZxI=
X-Received: by 2002:a17:903:1246:b0:235:dd54:bce1 with SMTP id d9443c01a7336-2366afe7d67mr124587305ad.15.1750057467882;
        Mon, 16 Jun 2025 00:04:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEREkHMHAsNS40cb688dZG2Myg4m+4JQIZzJuIqapIgsh/RzDVfI7d5uem+4qxgPSxV2cxdsw==
X-Received: by 2002:a17:903:1246:b0:235:dd54:bce1 with SMTP id d9443c01a7336-2366afe7d67mr124586935ad.15.1750057467493;
        Mon, 16 Jun 2025 00:04:27 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d8a19e3sm54435825ad.82.2025.06.16.00.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 00:04:27 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_pkumpatl@quicinc.com,
        kernel@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 1/2] arm64: dts: qcom: sa8775p: Add gpr node
Date: Mon, 16 Jun 2025 12:34:04 +0530
Message-Id: <20250616070405.4113564-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250616070405.4113564-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250616070405.4113564-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -qkGeOn_elcggYIsCOrsrve5rj8pzFmr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA0NSBTYWx0ZWRfX+Qc5IEyVjmNN
 V393wt9wT8AxDNwGBavKg3iyWQ7lV5fd/Hnw5Uq3hCa6JOs0N4exHO5KsMk0968UHR82ksKnDxE
 ukZVTr75ANqermwh/iIOmndceNK3b4Ak7qaHta+W9wruIEVENv7dbeY6DlYVr8oL8sfoT/sgmyx
 BJe8S2JoO0wQ4mz+OFRM2nxcNYf1ho81l0gyG8lw1Ic3L1gciKpKnoJheTB92kBVhLj0EiorTb7
 mOVVsizUcrW7ONwwYJFm6JsOhlnKKZaudP82c57EgrxJO8tQ25Hex6Y+IemQMqCD274+rRdAYtG
 1R92UuSGTAy93nSZYlH+E1kgkMc0bR/F90o7qTkofuNVk24N01oiokXZbAZv0XPZ3wq1zghiviI
 Ws9DJ3UlzAwmAeYqLhhfA0CwShRr+jI7ZVkySJ8zu6GO+6qRbinf9xtHQFVWAdQRVg+pDyde
X-Proofpoint-ORIG-GUID: -qkGeOn_elcggYIsCOrsrve5rj8pzFmr
X-Authority-Analysis: v=2.4 cv=etffzppX c=1 sm=1 tr=0 ts=684fc1fc cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=UhVUwdw8r1UmGneQsTgA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_03,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160045

Add GPR(Generic Pack router) node along with
APM(Audio Process Manager) and PRM(Proxy resource
Manager) audio services.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 40 +++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index acc7b735be35..07ca6dd4f759 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -14,6 +14,7 @@
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/interconnect/qcom,sa8775p-rpmh.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
+#include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
@@ -6284,6 +6285,45 @@ compute-cb@5 {
 						dma-coherent;
 					};
 				};
+
+				gpr {
+					compatible = "qcom,gpr";
+					qcom,glink-channels = "adsp_apps";
+					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
+					qcom,intents = <512 20>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					q6apm: service@1 {
+						compatible = "qcom,q6apm";
+						reg = <GPR_APM_MODULE_IID>;
+						#sound-dai-cells = <0>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6apmdai: dais {
+							compatible = "qcom,q6apm-dais";
+							iommus = <&apps_smmu 0x3001 0x0>;
+						};
+
+						q6apmbedai: bedais {
+							compatible = "qcom,q6apm-lpass-dais";
+							#sound-dai-cells = <1>;
+						};
+					};
+
+					q6prm: service@2 {
+						compatible = "qcom,q6prm";
+						reg = <GPR_PRM_MODULE_IID>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6prmcc: clock-controller {
+							compatible = "qcom,q6prm-lpass-clocks";
+							#clock-cells = <2>;
+						};
+					};
+				};
 			};
 		};
 	};
-- 
2.34.1

