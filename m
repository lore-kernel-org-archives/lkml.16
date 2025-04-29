Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5572C2593
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 13:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745934627; cv=none; b=Z7Wf0U4zflLe1MGX8LDuf4loVbnjk1YQNIcAnDkBftVSEKcJVqWeKUqLQzFw3YXugyK0VHHDMyfq6Mb/GNqGeHXJXAUf84G3i2a0WI907LAW3iFXcdgKIKb838md6s9QlUmiE3hH+fuNgMEbzqrTj4Y/hM4GYyPtCfb73mOLw6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745934627; c=relaxed/simple;
	bh=pNVA3yUdtuzFRIJCTZxPJgmMwtsW1RNQDJVbVdA+ihU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hhoObexIfr0ldnwPnkJicqVyMkv0jtTlSpY4P9LKWwhLP0thEIvN/K2fAzLUXqa7tOhPmaFRJzdXYdMJTX4aYm8h/jQYKKCI1ly9A+KzqV7V2qExD983PhlhYTjWGHFqvpio5hiHcCHHqSJbn9Oyf3bq30k9h28sBa2uJa6KF0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IUitJmAP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IUitJmAP"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TA45qN000499
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 13:50:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SNp59J5iomOJH7AwesSP8ImSI53CstzMhFLTRQKtPBM=; b=IUitJmAPhXVFeZ2Z
	gfJqhjUV++I+juysfy4aPZxdBAwta+pf8w+km8xki1OK/FV/UxC18UJlnvFgPDkT
	iUZplEWkFdF5hKq24EcVKmZIsiPsDspmLXT9+8Bcm2SHphhUHKSA/5cBLVdQ5A6a
	VmLGA4UoyaDqe5NnLC/3ul1RJZ6VMpx5Ec4YbCtuIrXh1AdFCLy13JHAuotKITYg
	rAlYTVEC05t35DtH5ZpsMsV5BF2J+UByz2m2PMUkGy50mGe5RiLUZQjESeyTedHu
	GpQDIqtfnmHn+jiatiXc6Mpkq06bjEEnudDMbvbcw6JScsBbaov/hSFaINdBzcsQ
	yLRR8w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qv9mqp1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 13:50:24 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-740270e168aso898739b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:50:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745934623; x=1746539423;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SNp59J5iomOJH7AwesSP8ImSI53CstzMhFLTRQKtPBM=;
        b=Kd4rtL0WaR18cGcrAjoyGUdq1iPAq59oa0MyM+nrqib0rnvIGD1RLI7sb3LuHT7KTd
         h2v8oZEATRo15iGJjm49AFRD8GDR0rCXXpA7Xy15naPEuUAjes2/Wt3DAGJ+HWq9cl99
         vxVioFkNEgTbcja9Pj91U6lMEXLF3zi+KH+QMqsVVE+2SxgqmjbZQNA7wQXpkxFDxnIC
         XH9my2czzfuPHhLhSsg94k0DRs9zImuk7Z2zoejeXSraR1U49T97P3zPtU5XS/Kxfpz0
         sMjWhZ6Jl7Zc1nz+/U4+353e+qhPnsd+EIxKUYQa01zDFkDFhzPQ+2qnVient84HS9bb
         IPrA==
X-Forwarded-Encrypted: i=1; AJvYcCV5GUySCwkkrE+bgv7rffG6/FmWI9tK6YXjujtd/F3fAQbCWGpeO7ok7y0d9/yQXkDeNhyQjljRVCW3tgM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ3HYndUdSDL8ko+NigLl+YWX2ErzTpCjcYfNPwoOO+MfP3j9T
	EP9iUIurY57PuCnjr7ZDG6efmqXbjtIjYdDpm250i7QkTgiktPdxLwS3yMmaCdXJiiUru5orXeV
	kMTvsclBfOxCYLJD2KgZQSiqcaVr+Apuoo/GqAFxmzJteaaJ12wxqltMbcpc/IVA=
X-Gm-Gg: ASbGncu4NMil7W08dBhQDurW3zEn0DUBJ3JPMao/ovh5BFC+iKBnsWN33EXoHa2Px83
	2GmbTIBzPzrhsfz1r71pHSoU0bbF6yuiMFNGDN4vswcFhkU38rpg7YtxfgevYg7lNR059XKYgkV
	knC8H+/XsDEKUNbYf+BK9UjwSC0Vfy4PoGDp5yRMzlJnF/HvAbA0oClRxSvnQJynzG7usyyVpRV
	kZKygP0iz2aNXZj/qHyDcuzESU1WIyCP900fac2FNrlRfh+mwo98azyhN3QkDx34Ni+OdgEWkho
	XrN/TJ3NB9I4wLlmE3EDYKC3qHpbaHc3kWZxwBlirA==
X-Received: by 2002:a05:6a20:9f8d:b0:1f5:591b:4f73 with SMTP id adf61e73a8af0-2095cec6f1fmr5013770637.34.1745934622852;
        Tue, 29 Apr 2025 06:50:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZ1Hs07nM8pbCvHdyOw4NpYaP5IscOjEH/QHj+OMrXO5dOXE74CPSPs6RZSKwmRc/MVhNwhw==
