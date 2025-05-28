Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346B8253920
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 12:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748434481; cv=none; b=DT/nx6ut9jtcqyiPWjFrXWLbQM+WXfZX+p1IJsNfYPnVcVym492cz3qHObMwzk+tisi7ZZOiMPiGj/hRAXgeksBRSp3A0a02CxQwoyJHPpw4m4xLrs3TrPGb2e0GPKfEdP1RZzhuO5TdYEEsRfXJbjRkyHS4C0C638GnwC4gLv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748434481; c=relaxed/simple;
	bh=jYOPvF1Iu9M3uetpmwUkrikZ5IUGSU8JmbXp4kxQezU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GCA6xo5rIjcJiPNmHgVeOG5amsXyscjtHbQd6L/KvtfOkSyaG17WlvxRpeuvh4iNYV8B6nA9qcLZ5u1J/sZreWTXeK+6CM06UR2ukKhG5RDvM0ZlQa6638yukZOXdAwFJrSV1kamzvpUCgCmpuWzQtSUGposo0o8jJtscskmHao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OBe5zTmC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OBe5zTmC"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S9gnrC008607
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 12:14:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cjdekBqq9jQ1YXFhfk1E8WK4
	nJD05A+u1nrX/oJj5mo=; b=OBe5zTmCx9eNzb6Gr9pjOGgX4nz68VzF4PYfCXmb
	kpSlphATodbmzpK4/CcmXm9Ry/OB5hR90fIcgX6j1WoovJYM43uH1nX733aVpOQN
	Cq9cPEMS2NVqazTry1eX2iKI42IF5KOYjgz+IsesBw2FW7JekOVJ8BhuYYIEHT1p
	EiVFoQ4KHnUy6uI7KMqFJe+IjQCz+1plpvlL5/MLzg4wPFOsGIHzZaeDzVmD80EU
	jyHDUXcAXCKtCvZq2Jsy7jzeZc2De6XBjm3sTzq3JvHSBui/ACCfmv73YbCN712T
	SmCSMiVLwjIz+D4FPCgRGtqat5McrFV5FvRmWhpkaTgYJQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46x03mrbgg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 12:14:36 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6eeb5e86c5fso36998626d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 05:14:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748434476; x=1749039276;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cjdekBqq9jQ1YXFhfk1E8WK4nJD05A+u1nrX/oJj5mo=;
        b=ukJ4W11DXdnrg8qcje/4Dot0/gVePAXwyIHJpUB37gOjxqGumhUzmVUcMkDHouV77E
         WK49geSPVXJGefKhW6iIgXB6/0oDuFy/joEUAIr0dg0vFL2Bia1lNa/Dtf1qdUELHlkP
         ezXL+qygT1Y27c6OkmzmqucRqrQYgCar9V1+6waWiFl8SWpgt6zAgxPvW5yFQ/yg9kMe
         K/N2JjXcjtZBNjDMHN7QW0BDeRcLqyQ/jEUDVruC4JBmuQ67JonpfuAE15W/R3xXq+iL
         CWQ/3EpGtgU6DyHF0PkEzi41qe0+MFXcOCNrx4KT3pwb9oGEFAiknbCd/iLkm5BFXEI3
         8KTw==
X-Forwarded-Encrypted: i=1; AJvYcCUW2cHF8SzFzgiskztN5+6q0rswcOasfEvkqtGofXyhuD0KVHukZ3mG4C4uz3OSfKpeEnFc33zJ8lkzQ9Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTCnG5XPRKzogbLPxdgjDoM6GtFy6vakgC4J1bQjUpsaxvbUGy
	nuibZGW8fkd8mO5aj9U2z8fl2DvUnx80bksTJ3VzGFYofBoF25TuF2VwGEgBBPOqhuLuk+Q26T8
	9/dh1jHAuf8nQ9uM4YyoXUSOiXiKygfa01zcayckk8azsAKLaehM2+OwxOt7FNiovm5U=
X-Gm-Gg: ASbGncv4wCro0nFFLdBP71Plw0PhPDQusOa4fuCuJPZ9ExRYYEQgd5cYvKgozQEZmaz
	+Y9RHLnxlJ4690eweYxDIw8IPlvwBHxj2kfhtf6g/W88Zv8utOYUwxJHwW5AFYd2080o+59+kam
	w2I3QdlHzHajkf7OUx23Zi8FFhPNU2hhLaIhKTRghrqoAwlzAxzvjixvAnRx+mUYGsIVWqFsdHi
	06IoR7JSE7ab8ZS1iEsHJJmEadA+x1vCR4ra8lGYQKI74c5sXqbEMU7Mn0z7o3MSKdHJ7qygd9Q
	mMzJJRiqavqMWA/2fuwvVc2TTrWHmh2ioVMcjyHh958xLnUOf9FxV9q0hLglRq6W7M8ueFb1QVo
	=
