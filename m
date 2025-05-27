Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4187220C00B
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 21:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748379897; cv=none; b=mi0OAlx9ZCi1hBaJ2jXQM02k9HJbFHNQyeENk7Xg8LuTlbXndAGL+bjzzlNN90tfTUNGQNR3fzQEa34w7XdwQ60aW5rkkEkLxAVYtmJfjBlRxBY2YYWLhoR15Vp8zDxAAZFvM3Vs5TlIznLA99T9yeFppszWWBokzb42Ue/9MXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748379897; c=relaxed/simple;
	bh=4Otq5/SJ7I4zFyhmnnZUzoYm2viVKcjqEocffO3PcQc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=H0P+1iySmKsEUBUzV0M7srtAtRIYonHnvsuvOhoXXPaCbaKb3uYZVW6FdqOlQlB/fWYKVh97W7bXGSgw7lmeRwu6qkxtMMIpnFEeUuGMGyecd9/uTLeRaEEhjGMxbSBhJBARlncHD3GnSxL/RZh99BoZa/cTNuUy28PNHA7wtOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DRbTNJar; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DRbTNJar"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RIHswh003733
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 21:04:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bUgdbJ9307iGvajrrAux74
	w044pWeNfiJuOUqJnpRyc=; b=DRbTNJar+C5jzTqjz0fhcFOQgRQwEmccbbrprc
	SyKZTwdfPF740nsBCno0MK+GANalIHP7oX4PNbRELPijnFfFv+Wdk6WePrrNXmTl
	5w76DtRXr4EdUmvyczsVPfY8ZFvbKPHvpbHwq+8J22LTLxIMxijWjsrDuomZZnb4
	GOnH2UE3IaCkVOu+aoGJWhjlggwLmgAdNOOTMo71faUHv4fRLuv7DRT1OQsRZkyU
	Nl6TugCKC7OD0yCwb6q7IyM1VQbU/xv7AmTAF6XU5iYiD0cAkIZIWPdse7GgpVlO
	PQdlXWBTNGSutKdW6UdgjwFUxQM/WDc9lxvjgGV/gQJG9woA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u66wgf4h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 21:04:54 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-742c03c0272so4771995b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 14:04:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748379893; x=1748984693;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bUgdbJ9307iGvajrrAux74w044pWeNfiJuOUqJnpRyc=;
        b=Grm1OQhiaHKKY2MTwFlIHL6hi8wuaSIXO3zDUSDCwMsVABJ0TLVdyKs9F/SmJhYKcT
         ybSyJobLwLUflJLj4rIdnSkF48AQLmlvPN9l4IF0kjzLNbMZtt6pkvECmE2L0YAm6P61
         v01o+/oc35COpwHopEuFrgBwgjtIYaelyBXlEPqxPChoVIV12Awz60uP/2XKm1yE6rR6
         hYVpc4JxIjO+c9wwrxrmbHYhN/Hs5iixaTuPE67+pegLUSVA/chNYYTSClJd1J//FILh
         cQLx99ZMqtj0InIKvGQLn9aSTbVuLrxgNap9Wcv/brULNOglcYVCRhaIAqrBAE8wpUWw
         sp0Q==
X-Forwarded-Encrypted: i=1; AJvYcCV2Fbgqt2i18/ilUpTkwjvWJjyyiULqHagvYe0WK1PeRX+45gXQv7RAo3II/BXQSOud+n69FoW7SN+cXdY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxG/YoUTA9VG0pjQE8+T7CJkI3x0nyYyUnzIB3FXuYLwip5BV7R
	JoppUuZQgp7BrOCHn+E50NT1CJjiVGxp0So1GV9zc6Zw9PFp6KJPoxt6UQdxiRh6l2u5C05fsWU
	WuFCwqI7O7qSszG1O1AL73RHW1tLMWz0+ZycKsxxnPLjkuIr46+Ngno6qnm+H1LyJMAo=
X-Gm-Gg: ASbGnct1H2zZiCxRtBDl954oqqDoK0sTLBitHIAxHe0M3+qDvP1Rk/hMSN8tkLsDNqu
	QTGOloNWui1Ym130eiy+L/QrPD/OjPK/+Qu/ag5dwSxKfOhbMwkheoO3sERt0nF2VgEskuPfN9T
	OKsw/ZjgzO/Ybj8OSGve5dgQE4kmEttaK+iHVa+UE5JwJWcpWPfuUbD678Hy2Moz8ryCamxlQYh
	YkwplYDq2AA7kIAB/n18D1nzjc0VafETSszGl+c0LjGonbXODpBA/nMSEpKsuScUNjFyknDyUT1
	zz8yEKqvE7zhM7s3Yib14oa1TEWq4L1RjuLsphBOk8kBWlOxrf1zZVd7i65oARVb+Eg=
