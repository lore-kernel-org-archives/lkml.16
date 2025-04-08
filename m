Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8533B1F8921
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 05:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744090452; cv=none; b=jp8sj7gkQ1qeXK9uo778k6HYTTFuN+xgTjP9mVQceEeemViUmO99DuTDXSmNk0+gvum7jE2GwU8Xkb95NabdqpY32BQZU16I5aymWp0E3CfTEkFc0W6iVEuhpMVH31B22BNSq5vakHzHDTmAqpOVAnnRIHvwQNIagRqlUhijsO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744090452; c=relaxed/simple;
	bh=arEAU13z8MWOdnZ1xPhjdxMiWHSQSfSV4fMV+rYaaUc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n37aXI8bd0Lc99YkBywYBCnMnG39QmB/J47TbG76IFo0ztBFjLRsBLmCVvwsF7PO8LRRTeK7knJIDXSr16X29pWVJK0HtNV/kRmlyjq++YvKjQZP8GDX9syZ6z+tF51QcTVZvEBn8sq35ZWJQaxLukb9sSMZ0OIFmR4oio7KMck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W5Jlbc8Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W5Jlbc8Q"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5382GU5f020214
	for <linux-kernel@vger.kernel.org>; Tue, 8 Apr 2025 05:34:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AyLfoahGroLli+OuVnqvLk3oTAd0/hoycgj1k4pZnnc=; b=W5Jlbc8QaQ9PM1q+
	lQAafySwzPfnaEX8CB/jBYhfIQ3jCBGKbJJvaQkcBqCMhtGsZ3hbXl5hDIojVEYB
	WSeD6l7P8bLCWfaSBnYnm7PNGqL+xap7r/Bi4m1dyZ+vxS5cekmQF0f/++2bew/p
	Z8J8I6qCdUzJTxeSUw8RSXfjSFGBCVpd4g1Bv2pddD5us6z8ugpQs0dBCm6vRqzS
	dsGB7d282G6/crr1sPLZZIqL+XJH4TfQdZdtrBdbgLjS/5v/gi7ISdXJ1BvbHPh5
	l8tIZcGTrnTwWk6w1d4EtvxdmdSPzHjuv/5K3B8AB9OhB+5UIH8NsNXvSHhvFVA0
	w3aCmw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd2pkyp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 05:34:09 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-af423fb4f0eso3441791a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 22:34:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744090448; x=1744695248;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AyLfoahGroLli+OuVnqvLk3oTAd0/hoycgj1k4pZnnc=;
        b=faQ8bwTMoQKxfmhbPdZkQPDJgey82tDCICp7OV+dTL6TkIEvHjbiuxuny2BbSWjFM1
         dLyuEzR+jebUN2eu0SwktuXJLdrbtFMJrWhHjvt3PbBVstNYZqRVQFl+jy42h4NF57zR
         nEQMhzWaU80uyOyKwVpJQkBmhrJgXX/BVUqlErjiOQfXZS5c5DswueED1863eXCOK2oT
         GT9Nu+YMt4mwU63IFtPBkznlAuxG40+DBNp3NE5eG1OIL9ZPf0u9fJI2an7cCq54o9+8
         5BHzH7XhB2dDDzGA+hTzWrqudSPMd7JHzAhGyf/c7776/kubth58kSbCAc9ibMQBmfKn
         aB3w==
X-Forwarded-Encrypted: i=1; AJvYcCXLPqONb1MLmCOpN8/vIpuIgHcIMGFO2QKU8mPdHo+i0SoqdSPka4WgnD4s74BN5vcdfExQORz76BzKYnY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0Zs2SfWB4CDS/SLingbIf/LPZXW46MdtAIaev0QTJ4/vDMKVu
	rk3SJrSu8Y2cWA2qyFC2FCkRy1ye81LMzvA7QaOTY3HAUuuQwjhKoA57OIuhfXL3++m/Axetny3
	RxIg4dC7ZVdT0Se5BQ/gp5Y77Fw7OFe5RVj7xyol7f5MrdnZeOitZrW7KLe6JSwc=
