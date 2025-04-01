Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B4320409B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 13:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743514657; cv=none; b=gjv1dZIJ37kPQ25i2dIRoW6vxh33/HcXb40mArfy7YI3y9hp2GEi4azzyW59s/GC41y+NVj4U1SvDHyA+bEDcTnmvk4XSqa799h0JcX2tSbZKsohrUMnCrKarF8R0QqSZSkbbi2O63fi1/FafbrcyARzUscuk7bfiX/A3QZwUJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743514657; c=relaxed/simple;
	bh=ndA62IPoGH9yOQhIgbJe5pwm+uCM55NEM8zRjilsqXI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ot8cXwsFdWLrwd5L6jdKJ2RzIVSdwWpWzQGBoKgW7w6ISA7C38j8tbRgqti3Bhka69kYpfxrqk5balgiTisDW8t9IWfYNv0VxXtJBTLv5C7ARRZULWhpIeoc0qHjqfsGyuzNy3F9doazYIygGO2N8l58jeg5YTXZzDDaL2Md398=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall-org.20230601.gappssmtp.com header.i=@blackwall-org.20230601.gappssmtp.com header.b=XserGUBc; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall-org.20230601.gappssmtp.com header.i=@blackwall-org.20230601.gappssmtp.com header.b="XserGUBc"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac2963dc379so887570866b.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 06:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1743514652; x=1744119452; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N9vq9Y7ta6jWOmSWzWAKK0VbKk81vUsWbzbTf6o2lLc=;
        b=XserGUBcyEofC7rEOe3iPJsKRSM78H/HsiiL/jgToYO1RlBDfK9lxPH6ksz0WDOx97
         cgsD3eYlwZqY4Nbi2chHKBNgLDOYSHTxZotDYTUv4WwntZ8olz+SxLviYjM/SOZxNzDn
         vkgTWFPOVZW/L8weaYG/xMDyXBwfmSHSvOE7WCcVabNrS7qviiq1Z0ll/FTBcCqLM+eR
         fE0xJ7hCjm7lnGa2qUfbBFiXhHMtYOy+lko4amttxmFGQvS2Z1jPwOlNjmC64Dl3PeyH
         aV6Zw336SCfJz7VpuCoDIs8Vlc0raGIxzKn75YMsoYyxuaz3GkZzWypirXcS9l8K5Hzw
         NXUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743514652; x=1744119452;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N9vq9Y7ta6jWOmSWzWAKK0VbKk81vUsWbzbTf6o2lLc=;
        b=qbnZ3l86cFl7/H8J4MwEF75J+xqngLIaDc6crFqw98k75bP/rTautm4ELtgDhJodtc
         IIhdkm7wyGivPm6FaLVz8M7iFL2yz6zOO+rmHhX1CRHsKfIa2VOaQQZL+kl84+U2X8vn
         4qhf1P1xipPQtnVIrSl+x0GbM85kRxRoPS/ymEPaQvghmtf06irp6RnEpnlYWpSR397I
         SuZtq1smr/sTHK3KuDlXwGfnMgoVNKMLIhqfkATP2K1Q5WUfbeoMqhqrFY4rm1ZRgBO7
         pQBk6hOGhBcjCDHfTqnynNgdY3igt2iBAeyjDCYGyalE5VzdZm68p9inlAUb5tiw0w3c
         qWEw==
X-Forwarded-Encrypted: i=1; AJvYcCWSWwZEILvWc8JTdqFGGvCK7Yb5auirhTJDEJT+8l8JY/Nrj8V3xFLKZzO14x5XDj7acUycRgIWeoFdyIQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxKDnwVidan8tsQmJXU5yDKbKibA13fcWWQKdSmtLpkQtTXL9m
	yDnqY/nvvWQ50UBtXqQQ1mTwmeX+tQXd2yBco9+lFKtWqEcrmGtn0QfbPM8yyD0=
X-Gm-Gg: ASbGnctFx7Advnp3pC1envacNa9pU5mSn5vq7+V9eV/SGkisnqnIK2yY2CACuv9vf4I
	x7q4aEygpWplBLiGVhRN5YizR54XL7QyfKbxjWQ5kQKmoPhd6JZunLDpxecISGGSlEVKBK2XCyZ
	r8N1vl7D/PvfMhwp5iFsYt0zwZCwGJVTTB4RTw27I+ubQCYVb5GeTff2NH0P4uRZvvDAazlYhOS
	gg/Fk2IiRzZposNnWJXTm6Eo6dw26WBQQ/9TyiiiLUAJXohOsmbrWs4qX+CkQ8ImDwkr9OQJjZw
	GZy2o6z8vlfxURQxjuS9NQs8JecT4AaP263cLHFwaQexwjZGdXw=
