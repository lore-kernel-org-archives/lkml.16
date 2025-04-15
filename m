Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31CC207643
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 01:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744680125; cv=none; b=S4fjidC9+yTzaIr0FnUgOLUYYlaSq7rwP28Kcq/tmak57/3edS5cK2zcb5WFKxOs1f6FSutlx94uMQTWldklSdyKjZYbtiLFSIVkH7h7yjgKKsApR1XI9mwHBg45o0wFfn+qSryT/BWKJutvQTJfAWb1XjDLBPZ39wv+ZbL+cCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744680125; c=relaxed/simple;
	bh=QRDCi8fa98QdM0s7BUua2ql+G87colRiQfhXndES9dg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kJ2x48BdkhLwX0M1ea5sGyqAZ10bzQoxDl64MQGltMM1LSS+tsXqmPLgyIvNY2s+Cxi/hVz9aRfradQ2AOR/UVtbi4pP8/Uv5WyYpfJR3A1Qs5WX+i83Ur/e96S8pOgiFxynFi37NWP/lHKG+EswjJtDqwpirBVTq8y5WDCR+uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AV6oAwhL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AV6oAwhL"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F15K68005407
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 01:22:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1ULIXRqyHbD/TQGRiIQ2N2qUGSlDhE4RmRxQY+pArMA=; b=AV6oAwhL8LhnwmbF
	E5NewjM1zj3IKj0kMLf91Urx68CW0NhzLR82lOAW4BRv83Ui0DXBY/T8W1g5DIdv
	iHnQPL2Cq1tvtLRHh2z/gGXI0MvUc7OQM2I3Y6Gp51g8MYR9es0c5r63w7g8VezR
	snbzM5Ab2iyIkZ0jY6peZBfjV6XZ+TW0KNSTB33zVMb9OYCpnEmqzw1yhGxZ0atO
	+NGC8zKK7onkiiw9MUYDCnoTYrWsXNpCgUndVreY/eSK+gl3PRrYtHsYfB3tfJ8G
	4HSr/X400fRn2gir0NqmY0jhyUoJJLmyGlMF4iAtelRRnRBvhUO5AWSRYf5h4jcP
	h7JMkA==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydhq6fpn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 01:22:02 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-72b8ee50fbeso4697954a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 18:22:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744680122; x=1745284922;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ULIXRqyHbD/TQGRiIQ2N2qUGSlDhE4RmRxQY+pArMA=;
        b=n/3HYq5QJgkK4IyufzdAccu8dDvHmeAA/oHozwP6iOL2Q0KgpjzS6U3zWPbIGwYI1e
         1qpWt0BMQESg3CeS90F2oof8+fG/pada7IaiLbQ28VOTxq9i3THp79eg6gMI7qF6Mp6X
         zwJ8yz3p+ppKVh/90JzQy9Jl3Q4blfxAMd/cIbIptg0tjfiRgF8bRkgRiokqK9lsZAc4
         +jVFPlrMmdAcBzuYLP6E2nKAVZ69JLz+10Sd5dMZIarkQHkSzOAoe6JCBL4/fm4Q9rGt
         VZFfsXsbFl4pwws9D2Ir+9s5OwVmaLyB46J2Cp6LmDltMQI+ph8RGTrYQl366N7shaev
         AHzw==
X-Forwarded-Encrypted: i=1; AJvYcCWWQQ5cMAhjeO6g3aYGlosDV3oxRTv0jfLy6DTNBiSJ/Wxh6gccVjgQDuPOQgC2tltq+SoQ2/xG3eBbUoI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx12ZMCC4fDyc8TlK3fUERHaGSkUhrQ108N8mnViXjsZ9eVBWBe
	InFNoQt6U5nt7MsjsteHM0HUCh76DHhzVyYbC9oGZOwMj1b11Fur+OuDXp25mNbXViBtUAGf2vN
	pHBaipf9cxq5VRIyC8C49/O+oBhKb0fcV1Ly/v6PZElIjGaXFUETlAbTCVpe5uZg=
