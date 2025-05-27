Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA22271A6F
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 13:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748352580; cv=none; b=mH9QX9rvbNCS143DCjorpZv2PyS9w1USheWckYV/2bX/0O2J74d+BwLzAnZo7ZCtWi++pSpgNmlFnINQtoACwbULKsI77+P3HkSs+4yW2J7wnXkkvZQppxzkRVk1LllIV8/AFcs4Qm29ZorHRvGdYmEdZQa+hXR/GKdXFoseYNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748352580; c=relaxed/simple;
	bh=Z4hG6dLy58M3ypBKoscoxiNRoVM83F379RAX/Icdfzw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rocvwQaX4iCL8g0TUZRWiU5ajeJklST/GBI5BonUqjv7JyrXpcpZn2vjPFC+X7YLDgvIFsMWKkD2LLpaF8LQqlU+EypAqBnJN4OZiIc+hRWJQh0dOKh3/6kjfx7lZjNqr7B9fFwSuUwl04rzHUAlJLWu3nUq9QKnrfcubDOelqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FA+VwvNt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FA+VwvNt"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RAVW7b021465
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 13:29:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+nLYu+wMg03x4qWGhsYKPUqyKHolFLi+FxeCgip0yTg=; b=FA+VwvNtKWcELfNa
	T8ru1yPNfEy7lPyZb7rD50ofwf6qXuUxdPbIL1dM1cuUQphqvXdCwmKyMJQS0QzZ
	11SeEXYZZCeRSpAjWv1EMd+YSzWel6C/UVb9usBrkQRZu3e78EewPS6SvoZzTmlD
	bWYOUXCiFDp+yJR5psrR1Ax8pcsGou46BJHREj7h+b3ej/WE0V9hbnD/3Jji45kl
	HYuiqTU+rawOICeYNb88FjoyH/C9UWKLSEHE9CAzWLNcp6eM2XDydv8Nenx+wrBX
	snPCSnBAdG7yxAQOVhVy3X/QPV9Ni7uzho1v/0+MuB9a2Sxkh2mFCrgPjhSpO/t2
	7jtVZA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6g8y0nt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 13:29:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5841ae28eso95508285a.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 06:29:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748352576; x=1748957376;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+nLYu+wMg03x4qWGhsYKPUqyKHolFLi+FxeCgip0yTg=;
        b=LApDJGzLwRIJF45jiI4lbWHy6AslR8PRyk2lK1yPjGWF976QNqPqhfDUWs46QQuT+D
         yfjyA6BBVrOr6/2TbVO80roBgW8OErOzU0Q/uwdud8Ma3hmk9xr5C+NXXbBRKbCLKIH0
         9zKQEM+YzAWykfoXjsTxACUvB3jOFL11yM7egkc3dNhushoaaAg4jpEMCMMpGnrI8XZV
         rWpiEidGu4nLYmvIusRhltaTdiLXpQrdsak1DdGP1A2C86AtQDzZzm1Qzxy482X+TPOx
         pW0PXdnone3rA+KxS+NlV8jRJlWo3nhF7ROhAI66Uqfk9RgSB/ax/+YBuBokTSoAezPT
         H1Bg==
X-Forwarded-Encrypted: i=1; AJvYcCWAFYZwk4e6oPzfShrKCZS2ZWLOvgYEaVJxnK8DNq2RQP13J4mbbUyPFAqPWqsOSTMvwxCDZyk6pV3wO2Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOxag0Q3mnJJCJwQggV94cuLSUhY2hQwXViH1td4XcXvctm4CX
	ebyHfMK666nAqXU/g7rLU44o3eK8AIxbt6GmuWFvRHiLZDHOcUuXxjgnxEzRPaX5yYo7zX8uUEP
	fiGEhFlAnyktcIfvRXTCsFwPdGV9mrlXvVwhka5Vzr8kwcaIlNegSo0TF11Kyu9v2Bno=
