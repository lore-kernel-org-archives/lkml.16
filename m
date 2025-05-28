Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D781FECB1
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 06:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748413659; cv=none; b=eK/h4e3yzUoQBWN6vIhjhWlWmITSq5CZd7GSr6e0BM2H7mHeHyvOqPsEv2KFsBrl0ZvtOqLW/MjUuOKNFwfHasezSl+p8iHGg+U/uAoW5cLpCsQhr4Au+56dCiv31vGLKfkb7B9vzqQ48GTzLzM5wrht2b9XR4aVTCKNbzImCqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748413659; c=relaxed/simple;
	bh=f1WOn5bnj2UiZh1qSh/Jp9KeecmIWyjy1z5A+Z1c9OQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KyiWSmkmnPMacMP37zNi7Ayx6SZwshYJSQVhUkWcCiFO0LJQ56JCw0KFvTkRHZEuFbwnDvTk3g71lHTBJsv9oo5fu7AOv3xOkgRIpfksEWP6bQ6lluOsZY6etdCEU5KchgFy/DUpsdJOv0j2o2bWL01hk9hhc+eOYEeHHOaAMm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eaaNt+T6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eaaNt+T6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748413656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CvTHk+O/1QSNVGu8SxpKsRTrNLnlauH5F8Emt0iiKkY=;
	b=eaaNt+T6QDoaQZJSl2MSTtuC4JpXgoOBMWS9O9zUK6Vy78dvs4Qn+1howh/kzjERe2lpiz
	bUSK4WXNQhWUqL60Y9v5yXuUoBv/cKOZAhu+lklV731tpM6ffAeJPruhiD6DEFN1vzpNQz
	BelylX8xn/PzTCuOlZyUjhcQherBU/Y=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-244-AlZ8X7HAMYqlT6CImxv_rw-1; Wed, 28 May 2025 02:27:35 -0400
X-MC-Unique: AlZ8X7HAMYqlT6CImxv_rw-1
X-Mimecast-MFC-AGG-ID: AlZ8X7HAMYqlT6CImxv_rw_1748413654
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4dde7eec6so1645626f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 23:27:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748413654; x=1749018454;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CvTHk+O/1QSNVGu8SxpKsRTrNLnlauH5F8Emt0iiKkY=;
        b=el+BSmMexH/kCLmltBwqwQLbXIJOReBnVoTeSR96IcLLj9WUG4MQ2kZT6PCMq2yAmE
         57nz0+4a+BoMsdLn14hFYNkr4kxVSB6RQNIur5amJn5NR1RZtDVtoM9aTMvqcnIRl8rH
         59MSF3xivjQNflpED2XNS1bzaSfkaEDpUKO6m+bcxaKHqK8Uzzj/Zt/P6SKifWAqLb8J
         mUxoBuI5SOPvfhBPj8N/fd8/Ceer+AoJhkg7HjD2fgE0rJuj8ZvFQNp9PKQWSvqBL4Gv
         IvyGV3rF4RZsuB3+yBZG01AfTFX7gKAT7aZT+4RlZ2QlZbyZ3rKhBYLMllMj+KFvcjbL
         bbLA==
X-Forwarded-Encrypted: i=1; AJvYcCXsDidR9Eorg+MczaLJokNdM1wuYAfpNaiVbcj6EY1TDeH0vAB/P12MmAj5Otsr3oIRflQIUHiynFOQpWo=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv4CDuQ95UU8qY6r9+whsWSl7dt9jAYARDpsFBc3Nj0YVfcPe6
	r1jFizJB60yEWya3v95MAuxakMQ24q8e3g8scAFYjx1tThpC6xyillrnA8ThrvvTCJBo1Fi0OSO
	UgbqP7vG66rw7kcrllyA+KyxtFraahmmmHh3loTVsPsVM7flOxSrMeGCNnSckFqThcA==
