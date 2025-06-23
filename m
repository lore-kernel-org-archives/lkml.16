Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1365A20B7E1
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 12:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750681882; cv=none; b=HBweXiQAsmt2ej2hhK2VouhdxDyIaWkDyIqPhfACaRuLVs19El5OxwqxMVV1ZB7JCEGGWfNsyz0bNU5FUcn38E4Zc9FlNJ8ogV6mxEkk0nnyBZtJouZxrJhDhhyZaUi7VLX2Twh2FwI9Y1j01tNnZibjDAcM1mOssgSQs5+0GhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750681882; c=relaxed/simple;
	bh=2zFRKZQk6Qcx7V0TRS6RA0Y4R3e2uFWEfPn5Z1JUZPY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E9QT6mBvrdNi8d/RA91cvIdfirCZcpCSDYN5LJH850cSl9cjFAa4jAaW8jjdIEQZkVseCTCkauS5gGEW2bn61Q5W5XVYYyl2KG9DUxpPyQQ3AAOXk4cOOiwb5N6HOeFLrHmcH85Q8HW79J9lqBTiVbDwNeMtt4LySjGbLhFU4W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eyrH0Bjl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eyrH0Bjl"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NBkf5R031468
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 12:31:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E6864q4XX7Y1lJBXPh3P8WERZFM3Mm8/80MbfQ9oBQg=; b=eyrH0BjllGGw+pTX
	IwjyydI/FasyKcbyFAyphISewm08UJdHWnCeutuTtHfe2hFJSCCzqbmDKjWsEK3C
	lc+9wAgN6tMP1oEia6Zxma8aZzJf482/xdsp0Rs9VZEH26hh5Fo6Bt4xOXp6nmPV
	HWeuO2+M9H4/juE/wz3+nTPGdBGsxvBIJYXuJcBcXoqmEke3ofiBpUn50A8RyaKn
	CkTHAgPST7KAg4eMort3gfWDFZMkhPhQ+LBBwCAMy7ocVcU59L3P7OTaXWrgknEh
	DqP0RgCcIVMFqzSNid8/lQ2dkRdF3tWPS3E8ZiuZTkrp+cgzVKOSgMbgfrG7BWgi
	L+B4+Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ey7k1d12-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 12:31:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d09a3b806aso105728285a.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 05:31:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750681879; x=1751286679;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E6864q4XX7Y1lJBXPh3P8WERZFM3Mm8/80MbfQ9oBQg=;
        b=t1tLRk/dxSKEbqt2YHbRpi33QzZ8lqYxvamzmvbjIqatWaoIr7cCRS3Nqlsij2R6BF
         Cb6VRCTi1zHtOORFOtvXXjU31MHAittCRCpbxzZoPVnEzkZGNfu1kpai+y9XSFVSooFG
         w8op/P2XQPaIPtfFmDuJToG3xAoP9LqGzxE21AIZ63mn0Mw89PYJ7IdmMQ7Z5OLOwkyu
         CzZ/+wGk67fBtLUCt39NVp6tNelpzWUKXan9lqq4m/xmUAPI+eUygJ0K7qpN4E68eiMD
         b+X5R/Oym/64+LkDOGQZx2fTOwjkzBsAymlxWxr5Y2hZZK0+rf/zTtPg1b39K+j/CRMe
         g2pw==
X-Forwarded-Encrypted: i=1; AJvYcCW1ca1ey8jPymHTyjl+KohvJvwCUtBvocw1OOmto2sCwq96QacElIpteHF2GfS7wZbAAZEW+acRReZTbIA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0UjBnxMR5K9SN4s6XB9F+KuE9dE5+h4ZwSHKXKfLbz0/WAViY
	juiCCvvLNFP9NmY8/lgcoYP9IjzC2NJEJIGbzJWBW9UQdmx5gigbVt1BAZjLmfL3NFHOuhvhL/c
	ty3g3L7SkxrkVjKXlyHLM/qiHrsiHbZ+nbVzobaGopbkO6nt7vyi8B87h3Fk0m4k/unU=
X-Gm-Gg: ASbGnctIDtKVvP2Qkbdtgul1OEyYbhygVcH4+G2xv2Shr0mPQiyphP63b2NwX2aoeaT
	TzUH2TjVWEvWpxSAvdrsoIWAPOIxKgg6CEphES6wQMpFX5LUrmpUC65IyG77YWsFZdjMPEwNnLw
	EumeuFPOS2dkIC6sqKnj74PnsnancjkofEIMPYmPlyZwAZi4rjdLONiRYmbNBUGkesvddYlQUln
	fdcUiCemyiURXW+M9Cgjm64kPBqOWMn19FkVpkT1pTEYONSPr3SCekRGvlJ6FLmvv0F9Kg0x0Z5
	X+jbCJdtQoEX3LDHYtM6jIRlhv0gi1XqB50s4Ltb/8ZpfkU4isxa5YOo5m4NAN6SEP6QL+kFIGN
	rHxo=
