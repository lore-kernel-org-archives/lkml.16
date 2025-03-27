Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D091F8749
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 20:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743108904; cv=none; b=cHR/wKlY6qDvvc1nkW/RoXKyaqs3DjjPxNmSOeXGrcshqFhHzn3cLYP+8M32ojU+ecJEx7F93nrOAylu0/NJbffzQhRyKRZlX+oZahWiUMGQQNxgOucDeBgzS63ckh+ay8W/nYIwlW+sIphu0jNdwfDqu2Pb3HXJ1uC4z+cHHIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743108904; c=relaxed/simple;
	bh=VMgHcMRYwhQ0xgu1wlvYPDPwmDJ4uxAlGWaYhde7uaM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bbVt9JbUt3XkawXnYFMvOd2T8K+FfAvbzwikyS8c9u0R4Qihd5XtrKavxiaaNPs3iIkIDCVXk4eL1ilBLa609/JqDRtevFNtHC83b91WkBy+9smiR20cpJqI1sktFwyJ5ieihweK++vQMpmgFinNeP2s4fTv0wPHCvn6JACZJ58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ObHWR8V9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ObHWR8V9"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52REo9aN002256
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 20:55:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/ly1+Z7dtjOKbmn8e5OQP6
	L63YMAehGlgPlqCbNIXtY=; b=ObHWR8V9UUMVkVU4e65IIH3QcNKyPNdvESXpKF
	N1SJ/8Lw+2Cbcd5itXqpBheUrVciX7yU8jf3FyOWBoMpLnCXbZnlA50XvRS5I7jV
	ofzPva0rJSVjtHwuD1MMepKPXs4ZU0Kez8LpjBB4kC+BHroU55vE81NccGRz2sPj
	rm5h0AFU4QQGsHcgoCRXyxwsxBeONNtRrq75Cm1Gnq6mmQ8C6BfYJJ+c+iYSOSjT
	nhnGRqEj9w2EzD+x1JXom51yksvN6YazyA8+qVsVdjTohhZcly5rWnvRphTgxrLQ
	pmVDNIM1G4zOLEpNwIH7rWDKDmRCYfbpHuEj6L/0cTTtZyzA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45m0xdygf1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 20:55:01 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2240a960f9cso24785835ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 13:55:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743108900; x=1743713700;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ly1+Z7dtjOKbmn8e5OQP6L63YMAehGlgPlqCbNIXtY=;
        b=EWiSLapcVzZrK0kPGVx/jN73ze6UZ7f3Az80a10sqJxyepFg9XzgqVFmPj13jzJVOY
         2ypD4WQxl9lbFNGSHBGQCifZtUPdRntIc5gSFYsnxIeiZCLv6rz29/R7EPIcv22f6Qkz
         r7A5BY9d8rwrskq7GW5Tq0Y0Qa51z5O+fSU+CilC2QCo41SQsM8wC/fAV74ZgtgZewEI
         fEzNnSc1yP2C2NqXEubbmX5ZsBxRzCjqQ/97FfZRwoblBIdGW0BxMJl92YI7TSoIWMvs
         VQEtq9xD4LyNaUpZuayQSgTqWpHus2PKuBdjHq/rF7y6Tq3BcK/la2gEV1tFGOMvj38a
         ZRTw==
X-Forwarded-Encrypted: i=1; AJvYcCViRb7iNx3R8VoaA9SwuBohnNdWKlzEMXbeGZ8UcT+JceveOAgaYEw9Q5hw2WdGrew/SQyZfxJV2hGcqQU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh8aOfgs6IWvtGLoxcAAbCAcJ3HggIyKqkSqstofgulVApEGSL
	Vwu445Mf4IRZDD9ykUiBFmgxMpM9hUFrsbQLjDDck0wQBlmVgJ7w3N6BcCCbgPKseObmgYgAsIu
	NE/a4rNxoFGOAKlIIJw2uE+99XEVOw/MqFO9lYi8GMTYq1puRGRWlOMlav/7uaro=
X-Gm-Gg: ASbGnct6Sn3NTmaPBqeILjJNJ4xDhhz0ksQwHf+ptYj3xcNcu5i1UbvR2jskj71RZ7x
	tAKJZ4/Z22uSBm3kDdLRIb6wMWoy8+7FKwDpgSaJAwECsa1EdnNNj1aPOHwhApD7zT14IGwTq02
	NHj5Apx3ilJRs8Pn9akjnRmD+KIAvzyzdU3WbcIXztfupPLIXvsU5jOKQkXKPjuG9+44FKOxUi/
	DJP+eR1F/pFwJZhn0b95+OplS0sX5v4QkgwUGKN8IEoLP2090+Vny/Xa4vzOPmG2KK16GkrcHTp
	ZRTYFVopKjlqDfi0TE65ZYzqFMdwnXWddpAxewHPIWrjVH/5JprrMbEUR0Y2BDpMmzy2Rmo=
