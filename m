Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E339D1519AC
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747752276; cv=none; b=ZAhwb1uDSOUSAoJffCXspPh6jK8H52HIEbOo6dBf/2Rt81cT1p0a3qlaydL4wXD1G+y+gjfowgjjcbp29b6qEoMcDNaVk8hf2RCSVaq3NYn1iseHzs+pgPSIxn4sVs9+zwQIlV/giXPlReM/NHU9l+zbmbVcmgwctM6ovM4C2Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747752276; c=relaxed/simple;
	bh=hDxj1l9EjzLGuEMefLk+RkWuYjxMkDyVcIfEClwKEfA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pGnfESz434ZaB/CQnjgwHjsUp8NrOQkWqdqTFlVKpf0DnwnxM8byBoAXyuw7io3S7qf5so8O/isQXVOalycd9JlTFTbQvbnIEppXJ0w2yWrfsCZV31ytZ4qy2AmWxHDPT4vbw1Itx7/qwL0XJrPN4XrMxZcoR0vQ4GS58CmbQGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=msAu+UBZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="msAu+UBZ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KDojoN011465
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:44:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QorgnidCWBJg7Vmt5XBSexmPldS7Zeq3ffAJyueefoc=; b=msAu+UBZOHaAkog/
	VksUxN9B5K126HeDMviRBjJRweSX4iK3cvMq0ZsPcSTgcgtRxybRLVxu2iIpV3pB
	RFJGbsiY8eITaVefuua8f1uKi5WHBFqHn85L4FJKlcaiB6Shmsw01D1pOIAMi5TU
	gGB+XhV/5uGlFZ2yG42mA77w6nBviCia5XMtI+fu2Mgwd5bIJud+XD+ppe/FXI+Q
	8P2f2GYMh/xpLQxMfx2mTisWyWeDkxldSLB0+06il8SxxTNH5Ga0QDJigoNXS/jO
	7LFIWzpfv2MQpYc1nZZXlpZejDJx5PElm6Gqw3zOudovs8malVzc9KTKSaFqUfcU
	AdoXLw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjnyr3bm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:44:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c552802e9fso144069785a.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 07:44:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747752272; x=1748357072;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QorgnidCWBJg7Vmt5XBSexmPldS7Zeq3ffAJyueefoc=;
        b=JiXFlwLDeTWxKFaYj2W50Hn+QP8Ww/+qx0kmj9Uo22Bss2+x+sUG9YYc4OnNikqgIi
         MYklpEI555nOIbGqPhLzpdz9kr/RE8S0dHLtB2N/gSEwfup4QZwEK5CmlMDiKLisYqtp
         Jx1h66rb77YMeYmmEHGTSX4x4NDXRn/k3RPd+RD6Me2g65s53EVShUY9KXfz+pmAo1+S
         r/FzTXoTBYKfmm+eEQGQV7TSQA1UeoqkzRSjkRbX/MlsdOH2lBWVGQbFd1dO22hOx2YG
         VLn+q/JdiNrd5Rzb1Fhr4JrfvBnzH0IA4X6c2w8xbG4u9nxFtjrBKASKgaCS6m81+kb0
         L01A==
X-Forwarded-Encrypted: i=1; AJvYcCUWm8WIj+RnzZx1E5l8GG7ErjSqQRTF5Sb3H2IcrUvsiMWFtXJPAbmUFD0LLIPVD4x5egEdcCJNJfFQgGs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYpYMFJ9dUnb6/aAj4KXjMKAtTJKGEtbLvGnO475USDAW063pv
	/nLN4YubklDuTF0z3dTDBQXHLXZnOiEctbu+CxsoQYaSMJU2EseCcPxoHK0sKO3BXSq4uB4WeHn
	Wja6ilT6lWMS/dkbMWDk4IuVrd1mVHtYw4AA0L9nAMuAsALNRLjawdYZpORH4FzkoIco=
X-Gm-Gg: ASbGnct5/5gOg3o2G0aUaiDBKMu0Gs5aP2j6e4hyWIsWasyZzHqD5nHNLC9XsBMcK4h
	tNMMxpcnVlmKzGU9az0fEroy6ehONkmTXEnb+5nBcAI/oYwcusu43Ar7zz4ARZC1CTGcr81LvDA
	foKOVBDey5httaUft7ffaXlzBZHxLEG6anoBmG6vty3Dwbsv6DtN5nPek+4Kull8iuTjzui7DWL
	pcaDrJk2cDc6kCP57lyzQGye/8GB2428m93nZBOLdj9U8/R0TuHQ9BwZI3mDt/u9YCyGxU+HXCv
	wCasIqtFe/oWb6Ngta3lnApp8CC+qk8+ffB8oCUQXqzfijRZ0gc83W58vsr3D0q2YQ==
