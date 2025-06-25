Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BD6282E1
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750851595; cv=none; b=FgGa8qH8IckMJDS4H+qpwkK3TmWIWiTNpsZn1miPVThfhwdWtv3dItXBzGAdBCMKGAbA1kpa3Q5AGY+2eXjMj9p8Q1G4oq97nc/kDdcqganeB8wrflzbHFAx1OO9IXicvDinhWmnMVpmxxrRnnQlJWOle4SmFzUfIIt+b72j/Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750851595; c=relaxed/simple;
	bh=C3JAMLbqJIpHXlQHI7FHWU33nNzthOTI2jHEkI8oJJ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=czyl42IQX9X1rEau7Z2KNFSY/NfzpIFvbrG7AacDGQA/Ixb99hVieI+84+ysnBgmZG/SrlapqK7AG+Yftw7z4vSzfEWhZU/JlqGxMXg5cB6OHaKiYtbSy7dLYu99sirndXnEHug7ibZSW+idPY74msofY9B3P6Vv0bux/DElaSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dtuawZ46; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dtuawZ46"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P3fT2S005791
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:39:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D/9kOiApQXYH8AwtMI7zEvaiwqs42vrGQZ099rTXvMA=; b=dtuawZ46TwaUfPPj
	dya5rvusbKlmKciCKyMBZ3czC27aqrvA+878dsSLIZKCgSQy2mWSmaMGUtVMq1tV
	mF/9siDnq1I0PA6rxmFfab+wa+bPMZm2TUkdGHm2RakDaGViJMebpxm9RCnUi1YN
	vxsnaTVe4fYB8rftWcC5++0d5bOPhH36COoHiIsNRYAzlqUa8HQdq5eQnlermD+Q
	+VM2VBBum9TDrB7gJ62pbRQPJjs9obgQ+/8JSDRyRjlB6GjjP8tQtAQ8S4Xrocz6
	o+6AXBFEWWxkHmgkpUXah557wRpNQLv1OAIcLtWsKoaAcXF/QDA0Itf75TMdx78V
	udox/g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgfqtm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:39:52 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6facbe71504so13097106d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 04:39:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750851592; x=1751456392;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D/9kOiApQXYH8AwtMI7zEvaiwqs42vrGQZ099rTXvMA=;
        b=UX+Xrvc468S0NfSmjoDpjJbDBgghAzuQNdmGoWSQXwfKnUwRQ7rKmc1IVuZKpB1fVj
         C4Mc4jlQNf8wwyNzqUUvIBq5nG3xw/x5vEShIvUE8LV6+IBijVOmJhVSzz0vu792nT4s
         /HObW2b89KkoV0qkkZYpzpPHZIhI9nXPchQTNL3e8TlIu8BS43jhAbRraqkZUj3sJWGJ
         YgpLrVm9JhoRLTI7EMSq0zqgRgYJ3lFPe4HKjn5K0eLyDf2UP8BUanKANvcG9QbQiycV
         4mIeYBYmjfLBiJ0b6iM+UgHv7PFDlQRaaMnpPU3BIYrYW+gfOhkHhW5hAbVRGe0fNpHW
         7R7A==
X-Forwarded-Encrypted: i=1; AJvYcCXXB4xskN8RI8Dvs663w1AViRR0fuiMcQ7aLsg452+hooXfz6opEQsgFrokVZdP+AUNkOW4DGEEhTOFEYE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlXYGNKO4iItxRjMpJPIfz/yqlhmteK9dfBzAIaxLEb1z1IXJb
	gfE0swKpliEoyUg1HJMS1B0wTDUxooJyPo+/OQOJT0oj7Xmn5EM07ZUTWA+mUDth/SQAIoVbnHf
	pAQ9Cyf5nFf1o/wwenJ4SfBlBJeEyLLbfVSALH2Li1all6FpY0K3cSojrCfY/NSt4N1I=
