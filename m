Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767EC74420
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 21:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748379899; cv=none; b=C3UyKxan/5MeaAO2p9b96DPBrP4vMZX8tYLYk2MgMXdzXo0xDrkdWiPXt8YxUjHm6E8rFAY3o6trLUj5ALin5HekIwt6tvSiH2SxtC2Xq9L2oIWL3hy4K49tIt9ggvy2h5Sz/CpfV9MqLa84EVUZtlNVsjyxfCZSK2kjT48aAkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748379899; c=relaxed/simple;
	bh=5FExpQUZ/FHZEchRY6UIA2qfjFJXzxNKpcsVYOWNwso=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NP2gkpKtRMC8lTfukOEF8dz2PYdKDrdT5kDVHUZhuh7CRR1ZIm7kRClebrT2ceiLLhn5O8esXLV5xYUYPem08DNeeWgyhBJTMgwseIiddo9k/FHIzLZHIk29JjKLxP4+PDZVEtadGUnlaranH6aiOa7C/hKBjjpvl9smRzPO1FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OyTIxGaN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OyTIxGaN"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RJdYQL010449
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 21:04:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	63TelnMaZLywwjt0ZE9rQRxentiOmbDDz3cY3YJGWYQ=; b=OyTIxGaN6HeRDMcx
	xggCgzI1x739zuaZPZkK/Z17fZFI0xZzNM/YZTFgTheQtJbDdNXhYKBxKf+W5MN2
	DX8XrPOieMGaVw9TjzUVF4PkLqbtw5/UOSGvxncP4jZB4c+ONewBgvuoXu/L4LMS
	RsVbMLBofHwDTxffM9mQV2K24JGIDxD8dXqbpYoYLqfHpWrJmehsl1O5ZhwyHgI+
	PAnUyDcepMBh4K5Xs0pqa6+UZZCPwpClbD1RYn9hv8bOjITC9PG6585FidoNAWSK
	aSzs98QMYwA0XAQESPVxSAqKW1RLbIFbSw7z7WslNtOr+t5ckkJkntlD807oyV0f
	Y6Qzjw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u3fq8e0r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 21:04:56 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-742c00c9044so2957850b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 14:04:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748379895; x=1748984695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=63TelnMaZLywwjt0ZE9rQRxentiOmbDDz3cY3YJGWYQ=;
        b=iRW34EJvor60JNaRNVcysfHvNjErk2wk0YZzHW9E/T3UVQIqkB+ZR/JY6Sr2+baANs
         gFMuIeFJlsKzki3hxvbnu3cC0auGZYk+2dPdlYUKdMfj56iij20qDhd/33LRmfulVqsD
         /P7xC7+tMEUchl8gnMmSzNX1vrVQ7P7iGw7bR83nLgdVwFLf6rC6O/8VYpEzzGlm1aFG
         tRwtCZhXqer+fnHshwMq4QcCiMNNwdvcJK4NgJenaM+KgOc/ahuQlXNjuWLZv/pQolE3
         2HWIbKSL9POYgGJa1SgHZBOf5GqAFnX8aDtlb/+wgPz6e3sNK6HUb9fYU06or52aE1MT
         tsVg==
X-Forwarded-Encrypted: i=1; AJvYcCXJQrJ3QAQJ11yshhqRLulCGZ3nbIHKpJqhTT4pMeCF7kcXVm4ZEpkqxeqDcJ/Bo08NZEzkrfjucQ8nHpo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGj2nLBVICXUI9+42TeZ7Yfsg9Q5U0qkbShs6LbnEg6DpB+XOq
	BjixKKN9kf50FiMD76a1fz9Hiac3z9/3cZaHRaINuQN1wHXpmvefAWgKIzU1WYick0XDuVRS063
	VfKDoARI4CXvQmhnZnhH5YEXgCD8rn+xIxsUbrGxhbazT1jKOQgBd2kczjJEYU4hwVU4=