X-Received: by 2002:a05:620a:1b97:b0:7cd:2992:9f43 with SMTP id af79cd13be357-7cd460ae593mr1054836085a.0.1747752272667;
        Tue, 20 May 2025 07:44:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFvcWl585nw0J4PUITOMZ8zCHstBQtqWLtVIW4D6lddZf2iSNRacWBKpVGy4oqfbMBzjINjA==
X-Received: by 2002:a05:620a:1b97:b0:7cd:2992:9f43 with SMTP id af79cd13be357-7cd460ae593mr1054833685a.0.1747752272248;
        Tue, 20 May 2025 07:44:32 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6004d501f0dsm7352610a12.21.2025.05.20.07.44.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 07:44:31 -0700 (PDT)
Message-ID: <8bf46af8-d36c-4cd5-b92e-9b7005d621d6@oss.qualcomm.com>
Date: Tue, 20 May 2025 16:44:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] soc: qcom: qcom_stats: Add QMP support for syncing
 ddr stats
To: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Doug Anderson <dianders@chromium.org>
References: <20250429-ddr_stats_-v1-0-4fc818aab7bb@oss.qualcomm.com>
 <20250429-ddr_stats_-v1-2-4fc818aab7bb@oss.qualcomm.com>
 <c876ae55-a84a-436e-8c11-c0df236c1ea5@oss.qualcomm.com>
 <a14f58ed-fbc7-4074-ada7-3b9e50eb3047@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a14f58ed-fbc7-4074-ada7-3b9e50eb3047@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDExOSBTYWx0ZWRfXxz9/6RRGuEJX
 VeYjLdPyP24s9aqOnqYd/mU+npyOxAkobCL5Q5YF4b5q8hS/rzrRGq18n9kAKUVeeXcLFrYc6My
 7veFxgWfhjaWY7xnm/uK9iyzI6gFZYJx4Exf90tZMobioL+/R/PbdvgOM+TDPRNt3f7LuOsTaA7
 uqoJFrIH32lHiPbOJmPgWUbxC7NFHYIdL5E5RgcRkVI/IuPE/5/MOHTm9zH6+6vbLD3V6jWbnxf
 dqPWCi8gsMxUUUtPLrdXisgJNFnF2epEsDBchc0FibbarzP28SnazZX/wpHmGyLZAgJtpHyHshX
 yJQtgTTuwY7CeriOCosr6sQmJ/ks/GMcJT9VdtzXfipg6YKPUl4FN0HaYEIThVLl0AnKuncGM2I
 tjKgZ6xk+XfX0aTp1A0a3Yo+ngiHRudQgmw4CphjlDfJMcv/4YE78PYUwMWOJDY6rS41ACEl
X-Authority-Analysis: v=2.4 cv=Z9XsHGRA c=1 sm=1 tr=0 ts=682c9551 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=zmVLOkNBcqytz3L41WAA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: kujLtkTumPdNVa8AE6w6kGkCCJvdXB70
X-Proofpoint-ORIG-GUID: kujLtkTumPdNVa8AE6w6kGkCCJvdXB70
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505200119

On 5/20/25 11:55 AM, Maulik Shah (mkshah) wrote:
>  
> 
> On 4/29/2025 4:09 PM, Konrad Dybcio wrote:
>> On 4/29/25 5:52 AM, Maulik Shah wrote:
>>> +	if (qcom_stats_qmp) {
>>> +		/*
>>> +		 * Recent SoCs (SM8450 onwards) do not have duration field
>>> +		 * populated from boot up onwards for both DDR LPM Stats
>>> +		 * and DDR Frequency Stats.
>>> +		 *
>>> +		 * Send QMP message to Always on processor which will
>>> +		 * populate duration field into MSG RAM area.
>>> +		 *
>>> +		 * Sent everytime to read latest data.
>>> +		 */
>>> +		ret = qmp_send(qcom_stats_qmp, "{class: ddr, action: freqsync}");
>>> +		if (ret)
>>> +			seq_printf(s, "Error updating duration field %d\n", ret);
>>
>> let's just return some error, instead of printing "error" successfully
> 
> Should i drop the print and also error, From details given in commit message of [1] 
> which made the qcom_subsystem_sleep_stats_show() function return 0
> in order to run command like below to collect the stats without interspersed errors
> grep ^ /sys/kernel/debug/qcom_stats/*
> 
> The same may break if return error from ddr stats too.

You're trying to print potentially garbage data if this fails

Konrad
