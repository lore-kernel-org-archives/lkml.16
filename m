Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682752AEFE
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 05:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744264113; cv=none; b=IAxbfERCKKthOlujlqRjPkO/oEQADJcdxiKsGgibAbPXRAs8smfky03CHALx8bEfa2geDk9tulpT5ron+gd3eCkkKOOwIgd+6mJHiegKEfQe5KWb3M00ujpsMMtqRMLmbRw9pxqk6OOSfgkACsNHvVK2is1CtEr5qzO0ADUN++k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744264113; c=relaxed/simple;
	bh=7HPB4C6hG5RveqzVOYqClm26/z8XxekYphPB5BsB7jU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZGJb2/x0f8Dxmho6uXnucq+zh8+CXxdugkwBZilkO2e0EnIsyYqAbG5kBYVG6fkY4vfFqWaQT+pA3x0GO5KfSwyKV9O2NeuihQESPNKrI2LUEqUTABdk0W54IKwu3GveRKMt0zMC7ZV7bFoWuoH3RSogUXsoIgzfCGbw0JtnL4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HNiblCwb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HNiblCwb"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A5UGgw010876
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 05:48:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fto71A2vBF+o06+1sO8jWrZT7txIGRj9I+GBH3AAlBs=; b=HNiblCwbf0OCvaHM
	ypBHpSJNmhsXdENuvPhVP5CSygM65j5oCJKHpUbAwd+gKnun8NKnxZGfUV39DCqT
	PysivpDHaZgevQB741wz9xkFLmJVC7GLMO7h4k8sj/BjIaC7UqEH283oKNb+Fh9b
	fb2d/4+rVfD7kUzfMlBct48/4SXsA7CzNrxrpBryAqI6AMsnze7y53JBgXRFIE8W
	yxd572cyu0S7wIm26vG6gzRFqAlyr7L1gfgiIobWegjaKOg/qMASzLs5aB+87zZZ
	EI30PJww934TnvPvqLFs2letkcqA5HY1fjiMrf6q0ZwhZodFP7vH6upwVdnUrVfe
	rGcliw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twftnk4g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 05:48:30 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7395d07a3dcso361154b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 22:48:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744264109; x=1744868909;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fto71A2vBF+o06+1sO8jWrZT7txIGRj9I+GBH3AAlBs=;
        b=IcsZ6PAc3+pjOjVLztMk7JhV66YWhThCkfKO+lBKPEQR+djBpW1JE2YXwVzgl1Do3c
         bDHPL85aQXrf4wI7mJftxxFeY7gJMfiI8fGfZC5uUogmCmbKjSfDFPK65iQ2ISQjdvmG
         3+9SSAKNF9Cm/4CulrGS+SVIYIPnUhkTqnrwluOuxgQvOfLDRLEv7WZgxNlVaBWFIXb6
         43kAYKbbSf9LovT8r9tB4c84Cq9/Kh650DSGew1okg5mwqMNaMRtVaFErBZR7v/L2w8+
         RP1SQ0Eh6DOruf/FfD3vi/0ie513JSzCNiH0iPWsRs1CWaP/m6n1a5fQB0y7qWo8jkB1
         Lqpw==
X-Forwarded-Encrypted: i=1; AJvYcCX3bQEUPzyHLuu89jk6TePCtU/ISkwf8RpAp4nH4JHQ1SHcXpG/iSoUkJciTBshOveb/fm2KJ+AaBt6icE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRetfBypiDf8MuriwisK+HykocWGf4k4MCq1M8mOa9d7eEfqgW
	yAqDVC6UlmCGY7yjAy/iDqJZO0T2tWlqtaLr6s0jSi7rk1CJnAXRV1hqR29oTWD9trlyD9ngeWI
	k+9vc3KQqdW5pL1jMNlUj1mxbIyAt7RGAhb8XIQKzElCcUgDwkVqYy9dl66dglSQ=
X-Gm-Gg: ASbGncto0OCtKCdvURhrbLCpxnH19vKgIrY4KlMgs0DFmjuKb11hIhWPP7mp4DcmLBB
	HZGNb0XcqkTXa1zsI9+99qM0udi4oGC3wPfL1Lgv8Ra0h6aCnQav3XdUpLIqRe/lyrapZzpVMZG
	hQoZqWqzi6HHdyb2icGbJQMX8hpKo/yzxDm7HhQsN0BR2vcUs+T+sVNb4NULq6saHMjbr5qk13v
	ThUSdNXj2M0sCVtsPs7nA0dVpEPSdn1vcTwrZH1mV1rogVkCR6yatpxZPVSXuRwFcmpwXqw/1zq
	Pe0qOOa7GrThpnFakH2mMS3qjd0acaPgWxz6xQ==
X-Received: by 2002:a05:6a00:2e16:b0:730:95a6:375f with SMTP id d2e1a72fcca58-73bc0a176b5mr1716195b3a.3.1744264109533;
        Wed, 09 Apr 2025 22:48:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOndUpg1XsPJBAfCy6plpCiUpoFwdwwZ4YOy0Tb9egEkXZXfORzoMZQBdjurZZitPCQa9KdQ==
X-Received: by 2002:a05:6a00:2e16:b0:730:95a6:375f with SMTP id d2e1a72fcca58-73bc0a176b5mr1716175b3a.3.1744264109029;
        Wed, 09 Apr 2025 22:48:29 -0700 (PDT)
Received: from [192.168.29.15] ([49.37.108.152])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1d44c31sm2407196b3a.38.2025.04.09.22.48.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 22:48:28 -0700 (PDT)
Message-ID: <bbe1af12-3aaf-4382-b8c8-5d645ea9d906@oss.qualcomm.com>
Date: Thu, 10 Apr 2025 11:18:22 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] usb: dwc3: gadget: Make gadget_wakeup asynchronous
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kees Bakker <kees@ijzerbout.nl>,
        William McVicker <willmcvicker@google.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "stable@kernel.org" <stable@kernel.org>
