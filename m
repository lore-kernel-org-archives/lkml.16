Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595E128FFE6
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 13:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749044436; cv=none; b=RRSyUaDpYcjELMCJEc1G6To0gUUPty6uKfxqXnlqtVAQZg0XFDaFaj29fwaBymA67H7EYeHCEs1BrwjFe4w0uWiKfJgEQasgNvKT7BGrBYK95Rq9gan8bPGpeeIDes3CGXINn+1vNKF+USuXAxj5K31Imes4sg6GYTShUEeURBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749044436; c=relaxed/simple;
	bh=7u/4WQVJV6Q1LUX42Cje1CNsKlezzEWMHTw7z3WPsYU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uOYoBS822qKBuryYv2ec1Sqc4Ywp+xRthRKPEtXOVCtjFS0cMwS4EpLVlUoGBy/w99VvHM6P20LCA5OKQ7IEKLp58IsbIM3n7HOjVwH+XWwk7ij0Bj/xANGhRU5ct3nR1iFd+8KeI+uGWovDvaReF8PEn9fyUxRHNS0ZPamGKqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GQmiL6DG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GQmiL6DG"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 554AhdK1022400
	for <linux-kernel@vger.kernel.org>; Wed, 4 Jun 2025 13:40:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YBg9q0cvHs6bBUW3z+GWBUixT2+oyHe0R+AnONY1DwU=; b=GQmiL6DGk/SNrXwo
	PRnFeaxnyN9WWKQRFRUlx6Lws8DgRvjN4egTrmsCIjS7TAdKyY6s3sdeFdvsZRul
	jszQl9l3SqntxnljW91cMqRkNEtPddtxa9mp5afXqiFbOWNP5XcxtIQzoqfyAKVo
	+7I0HDko3m59f+qXUXeWOUboB4QYuwgNIkTwBiCMJFDTPxag3CE3CFZm+SD6oIIc
	1eN6zNePR9y8umojS60FGsUa9ypchOKq86lDsvReGXl9fdUOq5l16xsc9UAARtDe
	u4+ICVbNut0c76Qj8QeOruIzdQCoN01BZ4yAfQjXkugHweaS5p/ireqLs44K2GWb
	TEM3/g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 472mn00ej6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 13:40:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5e28d0cc0so1051572785a.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 06:40:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749044433; x=1749649233;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YBg9q0cvHs6bBUW3z+GWBUixT2+oyHe0R+AnONY1DwU=;
        b=Lq9r25X+hTUgnMZjbhcFSFTafLRrekRD0i1MloZuB6QqMmWyBlgfNahTSEwdoxEMe8
         p6xOlH/nIpN2wDmYILR7A3tq1kieuWYY3a/ZgYFItnvocEDIEKn7fKpVdB8XzLYnFO8w
         BS5dh1NN4/ncnS3NKubpIzW6tZW9MshECiFe1QIZg92QFCXSfMnEb1X1I7vr0riEzC0E
         pD+jOQ/I9m9XQpLBNtKANKdhO9IzuQJ+kIWHirNhg53E5Q6on1w3ZBH6BkBlcdHlT4LO
         bBvcg8FGF05QXTFF+aykySYztGulLqXxSH9dZ8tevIFphnzzNllmszHgypV0HGcNN+E1
         JGCw==
X-Forwarded-Encrypted: i=1; AJvYcCUYqhR9b6bsTtjky/6iB8Abfe8HLcuMx4Yhizyb+78qnaPktIl8YpZm3n+suV2Ixi36Tl1uSkS5nkJl7F8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzemtU5M7tRhpbH/k/vgB4IISv71g+7h3hEXHdlQwBvj4/Cel0s
	EH+pBUvkWCIP8x/mLuOk75iML7T22MKYbRnQw44uOz9cODwy3d+VUNaMEZAhv39RBbC81iWB1Xl
	CE+fAAimTIge/c18mtdRwXGI+PTcMnqwOcIwgX0hS6aPwS+9fxiv7vuodXYcXuTGTMgE4RR1mj8
	ItOQ==
X-Gm-Gg: ASbGnctDRyxv2sEP+0saTsMhIAyvNV4KYQSXcRyzxWlaygkiizVB3gKxSRcOfDPHPFV
	B6dZ1FlWrTJTU96nSrRFK8fDBpcDqXS+R3SYrq6rmcKoDiFQ3TTuJr3LgC00oOkJaIjWAQoHAX1
	QL1PZhaT4ueq0U3WqjLEWjf19UDtp5TwtsmQQUfNjpbev6UuH+wyhdCVGUpxqeuyVY9V7bORdK5
	IMTVKBAMlXbclMo7CXaaoR7hdM9qUQw4IseFC23/JsssNypm+cuHbB7Y3hynIq0FGpKMXCCXbWe
	7HxpgA/udUaqnil+3iuMoV99HYsHBcBkMHnfU9QeoD40UhSEL8DbC68oAs8AiXThaYFy+08EwXw
	Zb6Ck6VkJOkb3kDgIYXxUxmtQ
