Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D8C8479
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 02:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743043794; cv=none; b=oBMk1VdJL2xi25+QU06v26QLe+R7A+X+odLlP9bi+Xj2z3UdhT8VuRw4KNYVQFVXjbFeKQhqzd789FLqYyuqZcMJ3gy0b6TADYY5upcX0m5eI5BdUalRmtqO3588r54MD39GeMF/uC9bK/DPPpcyrbN5si9jqc76zjPTS8JxvJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743043794; c=relaxed/simple;
	bh=EHLOgzhH6O2Rn7iaTj9DxsI7QCCalqfBeAAtjxKhXjU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qkOV29/s0pny26VV9Ixz3ZFOFJ6IXxBJ2oeK96Uv4Dfc5udkJ1xLZ7mklBy27XFhMVcg8/nzI12OdNT5FsI0MLBcK3FbW+J+yo6tl2tJA9TIcT0yYVJUH+RgfknSUolK73+czvLSA9wBQet2ohIN4QxIjqLkU35Vuty8Aj3kB00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KHutvdpL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KHutvdpL"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52QF9Ijr000410
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 02:49:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=EOG4RdX/l1J1UWKeCN8ca/QQMrmD6lUuCmW
	X0hkRM/Y=; b=KHutvdpLqul3Bc70JQhVxWydZqLy9WnaOMTbRUl8wAOgjnaLDQs
	ZCW42Kvh6w1UNQSYMOdCnvo74bHhy1K5pZSrzeP/mHoa/su4/DyXvghIo/Q2zeLP
	N0r03DW0/Z1SAYVKIrdd6mYxfutiqwQ9hTBtsMMzetYxmEjMRDqyilavi/ZtMoO2
	fdTkZgfJZ1LBcpPpOKDlG+j94/saRc/Dhbno0M3vV/RrSwAAUXKP3T8OnBWjTdpZ
	RGEqW8eFUNBS5YIOkROPszYA3C6WSkeYwvMAODo1PLPLDSeloQHgr66Z3zUlPPT3
	f24P0Rl26R49kdisfNgk97IZsNUHYI7vOQA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kypscvgs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 02:49:52 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ff8c5d185aso1257157a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 19:49:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743043791; x=1743648591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EOG4RdX/l1J1UWKeCN8ca/QQMrmD6lUuCmWX0hkRM/Y=;
        b=NSemNKdl2FLlUkFnGDO472+siq2+e8a+4Uft2xxi/fd+uePvMmb8DUXoiqsA1Y8JoL
         H99IIFEZ5wve5UTmhv5tr2yZnmgcC8GPz9BF0+Mub/8u3+vKi6jf9T9yE6XG6DcZm/H8
         o0IM1wOFBK/ozN2Rve2OvIvqq/HJZlOKhQMQKNALZ6xGbKjE2zfuRHCRHhpAK38Q357c
         dCkOrJDUz55hGv2PcYS1/3o8TAC35fIENEi5REtqfd6Am5A3AYf5PdVoKTZEPU/3bML5
         AMXmsjAHicJ7/ol/rum8OXA0lSyZBN0qSx0YH18yYkMrRALLCleT4gPOUKfD8YXfnpSG
         LmMg==
X-Forwarded-Encrypted: i=1; AJvYcCVtBBwLItN4BskhHZ2uS/BgL6D6pI3BWZYSo4YXZM/Ss242WJqRkg5xtn4/VrAlthhNuUNY+7O2pBMsuc4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEKmJD6aCP2U1/TbAP/tMsjH69k0qQgPCqwXZ9kaPvkTzT77lE
	D2YnojMxxD/jFxlclIGtYwx9EOX7A4k+mAENy5Cy/46ksPa/R/wTx65VG9NwKMgKR5VMwqPaCis
	NgnHmkQfvcQJXJLFsXB/j2UWGOxffjU7EXL9WZLWIHTsztMoXrKme20gTsww6yZc=
X-Gm-Gg: ASbGncvPNWlu2Iz79MkANXq1SvyVKmvfoqRfYPfXVbdFGN9eliecRh4zG45DQp+E4y5
	xefn/89W3Fc2zs8YYZRvHuM9NkwFvuTXK44kHPFQa52VojXCxDwnAHU+OsfxcHcjVIrNxWsKtnT
	ZS0JO9ATSAFnZ1POioJSnkveKbfrGSwulbgNYU2mekKQgDYWHebPQFAPIPfiRaEXZ2AVBtEQ+A8
	hiWooTnLZmaDvQzRqVGEtg33PRAcyhRX36gCmpe6n9iBcHF18a+OxA1WcG0jZrVT94bQ6SJVP0E
	zXrTf9pD+U07it26smLxv+h/+HbniyICzaLw7gOIC6uD1gSvfhu1qcKLN8pRs2sntvzhQijkRi8
	=
X-Received: by 2002:a05:6a21:3381:b0:1f5:a05b:c741 with SMTP id adf61e73a8af0-1fea2d91d81mr3854468637.18.1743043791489;
        Wed, 26 Mar 2025 19:49:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKIPaRy8lsd7Z3F6l+Js80wTB1uu+1FA4rXbfx6w06EiixINvcfPYB5I4rA70fIfkCmCtFsg==
X-Received: by 2002:a05:6a21:3381:b0:1f5:a05b:c741 with SMTP id adf61e73a8af0-1fea2d91d81mr3854434637.18.1743043791018;
        Wed, 26 Mar 2025 19:49:51 -0700 (PDT)
Received: from jiegan-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390615874csm13511878b3a.143.2025.03.26.19.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 19:49:50 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao <quic_jinlmao@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] Enable CTCU device for QCS8300
Date: Thu, 27 Mar 2025 10:49:41 +0800
Message-Id: <20250327024943.3502313-1-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Wwj_FC4xLMWeK7C9RS6dyMjsMnUgHTE3
X-Authority-Analysis: v=2.4 cv=fIA53Yae c=1 sm=1 tr=0 ts=67e4bcd0 cx=c_pps a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17 a=Vs1iUdzkB0EA:10 a=pe-aGEEqWberZWJlMgsA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: Wwj_FC4xLMWeK7C9RS6dyMjsMnUgHTE3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_09,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 mlxlogscore=824 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270017

Enable CTCU device for QCS8300 platform. Add a fallback mechnasim in binding to utilize
the compitable of the SA8775p platform becuase the CTCU for QCS8300 shares same
configurations as SA8775p platform.

Jie Gan (2):
  dt-bindings: arm: add CTCU device for QCS8300
  arm64: dts: qcom: qcs8300: Add CTCU and ETR nodes

 .../bindings/arm/qcom,coresight-ctcu.yaml     |   9 +-
 arch/arm64/boot/dts/qcom/qcs8300.dtsi         | 153 ++++++++++++++++++
 2 files changed, 160 insertions(+), 2 deletions(-)

-- 
2.34.1

