Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4161F561C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 20:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743797724; cv=none; b=sRpht5Y30P1vUAlwXddj4b7b9smtYeMRFOe9V/dQpUz0BXm9UYabyuZoiwwgwv17c31WCsYO7QZhUQ7ZX0gsPZAtD72B8gEyt8Yb/ZXAXLEEbhyDEySB2ZRb6Ouugz8EBXZQ+6A4idUAkE/klBJiPyc0oN2Wxuzsl+9nJHjXX+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743797724; c=relaxed/simple;
	bh=FNMLVPOYURQjDIbEqTZeHZjf8H6jXyblhUfeS+qvi4w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QsHKeFOOefYdTwehyLp7hBdASBQIZkrKLc94X8B5VIo+YY9oSMGvog5gO33b25N1whzUZQVILHA4PXJ02btsm7R0kvwm0+sbhzmTEt25tmwTa+okWpTitCA54rzUMfc5vQJP26AzL0n0snUjzDr7ScuiDfMzwSu24huwFqFbv8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall-org.20230601.gappssmtp.com header.i=@blackwall-org.20230601.gappssmtp.com header.b=XPesGFd1; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall-org.20230601.gappssmtp.com header.i=@blackwall-org.20230601.gappssmtp.com header.b="XPesGFd1"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso25831285e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 13:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1743797721; x=1744402521; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dDPtzrDQm7D2KJ6r1jIrDZFX1ist1md5kdhYkAXF22A=;
        b=XPesGFd11XG/G9/8I0Orw8ceBOcaqCOKXfhjKp66c+6JCzZPMreK5fAa4hhTvTwBCX
         w8jo1RyhEPAePdo/VnMyruwPcFOtSUHnyfjpPqqvbSCi/0EvzUNkU7uXNa8g7NVJyAZr
         YNvJtZpWZjNXmdzLM7OON1iMX3DYcIPDJdguFOzABYweqQ4sGoKVdQUzs01Iy+wGxN76
         a9aQdvuNA2kgbJiv0OO0nJW2TmobnWwi+yLSKhOVSC/OGBXCuX9Y2/G1tNdZxeybbWzu
         5dy+l9eSNMq8I1rzFM/I8RnQqjT/uvZECeAwwCYhCbLqiSXl4maB3G4o6dKN1JCNDAje
         zc9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743797721; x=1744402521;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dDPtzrDQm7D2KJ6r1jIrDZFX1ist1md5kdhYkAXF22A=;
        b=u7o+ACLb2QtSHBFrwtO2N3B3mPdHDEyUKXj8j2OgxLe+D254olPG9Eik6YKGrNySXy
         HSIP4oePedkMuAYuyTsyJGMD9hZAzy+HP8w+gUjdSloMseMrjRFilnvTKJaPO0PeNhX4
         fDjp00WKJHafQXc9Ah7tBUfdCM8Q3r25klXsQMmy60S4q7RfY3h6epDSl3LtrtxxSUTR
         to9IMTMCiyOTBU9bZ9RAp760SZnL5EYIkuoQ2Q2SMfvBefMlWm59thfPQLJ6Og0xb4FG
         zcS98eXfyeij4fdX7HmTAdDj7aqIwuB0Ue5hLe3YlGboHIdliMuZ8bSgmv/u98SaOkCS
         kt5A==
X-Forwarded-Encrypted: i=1; AJvYcCXEx99Rz1ZexarxRitsyW0yeB54ivjrM6MajTwzUOvBf6gJQvhdafIn0wPkGfmBUgVJNh0slIAfiPNy43Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEtOBPPnOPTUtgVxOw7RPOkK57tKmBrI9fQ/EYouavLh98jDCv
	kIbVJhjRN3rBfM4PSU1m2sOLsc2RTwwpWWtQixavUJl5DFp4KThHyWcX3SM0IjY=
X-Gm-Gg: ASbGncs6B0JoZdiaulz2FiH45SAH9o+4cd+v4Y7KaBolVW5Tb45KZQEshGdFyigR6Rp
	JRa277gvuQPPryu+NXEU3C7byKL0qahcMc7LubM/WhrLS94hIzWl14V2qY18nWNO06QRho2SDpA
	8v9zohuvgI18Hsp/1m3i1iM4DNUf4WsQVhAa47nhyQnY7RWOJ5TAFsEYOdHHONGc9zo8e6ok4fn
	4IfXzJm8NLe/Q66L0wfj3cS3dGmFDSnh7oqRFk8K2dAzJ0t+oYHwD+DpSCTFlBV+CKyIKx1q3Ng
	rCYHN7nxCF9lv0QXQrnMMMfgA8NjuLGhdyVww82ruZz+5/WPH7qolqIwECOi6iOjg4dc2kR3HKm
	4
X-Google-Smtp-Source: AGHT+IGVOzLfgvsBZseM5TV3JdkQLxAe0MfgoooeouE9pQaId+9aWIcjjMv6iTb0EZIAoYH8aCKyuQ==
X-Received: by 2002:a05:6000:4305:b0:391:4914:3c6a with SMTP id ffacd0b85a97d-39d0de27eeamr3277151f8f.29.1743797720808;
        Fri, 04 Apr 2025 13:15:20 -0700 (PDT)
