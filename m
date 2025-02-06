Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7780746BF;
	Thu,  6 Feb 2025 11:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738840566; cv=none; b=ayLsZ8J9xk0Cxg/hDLsj9XgU8u6Y+5ZMqR3dmXfLfg3SU+qkUVJXVbF4f9C0bL7N+8ICOFKCkEfaCdg0cYXQrkeqJqE1jKFrjISPe3c7CKTXTZaO92DON2bY0/OqoSWMi05uN1n8XGTJjTiaNxx5qI2YkgETTT7WPccY8JJQYwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738840566; c=relaxed/simple;
	bh=JE5PT+guW3Zk2Wsk9k2QcVO0fsbzHZ/ZObcrOt7GfFs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=snAByOhZ/tYivIFZuXPCp54OZkfNbt97+eSDthRIV7AlYfrXBGFp+kisrLZs3zVwFFgY7zMI+ozPGagp2N69MEc+DIPT4kNQvDBcWRbKqKpCwsXJDqPBzKeyq2WxyT/JOw4a2EqiiBN4y9INFOSSAcHjo7amNXhwvsugrDbXKnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lNtf/Zi6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lNtf/Zi6"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5169CnQg015655;
	Thu, 6 Feb 2025 11:15:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=ORfs6GpUZ35WZAhkpbQIUI1xIbowMe35eWXBe3g3sp4=; b=lN
	tf/Zi6geTSOqbJAZvmuE15MO+GRBwYMSbVZw3R0EGm4MbGCIMntPgFJN5ngDWPp4
	Rb5fWL36HFNKJAI0633FgE1T7EKFZt8ExxF/3bDvMLSvz6rcqxv27MkegCQ/xOJX
	T9gsvNhTofURIGZWkT2N+fgn0t9AHBlQpl50u5yB1bgBjuhr2PdU2I1Uvu20RlGw
	K3jBzfh4QXUTVpkF7HeCxp8g5M4aGv0rdjUxOKmkw6fug7OCU7HqAoqC+UAhI07g
	SXYg15xw/9mgqsTo7vcbZXJVmWwEK42agTalhpNaGRXHI+wWBDoVrFjRIUGqPsDn
	GfnOjYBiuBT9gOYkJXBQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44mt8e0agu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Feb 2025 11:15:59 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 516BFwvF008212
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Feb 2025 11:15:58 GMT
Received: from hu-akakum-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 6 Feb 2025 03:15:54 -0800
From: Akash Kumar <quic_akakum@quicinc.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Jack Pham <quic_jackp@quicinc.com>, <kernel@oss.qualcomm.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Vijayavardhan
 Vennapusa" <quic_vvreddy@quicinc.com>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Akash Kumar <quic_akakum@quicinc.com>
Subject: [PATCH 00/18] Reserve high bandwidth for HS isoc eps
Date: Thu, 6 Feb 2025 16:45:25 +0530
Message-ID: <20250206111543.17392-1-quic_akakum@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: jfj7MwXjXYMhm-FGpgVeeyCnTFjlPoKD
X-Proofpoint-GUID: jfj7MwXjXYMhm-FGpgVeeyCnTFjlPoKD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_03,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=4 phishscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=4 suspectscore=0 mlxlogscore=741 malwarescore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502060093

It is observed while testing multiple audio devices over usb, a glitch is
observed during testing. As per dwc datasheet,By default, HC reserves 80%
of the bandwidth for periodic EPs which can be increased if needed.

Add quirk to set GUCTL register BIT 16 to accommodate higher bandwidth for
2 isoc eps.

If this bit is set, the bandwidth is relaxed to 85% to accommodate two high
speed, high bandwidth ISOC EPs. USB 2.0 required 80% bandwidth allocated
for ISOC traffic. If two High-bandwidth ISOC devices (HD Webcams) are
connected, and if each requires 1024-bytes X 3 packets per Micro-Frame,
then the bandwidth required is around 82%. If this bit is set, then it is
possible to connect two Webcams of 1024bytes X 3 paylod per Micro-Frame
each. Alternatively, you might need to lower the resolution of the
webcams. This bit is valid in Host and DRD configuration and is used in
host mode operation only.

Set this bit for host mode uvc uac usecases where two isoc eps are used
and uvc flickers or audio glitch is observed.

Akash Kumar (18):
  usb: dwc3: Reserve Higher Bandwidth for HS Periodic EPs
  arm64: dts: qcom: sa8775p: Enable high bandwidth for hs isoc eps
  arm64: dts: qcom: sm8350: Enable high bandwidth for hs isoc eps
  arm64: dts: qcom: sm8450: Enable high bandwidth for hs isoc eps
  arm64: dts: qcom: sm8150: Enable high bandwidth for hs isoc eps
  arm64: dts: qcom: sm6125: Enable high bandwidth for hs isoc eps
  arm64: dts: qcom: sm8250: Enable high bandwidth for hs isoc eps
  arm64: dts: qcom: sm6350: Enable high bandwidth for hs isoc eps
  arm64: dts: qcom: sc7280: Enable high bandwidth for hs isoc eps
  arm64: dts: qcom: sdm630: Enable high bandwidth for hs isoc eps
  arm64: dts: qcom: sdm845: Enable high bandwidth for hs isoc eps
  arm64: dts: qcom: sdx75: Enable high bandwidth for hs isoc eps
  arm64: dts: qcom: qcs404: Enable high bandwidth for hs isoc eps
  arm64: dts: qcom: sc7180: Enable high bandwidth for hs isoc eps
  arm64: dts: qcom: x1e80100: Enable high bandwidth for hs isoc eps
  arm64: dts: qcom: Enable high bandwidth for hs isoc eps
  arm64: dts: qcom: sc8280xp: Enable high bandwidth for hs isoc eps
  arm64: dts: qcom: sc8180x: Enable high bandwidth for hs isoc eps

 arch/arm64/boot/dts/qcom/qcs404.dtsi   |  2 ++
 arch/arm64/boot/dts/qcom/qdu1000.dtsi  |  1 +
 arch/arm64/boot/dts/qcom/sa8775p.dtsi  |  3 +++
 arch/arm64/boot/dts/qcom/sc7180.dtsi   |  1 +
 arch/arm64/boot/dts/qcom/sc7280.dtsi   |  2 ++
 arch/arm64/boot/dts/qcom/sc8180x.dtsi  |  3 +++
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi |  3 +++
 arch/arm64/boot/dts/qcom/sdm630.dtsi   |  2 ++
 arch/arm64/boot/dts/qcom/sdm845.dtsi   |  2 ++
 arch/arm64/boot/dts/qcom/sdx75.dtsi    |  1 +
 arch/arm64/boot/dts/qcom/sm6125.dtsi   |  1 +
 arch/arm64/boot/dts/qcom/sm6350.dtsi   |  1 +
 arch/arm64/boot/dts/qcom/sm8150.dtsi   |  2 ++
 arch/arm64/boot/dts/qcom/sm8250.dtsi   |  2 ++
 arch/arm64/boot/dts/qcom/sm8350.dtsi   |  2 ++
 arch/arm64/boot/dts/qcom/sm8450.dtsi   |  1 +
 arch/arm64/boot/dts/qcom/x1e80100.dtsi |  5 +++++
 drivers/usb/dwc3/core.c                | 11 +++++++++++
 drivers/usb/dwc3/core.h                |  4 ++++
 19 files changed, 49 insertions(+)

-- 
2.17.1

