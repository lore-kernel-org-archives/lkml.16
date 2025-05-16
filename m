Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B0B27FB09
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 21:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747431983; cv=none; b=dLkqFUwuKdbL08RPqBNkh9O42CHp69HQ/qr33FELyDSpuMPxgs5EvLzxpa28HDPltuqrmYxVcXKuScVWem5XIbb0HPpFqLQsgv1RE4JXv1BGay9a4bZPvGgKcURmV4Kp45zmgXdQSTlOJPVk34ao7K0+aNiwCXUAQpJQDjrJBeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747431983; c=relaxed/simple;
	bh=x1I+M96FVV0T2PrTxu+gkhm3WRV9mo0ojZ7qPCHoyq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dlp1LsgozIpNYKvZQWz4i3b7aF9Jld5TpXhFwBhVd7kef2APQYoNmvpagdJ2IoMCjkyOUkWSiG5Y9xuBDnv0wea5nxiX7DtMjZ0tOI9fj17t45MijKCJDqjzgLIteTbBlde6bscD7ZRRQUu9avFXslnDxNcE30/Ekg3TNsfZh9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gSr35TX2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gSr35TX2"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GCAwGe020821
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 21:46:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7UidEZPjEeJ9VoU45fGZNa28
	09KbmNCPYvA1jg+ao/A=; b=gSr35TX2DUCriTfVCEP/8y7/6vHFYfIckp3tU6x2
	8W1p6Q5adpuyAT90RMeneLN6sK+p8XjzueqLkxjviKFWn1pbhhy19cFDuz/zvK8j
	UUOyatHtaDybzJgfba49n24ExFzKT2bkM8r3f1319RhX5Z2iJ09ARkcQimn6vEtV
	EPo8zVx8XcQFr8ycGrarQqtzzNKn4gK9EiZOn/9Q630am0ebNnUhp9wXf0BYKxv9
	BDzG0sdWI+oxhN06fqGkEk9yvMnh131K5hpyEdDZAy/FBAv2/nwDYsmNqWDu6Gba
	uRZ/b0zCUg4ZBwALrltay44HBytj4EopWkJZ+86yuveRJw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbewb1kr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 21:46:19 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f0e2d30ab4so45433176d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 14:46:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747431979; x=1748036779;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7UidEZPjEeJ9VoU45fGZNa2809KbmNCPYvA1jg+ao/A=;
        b=Au6cD1DMWPP8DcahsgTKlUxdNzQN14eF4t5QfyQJ1sz5BQzRRIIFOwiWQsgZDzknar
         oxO/fvNDUgkHVqU272mbkaKtuPKrHotJHSfXMijualhscCWkKnQUsIMcoiEXQL0uZpFW
         7ZsB3Nexp5j1bAEGNM7xgJqCdt+K0aZQpdUYm+5M2lsB/MqfHk8FbDV54VMw1sdWe2L1
         h39LhT74yIGViSuT/1eu6+AVcByhXjM/oKF8M98J4mQjxJFCJWRu52ZgtVy3B+xMI/vp
         clKRdLlsG942A+BPgR8mBLcLD6c9kGNVulj3PGNLOWQLKjCx6g7a/bRFOyPcBZ+wJp3p
         rLnw==
X-Forwarded-Encrypted: i=1; AJvYcCVs0Ej3dkWEzW1qoT6Uu4hHfD0R1ZQcUmR4Ta9LbSZA4+tLN5v2vapIdXqtCgE+ILwcZQtUKI0D3PZjgow=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFnt59sTJgCAQ8aeP50v86YlDk4Uzw3CJCSUa23haqeqRlK4wL
	diLRwdnNrN0grU5a5xOLiaKq+zobbjTfv1TeW6Ccg5P2YaH7kXnDZlXgc+aybEwrRA17zyn/9MA
	JbSoAaq6GZw6J5139ipElPhXm/OgiiNbQgWiFcTG7tXwb/fbzoJI0ZWjWt6HNLfiUMKk=
X-Gm-Gg: ASbGnctXADPYldBsRnLJL0kcOHJxzLXduCmgmC/zJzVtj/Ylup7xZNvWhYmGzscMTPn
	7kJPkVsJ++tFFjpnNIkUIItbI4mw1o45AjheGVGN71XW0fclf+mui2CxYe4nILgC93r+BY1XcYe
	N4RR5b/Y7pOcqbfdhc4U+IfM23YmaGLp9YiqCPccr+irzUMeNVKxRlGrwACVNIGASHPdnLlaVC4
	W6Vcz6Q0gXML0iMGc7FOhXihjYV9X1x1kYIig4snzac6eXbgI5XrT8dowe3IgJKuCXE55YA1PWg
	rru5zA5g+I3qnT75rpJq0eWR1vY6IFJwvowuQvU0Z8sFZUlO8xA5OuYn2/yUuAVbz2uVm0KBuAU
	=
