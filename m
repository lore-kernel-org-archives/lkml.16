Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC19726FDB7
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 17:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744220911; cv=none; b=OBCyisfDk4+OHX9NHcVYmufOx4ZPg+P6BZcWpzWNLjmwXWUcPSy+E25M4gDvtjzGcw3W40TYiokXP1xZ8Q1VXGJAjGWCfAH50s7jRW1D7JEmgi0zdo8Eq6jFsSJ3VDeVcibyZGoRG1mUnhYMWY/uUczKmSYufLi//wmx0kSMqLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744220911; c=relaxed/simple;
	bh=5FExpQUZ/FHZEchRY6UIA2qfjFJXzxNKpcsVYOWNwso=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rWqgUSUoE4Mva18zSDw/7SFInkcMc1/4iuctou+BqjOuGUDhtMBQ+NHacFOTt1cblCCjjGxwq/zTSJ/llqri5regs4DL0tJnlMvMyop98qpbuvOcJH9SF/iEDrQN7j/MzofYfrgsink/GhM3/N5Oqhf+Gm1TO0ESuM/MWBI9T+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NHnxggZ3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NHnxggZ3"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539Giphg028177
	for <linux-kernel@vger.kernel.org>; Wed, 9 Apr 2025 17:48:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	63TelnMaZLywwjt0ZE9rQRxentiOmbDDz3cY3YJGWYQ=; b=NHnxggZ3HAyg23tX
	XexEu/d4b4xHNZpkZ+FJyFtExBOWgu662MfBiO8ZQunB+D3A6X0K9s3HAcUgCNJG
	Ug402U/C5zkYbyCqagEaz2pRlOSJnLbs0OJbtBaCHBUjUyftvpI2R8ntLowUEhM2
	slRDlDiuZiKQSQTbze8L8btwepDLMtOY/0Ce45s9E3SpoKO6MHznm/HHMYmi7iLy
	Win3sHeaCLquKFIUPb8nvsOxBYTBw40gMDA+n9yDONuw7GyAkBFl6nxB7prMHLa1
	NaIG883o+xMztiAmvSqleD3xB96wSTQFLybNNBwQuS6J3xcC1wW+5EdxbLYYUte4
	y85X8Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcrmcyv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 17:48:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-22410b910b0so52949355ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 10:48:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744220907; x=1744825707;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=63TelnMaZLywwjt0ZE9rQRxentiOmbDDz3cY3YJGWYQ=;
        b=Pukez0sOqLTGCWza4MQeQ+3akAtvWbmqrJlmewiUCnZ0OODKKYfjuROiCbHQgEE8oG
         lOlX2QjpIOktsudWDBTD2mIEZAgYDmtTuC6AFvwfGxWVso4PRwv3oT+vQtTQP4If7Nfr
         2ve3qiT1Z5Rd+ziRyUId2tuuFEr5zrF+vWmYyX9DyTVQh6qsBn87KuTf4apvut6EQQPn
         w9IUOoVQ674/EkQfAGPjvzm53GtcvOvigFu/O/qaO25EqaMuV4AofIEsLVov4oJLZASt
         akA+2aXRZZx5rmaEjOFkCVoq7+kfFrwO5oE6KkW0GJCZWJ/omaNFqzFmfH4j0L9orx2H
         un1g==
X-Forwarded-Encrypted: i=1; AJvYcCXqrUoIRrK3Dm1m95sy1yL1LpC+k8hbZEOmR547BNt1hTEFeQfRw68p25qx5lomUh9U/2uEVQc3Lc3ZEyE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2FegRAtL2BVka/Tp9Du60OaJOIrrjJ/nmlzUGwV84nC/sndx8
	PYyyfmQqf1/cm33z5GGQi/DdD9SeH/wOfHit/Lgn4CfTrDW0SxPIx8uQ+ZYPvvLe9g9HsatGCjN
	QnRIfZ++11ouxdKCghG3fImKWsvc+/EDDAxhRkLOvtsy38mkmDQ/iWrbQ+W/n9kY=
