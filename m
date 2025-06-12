Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216CC1A2643
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 02:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749695987; cv=none; b=kwkOuVSMsuHGKcMSMPFZSeRqLLl5EYacY9/al4HbRuNXwJYJHhBlgqbKDKs6gFe7BIk396oNVu1iL/E/YmKv1mUBf8XL+rEEWub1VT1DOMHHSl8R/fH0gLww+LyLf9OcNS2JOZ2vfm/bYZqM5VWfaMGoqFPGYhO90DXs5mRjLBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749695987; c=relaxed/simple;
	bh=HCNZUH1IAUnt3ulSXSfTFoyY8CpAJheEw8eFgdB2A2w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=McINohL9FkIja/ySPd74CkrTGm8vGNbYvmGQx0zYBc1TsGRi1QQTDKMP94dGtj/dzqsrtCMVekKG6vQhWZxpGiPcZ2LyKzC8qEzsbohkt5aLB0UA47NGIjlU9PX32KEWTuiVNws13sJzvpWX7tciOTcUtFhmTJCyJXSgu883nK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TlFIJB8g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TlFIJB8g"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55BJZJUE029638
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 02:39:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=37Kwgqn9frADxf9jqKF3ls
	RhO0wSNjzOR8UmDzT4s5A=; b=TlFIJB8g1bNcwzttKbCS244gK8po0jBBFlEtBK
	Sf+DOURH/i5f5WtSFALYkQ2x/SYzIMa4+8FHPVZikLBGdm0UNBaro62Z9nxZuHxQ
	0twsBp+GjshCouSUyW0tRP8KvaJ50YSvV0NOWgiEvvsWAg3b+n4sjTThe8qMqygp
	u8MJxz/DY8ybig5hWyk5Utv/IkG9jJsvnQg4ls1mRwSU5n8JrUo7nlyzE353+8GD
	Ec4eP5SSOgiBDSxTlr12ZUH3vqxKydzUJhBfNxhy2V+U8xD8+ghZSrKESsR5IQ3W
	394Pj6PgaJ3p427fVIcMexulWh3c88q+Z0zK/wZsF4T3Cu1Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474d1270nb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 02:39:43 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-742cf6f6a10so817647b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 19:39:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749695982; x=1750300782;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=37Kwgqn9frADxf9jqKF3lsRhO0wSNjzOR8UmDzT4s5A=;
        b=NntlmWuFBE5XIl0N9Nru1XAZ78cvFCObTWhsKkk1c50ujVSuc6q+GG8CLtiOhbFby2
         kjaTwHrSyTPxfQdMUg9d4IAcuH+GnLTunJK2J2SybNHNmJP4yYsQpxVfZdK4p4Hk1l1m
         W6yeaoRuWMJTwu3lMw+Xaed+NvB9tmDsIi19UtIf/BSzmgbqrAQX1x9d55otvjaxioOT
         pW3GEIiTlQc6rTKN1I3pi+0UzrtVdA4ZI83CI9cc+Bg35R6jbHDwrMbx3HEpQqab6kd2
         6R5uNEgB2tT3hEjBdP9+OkMH+YmC9PH31NttAO+O3Hs5EtgprnZomI+yY9pos0zsm8Ob
         gW+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUeu77JFF9IHJRe2ckHJyTXyf7S+3uPkEnAk/l0iunp1YPS+kA5PO9ZbZVlmcZ+VrVKm0Z1HKi8u8oq46c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCG2jrc7Y4lmKZ0zK/qaJplOrBNPrdpGqIk/epOUI9VhyYgDUA
	HFyIbw/ZqC/iNNfFvw0EfW9PobwQxpQ1WyyGWy57Fkc8ttHGDmFFRyjsBqGj/dL3gdoZAxAmTTz
	PiIliMks63y3/wY+2tkM3nMCxu7uuJZI1AVy3QtxVwCxLirasLOfU5U9YD+bYrPDfJcgEP/igoA
	qSklRw
X-Gm-Gg: ASbGnctXhyLO/MhWP+OkpEZTC1cEvFGO3B7eCXDjX7m1KaQu6xUJDwVTk3ycPi1gut4
	j7giBJIqdxsXq4GawIX5ut9ZPuZTh78LOafPtIa/U4TsfsWtOVV0rcW2v+WD0yGfYZjhd/6BOdK
	w/XCINAXbZTUg4zjviTNzKdAKE1Igk3SzWLmGHdzLy0Jx0QiAfIC2h5cHNG9+yLrcteeZpgzuix
	R3W104EoX34H/0izawcYKmp44KeFp2orltMmFCAf7qhFA9hBPVYaYT5Wyt2a7Oys0ogjYPZx8cn
	zoRoW9csyCWA5fswZqpv9/idCREVoHovmIBPpOIUS3M3Se2+sE626ewFaVJVZRzmTPrHQq3Piq9
	oMoqsJhukD3IXzfbp
