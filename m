Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB252DCBF1
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 14:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750775949; cv=none; b=Vh0WrGpiQQjljuEYxgVnAO8zsDY7BCewZXYoY2I7NlMoxYPYCF+JgjGfs3zylqpnfGK+fx1Hn/JGi6JmBhfpfFwc7eFa7TB6fI8eOEYG5MDeHF2ONOtFoqd6BNINCNuCcH5bzMPap0tzA5tK87Y/Hmwx3pUFnK9uKz+uQGci6DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750775949; c=relaxed/simple;
	bh=4Fs+MNnNL1aLVoEZ3nvjjavzbhTQcS0eorXtt9qcd9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E8D2wBWsOIVy9nfCRzG0bTqwgM4+nedEQYSpWwY90r+DibctJUN2mXWzyGuGmo4DKuK8ISSr9n4gi180JxdSTCBWBxw5VRsX7sEuMMNlMfJXFxu1Wof5l62nbzlqGNgzODPauq8asatZdcEFf/abIFiVZI++YtyCeg/JP/1FKEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Co5H5Uiu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Co5H5Uiu"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O8wjHH021903
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 14:39:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sIc+EupRWFWHvbnKRiy3OMxhoQN7CcfjceN/6IiANW0=; b=Co5H5UiuYzDDf4jT
	aTkcjHSxQAPEMXOzak0VOUUAmTXo5zUiuXKY3D+6UUlBNp7NJH9aQseHH8S3PNZO
	M7gEI/6riWwQfD5m5IlRGqE+5TnblPf6UuRDa2yeJLxa9YyUrWMmLpdTJpzToyRm
	bEwCY3Z3yhXtTEkHXc9i4QFpBooxnPWCvNaedLE07b1sAJmAvbJn3LEZMc7n2mH9
	gFov8O9MZS29g4PRs7TEIJZAWVGwy25uutCHBDHOLOQtADPadvCTJQ7Jwr/Qvn3v
	AQHtppg75BwsoZ8MR1zpb+XD8yfmVo03N0M4SjCGSRQ14mk8v+CTiPKb8L5anNRR
	iGw4Vw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgcfnt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 14:39:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d0979c176eso135276185a.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 07:39:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750775945; x=1751380745;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sIc+EupRWFWHvbnKRiy3OMxhoQN7CcfjceN/6IiANW0=;
        b=KpNIN1uHUkiHQ+3J1aaHErT6j/4Gypnoit0dksXcwfmrd1+NOJJeircS+rLMfvw8YO
         L8S2J7CZvxUwKVO+SmSYDKpnKXz7Kfdn5PXz+PYHAUZeTuqrTdERSftrs/PtlFef+un3
         DHLZz+2wus+fe2HZdrreca11r19xFFxQ0TGS/2o98zSIzSvEkwZYcMDx13xdFXKAMpgD
         ebjrxUNVuiOU7yo4EaRWDOcP1+bYccV0+xCf9e/E7wjEgGxejwxeOTaNtm14Mg6IjJ/P
         /tkUdbwf0f43shHn90tJiPwFNqtidXgPA/g1InUlumXtiPmTNhOeoVj1WOsvo2OztgFy
         sIOA==
X-Forwarded-Encrypted: i=1; AJvYcCWvzTASIO7QzHthplqQiGkcZK3jgRw1+TEI3Jogod22hWsXsj5efr40LRTxHjsZtEntlGX8bj2JZCHqlfI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWrYTXDR7nj+n+XRtaqOvfE5hz8qaYM5Yww8LXpeoHu0e/2nhk
	iLmG18lo0w/7qDANnk7S0+71vv+InWhv5u5ZLheK2182QqOcHxCZDGNkT1sUtdtewOZI/437scw
	nCt8g4i9LeIxhyEpd+qfg9TA1YWmeljlvKyfhf6d/JaoJUKUEsCgx0BcW20dHcbj3x/M=
