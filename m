Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593C319DFA7
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 05:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744609169; cv=none; b=CiQ2DDoh1o2Ey/0Q+x75DjNpGJx/JEY4YSGb0TGzUeR+yt7RGYZQaTwpBkADY0taIaCqZNfM1mIXbvbgtSHzjcdPd4mpBFQN1noHN5dODM7NXeLjpptiKj0T+VosRF3JR56visxtAXotHak33JS5YEDourtmb3ascG9ZhNffOIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744609169; c=relaxed/simple;
	bh=/+760mFSCqUDEICMonrn2/ZViXzydBURRAKE9RXLKOU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SiR21vZm9mXF4MCvJtf8kFws3BuJNUOG+WcDj/YkqBL8ajKuijMi7h6wHHB68vcaiDtMWpudVL5VkrJCKmFfV7DOPHKZrBPQK/CsmrXi41V00Evo+s1nkJcfZutxnFhGJDb2fduN7DfO582I1jUel0FLOWg1/gZuDyXlkyibuns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DjWtnlU0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DjWtnlU0"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53DLjRe4007943
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 05:39:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=O7DvdN6lKzkstGBPIiGMNR
	gicLNuAj8nHKTQNXLEwlI=; b=DjWtnlU0k6sl+3V2JtBoCaipwROoa0LlruSqga
	pQo4W8oLc9Qz7qtCVPSlaO6tV3Spk1TSAa4vYuyEq6d/OEwr+YfdPeRQjxaMG2t8
	TAzNnYMyS7Dr2dPEQYNbdp9Dsi270RdF7CZqx+ZFehHAhFhrQlgzRUcZSGWvn+v8
	F8VXqlwy1DgOlSN83Z00byZ3ZuEWRcj9hPcy+GJfj1DI9w5Kf11ZAOPDMnMwx3N3
	g00dYyfVDl91Gbu0qRF9iZtaDYemEft5IAytElLqYOPAdnmzImdNgcGadVfEgTM6
	7AV7k1Hrzgp6QHMLCIkoV3osK6hIHeDf5oi66SeZCTEw3JhA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfs13ff6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 05:39:26 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-736a7d0b82fso4727662b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 22:39:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744609166; x=1745213966;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O7DvdN6lKzkstGBPIiGMNRgicLNuAj8nHKTQNXLEwlI=;
        b=bWmjU0pMIbYgCAUFUSuU3puYlF37TKhPZNQtCQsaWHKC/m5sGO90MwYcsqIALegp9U
         nxWnggVdldwFSRqfon+5eeBeG6hOdfyQ3tjrk0/sx8qLO9YtXyA1WwqjnKmnB4v1zNba
         y0r8n62dYMZNIcuzUayMvbOo9DpDiYiH9Vj/nUXms0AyzzggDfTlTekkkOwsiF1wr438
         vNBozAK0aZ9K67BXwjUPlQnCcnzOUNJOkfg+Jc/lNPv/0CC3b8VzVRvVIDiD9LaFAqCO
         FxTT5QJ2iv/jlnjL5goTk6Fpo2pUrOsmEleEUgUqWOS0DxbkWB0LEnabEfG8Iw3MVFTu
         izbQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1ypJ+FvYuS5N7MKy50AVtR5utn7Tl2AqdT8djZL80IdfFOPab0mRXlHLfzn9G3q99XJv5gXL/Ykl6Ccs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWOubcpfqhVdJYq7gUDYPIX/KYzxAM82lvGKQzBAPPujBLiu1S
	dPABUeOQXcd4SgbI7ct2guz62zG9TYBY6K4Ntge94qGqkkqu7BJmcBZ1XnxcBzbU/uiyLcs+ESp
	u92h/WyLpuhvvbO6aKyr+5aFVnf0zgV9/J0PcMeLnWEVMB61L6ttw0eR4D3TskRA=
X-Gm-Gg: ASbGnctIbEt0n+onY4nz0qGYoJm/g9tiseYBKeWhmHXHGzf2YG8LmjdDaUG5R79nWhn
	iC5ZmOX0Pk91G/KSYGG5DWLrzrPIjk+CF7q1+7+gMf9MMZaKPM/tsk2Si+Ux9hGDV0FrnlXQ98a
	dzmCs/W1y3g0UvnlAtDShFhsqHZCerR3NO0rzBoKi3pMMchwxNoFnxKyHYXb1qpwgF6dSm34LU5
	rUV22ySJpxsGmhzgF6a0s2gB0esBXTyPHWq0znhH016V0bwgfypxQR2mBO3WOfzib9WOJxkDUn4
	foLiJZt+1FG9nCW0O4wYF+iBW7k/Cx9gjGbA1UngrTit6gM=
