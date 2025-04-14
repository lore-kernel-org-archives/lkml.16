Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8AD4202C34
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 23:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744672942; cv=none; b=gp6PRUMbLL/+3NloaUBdWhmKuyVK5XKzCcNqYER95sbQqlEzFhdnJ2ICyTaeP8bSVGcxr8s/hq2oIa02Zk2eo1A4cr42VCLD91x1yUQNbItBNVmnKFB3vmL/9bnpyN9rJOuddZ8RHD4QCKosPQ8ZZa57ePXnAQ42/8LA4B/Fc7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744672942; c=relaxed/simple;
	bh=2/EMhU+NqxnUmU9I5ZqfEP5bIJvKe/ALVnWTmcXBqHI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CvKKvEPgePKhd+hkeLRzMQA0vERNEpDx28pqeiySsuYDrbKakmQr7ayTHOsjENoSUErr/tc94JFBlz5VV85sCGNTdc2h4Tu3r7zvHaGQhn7p4+A/jMUt2x9rWtUZW9h7Ux70aWVWK6WiB8l+QKd0Hw/7Dh3o6s5vPuxM3duw/zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BV5OHA+N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BV5OHA+N"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53EKeqrE009625
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 23:22:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3r+u6vzzB030wMaT0KPS+9594z+nQC40xkulQ9mf3qw=; b=BV5OHA+NgkT5xwQC
	N2kTxzsY5pH8y0HDNhM2+snvUXwJX0cLmEbScteuci+k6683Bw3+Er33rj95vv8h
	F/CEmT9AI1GW7hkGxXKDdYUtaYcZ2aXlgKDC8VE07cctPx4p7lhGYLJbRcsZPUUP
	v/B5SDFrjKOhLt+noLFFgQ62bFimhSqlhIxRhN1T5G8hgDc3yoCRuC9m/C803n2G
	WHdIgHH5rvHXJxgvrQBDG1nB5m3bX9omvxxqbn7N5nWQYYGtbfGXtbUPVH8tMmoy
	s5T8S46C5WAPgw1YQCEoTYK+5INUDO8UhTZPOVZWgGgfCJ8U8dLvhYVKH8Is/u5e
	2sP77Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd6e23u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 23:22:19 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7370e73f690so5385642b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 16:22:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744672939; x=1745277739;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3r+u6vzzB030wMaT0KPS+9594z+nQC40xkulQ9mf3qw=;
        b=l7X1Xpy+QtlFaKpaz8fT4/UlzrJXYW7yTbkKAWPgcdXyoBpwpP8JVA7dIl6y7OwHts
         W6+Vu8QRcXHiMlCAcl6uZuQsWNPSxGMLa76uIX1oTiFsIhO+JXthRAob0/m+1r3CPqNT
         nOGBP6DsT28FFsm/sRXLvSQQONcOuPld6F4HWb6luYIqjn4GSN9TB3EgjxxyWFzriPpj
         UhGCp5GZ3e+Z77Rs1C6VIT6UA9mU4sPMWkiRSdFGCC9NdXn1wqtN+NFAZYh9/8+kQGmI
         WmHnxR+2u4uwKGl7HLE4rshq9fvRhBku9Qr+8UPI1BT0rAowrI/jpp8KPWAK+tj/pUBO
         FyRA==
X-Forwarded-Encrypted: i=1; AJvYcCU1UhSmMtkkFd2gscnxZxXfMNaxEKkOFp3LXsDO1UvtQogIyyVNFC9SpqRUvm6gBBUeZtNKAhz8rQ5S2/4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPfnEkT5mbr3B12apaOW+/j3yRwu+TN5/Z4LqEen/VkTa7Ms2x
	MIGwyp4jceG8827sr/RH5H70jUtz4PATtHQtn5UTvIa72coub9Sa6bgC2lxt5naUa4I85PSfTUv
	aF4WX/TL/eHPp9b8pgV/bR8Wl4PRJAuqrlhXBDUJBNL0h/XKGyr9wEP/NSGVZ1Ls=
