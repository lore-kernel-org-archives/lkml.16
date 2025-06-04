Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA8E1A4F12
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 06:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749018968; cv=none; b=mKkDyE6iCwgwrzX3vQLmwPTk/WwJGC+riUZYqng4YA7sMfh0izdA4ypytKNTEgp9s7Q3u+nCRudwKm1irbOA2t1x/GOSga8YCvPvBNo0MRy47WbuEXifmJuZwfguXvFn0ida3TqhZuJhAq0zttaDSmN23HdwFm/kDvEyW73lq1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749018968; c=relaxed/simple;
	bh=sRbqQszFVTleAx2yTcV3Ny9IPMLYZEYMYcFeLar8vQI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ppaw9/ooyzyccyl8Wfjt8NSmyec8jRfeNmTcQWGkHDf3oxwHjnx/R+6NK9Y84r1lkGLxW2BIhAilawwAYvVeUVBe5VlHj3+1CzpGGSQKQV1xwh1D/kBAdDoZLO9AtM2gPbwh91Zt1HelcVx1UrrCLPpNk5wunZUP7Ayco3+YZn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PwDbAAdP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PwDbAAdP"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 553KF1PY004226
	for <linux-kernel@vger.kernel.org>; Wed, 4 Jun 2025 06:36:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nA1XVRfBS7e5BMoqc+7tse
	3XttDKcBTrmpygj5xAvdg=; b=PwDbAAdPSwJhBrL+HHTr9xuMI+VtMq4PRpDxXj
	hQamoktthsP4GJsBtiZ2uibnZO/lPhHeuU8x3U3Sux5NEcihHN9ny684nKt9dVT1
	tKS1ZxlDST7Ms+xVGPJwdstab6hbWjtmMSTjhOMux7Mx5Q+juo6nTVZP8CofJXYs
	9jJz5sXYMt4vDnW9njyTQsDQN09IZk89ogo+TdhwPPetEv2IbdvClV86jOrcz5v0
	MhsueavRiHZ6j8/0YDTvVTyMEMhRpYm6MENrUu+MaUYyCqmHiUnbycogLhZp4KTY
	neiYuONMsTwWhiokBn68isdG2gsHYdrEUFJ+zNCc/sjPrmRw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8rw3xh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 06:36:06 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-311d067b3faso9668734a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 23:36:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749018965; x=1749623765;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nA1XVRfBS7e5BMoqc+7tse3XttDKcBTrmpygj5xAvdg=;
        b=hlTPZSeGuj7oDJodmrMDNNblxogtqgKsjV2OlttLHWEvDmZqXWObW89yBwjmP2uJ5a
         t+xyvgZQ/qd3SbpMAXyEFKUjYg9eLFelbuHfUZxoyaB8/ZPSs+reqtx3Z00oUUhoedS/
         kTbWKeJBGkAVDvm+A+aTVfGhUP+JaTzdD/iIHT5sG9g1unkW6v8tgJkoOVNTRRrdRN7l
         Y91iAPU7gbkUc5vfhEIzeynJXUjAbibHEZaukrnx0kSAg2eS8kloHEfZxW0sBKhvFe2n
         7sdqTkBmF2AUkiBzKxAtrU+k2kOWCTRMhgLsDl/5yfVTWGNzDk5UZa7reuRDWZq2Etat
         xCXA==
X-Gm-Message-State: AOJu0YyKe+3uPu2FSCl7uYgNRFbEdZ1wNPKbYT0lw3TcRuG35I2L6+a0
	V7+E08eNH7Bv+xv/1UHMxL5uUl/XWLvw2iIiKjjQPkiBnNkK/l2UXzYNXY3PG96tBLCc0Mf00iK
	1KH/kR3zHEKk32UUwNhJzEvSfKquPNfVMfAO0vMYvKQipB9BlIxkdvtku1JnppKzU1X8j5r3BGb
	A=
X-Gm-Gg: ASbGnct/PAFg58aiCZDYblRt1e0u0zCr37SE1CqVC5RU0O4dga9aW4Ix31VnoIaq5mN
	4KEsyhrX+l22UDkp60FW29Bzs8lXecQMFhrYO+7v18cTd1KlRptbTf+WalUPCTksnHhTixtJbCw
	0uJMrC+22yfPXYXe82pgwtxkRnahZK7mZlhLUGuUjJRCAYCH7ocuhtgLsX5R3xwnDtAmETWVKhR
	IuWoo1EmtasiP5LgztEkBrmhr7/nwQUwePDz6lmzhuyJIsw7Qjj0LutmJk0e5xSWAC4HRbggr6/
	kpOItjRAlnmg2uBxSBi3BY+rokkBrgZV0sav
X-Received: by 2002:a17:90a:da87:b0:311:e8cc:4253 with SMTP id 98e67ed59e1d1-3130ccf5106mr2374543a91.2.1749018965154;
        Tue, 03 Jun 2025 23:36:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQEAfHrLHrtYb6LlLcMTBfH7t+WF1iQ8aSfV2f5M0nadfCyr8QFPZtK5Iq3ccs9ZdWu/Y/NQ==
X-Received: by 2002:a17:90a:da87:b0:311:e8cc:4253 with SMTP id 98e67ed59e1d1-3130ccf5106mr2374515a91.2.1749018964663;
        Tue, 03 Jun 2025 23:36:04 -0700 (PDT)