X-Gm-Gg: ASbGncun/ylO8fdEcCKf1lSSQC0LYkwHkbkapCFpGWHx49XV2LfQqj5hfWJcv9HenlX
	DmDNsN7j98MzRNls3aaluskfRl3Mvxq7Jn7IKpeqjNgvrD9Rugb9FrEqLDvqDTRT1vLZ4TCBKDS
	qOfIrm395nEhnbWvqFE40YptjgaNEZtqxDIqH0yzLfhkKwHC4pkVxyblCP6sSWpKt99vzSxBe3V
	Q95EhIGUX9PO6yO+yGK3/LPt+AHZ7oGvoRT4nk7g4tMcLzxaks3Vrk4mVmMBc0P79hMPtvC/6tE
	UofDxRRyGhEySRYAq7/gUF9qSKzPhuZzxtfmG/5M01wIy9aOcO1sFx2Aig+fl9Tv++o=
X-Received: by 2002:a05:6a00:a22:b0:742:a82b:abeb with SMTP id d2e1a72fcca58-745fdf3f47amr20526679b3a.2.1748379894983;
        Tue, 27 May 2025 14:04:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVTU4ArnKS3XUx/KYBpdSClXfXaPefEciMMvAQUuS6TJ1WcP5QX4l+NUAEE9Sq/8WhMbuLTw==
X-Received: by 2002:a05:6a00:a22:b0:742:a82b:abeb with SMTP id d2e1a72fcca58-745fdf3f47amr20526638b3a.2.1748379894549;
        Tue, 27 May 2025 14:04:54 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7465e64836fsm29167b3a.26.2025.05.27.14.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 14:04:54 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Tue, 27 May 2025 14:04:37 -0700
Subject: [PATCH v6 01/10] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Add SM8750 to QMP PHY
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-sm8750_usb_master-v6-1-d58de3b41d34@oss.qualcomm.com>
References: <20250527-sm8750_usb_master-v6-0-d58de3b41d34@oss.qualcomm.com>
In-Reply-To: <20250527-sm8750_usb_master-v6-0-d58de3b41d34@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748379891; l=1370;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=8DqyV8lJU3L/SgQ/5n/G4b54XOO0JVKsEdNPv+HKEao=;
 b=o1YRULItzlopd45+R1RF7yTgwH4zsRX84NLJyscueOAZIq8dR/2R1drH5MEiKT449uZdTpeo/
 nk9NUMT8WM6A2HSBqhs2UW4zZJSmRT2pJUyfWqLzvb98NRmaK1BG1O9
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Proofpoint-GUID: Hlaww-worrYES_FApOTns0qeKKF9nAWB
X-Proofpoint-ORIG-GUID: Hlaww-worrYES_FApOTns0qeKKF9nAWB
X-Authority-Analysis: v=2.4 cv=X8FSKHTe c=1 sm=1 tr=0 ts=683628f8 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=bbY3M6C_flAL0yJJl3cA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE3OCBTYWx0ZWRfX+gu43Jtxesc3
 +6N2UkLTw5MxRKO9P9dfllzjiN/fxvzyTt7gXguJQTwqKXZ83SUIE0NI2Ho00/MUdaz+DKFdvsM
 /+BxhXStYwJbKZGOx6k0GOXbxeIdCN4oRLZOnXNSWvgf6Td7ottOPJMdOVBFAzkIdNnpPKfvnKp
 QzJ3qF1lVi13B8Onm/8s0tMt2Kc514Hh2HmxNUfqpA8PndUnqfC4SrJPmG1s9KBv5sbSdxWJnuh
 8VgOGUKDP+PSKKxA2L2LCwKj0Za+iRt8d+70mgoi8isaYGmXg78mngK9E3lEotMxBQSobZvdYUG
 VM4+rtzJkfXcnSaLnQu5RwcMGhlzvbi3XqopNuZhymg4n+AA/cGNosjybKaTT0wcAbM6qaAWjW4
 JRDGTw28wipS/2WfyNAkc47a5iv6cerc3h1U7nqf4Dv6RMGb7r23Mkbh6fo0ZbXMy6885z0T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_10,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 mlxlogscore=901
 mlxscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505270178

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

