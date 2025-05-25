Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E0B1F873B
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 15:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748188478; cv=none; b=K4bNVOo3PuPkP995A5JVk1PWm4z3BG5kGDez1jfUmvOxYGSZHgseDPMDPA64qyBr6UlBlbjNEpfI5BKIoXJE54AQBozztTSvIQTYH23wtLEOMAQfEKzb5DNm+FE5qlW/tjSo4MsiK1nGPmJ31Dki7KlL3UVDWEZr8mKFhrsgrSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748188478; c=relaxed/simple;
	bh=vFhnjD2nLS307yoil/r7Jh1TA07/zWqWOId060i2bRk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cwsfcgXGs2cRhNvvTVdX/9zRiv5ZeOSsyUrTbSLAfb644RAnFd0V9gWiaevclLEBTxltwm+PEZjuZ0qnHHSL3i4RZpmtJQjZZOfl44FrUpipuQoXLs6lXi3x/RGNItWEcgRS0uO8ZhjG4tghdKAZE3mtaTzy5z1WnuN/ZVx6F3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DpgBdGzQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DpgBdGzQ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54PFkmql018934
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 15:54:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kZRaOFKYI5X
	beuENmaqYAXNNwOs5mPBPXmtK+BKVveg=; b=DpgBdGzQ198JNVekENRtXBJaZ7F
	NJGISJ4CF0qDabHkKUFjrErxuxCKTRHVeSEfIqVmWRZbr7f26o13hw095CnBSfQG
	SE7O+8ipC4MzvjVTwFlIg0XdiyTVHMKRXPEwPoWmtptW9DQyBFW2j1pLndPPTRus
	fR1Vggj6xfFYqxtFPh4NCiguq5nSjSHCRhhHNg4EZtlFRtlQEf7O1f1LnRMpqD/t
	bJJgnXKG7Qf+E5+A4ajIXWaroTfbrRte/rkGXm3hyyEgh5E2Qet2jOVJQqTemoVK
	zZnos+hoBWlh453DSjWYMOeP+xX8X7lpEUYUfWqzsyhC+qLqKwaMK+lXDIw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u79p23eg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 15:54:36 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-742c5f7a70bso2267821b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 08:54:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748188475; x=1748793275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kZRaOFKYI5XbeuENmaqYAXNNwOs5mPBPXmtK+BKVveg=;
        b=qBqIIRI5hLqOt/2MbJ9i0mG45fM1XAViwM0tu6J5Yiv7SY1OJcYkWPQog0fNt8r4OL
         5T9Ay3NM3Dqi2U5vRB9X6GCJE0YcZuVCfXC5Y5CQigh7jovl2Bgu6hyKsRQuU89vi6Zb
         85GkDFbCryo8BpnU93FS156woFLbwctZbKRlqzJDMd3jXH1cqDIUr6Qd19q6NzpBzFoz
         ycnHWTmUnKg1+++uy/FCnqvEv5goige1qz8MJqjjB7CB8Q2qXWqgKtlOn+4ojgPEmxi5
         F5jsFfNNdqj5NQRubbuKI/JssS9t0XsKxdLmYY4lItnC5qBt3V1aHDzJN5C5Qn8mt4ZF
         8vNg==
X-Forwarded-Encrypted: i=1; AJvYcCXnH/Cbzo95B/SgMq43Rypg6ayySdedy9CVp7kUfnoWqI23ITY7se1+h5LsjUAR8bmSxG7YuldThsT1qvo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoX/2AYsYbFVpLpmVxlGSJdBdStfVG+A9zfA+ueBkAjbpf/hbr
	/Nn/ZDzMiIN7McKfehuXiCbzTASWbdRreh8NGeU5u777y/KkzlvODTsWJiNQzUUlvOjTnKHupOx
	WfojZy0sRcq4SlbAebwQ4pIyLIIVEAvVvhvMoGIwAmJRewHAKtA2quYYhpS38Gm4UOHk=
