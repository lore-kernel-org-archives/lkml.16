Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06912ECD36
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 16:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751646720; cv=none; b=b1oPjSF9XA8ZYvtC241IDge+cvtIyHQdxZFHgxWAPQEeB1CD8WjGpo79Htujq8zwr4hLJcIWLh1OrMXVZlYI4WbmjRoC9CF6VCOXJQj8QlZ1E4esaCF0K2CfkIENgEkuRUiycuxhyNbUVQfw/mofhWHDoZz+lqhvir+/oRYXnsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751646720; c=relaxed/simple;
	bh=P/5XWsuuqMDqR+GLmerL71P40xuUdfPA8CFQpOrn3/A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=l+6LB6fzhOIW5n+Kg11t8jUBwE6lHy3YYkqK4IUSn/TGeBBMp3lXmuG8RT9r9dWxZDtWwBfQR4v5IR8srr1OHpnqbp8Ba3tzmGRrtPr07ElZw2c3lgiM4GyXCMxysvsDN0/kIBp0bZHk27A6xr43Kuo++TAiAeHU7U+SNb+Pr5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M769Qswx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M769Qswx"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564B65OE019936
	for <linux-kernel@vger.kernel.org>; Fri, 4 Jul 2025 16:31:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pomuj/cQkgzD0OUOqyvuhg
	sunp4U7azsh3q60HaOzhQ=; b=M769QswxAiVvqsD67zoEryy3gtauzpiYXdg/D6
	GFVNMgIOBWklhT+7Tsc4W0lT79Vf6+wjlpus5Ma2GIIXeVbcYK7PAkoER/PM8cKF
	iet+cxu8NC7/ZffkL5RktlueG50XgCyTBkoEdw1Dh/n8J/kQwzfVHth6mx3ctHL9
	v5+kFd7EpueQo8rIS6PKBCVhx6/JQcUnWBWqRHfA4liGedJgm3u0U0z0H7UsQpzp
	bVlyPO2sFEv71q/V3O0yFhnvMP069vZRf7ZF6bVdBPIxJ9AgsvJYd19iO0zdhRWU
	hSk4FO71voCs4rjLfUAFloMGGDEDgy0z4dwhmOztr/2XIK6w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pdsh8spt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 16:31:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d44ff55c98so198638285a.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 09:31:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751646717; x=1752251517;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pomuj/cQkgzD0OUOqyvuhgsunp4U7azsh3q60HaOzhQ=;
        b=GUVmRdMdYwxEdyZfMGeztAezlI6AU7sMBWfQjTNL44u37bMpB2vTmRWloFdPFNjnXY
         5g2pH6BZXa0DPD4GCV/LsTMb/RXq4rhCqKH7BIiCVAhVpJ0a4ZR5SR8VEnzHsJLNKpR6
         sk95Itu5g3AQvBmrvHyMqQauXsfJABLjFe02cBlSds1Dt8x7qsyhL7mAdPjWXvbOIIxM
         5tHTx7it98izft9gr0D2qHwfP7O5JOLkPoduWKd/+QwWLxF87ovfqtIsfc40vAXCU6OQ
         iRUL1+mXoBBME2KyCViOB8SKghc2lWM+okLrAjU1qj877/zoERAcmXSlLZzPi3N/lu03
         uWjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNV7zeajLJArAovD+pABZVNscJGCvy+xrm29TJpD9JOf4BLcQmLafNaRrZy8JQodi7PVbB9MfR3EEJCLY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkE7qXhak/j8f0qOHjfmcSxC9xE1hVaO3fvWvShd7M9vk6GIFE
	ZgbibeGvkbac4Kv3II8etVzEPCCaTdR3PLma6+glPdrwyHe2g9MrqL5lVWSsbIKxnjfdu22HoBt
	KgxLclVJChAhgHK8bQ2rVP2yK7i05fBZbx3/XMPKl+5GlJK/Ayz0Ueym/AwNycS0uacc=
X-Gm-Gg: ASbGncucxuQw2Tyh5AS5ufRWC254RuPm20yzu4ZD9hHKsv80uRcSCIiJsBDnnQCw9Tx
	/umg+pOIe5biKjewuhkIhxs0a1nXhFoJ59dAw4HsEsHpdrnPoOVaQ/h501aV5ItCgt4S1HPOIk6
	hNgdU38g3lcY4mdQfS9DnnBwJARG1QLc1W261AAyb6znZNrIFsmEYMc384CPbOweRLYUtWvW38f
	+xLKG0Ud/Q+/Ma/2DFnf+NAvG+xZyOxyUvZ6zzLkMo0Zlsxuhqz3ZlLiT1do/wJe7cu5ZqpN7Qt
	biqqytuZV/gT8bPMIFNIJdqqrEUDuQBHflRXELHVbrXK/nQB8yty6qgj06X68ZT8xU44NAsDar3
	hFiwPUFKVffki5GZthaDSzAhmWmc/JX3loLg=