X-Received: by 2002:a05:620a:4547:b0:7ca:d396:1460 with SMTP id af79cd13be357-7d3f9946b37mr700481985a.14.1750681878925;
        Mon, 23 Jun 2025 05:31:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSojH4qUqF5DcRgr/YMoel0AnNXPXaqZPjr++zZf5nj/R/1BTdf8HbieLdvXtY32sDyj5h6w==
X-Received: by 2002:a05:620a:4547:b0:7ca:d396:1460 with SMTP id af79cd13be357-7d3f9946b37mr700477085a.14.1750681877944;
        Mon, 23 Jun 2025 05:31:17 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053ecbda9sm698877366b.48.2025.06.23.05.31.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 05:31:17 -0700 (PDT)
Message-ID: <fd73a142-3b22-407f-8e6d-00f4e1e1c8eb@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 14:31:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/4] dt-bindings: mmc: controller: Add
 max-sd-hs-frequency property
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sarthak Garg <quic_sartgarg@quicinc.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_cang@quicinc.com, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
        quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com
References: <20250618072818.1667097-1-quic_sartgarg@quicinc.com>
 <20250618072818.1667097-3-quic_sartgarg@quicinc.com>
 <6040afd9-a2a8-49f0-85e9-95257b938156@kernel.org>
 <9627ed6f-2bb8-40b0-b647-5f659d87f2f9@oss.qualcomm.com>
 <bba062a3-f96c-456b-8e9e-fdeb0dc2d28d@kernel.org>
 <5bdae07b-a7b1-49be-b843-1704981bc63b@oss.qualcomm.com>
 <ffc62906-c3bb-4968-8f7c-fa7ae5028ad5@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ffc62906-c3bb-4968-8f7c-fa7ae5028ad5@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YoEPR5YX c=1 sm=1 tr=0 ts=68594917 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=jqoZUo8hMgpNG5C4G1UA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: uJRMhldcgL5vSpWHcMrn1uVDsMa_nVhA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA3NSBTYWx0ZWRfXzm8X92QZ354L
 rqswQrnIvmugxFEtLThzinQwz1jdzaqjpZepnQkrh1ny6fga4baoJ0NCp9wgf/X8xzySQvciFRL
 7ArUAwFuH7focczSkUUDqiC3nrkHpppXUH3rsJDtIhBfU+HYXb0AUeOnPAT7XLyiKVJO1kjYCeA
 HGJ21ice2sugmueSKL7WbMF18qBXMWCKSKYakvXceZov63f4cZOD8OIHrL7rZVQmuEyEpboYZZ0
 sD6cHlhQ4rS5tO5Z9EmgM0LIaO813Ic1QOqiRpltMTb+pQDgEK9OjGgPyRIPXFjMGwu+PDToSGR
 Fc/Htq9UaBc4SgA2MTycbvPgUNUA2q0mJipXtCA57FRNoEOmGl2U7mzWM0fKOSAPY2oVOUUI/+i
 YXywrUb8ts62gu1rgr5Kk6o+Qh5MG7CeDzSH6P9nQ5T9eM/4YyASRs1wkbv1wfEpwHgnpBCa
X-Proofpoint-GUID: uJRMhldcgL5vSpWHcMrn1uVDsMa_nVhA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 adultscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230075

On 6/23/25 2:16 PM, Krzysztof Kozlowski wrote:
> On 23/06/2025 14:08, Konrad Dybcio wrote:
>>>>>
>>>>> This might be fine, but your DTS suggests clearly this is SoC compatible
>>>>> deducible, which I already said at v1.
>>>>
>>>> I don't understand why you're rejecting a common solution to a problem
>>>> that surely exists outside this one specific chip from one specific
>>>> vendor, which may be caused by a multitude of design choices, including
>>>> erratic board (not SoC) electrical design
>>>
>>> No one brought any arguments so far that common solution is needed. The
>>> only argument provided - sm8550 - is showing this is soc design.
>>>
>>> I don't reject common solution. I provided review at v1 to which no one
>>> responded, no one argued, no one provided other arguments.
>>
>> Okay, so the specific problem that causes this observable limitation
>> exists on SM8550 and at least one more platform which is not upstream
>> today. It can be caused by various electrical issues, in our specific
>> case by something internal to the SoC (but external factors may apply
>> too)
>>
>> Looking at the docs, a number of platforms have various limitations
>> with regards to frequency at specific speed-modes, some of which seem
>> to be handled implicitly by rounding in the clock framework's
>> round/set_rate().
>>
>> I can very easily imagine there are either boards or platforms in the
>> wild, where the speed must be limited for various reasons, maybe some
>> of them currently don't advertise it (like sm8550 on next/master) to
>> hide that
> 
> But there are no such now. The only argument (fact) provided in this
> patchset is: this is issue specific to SM8550 SoC, not the board. See
> last patch. Therefore this is compatible-deducible and this makes
> property without any upstream user.

When one appears, we will have to carry code to repeat what the property
does, based on a specific compatible.. And all OS implementations will
have to do the same, instead of parsing the explicit information

Konrad
