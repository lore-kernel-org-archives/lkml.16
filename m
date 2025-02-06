Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAFD231A32;
	Thu,  6 Feb 2025 11:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738840645; cv=none; b=TEEmrjvIIFxSDPMzY39hGEiSfnmcdbYVvEhDxew3TZVmyRoqw2vgEKhfTkPZwjDJhZMx6ART3YFFAIDqjKnsMURQmkPXxEDvGDvAfNXIuvckJw5B8hUQ+/MvRgLgg5Y9y+NcddTYNONQgIN60fqPh3G7wEeGoRd5nmxZFTALpsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738840645; c=relaxed/simple;
	bh=h7V1Ib+hS7Is1oL51T2d5wpl2rMolpoOAr2GfiU0mm8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d2B52KdhdW5ve5tv6J0/fNcLtHez6U5n9OdNCyHg2GiAnNrp2JUmlpMKDWHHtKByKdP6xY1snFEM2U35O1fskeKF0e93M2w6nnOlGhaJl6SU8EpHw7R9OG40WM0To/r3wG7d+t+Ko8T3MekCKZisQSFZ+0DsPXNqtIWnmxeRkv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NYJ0/a14; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NYJ0/a14"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5169CWUI014686;
	Thu, 6 Feb 2025 11:17:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IVfPAV2/e+QTjPsIrNAGXhYn
	/5Gy+GPIBeRZfi1LAMg=; b=NYJ0/a14AYdoUue+G1X7ylSrMTiOJQrvzL2b6A1s
	1OMQQf2D8Kk7kWK8mHGzRAvMVG6yWu8z0ICEXcHM4E8FpDKQaBHsxXLpD1lW+0Oh
	dO7gPHwSR2jyvdlDFzmNq81HHHNqxQqJs+0fpcPUE8amR/E+ptIJir/Sf7mdn4zT
	n8DmKiV6IDKLFqF0jKtgzNUJLXOJZARO/YB77mbbbYnEHyJbtRBC6VjRSonde/sZ
	jOCetLr1LIhvppiYshc7XAS+bv4b49xECuhA+X5xajleB/MqMDuyIkmL8sIwnrc0
	z/FN3hrotARprFpZTLWa8ALhDS95ygyGsKahM58ZgpOqRw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44mt8e0amh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Feb 2025 11:17:19 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 516BHIjM002975
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Feb 2025 11:17:18 GMT
Received: from hu-akakum-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 6 Feb 2025 03:17:14 -0800
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
Subject: [PATCH 17/18] arm64: dts: qcom: sc8280xp: Enable high bandwidth for hs isoc eps
Date: Thu, 6 Feb 2025 16:45:42 +0530
Message-ID: <20250206111543.17392-18-quic_akakum@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250206111543.17392-1-quic_akakum@quicinc.com>
References: <20250206111543.17392-1-quic_akakum@quicinc.com>
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
X-Proofpoint-ORIG-GUID: FIs1Z80xiN_HFR_oSBPYGV_CnkfVlO4l
X-Proofpoint-GUID: FIs1Z80xiN_HFR_oSBPYGV_CnkfVlO4l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_03,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=936 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502060093

It is observed while testing multiple audio devices,
a glitch is observed during testing.
As per dwc datasheet,By default, HC reserves 80% of the bandwidth for
periodic EPs.

Add quirk to set GUCTL BIT 16 to accommodate higher bandwidth for
2 isoc eps.

If this bit is set, the bandwidth is relaxed to 85% to
accommodate two high speed, high bandwidth ISOC EPs.
USB 2.0 required 80% bandwidth allocated for ISOC traffic. If
two High-bandwidth ISOC devices (HD Webcams) are
connected, and if each requires 1024-bytes X 3 packets per
Micro-Frame, then the bandwidth required is around 82%. If
this bit is set, then it is possible to connect two Webcams of
1024bytes X 3 paylod per Micro-Frame each. Otherwise, you
may have to reduce the resolution of the Webcams.
This bit is valid in Host and DRD configuration and is used in
host mode operation only.
USe this quirk to set bit for host mode uvc uac usecases where two
isoc eps are used and flicker is seen.

Signed-off-by: Akash Kumar <quic_akakum@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 01501acb1790..8535244e4105 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -3538,6 +3538,7 @@
 				dr_mode = "host";
 				snps,dis-u1-entry-quirk;
 				snps,dis-u2-entry-quirk;
+				snps,dwc3_guctl_resbwhseps_quirk;
 			};
 		};
 
@@ -3597,6 +3598,7 @@
 				phy-names = "usb2-phy", "usb3-phy";
 				snps,dis-u1-entry-quirk;
 				snps,dis-u2-entry-quirk;
+				snps,dwc3_guctl_resbwhseps_quirk;
 
 				ports {
 					#address-cells = <1>;
@@ -3676,6 +3678,7 @@
 				phy-names = "usb2-phy", "usb3-phy";
 				snps,dis-u1-entry-quirk;
 				snps,dis-u2-entry-quirk;
+				snps,dwc3_guctl_resbwhseps_quirk;
 
 				ports {
 					#address-cells = <1>;
-- 
2.17.1

