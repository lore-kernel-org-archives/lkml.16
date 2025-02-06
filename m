Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A6422E41C;
	Thu,  6 Feb 2025 11:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738840598; cv=none; b=fhdeBUc31QuzYtTnaQt73w6l24bhqqdpe+Ajnw/PFM3mMpUieEWtQIBS72R3AIUeZz83bSx43R48xYwJWuIqTF25ZcLb3bM21LPszatILw9qNKgFgwDRkBMww3CbzRdNiPCw+hlOgmgot44r85w5vt7Z05fOkrB9GEOamQbppM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738840598; c=relaxed/simple;
	bh=+HB3bKm68PmTdv/1QvWAeBzv4phkRlMxf+z+5ud8XB8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dxgKEnIjocrQb8f7l8CvxshDdVx7/eqL7umG241+3vyBh6cn7TmnWd99B5N4OKqsxpNuapboTYYXCwtkaTxqp8QK3Ix1uTEQfn9FlvcO2341ZUZdZT1/Z9VbmN54AYQd7m+UbVccqyOhZkE0MCOhQJSaAbOPHF3kN2ms2yWiano=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YFnfLZvj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YFnfLZvj"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5169mdw2015404;
	Thu, 6 Feb 2025 11:16:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QzlwLz4QD4miPNlSfLm/ELON
	JpDjImC3QALnMHOAXEI=; b=YFnfLZvjKz9itXblEJukVwAX0VCxsrTinNIQ2UNA
	zP+gdfrzdbRXTHYozDyvBNV12xScrh0iabp6v0BjpSQDuf/iZ0MCJSdgJboyvjV/
	U/S5bcC5ERaXw82ovjTkiDOH+H3iZ0W0Lk8JIsHikTINIIX0r7h/66Ara199mtrx
	pBsByrqsMYEMnCiv+hKu3kxJr3uE51I3xHZBjZB03jSVsLOhgkoFQDdFwu8Saguh
	98eQQ96g7nUvFgoDuFA/hU5QbK2msvKjxTnDz/LLC9zOVnvGQBy+/pNZzed/XFdW
	ZSk5Og3vEw+8THt/urSdV9xvBrzZ8f/E5brqtgx2Row00w==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44mtsa06u0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Feb 2025 11:16:33 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 516BGWUw002240
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Feb 2025 11:16:32 GMT
Received: from hu-akakum-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 6 Feb 2025 03:16:27 -0800
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
Subject: [PATCH 06/18] arm64: dts: qcom: sm6125: Enable high bandwidth for hs isoc eps
Date: Thu, 6 Feb 2025 16:45:31 +0530
Message-ID: <20250206111543.17392-7-quic_akakum@quicinc.com>
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
X-Proofpoint-GUID: rxiiaw0n3sF1rD2eemMtg3GulQfYTJfu
X-Proofpoint-ORIG-GUID: rxiiaw0n3sF1rD2eemMtg3GulQfYTJfu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_03,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 clxscore=1011 mlxscore=0 adultscore=0 bulkscore=0 mlxlogscore=956
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
 arch/arm64/boot/dts/qcom/sm6125.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index 350d807a622f..d84c85342851 100644
--- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -1211,6 +1211,7 @@
 				snps,dis_enblslpm_quirk;
 				snps,dis-u1-entry-quirk;
 				snps,dis-u2-entry-quirk;
+				snps,dwc3_guctl_resbwhseps_quirk;
 				maximum-speed = "high-speed";
 				dr_mode = "peripheral";
 			};
-- 
2.17.1