X-Received: by 2002:a05:620a:4050:b0:7ca:de42:4ae5 with SMTP id af79cd13be357-7d21a8dd0e9mr391901685a.55.1749044433298;
        Wed, 04 Jun 2025 06:40:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgZhKgR7NcsV4gPQC4U7eu5LVKicEIGDkAGddV6FnPtO2Ourto5KqAILlFQpTBuMoKbS0SYA==
X-Received: by 2002:a05:620a:4050:b0:7ca:de42:4ae5 with SMTP id af79cd13be357-7d21a8dd0e9mr391897485a.55.1749044432931;
        Wed, 04 Jun 2025 06:40:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533787d376sm2311966e87.28.2025.06.04.06.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 06:40:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 04 Jun 2025 16:40:29 +0300
Subject: [PATCH 2/2] arm64: dts: qcom: rename qcs615.dtsi to sm6150.dtsi
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250604-qcs615-sm6150-v1-2-2f01fd46c365@oss.qualcomm.com>
References: <20250604-qcs615-sm6150-v1-0-2f01fd46c365@oss.qualcomm.com>
In-Reply-To: <20250604-qcs615-sm6150-v1-0-2f01fd46c365@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1527;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7u/4WQVJV6Q1LUX42Cje1CNsKlezzEWMHTw7z3WPsYU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoQEzNXkMSHwY0jitLtwQ0+uoITJ/85YMiujGcJ
 HJDAle6PTyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaEBMzQAKCRCLPIo+Aiko
 1bXbB/91MD2tZapdUU1GIwKguEd3U6jlN2ZEeEYIK8zwVlML/LAAr+Tem483yqFnkRBx0mExp4O
 jX88ZuZI7fNEmyOEMXfWcD3zrKTWhUiW5aRHnEx6nPK6oWjFrDncwFEzkuvYPePKegmDgB1f07i
 kY0hwhWp8zLclmzGHiU7e7sHTrnNzOMKp3tDQ4cIIKH2hBK58H2dHkSSZtRnwUbKPl2Vgkwt1LO
 ihscXU00+TGkxlQP97IzF7BfnCFYNpIPgKq0/l1+k8/PwJrOoOTeiMXhL2twEjEk8jreboF+hba
 ose4Q85w5lgNy21TLblskiO4acH7mW8TxPRz0dmOB8Bq0eiz
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 8zSey1tkzF17hQGrHhwKrcgrv__UjXxp
X-Proofpoint-GUID: 8zSey1tkzF17hQGrHhwKrcgrv__UjXxp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDEwMyBTYWx0ZWRfX0krHZ9iQa0EE
 8CU6IycVbndTNQSY9mo20110Hi9aan4MifEx71HcH5w5lbWv8eOADu/wJoWUM4B1ftfLz5iI6Bx
 Gq1Dx9sWT9Hs4bkmJ31+7c69C/bDQAfTBFvhvUe9/kF8HPa89w0cj5NUWhwwZlLrBpEtNCMxGjg
 /ma+JQtRxKv4kLIHCVOMK+1W4OHoGG0o9LCexTHguOkYPyzEczC3X+sWwbAKs5pyzhCcZsTdTIo
 U0So+rSJkTUKgVSoWLKdQa65ZWbPlMJ0WXOPl8mDEWd+Fpvc+9DoxIG9KvEqIMr1A2KqeGlcR6l
 wC9lhrpTE4aSuCjrACDBGYDAxXVjGGpz1fdI3HQnngjKue3JYwtrGjsks2UeoSybzGaX+pRI+t9
 rxJqeH+P2aUcBBlRQvN93rPtWPvMqg1p9dqG/FltDaDXNCr1afavUDMxyQQNen+toB+gU6+C
X-Authority-Analysis: v=2.4 cv=Y8/4sgeN c=1 sm=1 tr=0 ts=68404cd2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=F4Sl4XA9YrAWyvOGJFoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0 mlxlogscore=993 spamscore=0 phishscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506040103

The established practice is to have the base DTSI file named after the
base SoC name (see examples of qrb5165-rb5.dts vs sm8250.dtsi,
qrb2210-rb1.dts vs qcm2290.dtsi, qrb4210-rb2.dts vs sm4250.dtsi vs
sm6115.dtsi). Rename the SoC dtsi file accordingly and add "qcom,sm6150"
as a fallback compat string.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts              | 4 ++--
 arch/arm64/boot/dts/qcom/{qcs615.dtsi => sm6150.dtsi} | 0
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 2b5aa3c66867676bda59ff82b902b6e4974126f8..c8471a2c56c5be0713c1678b2dcc923d69296db1 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -7,11 +7,11 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <dt-bindings/gpio/gpio.h>
-#include "qcs615.dtsi"
+#include "sm6150.dtsi"
 #include "pm8150.dtsi"
 / {
 	model = "Qualcomm Technologies, Inc. QCS615 Ride";
-	compatible = "qcom,qcs615-ride", "qcom,qcs615";
+	compatible = "qcom,qcs615-ride", "qcom,qcs615", "qcom,sm6150";
 	chassis-type = "embedded";
 
 	aliases {
diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/sm6150.dtsi
similarity index 100%
rename from arch/arm64/boot/dts/qcom/qcs615.dtsi
rename to arch/arm64/boot/dts/qcom/sm6150.dtsi

-- 
2.39.5

