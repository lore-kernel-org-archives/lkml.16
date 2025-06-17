Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D86B290DBB
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 09:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750151226; cv=none; b=GdIIa+53bbBeoZ033wfxzmUubOWLaLAV1STuIb1Pz4DNN9J66RzBfjs/aS7rsYAaK3ReqFUjSoYkAfh+kpnjQg7cNtBbR0yd6RwQfZ+hOJlQSGLozr8LxQvl9NU2Onex1rQ5tRFN22Wcb57VMCDEPj6ccR1oSu/yW7lc8g7dnZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750151226; c=relaxed/simple;
	bh=XNU86N9EHwH8cVHeT2hJe29cwljaIdUhr0t4VCXYkAE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lgScXlJupI8n1JcEh1RnhEjeoQ9qscpbtDDrMqtErYPtY6Gpq1hKrZwlR6PkODUObFk/+jggRjH8zML9/iPUXhIqG21r12BgpgwBMjsd+c7eRzdlnHyMCKNc9eD9u7Qv1ZhHCSrCkNeDDpoz5P66JP7m64HYzmx1mvOCo8a91R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Njy4D0by; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Njy4D0by"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H6RjDu028912
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 09:07:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=fmqvmK9k/AKo5SNpLwgroPGZIonaKg0+c1g
	g9XdcTz8=; b=Njy4D0by1rKz8FFXMBXuK4wYuGwJAfQohg0EidBRNaXef5i83to
	7SNicNaPQogiJ+3kP5VFIu88ODWHn2bKOc/Vn9Ua/LaXULw0k8cis/1RWMI43gmi
	4/Pgi/2vlzZCl/iudMc/yMAmNj09S48uTpw1yF5Lcffs6PRRTntMW7s2fDyXNn1X
	jz0UuDA5DeSpsLC3h/kq2cN7nKRLmlNV71tlv58Y+vVfkY4iN7pegkUPzkvK7pGM
	Uo+nZnOIxIfsSs/QiKR73u4LwJ5FwZOK6pv9YrmntGuod1SdngXTS/1uJUT5K/1K
	gGLvRf2qMWNCz5fGPey0Bq4yzK4V5FukyWA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791h97muf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 09:07:04 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3132c1942a1so8941731a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 02:07:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750151223; x=1750756023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fmqvmK9k/AKo5SNpLwgroPGZIonaKg0+c1gg9XdcTz8=;
        b=D9KLQLNYStZ+Z9pjBpcuAqJjkqBuqxOFQU0vumhBKz7aSEZwL7bGnbMYBnfc6nnxF4
         waJf2zDrmmQLrPJM8VFoqCgId8koObDeNAbOQ1XEBz+OGM2J5gLD4kj+0jYfFCrf76jj
         INzE+ESj4Pg3VgQlsrV7sW4b7oRV8YadJU/0XX6dPjX4loYE9HiHkHshK8oLxMoZsj/T
         4sUqmQUrneKLqbz9aCaAZ8oKADtCI0KSf/RJtPsYCPKYwNlPDxTafiHIkXp7ATfuYjPJ
         pkKmNn7x6bjBOwdkf03MZB7DMI9qMl34BtpQ5LXad0ajuKkR97ChFPzhesP0cquErrLW
         YPmw==
X-Forwarded-Encrypted: i=1; AJvYcCXf5UMPv8yYPQZkDsIM2ia1Tb2j5BAmoCoqvafwvxqc2b/M4wYrgHj84N3V9b7rMXhm3eJDJKAvoUDGWBQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yywj8tIxeFXqnJkvLJfkqIQsM/KdtJp51M4h0Upa229gCfKx9tR
	rQMNSx9cXXkf6TMYpDBPpn2fkR+aIRS9qMJJ9XipFOC211K+wFm+cYsCbur0ZWsKepTAo/MIg4D
	DHh7e48FZhEaQy2Rguw2GXGtSzmvillqLtUxzKQK+ykgvSNoLG5n/1iq932/8K6ZGDv0=
