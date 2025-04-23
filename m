Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B06F2701B6
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 11:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745406958; cv=none; b=dWRNN9sCx9sc7JZphiNvg5wboWjppVz2DfKyaVAJkNa4c58wQ/HKZTkasEX2e0sqJ6f225jAIm9OCzf8+KJ22T18WnDa+Z+HDe8CiLTfsodS7pa9z3/KYhWsEZbfmICz6TkUluc2VLDK2VZoECT0jpfbB6aI+1f+Xo9+UCNy8Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745406958; c=relaxed/simple;
	bh=sbKZVCvGtdkZrIpTI8pX2iJJV/WIKTlKhFkyI8Uectk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Kb3pb+LZI5laxCF3AK7kMc+Yiudm7R6a+xUUt5GRbbKRz2M1r88IjrCNyLufO3+vLVbD/GtPGnD1U8iXHcpLIfhwkZwMw0osU9aB30uxTBMHwpK20b05ebpLAJwFU9merP3q1gXNq4Yt+UQYIyrIIDAM5oS+6gY23fLYZDIlJLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R+UBqWbK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R+UBqWbK"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NB2JTZ012378
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 11:15:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NSUx02OYFI6C5J50Uj+1S8
	PyJZEpqQkJpG/qCn++FQQ=; b=R+UBqWbKFK2BTYPHRosXyf5xBSDtzNndIBr43Q
	LrbKZVeRdMwVEahvrmQyTPRM6nSQarJbN3+CBg7rolwe0KbtCHGOv5m3rwSIoG/Z
	zCvBuW0i7Ql68CA6lv4+hj9C7fLoVaI7H/bMYHL7M4hKwJjYwoyg2FNZR9Ks5wo5
	TehfOSL2hmskg5gZ1HILz9Kh+98Nq7Cg3DHM6DyDzwvyGdBnL5BgCqd/51qf4kpv
	A1hmJ6huTN/fDR5mTp8OIOH/FYaaLyzibyGFK2BbfFnrjQ7yxtjYWAofWDaGCFzD
	o2Fi8HtPOI+vTDTKCek+40LSQJ/YDG++u5iviOHZrgYyNcUA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh1hx7u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 11:15:56 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-896c1845cb9so846097a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 04:15:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745406955; x=1746011755;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NSUx02OYFI6C5J50Uj+1S8PyJZEpqQkJpG/qCn++FQQ=;
        b=n99ETNrYBPNfqMMh8mti6ej516H5RDQbT0A5nk+576MiUILUHhMuuwGBV9Jj41P/R6
         WodRaNuJBftxmojJ5EB4GgRQHcH6EfJvUCcsvK4YjvVQHSU+DwJs8e0/ucmkvSrqFuDA
         /TLpdBV8tOe5sc2qO7l9powEc48OJ0/2yQeZL+TXGrhg7nE4lIGbzj+Ld5U+j4Me9APQ
         VexmlcdMawylqsj50LYb89qgD+CzocMDV1OIKnpQF/RJ45eSiUtKu6mh3511+Qlr2xap
         cgYTvWE8cSKgnzy2sDM0PIXKJUFIJrcPuzuzoT2vDzGr8CNqT2J+VnlvZPafSXJHhE2o
         mO+g==
X-Gm-Message-State: AOJu0YyoN72Re0AkpllD8yq5fjFnB4+Dnr5VowsDQcRhEIRH3tFSZVFI
	XVDnhH7GFSkDLx8sd1j71t//YrxpJq0KLiU8YqX3VWUuO1NJPt2q2rxE/YChPsIwWrL6DV3EjPz
	KNYEDOQnGuEUDPBEx5L5OhCu1LzSsU7EqFplvpVOWVf9uiOc9tvUat/cHdtnzoyw=
X-Gm-Gg: ASbGncuKL6ut5AdfAnDTvAtpGEOwTHqFup5H3ZnYXbWU2oqkmu8O09W7Qaog7NxexXa
	c8xmJHtD0hJApvLiQP74PLPx4mUmBX6XLG18KCWjq4oXKKbE2IJX+W4lQCwq/SzYVb9AypOB16H
	4dz1oWlMnJPUsV0tyHo2gkF70NVKwbQFUBpE2AAZPGtISp46nPnl7ASxih5lxDlCXqXRyujOOCf
	Cz6ijzPu7RXM3uVALgMs6jk4AqDgg2CHZYmm1d3ArHzDGwXz8QiZo4KB0Ft0zhf4zto8Ku6gTQj
	rtteT59zlnecvJTvOJk6vple09Nec3YmMu1PRtqSmteOPA==