X-Gm-Gg: ASbGnctl6Ai8ck7abrkr06eEJTs8m5PbV/CWL/QWDiWI2YMarxpVu+ghY6FsQerOqeP
	lwqTTMYTDdMy0BfXy+qGzKemNM0/WPcxHaNu3+EXSlyAbSPy4xOmGCGg9U8s0AKFZ7eU1xbPel4
	a1+jW/IKemz1JQUU6HmHr6M6X5NJYng2eIJmDOzh91BBFz2btaK86fgYca81SIdW3cqX2iFq4gE
	at0iPT7iGE9KKn911P9QSMpZQtPoTxt3MTvs3gU6KG4cd+M4N8Af6Itu/Alj4sxpsjJlA2Ra5r0
	nteUl57H/pG8hhLQgeKjsRKpwaqxj3N+VqLKZbbZ
X-Received: by 2002:a17:902:f683:b0:220:eade:d77e with SMTP id d9443c01a7336-22a8a0a3a86mr227994335ad.40.1744090448418;
        Mon, 07 Apr 2025 22:34:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrCBpPNjEdWABvuv4bJIXaTPfZw2ZOm5NwxYwP2yGhcU5Ak5+Ud6QjmkG6m+ScvVEbAd3eiw==
X-Received: by 2002:a17:902:f683:b0:220:eade:d77e with SMTP id d9443c01a7336-22a8a0a3a86mr227993995ad.40.1744090447997;
        Mon, 07 Apr 2025 22:34:07 -0700 (PDT)
Received: from [10.218.35.239] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229787778e3sm91201265ad.254.2025.04.07.22.34.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 22:34:07 -0700 (PDT)
Message-ID: <10bf04c1-f040-4646-9484-70827db36d27@oss.qualcomm.com>
Date: Tue, 8 Apr 2025 11:04:03 +0530
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
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <20250407233757.jmtohzgm4xebjndn@synopsys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: XXXEq1n5ImAZbF8JcmE8zLlSXJ5Ll1Vk
X-Proofpoint-GUID: XXXEq1n5ImAZbF8JcmE8zLlSXJ5Ll1Vk
X-Authority-Analysis: v=2.4 cv=NaLm13D4 c=1 sm=1 tr=0 ts=67f4b551 cx=c_pps a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=yKX1jj3aC-1AoQY6T0QA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_01,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080038



