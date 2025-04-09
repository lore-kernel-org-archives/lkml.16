Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B0C1AD3E5
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 04:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744172108; cv=none; b=GiWgdTBzGpw+5iJ18304gfJDEq48t4akh1BzX3prTuaiNVwbdregMyRGCXqL83+yXbTLGTj+DnUF9T3CxZbyvOPjr8gPMUxlvPtTLkG3ADUr9mJBECdzMJSxrUQg6UTSj+mDL3Ypu7MX5fmSkE8SJrotP3dJAb7QjhuNHgeYNks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744172108; c=relaxed/simple;
	bh=WvLqbpNEQec4JSdwumnfy2zaQBVdn3HjdG/oPncMCpU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rFZQyT7rzXzWs/lqqDYgj9NMAMbRm99pxtTIR1zZ0ojt7Bfg7bhqMwLYU6YI6JciBeiiHNeTAl+e4+eX4ESzOl/ByAFK3L5Wlxde/roWoLWXhoLMhZaIKKSsJ6NRK4k5zxzY7cnfxITzw4X+PBE4jhRJPLq4x4sZK/GeGD1abIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G38rmBLb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G38rmBLb"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538JYuEH029024
	for <linux-kernel@vger.kernel.org>; Wed, 9 Apr 2025 04:15:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VxwVae129VMoPtWlkzv/NH7NvSheSXHcYVi2EmUqZno=; b=G38rmBLbOTtFlseA
	wJIz/vnLj8SV6r+RMYKT516S/MmowmI8g4B2hjl2rEBdgWcsH8HIy8L3G2dJEzRz
	/QpS/Ewz8PMlTfv8ehIG5CDs74w3rEF0/ZvYpYrdIxU0+2lTxPolMNpN02+R2PJf
	TcnwxdAAmbrSMYHWoQw+8FNaMKLSDEyltEEA5xh7Vnuzau2kjBSKKNWw6SKOyIHq
	Csw0weA2TDFdFqcuzIqzK0s0Hs8SpMhamWi1ts5K1E3cHAk1H6KMx8rM0VCWTRtH
	cg1zV7bF0/nVz2kcHd7jTGzG+vshSAxc08o6ZzpSWA6E42cJVYMdev0vMrqpMCNn
	MaEtyA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpm9xy4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 04:15:05 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-af54a9109f4so2675449a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 21:15:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744172104; x=1744776904;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VxwVae129VMoPtWlkzv/NH7NvSheSXHcYVi2EmUqZno=;
        b=rDKECAAXt1OON3dQ/PUgyDB9LZzFY5E4V4v6B7mcY07p7TNlXBIe0btEPl5lAuyz3S
         8PHUiXXjXEOgT8/6NV9IiaxuOTtZ/lZG5o+Kavoxo/NUBbHGiejN2THAQPE5UwAMIT0/
         apgc0i+L3bMW4eXIf/K6HLEPTRSix+Y222sLHRFqKKGS/Cn3ARxtdudFWVzDgUzJWchR
         VNMMU1Gkh2hKj87eC4N0+1ixAxn5cOvfJHlMCLyy74wfyDlCYjgXkkQKkIUU+FVuFunO
         nq6X8HYkVCVoxK6UV7kOJ9jSVvueqf6nac7qXC9nUJu/BrWEUdhLvPtL6PhM055q96Hx
         ZsVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxx1iLDL+hN33uOg0D/AauFLzd7LGWcEUO1eJ+43tRgx2miecuYv+86+FfWajo7zk66rmhBfzv85xVwf8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzsx9UbqAk3oVgvKXxM3La1sfy6g2eLNImXmE0W/1aOg5GBYwLZ
	mGm/4OKAuo70CDeX36ClotOSVh1VHT/ueNVq+RbQ74I1a8jDTK0A1lZ4KC1LyqrwupWEhk6OwGU
	I8Hfh/l00fYfPuYPRBEgKPrAyxRHW7oYYHNMl1P0vVgUfQjiXE5g1OBZUUeZSw8c=
X-Gm-Gg: ASbGncsGp8qwjdNHZ2tlXYs/ahgEkh6htArjlxkt4fcTGyZlBEn7CJYAwdt6awTs1Xt
	wZc0fNA2vyb3Rf/x2BmxDdLqM2cY08bslJu/UKH/AUmSxnxJfjWhpttiWnPgigguCKsF6yyqHex
	/DOtgTXGVdWN9RkiuifrPYqiBTIRHFLFuH6Cga/okdIFVqDhioxR9TXaR5jNtsUhIoMWvr2TL8Q
	ls/tr4TDrMAf2tatHkYRlqMiRnyCl4FB8YkeqHN5CYB1r/EEt8hbl0/N/EZsAPSvqH0O2lOcujX
	ZN9dlbYMujxHoCQE+68XUn83jbdCX99qtwgHlerV
