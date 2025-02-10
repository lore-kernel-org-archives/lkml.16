Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75841C175C;
	Mon, 10 Feb 2025 08:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739175439; cv=none; b=oVroC4D/RaN8ifIZOsCjksVB/R+obrhbBaPR9/O3qYjdGhZNgo9wjolAMeB/O3ttDKEUe9as//nxxb0FM4cA4f0+WMSN95L61PalD+l9Qpb1LOAsWgTLDugPYkOzvmYsB/wS7C8Ls9MEUTZT+APp9EXZuz9rjlQS/05hi42xSME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739175439; c=relaxed/simple;
	bh=HDNAe01n8/xRMwR7TmlJGHtdDncn/boWt591Flp/U1o=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YV+WaKiJcw7vtq2sIchgdEDkIRkSTY9RwMdBCjeyucIkHjISMdICmBo1lMgs9RyfUTNDCNPIuXHTuna+gyDe2eUDZv6Ba6o8avLqxeiNvcVu8Ii6+rIf1ByJO4xhMUBx6adYMGEi7+BDJuvbc9dADurQiunr1I7Owxch8R69iJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EaQFOgg8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EaQFOgg8"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A0r1Yd023509;
	Mon, 10 Feb 2025 08:17:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+BxRYzZd72S5FIXwHCWE+QdIdBOQdqHdZK19tfebQVQ=; b=EaQFOgg8RzzN7DCQ
	lyZw5RfYLZKY3nBP1A7ZxaC9nLWLgmDNoq2bT/tj519iY5g1ub26vp9tbwlzL1nf
	oBco4EkwyHZGWsN9uYUKBwYn0a6IV/teXeglPFmf7IGf5g9oBZ+Sh4Z65IGvZ3JS
	iIj/BceJJl97liQF97phIOcVKrQ6g1h4xJqr+jCn6Blme7iBsjHMWoPHwCMlNaET
	QRvS2v68zGN6E0GPNEpfZK6L+7L5rhExDeiNf9cYP49xLo0wB48Fkghz8KsFqcSA
	w7LnfaV4E8HwlygN43IjoWcUfRVRtJZKWb177CYqSkrV2WtpBCEuK0BO5+YTC6o7
	jrnnTg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0dykgj0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 08:17:10 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51A8H9Eu011615
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 08:17:09 GMT
Received: from [10.217.219.148] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Feb
 2025 00:17:05 -0800
Message-ID: <58de97ff-2f16-40d4-a95c-d751fe26659c@quicinc.com>
Date: Mon, 10 Feb 2025 13:46:06 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/18] usb: dwc3: Reserve Higher Bandwidth for HS Periodic
 EPs
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Thinh Nguyen
	<Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jack Pham <quic_jackp@quicinc.com>, <kernel@oss.qualcomm.com>,
        Wesley Cheng
	<quic_wcheng@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Vijayavardhan
 Vennapusa" <quic_vvreddy@quicinc.com>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250206111543.17392-1-quic_akakum@quicinc.com>
 <20250206111543.17392-2-quic_akakum@quicinc.com>
 <d0b86591-7bac-42a0-aeac-1f7f6b75b75e@oss.qualcomm.com>
Content-Language: en-US
From: AKASH KUMAR <quic_akakum@quicinc.com>
In-Reply-To: <d0b86591-7bac-42a0-aeac-1f7f6b75b75e@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: VBaUlDPw62Umh3Y5jbrvQ_uGA0Rearm9
X-Proofpoint-GUID: VBaUlDPw62Umh3Y5jbrvQ_uGA0Rearm9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_04,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 mlxlogscore=999
 mlxscore=0 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502100068

Hi,

On 2/6/2025 11:19 PM, Konrad Dybcio wrote:
> On 6.02.2025 12:15 PM, Akash Kumar wrote:
>> On targets using synopsys usb dwc3 controller, it is observed while testing
>> multiple audio devices, a glitch is observed during testing.
>> As per dwc datasheet,By default, HC reserves 80% of the bandwidth
>> for periodic EPs which can be increased with GUCTL Bit 16.
> It is observed a glitch is observed.. please massage this paragraph
> a bit.
Sure.
>
>> Add quirk to set GUCTL register BIT 16 to accommodate higher
>> bandwidth for 2 isoc eps.
>>
>> If this bit is set, the bandwidth is relaxed to 85% to
>> accommodate two high speed, high bandwidth ISOC EPs.
>> USB 2.0 required 80% bandwidth allocated for ISOC traffic. If
>> two High-bandwidth ISOC devices (HD Webcams) are
>> connected, and if each requires 1024-bytes X 3 packets per
>> Micro-Frame, then the bandwidth required is around 82%. If
>> this bit is set, then it is possible to connect two Webcams of
>> 1024bytes X 3 paylod per Micro-Frame each. Alternatively, you
>> might need to lower the resolution of the webcams.
>> This bit is valid in Host and DRD configuration and is used in
>> host mode operation only.
>> Set this bit for host mode uvc uac usecases where two isoc eps
>> are used and flicker is seen.
> Re-format your commit text to wrap at ~72 characters
Ok.
>> Signed-off-by: Akash Kumar <quic_akakum@quicinc.com>
>> ---
>>   drivers/usb/dwc3/core.c | 11 +++++++++++
>>   drivers/usb/dwc3/core.h |  4 ++++
>>   2 files changed, 15 insertions(+)
>>
>> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
>> index dfa1b5fe48dc..7e55c234e4e5 100644
>> --- a/drivers/usb/dwc3/core.c
>> +++ b/drivers/usb/dwc3/core.c
>> @@ -1461,6 +1461,14 @@ static int dwc3_core_init(struct dwc3 *dwc)
>>   		dwc3_writel(dwc->regs, DWC3_GUCTL1, reg);
>>   	}
>>   
>> +	if (dwc->revision >= DWC3_REVISION_250A) {
>> +		if (dwc->dwc3_guctl_resbwhseps_quirk) {
>> +			reg = dwc3_readl(dwc->regs, DWC3_GUCTL);
>> +			reg |= DWC3_GUCTL_RESBWHSEPS;
>> +			dwc3_writel(dwc->regs, DWC3_GUCTL, reg);
>> +		}
>> +	}
>> +
>>   	dwc3_config_threshold(dwc);
>>   
>>   	/*
>> @@ -1818,6 +1826,9 @@ static void dwc3_get_properties(struct dwc3 *dwc)
>>   	dwc->dis_split_quirk = device_property_read_bool(dev,
>>   				"snps,dis-split-quirk");
>>   
>> +	dwc->dwc3_guctl_resbwhseps_quirk = device_property_read_bool(dev,
>> +				"snps,dwc3_guctl_resbwhseps_quirk");
> This needs a dt-bindings entry. Also, underscores are forbidden in property
> names, use hyphens instead.

Will update in V2.

Thanks

Akash