X-Gm-Gg: ASbGnct/S1F/JUWEVNJjU4julfQpgyBGahV3hz+FIYCCkREymiAbupi+D5f9y0Min/1
	qEfG9kk6u8en03UFfeqdbEKs8PgB7Us5n7GxZyvymiMB/PN8xzTbixW8fqaxftBi95txrTBnxhJ
	jMOJdMPmvUsOCDRNSfZTFwnmAQOMVETGZ8mKicy23tZZFjPaGUfvteyycaMaenAPZCn4roJvysa
	Hhd5Uhw8IBTSQHA4l+FxcRz6C/jL0N/hZz7RVERV6cBelfjONEeVudYcSHXRuZzM3V9t6JUk+uE
	8Vdsjic6EJXgNSEKYU16JXIQYinoq6fkEy5AjVD/LUNDFFeVE3OvxScZ883+pg9OMQG1rxmG20W
	t8LbU0wQ/Zxw=
X-Received: by 2002:a05:6830:3983:b0:727:3b06:112 with SMTP id 46e09a7af769-72e86333d66mr8432574a34.14.1744680121750;
        Mon, 14 Apr 2025 18:22:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKyq/JJ4XB/niEL2I2IT01SbdVjsgNXx9opVbaH/ofnEdKGTQh52MiXugmOfT7yWKsazPSVg==
X-Received: by 2002:a05:6830:3983:b0:727:3b06:112 with SMTP id 46e09a7af769-72e86333d66mr8432563a34.14.1744680121477;
        Mon, 14 Apr 2025 18:22:01 -0700 (PDT)
Received: from [192.168.86.65] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d0968e090esm2652538fac.6.2025.04.14.18.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 18:22:01 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 20:21:54 -0500
Subject: [PATCH v7 5/6] usb: dwc3: qcom: Don't rely on drvdata during probe
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250414-dwc3-refactor-v7-5-f015b358722d@oss.qualcomm.com>
References: <20250414-dwc3-refactor-v7-0-f015b358722d@oss.qualcomm.com>
In-Reply-To: <20250414-dwc3-refactor-v7-0-f015b358722d@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Saravana Kannan <saravanak@google.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.li@nxp.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3207;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=QRDCi8fa98QdM0s7BUua2ql+G87colRiQfhXndES9dg=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBn/bSzs8OlOQ6WGukci1vVUPKNOwhwamS5k/LgY
 Fbeav+9St2JAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZ/20sxUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcU33g/8DPnT4Rrq0IRaDlLbE+ZGniYUMFtdEw1mt91ReRQ
 hMozN5dl5B42XkfeSnMIo+7CmKv+0zfvYDfz2IqGcJhpUXJNVpRAXkJTlMxg5ZrRyW+Z0PF6ClM
 p6t4dCi8vR1deU1OnzUMTE+5tyxQ0yBYNVAmmv6h1flgPjmO20peZTuah7ikmWEcl34Ghr4QfUb
 j89rBXfEoi/xRUlx9XDCLmyILSIOu9yYVbcf0XriqEnXlPGiPNmZJQptdxb97163ziU7LdExhEe
 nT7/WLQOXcxWUiwYRr0prnwBSLXybs4dBgNanpiC9ZjeApgsXII6k84eCHf3Lmd+kFlgq9FOh5B
 yIJroe8w9uen2W8KpcpKVZ1/7y5ruXFETkIvImt/Nf0wT4IRqjyr5Tji/nhFFQKrQV7lCW57T+1
 3GBeNG3uvOhxMyd7fYvdqKRsclklpf1lei7L/1tqb9j6zHo8gJyHHr2QQCgdSjfX+5uJCVRR5yO
 IWDmuPPgJnlPrREKw6b0CAVxmBQRys/QsDuYlx+bUMyuUtZE1F2d5WvKC5Az6Eel/+YJM/EByHx
 wIJJ5ZAlXdlsYAIlxkPyz/RML9nDMtuznN8UyNF/obnYPdm9d22S2Iq95kcn6Va4u8jt+RB1NvZ
 LmRRxZavCJEqP2Z3dt16fbEky+d0NaEkdCinqUtaeauI=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-ORIG-GUID: AfZ8EUm72xy567tsfZx6gG4HkAWrMPD8
