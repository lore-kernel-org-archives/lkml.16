Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B22B1F03EA
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 22:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745272838; cv=none; b=WQvbzAA2rYbzIIz2AycVuRfMzEfeD0iUAgmL4jT6xRqV7sDQIrH9EDv5lsLeHKYD6CRH2yzcY/DiPdQtU10wXOKvQJxkCPSU31Xj6oLNp3t5WTkdGICPJfDiJb12bOATtsb+WHeZQjpw8tIdDppw636MrYtO8mR0j1DX0QKxi2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745272838; c=relaxed/simple;
	bh=GqLIDTmASmJuez3f2Vh7A/GBPYbqnVXDs4axx1Uz9Tk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ATVPap/JhpkFCJPR3WBUIVuGjFgp7uuwW+IECM0ipf+NzsuUHDYLkFH9GFcnmVdbP09aX6DEG4lDa7MYN5+smztN0aUNAWuPQ98KUACWGTSFSpglEnLgPjvLncL05gh1FR15k1a+k5gGO/lwSP34L9myuHj1env4Dx/Br+05i0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SGA7w7c2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SGA7w7c2"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LK47Fc024338
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 22:00:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=z2nwhIw3fRC+5K0tp16aG9
	nKg7dkSFYFnTrRZLkyEKk=; b=SGA7w7c2H8tQqATXgworC3W75ZnyyMAj/hvP0j
	7OlpYCUpUmDuNFQhTi9qW3Nm6lPjzY+aJWSydcyg21Kewcl5r7QxZRQvg7kenlwY
	h5U1WEZGgcLDNQIOCvj5HIB9PBtWwAYmR+E4WciSMBuZ3psKxGGjhbRc/cyeEvJc
	gkSPDU0n2zn1zDBTCXa8BGOvO6nk8rIQgTbrz1X40JHWBLHJ2kUnxYlSVRCmDT5k
	OPSkCmw+oafwiv3xjewpLp0Yb9qAf54rXFRyDloNVB8RodnLF+n9nyidFyLZx5bx
	PzzO9PzTA1X8EzW9lZz8vhcf1vsyOga/Eomy2I/IyRfCuG4w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46454bna22-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 22:00:35 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-73c09e99069so5362753b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 15:00:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745272827; x=1745877627;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z2nwhIw3fRC+5K0tp16aG9nKg7dkSFYFnTrRZLkyEKk=;
        b=BMeM8joed4BD8k65Am8w9kRauBcsgkhfUZsCA/36saRfOOAE/R9NBuTk1zEjJMrp6H
         buHmCles6Dqn3gaAJU3H1fwjWX1kRj8rH2UIui38nOZD68JWiEDh0InxoCHV47Pj7+fC
         7l1BwFghx92Qqor9kHf0wj5W+a9L1QIHN/TxPTRltL2P0uItnwneyzfpLeJk+OOHRmaJ
         dQbLJmtKr5oUK+yRu39q3YGVH9nf/ANjEbZCVn6loET8MLBtp+nX51U1mngmNI+S+NSl
         bCmfiCx7CRRJOzvGTCM0hcv+Dng0/MEBH9usKQJgGvo1C30gE/zbxYwQZ7YQsV3lIJqx
         8ZAw==
X-Forwarded-Encrypted: i=1; AJvYcCVBOABxASZsHMO78/CTaqar3Scn9a0OR1tgpiNNEg3GBu2xP1fOx7wDr8Cti86qXOlBKBeal24+ZAw6FJI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ9qHD/uXPBQKiM5nGLg6Cpa/PbnXUL91cbxcy6GimUmrfzxWx
	sQub5PoxP+bG0ukOzoP5H3BGDTDc4jdUC6pkYf3hifm06FgMKs9O/xisOY1hHrIGdPq0oGQecuT
	8kXie6sObvIbj+Wh7b/fqBr8fkqPsaPvAc1/Osg1sZBmek4g70xDtpzlEm8O3qUY=
X-Gm-Gg: ASbGncvLnecTRvy74KpKg9FIeGNkToJyZv7WuJcjhQV+nWRogVuy2MPlwwYnoshGoQL
	97K8KXzwj71X1rO+HWUmygpn+m5uVGkq8qxPWi/tYO7oDtloa4d5x2JtO5+tG/rrm9rVUmFIDyT
	MwnacfgyAG7uoZeXT4l3nTiZaYRl1KqcIdC0VSj3EcCHHyN0RftWklDQNufRWMhZrbII6dCsIH2
	BCgd5iwa8Vkt64/cqmeAS96MDtqk2Yhm06J8QY/Biwbh1u3q/m1ZqJ4gbU9DBYub2Dk/tW3T3EO
	aWnu1rAZR8X4P2mPHI4LbcJY0U2WfWNwNpAEIR0z/155pUaP7XvqZwLkXVJIfHjFF3Q=
X-Received: by 2002:a05:6a00:2306:b0:736:728b:5f1f with SMTP id d2e1a72fcca58-73dc1563b59mr18654560b3a.19.1745272826988;
        Mon, 21 Apr 2025 15:00:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEiNVceThK2Kg24uwBSmbvNtspxZujpUn3Tc0WF0tvmOGh7jcgXhL+2H7YtDA9KCnXcHNDsQ==
X-Received: by 2002:a05:6a00:2306:b0:736:728b:5f1f with SMTP id d2e1a72fcca58-73dc1563b59mr18654503b3a.19.1745272826494;
        Mon, 21 Apr 2025 15:00:26 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8c04c5sm7107917b3a.24.2025.04.21.15.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 15:00:26 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Subject: [PATCH v5 00/10] phy: qcom: Introduce USB support for SM8750