X-Gm-Gg: ASbGncuDwEHHVW3n/aM6aco6edIPLv/RQIf3DVREXayQAJ9MammVau7P6y5wcWH1tXO
	3QiDKPb8yeZ59i0B8jzx1iqIrREy+lZwVYDJzOmA5S6oY4itcIBGw1ToMT3yjEdRkzabzRrm0sP
	v2rdak+BR0n2O+a1kevu4fcLxMf015WdY8y1I9R4LJDdYGfXw5X4FNpbTUPC5cPd0cJnrbhdFJQ
	lSSAUyGX1xLHwKOCY1FcBfYb1VuRsuTOros6+gmv+8LX6Z2C1+f3fA6+yE2v2lrUR68J2oop+kE
	YznWvMMDMPEoW2b9cbaOa+6zgDtAxGKqLAbJywbrd4QCzECLmjp/10xu1DQ=
X-Received: by 2002:a05:6000:250f:b0:3a4:ea9a:1656 with SMTP id ffacd0b85a97d-3a4ea9a16ddmr675508f8f.10.1748413654185;
        Tue, 27 May 2025 23:27:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3ksxKXCaZGLNbvzK9nMv3YAIr7uCKvT4NZXCaUrz8CA2YqI+qp5uV65PPS+UexzqChEwaNw==