X-Gm-Gg: ASbGnctDgFDYVwn0isahkDgPoKtM7wUmFyzf9ZrSjAL8/kVgoeex4FblS0nEAZWVpk2
	ox/lyCHp891sYkTbiLShRoaHcQFYVCJ6wIgpzzxhaUSuKmgb75HHOkJGN+K8UMBpJ9nA291ERY/
	qj7kxgQqbFF2XzjUH/vNuJjklkXN7sWxd93NYDLxsRkEVlW5EI3Rza+9e/FVfNE9k9mQMgxrh5H
	gP4NchbjCi+2YSSuMwKUiIYIUIzw8UySj+wqOUp/V2cvo687b9ySbfQZb1TtOUdQNF87uj4ITmW
	vsO63EPTW/Uqv9e6xi5nWv3Sa2T9BYDhclTMqsIV37s8gpOsiq0lF5eOMx8d2ykMH4ACDKV02PZ
	PI0c=
X-Received: by 2002:a05:620a:2788:b0:7d3:c688:a587 with SMTP id af79cd13be357-7d3f98cc900mr720002685a.4.1750775945392;
        Tue, 24 Jun 2025 07:39:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAfCM8UsTR0gi4Vxf87lPgA73DvmGPhIX99anLkLmMBY+JyPqjXjPvAju2jdopYTB4Ilcaaw==
X-Received: by 2002:a05:620a:2788:b0:7d3:c688:a587 with SMTP id af79cd13be357-7d3f98cc900mr719994885a.4.1750775942695;
        Tue, 24 Jun 2025 07:39:02 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053ecbebdsm897023266b.51.2025.06.24.07.39.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 07:39:02 -0700 (PDT)
Message-ID: <99afe9f1-f6a0-46ee-b8f3-2374dc196494@oss.qualcomm.com>
Date: Tue, 24 Jun 2025 16:38:59 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: ipq9574: Fix 'l2' regulator min/max
 voltages
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, lumag@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250623113227.1754156-1-quic_varada@quicinc.com>
 <465751c4-a45a-41ce-ab65-ebddb71dd916@oss.qualcomm.com>
 <aFpA4mk2L/sxlpO1@hu-varada-blr.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aFpA4mk2L/sxlpO1@hu-varada-blr.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: UhipQywb8dzJJL6TPCR3C5JsOe9laaMM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDEyMiBTYWx0ZWRfX0ghddoxLt5yF
 08NppuMzpjxOqeTK1zopLmFTGM5CnzhxXmpSVB4z3ZL4qIZNpMyMwg23oxVfhiW6vlk0AXxgKIf
 MhDyK1Bba2iQn6QeaqeryuQVMh5Q3PsGJI67ULFER0IdnlEKAlGlKS0WTjk1J10K24wXV6WemOy
 S8RL4FNqZATEUdWiLlrFlICUC1VQ4jBFdWrYSkDC0AlULnqB8DSgakkyoY7pjsYHtIkTCk0As6E
 dTub/6ZLq4xEDpa7kdu26Qw+Zy+AaYjjAspjfdSlU4obGmcjxlTUMPZ4087SMexsmSfGuLjkIBS
 nj9kfxF/6JbcHyWd8zIR/so5oJF5cnrmETCVap5lsgfZp3nt9tm9GmlsIuh4fhSbxSCk/BowXZF
 fvDEWmBZHcKIQaHVbHV0Izx2pHDzTcpsd9ISkww4SBfJx+VIO0brI1sjwWuriwaaXYtnyMcI
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685ab88a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=3KRiLC8hv-m4DrkFIfEA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: UhipQywb8dzJJL6TPCR3C5JsOe9laaMM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=859 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240122

On 6/24/25 8:08 AM, Varadarajan Narayanan wrote:
> On Mon, Jun 23, 2025 at 01:34:22PM +0200, Konrad Dybcio wrote:
>> On 6/23/25 1:32 PM, Varadarajan Narayanan wrote:
>>> The min and max voltages on l2 regulator is 850000uV. This was
>>> incorrectly set at 1800000uV earlier and that affected the
>>> stability of the networking subsystem.
>>>
>>> Fixes: d5506524d9d9 ("arm64: dts: qcom: ipq9574: Add LDO regulator node")
>>> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
>>> ---
>>
>> Shouldn't there be a consumer for it, instead of it being always-on?
> 
> The uniphy block is the consumer of this voltage. The PMIC configures it
> to 850000uV based on OTP settings and s/w doesn't change it as uniphy
> doesn't do scaling.

Is there a chance something in the networking part can probe before
the regulator driver, resulting in a momentary undervolting?

Konrad
