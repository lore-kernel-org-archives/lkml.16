Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624B84C92
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 03:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748920647; cv=none; b=jj9G0kp4EDI3Zgjyh+sSOc5AVkMRUxPCT8hFdaZZ3Q9m2xEF4kmxB89FpqAML7ZQDib1Zi85gTguYZyaeUYr25NEOx0l/1FQoyluxMvU2LtUpTku/RXiRdglev/TId/OZn3ZiaBqtsEP4HxE47PNgOk5+Z65Ua2PQxa7zobp8Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748920647; c=relaxed/simple;
	bh=mICnRsB30j+MKei8QViebI5du5rZTT4LMUwMAyhcGXw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rxZSkNlbsZZE4HjvucfDFGxDQXuEz0v63louZo/x1iA5fn7ImbJZcvMHons8ee3EGDM8L+KpRyYKRo06XTumwyL/ua7tJc+AgZPerPc6r61aRXfbuK0WtsrHD3Dh4v0BfzY2BmdAo0Ox4Cofz9peYFe9t5t/Bafo2RqyOwkUJ7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UE/K5hVb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UE/K5hVb"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 552HJitl011138
	for <linux-kernel@vger.kernel.org>; Tue, 3 Jun 2025 03:17:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rMgCs9NrjesFQlLVNGJXrQW0yp9nGoo0WvBW9uMrt1g=; b=UE/K5hVbdmX5taoS
	AgDaFz3oxpZO9NeuOpgJcu9ZfPImD2rQspS9qYRe+eUVwa17RtoQ4I1uOvVCOFxn
	OW/Q9A+fylpF47XPz86JlxAS64mavK84xFX44pUhaCFxUeKYXOgva9kaNAN8cIaR
	WTc9DVOem/eBdFu5pr4OPkxfoIlJSyep1DlHIFGV9k7513Qt3uTTWMJhM2FL2cf+
	GxTlBY3l8230+vjjU+TGZF2du04mwgar25ADzy0IK6g/RgQxwPrpEOfx57BMlGRf
	VqIAC0TJgBRyFgxY3evP0EhbQ6xzkrXQoHJdsL84WJNfcTuz009VwlMxYgwH91lO
	WOsaoA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8ss5fs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 03:17:25 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23546e35567so29545775ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 20:17:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748920644; x=1749525444;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rMgCs9NrjesFQlLVNGJXrQW0yp9nGoo0WvBW9uMrt1g=;
        b=bMJo3eidzM5jfq1ZUSsQE4oLUWmnr9Bh/4TtyQ9GA1Xp7IvMKFw6zqhHMVNetmanc/
         qcQH4BS5uCHIGneR8TYupoL0sFfWI4OPK6MLBRqfuH4ZtCuxQ44fo94v3ZE0ularlMP9
         yzqNKAj/TE44RcXVAoRfipLEWckrcitLY+WZOJgZbKh6u2DTepq8xsZlU+fbqIjpiiY9
         hB/j96SsyCIyCd4InK1/oZQlzfng1NctlXwLPf9un46O2TGQLmqQwsV1ICsH78o7VQJh
         hitUaaRTL7MZiKOBBNZ1u7pXB8UGX40yPqKPp+I1MLfv40MERGz/mDCKGj4z3Xun1eum
         fHTA==
X-Forwarded-Encrypted: i=1; AJvYcCXRuv/dVSX9kLbPttd3UsgvDproy4LlJ0pAp04cNGHJ5F5RtSFEHErdYiTiDHfnYdFQ1iVuCVBmndRdME0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSOjvLDf+GSErwr//A3cTeAjsw1htUxwkOqEY5QZqTLnv2JlBb
	77c4xIGMHE1K7oCjpb5W+TqFcZrQYq+WmxNkSvBm8maV+AQHRMGunMuy5v5IyBBA+aEzQg1cowu
	r/0/1Ewi6X1yjGctNGDzmDYUHO+gYxToAlpZEge4FuNC8Z53uKlhKFVHGitg7KnewRkw=
X-Gm-Gg: ASbGncsLSYgLlQSTSxXamsbCgmqh2BiVpe9dJ3TfkOWFnqbfUptgc623nPC7XXTF+e6
	A00HP9P8uFVDH81/yJtz97Vqb5Zx0wHEhl4ZwkCpjE8B5ZVJU0eVimgF6opWL7mlSWCPhXqg6Ga
	qQFLkqYD5cfa7XMgSJOZPP3T5RU1A6P7XtJp9Z3V0nGdFan2d+SnPx9ngRT+XYNMga9y6yPKIWh
	X3ynrN/WmnfTwllTKBXmVKlIEWMHwPRY1uXo1agzja5src8BeQEiBpQPHr42UP995VytsUfRuSl
	ipyJL0BbQ9FlD7JKuSXNS9R1QiFwTi1cpPZfLZRQ2yRx3JjI43nCDuut5emHHThn+tprvbGkvNk
	QFBMnoC4=
X-Received: by 2002:a17:902:d4ca:b0:235:2403:779f with SMTP id d9443c01a7336-235395b621fmr226631745ad.29.1748920644393;
        Mon, 02 Jun 2025 20:17:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJAApKbsRRZnpYjpmXHMAeqRWvvuJ1p5ObFhKMNoXU0JlNmL/FtEvJRcGPJWs6NXL4fE5oyw==