X-Received: by 2002:a05:6a00:17a9:b0:746:2ce5:a491 with SMTP id d2e1a72fcca58-7462ce5a712mr3645278b3a.10.1748379893428;
        Tue, 27 May 2025 14:04:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdKiWLumEIDy3APCQkLZekdpH+dDZdoDM6L3VDfmiSlLCJgjPEV4ELcOqOm5byIoxyev5IRw==
X-Received: by 2002:a05:6a00:17a9:b0:746:2ce5:a491 with SMTP id d2e1a72fcca58-7462ce5a712mr3645231b3a.10.1748379892966;
        Tue, 27 May 2025 14:04:52 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7465e64836fsm29167b3a.26.2025.05.27.14.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 14:04:52 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Subject: [PATCH v6 00/10] phy: qcom: Introduce USB support for SM8750
Date: Tue, 27 May 2025 14:04:36 -0700
Message-Id: <20250527-sm8750_usb_master-v6-0-d58de3b41d34@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOQoNmgC/23NwW7DIBAE0F+JONfRsgYMOeU/qigisG6QarsB2
 0oV+d+L04MjheOMNG8eLFEMlNhh92CR5pDC0OegPnbMXW3/RVXwOTMEFByxrlKnGwnnKV3OnU0
 jxarFxpJvWuUFsLz7idSG+9P8PP3nSLcp0+NWXkMah/j7/J352q4XEjgvXcy8ggqMbYl7hxLFM
 Xsu9G7vho6t3oybUYMoGZgNq4y2SEoTqHejfjGwaNTZ4DWBUd5p3fp3Q2yGAFMyRDYUOYXcGX0
 hdRxS2t8m+52NboPkC4S8BMkMoXSNIQ/cAxagZVn+AI3etQ7jAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748379891; l=4181;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=4Otq5/SJ7I4zFyhmnnZUzoYm2viVKcjqEocffO3PcQc=;
 b=N5YNjaqcDY7JTLuV4mDpZMezmd80Zbmdr5qoIeetMTUmjJ5V3glufVSP0s5Jx+8BXdoJCWBiM
 7rWoHD82fw5BVmhNiRwkJKfYYRBkOPyMbFSvArSZh+pZ8BhQMUVpisy
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Authority-Analysis: v=2.4 cv=aYJhnQot c=1 sm=1 tr=0 ts=683628f6 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=dNz1S4BQCA6GZfmXsroA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: m4iP93HghMkApCDMCs-Q0Q1cJ16w8YME
X-Proofpoint-GUID: m4iP93HghMkApCDMCs-Q0Q1cJ16w8YME
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE3OCBTYWx0ZWRfX0SFKV2f4xLGP
 WZYOPslgVP8HhAykETxTXJ8U3PH57i1lTUJ/J7Hcu791i2oCZKeh5o5Lb5BGCm4YlIwaxK7U0YV
 PmjSXX6yRwdBwElkw+IOqJnALDbP3IauRvT0KLbDRUlbSoP9IxzT0oe4pwbmMRvAneqlfIVphh2
 PCtwg5PZ7v8W43QeMVY8/E1nqrDf+V+ZSIrUXTn5LZXZGBCWY+uLQO1JOzHmED3QHBdXERvqsV/
 RrhOFQkOrCt+GRW4O0X+TyAytfMaI+qyPH2A+dQu+5o37AAZeQYV/odD99Z1n46Ih4Px8LPDnBq
 sSu0aQt4yNa8poHn/5whxevWOvgpMn8OU/YgvOjJUdJexyCH8NyZy7Hk5WRCRJQQ+lga2PBX0JU
 87j7z8pQceLE7qk3MNKYqVLZ20M8EcmM6foP3rAWIB5JDDeHTkbvMJAgCpw5gjV2vbPePQgu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_10,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 mlxscore=0 spamscore=0
 clxscore=1015 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505270178

Add support for the PHYs and controllers used for USB on SM8750 SoCs.

---
Changes in v6:
- Change readl_relaxed/writel_relaxed calls to just readl/writel in the readback function
- Updated languange in the defconfig commit to specify SM8750 as a Qualcomm SoC
- Link to v5: https://lore.kernel.org/r/20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com

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
base-commit: fefff2755f2aa4125dce2a1edfe7e545c7c621f2
change-id: 20241223-sm8750_usb_master-f27aed7f6d40

Best regards,
-- 
Melody Olvera <melody.olvera@oss.qualcomm.com>

