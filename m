Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3819342AB0
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 07:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750057469; cv=none; b=gL64dUnXGWselFvif1xb1i/sMz4SeLc0zvMFBZ87lVIDXx1iUuc21nO5wSN8vUSRw4mnagmg2P4f/0sgYNd7FztMOL/pOCsE5KmG5XP0ieuBMSv2tk2ofGNpclQda84BdPXbWOjSLdyywrW/lZhNkqj5OpsRAYM34H6szwKuBYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750057469; c=relaxed/simple;
	bh=DkGDjczW+RAHUbptz63iFFEXvw00+iORY5XJP5CER6Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qmoKqH7SwjXcfMDf9EAmJrhu8+XzXuk9XgedHyh/tp3AZNGB8KUVrrPeFyKmkh6lHu93qDzabKMBdAGnJm2DJD62RGKAoGBN8Iqs5vDvtW+TNe+OWU4iJhIngc95/6nSplLHptQ1hoxOfbKurgX2UoIqvkSBQWHn8s/MQx8yAho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qx3HVd+P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qx3HVd+P"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55FMkUKt014411
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 07:04:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=8CSXs8YLFA90qJz0nFGCAuGj0c2/SeDodgr
	F61jLHXY=; b=Qx3HVd+PIi1iUXhXWS1X0pQXVs4oktpQBwFEUbjfwhZI1nXN1k1
	ygxf+9vQ6BfplAZP9qm4SA1LWblwhQUsgFFq0P4oJyV6rpqga8Y4rsa+OZx0pmtH
	3fB/3mw4zsY2YdH9X1sKvKfq/Xr1XO5EkKb4kAhUYlqLmj3MmD8i9hzRX3TuZoIs
	5gdtCekr63Xh7ScJUhinRA6LgxrrXLkb5yFtOwMRhEvBPn/sfOxZexSU4MmHpTOH
	iblaMvMJbh688c4msQCZBJu3VgIlYHCODnY0RgqESphk+MJJ3s9RsCuIW/kgCn98
	EsEv/3k/Dhc1JRVdWhfT9/uWPUT0xFK78yw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791crkbsn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 07:04:25 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2349fe994a9so29574725ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 00:04:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750057464; x=1750662264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8CSXs8YLFA90qJz0nFGCAuGj0c2/SeDodgrF61jLHXY=;
        b=oVtzK/aGXI0hNQYb6/5lVtR2ltWtNEL3do9rOSFrC2lOB9YCI17oipBxc+BNEzF0zT
         btNvJCbBreQs1d6M2PR+FWZoVanGX7tkK0fZVggGkiCV5j4TXMRpWOLkzUu81T9VQtDW
         ftgLGIjtw0vSCqIYAf4Mrg4TdsJNkBCBzrpMjs6qw7F1+YJj+SJZDRlnOGzgwMon+NSn
         TUE1ahgYVJ/Fh6K2kbbX/+re/az0unSHlmHAEnhNRrm20qyeqDcPX65Vu2yXRIKoARAi
         f7AemZmlhr8kwSh8TiEZfOFvwnsOxa8ESXRQuIWV9f75fJZVjoQC65r6KFDeF/6ep0uR
         VhNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWd5QGqk0MgujBj5X2B9WyCWrVA4G2HZSAMwjjnLTeuzPtjyDnYV0Q0RsQRjnD+rz5cDXfxJ2v8hxTjaCo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyikgYUUQLonuG7EwGxIRRxlP8EL+HJMTKMAbVx48CAmoPpttMm
	UqgTCndbGU6fi1XKBPmq5Ddgb1XH0xFzBu0ZIObwSzb09nI9O6qm3aH1vShxnf/8rdH0hkCFt/5
	LeG2PBqirgLYIj7zLrTi87b4frX+bg/boBCsIlfLAVSUe/FxC3pJmHfcmJ0t5I+WTTro=