X-Gm-Gg: ASbGncvnYyweujTmkN+YDTMk7jdEMN4EWPRlQ+bkKBjTgfUBGEPuRWARuJdSgeQejFX
	m031zFv4arTO68CA6mGReYq02FQK9B4vsCvXu+AYwOhc/cIz+202SQ4gm0CnglQYgUG2kzzGsrt
	AqMQG+j5cvrpz1Yc7Sh7buAD/TsMN1culYgFfVror8TKem7uiAbXm9BunkzUgqS1UDDAO1q3Ggo
	M0mNaAzJ0foV0XmmQmfn4xNzXchcI5qKCjoVCVkIk6aZqKU1UkHQd16dI3WI3kstFbJXLTQqGYz
	kSOfkltOGtxIsC8GQn2kZx7XzyKl5aRwwoePKND8pnAkkwkIlvnZrJAu/lzYLQ==
X-Received: by 2002:a17:90a:dfcd:b0:311:c1ec:7d12 with SMTP id 98e67ed59e1d1-313f1df631amr16365961a91.23.1750151222819;
        Tue, 17 Jun 2025 02:07:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENDak9/m3y1Z+lHpFAZozMSnCXvpiXSdunaaZ8aIr66QWZk842CKABwPXtHP1IzwXStJ+syQ==
X-Received: by 2002:a17:90a:dfcd:b0:311:c1ec:7d12 with SMTP id 98e67ed59e1d1-313f1df631amr16365925a91.23.1750151222358;
        Tue, 17 Jun 2025 02:07:02 -0700 (PDT)
Received: from cb9a88ed5d41.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1bdb39bsm10017370a91.20.2025.06.17.02.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 02:07:02 -0700 (PDT)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Mike Tiption <mdtipton@quicinc.com>,
        Sibi Sankar <quic_sibis@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] Add EPSS L3 provider support on QCS8300 SoC
Date: Tue, 17 Jun 2025 09:06:48 +0000
Message-ID: <20250617090651.55-1-raviteja.laggyshetty@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: aTZXpQO8YVCjjTxvaawEreoJNFURYqFs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA3MyBTYWx0ZWRfX4xHgpEVdhN+1
 8Wlsq+1i4HcvlNr1HYDCSzvkhRbdO0eVTH1FMpW9r0t0btLDk7O7SXhpgYJ6lsfTehZ5EyTBS+p
 kfKHYU/+BFObWPc28Rv7AD5kMw2hT64NNPrMn9F7Nhj07xWeUm6xDGL14v3VDxGBRpBAatvAOyK
 kENWI2Q05oRAK6Iw6u7vODgvZ/mGEHqYy+HlG7/6N3yIf/RubJ4tkFw+gHixt+VPMYhU8bpvh4W
 q7zfdC/vrZi1IVd0xGh+cC4raf9ZRq1/0iOUrFrc05lZuftVtpb6AXnNNTEyiqck/Id8aUEpdgV
 gY1OzgRAuNRIqAN3xyAUn+vcaG3lwz5AX9MFQOfBhJW/gxTZG1a4Y+xcVpZ3XwH5GETc9Hg5AZS
 k377RL+Ko0DAWeetd0J5iP9kmZTE2iRhawn89O6I5YVPlbu1NV26f8x90OpPSGfsZdM+W/DL
X-Authority-Analysis: v=2.4 cv=UL/dHDfy c=1 sm=1 tr=0 ts=68513038 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6IFa9wvqVegA:10 a=0wEiu_sYbdzYxkl5siMA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: aTZXpQO8YVCjjTxvaawEreoJNFURYqFs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_03,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1011 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506170073

Add Epoch subsystem (EPSS) L3 scaling support on QCS8300 SoC.

Raviteja Laggyshetty (3):
  dt-bindings: interconnect: Add EPSS L3 compatible for QCS8300 SoC
  interconnect: qcom: Add EPSS L3 support on QCS8300 SoC
  arm64: dts: qcom: qcs8300: Add EPSS l3 interconnect provider node

 .../bindings/interconnect/qcom,osm-l3.yaml      |  1 +
 arch/arm64/boot/dts/qcom/qcs8300.dtsi           | 17 +++++++++++++++++
 drivers/interconnect/qcom/osm-l3.c              |  1 +
 3 files changed, 19 insertions(+)

-- 
2.43.0

