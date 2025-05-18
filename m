Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5841CCEE0
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 07:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747554838; cv=none; b=hppeyM5xjdXQJfaHtj7ZIH3Y1sLCp1K91voZPrg1qEEjFFILKVEocEVxHC+dIyw7XamqMlvG1q1m12TTRC+Xa0ffbvn+JONibWVfmhnmbdnLVBMhjVFwmFe2a5sFAODb1tQiRFZnZ8GvIw6Y999mFTW/oYqCBswlsKDL5s/+1jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747554838; c=relaxed/simple;
	bh=Gd55qKkP2RAyQotoXpy3bz9qZf9+eboVp2M8Dx2fBqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kCgYqpLxB3uzr6pEtoMagiA7l5ypM/Ia7XOmJO1ZNXtJ/fHj2AjIHn3uHTN+nVhEDodPs6fi1Ag2x1hZ3VFDeeTA8C5bj96Zc7MwyC60cr3NQcn3kzfZ8uNDZlCVA0y67cB425R+W+dAetllx1KaafEzSTRWQoWu3iZiR5ZB8zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pmdf0UZn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pmdf0UZn"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I6Pwok009208
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 07:53:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NCH+kNpv+MTmqfuSvretGbKV
	gr9iuqAvqLCjN+G0eSM=; b=Pmdf0UZnmApJ+osE1qrPh+6i2oxrv7k/OGaB4DfS
	LBshRMH9KLDA6Mz0owk9OjgLbWxaaabLEl5GSn5paes52lUAXpDGqvcTL6V+rV9S
	cfRlLrrrqYAF6PoH1XywYC0Q08OJHl/PUaimVkPfaWR211WallK7Xp8yI3v4skFg
	4+nwvzsHTmcQq+IpPs+4lSyZZdGkPJmOUU//CaN1jdm8Ke1w1+DIFIdLq5X74LzD
	IwP7UVNN4wUeBgBhk6WQJfOwRktGP+N5bBS3ojrSH8jEFWe28F5/TOHITRmht8Ip
	aAkXm65Dye9RELxL2hvglDEBIkoqj+Tj3szc1gmkgf/eIg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjp31pfh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 07:53:54 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f53913e2b6so53187846d6.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 00:53:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747554833; x=1748159633;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NCH+kNpv+MTmqfuSvretGbKVgr9iuqAvqLCjN+G0eSM=;
        b=F44npv8qtRa8w+dMk/fRwzCd5xZygAt6PcT0ebjouS4sgZy4ILC0fY632zKYVlqvZD
         jZtRe1g28JIxGGaifRwZay7Zm3UCrbv3hjfYPV84J+2VICjj2OiYDMbhwcy6y+hCFHbV
         4uMUAIYGMZib+Y8Zvmadq+9Rgjza9Hj5VmrzUYK5GPDMLUs6nYAMcwgrYddiJlEwj1g5
         IaHm4IM8+l9vg8waQaS0D9MzL46iz5qsE//eGhsPAo4UrWOeL2QArPRzFffWvuZhd4/D
         3Rc1NNeNz5rD6sWrCQCkG+9fCx4zDF6R/uxPbFShmfQp85LfCTIQb8E9iMgAwPj6DIV7
         ynog==
X-Forwarded-Encrypted: i=1; AJvYcCWPDCk/6ISgYK8EDMPifL5T4zclckKUeK/USaqsKuqX0JRYXwBN8vRvDMdoADO+mJhn0SrdT8X6+2GtOZg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5S/glBknbZmXu4o4AVTNPxErrptg9Of6+4uV007HUlVDawP9X
	vsj/2qhQDjueKqNNI6zde6lJMMQOsE8+snhzhNa/e9da5iJXMvG7EPRBAyt/oVHtkBlL8auyPpT
	QgJCHyB0X/5zr+gp+CRB7gv31XzPOhbSOCcXhuN6vtvcd5+aw+qsV+1xVZEjotH3Be2s=
X-Gm-Gg: ASbGncuh9cmcSjXZppIVw4dvL3d5wUP6uoP9cGYUoBLX6/c2GXZ+sFrJB+wRCn/zOZN
	qRdZl13Ddnw2EVk4h2QC/VnIJIanulffPmSUfI7EaK1vCYk2JjhbC6x2EhaBpKSbMgnGHTX4Ogx
	rm/VRDtmzS+cfEPMsdweboWvwOZMQyg83kY+z/6/8acNIcg1DeFvMZSY8nVnwbOFgv/QWOSG3va
	OnZEbEjSWmzlmR4ZBKZHCaDqIZFerpeEVsSuUWw+kw2CWzsDilckQhGe1OE1raUuIE2ztlbrfU6
	AVxA/SjSbIqgMz9ZQPziQmGOn39u5TDfQ+Oww8lFDHYqxsaOGXn2EFaVuGq5PqPJF0akS0BR6AU
	=