X-Received: by 2002:a05:6214:21ce:b0:6fa:c2d5:b3a4 with SMTP id 6a1803df08f44-6fac2d5b470mr14194856d6.5.1748434476029;
        Wed, 28 May 2025 05:14:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2p2VwJWOXtJEGL/fYyqmZpdkmAOdMF5Qq25nUD3joqlGl9qIwB9aKQH/bANxFtWon8zcbtA==
X-Received: by 2002:a05:6214:21ce:b0:6fa:c2d5:b3a4 with SMTP id 6a1803df08f44-6fac2d5b470mr14194596d6.5.1748434475626;
        Wed, 28 May 2025 05:14:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a79eb688esm2323591fa.24.2025.05.28.05.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 05:14:34 -0700 (PDT)
Date: Wed, 28 May 2025 15:14:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Melody Olvera <melody.olvera@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v6 03/10] dt-bindings: usb: qcom,dwc3: Correct the SM8750
 compatible
Message-ID: <ari3245mwglxyelcpbct2dnclmp7xtgj6jwrkopb7t77rzdmio@zkpzkyzydig2>
References: <20250527-sm8750_usb_master-v6-0-d58de3b41d34@oss.qualcomm.com>
 <20250527-sm8750_usb_master-v6-3-d58de3b41d34@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527-sm8750_usb_master-v6-3-d58de3b41d34@oss.qualcomm.com>
X-Proofpoint-GUID: CeiGDfCI_PHrjwYCix6gSevQSNWq3xV7
X-Authority-Analysis: v=2.4 cv=FuAF/3rq c=1 sm=1 tr=0 ts=6836fe2c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=zrS0zEH8eRrj_hfGFQMA:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: CeiGDfCI_PHrjwYCix6gSevQSNWq3xV7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDEwNiBTYWx0ZWRfX1oKsslCvCBM7
 Lafe2h9iVexB85WHDy0SYuEhVBfmu4B2hqzF52FAlesaG3FZfZ3urP9VLmd4v1e9Tr5vgkDfpbi
 UEYmNqSXW2kTFvcIUeXFbe+nJs68dUxC80pjXpEMn2wtUBiDOn97/XxZddS66n9226wgb9T3aqF
 vVnxsh7SXUHUrtZrh9psF8DrW2gnE34aheiIrdP/jsJA2mrusf2JA/LZ032rqvmPzXCKjWm1gPy
 r0YdjlSSRmoKKNBU1MdTKlz6+ClWzHQwoIWAgCfK2lakDIQ9tY3/N1zYvQuOxEi8+JmWFbNzIBb
 eAZnMhdJHK1NiRRNqNgTqgPatdS85pu4ueiYqdy863yu1qFbMTKe2IZyfpgm4/yQgExVxRFAFN2
 9jZvhkDPDB+E8a6LLKM3SHLBVn5/iiSjj8GXPzosOpuqAf3E8rkCELkYKuzqoUEb00cpkYms
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_06,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 mlxlogscore=549 mlxscore=0 impostorscore=0
 bulkscore=0 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280106

On Tue, May 27, 2025 at 02:04:39PM -0700, Melody Olvera wrote:
> SM8750 does not require an XO clock in the dt as it is the
> parent of the TCSR refclk_src, so move the compatible to a section
> where the XO clock is not required.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> index a792434c59db2e6ba2b9b3b8498ca43f0f8d1ec4..298b1472ccbc4cfeb04927da29ea40b9883d03eb 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> @@ -227,6 +227,7 @@ allOf:
>                - qcom,sdx65-dwc3
>                - qcom,sdx75-dwc3
>                - qcom,sm6350-dwc3
> +              - qcom,sm8750-dwc3
>      then:
>        properties:
>          clocks:
> @@ -366,7 +367,6 @@ allOf:
>                - qcom,sm8450-dwc3
>                - qcom,sm8550-dwc3
>                - qcom,sm8650-dwc3

I can't stop but notice that SM8650 also uses TCSR clock as XO. Should
the clock also be dropped from DT?

> -              - qcom,sm8750-dwc3
>      then:
>        properties:
>          clocks:
> 
> -- 
> 2.48.1
> 

-- 
With best wishes
Dmitry
