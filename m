Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088CA292B2E
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 09:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750151245; cv=none; b=ZzS+hbWYuc9LMWDG9u5AfxR6N0849RtJ2B3+DNiSR5nPQIXR52oTGCXWnvHDyx8v7snirSJulJ521HvQ0O8LicMI11QmFQD03URkkDgjljR/IXO9wpF7nL4ZvLxeRLbvoE6O/6ziBFiEJSaxXNCcupTm3ENU0W2Jb7CAz3gWnQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750151245; c=relaxed/simple;
	bh=HpCmu2Xxf2CKasxkFlZBU3mNBTm4LYqEUU50Qj7bYcU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ri7yvvAhl9zjeArTNljPzV0flh4127NawVqnG793Ws62PBy5DtiOU4izm+ASf+yU7DDg/qLDkkXxmpK7hYUU59FfYiJ44HidROnlX5B4gdnjTEh346RV/vMlRtkQRqfikfsqUZ1fkjjzMd8kMjheU7aJwYPdtTnPDRKrstSOuf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ePN/lwWM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ePN/lwWM"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H75AuK030943
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 09:07:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=v8VxgZncMLU
	vweLJo/cjubLjIJAD9fPEBEdpFY84mSg=; b=ePN/lwWM+0vp1Sjida6wPoRuxmP
	HlfzCkLq4oNI37xybN080wnV5zG9jmOtYKyeKkjw8xMvPOpmx+NZP6EY11BaaU4y
	MZyuuxHxsxlMWfyPPUKWiCUHep8MwhUtp72hGESkT/9b/RKh6AsUjM7sADh9tvnM
	fi6TOceDMlFr49iwCyZv4qmJ3nq8/ZX2V7zrX9K1s+DJh2cIgQuuZFLthquJsyIS
	9SfC6BtBjPvI+sTayGmIwBUKqItza0P3X/VmQrMKs61EmibszUG+VhV/x3OMGCvf
	ZYsybNqPTLAkErosO3qsVsLDdLKw+cM6w4WYsqwChK9/bfIYlJ/MGh7Dq5Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791crqj0y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 09:07:23 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2358de17665so46330985ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 02:07:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750151242; x=1750756042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v8VxgZncMLUvweLJo/cjubLjIJAD9fPEBEdpFY84mSg=;
        b=AXMBroln1fAwTzFZErPDqhAZo4Qv+BofHGu2n2vxsI8GZ6halL0FO2A5pjlhNEm+xf
         +XMnhjdpCFld39hF5hI8gtTGPCAHtlao53ulXhf9qjHFfkAQFqSayrM3OHcXcNTpRWT0
         zI9B9uGeqTgTBTWJ4M+8IqQeVUuCxP0OwQFDv7ik5Q+82J1ayLUD89tsw4yOIL67Xziy
         ozETj3VsdGj4qfGGI9dsc37MR+onvbintExitG/2wxikZF+Y6fwKwvbL1AJD+JIFCyAP
         FuP/OxL8fOz4nO4EXRaTORa+qWaVgFJK0hq/wXxJDdrxQ1B9fDiQ2pDK54spI4up3aYy
         0+nw==
X-Forwarded-Encrypted: i=1; AJvYcCXhyROWUsHM1vsuBkoX76Y3pZgWkZxBgjkPICso6YiREPDmO/Vhe8d0n8b3vJpkJpI2Lm49zrGdoJucZRc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwW+3Ksk3ipT4QlVtR477EU4ICMq4eMiY6UxXqb1DMa69xD/4Uq
	EwQ0sxrf/ppEOg0tGOiFLw1Uzb2YiGOCyCqPXl9zmg0JqT8jlMyjIN6Sl5kQ1yn/cBQBznFl2ma
	64KTwZ+d/2adFpnrOrprwMSWGemrvo6dyuSg2i/VaQ2kCa/babJixRP4pVxERsHG++c4=
X-Gm-Gg: ASbGncsg/hpfA6a7wwcMplJzK5xHeU5oRK5AvpKIPM9UxsQpzWxpylfdCLq92lH4Zz7
	jJ6rD1ZW0mFDmVr1CyvAFTq0CQHsVC9eQxhw6shdgKInLQ3lZtbA0ux9Ahaa2XqW/dEUKv3xDQq
	zfGuWRMvUl8PSTvcNuvXwWQUMllPXc5Bt0x7HjjIUXyaALkjxl6qfm0gWxxmijaMpMnHIwYXd7j
	LuJJ7dDiR7pAqr/dAk3FZfc89zyKvSPzqrot7cz7F9v5Q6FTstBdz/kH/mP0WPeX0joSIWopVAs
	AEU0Eb21SIFxMaQdYpMG6xRzSVLMG5OmzNtXCFvXJPcUU7UE0T16VmKAyNKtAQ==