X-Received: by 2002:ad4:5f8e:0:b0:6ef:3de:5ff7 with SMTP id 6a1803df08f44-6f8b0866722mr157539876d6.15.1747554833474;
        Sun, 18 May 2025 00:53:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5UQa6GtkbtnH1jyMstQjulp/q5Zi30s8N50lryqhsEDLJ9mabwv/z0hxlSz4ENs+TLfPPyQ==
X-Received: by 2002:ad4:5f8e:0:b0:6ef:3de:5ff7 with SMTP id 6a1803df08f44-6f8b0866722mr157539606d6.15.1747554833090;
        Sun, 18 May 2025 00:53:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f161ecsm1331272e87.43.2025.05.18.00.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 00:53:52 -0700 (PDT)
Date: Sun, 18 May 2025 10:53:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wenmeng Liu <quic_wenmliu@quicinc.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: media: Add qcom,qcs615-camss binding
Message-ID: <rgomihkry7flm3kjbd766itt6lvi7shr7w65q5iujkin7ermkh@dcfd5v76fmv3>
References: <20250518-qcs615_camss-v1-0-12723e26ea3e@quicinc.com>
 <20250518-qcs615_camss-v1-1-12723e26ea3e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250518-qcs615_camss-v1-1-12723e26ea3e@quicinc.com>
X-Authority-Analysis: v=2.4 cv=B8u50PtM c=1 sm=1 tr=0 ts=68299212 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=PrroZY9GjRLnrjcbjksA:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: KxQsCd7Tp-_8X91moRAQBC2rfiLxid9o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDA3MyBTYWx0ZWRfX40TLvdJDq+LY
 GkCtT55bvolRFQctsnzcLHankFZw1MhpM38/XY92I2sQuJ0+M6Yjsp88TYHppO/MI6J5TtxTRGo
 3wsU4Y1SBpSwDAF78LT7jpbEz2lX3EiGp+qCx2aHia4w6zxYT+6uwipqUsrtUxaPwnHUsQaEeNG
 7lmhuKmFMe1J8ody5mmBDSu3lOeUGKUks//Gu7e8T158UJnOQ8t2raPhkgQ599TXw7pdJb4D+Xp
 tQpc1RUsIz5yzeOil8EqqwpC5s65R13wP/YzuxzDYStVwk1CV0lKveYSS9wTBN5RGWOdUcI0l3f
 jpW4+e7HFB31iDDCigELS6ONhliJ+S7Ksa6VfFhojVEug4VtwI1TRbg3x4NuhE+6BPQRRjppeZM
 JDRJFXnazuUbF8sB/9Jc7u2wEaqK5oQxAENYPtwrXwLYxKoQ32sZl5Nl4WJBw807GxUdujME
X-Proofpoint-GUID: KxQsCd7Tp-_8X91moRAQBC2rfiLxid9o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 mlxlogscore=988 lowpriorityscore=0
 mlxscore=0 suspectscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180073

On Sun, May 18, 2025 at 02:33:07PM +0800, Wenmeng Liu wrote:
> Add bindings for qcom,qcs615-camss in order to support the camera
> subsystem for qcs615.
> 
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---
>  .../bindings/media/qcom,qcs615-camss.yaml          | 356 +++++++++++++++++++++
>  1 file changed, 356 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,qcs615-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcs615-camss.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..9a87243f88d4b739cc29033509878ae706d3017f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,qcs615-camss.yaml
> @@ -0,0 +1,356 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,qcs615-camss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm QCS615 Camera Subsystem (CAMSS)
> +

[...]

> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    #include <dt-bindings/clock/qcom,qcs615-camcc.h>
> +    #include <dt-bindings/clock/qcom,qcs615-gcc.h>

Could you please update internal guidelines: when adding support for new
hardware, don't use bindings for clock controllers, use ephemeral clocks
instead. See below.

> +    #include <dt-bindings/interconnect/qcom,icc.h>
> +    #include <dt-bindings/interconnect/qcom,qcs615-rpmh.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +
> +            clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +                     <&camcc CAM_CC_CPAS_AHB_CLK>,


So this can become <&camcc_camnoc_axi_clk>, <&camnoc_cpas_ahb_clk>, etc.

> +                     <&camcc CAM_CC_CPHY_RX_CLK_SRC>,

-- 
With best wishes
Dmitry