X-Gm-Gg: ASbGncs/qT8ZgKhRIu6Bk1NhItYCk9vyTF+CeQaV1o2A7KZoDuH0/2qnGMaY2B6L67x
	yP7aueQzKN/s2D59KsfnWl40niBzGj74qjsWzXPOSl2qVxaEoVpU3hqCId9B98ouHfWj4ReeIwU
	9UmCAIjj2dWsY223loSuFYQuo9gRImoK0BE0qTP+v29orAMiRWnQ4L8uFAmMFFAOhgjJqEBDUk+
	b8BEBq43osBzA8oAaOhY95QlqukXj+xFwggdU2hGoDznjfGy+fs2G/uxcJFyrIKKm0QaE529vjT
	JYfNVjlFybjEBao/ujjvf6s81Ui5DdgiDsERkKNx71P0AURcvIiM43YCeF7r0hdVCg==
X-Received: by 2002:a05:620a:454e:b0:7c3:d798:e8ae with SMTP id af79cd13be357-7ceecb6a425mr768665685a.2.1748352576443;
        Tue, 27 May 2025 06:29:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvL3/h4CKWjsYo4zYcK3qlniWEG8qm5kJBzAEvqrF3kl0uS6pRHQdcd6tNdnQWOdi5guAA8Q==
X-Received: by 2002:a05:620a:454e:b0:7c3:d798:e8ae with SMTP id af79cd13be357-7ceecb6a425mr768663085a.2.1748352575802;
        Tue, 27 May 2025 06:29:35 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d278247sm1830992966b.76.2025.05.27.06.29.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 06:29:35 -0700 (PDT)
Message-ID: <056b38e0-851c-466b-b2d8-ac6c1dc504b5@oss.qualcomm.com>
Date: Tue, 27 May 2025 15:29:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: qcs9075-evk: Add sound card
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_pkumpatl@quicinc.com,
        kernel@oss.qualcomm.com
References: <20250525155356.2081362-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250525155356.2081362-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250525155356.2081362-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=6835be41 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=U3GCaaVbaVzPGH1JVgIA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: XuiXyrdl8Ur1ScDAsHFRLqeCRqSWqv3Q
X-Proofpoint-GUID: XuiXyrdl8Ur1ScDAsHFRLqeCRqSWqv3Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDEwOSBTYWx0ZWRfX1rGQo3eKCjKu
 QY7vgEsTHgrnKsCYkFste/c+fP9hK4nXG7u7YHbq3kuNWeNep1Bn3CKmK91Yd7fuO+MNLtx1ogy
 JTAifz+sSnkm33KJbMqXK4aNi4yxsKvxUueavmQ9y7aqJF73m6/8g+yJuSwLFIQyZt0j7iMEbZp
 uwOQIWYQ3AF794Cmsuw4794fA/ZFU/IYbEF/NOnNQySRqR4tSJv6JfheF8KtmyZ3PNjilQRLW8F
 G1iXIYOneIlLk8Ang4S8USHQNF2oqvkNFUNGx+qmfkogH/NjX4VpVsbA0VRWL9/1275yGyptlAU
 QsCmjlik9ShnsldgJfhGHag8IEjOdbdsr7OMdjklGEJKQAI0YFs+FfTNH+Uo2jzBid9aJbB5v3b
 RjfFFcSjbUX5fx6XJ+W0OuiGfpE1qFgriP3SYJH1gcPrlT009qCFZnLeenTOODcqVw7sfGAF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_06,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 mlxlogscore=900
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270109

On 5/25/25 5:53 PM, Mohammad Rafi Shaik wrote:
> Add the sound card node with tested playback over max98357a
> i2s speakers and i2s mic.
> 
> Introduce HS (High-Speed) MI2S pin control support.
> The I2S max98357a speaker is connected via HS0 and I2S
> microphones utilize the HS2 interface.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  .../boot/dts/qcom/qcs9075-iq-9075-evk.dts     | 52 +++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 14 +++++
>  2 files changed, 66 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts b/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
> index 0e44e0e6dbd4..1ebf42b0b10e 100644
> --- a/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
> @@ -6,6 +6,7 @@
>  
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include <dt-bindings/sound/qcom,q6afe.h>
>  
>  #include "qcs9075-som.dtsi"
>  
> @@ -20,6 +21,57 @@ aliases {
>  	chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
> +
> +	max98357a: audio-codec-0 {

no need for the -0 unless there's more than one

Konrad