X-Gm-Gg: ASbGncuJujnn7NtuVsRfF3hfV0mInAe5xpqjY5rqwUy9UDefPnWBwxDYp6CbH++KPGG
	7PlrD+aQlmqsMUFY1BWufrDaQ+MRQCFjTwmcwSEPYcYA/Q/IyeS8FKDD0S/gZOb3rjXDGU9wroc
	icRxXBBFCKp319Qqc1zQ1TFmpASVvOsZBoTWkdrbsVR7dzDF7OuO8JRxePbbvNE7AWR05bw1VE6
	l9eZNqlChAbFtYm7HDhHGcomUjCiT8e+vZLKKW8o+OjOzmHTBCU04iwRS4CUmqVHA5pofSuLO9K
	PdH39QKdYmcIruYBNIg3jYD3J8PB2vqwpc/yf/oA38PC9Kb4lbCL2GPvSwTegOqsNII=
X-Received: by 2002:a05:6a20:7f8e:b0:1f5:8748:76b0 with SMTP id adf61e73a8af0-20179946424mr19756579637.29.1744672938850;
        Mon, 14 Apr 2025 16:22:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaqJlewWArOqT1w34ez2AJMypmsAuhKGyK4qZqwA+wiE6R4JLg0tM0YTnPyLM8MZygxa813Q==
X-Received: by 2002:a05:6a20:7f8e:b0:1f5:8748:76b0 with SMTP id adf61e73a8af0-20179946424mr19756555637.29.1744672938534;
        Mon, 14 Apr 2025 16:22:18 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a3221c7bsm9746298a12.71.2025.04.14.16.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 16:22:18 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 16:21:53 -0700
Subject: [PATCH v4 4/4] arm64: dts: qcom: sm8750: Add LLCC node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250414-sm8750_llcc_master-v4-4-e007f035380c@oss.qualcomm.com>
References: <20250414-sm8750_llcc_master-v4-0-e007f035380c@oss.qualcomm.com>
In-Reply-To: <20250414-sm8750_llcc_master-v4-0-e007f035380c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744672932; l=1338;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=2/EMhU+NqxnUmU9I5ZqfEP5bIJvKe/ALVnWTmcXBqHI=;
 b=WrCHrXytUYfg6wuQFRnksvJi9qMbAAOpEezYN6gaBkFoGLhRN0EyuB5g80zakzMaeXqtBBVPp
 hXGPY6YArK+Cv9kIH8hSzZ6mqu5f+LIfVvsmb7pv19L1PFywwezQMpZ
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Proofpoint-ORIG-GUID: 8hNLjDPvqbau_4-L8hMmxpUC1BAj0RjC
X-Proofpoint-GUID: 8hNLjDPvqbau_4-L8hMmxpUC1BAj0RjC
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=67fd98ab cx=c_pps a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=Gx2GX35Bv4c8b2S2wRcA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_08,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=694 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140168

Add LLCC node for SM8750 SoC.

Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 612b99dc3c55495d06b3577531ec6996554bbbb6..5d3a96c6412095fd89ab1fd9a586fe9ad4dd7ee9 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3310,6 +3310,24 @@ gem_noc: interconnect@24100000 {
 			#interconnect-cells = <2>;
 		};
 
+		system-cache-controller@24800000 {
+			compatible = "qcom,sm8750-llcc";
+			reg = <0x0 0x24800000 0x0 0x200000>,
+			      <0x0 0x25800000 0x0 0x200000>,
+			      <0x0 0x24c00000 0x0 0x200000>,
+			      <0x0 0x25c00000 0x0 0x200000>,
+			      <0x0 0x26800000 0x0 0x200000>,
+			      <0x0 0x26c00000 0x0 0x200000>;
+			reg-names = "llcc0_base",
+				    "llcc1_base",
+				    "llcc2_base",
+				    "llcc3_base",
+				    "llcc_broadcast_base",
+				    "llcc_broadcast_and_base";
+
+			interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		nsp_noc: interconnect@320c0000 {
 			compatible = "qcom,sm8750-nsp-noc";
 			reg = <0x0 0x320c0000 0x0 0x13080>;

-- 
2.48.1

