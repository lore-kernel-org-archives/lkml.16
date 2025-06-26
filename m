Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C0C19066B
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 03:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750908241; cv=none; b=Wm1RYFvHGsCQ54z1fuMhg8IjYakXsI4bfnPXW/CN2yUN66YhYrMDfz5aJ8dMH6uYczxOdO0TwyAK+4co4s9etwiVNQmvlo18MGV0ZC5sF9mBUTHH/TKlzVGMRLJvDMWPY3FSIm6qPUve/M+VsYLeuQsj9ZZfK4ct5V02GH9Uf9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750908241; c=relaxed/simple;
	bh=4cZL5m0fi6pYkpB3smure4wTTo0rjn9MDGXy/ojxNMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZBzbyDolDE0wDo4NYyPpJ8TeDdtZcU7wDPiLMj8laRCOqP9jp1uHyj87q6WkJbs02xc5/TnMCTDAZf6Iz8j398n9vD8TLr0hBldzYMDKKz3ZQ62e5SV+iuyVwDv9fmTiTan4PTH0W6+HWm0YfSOOfjwH4XcDwJQCR6QenhSOZek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y3l+l15z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y3l+l15z"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q0DtuS014018
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 03:23:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iHO4cPBPi6QXyuNuOk+ikb8O
	PtWItnVRmKUe4/LVP5g=; b=Y3l+l15zybkwv2XsA6oRduAcAx1RWNTtRBvu3Qs5
	yYpXSuhnxVHufZI/5p+7jwNbIBOI+kwQR9OA86AiRo41IVws2yto6YfQKiI5jE1e
	SoyFiJoGMB8nQjzB3nAkmVOziMO8RPac7AwmTxGznn8eFP9+fufgA5Yk5Vd4ijL3
	xoFBpr5Hbl1PbG3nJdbWZLRh81Xvf+Qys7My1Ao+5ezX+7B12EB2bdmzD4qpv8Qi
	NI1hctYWKFsMpYqi51ZkEJ4LthZ6AYXaiO/CbGxmbHgbI2CcqzXqF5d7pGlOakFf
	gbZAT4/Q8EJ0Bicz6VRZDw48NivqUGr5bwYPH6D0BAa90A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bghu6y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 03:23:58 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-315b60c19d4so398375a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 20:23:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750908237; x=1751513037;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iHO4cPBPi6QXyuNuOk+ikb8OPtWItnVRmKUe4/LVP5g=;
        b=eNHbW+BeGydSI8hX/Xp/4boFRLt55eeRd8VUinll54WtoH5IUnfiZrFN/Ur2CfFqAS
         D0E8xTswIBSkSCkjs4f+t3u98dXqf2j9ERW0mZowMnHSqT8lONM/37xqW3tyuwk5fBfS
         PF6izzYd/j1eN8g9hstXA873gIrBsCMCeAIgD3xlv/ZDrOOoS398MqZIyZseZTaJeb2d
         CcBI6fUgNy0Z4vALEKlyt1JaqoGlxvmSSK3JmThlU6+ZqICmwUfWtWkg8+FAml9MnABG
         bLY1dtuKpHLXdRMBEiCPrzOuXIUqah9/PmLarZ+vYZTslle/TtcH9IIyDLVg67cNVfsk
         hIPA==
X-Forwarded-Encrypted: i=1; AJvYcCX9TCY9Ny331U6FvZ9gdafmO8UCofK4kQWxOjPyDM0sKMQnwHjecvqOgjCCCl1wsW486wok9ZfNmTCCXa8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiI8a6SspqomrftW8HslzvBPf5AetycBszXIZ3PO7sd2S9fC1a
	dt10mhHSTU/dyd1cwYLUp+rwnqsaHzjnGnKsC5xpDRlka7UMp4YUbax1R1XY3B5vSYwg6nRCByj
	qe5On9G69nIo8Jv++QfouYh4P4qsDYtDq+01Hm6dvijQ9ZR8vbue06jPJM9R6GSVT144=
X-Gm-Gg: ASbGncv0U07zXiJNkl8iba5erSMzj11cKeSDpd63/QVGOAYK6uIg3FxGe0N14ALkeNj
	Huop2JZnC9/o30GENvc6B/aX1Vj+kHfnbXUXjJTMMezS1O27zPng5ugjwSYI6i2yoRJRSZ4TkdN
	FwWlG7SIwos5cncdUs0MLefR9WC2qgZtGniNiZdBHD4Z98QrKD1a5S5W8HzPoOL5AuZt8V4c0JV
	iEhEnKKffGk4w9MWeFHmJ6uH175HPOjiKym8/YobYQzI9fQicE8Ung2CljYqzpqUhgXIgnSoEQB
	1hE9R+B1gbZ2H8zA24ORW9zGkMWmyEFgSTGkSt2qsFQkitvCmxG4aBHbIMdgd7jpW7jPKplTIeT
	0QY6M4A==