X-Received: by 2002:a17:902:d4ca:b0:235:2403:779f with SMTP id d9443c01a7336-235395b621fmr226631465ad.29.1748920643986;
        Mon, 02 Jun 2025 20:17:23 -0700 (PDT)
Received: from [10.133.33.114] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bc8842sm77825665ad.44.2025.06.02.20.17.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 20:17:23 -0700 (PDT)
Message-ID: <405f0432-3f07-45be-8511-06235dcd84d0@oss.qualcomm.com>
Date: Tue, 3 Jun 2025 11:17:18 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs615: disable the CTI device of the
 camera block
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jie Gan <quic_jiegan@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao <quic_jinlmao@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250527015224.7343-1-jie.gan@oss.qualcomm.com>
 <5fbb515a-c3d0-4bbe-a689-41e730ecd952@oss.qualcomm.com>
 <9a156925-cf7b-4d2e-88a8-fdfed5528553@quicinc.com>
 <1fef810c-47fe-4f6d-95bc-0d72dbd63bf0@oss.qualcomm.com>
 <79f5e42f-f857-4247-abf9-d0f3f5c1a498@quicinc.com>
 <f3f8f446-4f0d-482d-952d-35c80d7d7881@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <f3f8f446-4f0d-482d-952d-35c80d7d7881@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hdTcMwzATwMPpD9_DfwwN72GspuHYWPm
X-Authority-Analysis: v=2.4 cv=EPcG00ZC c=1 sm=1 tr=0 ts=683e6945 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=P-IC7800AAAA:8 a=BXdiI9v_AKGlemzBL5QA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: hdTcMwzATwMPpD9_DfwwN72GspuHYWPm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDAyNyBTYWx0ZWRfX8qQI7aXJgJHr
 ZE6E7o9KGhpvvtpDAQPtujHt4U3OEJrBYInPpElncaOvalDPoTdseic6QormwRJW4u/aIKEUn81
 cuT1ZWNqJNtx80YDfy9vDnnzD4ZeTjNnaPyLLfnB9xS0yaiSFKkatha7HuA+CKCmosqT/QDXh+r
 SPuHErNC2s/B0j8Hy5quXPgbPtii2eJy9C7J863gz4EYfXSTCdLpX6Vu5vAh4SFuBOjTCwqwT8X
 Z8/+TkBjYqZAHcUdmWWOQ/Ni6QVTsHnv5HTeXf9Fpv8jYPhmvqK5p8NlGT+gjsy3AtjUUSNC+aP
 LyECMiLiYlQvQBI/6ustbkMK9SoiLe5mH2w4eOg0hodKdGVgrYCmYg2otaSLcRl1FuXuqieP1ny
 43nvUKUBndn0DsoPUGS9fE5U+zbx5qVL80jIPXGvvulOBm7tSlc4O87LIlvNClFtyHZoK1az
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_08,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxscore=0
 clxscore=1015 mlxlogscore=841 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506030027



On 5/31/2025 7:05 AM, Konrad Dybcio wrote:
> On 5/28/25 5:02 AM, Jie Gan wrote:
>>
>>
>> On 5/27/2025 6:41 PM, Konrad Dybcio wrote:
>>> On 5/27/25 12:32 PM, Jie Gan wrote:
>>>>
>>>>
>>>> On 5/27/2025 6:23 PM, Konrad Dybcio wrote:
>>>>> On 5/27/25 3:52 AM, Jie Gan wrote:
>>>>>> Disable the CTI device of the camera block to prevent potential NoC errors
>>>>>> during AMBA bus device matching.
>>>>>>
>>>>>> The clocks for the Qualcomm Debug Subsystem (QDSS) are managed by aoss_qmp
>>>>>> through a mailbox. However, the camera block resides outside the AP domain,
>>>>>> meaning its QDSS clock cannot be controlled via aoss_qmp.
>>>>>
>>>>> Which clock drives it then?
>>>>
>>>> It's qcom,aoss-qmp.
>>>>
>>>> clk_prepare->qmp_qdss_clk_prepare
>>>> https://elixir.bootlin.com/linux/v6.15-rc7/source/drivers/soc/qcom/qcom_aoss.c#L280
>>>
>>> I'm confused about this part:
>>>
>>>> However, the camera block resides outside the AP domain,
>>>> meaning its QDSS clock cannot be controlled via aoss_qmp.
>>>
>>> Do we need to poke the QMP of another DRV?
>>
>> The AOSS has a clock control register for all QDSS clocks. when we vote the qdss clock, the aoss_qmp driver will send a message to AOSS to enable the clock control register, then the clock control register will enable all QDSS clocks.
>>
>> The QDSS clock is not a single clock source, it is a term that representing all the clock sources utilized by the QDSS.
> 
> What I'm trying to ask is, is there any way we could enable that
> clock from Linux? Can the camera hw turn these on? Maybe we could
> trick it into enabling them?

There is a power issue if we keep the debug clock on with a long time.

We had a discussion with AOP to check if possible to add the debug clock 
of titan to the QDSS clock list, but they need time to evaluate it.

 From Coresight view, what we can do by now is disable it in DT to 
prevent the unexpected NoC error.

Thanks,
Jie

> 
> Konrad

