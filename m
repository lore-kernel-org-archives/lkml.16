Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41A2265CD2
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 10:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744625301; cv=none; b=OZEap6mUQWGGgjpXHPXptWpEkv75LhM5NK3CRJd9cwEpxcCBCFvbUVjf81ETpSb/63wyxJOrYEWsyhkrtRG+cHbbuh44vvWuI2aaphJeAhM58uwAP+nBn+hKV+0SbHc+a57thLwpD6IfEyLK+J3GsVIMK3BGaFsZ1TcdK6BT+9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744625301; c=relaxed/simple;
	bh=hI5exL8lVprwxjKyBwz1haJkb+ldoxiXow/seg0QwZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GdLil8EdI3nOokFaM2KMtP7htHofMUSb9tpa1+LOwmoQsBOCGQDRy0kmwSArfs5iM4DIfcIBwByJaSJKM9UDWFtrbgGIc+5tlqnovuu30/2kBF74bzKuWeqMKsXvTbFetl7NGAwyCUhEvyvwXDPOePeysK4vUBiojCADcTBtIxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d3qSA8Sz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d3qSA8Sz"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99oPE017647
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 10:08:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iAPOu8FTHZQiUawy5teQOSK8iVJhCxgNvfNjhCFVeS8=; b=d3qSA8SzB23MwR0Z
	kugFKL/fCG92rdQklMzld68n3xq07ZCHMjKFg3VeF6lcQsVxozg3RVfoEwp2IDSG
	k9Qi1/2NoCiTqJfHgGGhNziDLVA0N+aKI4CH0AeyKwKXsIv7qnyQySBDSV1XN+vq
	0lld2uAkOkcE9V4fSgs7cZWqkFK+PvPXtVjKhLh57fY265TJnjU5LzstR+ec6DH7
	CXtFFD/fdEIAYbLiYxuuDJGQv2OQCh5KS+CsAKvTuI7MNRDDph9dndyRtgTWV4ia
	nETdspqGFOA7Vp7Vs/PFbEXTBjWY1z1JAD4bFdmgePRVQ3NyeR3nvhyqEzCDOoBW
	p0pSTg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf4vc7e0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 10:08:17 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e8fd4ef023so8035106d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 03:08:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744625296; x=1745230096;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iAPOu8FTHZQiUawy5teQOSK8iVJhCxgNvfNjhCFVeS8=;
        b=jnrUC1tH6k9wJp3AHCMdzv+35RIH1+lu9VznbIEx4aQoNLVgqrNIclC+sRCRVeq9xS
         ZdPi96wyRUjDsfdyhp2WTn/mdFc8o+NmZGFEZgyGxj4Y9+dHz+wRB5fc+NDlHdg3dm3x
         FIe8WEa9KwjZCqWIrdQrEQHspWico0ttJWThYW8+9Elk6PqWul5ZeqPLKrvc1oN9IZAA
         a6verNOZ3qcnZHkzgePs4ekyNQ3rwdD9EOspGf5gEf5lBLbUBxMbUf//enDatCUWY6Kn
         Rm84pVEJcSyQIa95TqFqvqMFANdifeGdwDwjd1UmwAUPa/14fLuQIRtz8/975Wj8Qn/M
         EEQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPSijYZ/AsVbzzYAC/jCkZWU9XdLDVoQU64R1RQ1bXhdUpzm78lh9j9wPPScpHhagHO6j9calj+24r+FE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyF4WWgdw7VIo/AqYZ2x86EorbJdHy6xOTyZo90foSV+73ure3
	KaAaMmyhRPXw9vBYoCZAd9UmzFkKI+dcshTZlfGJOgiI25ydGpe5nAOEAvhRwwiRhp0zFTY8mp1
	u9vG8h5c/J3AMay94dfQP/iWfP07OzGgmwanNsVAuIZk5nsVOZLEYmOVnBoL9UILpYvMzisA=