X-Gm-Gg: ASbGncsQ8K/N0fUVr7+3o++H8cwj1TFlgLj65SuQSXrV4QzzwQ5O8IqHmdeejmIOWAh
	chRMbP98sgokBIPcse+U+tVakv7Ly0IpgAPmTJp3V0L52rT8zgc70IEY9/gtuJbE66PfWEZPmD8
	FVC/y42225LwirRGqoGIadobPs87RJuE0rtq+VY0mWDQYAlDCRRmw11UoZwpo5byriVrEPZWlAS
	g6WHVO4Aq7VOURO7x4dC4FEIigfumG+vp6K2B8DbaCRG/GBv0XRcBFxZy1ol1wcIS9e/hFpCIoW
	o31tl9Uthctyt0bRtYK++I8rxHucNS6F5xgXQLbMIAvBvdxb
X-Received: by 2002:a05:6a00:21c6:b0:736:5664:53f3 with SMTP id d2e1a72fcca58-745fe06456bmr8061817b3a.15.1748188475331;
        Sun, 25 May 2025 08:54:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoyuCdtKsWW8jpfX2jHhlwf4Me6hSuTKiLPTNv5/ihyhxbTf0Yjb3AKJtdjeZF2GWTqLtqyQ==
X-Received: by 2002:a05:6a00:21c6:b0:736:5664:53f3 with SMTP id d2e1a72fcca58-745fe06456bmr8061804b3a.15.1748188474910;
        Sun, 25 May 2025 08:54:34 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a96de11csm15634488b3a.31.2025.05.25.08.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 08:54:34 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_pkumpatl@quicinc.com,
        kernel@oss.qualcomm.com
Subject: [PATCH v1 1/2] arm64: dts: qcom: sa8775p: Add gpr node
Date: Sun, 25 May 2025 21:23:55 +0530
Message-Id: <20250525155356.2081362-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250525155356.2081362-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250525155356.2081362-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 3OdmBe3_TjvK9uLk5_F_OxHODTuoMAjV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI1MDE0NyBTYWx0ZWRfXyolgkuU41qiF
 5dbxMPgDz1Y+FUlOX05Xsp8a5KuUlpRRvBAnpq55Omcw4mtxRE8SeIeY4NNUDloFbK/6HF24Ezl
 YjThyUD2jDK8SmjMCrKndLugdCqo4qb87biBFr3hAYaWiS826jCML5MJ68AzSrZWuvha5+8F0JM
 yr+0Nr98uLP5GhSr7Pf4P7ky9Zek2xtG5iSaKIOmVB9CY1BpVQ3nHNZTfXxOHJBlOxCAeu4QNWl
 Zl3TQiEsnffiZzk64tB87IpQzXxQPe87kownj1suFJXxGv1tHAQPtT9e1zw2+vHvdsEHeYTX+b8
 r10zAC57zW7VQ0fEuNAlT+xlXxHJ7J4ZAQydetySMzI344vjw6FK0oIK2JbJBDdH6vICWWzNns2
 6KLnjpexnTg+0RAhr1WkT6DAwphNbfEqUO3ev1lDhHHAiGTFZHeX+hBCXtylQW4dqNRX/agC
X-Authority-Analysis: v=2.4 cv=HNnDFptv c=1 sm=1 tr=0 ts=68333d3c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=UhVUwdw8r1UmGneQsTgA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 3OdmBe3_TjvK9uLk5_F_OxHODTuoMAjV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-25_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505250147

Add GPR(Generic Pack router) node along with
APM(Audio Process Manager) and PRM(Proxy resource
Manager) audio services.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 40 +++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 45f536633f64..187a59e29f59 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -13,6 +13,7 @@
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/interconnect/qcom,sa8775p-rpmh.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
+#include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
@@ -6109,6 +6110,45 @@ compute-cb@5 {
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