X-Received: by 2002:a05:6a00:999:b0:748:2ac2:f8c3 with SMTP id d2e1a72fcca58-7487e2f6504mr2011241b3a.24.1749695982565;
        Wed, 11 Jun 2025 19:39:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+cjNHG1R9uaj3OBg4rjmsuHSMyNj3HTY+Ag2Wxhe+xd/5rSdTccqkaFHSysWPfWveqUu1xA==
X-Received: by 2002:a05:6a00:999:b0:748:2ac2:f8c3 with SMTP id d2e1a72fcca58-7487e2f6504mr2011200b3a.24.1749695982053;
        Wed, 11 Jun 2025 19:39:42 -0700 (PDT)
Received: from lijuang3-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488087e640sm315835b3a.4.2025.06.11.19.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 19:39:41 -0700 (PDT)
From: Lijuan Gao <lijuan.gao@oss.qualcomm.com>
Subject: [PATCH 0/2] Correct the ready and handover interrupt number for
 sa8775p remoteproc
Date: Thu, 12 Jun 2025 10:39:31 +0800
Message-Id: <20250612-correct_interrupt_for_remoteproc-v1-0-490ee6d92a1b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOM9SmgC/x3NQQrCMBBG4auUWRtICir1KiIhjhOdhZnwJxWh9
 O4Gl9/mvY2aQKXRZdoI8tGmVgbCYSJ+pfIUp49hmv189KcQHBsg3KOWLsBae8yGCHlblwpjtzC
 HlBef7vlMI1MhWb//xfW27z+WLWOKcgAAAA==
X-Change-ID: 20250611-correct_interrupt_for_remoteproc-9cc1af90abf7
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ling Xu <quic_lxu5@quicinc.com>,
        Tengfei Fan <quic_tengfan@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lijuan Gao <lijuan.gao@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749695977; l=875;
 i=lijuan.gao@oss.qualcomm.com; s=20240827; h=from:subject:message-id;
 bh=HCNZUH1IAUnt3ulSXSfTFoyY8CpAJheEw8eFgdB2A2w=;
 b=YV/XoaWSZifa98T4aXdK1ntUQShLDBiXKzEGqLvcjgXM5oPl8x+5rVFcHrIjIBkG8up6fdRfR
 jaOidyRDM7pCbgtGp8p/1mNthZKo1qr7ixNCzFAm68Up5Hj4r0bJSu+
X-Developer-Key: i=lijuan.gao@oss.qualcomm.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-Proofpoint-GUID: spmPzCemlrged8X1E6UUCtOjzYt7ZbHb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDAyMCBTYWx0ZWRfX+YJrTCwkzak3
 lieN8htg487qqdwNhnC76kYWYoVRDpj577i+apZgEob+XVEo/Xq54dg/QXIg48Urn8Sme0nAsEn
 NpzVaAD0mmS8CC2YSHd4pK2NxO4BfJDhs7zrYA4eb6MQuS7a4/RIqQiuqWmtkyCuKwuS+7s3jn5
 CTmmTmc7P654jUfY+Wbrco5lAQ7/6IkfvR+xwZUI0L7n/RsoPLnFbLy3Q1cIIFOPRCLFjE2FcxL
 1KQBIuJYdTnTnkPe7tRXcILfeiKbyadomOfPHcMWnTEbuN3OpuDMhja5rirx9Cmp8XRZfMqayar
 QnqkARre3ciyigahnNmHHUDN2om1ofkW8bYHm7fJJn99jm/ySq7UfJ2vgKHyB6fH7LykcXH/43C
 6r6CmOrLvb4MMoQyxJyIGK8AObiXf5uERuQH1Qbv6sOtMseX6QTGp6y30xb1s+CTVgeY4oyY
X-Authority-Analysis: v=2.4 cv=GYkXnRXL c=1 sm=1 tr=0 ts=684a3df0 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=6xOPiwoKqXypAXGmrmYA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: spmPzCemlrged8X1E6UUCtOjzYt7ZbHb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_02,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=697 bulkscore=0
 impostorscore=0 clxscore=1011 malwarescore=0 priorityscore=1501 mlxscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506120020

The Ready and Handover interrupt numbers for sa8775p are incorrect. The
correct interrupt numbers are as follows. So they need to be corrected.

Fatal interrupt - 0
Ready interrupt - 1
Handover interrupt - 2
Stop acknowledge interrupt - 3

Signed-off-by: Lijuan Gao <lijuan.gao@oss.qualcomm.com>
---
Lijuan Gao (2):
      dt-bindings: remoteproc: qcom,sa8775p-pas: Correct the interrupt number
      arm64: dts: qcom: sa8775p: Correct the interrupt for remoteproc

 .../devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml       |  2 +-
 arch/arm64/boot/dts/qcom/sa8775p.dtsi                          | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)
---
base-commit: b27cc623e01be9de1580eaa913508b237a7a9673
change-id: 20250611-correct_interrupt_for_remoteproc-9cc1af90abf7

Best regards,
-- 
Lijuan Gao <lijuan.gao@oss.qualcomm.com>

