Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB81A210F58
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 12:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743425530; cv=none; b=ND/KwnZT2Bgw8SxNHKynMIMk/KH3XAro/oHPyeA+0uwno89QcU/JlfqwfcRDyow7hKbHasKExxd6keMprtEQICD7vxNFNNwEaBHhWExIMepIO4byBL6nFy0jLJkuNu0RPwrV330r0Etbvzobp5gIWgoNvaGL7DL9WnJQ23wtHic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743425530; c=relaxed/simple;
	bh=Zc0HI/HpPRp4LKMEY0BpJbXpuNHzAcrT5EXAtIL0Yfo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fj1UQWrLMrJTm/zfuENMfn3352mDwJVvdb/Bl9TRAqn4y3JWLRfnAH0B9u05QcfIELvOYJgCbtgNuVL36t/zkryDnEMh/P4XpBXvPTVUhg9o62CBmb84yxnGeJCcYuspLmAZ1k9S2DkSz8xv2tSliVhnMHT336+WBlUMkS+SklA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall-org.20230601.gappssmtp.com header.i=@blackwall-org.20230601.gappssmtp.com header.b=zb1k7fF7; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall-org.20230601.gappssmtp.com header.i=@blackwall-org.20230601.gappssmtp.com header.b="zb1k7fF7"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac298c8fa50so746320666b.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 05:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1743425527; x=1744030327; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k6T65GxNTfj24quUriuBkHJ+dt0mRwDTK5ChQlYE9MI=;
        b=zb1k7fF78L7p2lW8pwD7S9ihYCto8WqhjkRCdivZba8VBtv5RoyVSt44MV4l5NcQ8I
         3mJUUzSof9a7Vvylag7RkP3+YqJt+TXv+/cke+TNwzXWouhwrXWK64Nq5PMxusjU9WjB
         bSejx+Jf1Csp6Y5CD2rMvezZO7dQUHTfE+bVhFZ+AUzXxKRWephW1LrMPfnCnZK8juaT
         HIvW0Z90WU0e7WBMOUzSZyB9SfNKGy2AAB8Dvnmu75ZLq2iba23rslw2qpXZA7YIn2Wo
         /YREvS8JumeNe7ZuwS79bUlONihU41+dvvoRH8mWePZ6d/57J/6AyYhGaKnko70KRfxZ
         Dnvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743425527; x=1744030327;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k6T65GxNTfj24quUriuBkHJ+dt0mRwDTK5ChQlYE9MI=;
        b=YLTfbrOceTtmW3Y77b5b2tyoiIrYh3q60OGLE6aFRUrxiTWuhkg6kQoj7F7VKcxkvn
         V6dcH13HSFR+uMxYKiWxbT/wb/g2RRM21IgwqWExUJ42QU+VPhHKqm+dLy8znlqWBwp+
         rbYe8QKPFmvm7LqT1R/sfuhKZDNUQI+x2K5+iDQ09pzla3O4Tjlchu4FIaYB67o69ems
         TqBV1JoZmnjLx0W+62QgCVW83BD2QgyB1apFp1XJ4tIJZg4ZRen/6F4fO/GqVj8Ryudi
         EL8x54WX7NGHepP9XL8qkMqK0O/D81EnEVXLQ17+79SjQN/nSPpokVjzWusVtPmOLUFO
         n71w==
X-Forwarded-Encrypted: i=1; AJvYcCXVFg944MtXMB3/gldW64vkWfPPHHBEbxlnmbUzc5fcIvDFieK7LinOvBYs+fDukohR39Xdw91GUgI7nJY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/drLLuhRCd2GxrsjGi3bupbk++ShMVn7CWtyO+TlFTd39J80I
	0Lqt3rCMGpAYUVxthkz99FRg8XMafGN43au3bV9VzCT7r5f+FYeXapr3trMEE20=
X-Gm-Gg: ASbGncvfUL2Th64boVSDlWPycVthSPdonJYxTzzGPCHwB4rc/pilAWLlBIe8+fHA9zq
	GOR/Tc8ULPdlYnZvxfWiXAApzgiz8shxDo2B6zHNkXJz0LOP0Ly5c2cIYbQoKYcOgpuMxAWw2/F
	3tpH5fW6NvDPwRxoQexWUVW6H65nxyKmW3F79ad0XT60R4Oy2NHvogPJfYcISOXzE+z8jrjyoSq
	kW4x96uhSok0AMIboKCKGfywJ12CoIyvpFacDeEttRRm8hTvpjGbOOzuTz1TjBKDVXOhwkOG2V7
	EtXOp67jGNjaNJ4/phQWNwAqvABltxqwkia4B7AZJfKOczgi42A=
X-Google-Smtp-Source: AGHT+IFxhdtbJTpnPbhUgLUozMESZ9/aqB70JTwf+Ggby43nXPU4gPgaePZldfj2ATJIUcnPh/2Ssw==
X-Received: by 2002:a17:907:8686:b0:ac3:ef11:8787 with SMTP id a640c23a62f3a-ac738b910e3mr905521466b.54.1743425526894;
        Mon, 31 Mar 2025 05:52:06 -0700 (PDT)