X-Authority-Analysis: v=2.4 cv=C7DpyRP+ c=1 sm=1 tr=0 ts=67fdb4ba cx=c_pps a=OI0sxtj7PyCX9F1bxD/puw==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=jIQo8A4GAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=0UB9HjPGtwcCTtCM8zIA:9
 a=QEXdDO2ut3YA:10 a=Z1Yy7GAxqfX1iEi80vsk:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: AfZ8EUm72xy567tsfZx6gG4HkAWrMPD8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150005

With the upcoming transition to a model where DWC3 core and glue operate
on a single struct device the drvdata datatype will change to be owned
by the core.

The drvdata is however used by the Qualcomm DWC3 glue to pass the qcom
glue context around before the core is allocated.

Remove this problem, and clean up the code, by passing the dwc3_qcom
struct around during probe, instead of acquiring it from the drvdata.

Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 79f3600f25c41a5ed770f164a03c7dc424b01440..9d04c2457433bd6bcd96c445f59d7f2a3c6fdf24 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -547,9 +547,10 @@ static int dwc3_qcom_request_irq(struct dwc3_qcom *qcom, int irq,
 	return ret;
 }
 
-static int dwc3_qcom_setup_port_irq(struct platform_device *pdev, int port_index, bool is_multiport)
+static int dwc3_qcom_setup_port_irq(struct dwc3_qcom *qcom,
+				    struct platform_device *pdev,
+				    int port_index, bool is_multiport)
 {
-	struct dwc3_qcom *qcom = platform_get_drvdata(pdev);
 	const char *irq_name;
 	int irq;
 	int ret;
@@ -634,9 +635,8 @@ static int dwc3_qcom_find_num_ports(struct platform_device *pdev)
 	return DWC3_QCOM_MAX_PORTS;
 }
 
-static int dwc3_qcom_setup_irq(struct platform_device *pdev)
+static int dwc3_qcom_setup_irq(struct dwc3_qcom *qcom, struct platform_device *pdev)
 {
-	struct dwc3_qcom *qcom = platform_get_drvdata(pdev);
 	bool is_multiport;
 	int ret;
 	int i;
@@ -645,7 +645,7 @@ static int dwc3_qcom_setup_irq(struct platform_device *pdev)
 	is_multiport = (qcom->num_ports > 1);
 
 	for (i = 0; i < qcom->num_ports; i++) {
-		ret = dwc3_qcom_setup_port_irq(pdev, i, is_multiport);
+		ret = dwc3_qcom_setup_port_irq(qcom, pdev, i, is_multiport);
 		if (ret)
 			return ret;
 	}
@@ -700,9 +700,8 @@ static int dwc3_qcom_clk_init(struct dwc3_qcom *qcom, int count)
 	return 0;
 }
 
-static int dwc3_qcom_of_register_core(struct platform_device *pdev)
+static int dwc3_qcom_of_register_core(struct dwc3_qcom *qcom, struct platform_device *pdev)
 {
-	struct dwc3_qcom	*qcom = platform_get_drvdata(pdev);
 	struct device_node	*np = pdev->dev.of_node;
 	struct device		*dev = &pdev->dev;
 	int			ret;
@@ -778,7 +777,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 		goto clk_disable;
 	}
 
-	ret = dwc3_qcom_setup_irq(pdev);
+	ret = dwc3_qcom_setup_irq(qcom, pdev);
 	if (ret) {
 		dev_err(dev, "failed to setup IRQs, err=%d\n", ret);
 		goto clk_disable;
@@ -793,7 +792,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	if (ignore_pipe_clk)
 		dwc3_qcom_select_utmi_clk(qcom);
 
-	ret = dwc3_qcom_of_register_core(pdev);
+	ret = dwc3_qcom_of_register_core(qcom, pdev);
 	if (ret) {
 		dev_err(dev, "failed to register DWC3 Core, err=%d\n", ret);
 		goto clk_disable;

-- 
2.49.0

