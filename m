Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53051BD9DD
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 01:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744248852; cv=none; b=Khn+aOiIGi22VqmUtwaLV1+CryHsYvaqvovcdVRM2xmsJenKbx2GPUhqdZrl1jKjzMq8DEQcRNEI7VmtsrDPc4tDdow1S8zPjG0mxvGxG6o1Lk12kf2Ou3Is3d+ZFdviHB5nBCXnq6sn19i6yDWbMDTTQGcMs0qKrBRLXWjyLE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744248852; c=relaxed/simple;
	bh=+EADU4VGExLgeSXK4lwo+fjfE4pV2JIAzUIFT8TnNTw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PT8iDJQiVhf/22L5/kOiYbxYZCUb+OVpOyV/799hlUhHcHunh0fONVHNd5dGpxyIiUbhyJRDA4AxwY8+Y2Nt6Bnky0MKsUk70Lcao3Sd+KAVFKHjc+BLRx+EX3iEePcvG8CR/A6rfrO0e+YFEoCICkOFxvCVAJzH+baGgyyhp/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=paeU4x0r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="paeU4x0r"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539HDG1g010444
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 01:34:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Y+3FfrSNBC0
	rnW/pbZ1shOcvb9E0aupV7QcxaMUAHKc=; b=paeU4x0rLxrFhPoGJrczRk4OJ2y
	Pkw0tFRnIMmEg5h/98A/+VlOhzFrX52SRBH18x5nchp3RFQ2B6ceiKBxxrkBq3bv
	mBNbC/10Fbx6Y57QLE6fggGW7O3fEZVrunIUVkCI8+H/VIOTaKGrRv0Eq5W8JVqt
	ifqzInGkFFmSsVlArb3+7HNHrH7NlDrN4EzoquEdTTSonuwXqeARbbP7+yC6kQKW
	zuk6e/EsrtRLEx1Kf1ZnntZAF54mag1bU0er2pGZXcXPHDqiWWVlM5AXkinFuts0
	hvRMU8amlUKkS/qs/G6ZByeg5ax9+DBHa21vRRCLcnU02boa0P7HvJtWOOQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twftn2e7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 01:34:10 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-af972dd0cd6so197935a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 18:34:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744248849; x=1744853649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y+3FfrSNBC0rnW/pbZ1shOcvb9E0aupV7QcxaMUAHKc=;
        b=kzM53HjYMWVOtfe6olP8P4Zf1wcKl0YS2bzmTaeE5v4EzvTFMaxtWXgeZBjAT3T7X6
         2Tox9JfXQZ6RoXnQj+4kqimSO8SYtqTh+FZ7uuSl1DzxKdZr1O/f54BRKDJGBpayo5sh
         NfRQTsS9zuPei82jj0ixFJNMuYgsM4QfJReO5pFOjIsYnAsDg7yfi8vSg+iFZfKyMuGG
         DQic2HBJaZFVnef2bR8YqlilLEFsZ4mrlRurdMEgV6McAliW+mMah+CjBLHfi4QMx8KU
         q/T5z8pxU2Y19hGanFF4HJlRQDOPypHPK3VSs0Y0po/0naSJj7mtFV+xwMI5iJNFpvR5
         VqXg==
X-Forwarded-Encrypted: i=1; AJvYcCUPH9BF3N7yaqT3vQFJVyp+J21/TnP53yDWq8sXdDxb7Z8kA2/6DkVTsMApCJ2x+qMIK+/IPCKxp5QTuSw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3Kb+gxSOevOAXsgE09OVGNr38lW/ObXEqJh2D5gx14p5VAe8e
	xgnagaSEa+iagFtnUsYqcGWzqK/5871rgR+WPuKH+KPkx4LlyMdVLRfYGkhaddtLQLaxft33NDV
	n3uzPu0tBHVS/r/2PgpBUQJaktAOcA1KlOWevtTSZkNM3ZDZNttk25OGizdk8QTc=
X-Gm-Gg: ASbGncsQ0qxPE+Ri9sAm6+CqrpiUSqjVw2MinTLI7ieWWxycBn2SH+vhf5v3fjutlI9
	QEUl4YIhpDSpTTuR7QVjfM1EB1ommgZoAq0GLyObQvijka+2CaC9WtVuHs3fDbbtvBbc8SwUD+K
	gu8oMDs9GRY8XyIEA7kOO58yRhLcz5zOGfMPN0gw/m6UJoO5RXX2FG4cILmQa+2JqkwjqYYvFR+
	Cq/TdX7MMoeN9KozuYJD4mxamQvxCZg9TYBg5yOYG7HueW+oY5jIiXzI1g3Ub21j91ISyqLS+mx
	FA9O6dBF4ezW6khLKbL7mvkU57EDt+ruaeB2Xv8W5T3IAxIDVJkRNvDbwQq1V1dbbCzShEM=
X-Received: by 2002:a17:90b:270b:b0:2ee:d7d3:3019 with SMTP id 98e67ed59e1d1-307e5972f0fmr1174659a91.12.1744248849120;
        Wed, 09 Apr 2025 18:34:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7MCKoesf/io0c1ClAVPtM1es5MKBzBPeISdJZK2T+emvkEbwBgOvPufDeyPNVn4pVjc0MKg==
X-Received: by 2002:a17:90b:270b:b0:2ee:d7d3:3019 with SMTP id 98e67ed59e1d1-307e5972f0fmr1174618a91.12.1744248848735;
        Wed, 09 Apr 2025 18:34:08 -0700 (PDT)
Received: from jiegan-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccb596sm18801815ad.220.2025.04.09.18.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 18:34:08 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v2 5/5] arm64: dts: qcom: sa8775p: Add interrupts to CTCU device
Date: Thu, 10 Apr 2025 09:33:30 +0800
Message-Id: <20250410013330.3609482-6-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250410013330.3609482-1-jie.gan@oss.qualcomm.com>
References: <20250410013330.3609482-1-jie.gan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=B5+50PtM c=1 sm=1 tr=0 ts=67f72012 cx=c_pps a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=wB5yJZRArZ6K3lEFQq8A:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: z5yOKdrbsFRVuLL8S-S-JRheOJ7hWmTz
X-Proofpoint-ORIG-GUID: z5yOKdrbsFRVuLL8S-S-JRheOJ7hWmTz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=754
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100010

Add interrupts to enable byte-cntr function for TMC ETR devices.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index a904960359d7..b091e941aa21 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -2427,6 +2427,11 @@ ctcu@4001000 {
 			clocks = <&aoss_qmp>;
 			clock-names = "apb";
 
+			interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "etr0",
+					  "etr1";
+
 			in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
-- 
2.34.1