X-Gm-Gg: ASbGncsBSaOBXcCG213Cx2TgfEiqrLpNJNO5A4vCWWsEuR6R8HWF620TZD9r/ntjE7W
	4TQBOfheGhIGV5H2wuYEYbjWlknzpsPux4K1hhw+lRQV3Xr1AXpMxt26SOa7ZssA4iUvSU3pJ+6
	3A0DZTqC39fxFJhws0wnlsxG+mAHBQ7wtdKs1GK/J7v+ZAzVs+8BUPmQJRPsXLl9Q1L+UpUcF58
	EbjwxImElBNaRzg6bpUVybfoIQLHKLoNxkoBRGbYRwJJafpAOSbez5SPa4ooH2/jfRLVq15AqKP
	Z2Qxlhmm73j4ITBbKkzMMMNv+vU2187g+98s7dr3rf+jIIad7cOZIgfVd0ds/+yodw==
X-Received: by 2002:a05:620a:d8a:b0:7c5:6fee:1634 with SMTP id af79cd13be357-7c7af0c1fc0mr640417085a.3.1744625296287;
        Mon, 14 Apr 2025 03:08:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkIZWUYjPc9DMV0+IzC+9l1y0nHMActJ4TmxNbh2ot2IBhc4gOyrgI/EtejUkizlU/wxPYNA==
X-Received: by 2002:a05:620a:d8a:b0:7c5:6fee:1634 with SMTP id af79cd13be357-7c7af0c1fc0mr640415285a.3.1744625295827;
        Mon, 14 Apr 2025 03:08:15 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccd69asm872424966b.159.2025.04.14.03.08.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 03:08:15 -0700 (PDT)
Message-ID: <518663e1-8bed-46b6-95dd-142b98e567b3@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 12:08:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] i3c: master: Add Qualcomm I3C controller driver
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jarkko.nikula@linux.intel.com,
        linux-i3c@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org
References: <20250411113516.87958-1-quic_msavaliy@quicinc.com>
 <20250411113516.87958-3-quic_msavaliy@quicinc.com>
 <a1e85e39-4be6-4793-aee4-d990e1e46bdb@oss.qualcomm.com>
 <bca32a29-23c7-446f-9307-cc36d3f1ee44@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <bca32a29-23c7-446f-9307-cc36d3f1ee44@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: k_Qt1G2aqY_XR1rreACHecagcyoR3McF
X-Authority-Analysis: v=2.4 cv=IZ6HWXqa c=1 sm=1 tr=0 ts=67fcde91 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=sL-q8L-RPyKcODZA9a4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: k_Qt1G2aqY_XR1rreACHecagcyoR3McF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=833 mlxscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140073

On 4/14/25 10:53 AM, Mukesh Kumar Savaliya wrote:
> Hi Konrad, responding to one comment which is not working as suggested by you.
> 
> On 4/12/2025 4:45 AM, Konrad Dybcio wrote:
>> On 4/11/25 1:35 PM, Mukesh Kumar Savaliya wrote:
>>> Add support for the Qualcomm I3C controller driver, which implements
>>> I3C master functionality as defined in the MIPI Alliance Specification
>>> for I3C, Version 1.0.
>>>
>>> This driver supports master role in SDR mode.
>>>
>>> Unlike some other I3C master controllers, this implementation
>>> does not support In-Band Interrupts (IBI) and Hot-join requests.
>>>
>>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>>> ---

[...]

>>> +    if ((m_stat &
>>> +        (M_RX_FIFO_WATERMARK_EN | M_RX_FIFO_LAST_EN)) &&
>>> +        !gi3c->cur_is_write && gi3c->cur_buf) {
>>
>> The indentation here is confusing, please align the `(M_RX..` with `m_stat &`
> I have tried to implement this, but always giving me warning as below.
> Tried many ways, but same issue, hence keeping it like this.
> In fact, earlier also i faced same issue hence i wrote it this way.
> 
> CHECK: Alignment should match open parenthesis
> #468: FILE: drivers/i3c/master/i3c-qcom-geni.c:405:
> +       if ((m_stat & (M_RX_FIFO_WATERMARK_EN | M_RX_FIFO_LAST_EN)) &&


Maybe let's define something like

bool hw_pending_read = m_stat & M_RX...

Konrad