X-Received: by 2002:a05:6a00:4f89:b0:736:7960:981f with SMTP id d2e1a72fcca58-73960e3074bmr7520364b3a.8.1743108900077;
        Thu, 27 Mar 2025 13:55:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdrY5thxVvn0A1tvz5Th5MBR9OpmIFchSuzb/8ASuSDEwAiRBfXsPBYYnBFb256qeOry5N3Q==
X-Received: by 2002:a05:6a00:4f89:b0:736:7960:981f with SMTP id d2e1a72fcca58-73960e3074bmr7520322b3a.8.1743108899535;
        Thu, 27 Mar 2025 13:54:59 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af93ba10da3sm330889a12.66.2025.03.27.13.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 13:54:59 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Subject: [PATCH v3 0/4] Add UFS support for SM8750
Date: Thu, 27 Mar 2025 13:54:27 -0700
Message-Id: <20250327-sm8750_ufs_master-v3-0-bad1f5398d0a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAO75WcC/22Nyw6CMBBFf4XM2poZHhZd+R+GkFIHmQUPWyAaw
 r9b0cSNy3OTe84Cnp2wh1O0gONZvPRdgGQXgW1Md2Ml18AQY5whoVa+zXWG5VT7sjV+ZKeOJiX
 CA2FqNITf4LiWx+a8FB92fJ+CevyNjfixd8+tO9N7/SYo+ZOYSaGqEq1TipGr3J6Dz0pn97Zvo
 VjX9QUAwFsIyQAAAA==
X-Change-ID: 20250107-sm8750_ufs_master-9a41106104a7
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nitin Rawat <quic_nitirawa@quicinc.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Manish Pandey <quic_mapa@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743108898; l=1659;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=VMgHcMRYwhQ0xgu1wlvYPDPwmDJ4uxAlGWaYhde7uaM=;
 b=OtftsdREQR25w2leTvjMBGDDcJBrx8mGnXf9p/ED9q6f+CUJZmAHDD7W1AZQ6ci5KfY8snqKG
 1i0RCmNen8CC9unMEG9x+tpau4odXSd1ZHlPMB6RaIfu5ncRJ6HsdeI
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Proofpoint-ORIG-GUID: erelf6UlES85AVVoskJaPAhOphlrcGV9
X-Proofpoint-GUID: erelf6UlES85AVVoskJaPAhOphlrcGV9
X-Authority-Analysis: v=2.4 cv=Q43S452a c=1 sm=1 tr=0 ts=67e5bb25 cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=28BvOmV-xxLMpQdZyEsA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_04,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 mlxlogscore=900 malwarescore=0 mlxscore=0 priorityscore=1501 clxscore=1011
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270140

Add UFS support for SM8750 SoCs.

---
Changes in v3:
1. Fixed style in sm8750.dtsi
- Link to v2: https://lore.kernel.org/all/20250310-sm8750_ufs_master-v2-0-0dfdd6823161@quicinc.com/

Changes in v2:
1. Addressed Konrad and Krzysztof comment to fix style in sm8750.dtsi
2. Addressed Dmitry's comment to sort RX by the register offset.
3. Addressed Dmitry's comment to update offset and reg value in
   lowercase hex.
4. Addressed Dmitry's comment to replace sm8750_ufsphy_g5_pcs by
   sm8650_ufsphy_g5_pcs.
5. Addressed Dmitry's comment to include a helper which include
   serdes, pcs and lane init for a particular table.
6. Addressed Dmitry and Konrad comment to update cpu-ufs path
   icc type vote to ACTIVE_ONLY from ALWAYS.
7. Split MTP and QRD board dt commits
- Link to v1: https://lore.kernel.org/r/20250113-sm8750_ufs_master-v1-0-b3774120eb8c@quicinc.com

---
Nitin Rawat (4):
      dt-bindings: ufs: qcom: Document the SM8750 UFS Controller
      arm64: dts: qcom: sm8750: Add UFS nodes for SM8750 SoC
      arm64: dts: qcom: sm8750: Add UFS nodes for SM8750 MTP
      arm64: dts: qcom: sm8750: Add UFS nodes for SM8750 QRD board

 .../devicetree/bindings/ufs/qcom,ufs.yaml          |   2 +
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts            |  18 ++++
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts            |  18 ++++
 arch/arm64/boot/dts/qcom/sm8750.dtsi               | 103 +++++++++++++++++++++
 4 files changed, 141 insertions(+)
---
base-commit: db8da9da41bced445077925f8a886c776a47440c
change-id: 20250107-sm8750_ufs_master-9a41106104a7

Best regards,
-- 
Melody Olvera <melody.olvera@oss.qualcomm.com>

