Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECFB278E6D
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 17:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746726375; cv=none; b=Ih+bCUi++3XYFC/7csY18AomJ73qbMrF44kc38z1+2phrYQojdXcl0MAwAkicSYVRdniWedzBXkPZ1PnB+hdh6tH/q1WnkP2gNUidFe8sRqwv+QXY4P/F0ZKofa5bPRlVLFut776v31aMWifj44gS4XnNSx7D+gYpvkDt1QIgGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746726375; c=relaxed/simple;
	bh=w003YU9xFDtX8th5FrprcQ+2OIPdbMDpi8dif0gJMOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aVPoGgwYjKGbig7B2NxsYlzwT9Lnzoxc6kR9vEtLLoO13d7ilRlulV4HU2d9DVaaFg+WZTaXSyANoykrQGmErAn6IE+dOFJIVKnvDlHZQvy7tlLeBBgk0hMH+hzc9ME9YQYKDFKnEZozQnR4VyXFgpEHPzOiHKm+S/d2oxU0qRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WrpuVVZS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WrpuVVZS"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548DAEpT002489
	for <linux-kernel@vger.kernel.org>; Thu, 8 May 2025 17:46:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0PMVomh58vUZ5beFSkyMxPogvfIP3QzcyNzI+dTinH4=; b=WrpuVVZS4znDT/HF
	0IE1KdgVRWHVF3SmODomh1fmvopfOFuLf9/+ql4/1XzMFLwGDGEuWqw0qnuVWHBu
	P/4dbUh2slIyi+ZvJknW7pvLfTFEs2yNPDNL4Cr6uOAM9/RKDT4rdBRSGSUrr65G
	/yqDVE/b9nl0FEHojIPMXjHvK3dOz9LBqacfcHcn0AktiCnlC9VEg4/EpDA67aOo
	f5CfcgBmvw0rYOlfRkZEGedD1FDgrt+VtKI25iBMhAtxLwh4g4ekJJkeEgkyivBh
	dHBbrD52jquX1Z8Tms1AQAXUP35nJPBrnEJVT4B4ogsmGJ/F7loKbWJgzYgXJv2A
	t80x+w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp5a4a7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 17:46:03 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f543e296e8so3261536d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 10:46:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746726363; x=1747331163;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0PMVomh58vUZ5beFSkyMxPogvfIP3QzcyNzI+dTinH4=;
        b=a7eQp4z6Do5cn/TcsXd+4Ox03W3ajCw6TPgR4fjmSgpnMIj8bhwbJyExh2pKjdpMyy
         eGeXKa6YZfwgYMsgLhy7MEEGU9HpdxNajQgoxXaE5kZh22ApBS3UPEnf/cVAg3Z3QM5c
         TuMGVZk7tFUUaF9AeS/dYOq4iRC7Lv6fg4ng0Pziijja30IP0cj0THZKS+kzy+d5dCaO
         5uDFiizvjolwf4CLPNi+HMnZUW+OoS8mEhnHFmbmkBR5ZnIO3gISx0c43VJIT1Mt7UZg
         ek22zmZgcQima7mj0osT6V29bMDxZmYQU6CIlPal/A5/GnWmUla5ztT5CpjAC0LYqZyd
         /f+g==
X-Forwarded-Encrypted: i=1; AJvYcCV6umvLpy2KwoiChe9ZD6Nqi2UZ5/pG+FXJQaekBn4qqsNlFiPFFXi6zdadig9PdXdB5Mr/fyy47X8SQSY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVJwdqVjMrE0vaiDArIkzPoSwO5Xejwi6dASHR9SHyTzbBseqJ
	Lpvnty2XOo9T8Wguj6rzypLGb14WyoiPHuvOAWUWx1Ta1BMxgPnK60horejsMoUdiR7RKn3FG/E
	U2oOu4wLnM6Wp20HqjxwjhPANuIJgEyqmsQ9GMOBYCi775Ds+7W9Fv3PtnIaWT+4=
X-Gm-Gg: ASbGncvd/z98MGhD7W9qNTidMpjpwRUay0io3icGsjZKfJLuPKkvr3cMM+H1hdCym+T
	BVSM9YUsZS904+okIzwuRpYPeXikzmF8Eqr1kpu3hfx4Q9fc3TGadnqUbpoY1g6/JRiCoCfegz7
	9hfhmjIx0J3yHzWaULKdezeSHQbDPJ2D9+uLlvCPK66n1uoNMMmYlpfHh2yK+HHMmxJKqu3ifuc
	ZicTTFg0jWLHk+7mH6dadA1KrbmV4Y+ieuYbJh9XFAz+dx6v8D6tz4A1a2fJ6VSLHlr8smh3eHL
	W8RGo9ineF3eiaKYKX9beg0MPDQKG8vlSf3dWE7zYiwUAof3jk6SyUdbuccC4fX4Tv0=
X-Received: by 2002:a05:620a:bcb:b0:7c0:be0e:cb09 with SMTP id af79cd13be357-7cd01106a47mr24446385a.7.1746726363102;
        Thu, 08 May 2025 10:46:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8clsXOD1uC7oNiNun3OmM+46gt3lHglvyTV8F+OOv+jUYM+ZbwoXUOp6M03Tw5z5hkuz1dA==
