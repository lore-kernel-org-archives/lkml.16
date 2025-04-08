Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09D51B21AA
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 05:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744088725; cv=none; b=B9IZvrXsHCY0LInRItiqfHKW0ey0v+g6qZBAvTNgYv3S0x0P4CE7BDvmMSKTYL7L2I/7Nv85dyWcUo6a4fvIjzBNgcojKhs5mSPYQ0Og2huCOOjtGpS27CPgddBal/BAYx8GKet+8bD49AL3CC2dMpyLFbZ6JHK55LkqfvugWLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744088725; c=relaxed/simple;
	bh=Lto+ra4LTmyrLHFbZ/Iu0iiaJ4j3VYHItZ+DnWYsUuI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NaYP8lEmiPLPnx9qswXQKelzDtCKLd0hIyd+nUScwJLX4Qp5MlrqofN+DWeYblchDe6Q8q94UvfBDssFkpLwerlRlL2ae57ZjKMI1/BTULj3ogXC27T9XRrJMF20VjlNlJiJjY4ksMv+KQ9x/lT/zNc1Abd9a3OAJWRg1d1aoOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nx6ElLHh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nx6ElLHh"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5382GMPg029492
	for <linux-kernel@vger.kernel.org>; Tue, 8 Apr 2025 05:05:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oDxL69wZUo4L0AV/xdKBgde+PGnwxfZwSZj8odr0+b8=; b=nx6ElLHh6Q14C5o9
	o9yVM2UYZd6KDlxcsvHhjz5fCWPIg8aSXWTEEnVJff16h29KlBZxAHEf/yiVIGDd
	R2fxyzdY22KYRJll0Cj0wvHeDfmwjmQb/9HKQljQhhdCFb6Q58iZ1F1ypT6Zoz2X
	xUDeDAquYpRqrPS2fqxv8Ob8iGJgT1mY9fKQExuacRSZhg9xkRUCfP9TPUjlQqO4
	+EXB8WLI/rzw4plfhDHz5yS5BirY3YuOw5Ip+96uK7WGrXdO2jDfV5Zv1TlrUTUv
	l094+KPOKzy2Nv487/G8wOpLnD7+o8UV+O96s1omLOfhOiujR0hBtf6LefSADQt/
	M2v7hg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcrehpv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 05:05:22 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-739071bdf2eso3753276b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 22:05:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744088721; x=1744693521;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oDxL69wZUo4L0AV/xdKBgde+PGnwxfZwSZj8odr0+b8=;
        b=eggNdzE9NrQKq/IJWitYt7jG+OhjLyusrIZVMrub6CLWqDA/EknQAhQmU1Zw8ek3t7
         nPKeEp2q2Ea1AmjQChOWM/T9tJw9zY7qLwfcwiY0e1f4+HAV0ADCZsTOlgBYsNrCIKYL
         3Y4j1j5QkigMJLh2EynpVJJXsn58feiXPsYSqW1Udq7g3UwPjEDcLJQdKOoWf+zL0Gig
         07SBjxQB64YWazNT3SCtD3czAIM+J2Q0dbwBQ+pVFWB58Vl+9LRz35QrKD/YXddOWUFQ
         zSUa1tQcf5oilgN/xu5+60lJ84DmIdBvsp4NmEYhJRWvc5jhB/farQOx+7eU3gc/xMcA
         IoHw==
X-Forwarded-Encrypted: i=1; AJvYcCX8BY2z54QBLBfFCDTtHAbsqw4Y0W+BpUeuLbQuErJod+DonzlhVFAn9GRB55aaAouinN5urY4oE+nbXmo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNmxleYxkg23YniOCZX1swZswq+9Yfda/jbKA9Ap4HTZm2oIR8
	WEgyWHgYw/A7pSZATF5JB/xzZk2t7W9mOQPCV1iAtTVWHvuZbAo+YqSw9XA183y7/5PLrgUHM1V
	uA+OoqyPJpxH1/9EsL6OuEnEHrtf7mJ5IJCgDZqyOAiJUiGHNPuRXWUSZIRyvtuY=