X-Gm-Gg: ASbGncsfV6aapZRM8m3nhnU4pUIHtQjCpEPf/X5yCceO0lUdWd9+dlkpWozC9E8yS2J
	N99dt3iW4ixFi2HzsXOfihWo4+G24SZybPwiyyx6mXJVXSSozds4jWKQMIfuY/Vkx6xAzGcHKOE
	qrsO7vcSvBLY7IfxRkNnmo/Lps6DiSjDre+Yc2BwYJKqputPir83F27D3NrI4IBR7uIPqz2hwhP
	CaeswglIciQdGi5XseuRwtFeUnJpO+b04NT5gpnjSACaEA8Hhm5f1XcMG2U+3G7V0nc1lSmoiYz
	rGwB80obIJanzN4NC0O5T7YPY2tSUb81UBs3nIAelpc45hMIiWldY4H5cG/jUSCNGQQ=
X-Received: by 2002:a17:902:ebcb:b0:21f:45d:21fb with SMTP id d9443c01a7336-22ac3f321ccmr48818415ad.3.1744220907090;
        Wed, 09 Apr 2025 10:48:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgKvx8lBdm1FHNuXnyGtbdi5VXYxEdAcXoc4DCrdY78oYm92MjebgYjMMTxhRh0F50+1wKTQ==
X-Received: by 2002:a17:902:ebcb:b0:21f:45d:21fb with SMTP id d9443c01a7336-22ac3f321ccmr48818185ad.3.1744220906692;
        Wed, 09 Apr 2025 10:48:26 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c97a1bsm14964005ad.148.2025.04.09.10.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 10:48:26 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Wed, 09 Apr 2025 10:48:12 -0700
Subject: [PATCH v4 01/10] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Add SM8750 to QMP PHY
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-sm8750_usb_master-v4-1-6ec621c98be6@oss.qualcomm.com>
References: <20250409-sm8750_usb_master-v4-0-6ec621c98be6@oss.qualcomm.com>
In-Reply-To: <20250409-sm8750_usb_master-v4-0-6ec621c98be6@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744220903; l=1370;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=8DqyV8lJU3L/SgQ/5n/G4b54XOO0JVKsEdNPv+HKEao=;
 b=77LNm3kHo7uIXLbsObMXwziEYQuHIhUNWEB4Y7oRJvpIb5WlARQPc7NSdgr3i0EeQnCMOqJMj
 APzL7x0yD/FArLp99KEn0e1azIyV9ttlUwnKo12dm6hc1W4QmrwczOQ
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Proofpoint-ORIG-GUID: x98LhYkB0eNQ_1HgyeR2JjxFfEp_creg
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=67f6b2ec cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=bbY3M6C_flAL0yJJl3cA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: x98LhYkB0eNQ_1HgyeR2JjxFfEp_creg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=826 bulkscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090116

From: Wesley Cheng <quic_wcheng@quicinc.com>

Add an entry to the compatible field for SM8750 for the QMP combo PHY.
This handles the USB3 path for SM8750.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index 358a6736a951ca5db7cff7385b3657976a667358..38ce04c35d945d0d8d319191c241920810ee9005 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -29,6 +29,7 @@ properties:
       - qcom,sm8450-qmp-usb3-dp-phy
       - qcom,sm8550-qmp-usb3-dp-phy
       - qcom,sm8650-qmp-usb3-dp-phy
+      - qcom,sm8750-qmp-usb3-dp-phy
       - qcom,x1e80100-qmp-usb3-dp-phy
 
   reg:
@@ -133,6 +134,7 @@ allOf:
             - qcom,sm6350-qmp-usb3-dp-phy
             - qcom,sm8550-qmp-usb3-dp-phy
             - qcom,sm8650-qmp-usb3-dp-phy
+            - qcom,sm8750-qmp-usb3-dp-phy
             - qcom,x1e80100-qmp-usb3-dp-phy
     then:
       required:

-- 
2.48.1