X-Received: by 2002:a17:903:19cf:b0:234:d7b2:2ac4 with SMTP id d9443c01a7336-2366b00629cmr200740465ad.17.1750151241746;
        Tue, 17 Jun 2025 02:07:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQFcFoHfGO2OG62bjBmAIXOgg3ajRa+GMsZLmM5oo1I6OCeOlHJ67+7+KcYPcabd8OdkgVsg==
X-Received: by 2002:a17:903:19cf:b0:234:d7b2:2ac4 with SMTP id d9443c01a7336-2366b00629cmr200739995ad.17.1750151241328;
        Tue, 17 Jun 2025 02:07:21 -0700 (PDT)
Received: from cb9a88ed5d41.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1bdb39bsm10017370a91.20.2025.06.17.02.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 02:07:21 -0700 (PDT)
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
Subject: [PATCH 3/3] arm64: dts: qcom: qcs8300: Add EPSS l3 interconnect provider node
Date: Tue, 17 Jun 2025 09:06:51 +0000
Message-ID: <20250617090651.55-4-raviteja.laggyshetty@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: YcI-Sc4fAfLCd0gvXNoKGmjUduNEcUOS
X-Authority-Analysis: v=2.4 cv=BoedwZX5 c=1 sm=1 tr=0 ts=6851304b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=pcgX-mRZKd7nGorDqcQA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: YcI-Sc4fAfLCd0gvXNoKGmjUduNEcUOS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA3MyBTYWx0ZWRfXwFil4I/HmZPt
 ShAK7C64QSAo60nwWElupM0V/JdEiLVRW9pbojw+OtsgJ7/RV3+NwAOZXVF83Na7v4IknrN5FIr
 42e5SppiTQL2QSvpdaHfCOpGtMmKyH7+QZo7Z0p9UY0FO2dq51BjP0Eu8d0Z0/FLu7uV2LjC8J8
 3uO9tMXXgx/aifea1xBuKRDadJmE4FDFK06qmewFszNwTp6yvIUROqs0qtMlE0g2trSHK9jxRpw
 m2s5s24LaGjRpnqBmfuxPobjlGU/qKhRIbjDvXqM9JukvepZ7upy2EttT83Ny/KBFcbKXGKKu3g
 GvE3+zjO352MMgPzPi/9XKRHpLJHp4xMfTLmoPLkTePOBd58u8uwqK94JO8HZEfkj3BEWblig2+
 gjB127a2XBZFDGOTzehnOIMjlpOcqMt0arLJzHKieyzuL/jnLzXEdEyp2yzOkjFi9N9AaG1u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_03,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1011
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506170073

Add Epoch Subsystem (EPSS) L3 interconnect provider node for QCS8300 SoC.

Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index 7ada029c32c1..e056b3af21d5 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
+#include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interconnect/qcom,qcs8300-rpmh.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
@@ -5433,6 +5434,14 @@ rpmhpd_opp_turbo_l1: opp-9 {
 			};
 		};
 
+		epss_l3_cl0: interconnect@18590000 {
+			compatible = "qcom,qcs8300-epss-l3", "qcom,epss-l3";
+				reg = <0x0 0x18590000 0x0 0x1000>;
+				clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GCC_GPLL0>;
+				clock-names = "xo", "alternate";
+				#interconnect-cells = <1>;
+		};
+
 		cpufreq_hw: cpufreq@18591000 {
 			compatible = "qcom,qcs8300-cpufreq-epss", "qcom,cpufreq-epss";
 			reg = <0x0 0x18591000 0x0 0x1000>,
@@ -5455,6 +5464,14 @@ cpufreq_hw: cpufreq@18591000 {
 			#freq-domain-cells = <1>;
 		};
 
+		epss_l3_cl1: interconnect@18592000 {
+			compatible = "qcom,qcs8300-epss-l3", "qcom,epss-l3";
+				reg = <0x0 0x18592000 0x0 0x1000>;
+				clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GCC_GPLL0>;
+				clock-names = "xo", "alternate";
+				#interconnect-cells = <1>;
+		};
+
 		remoteproc_gpdsp: remoteproc@20c00000 {
 			compatible = "qcom,qcs8300-gpdsp-pas", "qcom,sa8775p-gpdsp0-pas";
 			reg = <0x0 0x20c00000 0x0 0x10000>;
-- 
2.43.0