Date: Mon, 21 Apr 2025 15:00:07 -0700
Message-Id: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOe/BmgC/23NwW7DIBAE0F+JOJdoWTDGOeU/qigisDRItd2Ab
 aWK/O/FycGV4uOMNG8eLFOKlNlh92CJpphj35VQfeyYu9rui3j0JTMEVAJR8tyauoLzmC/n1ua
 BEg9YW/J10F4BK7ufRCHen+bn6ZUT3cZCD2t5jXno0+/zdxJLu1xUIMTWxSQ4cGhsIOEdVqiOx
 XOxc3vXt2zxJlwNCWrLwGJY3RiLpA2BfjfkPwM3DVkMIQka7Z0xwb8bajUUNFuGKoYmp1G4xlx
 IH/uc97fRfhejfUHzPP8B/D2Jy5oBAAA=
X-Change-ID: 20241223-sm8750_usb_master-f27aed7f6d40
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
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745272824; l=3888;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=GqLIDTmASmJuez3f2Vh7A/GBPYbqnVXDs4axx1Uz9Tk=;
 b=tYfnsk74vDromhc9s0GbVU8dU+9G5b/XuSQBhXb5hAPU15cvy0cQga6yQgytgb07l5CoE8uGO
 jQg+85E99ThDOJ5bRmAyRV134xZxt+PKm7/CkuPKBNmpnzAWeD51FHa
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Authority-Analysis: v=2.4 cv=cdrSrmDM c=1 sm=1 tr=0 ts=6806c003 cx=c_pps a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=UZ4tNvspqRR6S34ExfcA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: rFNcAvCj3UjGgAR2nzG76W3_hgSzwcv-
X-Proofpoint-GUID: rFNcAvCj3UjGgAR2nzG76W3_hgSzwcv-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_10,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 phishscore=0 adultscore=0 mlxlogscore=999 malwarescore=0 clxscore=1015
 spamscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210173

Add support for the PHYs and controllers used for USB on SM8750 SoCs.

---
Changes in v5:
- Removed refclk_src from the QMP PHY driver as that is no longer used.
- The decision to move the TCSR clkref property from controller --> phy
node was made in v4, and the refclk_src was a lingering change that was
meant to be removed.  CXO is the parent clock for TCSR clkref, so CXO
clk will be voted for as well.
- Relocate the SM8750 compatible within the qcom,dwc3 bindings.  This is
to take into account the change in clock list.
- Link to v4: https://lore.kernel.org/r/20250409-sm8750_usb_master-v4-0-6ec621c98be6@oss.qualcomm.com

Changes in v4:
- Made some fixups to the M31 eUSB2 driver
- Moved TCSR refclk_en to the QMP PHY DT node
- Link to v3: https://lore.kernel.org/r/20250324-sm8750_usb_master-v3-0-13e096dc88fd@quicinc.com

Changes in v3:
- Split platform DTs into separate commits.
- Fixed up M31 eUSB2 PHY driver with feedback received.
- Reordered DT properties based on feedback.
- Rewrote commit message for enabling EUSB driver.
- Link to v2: https://lore.kernel.org/r/20250304-sm8750_usb_master-v2-0-a698a2e68e06@quicinc.com

Changes in v2:
- Added new QMP PHY register definitions for v8 based QMP phys.
- Made changes to clean up some code in the M31 eUSB2 PHY driver based
on feedback received.
- Added bulk regulator operations in M31 eUSB2 PHY, to ensure that
both the vdd and vdda12 regulators are properly voted for.
- Removed external references to other dt bindings in M31 example for
the DT bindings change.
- Split DT patches between SoC and plaform changes, as well as the
PHY subsystem Kconfig changes when introducing the M31 eUSB2 PHY.
- Added orientation switch and port definitions in the DT changes.EDITME: describe what is new in this series revision.
- Link to v1: https://lore.kernel.org/r/20250113-sm8750_usb_master-v1-0-09afe1dc2524@quicinc.com

---
Melody Olvera (2):
      dt-bindings: usb: qcom,dwc3: Correct the SM8750 compatible
      arm64: defconfig: Add M31 eUSB2 PHY config

Wesley Cheng (8):
      dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add SM8750 to QMP PHY
      dt-bindings: phy: Add the M31 based eUSB2 PHY bindings
      phy: qcom: qmp-combo: Add new PHY sequences for SM8750
      phy: qcom: Update description for QCOM based eUSB2 repeater
      phy: qcom: Add M31 based eUSB2 PHY driver
      arm64: dts: qcom: sm8750: Add USB support to SM8750 SoCs
      arm64: dts: qcom: sm8750: Add USB support for SM8750 MTP platform
      arm64: dts: qcom: sm8750: Add USB support for SM8750 QRD platform

 .../bindings/phy/qcom,m31-eusb2-phy.yaml           |  79 +++++
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         |   2 +
 .../devicetree/bindings/usb/qcom,dwc3.yaml         |   2 +-
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts            |  24 ++
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts            |  24 ++
 arch/arm64/boot/dts/qcom/sm8750.dtsi               | 164 +++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 drivers/phy/qualcomm/Kconfig                       |  16 +-
 drivers/phy/qualcomm/Makefile                      |   1 +
 drivers/phy/qualcomm/phy-qcom-m31-eusb2.c          | 325 +++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 221 ++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v8.h     |  38 +++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v8.h         |  32 ++
 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v8.h |  64 ++++
 .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v8.h    |  68 +++++
 drivers/phy/qualcomm/phy-qcom-qmp.h                |   5 +
 16 files changed, 1062 insertions(+), 4 deletions(-)
---
base-commit: bc8aa6cdadcc00862f2b5720e5de2e17f696a081
change-id: 20241223-sm8750_usb_master-f27aed7f6d40

Best regards,
-- 
Melody Olvera <melody.olvera@oss.qualcomm.com>