X-Received: by 2002:a17:902:cf07:b0:223:f9a4:3f99 with SMTP id d9443c01a7336-22ac29c19f4mr27369395ad.29.1744172104617;
        Tue, 08 Apr 2025 21:15:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEH1JyeruANuUf98MjiOWxD/KNh0K6c/DGsxhwBzjHX9KtKAj8DVmvmtKf9+8QAsEK3fhjnQw==
X-Received: by 2002:a17:902:cf07:b0:223:f9a4:3f99 with SMTP id d9443c01a7336-22ac29c19f4mr27369075ad.29.1744172104193;
        Tue, 08 Apr 2025 21:15:04 -0700 (PDT)
Received: from [10.218.35.239] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c97228sm1641095ad.128.2025.04.08.21.15.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 21:15:03 -0700 (PDT)
Message-ID: <468898dd-8b57-4fb5-bef1-d47ffbc38846@oss.qualcomm.com>
Date: Wed, 9 Apr 2025 09:45:00 +0530
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
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <20250409004330.iflfdxabodalsmox@synopsys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VpjYc4eY6yxb4hcHB_f9wpDEWTJ7np0C
X-Proofpoint-ORIG-GUID: VpjYc4eY6yxb4hcHB_f9wpDEWTJ7np0C
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f5f449 cx=c_pps a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=5SkJsQ-l3Z-u9Q_wZN8A:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_02,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090017



On 09-04-25 06:13 am, Thinh Nguyen wrote:
> On Tue, Apr 08, 2025, Prashanth K wrote:
>>
>>
>> On 08-04-25 05:08 am, Thinh Nguyen wrote:
>>> On Thu, Apr 03, 2025, Prashanth K wrote:
> 
>>>> @@ -4398,6 +4371,21 @@ static void dwc3_gadget_linksts_change_interrupt(struct dwc3 *dwc,
>>>>  	}
>>>>  
>>>>  	dwc->link_state = next;
>>>> +
>>>> +	/* Proceed with func wakeup if any interfaces that has requested */
>>>> +	while (dwc->func_wakeup_pending && (next == DWC3_LINK_STATE_U0)) {
>>>> +		if (dwc->func_wakeup_pending & BIT(0)) {
>>>> +			ret = dwc3_send_gadget_generic_command(dwc, DWC3_DGCMD_DEV_NOTIFICATION,
>>>> +							       DWC3_DGCMDPAR_DN_FUNC_WAKE |
>>>> +							       DWC3_DGCMDPAR_INTF_SEL(intf_id));
>>>> +			if (ret)
>>>> +				dev_err(dwc->dev, "function remote wakeup failed for %d, ret:%d\n",
>>>> +					intf_id, ret);
>>>> +		}
>>>> +		dwc->func_wakeup_pending >>= 1;
>>>
>>> This would break the bitmap of dwc->func_wakeup_pending. Perhaps we can
>>> use ffs(x) to properly find and clear the interface ID from the bitmap
>>> one at a time.
>>>
>> Yes, we can use ffs(x). But I didn't understand how this would break
>> bitmap of dwc->func_wakeup_pending.
>>
> 
> Since you're sending device notification to all the wakeup armed
> interfaces and not reusing the func_wakeup_pending afterward, the result
> of what you're doing here will be the same.
> 
> IMHO, for clarity, what I was suggesting is to revise the logic to
> preserve the dwc->func_wakeup_pending bitmap instead of shifting and
> overwriting it, causing the bitmap to no longer match the intf_id. We
> get the intf_id from the bitmap and clear the intf_id bit from the
> bitmap as we go.
> 
The above logic works, but as you suggested I'll refactor it using
ffs(x) and clear the intf_id directly (instead of shifting).

Does this look good?

/* Proceed with func wakeup if any interfaces that has requested */
while (dwc->func_wakeup_pending && (next == DWC3_LINK_STATE_U0)) {
	intf_id = ffs(dwc->func_wakeup_pending);
	if (intf_id)
		ret = dwc3_send_gadget_generic_command(dwc, DWC3_DGCMD_DEV_NOTIFICATION,
							   DWC3_DGCMDPAR_DN_FUNC_WAKE |
							   DWC3_DGCMDPAR_INTF_SEL(intf_id - 1));
		if (ret)
			dev_err(dwc->dev, "function remote wakeup failed for %d, ret:%d\n",
				intf_id, ret);
	}
	dwc->func_wakeup_pending &= ~(1 << (intf_id - 1));
}

Regards,
Prashanth K