References: <20250403110805.865311-1-prashanth.k@oss.qualcomm.com>
 <20250403110805.865311-4-prashanth.k@oss.qualcomm.com>
 <20250407233757.jmtohzgm4xebjndn@synopsys.com>
 <10bf04c1-f040-4646-9484-70827db36d27@oss.qualcomm.com>
 <20250409004330.iflfdxabodalsmox@synopsys.com>
 <468898dd-8b57-4fb5-bef1-d47ffbc38846@oss.qualcomm.com>
 <20250409215151.thkmgzyeohyxhslh@synopsys.com>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <20250409215151.thkmgzyeohyxhslh@synopsys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=B5+50PtM c=1 sm=1 tr=0 ts=67f75bae cx=c_pps a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=pWYFwPD2pogPt9fXZc2mdA==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=BO5IBNuD8639gGEQwbYA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: ox6LEbvyOXk3JzfCwKcmPPA7vmJ0C-fG
X-Proofpoint-ORIG-GUID: ox6LEbvyOXk3JzfCwKcmPPA7vmJ0C-fG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100042



On 10-04-25 03:21 am, Thinh Nguyen wrote:
> On Wed, Apr 09, 2025, Prashanth K wrote:
>>
>>
>> On 09-04-25 06:13 am, Thinh Nguyen wrote:
>>> On Tue, Apr 08, 2025, Prashanth K wrote:
>>>>
>>>>
>>>> On 08-04-25 05:08 am, Thinh Nguyen wrote:
>>>>> On Thu, Apr 03, 2025, Prashanth K wrote:
>>>
>>>>>> @@ -4398,6 +4371,21 @@ static void dwc3_gadget_linksts_change_interrupt(struct dwc3 *dwc,
>>>>>>  	}
>>>>>>  
>>>>>>  	dwc->link_state = next;
>>>>>> +
>>>>>> +	/* Proceed with func wakeup if any interfaces that has requested */
>>>>>> +	while (dwc->func_wakeup_pending && (next == DWC3_LINK_STATE_U0)) {
>>>>>> +		if (dwc->func_wakeup_pending & BIT(0)) {
>>>>>> +			ret = dwc3_send_gadget_generic_command(dwc, DWC3_DGCMD_DEV_NOTIFICATION,
>>>>>> +							       DWC3_DGCMDPAR_DN_FUNC_WAKE |
>>>>>> +							       DWC3_DGCMDPAR_INTF_SEL(intf_id));
>>>>>> +			if (ret)
>>>>>> +				dev_err(dwc->dev, "function remote wakeup failed for %d, ret:%d\n",
>>>>>> +					intf_id, ret);
>>>>>> +		}
>>>>>> +		dwc->func_wakeup_pending >>= 1;
>>>>>
>>>>> This would break the bitmap of dwc->func_wakeup_pending. Perhaps we can
>>>>> use ffs(x) to properly find and clear the interface ID from the bitmap
>>>>> one at a time.
>>>>>
>>>> Yes, we can use ffs(x). But I didn't understand how this would break
>>>> bitmap of dwc->func_wakeup_pending.
>>>>
>>>
>>> Since you're sending device notification to all the wakeup armed
>>> interfaces and not reusing the func_wakeup_pending afterward, the result
>>> of what you're doing here will be the same.
>>>
>>> IMHO, for clarity, what I was suggesting is to revise the logic to
>>> preserve the dwc->func_wakeup_pending bitmap instead of shifting and
>>> overwriting it, causing the bitmap to no longer match the intf_id. We
>>> get the intf_id from the bitmap and clear the intf_id bit from the
>>> bitmap as we go.
>>>
>> The above logic works, but as you suggested I'll refactor it using
>> ffs(x) and clear the intf_id directly (instead of shifting).
>>
>> Does this look good?
> 
> It looks great!
> 
>>
>> /* Proceed with func wakeup if any interfaces that has requested */
>> while (dwc->func_wakeup_pending && (next == DWC3_LINK_STATE_U0)) {
>> 	intf_id = ffs(dwc->func_wakeup_pending);
>> 	if (intf_id)
>> 		ret = dwc3_send_gadget_generic_command(dwc, DWC3_DGCMD_DEV_NOTIFICATION,
>> 							   DWC3_DGCMDPAR_DN_FUNC_WAKE |
>> 							   DWC3_DGCMDPAR_INTF_SEL(intf_id - 1));
>> 		if (ret)
>> 			dev_err(dwc->dev, "function remote wakeup failed for %d, ret:%d\n",
>> 				intf_id, ret);
>> 	}
>> 	dwc->func_wakeup_pending &= ~(1 << (intf_id - 1));
> 
> 
> Some minor revision. How does this look? (not tested)
> 
> while (dwc->func_wakeup_pending && (next == DWC3_LINK_STATE_U0)) {
> 	intf_id = ffs(dwc->func_wakeup_pending) - 1;
> 	ret = dwc3_send_gadget_generic_command(dwc, DWC3_DGCMD_DEV_NOTIFICATION,
> 					       DWC3_DGCMDPAR_DN_FUNC_WAKE |
> 			                       DWC3_DGCMDPAR_INTF_SEL(intf_id));
> 	if (ret)
> 		dev_err(dwc->dev, "Failed to send DN wake for intf %d\n", intf_id);
> 
> 	dwc->func_wakeup_pending &= ~BIT(intf_id);
> }
> 
> Thanks,
> Thinh

Good suggestion, ideally it should work, I'll test and add it in v2.

Thanks,
Prashanth K