X-Gm-Gg: ASbGncvlJAPBaIgHH8djbZanqKpAhqqHd9aVsl/EUyXl7IcZe6u3wAQcLD0IJh4oMbU
	Qv2NveJIpijvLYk4/qZ86AvKpWYMSu762DudI5u63c+xg4I151yboTWtEl9nvpHJGdxiYYULyNn
	EvRo+6wdDv7QrskzFzWiw9cqRgd5h6tjlYbVpkFQcT+ZjT0nP3iKZmmqPsYkSzjPyJvOFDsJYnK
	LHKYLlYroKbf9EEaM9Ae0j4fP8Si/J5j8Wlqsu7ssMVblL5qOjwNkqJ32JPv0m9ers3X8ow6/xJ
	az7jiNa8Hs7UdfmD9VaXE+0I6pv457x3kYiauC4b6OOnnil0sZe9KGEJLd0XZ0cGHFSCs0+G/B0
	k3Bw=
X-Received: by 2002:a05:620a:2552:b0:7d3:c69e:267 with SMTP id af79cd13be357-7d42976a0cemr132720985a.12.1750851592125;
        Wed, 25 Jun 2025 04:39:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGH6OiOdnFqNQFHZY08dzGnG49pbYdELxhLBkXKRuNNZyM0qKripYKhU48YUIEPhjYcS4p0BQ==
X-Received: by 2002:a05:620a:2552:b0:7d3:c69e:267 with SMTP id af79cd13be357-7d42976a0cemr132719985a.12.1750851591653;
        Wed, 25 Jun 2025 04:39:51 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0ba7a3fcasm160221966b.117.2025.06.25.04.39.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 04:39:51 -0700 (PDT)
Message-ID: <1bc82082-32aa-429d-afcc-5b7050c82518@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 13:39:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: pmk8550: Correct gpio node name
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250625-pmk8550-gpio-name-v1-1-58402849f365@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625-pmk8550-gpio-name-v1-1-58402849f365@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vGD9yZMzMb88lxwQTv8izRug6Zlk_lpq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA4NyBTYWx0ZWRfX2ik/geKQ4NIl
 ZalXKHwsRbwtCAIrh4O9DYdq89bwXMuAsUeKHloIyEYpp8cc6CFKmcD61ybalQiQBTz74/wZEMJ
 Qa/lsmtxxA/DJdX7DwRrvd0QAVImovhJprBWIoo9o37LEjxc+YgOtIBteIY0aFtUQultKksg08X
 0ChzzzJwduEKWCguNoBZudh3iSF+0jTRAmwvz362hB/nXmWk5U0BtfgY/GnUueySxgOkEf4mo0J
 eQV32mxXmTETz/9oJnuxzX2MvfOUym7rCjQIG58iAlpByptM7XtiJYZXLkZcg1u4k98ElPqWEuS
 2IcKvg/FLWGVJVZj0YtFGoZZbKLvB6tB10j+AF2sF0Af45vc6TmIqYlJaXkNasrYS50hs/pyKc5
 +0F0kNsodPFcIDtI6bc6ALCmq6J7TxIjF8WPvgPl5K5jnligCsFdzl1V9huxQBUcWavPHQ1F
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685be009 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=l60TpK_hX5jhcLL__Y8A:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: vGD9yZMzMb88lxwQTv8izRug6Zlk_lpq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_03,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250087

On 6/25/25 11:11 AM, Luca Weiss wrote:
> The reg for the GPIOs is 0xb800 and not 0x8800, so fix this copy-paste
> mistake.
> 
> Fixes: e9c0a4e48489 ("arm64: dts: qcom: Add PMK8550 pmic dtsi")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/pmk8550.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pmk8550.dtsi b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
> index c7ac9b2eaacfe6e8363448d9d2ffb4ac8f5f4dd2..583f61fc16ad570972ac166aef12183382ebb4c5 100644
> --- a/arch/arm64/boot/dts/qcom/pmk8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
> @@ -64,7 +64,7 @@ reboot_reason: reboot-reason@48 {
>  			};
>  		};
>  
> -		pmk8550_gpios: gpio@8800 {
> +		pmk8550_gpios: gpio@b800 {
>  			compatible = "qcom,pmk8550-gpio", "qcom,spmi-gpio";
>  			reg = <0xb800>;

I was surprised DTC hasn't caught this, but it seems like the
relevant check only runs for `simple-bus`..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