X-Gm-Gg: ASbGncvMXudbbm+bI5y6hI6lMX7qz74oPTyta70wAOi/FK6++kFYulAE0y05H/LoX0q
	iUqIxV7QLCo94exUdWYhelIMWouMavCxEGHxzzrdqjjrb/nvBDZS/NHiZRhHF6WGt635gAc4C7v
	nYj62HUNyuJzW5tvwEjQefYP5SegZPY3k7Webb0i7jOHFMsKEOiQOmKiRD5/GErDxc40nsU+N74
	Cf95Krpk30kIkT/hQoPW8ILhkj6k+rpnm1cBjzn9I6A1JWbRceQzgDgtH1Xrs70vs0CNIXmnWGu
	yfnwtvq9AnWB2xI+MqYBut2OjOICo6+yn7SD0kGEYu54y8Q4JuOwekZxxNo=
X-Received: by 2002:a17:903:fb0:b0:235:e71e:a37b with SMTP id d9443c01a7336-2366b13c905mr111686125ad.34.1750057464465;
        Mon, 16 Jun 2025 00:04:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGK+vfW0KxFP2RI/6Wr6CaYhcpxAIyDnSQ9Z/QOwugNmsDFlDJ7ZFbg+QCbcqSaAEuW+soZw==
X-Received: by 2002:a17:903:fb0:b0:235:e71e:a37b with SMTP id d9443c01a7336-2366b13c905mr111685755ad.34.1750057464012;
        Mon, 16 Jun 2025 00:04:24 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d8a19e3sm54435825ad.82.2025.06.16.00.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 00:04:23 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_pkumpatl@quicinc.com,
        kernel@oss.qualcomm.com
Subject: [PATCH v2 0/2] Enable audio on qcs9075-evk board.
Date: Mon, 16 Jun 2025 12:34:03 +0530
Message-Id: <20250616070405.4113564-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: pYPaoVbDubmQ7JKcLtvVHeW6UKzsbY0s
X-Authority-Analysis: v=2.4 cv=BoedwZX5 c=1 sm=1 tr=0 ts=684fc1f9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=YkB-U3mbqUf8DnNMcaUA:9 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: pYPaoVbDubmQ7JKcLtvVHeW6UKzsbY0s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA0NSBTYWx0ZWRfX6NuzMf00RDqW
 MdJuvOCv1u/KXv0yXaEjdjMEUGJzjb9CgRo5pkBGwLKPGrc+pO5rLKUVbXzXJ74U1ekcPE8er9h
 6/totibXEyvf5vOA9xQAbbIipqskXPAfERmQsNu5fasGS2lIRrgXS5uXebrozM7+isJFESIoluG
 rdJi1cvSPwySG1pjdr5JXGRfsdSG+zzIPwadE9SmvgzCsusDaRUayodD6pF3SlOKY1gJph0JWtO
 6m/CsJIjoH5bTif3/ArprpCLVhn0/dg26jzfF7dFAtIyzLGJFnT12AhN3mChmna1UdgAfeuh2r0
 HrdWRx8uJu/WFWR8U+Q1V/IbrxI2hCUJS7nkHqDFHiWfzaroPE1xvtCihX+ABdzSK3aT4sTknSR
 7js8QGM/83ZC0bLgREUCfV59tjjavZfd0RNtfN+8++2nF14KknWgiVmX7KssP9QPg4I4l191
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_03,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506160045

Enable audio support on qcs9075-evk board.

Introduce HS (High-Speed) MI2S pin control support.
The I2S max98357a speaker amplifier is connected via HS0 and I2S
microphones utilize the HS2 interface.

DT-Binding link for sound compatible:
https://lore.kernel.org/linux-sound/20250519083244.4070689-3-mohammad.rafi.shaik@oss.qualcomm.com/

---
This patch series depends on patch series:
https://lore.kernel.org/all/20250521140807.3837019-1-quic_wasimn@quicinc.com/
---

Mohammad Rafi Shaik (2):
  arm64: dts: qcom: sa8775p: Add gpr node
  arm64: dts: qcom: qcs9075-evk: Add sound card

 .../boot/dts/qcom/qcs9075-iq-9075-evk.dts     | 52 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 54 +++++++++++++++++++
 2 files changed, 106 insertions(+)


base-commit: bc6e0ba6c9bafa6241b05524b9829808056ac4ad
prerequisite-patch-id: 853eaf437b81f6fa9bd6d36e6ed5350acaf73017
prerequisite-patch-id: cf52fc82e606ab87458339f71596ca31253e91ee
prerequisite-patch-id: 3617ce3b1790bc5b8e50dca6c3ae482759dcc684
-- 
2.34.1

