Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FCF46BF;
	Thu,  6 Feb 2025 11:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738840587; cv=none; b=XFO/9J/4l1OIMSge6vRU27TNuzo/g0TTMdEMK+lDt2pK3hYseWzLH9pQmLfSXa4NB2AkH8zrCJRqUWo20NjmLSEvUuoAhXSeTNiqwB6aIUJQ9+/oXid5PIxFTFfVHdg7VK36snMeQWp7S4fbaGk+k+DEcht3sb4fEagFvzjglOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738840587; c=relaxed/simple;
	bh=365H2Ootrc7cMnzybFjQxhIAIS5yTFxcbv+SRpuGO7s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G0bZx2u1Bg13qEeEynUMT1WQx72f88lYCynUFCN/BaY48RZ5a++5j/G9h24oJstZyAJqiQ0IxdnnM2NzXN//bhzyO2wXc7OzuLhL/M0tvOt5IbC1KpgxJw7PINHJ5nfwngPPKY2MPPD9kLl5+gfMQYM3Z9fXSeqp1aWksTkDdx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=B2a3qUEx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="B2a3qUEx"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5169e4jv024110;
	Thu, 6 Feb 2025 11:16:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=quohRuC58gY6brwwP1H1NSKI
	pSi+36Tr3wo2o3XzS5U=; b=B2a3qUExknKmNwiTFeoxAlnR99x3CY2nU8mma1Rl
	LJVcklt4doQ646+HjvqUlisk1EtgYto8sIzOkZtDJc55uWAVf6G6Yvs4aAgqZh1e
	jS6jxIueCEMdH/GM+lfrjiPNBayFjLPPycRdS3yczQ3HARwC6K0uUBenitHuWGlx
	MZEKaojC/njfoqBcwfZ18JzElhRjIDztOn6a384BvYUzwpnjbEDvszXoyPlgtk/E
	qsgVLL11cRIQD50lJ8AarjxnzvZtMXUXve0CsR+NXcz/CPa99q45I6dtwbsk/aH+
	nwQqqHUV/Vp8tbc44WqTfL8LDeoIxA5Y9K+vohE9t2YZRg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44mtn7g7gs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Feb 2025 11:16:20 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 516BGJiY020942
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Feb 2025 11:16:19 GMT
Received: from hu-akakum-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 6 Feb 2025 03:16:15 -0800
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
Subject: [PATCH 03/18] arm64: dts: qcom: sm8350: Enable high bandwidth for hs isoc eps
Date: Thu, 6 Feb 2025 16:45:28 +0530
Message-ID: <20250206111543.17392-4-quic_akakum@quicinc.com>
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
X-Proofpoint-GUID: CToTMh9nCaqnfNOhIEBJX0IEIi4IBV9I
X-Proofpoint-ORIG-GUID: CToTMh9nCaqnfNOhIEBJX0IEIi4IBV9I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_03,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 mlxlogscore=984
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502060092

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
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 69da30f35baa..430ecca13798 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -2656,6 +2656,7 @@
 				snps,dis_enblslpm_quirk;
 				snps,dis-u1-entry-quirk;
 				snps,dis-u2-entry-quirk;
+				snps,dwc3_guctl_resbwhseps_quirk;
 				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
 				phy-names = "usb2-phy", "usb3-phy";
 
@@ -2734,6 +2735,7 @@
 				snps,dis_enblslpm_quirk;
 				snps,dis-u1-entry-quirk;
 				snps,dis-u2-entry-quirk;
+				snps,dwc3_guctl_resbwhseps_quirk;
 				phys = <&usb_2_hsphy>, <&usb_2_qmpphy>;
 				phy-names = "usb2-phy", "usb3-phy";
 			};
-- 
2.17.1