X-Gm-Gg: ASbGncsbbqORr67QOCedOOUuMn2uUi6hk4YgzDGjIcFQgwkS9N3n1ly44uShBb4IIkp
	bU/rx0dWBbr8dGB8ylHPxOCXflpSJ+dj0fG6WzTxbMgMYiz501e3/HCWxe+QO9bPgqSG1jNSAeL
	DQJPpY+3jIitvOxNpb6VuH2ks98uFp1LjGz2MDUYSly1GjlWwdDeXSrh4Tm9A8xhcEHZE8xEB5z
	I7+l54rFv/2qObzWGqPLowy/fafcuccSUoNPbn5YILRmIzEEv3U3d5CRI47r4+o9bwGfKgsbJ+2
	gxymhGTVdryCTpyNmPtTZGZrWCdC9qklDXsQAsua
X-Received: by 2002:a05:6a00:3cc1:b0:739:4a30:b900 with SMTP id d2e1a72fcca58-73b6aa3db66mr15542470b3a.7.1744088721051;
        Mon, 07 Apr 2025 22:05:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6VuOdqWcyZkSeZLzhlQV0tOJyim5NIj/mcpshGtqoiFN+CMt0VDdpuDzsy5HdSttRIRoZ5A==
X-Received: by 2002:a05:6a00:3cc1:b0:739:4a30:b900 with SMTP id d2e1a72fcca58-73b6aa3db66mr15542430b3a.7.1744088720597;
        Mon, 07 Apr 2025 22:05:20 -0700 (PDT)
Received: from [10.218.35.239] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97d2f4dsm9489595b3a.28.2025.04.07.22.05.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 22:05:20 -0700 (PDT)
Message-ID: <0b210acd-9030-4038-ac7a-480dc2b5db0f@oss.qualcomm.com>
Date: Tue, 8 Apr 2025 10:35:16 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] usb: gadget: f_ecm: Add get_status callback
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kees Bakker <kees@ijzerbout.nl>,
        William McVicker <willmcvicker@google.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "stable@kernel.org" <stable@kernel.org>
References: <20250403110805.865311-1-prashanth.k@oss.qualcomm.com>
 <20250403110805.865311-2-prashanth.k@oss.qualcomm.com>
 <20250408010812.qcgvinzqghrpyuly@synopsys.com>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <20250408010812.qcgvinzqghrpyuly@synopsys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KSg0N7DNCS1r8aL1GLB9GKMVrepb3SnY
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=67f4ae92 cx=c_pps a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=aDso-BE8akDkJb71X5cA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: KSg0N7DNCS1r8aL1GLB9GKMVrepb3SnY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_01,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080034



On 08-04-25 06:38 am, Thinh Nguyen wrote:
> On Thu, Apr 03, 2025, Prashanth K wrote:
>> When host sends GET_STATUS to ECM interface, handle the request
>> from the function driver. Since the interface is wakeup capable,
>> set the corresponding bit, and set RW bit if the function is
>> already armed for wakeup by the host.
>>
>> Cc: stable@kernel.org
>> Fixes: 481c225c4802 ("usb: gadget: Handle function suspend feature selector")
>> Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
>> ---
>>  drivers/usb/gadget/function/f_ecm.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/usb/gadget/function/f_ecm.c b/drivers/usb/gadget/function/f_ecm.c
>> index 80841de845b0..027226325039 100644
>> --- a/drivers/usb/gadget/function/f_ecm.c
>> +++ b/drivers/usb/gadget/function/f_ecm.c
>> @@ -892,6 +892,12 @@ static void ecm_resume(struct usb_function *f)
>>  	gether_resume(&ecm->port);
>>  }
>>  
>> +static int ecm_get_status(struct usb_function *f)
>> +{
>> +	return (f->func_wakeup_armed ? USB_INTRF_STAT_FUNC_RW : 0) |
>> +		USB_INTRF_STAT_FUNC_RW_CAP;
>> +}
>> +
> 
> Why does USB_INTRF_STAT_FUNC_RW_CAP is set regardless of
> USB_CONFIG_ATT_WAKEUP?
>
We check that in composite.c before calling get_status().
Have added some comments there [Patch v1 2/3] regarding same.

Thanks,
Prashanth K