X-Received: by 2002:a17:90b:5289:b0:313:283e:e881 with SMTP id 98e67ed59e1d1-315f26192d3mr8258425a91.11.1750908236757;
        Wed, 25 Jun 2025 20:23:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvA6/NCpre8js6srhPlONrx+oYV2+s2CBJT/r1ftSbnYBlogNLy2rulOhsKFYvLC2y+nWQ4w==
X-Received: by 2002:a17:90b:5289:b0:313:283e:e881 with SMTP id 98e67ed59e1d1-315f26192d3mr8258383a91.11.1750908236372;
        Wed, 25 Jun 2025 20:23:56 -0700 (PDT)
Received: from hu-bjorande-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237eec29a77sm104417735ad.165.2025.06.25.20.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 20:23:55 -0700 (PDT)
Date: Wed, 25 Jun 2025 20:23:53 -0700
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
To: Umang Chheda <umang.chheda@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, Rakesh Kota <quic_kotarake@quicinc.com>,
        Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>,
        Swati Agarwal <quic_swatagar@quicinc.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add support for QCS8275 IQ8 EVK
Message-ID: <aFy9Sc3zVjBB/8J0@hu-bjorande-lv.qualcomm.com>
References: <20250623130420.3981916-1-umang.chheda@oss.qualcomm.com>
 <20250623130420.3981916-3-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623130420.3981916-3-umang.chheda@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: F8-_Etj-Wy6MwUD6ncFQb3B5cLpc89Cp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDAyNCBTYWx0ZWRfX+HaBAt9xc/TC
 AedEanbtAA6snTgWEaPGj0zecACY8HvfwaIElSLNqW1xXMjOARRX0G57f6UZ3fPbXFF9Ku38UDq
 NJi/+o5YwQb65lknUF2ErTVy0oD7llPoR1SDZrlG/LdUfRkNy+jwvcBe2EpgLjVoDe3bWyG7Sok
 57SDaD7hDOv+NJ6iDpK0l3C2NpJeSSA0UvQ1flyUbv6YaybOvP5ufL+BJuFKgaIi5f5trTJqKzq
 uHw5JqgPJyQA4PcRxjuuVl13aKWa/Ovob8s7IeIMXPeJ9IRIOJGkAxVmrDF9n7RMp3vtJrq4x4J
 0+OG5KTjOFaEXuENktuJ9ciZbPHgeJXvgXAAbTKxT04J3KeQNZyERPuFYnbD2CGZYwSYSSmctsn
 lJQtuCG4o8VsTA7RrpPHBILzHv1+4O0pj4CB/qwicTeMjJ10XgMT9Cq1LnIpzQuGXYZWkqhj
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685cbd4e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=8oMBkfkOGdP1-hdLSIMA:9 a=CjuIK1q_8ugA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: F8-_Etj-Wy6MwUD6ncFQb3B5cLpc89Cp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_02,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260024

On Mon, Jun 23, 2025 at 06:34:20PM +0530, Umang Chheda wrote:
> Add initial device tree support for IQ-8275-EVK board,
> based on Qualcomm's QCS8275 SOC.
> 
> Implement basic features like DSPs, UFS and 'booting to shell'
> with uart console.
> 
> Co-developed-by: Rakesh Kota <quic_kotarake@quicinc.com>
> Signed-off-by: Rakesh Kota <quic_kotarake@quicinc.com>
> Co-developed-by: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
> Signed-off-by: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
> Co-developed-by: Swati Agarwal <quic_swatagar@quicinc.com>
> Signed-off-by: Swati Agarwal <quic_swatagar@quicinc.com>
> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../boot/dts/qcom/qcs8275-iq-8275-evk.dts     | 241 ++++++++++++++++++
>  2 files changed, 242 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs8275-iq-8275-evk.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 669b888b27a1..417d8c9be4e2 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -122,6 +122,7 @@ qcs6490-rb3gen2-industrial-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2
>  
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-industrial-mezzanine.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-vision-mezzanine.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs8275-iq-8275-evk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
> diff --git a/arch/arm64/boot/dts/qcom/qcs8275-iq-8275-evk.dts b/arch/arm64/boot/dts/qcom/qcs8275-iq-8275-evk.dts
> new file mode 100644
> index 000000000000..b17ddb3ef721
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs8275-iq-8275-evk.dts

Please prefix new Monaco-based boards monaco-.

As with the compatible, would monaco-evk.dts be sufficiently unique?

> @@ -0,0 +1,241 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +
> +#include "qcs8300.dtsi"
> +
> +/ {
> +	model = "Qualcomm Technologies, Inc. IQ 8275 EVK";

The model looks okay.

> +	compatible = "qcom,qcs8275-iq-8275-evk", "qcom,qcs8275", "qcom,qcs8300";

Please update this according to the bindings update.

Regards,
Bjorn