X-Received: by 2002:a05:6214:c61:b0:6f8:aec7:1cda with SMTP id 6a1803df08f44-6f8b0841c7amr69293796d6.17.1747431979136;
        Fri, 16 May 2025 14:46:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGojBHQjyJM43ToTT5NAh9CaVO/Niw4DHnezRiLcvv1wkMoOLml3xqYQOq2mXcSGzxB8vYymA==
X-Received: by 2002:a05:6214:c61:b0:6f8:aec7:1cda with SMTP id 6a1803df08f44-6f8b0841c7amr69293506d6.17.1747431978775;
        Fri, 16 May 2025 14:46:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f161ecsm598021e87.43.2025.05.16.14.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 14:46:17 -0700 (PDT)
Date: Sat, 17 May 2025 00:46:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8750: Add Soundwire nodes
Message-ID: <nr7sxs3bbacbrengxfnnmk2qpyajyazxkkzckcssm2ztbdsrdu@22w74cmrjf3r>
References: <20250424-sm8750-audio-part-2-v1-0-50133a0ec35f@linaro.org>
 <20250424-sm8750-audio-part-2-v1-1-50133a0ec35f@linaro.org>
 <e83b58ea-0124-4619-82a5-35134dc0a935@oss.qualcomm.com>
 <afda790f-0b5e-4569-a92b-904df936df85@linaro.org>
 <1a0be977-39b8-4089-a37e-dd378c03e476@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a0be977-39b8-4089-a37e-dd378c03e476@oss.qualcomm.com>
X-Proofpoint-GUID: Fptu7zX64mN2K6lDeNynnpeYwW-36WIP
X-Proofpoint-ORIG-GUID: Fptu7zX64mN2K6lDeNynnpeYwW-36WIP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDIxMiBTYWx0ZWRfX0YkGXKx+sJFV
 MdtNX/qliZRPkNfUtt3GPI9yGz3YEKrWxUj8zP9lw+XS1n0dPnQ7pkMLqAGzF8Isne0vZ6RTGa/
 STlgiL0xBFjOs0/Qb5eCUFdLv4C/Y9GGhNMykpSUzOcDECYg+yBOaJOaJGb2llFmS91mj4vc/rO
 ABMn4hmIZ649JKHcJi9FvlF2Ksrab/Xt04ybsPB3my8UOs0iUNMGJkZZNgME26GwTD1d3EcvrfC
 K3LAI42RbxK03HUDou1cY/YxBvck70caJ6GwgLOGeAeN2ZvTFzuksRsg2VoRAOXrtA2AvvAdH2a
 78ePjRyfGDU4+mS+rGpwfxySjJVQ1Gd7xCxlBz6zo+BM/m33e+Xl7AggRZcq2WLMtKthXkuVpl6
 rPWagRdT4+YXFIRyFHLMf6ABuddQOa4QyujVNuQQY8DTuXCYy8zO8UoFuwxeoWICPhkpdVW4
X-Authority-Analysis: v=2.4 cv=LOFmQIW9 c=1 sm=1 tr=0 ts=6827b22b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=dQ_4xI23x1PVSAzVniEA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_07,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=882 impostorscore=0 bulkscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160212

On Mon, May 12, 2025 at 09:38:01PM +0200, Konrad Dybcio wrote:
> On 5/8/25 12:37 PM, Krzysztof Kozlowski wrote:
> > On 25/04/2025 11:24, Konrad Dybcio wrote:
> >> On 4/24/25 11:40 AM, Krzysztof Kozlowski wrote:
> >>> Add Soundwire controllers on SM8750, fully compatible with earlier
> >>> SM8650 generation.
> >>>
> >>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>> ---
> >>>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 122 +++++++++++++++++++++++++++++++++++
> >>>  1 file changed, 122 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> >>> index 149d2ed17641a085d510f3a8eab5a96304787f0c..1e7aa25c675e76ce6aa571e04d7117b8c2ab25f8 100644
> >>> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> >>> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> >>> @@ -2257,6 +2257,36 @@ lpass_wsa2macro: codec@6aa0000 {
> >>>  			#sound-dai-cells = <1>;
> >>>  		};
> >>>  
> >>> +		swr3: soundwire@6ab0000 {
> >>> +			compatible = "qcom,soundwire-v2.0.0";
> >>
> >> They're v2.1.0, same on 8650, there's a number of new registers
> > 
> > Sorry, but no. This the "generic" compatible and it is correct. Devices
> > expose versions, which is perfectly usable, thus changing compatible to
> > different one is not useful. We could go with soc specific compatibles
> > and new generic one, but what would that solve? This one is generic
> > enough - the device is compatible with v2.0.
> 
> Well, I'd expect a "2.1.0", "2.0.0" fallback there..

+1. I think there should be a version-specific entry in addition to the
fallback.

-- 
With best wishes
Dmitry