X-Google-Smtp-Source: AGHT+IHNJXpxVfdIiGLEHtk3gjTRIi431LamAga11AAHZt1RjL91s0SqqkCxCWn42QykXSlnoBi7DQ==
X-Received: by 2002:a17:906:dc95:b0:ac2:9841:3085 with SMTP id a640c23a62f3a-ac738a557cdmr1209422966b.30.1743514651960;
        Tue, 01 Apr 2025 06:37:31 -0700 (PDT)
Received: from [100.115.92.205] ([109.160.74.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71961fd8csm781230966b.100.2025.04.01.06.37.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 06:37:31 -0700 (PDT)
Message-ID: <accf2693-caee-4576-bc4d-6f1533ec18e5@blackwall.org>
Date: Tue, 1 Apr 2025 16:37:24 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch net-next 2/3] net: bridge: mcast: Notify on offload flag
 change
From: Nikolay Aleksandrov <razor@blackwall.org>
To: Joseph Huang <joseph.huang.2024@gmail.com>,
 Joseph Huang <Joseph.Huang@garmin.com>, netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Roopa Prabhu <roopa@nvidia.com>, Simon Horman <horms@kernel.org>,
 linux-kernel@vger.kernel.org, bridge@lists.linux.dev
References: <20250318224255.143683-1-Joseph.Huang@garmin.com>
 <20250318224255.143683-3-Joseph.Huang@garmin.com>
 <d9a8d030-7cac-4f5f-b422-1bae7f08c74f@blackwall.org>
 <5d93f576-1d27-4d3f-8b37-0b2127260cca@gmail.com>
 <7eb3164c-7288-4b3b-9cee-75525607bead@blackwall.org>
Content-Language: en-US
In-Reply-To: <7eb3164c-7288-4b3b-9cee-75525607bead@blackwall.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/1/25 15:49, Nikolay Aleksandrov wrote:
> On 3/31/25 23:11, Joseph Huang wrote:
>> On 3/21/2025 4:47 AM, Nikolay Aleksandrov wrote:
>>>> diff --git a/net/bridge/br_switchdev.c b/net/bridge/br_switchdev.c
>>>> index 68dccc2ff7b1..5b09cfcdf3f3 100644
>>>> --- a/net/bridge/br_switchdev.c
>>>> +++ b/net/bridge/br_switchdev.c
>>>> @@ -504,20 +504,41 @@ static void br_switchdev_mdb_complete(struct net_device *dev, int err, void *pri
>>>>       struct net_bridge_mdb_entry *mp;
>>>>       struct net_bridge_port *port = data->port;
>>>>       struct net_bridge *br = port->br;
>>>> +    bool offload_changed = false;
>>>> +    bool failed_changed = false;
>>>> +    u8 notify;
>>>>       spin_lock_bh(&br->multicast_lock);
>>>>       mp = br_mdb_ip_get(br, &data->ip);
>>>>       if (!mp)
>>>>           goto out;
>>>> +
>>>> +    notify = br->multicast_ctx.multicast_mdb_notify_on_flag_change;
>>>
>>> let's not waste cycles if there was an error and notify == 0, please keep the original
>>> code path and avoid walking over the group ports.
>>
>> But we do want to keep the error flag so that the error shows up in 'bridge mdb show', right? Notify should only affect the real-time notifications, and not the error status itself.
>>
> 
> Fair enough, sounds good.
> 
>>>
>>>> +
>>>>       for (pp = &mp->ports; (p = mlock_dereference(*pp, br)) != NULL;
>>>>            pp = &p->next) {
>>>>           if (p->key.port != port)
>>>>               continue;
>>>> -        if (err)
>>>> +        if (err) {
>>>> +            if (!(p->flags & MDB_PG_FLAGS_OFFLOAD_FAILED))
>>>> +                failed_changed = true;
>>>>               p->flags |= MDB_PG_FLAGS_OFFLOAD_FAILED;
>>>> -        else
>>>> +        } else {
>>>> +            if (!(p->flags & MDB_PG_FLAGS_OFFLOAD))
>>>> +                offload_changed = true;
>>>>               p->flags |= MDB_PG_FLAGS_OFFLOAD;
>>>> +        }
>>>> +
>>>> +        if (notify == MDB_NOTIFY_ON_FLAG_CHANGE_DISABLE ||
>>>> +            (!offload_changed && !failed_changed))
>>>> +            continue;
>>>> +
>>>> +        if (notify == MDB_NOTIFY_ON_FLAG_CHANGE_FAIL_ONLY &&
>>>> +            !failed_changed)
>>>> +            continue;
>>>> +
>>>> +        br_mdb_flag_change_notify(br->dev, mp, p);
>>>
>>> This looks like a mess.. First you need to manage these flags properly as I wrote in my
>>> other reply, they must be mutually exclusive and you can do this in a helper. Also
>>> please read the old flags in the beginning, then check what flags changed, make a mask
>>> what flags are for notifications (again can come from a helper, it can be generated when
>>> the option changes so you don't compute it every time) and decide what to do if any of
>>> those flags changed.
>>> Note you have to keep proper flags state regardless of the notify option.
>>>
>>>>       }
>>>>   out:
>>>>       spin_unlock_bh(&br->multicast_lock);
>>>
>>
>> How does this look:
>>
>> --- a/net/bridge/br_switchdev.c
>> +++ b/net/bridge/br_switchdev.c
>> @@ -496,6 +496,21 @@ struct br_switchdev_mdb_complete_info {
>>          struct br_ip ip;
>>   };
>>
> 
> #define MDB_NOTIFY_FLAGS MDB_PG_FLAGS_OFFLOAD_FAILED
> 

pardon me, you can drop this define as the flag is guarded by a specific
option so we don't always notify when we see it, you can check for it
explicitly below in changed_flags below...

>> +static void br_multicast_set_pg_offload_flags(int err,
>> +                                             struct net_bridge_port_group *p)
> 
> swap these two arguments please, since we don't use err you can probably
> rename it to "failed" and make it a bool
> 
> alternatively if you prefer maybe rename it to
> br_multicast_set_pg_offload_flag() and pass the correct flag from the
> caller
> e.g. br_multicast_set_pg_offload_flag(pg, err ?
> MDB_PG_FLAGS_OFFLOAD_FAILED :  MDB_PG_FLAGS_OFFLOAD)
> 
> I don't mind either way.
> 
>> +{
>> +       p->flags &= ~(MDB_PG_FLAGS_OFFLOAD | MDB_PG_FLAGS_OFFLOAD_FAILED);
>> +       p->flags |= (err ? MDB_PG_FLAGS_OFFLOAD_FAILED : MDB_PG_FLAGS_OFFLOAD);
>> +}
>> +
>> +static bool br_multicast_should_notify(struct net_bridge *br,
> 
> hmm perhaps br_mdb_should_notify() to be more specific? I don't mind the
> current name, just a thought.
> 
> also const br
> 
>> +                                      u8 old_flags, u8 new_flags)
> 
> u8 changed_flags should suffice
> 
>> +{
>> +       return (br_boolopt_get(br, BR_BOOLOPT_FAILED_OFFLOAD_NOTIFICATION) &&
>> +               ((old_flags & MDB_PG_FLAGS_OFFLOAD_FAILED) !=
>> +               (new_flags & MDB_PG_FLAGS_OFFLOAD_FAILED)));
> 
> if (changed_flags & MDB_NOTIFY_FLAGS)

... here just do an explicit check for the offload flag in changed_flags
     instead of using a define, it is guarded by a specific option so it's ok
> 
> also no need for the extra () around the whole statement
> 
>> +}
>> +
> 
> both of these helpers should go into br_private.h
> 
>>   static void br_switchdev_mdb_complete(struct net_device *dev, int err, void *priv)
>>   {
>>          struct br_switchdev_mdb_complete_info *data = priv;
>> @@ -504,23 +519,25 @@ static void br_switchdev_mdb_complete(struct net_device *dev, int err, void *pri
>>          struct net_bridge_mdb_entry *mp;
>>          struct net_bridge_port *port = data->port;
>>          struct net_bridge *br = port->br;
>> -
>> -       if (err)
>> -               goto err;
>> +       u8 old_flags;
>>
>>          spin_lock_bh(&br->multicast_lock);
>>          mp = br_mdb_ip_get(br, &data->ip);
>>          if (!mp)
>>                  goto out;
>>          for (pp = &mp->ports; (p = mlock_dereference(*pp, br)) != NULL;
>>               pp = &p->next) {
>>                  if (p->key.port != port)
>>                          continue;
>> -               p->flags |= MDB_PG_FLAGS_OFFLOAD;
>> +
>> +               old_flags = p->flags;
>> +               br_multicast_set_pg_offload_flags(err, p);
>> +               if (br_multicast_should_notify(br, old_flags, p->flags))
> 
> and here it would become:
> br_multicast_should_notify(br, old_flags ^ p->flags)
> 
>> +                       br_mdb_flag_change_notify(br->dev, mp, p);
>>          }
>>   out:
>>          spin_unlock_bh(&br->multicast_lock);
>> -err:
>>          kfree(priv);
>>   }
>>
>> Thanks,
>> Joseph
> 
> Cheers,
>   Nik
> 