X-Received: by 2002:a05:620a:450a:b0:7d5:c45f:c3c8 with SMTP id af79cd13be357-7d5df0ccffcmr335999385a.12.1751646716967;
        Fri, 04 Jul 2025 09:31:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGU1hI88kRN5deziiAv/Vi3VKoh+SdcIIBtiyE5bqnofAdqmJ/2dvCk8nIcVO9jscTO9QwtdQ==
X-Received: by 2002:a05:620a:450a:b0:7d5:c45f:c3c8 with SMTP id af79cd13be357-7d5df0ccffcmr335996185a.12.1751646716499;
        Fri, 04 Jul 2025 09:31:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1af83102sm2813571fa.6.2025.07.04.09.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 09:31:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/4] dt-bindings: display/msm: describe MDSS unit on
 SC8180X platform
Date: Fri, 04 Jul 2025 19:31:52 +0300
Message-Id: <20250704-mdss-schema-v1-0-e978e4e73e14@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPgBaGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcwMT3dyU4mLd4uSM1NxE3SRTs0SzNGNzs6Q0SyWgjoKi1LTMCrBp0bG
 1tQDrvXPlXQAAAA==
X-Change-ID: 20250704-mdss-schema-b56a6f376bf9
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1180;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=P/5XWsuuqMDqR+GLmerL71P40xuUdfPA8CFQpOrn3/A=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ0YG468fhkcSp03tV5iquzegXb7G/dPKhp+x9lUOsxWVZ
 zoxeoh1MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAiTpwcDCtqF3t9UcuNlPtZ
 3n9IbsmC/UcunFH58WVvukDWLTN/068LsxQta556ZTU7/P7w6+Vm5R+iNzxTXcrWT7Tp3RPReZk
 jkaW4ht+rNZBjbsCC9RpMO5IXlsbsW+91fpJHZcOv5MqU7tpUk0XOwWtb1ud7f95tqrnbsGlS3l
 zuv+sjpYVZCzT3HjBRPtv/uGBWd2JIoMS6Qn/bF91aSn3PmN6zPWNlb82VPz7BPoUz1erAgxUG9
 2LUM28IyvruYveRvG7fcqyp6v0s5irTpbMdbXLt2RccSkleKfEg6WZXvo+8++9ATYe1b7ibd0Yn
 L1AP/6Y++d3kOctWLG+PWcjRzD+1NrKi5Gvpk217Df8DAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDEyNSBTYWx0ZWRfX3xuO2kl3vXir
 04WogPwqxr0etVV1XcXkW/Hs6tBMezHRm5HBm6Anq7d+d3LAhd+3Ac+hSPCm1zafLhOTU6tVvUt
 PTv6IE4lA3XDGnin7fD+prFM7Cl8Rz+JUEQ6PJqHgbVHpHwHaiQ5fb2Tw6KHFjP7Fiuf3ekAx63
 KYtm9sXgsi863I7jwLg3sIXmz+fzhatTcUjlrAyDLvcynij5T/NQEqVi2ZHynwtuJCwWgjbuHND
 LrYBJBvSmzV+m7u4SdEc0+rcHqE/orU1e+eRLUWSMrnZXjt/ZIorrKq7o9OjvulIxGrswRWSNNi
 WpGmxwKdjfQpGLVrKfk1GPoQHGga0FlXpEAiB7oJQJs9/JTsXM45VpicuX3piAQyWM8rOEDpvkY
 fVw6XEZ1t6csMTLbEZv9u4oNeJNn5CkgLyHvzYMQo5XxoF1+RrhaNcSO5l1DSxC6OIkBoaGC
X-Authority-Analysis: v=2.4 cv=RJKzH5i+ c=1 sm=1 tr=0 ts=686801fd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=MtNW3POlok7mfpsrGdgA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: pBvtVtOWVIYj700CdbjuFx4bx9N8vgKL
X-Proofpoint-GUID: pBvtVtOWVIYj700CdbjuFx4bx9N8vgKL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_06,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 mlxlogscore=876 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 mlxscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040125

SC8180X is one of the last platforms which do not have DT schema for the
display devices. Add DT schema for Mobile Display SubSystem (MDSS) and
Display Processing Unit (DPU) and add SC8180X-compatible to the DSI
controller schema.

While we are at it, also update DT file for SC8180X to follow best
current practices for MDSS devicex description.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (4):
      dt-bindings: display/msm: dsi-controller-main: add SC8180X
      dt-bindings: display/msm: describe DPU on SC8180X
      dt-bindings: display/msm: describe MDSS on SC8180X
      arm64: dts: qcom: sc8180x: modernize MDSS device definition

 .../bindings/display/msm/dsi-controller-main.yaml  |   2 +
 .../bindings/display/msm/qcom,sc8180x-dpu.yaml     | 103 ++++++
 .../bindings/display/msm/qcom,sc8180x-mdss.yaml    | 359 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              |  14 +-
 4 files changed, 472 insertions(+), 6 deletions(-)
---
base-commit: 26ffb3d6f02cd0935fb9fa3db897767beee1cb2a
change-id: 20250704-mdss-schema-b56a6f376bf9

Best regards,
-- 
With best wishes
Dmitry