Received: from hu-msarkar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e2c298esm8286693a91.15.2025.06.03.23.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 23:36:03 -0700 (PDT)
From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
X-Google-Original-From: Mrinmay Sarkar <quic_msarkar@quicinc.com>
Subject: [PATCH v4 0/2] Update PCIe PHY settings for QCS8300 and SA8775P
Date: Wed, 04 Jun 2025 12:05:56 +0530
Message-Id: <20250604-update_phy-v4-0-d04b12bb89f2@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEzpP2gC/1XM0QqCMBTG8VeRXbfYzs6oddV7RIRtM89FapuOR
 Hz3phDo5ffB/zex6AP5yC7FxIJPFKlt8sBDwWxdNi/PyeXNQIAWWio+dK7s/aOrRw7WnQU6Byg
 ky0EXfEXfFbvd864p9m0YVzvB8v4Z3DIJuOAOKyUNgMQTXj8DWWrs0bZvtkBJbWLQu1jlWD+V1
 NYpY4zax/M8/wC/tlZ44wAAAA==
X-Change-ID: 20250513-update_phy-2cd804dd2401
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_nayiluri@quicinc.com, quic_ramkri@quicinc.com,
        quic_nitegupt@quicinc.com, Mrinmay Sarkar <quic_msarkar@quicinc.com>,
        Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749018959; l=1413;
 i=quic_msarkar@quicinc.com; s=20250423; h=from:subject:message-id;
 bh=sRbqQszFVTleAx2yTcV3Ny9IPMLYZEYMYcFeLar8vQI=;
 b=GCWQwRukQIyWsZ+hGbyaUbjRLBtewyIZCGZdL0bwpMgMd4OnZhqmhZU2spYQsrRYSPxMKvtii
 2AT3SI4Zx58Dh/IcYAGhadvcxCZlxEMqThxxpTBkh41+Lpg6ShjDwpa
X-Developer-Key: i=quic_msarkar@quicinc.com; a=ed25519;
 pk=5D8s0BEkJAotPyAnJ6/qmJBFhCjti/zUi2OMYoferv4=
X-Proofpoint-ORIG-GUID: _niyEFySLmClHmYS7GgxMITPs6V2-iDZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA1NSBTYWx0ZWRfX2a/Cb0zg07FO
 zy86kUwP1kjvnBEqRz3WmWf+yGemJxPW8Eeadrj7qQEQup6RIPpk0GkyH6GOWviahQt/zIvwP4J
 gpoXYc4NezcKWyw1pjD4uo3VK17UWPjKslBgr6tuz72eUi0QU+0r1dpWVti4ruIlcM/HETcYoQ6
 8vBFcKp2kGJzX+xBSz5Elr+Yf+owycsBeh9t2bfQV8U4fD592UXXrQHAvboffXtpQFmhsHdB7ds
 6WknUeNtZxpBI+WtiKTtAFJKtbFkC341WmJnLIhyw6BhLgMNgcQvVX7QOIVVGinF3sCYSmKdDpq
 N9W9gOzWdxTR+Jr2rxnVgHcHTLCAStnyjhj4QMsTTbrD1QmKSVBpBfNsRFbkmYN6XH4LY0adSpM
 eSFxYkSO/JCa3kjv+D1GFs1GhbmDTS1xQB4ANS0uDcwNOBXQ5WNdamSLxEVtFh2AJOphaX4R
X-Authority-Analysis: v=2.4 cv=RdWQC0tv c=1 sm=1 tr=0 ts=683fe956 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=vWfPPh_LAE0cc4QMUwIA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: _niyEFySLmClHmYS7GgxMITPs6V2-iDZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_01,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 spamscore=0 mlxlogscore=546 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506040055

This Series is to update PCIe PHY settings as per latest
hardware programming guide and remove max link speed dt 
property for SA8775P PCIe EP.

Signed-off-by: Mrinmay Sarkar <quic_msarkar@quicinc.com>
---
V3 -> V4:
- update commit message in patch 2 as per review comment.
- Link to v3: https://lore.kernel.org/r/20250525-update_phy-v3-0-5b315cd39993@quicinc.com

V2 -> V3:
- update subject in patch 1 as per review comment
Link to v2: https://lore.kernel.org/r/20250514-update_phy-v2-0-d4f319221474@quicinc.com

v1 -> v2:
- Update commit message as per the review comments.
- Remove max-link-speed DT property.

---
Mrinmay Sarkar (2):
      phy: qcom: qmp-pcie: Update PHY settings for QCS8300 & SA8775P
      arm64: dts: qcom: sa8775p: Remove max link speed property for PCIe EP

 arch/arm64/boot/dts/qcom/sa8775p.dtsi              |  2 -
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 89 ++++++++++++----------
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5_20.h |  2 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v5_20.h      |  4 +
 .../phy/qualcomm/phy-qcom-qmp-qserdes-ln-shrd-v5.h | 11 +++
 drivers/phy/qualcomm/phy-qcom-qmp.h                |  1 +
 6 files changed, 66 insertions(+), 43 deletions(-)
---
base-commit: edef457004774e598fc4c1b7d1d4f0bcd9d0bb30
change-id: 20250513-update_phy-2cd804dd2401

Best regards,
-- 
Mrinmay Sarkar <quic_msarkar@quicinc.com>