X-Received: by 2002:a05:6a00:1484:b0:731:737c:3224 with SMTP id d2e1a72fcca58-73bd11fa27dmr14689878b3a.10.1744609165420;
        Sun, 13 Apr 2025 22:39:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFb640B4oos4p3ocUe9+u0fOPIBIyFLBaM60q94oJHuSOl3Pd0nPnEKcEYbSZRRedxDNTO2g==
X-Received: by 2002:a05:6a00:1484:b0:731:737c:3224 with SMTP id d2e1a72fcca58-73bd11fa27dmr14689842b3a.10.1744609164796;
        Sun, 13 Apr 2025 22:39:24 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd23332d2sm5824559b3a.159.2025.04.13.22.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 22:39:24 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v2 0/3] PCI: qcom: Move PERST# GPIO & phy retrieval from
 controller to PCIe bridge node
Date: Mon, 14 Apr 2025 11:09:11 +0530
Message-Id: <20250414-perst-v2-0-89247746d755@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH+f/GcC/32M0QqCMBSGX0V23WQ7btO66j3CizmPOUhnm0khv
 ntTCoSgmwPf4f++mQT0FgM5JTPxONlgXR8BDgkxre6vSG0dmQADyTjjdEAfRmqqopCV1IrDkcT
 t4LGxz61zKSO3NozOv7bsxNfvt6A+hYlTRpkoFGKGwrDs7EJI7w99M67r0njW7iZlwPZSw7WEh
 hcyV/BPgr2EEkWtc6GBiV+pXJblDT3YTXoLAQAA
X-Change-ID: 20250101-perst-cb885b5a6129
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744609160; l=2160;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=/+760mFSCqUDEICMonrn2/ZViXzydBURRAKE9RXLKOU=;
 b=LBezZsVzbGh2j4zeHLTmFgFj+VJW7qhNZDUuHDwWaN8Gha+fm2lKEUheY0fKi3+evP7G6V/Dp
 KVQFFQLE+1pBXkg2EFZyYjNVnzmJPS04WtdHg7PkU9vHrvDG9AStcoA
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=P9I6hjAu c=1 sm=1 tr=0 ts=67fc9f8f cx=c_pps a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=zkpMToBQJcapbifWyZsA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: _N1M6BPrrA5N3RbKWjNrpALEg279ebfg
X-Proofpoint-ORIG-GUID: _N1M6BPrrA5N3RbKWjNrpALEg279ebfg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 mlxscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140038

There are many places we agreed to move the wake and perst gpio's
and phy etc to the pcie root port node instead of bridge node[1].

So move the phy, phy-names, wake-gpio's in the root port.
There is already reset-gpio defined for PERST# in pci-bus-common.yaml,
start using that property instead of perst-gpio.

For backward compatibility, not removing any existing properties in the
bridge node.

There are some other properties like num-lanes, max-link-speed which
needs to be moved to the root port nodes, but in this series we are
excluding them for now as this requires more changes in dwc layer and
can complicate the things.

The main intention of this series is to move wake# to the root port node.
After this series we wil come up with a patch which regiters for wake IRQ
from the pcieport driver. The wake IRQ is needed for the endpoint to wakeup
the host from D3cold.

[1] https://lore.kernel.org/linux-pci/20241211192014.GA3302752@bhelgaas/

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v2:
- Remove phy-names property and change the driver, dtsi accordingly (Rob)
- Link to v1: https://lore.kernel.org/r/20250322-perst-v1-0-e5e4da74a204@oss.qualcomm.com

---
Krishna Chaitanya Chundru (3):
      dt-bindings: PCI: qcom: Move phy, wake & reset gpio's to root port
      arm64: qcom: sc7280: Move phy, perst to root port node
      PCI: qcom: Add support for multi-root port

 .../devicetree/bindings/pci/qcom,pcie-common.yaml  |  18 +++
 .../devicetree/bindings/pci/qcom,pcie-sc7280.yaml  |  17 ++-
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |   5 +-
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi     |   5 +-
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi           |   5 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |   6 +-
 drivers/pci/controller/dwc/pcie-qcom.c             | 149 +++++++++++++++++----
 7 files changed, 168 insertions(+), 37 deletions(-)
---
base-commit: 8ffd015db85fea3e15a77027fda6c02ced4d2444
change-id: 20250101-perst-cb885b5a6129

Best regards,
-- 
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

