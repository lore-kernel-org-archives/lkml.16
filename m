Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3310E20E00B
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 07:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750838140; cv=none; b=ssC4aXACa6ssXM431hE++ebO7locbO5dhk0JaDOnzaOxk4sQ+Dww+mvVvGtVpwGFv8YZLhpvmXIUfzEp5GuJpw9bRfnmxGEfkAdxRMals5Z3WhrIsNv9GnG+9OHhqLuogn5gdzg49gcDgwKo6xnULuM2pkAfiTN4+373OIMmdK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750838140; c=relaxed/simple;
	bh=UXLreCEKENzP7lanGUV4Bm2PCN0o7P4FxkHutEz2K/Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LWGBai7aT7L6qDmrJhsFJds+4+AcjRFYx8y8Lr6swiA99oQTwwygkHlpgy3j0LG289aIeSPxpgcUtENz6q3xhlYE6aFe4VIhPle60stkIg5tFCzLq1FeIMHcp5AGIZ5YSJ+eqWK5k6pVBLmYu8gE/XFx9pmreECsXZVSoGEiT78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nlPhXTe1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nlPhXTe1"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P5f3RT023113
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 07:55:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mVqTDThOIaWdiBFJIde1gg
	/5zleQ3dpP3d0V7N3R1KQ=; b=nlPhXTe1OMJedP5ZaD5BGs3VF9s0FVa7U+OJnv
	zz+mOI059mPYx1rIpjgOUm7sJ6kYScssekw5MD12l3KdpxhKFDkBuIO6VpZO+xtj
	54feYix7mPRmDpwrv9cgRRD+CV28ycsKr85jyoS2BTBUUITU8yfywNFKrdjAT79p
	kmF0Yc+vrUIOxmA0ZENFfQ/iT2wUXd1tiYVFTD5FBJeRMdRznNyLHdNgTt8DsSC3
	aX9C+44NHzWRRBt4aL3jQ9UlznmcP4D8uHte7ZU687wFQjn5y1KVOJ0hMOx1TnsS
	UoY526SfF8LQNS0Kr/UMPNgtQL70WPfaulF5RwwgG/cAB60A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgf20s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 07:55:37 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-748a4f5e735so5108602b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 00:55:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750838131; x=1751442931;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mVqTDThOIaWdiBFJIde1gg/5zleQ3dpP3d0V7N3R1KQ=;
        b=glbSseJjIg+EtLCrGykruVvve6xd08Ku+WnaZPZ1ssf11V0NXV7oG5oBsqdElE4zfG
         MMksl28B9pxonbdzLNVGsD8iYpFQvW3JOrTAJrnKQBs52FkxJHjAHN0cTFnBrNg7ZrMr
         ry/FeqpJzpvaO93DUhos9nkd27aeJ3h8l4Tpyj+J5mkd9/QiBrOKumTlgLqrLFtJkJe9
         PfIGr+EiuGcKV6GfiMgYePCSpARVb82nlMFEvymC+0HO2DVxDP4TZkwdRI35EQhkFTlo
         v5sGZXeVlg5206lSw9sg2/WsYEhCCuh9pbtPAhqU0u5BOmf0BLZ3FO6PDQ1czBlQpwjQ
         b9bw==
X-Forwarded-Encrypted: i=1; AJvYcCU0v0XcnIJ4fxK3+PvwnhvknoY/n+7HaY+IWZXdQO9qFPCWBmG5dvePhdT0iYA9po+Rf0F2TGoL+YBJG7Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9CAO5xzke56ABtCLa9+/MR7mnXv1XdZoz1orGF+XpAUiKk4xK
	j+c6tWSBxFHFrwhgDYF4aWVHa3TUJn2NYF703lz+M4S/i9WQYsMqpbp4Gpd2EVJ6J8iFwjSbW/V
	Z4Y78B0rqh1VhFFfoPSq7aHhTOKw65J4I6r4dow3Zp9TIG6bNDO+fmiRXiUTzSiL5uCSUoXq5TA
	JOfA==
X-Gm-Gg: ASbGncu9CNleJjCvWDL9YoQ8N8Ah1fwMrYmF7IyLj81Ph2r/Tl3EjU6ichQm4KivXbC
	kuBYNCReEHKwXPSdY8AfeTh6bhP6rKJ0tLJZFvz5bBKn8shjPJvYarFTO2EHWqjrhGTDgFBrbK1
	nVeCoWLCqSL+OulXE5Ngq+08rX50HwG01nMoowbRwITcNf+MgQrFSrUnGjZzq6ibe9fxrGPacse
	OVSfydCskap9KLTAivsz9yGOYhVa4lrXmx692peks/FMOiC9IjqYQdlHa9hRvtYpx3jXiJGagT0
	MyfJ73k+BphA459KYYbfNmhbGU9j0F+wYRc49cZFgZ8t7BCZ+NFeytm4TTfhmJrV8ZveqBuxekV
	OcsnBEbvv3w==
X-Received: by 2002:a05:6a00:14c3:b0:742:a02e:dd8d with SMTP id d2e1a72fcca58-74ad45bb35emr3326854b3a.20.1750838131134;
        Wed, 25 Jun 2025 00:55:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7fagUQe9PsTurDS3L9VP8Bz0ybv+OrS3Ghz/7SQDJxxmOptDAiB5wA8rQTqU88Mrb2vxlnA==