Received: from [192.168.0.205] (78-154-15-142.ip.btc-net.bg. [78.154.15.142])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a7064sm5279408f8f.34.2025.04.04.13.15.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 13:15:20 -0700 (PDT)
Message-ID: <96bda215-bee1-4ff7-9d88-b97922ca7b1a@blackwall.org>
Date: Fri, 4 Apr 2025 23:15:19 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch v2 net-next 3/3] net: bridge: mcast: Notify on mdb offload
 failure
To: Joseph Huang <joseph.huang.2024@gmail.com>,
 Joseph Huang <Joseph.Huang@garmin.com>, netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Roopa Prabhu <roopa@nvidia.com>, Simon Horman <horms@kernel.org>,
 linux-kernel@vger.kernel.org, bridge@lists.linux.dev
References: <20250403234412.1531714-1-Joseph.Huang@garmin.com>
 <20250403234412.1531714-4-Joseph.Huang@garmin.com>
 <36c7286d-b410-4695-b069-f79605feade4@blackwall.org>
 <917d4124-c389-4623-836d-357150b45240@gmail.com>
 <abb9e2c1-c4b5-4ffa-b2e3-8b204da5efca@blackwall.org>
 <9e7f6c4c-cabe-46e9-b59f-6638b4ae25e3@gmail.com>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <9e7f6c4c-cabe-46e9-b59f-6638b4ae25e3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 4/4/25 23:11, Joseph Huang wrote:
> On 4/4/2025 4:04 PM, Nikolay Aleksandrov wrote:
>> On 4/4/25 18:25, Joseph Huang wrote:
>>> On 4/4/2025 6:29 AM, Nikolay Aleksandrov wrote:
>>>> On 4/4/25 02:44, Joseph Huang wrote:
>>>>> Notify user space on mdb offload failure if mdb_offload_fail_notification
>>>>> is set.
>>>>>
>>>>> Signed-off-by: Joseph Huang <Joseph.Huang@garmin.com>
>>>>> ---
>>>>>    net/bridge/br_mdb.c       | 26 +++++++++++++++++++++-----
>>>>>    net/bridge/br_private.h   |  9 +++++++++
>>>>>    net/bridge/br_switchdev.c |  4 ++++
>>>>>    3 files changed, 34 insertions(+), 5 deletions(-)
>>>>>
>>>>
>>>> The patch looks good, but one question - it seems we'll mark mdb entries with
>>>> "offload failed" when we get -EOPNOTSUPP as an error as well. Is that intended?
>>>>
>>>> That is, if the option is enabled and we have mixed bridge ports, we'll mark mdbs
>>>> to the non-switch ports as offload failed, but it is not due to a switch offload
>>>> error.
>>>
>>> Good catch. No, that was not intended.
>>>
>>> What if we short-circuit and just return like you'd suggested initially if err == -EOPNOTSUPP?
>>>
>>>>> diff --git a/net/bridge/br_switchdev.c b/net/bridge/br_switchdev.c
>>>>> index 40f0b16e4df8..9b5005d0742a 100644
>>>>> --- a/net/bridge/br_switchdev.c
>>>>> +++ b/net/bridge/br_switchdev.c
>>>>> @@ -504,6 +504,7 @@ static void br_switchdev_mdb_complete(struct net_device *dev, int err, void *pri
>>>>>        struct net_bridge_mdb_entry *mp;
>>>>>        struct net_bridge_port *port = data->port;
>>>>>        struct net_bridge *br = port->br;
>>>>> +    u8 old_flags;
>>>>>    
>>>
>>> +    if (err == -EOPNOTSUPP)
>>> +        goto notsupp;
>>>
>>>>>        spin_lock_bh(&br->multicast_lock);
>>>>>        mp = br_mdb_ip_get(br, &data->ip);
>>>>> @@ -514,7 +515,10 @@ static void br_switchdev_mdb_complete(struct net_device *dev, int err, void *pri
>>>>>            if (p->key.port != port)
>>>>>                continue;
>>>>>    +        old_flags = p->flags;
>>>>>            br_multicast_set_pg_offload_flags(p, !err);
>>>>> +        if (br_mdb_should_notify(br, old_flags ^ p->flags))
>>>>> +            br_mdb_flag_change_notify(br->dev, mp, p);
>>>>>        }
>>>>>    out:
>>>>>        spin_unlock_bh(&br->multicast_lock);
>>>>
>>>
>>> + notsupp:
>>>      kfree(priv);
>>
>> Looks good to me. Thanks!
> 
> Thanks for the review!
> 
> And a logistic question. Now that part 1 and part 2 are ack'd (thanks again for the review), when I send out v3, should I resend those (unmodified part 1 and part 2) with my v3 patch series, or should I break this one off and only send part 3 v3 as a separate patch?
> 
> Thanks,
> Joseph

You should send the whole set again as v3, but you should keep the acked-by tags in those patches.

Cheers,
 Nik