X-Received: by 2002:a05:6a20:9f8d:b0:1f5:591b:4f73 with SMTP id adf61e73a8af0-2095cec6f1fmr5013719637.34.1745934622482;
        Tue, 29 Apr 2025 06:50:22 -0700 (PDT)
Received: from [192.168.1.5] ([122.181.59.87])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1d59d45835sm2960800a12.67.2025.04.29.06.50.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 06:50:22 -0700 (PDT)
Message-ID: <af771944-8236-462f-9097-2bf2336b361c@oss.qualcomm.com>
Date: Tue, 29 Apr 2025 19:20:18 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: gadget: hid: allow dynamic interval configuration
 via configfs
To: hoff.benjamin.k@gmail.com
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20250429133310.353977-1-hoff.benjamin.k@gmail.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20250429133310.353977-1-hoff.benjamin.k@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AO34vM+d c=1 sm=1 tr=0 ts=6810d920 cx=c_pps a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=AUjW7Mkc7c/oSMVHW5GiBQ==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=kMQm_GXyaO1MJtTyCWUA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: Vy1MhL9DcgP0kru25XiTLRJzmzxiqIgt
X-Proofpoint-ORIG-GUID: Vy1MhL9DcgP0kru25XiTLRJzmzxiqIgt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDEwMyBTYWx0ZWRfX6DjgYXxHWkLn wWzn4xl2mcDm/OczAAr+PEHbGLOtdhx9AJJKQYYToQqE/Gt0ZfFRd4etkaTPqTZAaaTs6D0fwaV 9IMQrBzsiXEDpNp/rIlNeTKlLR0EZNEyP30rJRy7pgEmiCy0RhpPOziA8ZsP7fX9H69Q3d/0mFZ
 Px+A+3ofFLRahbDEbetb0q/8YvaWb44pa1GGbo5zzIWxS2efzM3bEtqXy1hSRapcWlR/cwIYx+b WsM6Ab30U/UaujkMFyfc8LiEOjVLU10Rz25kdRA1vYdis+ZlXREduJWeYQjxMBNbFeGlaFumaeO tr9oTrdpCc9Yhm2shKxMJsVV/8iJ+78VsW8ISck1CqXLIrMOVaGaj3q6zxi+/gso0zHZKOS8JTD
 uOSbvt/POLpt3x6By+NsReyesqPD4Dh+tP5bZEH7li3G5JA1XXS1wi0jBoIiduz31GuOQAk8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 mlxlogscore=821 mlxscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290103



On 4/29/2025 7:03 PM, hoff.benjamin.k@gmail.com wrote:
> From: Ben Hoff <hoff.benjamin.k@gmail.com>
> 
> This patch adds support for dynamically configuring the polling interval
> (bInterval) for HID function drivers using configfs. This enables
> custom HID gadgets with user-specified poll rates without recompilation.
> 
> Signed-off-by: Ben Hoff <hoff.benjamin.k@gmail.com>
> ---
>   drivers/usb/gadget/function/f_hid.c | 54 ++++++++++++++---------------
>   drivers/usb/gadget/function/u_hid.h |  1 +
>   2 files changed, 27 insertions(+), 28 deletions(-)
> 

[...]

> @@ -1468,6 +1462,9 @@ static struct usb_function_instance *hidg_alloc_inst(void)
>   	if (!opts)
>   		return ERR_PTR(-ENOMEM);
>   	mutex_init(&opts->lock);
> +
> +	opts->interval = 10;
> +

The default value was 10 only for hidg_hs_descriptors_intout.
Aren't we now making it 10 for all other ep descriptors as well ?

Regards,
Krishna,

>   	opts->func_inst.free_func_inst = hidg_free_inst;
>   	ret = &opts->func_inst;
>   
> @@ -1546,6 +1543,7 @@ static struct usb_function *hidg_alloc(struct usb_function_instance *fi)
>   	hidg->bInterfaceProtocol = opts->protocol;
>   	hidg->report_length = opts->report_length;
>   	hidg->report_desc_length = opts->report_desc_length;
> +	hidg->interval = opts->interval;
>   	if (opts->report_desc) {
>   		hidg->report_desc = kmemdup(opts->report_desc,
>   					    opts->report_desc_length,
> diff --git a/drivers/usb/gadget/function/u_hid.h b/drivers/usb/gadget/function/u_hid.h
> index 84bb70292855..a29dcb14f738 100644
> --- a/drivers/usb/gadget/function/u_hid.h
> +++ b/drivers/usb/gadget/function/u_hid.h
> @@ -25,6 +25,7 @@ struct f_hid_opts {
>   	unsigned short			report_desc_length;
>   	unsigned char			*report_desc;
>   	bool				report_desc_alloc;
> +	unsigned char			interval;
>   
>   	/*
>   	 * Protect the data form concurrent access by read/write