X-Received: by 2002:a05:6a00:14c3:b0:742:a02e:dd8d with SMTP id d2e1a72fcca58-74ad45bb35emr3326818b3a.20.1750838130714;
        Wed, 25 Jun 2025 00:55:30 -0700 (PDT)
Received: from yuzha-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749c8853133sm3707478b3a.129.2025.06.25.00.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 00:55:30 -0700 (PDT)
From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Add WiFi/BT node for qcs615 ride board.
Date: Wed, 25 Jun 2025 15:55:05 +0800
Message-Id: <20250625-qcs615-v2-0-0f1899647b36@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFqrW2gC/13O0Q6CMAwF0F8hfXZkGwwcMcb/MMTArLpEmKxCV
 MK/O+abj7dpT+8MhN4iQZXM4HGyZF0fgtwkYG5Nf0VmzyGD5FLxQio2GCqEYgKbs8Z826IwEJY
 fHi/2FaFj/csehzF4z98QOiRqolclu8gpWfJS8qxIM6U1LwsmWDgxp499j5/w/bAm25vUuG4PK
 3uz9HT+HetOIrr/zSbBOGuDLrTWl9zgwRGlw9jcg9KtFNTLsnwBu6tlffoAAAA=
X-Change-ID: 20250625-qcs615-1ead9e48be1c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Yu Zhang (Yuriy)" <yu.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750838127; l=1342;
 i=yu.zhang@oss.qualcomm.com; s=20250625; h=from:subject:message-id;
 bh=UXLreCEKENzP7lanGUV4Bm2PCN0o7P4FxkHutEz2K/Q=;
 b=zOJ9RBOaAsOdSchyGpLOO9QG2X9eXdpcnOMYFCvD9uAjuMLw4Um/LHvxErTSChn0uGwr/oELh
 q4aR3DR33VSDy64WHKWRC3RtkCPa9KenJD9kFDS8nptN8660HSRZHcI
X-Developer-Key: i=yu.zhang@oss.qualcomm.com; a=ed25519;
 pk=ZS+pKT1eEx1+Yb0k2iKe8mk1Rk+MUki89iurrz9iucA=
X-Proofpoint-ORIG-GUID: ECJhqm5tNXh4u8EgIpKCaO_psNAqT_pT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA1OCBTYWx0ZWRfXzCAUP/LCVJVr
 79rs8kQngUrSbJa393ha2Gy0TQASNRvLFwKQ3MgBh3oGVVUzI3hqFmw6fpdp3gL+gWkdCydCrRZ
 2WuKRIr44Yl+OqS2No5gKcDYuIBA190jI5oE8YEQgYMEHVF6ESA5QJwIOwX76y47dcoglacZ8+R
 JxpI8Vla+zNHwWrOYcF+COrjOGZSa4yYVPNya+M9co21aq+wZoEQ61pqs5TnuCX0D3Q/HDInO4X
 EgrDWrU/RhAortdpGZCgb5yRyxsfI0nnsR9pDeNNC6d1RVxQYZfTUxD8NR6jichzJAHLff6PtPk
 2YjGNOe9319KNItyXayNlIFX8v/jozeUr+L0tAwdq2ExPc+uI9sCVEDvU9ZknjP5dY0c6moOEqR
 +Wu2BjNBvCs9vvPXeLfE/AOugnzgRbbgAqS6S9rYe+eIIlG5WDbrZZAtn86SlW0zYNs831fs
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685bab79 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=EFI_8_61vd7ygjqh7MsA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ECJhqm5tNXh4u8EgIpKCaO_psNAqT_pT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1011 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250058

This patch series depends on:
- PCIe
https://lore.kernel.org/all/20250527072036.3599076-1-quic_ziyuzhan@quicinc.com/

Changes in V2:
- Correct the version metadata of the previous patch.
- Separate the modifications to the DTS and DTSI files into different
  commits.
- Formatting: adjust layout based on reviewer feedback.
- Updated the email address.
- Link to v1:
  https://lore.kernel.org/all/20241203060318.1750927-1-quic_yuzha@quicinc.com/

Signed-off-by: Yu Zhang (Yuriy) <yu.zhang@oss.qualcomm.com>
---
Yu Zhang(Yuriy) (2):
      arm64: dts: qcom: qcs615: add a PCIe port for WLAN
      arm64: dts: qcom: qcs615-ride: add WiFi/BT nodes

 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 131 +++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs615.dtsi     |   9 +++
 2 files changed, 140 insertions(+)
---
base-commit: 025c0cda9c75d499b71b8e02123fea56a13b324d
change-id: 20250625-qcs615-1ead9e48be1c
prerequisite-message-id: <20250527072036.3599076-1-quic_ziyuzhan@quicinc.com>
prerequisite-patch-id: 37d5ab98a6918dba98ef8fd7e6c91ab98aace170
prerequisite-patch-id: 6d12fa7481ee4900276912d2a7071a9474e62404
prerequisite-patch-id: 7f2e951982cabbae366b1ff516f4cfa233746427
prerequisite-patch-id: efa688b2ddd5744df7aef40182787ee4ceb90c98

Best regards,
-- 
Yu Zhang(Yuriy) <yu.zhang@oss.qualcomm.com>