Received: from [100.115.92.205] ([109.160.74.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71927b150sm623687666b.46.2025.03.31.05.52.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 05:52:06 -0700 (PDT)
Message-ID: <da181580-56bd-460c-b2bf-16ebb86bbff5@blackwall.org>
Date: Mon, 31 Mar 2025 15:51:54 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch net-next 1/3] net: bridge: mcast: Add offload failed mdb
 flag
To: Joseph Huang <joseph.huang.2024@gmail.com>,
 Joseph Huang <Joseph.Huang@garmin.com>, netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Roopa Prabhu <roopa@nvidia.com>, Simon Horman <horms@kernel.org>,
 linux-kernel@vger.kernel.org, bridge@lists.linux.dev
References: <20250318224255.143683-1-Joseph.Huang@garmin.com>
 <20250318224255.143683-2-Joseph.Huang@garmin.com>
 <c90151bc-a529-4f4e-a0b9-5831a6b803f7@blackwall.org>
 <85a52bd9-8107-4cb8-b967-2646d0e74ab4@gmail.com>
 <ffe6f6cc-7157-48ad-9cde-dc38d8427849@blackwall.org>
 <8f51bb33-c5a5-4046-93d6-f58e841256e5@gmail.com>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <8f51bb33-c5a5-4046-93d6-f58e841256e5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/28/25 17:53, Joseph Huang wrote:
> On 3/27/2025 6:52 PM, Nikolay Aleksandrov wrote:
>> On 3/27/25 00:38, Joseph Huang wrote:
>>> On 3/21/2025 4:19 AM, Nikolay Aleksandrov wrote:
>>>>> @@ -516,11 +513,14 @@ static void br_switchdev_mdb_complete(struct 
>>>>> net_device *dev, int err, void *pri
>>>>>            pp = &p->next) {
>>>>>           if (p->key.port != port)
>>>>>               continue;
>>>>> -        p->flags |= MDB_PG_FLAGS_OFFLOAD;
>>>>> +
>>>>> +        if (err)
>>>>> +            p->flags |= MDB_PG_FLAGS_OFFLOAD_FAILED;
>>>>> +        else
>>>>> +            p->flags |= MDB_PG_FLAGS_OFFLOAD;
>>>>
>>>> These two should be mutually exclusive, either it's offloaded or it 
>>>> failed an offload,
>>>> shouldn't be possible to have both set. I'd recommend adding some 
>>>> helper that takes
>>>> care of that.
>>>
>>> It is true that these two are mutually exclusive, but strictly 
>>> speaking there are four types of entries:
>>>
>>> 1. Entries which are not offload-able (i.e., the ports are not backed 
>>> by switchdev)
>>> 2. Entries which are being offloaded, but results yet unknown
>>> 3. Entries which are successfully offloaded, and
>>> 4. Entries which failed to be offloaded
>>>
>>> Even if we ignore the ones which are being offloaded (type 2 is 
>>> transient), we still need two flags, otherwise we won't be able to 
>>> tell type 1 from type 4 entries.
>>>
>>> If we need two flags anyway, having separate flags for type 3 and 
>>> type 4 simplifies the logic.
>>>
>>> Or did I misunderstood your comments?
>>>
>>> Thanks,
>>> Joseph
>>
>> I think you misunderstood me, I don't mind having the two flags. :)
> 
> Got it. Thanks.
> 
>> My point is that they must be managed correctly and shouldn't be allowed
>> to be set simultaneously.
>>
>> Cheers,
>>   Nik
>>
> 
> Helper function like this?
> 
> +static void set_mdb_pg_offload_flags(bool err, u8 *flags)
> +{
> +    *flags &= ~(MDB_PG_FLAGS_OFFLOAD | MDB_PG_FLAGS_OFFLOAD_FAILED);
> +    *flags |= (err ? MDB_PG_FLAGS_OFFLOAD_FAILED : MDB_PG_FLAGS_OFFLOAD);
> +}

This could work, but I have to see how it aligns with the rest of the
code to be able to answer well. Also why not just pass the pg?
Please also choose another helper name, e.g.
br_multicast_set_pg_offload_flags() or something in these lines. You
can check br_private.h for other helpers to get an idea.

> 
> and then from the call site
> 
> -        p->flags |= MDB_PG_FLAGS_OFFLOAD;
> +        set_mdb_pg_offload_flags(err, &p->flags);
> 
> ?
> 
> Or simply clearing the flags in-line:
> 
> -        p->flags |= MDB_PG_FLAGS_OFFLOAD;
> +        p->flags &= ~(MDB_PG_FLAGS_OFFLOAD | MDB_PG_FLAGS_OFFLOAD_FAILED);
> +
> +        if (err)
> +            p->flags |= MDB_PG_FLAGS_OFFLOAD_FAILED;
> +        else
> +            p->flags |= MDB_PG_FLAGS_OFFLOAD;
> 
> ?

I'd prefer using a  helper. Thanks.

> 
> Thanks,
> Joseph

Cheers,
  Nik