X-Received: by 2002:a05:6a20:c709:b0:1f3:3547:f21b with SMTP id adf61e73a8af0-2042e5a7f04mr4616921637.5.1745406955422;
        Wed, 23 Apr 2025 04:15:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1oF0s6obzV3U4IlKnfQWtWH5A8XquDAih6ItXry12b4Upr3sQSi2punkUoDTdQ1EXTQzwNA==
X-Received: by 2002:a05:6a20:c709:b0:1f3:3547:f21b with SMTP id adf61e73a8af0-2042e5a7f04mr4616885637.5.1745406955045;
        Wed, 23 Apr 2025 04:15:55 -0700 (PDT)
Received: from hu-msarkar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0db13c5f8bsm8787322a12.35.2025.04.23.04.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 04:15:54 -0700 (PDT)
From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
Subject: [PATCH 0/2] Update PCIe PHY settings for SA8775P
Date: Wed, 23 Apr 2025 16:45:42 +0530
Message-Id: <20250423-update_phy-v1-0-30eb51703bb8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN7LCGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEyNj3dKClMSS1PiCjEpdgzSjtNQ0o8REA3NTJaCGgqLUtMwKsGHRsbW
 1AJYLAmlcAAAA
X-Change-ID: 20250423-update_phy-0f2fef2aa075
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_nayiluri@quicinc.com, quic_ramkri@quicinc.com,
        quic_nitegupt@quicinc.com,
        Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745406947; l=983;
 i=mrinmay.sarkar@oss.qualcomm.com; s=20250423; h=from:subject:message-id;
 bh=sbKZVCvGtdkZrIpTI8pX2iJJV/WIKTlKhFkyI8Uectk=;
 b=tbbxUT2NStAw36vwNZbHcB/OftIz+gc7eZ+AG3e4twO62qUi0kC4fopP3Opuj4FQemtV9iCAz
 pqsRHi3A4IzDKCq37LEwttq1MOI/cRwcggX0UYu1IiSaWOVwUi+YTqx
X-Developer-Key: i=mrinmay.sarkar@oss.qualcomm.com; a=ed25519;
 pk=5D8s0BEkJAotPyAnJ6/qmJBFhCjti/zUi2OMYoferv4=
X-Proofpoint-GUID: 4J-HTWcLxf0jOfyjKIlllvssLQAaI5QT
X-Proofpoint-ORIG-GUID: 4J-HTWcLxf0jOfyjKIlllvssLQAaI5QT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA3OCBTYWx0ZWRfX6Y/X6dXvqoV/ rTTZbLowJgkbEHbiobujBhqI1hO5XkXVw6Iana/dRVYjFMydGp9Zqbiziei/MDHLdPfS4gO5hwI W6Ikj742GK12bsdavm/X2EV24QySmj+R7HviDhDv7xtOic9dyr7bbuzxtyBQcvuEqwUaAPWkup2
 QFMvkpIGBLDG3mS7BF8nKLmt9Qil2UFs92ozMpAmohdubKSbqEsNZJzQHf+sb4DZXib/+gQtVnR XUHe7AG5epvYDJnnNuAbxA3WUSdIvJg4falpyMMI/1N7HXeIEQSmccU8oYFrxTKfJ92XuZ75mr8 OCcaoDKm2OKAcVd1O8/RY9H/3Df+ZSmAnjeQ1Zc80ZGZjY7Cr2BmVM/UAEuLX7ZAOHim2+0wyWX
 HTvfSCgcpBBvdtyKB/pubMXkxTZFzrPkenbOC5TTEAT4vk5wzq9F+/KDig5cESujSvoRxDxD
X-Authority-Analysis: v=2.4 cv=ZpjtK87G c=1 sm=1 tr=0 ts=6808cbec cx=c_pps a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=LgVGyxlFbL_aAx061p8A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_07,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1011
 bulkscore=0 suspectscore=0 mlxlogscore=637 spamscore=0 impostorscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230078

This Series is to update PCIe PHY settings as per latest
hardware programming guide and update max link speed to
gen4 for SA8775P PCIe EP

Signed-off-by: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
---
Mrinmay Sarkar (2):
      phy: qcom: qmp-pcie: Update PHY settings for SA8775P
      arm64: dts: qcom: sa8775p: Set max link speed to Gen4 for PCIe EP

 arch/arm64/boot/dts/qcom/sa8775p.dtsi              |  4 +-
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 89 ++++++++++++----------
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5_20.h |  2 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v5_20.h      |  4 +
 .../phy/qualcomm/phy-qcom-qmp-qserdes-ln-shrd-v5.h | 11 +++
 drivers/phy/qualcomm/phy-qcom-qmp.h                |  1 +
 6 files changed, 68 insertions(+), 43 deletions(-)
---
base-commit: 2c9c612abeb38aab0e87d48496de6fd6daafb00b
change-id: 20250423-update_phy-0f2fef2aa075

Best regards,
-- 
Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>