X-Received: by 2002:a05:6000:250f:b0:3a4:ea9a:1656 with SMTP id ffacd0b85a97d-3a4ea9a16ddmr675469f8f.10.1748413653728;
        Tue, 27 May 2025 23:27:33 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2728:e810:827d:a191:aa5f:ba2f? ([2a0d:3344:2728:e810:827d:a191:aa5f:ba2f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4eac7ea29sm573113f8f.37.2025.05.27.23.27.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 23:27:33 -0700 (PDT)
Message-ID: <648d56af-ed86-4d45-8e7a-944d1563117c@redhat.com>
Date: Wed, 28 May 2025 08:27:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [PATCH net-next,v2] net: mana: Add support for
 Multi Vports on Bare metal
To: Haiyang Zhang <haiyangz@microsoft.com>, Simon Horman <horms@kernel.org>
Cc: "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Dexuan Cui <decui@microsoft.com>,
 "stephen@networkplumber.org" <stephen@networkplumber.org>,
 KY Srinivasan <kys@microsoft.com>, Paul Rosswurm <paulros@microsoft.com>,
 "olaf@aepfle.de" <olaf@aepfle.de>, "vkuznets@redhat.com"
 <vkuznets@redhat.com>, "davem@davemloft.net" <davem@davemloft.net>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>,
 "edumazet@google.com" <edumazet@google.com>,
 "kuba@kernel.org" <kuba@kernel.org>, "leon@kernel.org" <leon@kernel.org>,
 Long Li <longli@microsoft.com>,
 "ssengar@linux.microsoft.com" <ssengar@linux.microsoft.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "daniel@iogearbox.net" <daniel@iogearbox.net>,
 "john.fastabend@gmail.com" <john.fastabend@gmail.com>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "ast@kernel.org"
 <ast@kernel.org>, "hawk@kernel.org" <hawk@kernel.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "shradhagupta@linux.microsoft.com" <shradhagupta@linux.microsoft.com>,
 "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
 Konstantin Taranov <kotaranov@microsoft.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <1747671636-5810-1-git-send-email-haiyangz@microsoft.com>
 <20250521140231.GW365796@horms.kernel.org>
 <MN0PR21MB34373B1A0162D8452018ABAACA9EA@MN0PR21MB3437.namprd21.prod.outlook.com>
 <20250522120229.GX365796@horms.kernel.org>
 <5470f2d2-d3cb-4451-b8e8-5ee768ed9741@redhat.com>
 <MN0PR21MB3437196CFAF4574776862F6ACA99A@MN0PR21MB3437.namprd21.prod.outlook.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <MN0PR21MB3437196CFAF4574776862F6ACA99A@MN0PR21MB3437.namprd21.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/22/25 4:51 PM, Haiyang Zhang wrote:
>> -----Original Message-----
>> From: Paolo Abeni <pabeni@redhat.com>
>> Sent: Thursday, May 22, 2025 9:44 AM
>> To: Simon Horman <horms@kernel.org>; Haiyang Zhang
>> <haiyangz@microsoft.com>
> 
>>>>>>  static int mana_query_device_cfg(struct mana_context *ac, u32
>>>>> proto_major_ver,
>>>>>>  				 u32 proto_minor_ver, u32 proto_micro_ver,
>>>>>> -				 u16 *max_num_vports)
>>>>>> +				 u16 *max_num_vports, u8 *bm_hostmode)
>>>>>>  {
>>>>>>  	struct gdma_context *gc = ac->gdma_dev->gdma_context;
>>>>>>  	struct mana_query_device_cfg_resp resp = {};
>>>>>> @@ -932,7 +932,7 @@ static int mana_query_device_cfg(struct
>> mana_context
>>>>> *ac, u32 proto_major_ver,
>>>>>>  	mana_gd_init_req_hdr(&req.hdr, MANA_QUERY_DEV_CONFIG,
>>>>>>  			     sizeof(req), sizeof(resp));
>>>>>>
>>>>>> -	req.hdr.resp.msg_version = GDMA_MESSAGE_V2;
>>>>>> +	req.hdr.resp.msg_version = GDMA_MESSAGE_V3;
>>>>>>
>>>>>>  	req.proto_major_ver = proto_major_ver;
>>>>>>  	req.proto_minor_ver = proto_minor_ver;
>>>>>
>>>>>> @@ -956,11 +956,16 @@ static int mana_query_device_cfg(struct
>>>>> mana_context *ac, u32 proto_major_ver,
>>>>>>
>>>>>>  	*max_num_vports = resp.max_num_vports;
>>>>>>
>>>>>> -	if (resp.hdr.response.msg_version == GDMA_MESSAGE_V2)
>>>>>> +	if (resp.hdr.response.msg_version >= GDMA_MESSAGE_V2)
>>>>>>  		gc->adapter_mtu = resp.adapter_mtu;
>>>>>>  	else
>>>>>>  		gc->adapter_mtu = ETH_FRAME_LEN;
>>>>>>
>>>>>> +	if (resp.hdr.response.msg_version >= GDMA_MESSAGE_V3)
>>>>>> +		*bm_hostmode = resp.bm_hostmode;
>>>>>> +	else
>>>>>> +		*bm_hostmode = 0;
>>>>>
>>>>> Hi,
>>>>>
>>>>> Perhaps not strictly related to this patch, but I see
>>>>> that mana_verify_resp_hdr() is called a few lines above.
>>>>> And that verifies a minimum msg_version. But I do not see
>>>>> any verification of the maximum msg_version supported by the code.
>>>>>
>>>>> I am concerned about a hypothetical scenario where, say the as yet
>> unknown
>>>>> version 5 is sent as the version, and the above behaviour is used,
>> while
>>>>> not being correct.
>>>>>
>>>>> Could you shed some light on this?
>>>>>
>>>>
>>>> In driver, we specify the expected reply msg version is v3 here:
>>>> req.hdr.resp.msg_version = GDMA_MESSAGE_V3;
>>>>
>>>> If the HW side is upgraded, it won't send reply msg version higher
>>>> than expected, which may break the driver.
>>>
>>> Thanks,
>>>
>>> If I understand things correctly the HW side will honour the
>>> req.hdr.resp.msg_version and thus the SW won't receive anything
>>> it doesn't expect. Is that right?
>>
>> @Haiyang, if Simon's interpretation is correct, please change the
>> version checking in the driver from:
>>
>> 	if (resp.hdr.response.msg_version >= GDMA_MESSAGE_V3)
>>
>> to
>> 	if (resp.hdr.response.msg_version == GDMA_MESSAGE_V3)
>>
>> As the current code is misleading.
> 
> Simon:
> Yes, you are right. So newer HW can support older driver, and vice
> versa.
> 
> Paolo:
> The MANA protocol doesn't remove any existing fields during upgrades.
> 
> So (resp.hdr.response.msg_version >= GDMA_MESSAGE_V3) will continue
> to work in the future. If we change it to 
> (resp.hdr.response.msg_version == GDMA_MESSAGE_V3), 
> we will have to remember to update it to something like:
> (resp.hdr.response.msg_version >= GDMA_MESSAGE_V3 &&
>  resp.hdr.response.msg_version <= GDMA_MESSAGE_V5), 
> if the version is upgraded to v5 in the future. And keep on updating
> the checks on existing fields every time when the version is
> upgraded.
> 
> So, can I keep the ">=" condition, to avoid future bug if anyone
> forget to update checks on all existing fields?

Ok, thanks for the clarification. fine by me.

/P