On 08-04-25 05:08 am, Thinh Nguyen wrote:
> On Thu, Apr 03, 2025, Prashanth K wrote:
>> Currently gadget_wakeup() waits for U0 synchronously if it was
>> called from func_wakeup(), this is because we need to send the
>> function wakeup command soon after the link is active. And the
>> call is made synchronous by polling DSTS continuosly for 20000
>> times in __dwc3_gadget_wakeup(). But it observed that sometimes
>> the link is not active even after polling 20K times, leading to
>> remote wakeup failures. Adding a small delay between each poll
>> helps, but that won't guarantee resolution in future. Hence make
>> the gadget_wakeup completely asynchronous.
>>
>> Since multiple interfaces can issue a function wakeup at once,
>> add a new variable func_wakeup_pending which will indicate the
>> functions that has issued func_wakup, this is represented in a
>> bitmap format. If the link is in U3, dwc3_gadget_func_wakeup()
>> will set the bit corresponding to interface_id and bail out.
>> Once link comes back to U0, linksts_change irq is triggered,
>> where the function wakeup command is sent based on bitmap.
>>
>> Cc: stable@kernel.org
>> Fixes: 92c08a84b53e ("usb: dwc3: Add function suspend and function wakeup support")
>> Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
>> ---
>>  drivers/usb/dwc3/core.h   |  4 +++
>>  drivers/usb/dwc3/gadget.c | 60 ++++++++++++++++-----------------------
>>  2 files changed, 28 insertions(+), 36 deletions(-)
>>
>> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
>> index aaa39e663f60..2cdbbd3236d7 100644
>> --- a/drivers/usb/dwc3/core.h
>> +++ b/drivers/usb/dwc3/core.h
>> @@ -1164,6 +1164,9 @@ struct dwc3_scratchpad_array {
>>   * @gsbuscfg0_reqinfo: store GSBUSCFG0.DATRDREQINFO, DESRDREQINFO,
>>   *		       DATWRREQINFO, and DESWRREQINFO value passed from
>>   *		       glue driver.
>> + * @func_wakeup_pending: Indicates whether any interface has requested for
>> + *			 function wakeup. Also represents the interface_id
>> + *			 using bitmap.
>>   */
>>  struct dwc3 {
>>  	struct work_struct	drd_work;
>> @@ -1394,6 +1397,7 @@ struct dwc3 {
>>  	int			num_ep_resized;
>>  	struct dentry		*debug_root;
>>  	u32			gsbuscfg0_reqinfo;
>> +	u32			func_wakeup_pending;
> 
> Can we rename this to wakeup_pending_funcs to not be mixed with bitmap
> vs boolean?
> 
ACK
>>  };
>>  
>>  #define INCRX_BURST_MODE 0
>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>> index 89a4dc8ebf94..3289e57471f4 100644
>> --- a/drivers/usb/dwc3/gadget.c
>> +++ b/drivers/usb/dwc3/gadget.c
>> @@ -276,8 +276,6 @@ int dwc3_send_gadget_generic_command(struct dwc3 *dwc, unsigned int cmd,
>>  	return ret;
>>  }
>>  
>> -static int __dwc3_gadget_wakeup(struct dwc3 *dwc, bool async);
>> -
>>  /**
>>   * dwc3_send_gadget_ep_cmd - issue an endpoint command
>>   * @dep: the endpoint to which the command is going to be issued
>> @@ -2351,10 +2349,8 @@ static int dwc3_gadget_get_frame(struct usb_gadget *g)
>>  	return __dwc3_gadget_get_frame(dwc);
>>  }
>>  
>> -static int __dwc3_gadget_wakeup(struct dwc3 *dwc, bool async)
>> +static int __dwc3_gadget_wakeup(struct dwc3 *dwc)
>>  {
>> -	int			retries;
>> -
>>  	int			ret;
>>  	u32			reg;
>>  
>> @@ -2382,8 +2378,7 @@ static int __dwc3_gadget_wakeup(struct dwc3 *dwc, bool async)
>>  		return -EINVAL;
>>  	}
>>  
>> -	if (async)
>> -		dwc3_gadget_enable_linksts_evts(dwc, true);
>> +	dwc3_gadget_enable_linksts_evts(dwc, true);
>>  
>>  	ret = dwc3_gadget_set_link_state(dwc, DWC3_LINK_STATE_RECOV);
>>  	if (ret < 0) {
>> @@ -2404,25 +2399,6 @@ static int __dwc3_gadget_wakeup(struct dwc3 *dwc, bool async)
>>  	 * Since link status change events are enabled we will receive
>>  	 * an U0 event when wakeup is successful. So bail out.
>>  	 */
>> -	if (async)
>> -		return 0;
>> -
>> -	/* poll until Link State changes to ON */
>> -	retries = 20000;
>> -
>> -	while (retries--) {
>> -		reg = dwc3_readl(dwc->regs, DWC3_DSTS);
>> -
>> -		/* in HS, means ON */
>> -		if (DWC3_DSTS_USBLNKST(reg) == DWC3_LINK_STATE_U0)
>> -			break;
>> -	}
>> -
>> -	if (DWC3_DSTS_USBLNKST(reg) != DWC3_LINK_STATE_U0) {
>> -		dev_err(dwc->dev, "failed to send remote wakeup\n");
>> -		return -EINVAL;
>> -	}
>> -
>>  	return 0;
>>  }
>>  
>> @@ -2443,7 +2419,7 @@ static int dwc3_gadget_wakeup(struct usb_gadget *g)
>>  		spin_unlock_irqrestore(&dwc->lock, flags);
>>  		return -EINVAL;
>>  	}
>> -	ret = __dwc3_gadget_wakeup(dwc, true);
>> +	ret = __dwc3_gadget_wakeup(dwc);
>>  
>>  	spin_unlock_irqrestore(&dwc->lock, flags);
>>  
>> @@ -2471,14 +2447,10 @@ static int dwc3_gadget_func_wakeup(struct usb_gadget *g, int intf_id)
>>  	 */
>>  	link_state = dwc3_gadget_get_link_state(dwc);
>>  	if (link_state == DWC3_LINK_STATE_U3) {
>> -		ret = __dwc3_gadget_wakeup(dwc, false);
>> -		if (ret) {
>> -			spin_unlock_irqrestore(&dwc->lock, flags);
>> -			return -EINVAL;
>> -		}
>> -		dwc3_resume_gadget(dwc);
>> -		dwc->suspended = false;
>> -		dwc->link_state = DWC3_LINK_STATE_U0;
>> +		dwc->func_wakeup_pending |= BIT(intf_id);
>> +		ret = __dwc3_gadget_wakeup(dwc);
>> +		spin_unlock_irqrestore(&dwc->lock, flags);
>> +		return ret;
>>  	}
>>  
>>  	ret = dwc3_send_gadget_generic_command(dwc, DWC3_DGCMD_DEV_NOTIFICATION,
>> @@ -4300,6 +4272,7 @@ static void dwc3_gadget_linksts_change_interrupt(struct dwc3 *dwc,
>>  {
>>  	enum dwc3_link_state	next = evtinfo & DWC3_LINK_STATE_MASK;
>>  	unsigned int		pwropt;
>> +	int			ret, intf_id = 0;
> 
> Can we keep declarations in separate lines?
> 
OK
>>  
>>  	/*
>>  	 * WORKAROUND: DWC3 < 2.50a have an issue when configured without
>> @@ -4375,7 +4348,7 @@ static void dwc3_gadget_linksts_change_interrupt(struct dwc3 *dwc,
>>  
>>  	switch (next) {
>>  	case DWC3_LINK_STATE_U0:
>> -		if (dwc->gadget->wakeup_armed) {
>> +		if (dwc->gadget->wakeup_armed || dwc->func_wakeup_pending) {
>>  			dwc3_gadget_enable_linksts_evts(dwc, false);
>>  			dwc3_resume_gadget(dwc);
>>  			dwc->suspended = false;
>> @@ -4398,6 +4371,21 @@ static void dwc3_gadget_linksts_change_interrupt(struct dwc3 *dwc,
>>  	}
>>  
>>  	dwc->link_state = next;
>> +
>> +	/* Proceed with func wakeup if any interfaces that has requested */
>> +	while (dwc->func_wakeup_pending && (next == DWC3_LINK_STATE_U0)) {
>> +		if (dwc->func_wakeup_pending & BIT(0)) {
>> +			ret = dwc3_send_gadget_generic_command(dwc, DWC3_DGCMD_DEV_NOTIFICATION,
>> +							       DWC3_DGCMDPAR_DN_FUNC_WAKE |
>> +							       DWC3_DGCMDPAR_INTF_SEL(intf_id));
>> +			if (ret)
>> +				dev_err(dwc->dev, "function remote wakeup failed for %d, ret:%d\n",
>> +					intf_id, ret);
>> +		}
>> +		dwc->func_wakeup_pending >>= 1;
> 
> This would break the bitmap of dwc->func_wakeup_pending. Perhaps we can
> use ffs(x) to properly find and clear the interface ID from the bitmap
> one at a time.
> 
Yes, we can use ffs(x). But I didn't understand how this would break
bitmap of dwc->func_wakeup_pending.

Regards,
Prashanth K
>> +		intf_id++;
>> +	}
>> +
>>  }
>>  
>>  static void dwc3_gadget_suspend_interrupt(struct dwc3 *dwc,
>> -- 
>> 2.25.1
>>
> 
> Thanks,
> Thinh