X-Received: by 2002:a05:620a:bcb:b0:7c0:be0e:cb09 with SMTP id af79cd13be357-7cd01106a47mr24444185a.7.1746726362501;
        Thu, 08 May 2025 10:46:02 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2198b68e6sm16736266b.184.2025.05.08.10.46.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 10:46:01 -0700 (PDT)
Message-ID: <6e65aa95-cd75-432e-98bd-a8a03e38a35a@oss.qualcomm.com>
Date: Thu, 8 May 2025 19:46:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: qcm6490-idp: Add WSA8830
 speakers and WCD9370 headset codec
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20250429092430.21477-1-quic_pkumpatl@quicinc.com>
 <20250429092430.21477-7-quic_pkumpatl@quicinc.com>
 <7322bb2c-5778-48cd-8661-91308ea8cfc8@oss.qualcomm.com>
 <c8097899-42f6-4fa6-bee1-6af9208283d7@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c8097899-42f6-4fa6-bee1-6af9208283d7@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XL0wSRhE c=1 sm=1 tr=0 ts=681ceddb cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=P-IC7800AAAA:8 a=COk6AnOGAAAA:8
 a=DPA8SXBlki6BQVjMWBcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=d3PnA9EDa4IxuAV0gXij:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: t-aqsB1yShHDgjqI7sRHgOV1-gRCkrhE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDE1NiBTYWx0ZWRfX/eQFOuGp8zYq
 jwZ3EyWOXNpmxV5zNl+jDHI5j2cXQMHZkDy/0t4Yk3CJR0DseYT1SC2h3TfbYCjtTVY86AoCwjc
 rEotyTXDjgJkvmglq4kph9FRnptefNPXyRqHuEbWunTVuGq2GblAivULAPz8QjGXanoGIvpUhJz
 uB2gzh6QowsmlhsAo81ZsAJVXas+jIeUmIeg9p3kdJpz42nFGRRYzyAQaPQ3POB5P5h1MMEamft
 Rixadd60cqa1RdNonPE6TGyc55qqvH26cdafpoNcfakQFBXAIm+5Rv3v5G0Ws6erblqfKAbgKjJ
 gxD/8Ob9lmJuyKLddG23USptJvYw5tvR/kNgBHCn/+e6DiI9KBwV6pyNT28EyPHyIXO3e3wG5ji
 45rszCYp3v3yyR0M95C6P+dDFzkIjsGUWI7ULlJqRekruslao95MpOqlq/6+eTVNK6rskGIY
X-Proofpoint-ORIG-GUID: t-aqsB1yShHDgjqI7sRHgOV1-gRCkrhE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-08_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505080156

On 5/8/25 7:01 PM, Prasad Kumpatla wrote:
> 
> 
> On 4/29/2025 4:31 PM, Konrad Dybcio wrote:
>> On 4/29/25 11:24 AM, Prasad Kumpatla wrote:
>>> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>>>
>>> Add nodes for WSA8830 speakers and WCD9370 headset codec
>>> on qcm6490-idp board.
>>>
>>> Enable lpass macros along with audio support pin controls.
>>>
>>> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>>> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>>> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 162 +++++++++++++++++++++++
>>>   1 file changed, 162 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
>>> index 7a155ef6492e..1a59080cbfaf 100644
>>> --- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
>>> +++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
>>> @@ -18,6 +18,7 @@
>>>   #include "pm7325.dtsi"
>>>   #include "pm8350c.dtsi"
>>>   #include "pmk8350.dtsi"
>>> +#include "qcs6490-audioreach.dtsi"
>>>     /delete-node/ &ipa_fw_mem;
>>>   /delete-node/ &rmtfs_mem;
>>> @@ -169,6 +170,30 @@
>>>           regulator-min-microvolt = <3700000>;
>>>           regulator-max-microvolt = <3700000>;
>>>       };
>>> +
>>> +    wcd9370: audio-codec-0 {
>>> +        compatible = "qcom,wcd9370-codec";
>>> +
>>> +        pinctrl-0 = <&wcd_reset_n>;
>>> +        pinctrl-1 = <&wcd_reset_n_sleep>;
>>> +        pinctrl-names = "default", "sleep";
>>
>> Does audio work for you? For inexplicable reasons, it didn't for me
>> on rb2 when the sleep state was defined
>>
> For Qcm6490-IDP board Audio is working fine, Not sure about rb2, Could you please provide more details about rb2 ?

I just mentioned it as something to keep in mind. Someone else has taken
over that work since.


[...]

>>> +    wcd_reset_n: wcd-reset-n-state {
>>> +        pins = "gpio83";
>>> +        function = "gpio";
>>> +        drive-strength = <8>;
>>
>> Since the definition is otherwise identical to the sleep state,
>> you should define the (other) bias type that should be set when
>> active.
>>
> Taken the reference from sc7280, which is working fine.
> Link for reference : https://elixir.bootlin.com/linux/v6.15-rc5/source/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi#L841
> 
> Will cross check and modify if required.

sure it will work fine, but in the same spirit typing 147 as
1+1+1+... will work fine as well, please doublecheck :D

Konrad
