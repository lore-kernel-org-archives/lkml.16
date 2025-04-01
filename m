Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FC11EBA14
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 12:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743511783; cv=none; b=h2Y/f1LNgeZdym3qV+t4oseirMer2O4HDMsxo6qS2Uk5HuFtFys/UEKWPl4DA8XtOlwBuEdbMf41WbK66W+dW/cRyRXeqSG0ksJ0oq4EHTRyB5G0ifseG1qQ4P/MjFH/zwxlShLK5f2sOjAua3haeAu7PmSToXP4ixFkMQKOqRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743511783; c=relaxed/simple;
	bh=hFhlgY9LULJ7D0UdU47cRObFp8n/dGLqOpwamAVat/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t+3/x1rp2xCoUk60JQADArNYN+ne8sLg7x0MZS/TtlKNTM2BbYYHYwG0iiAJOSac1COcVN2wtNpd5bf98EZm3siCl81DLCteLQsM1VIY5aADc8w3nu0L9nvXUEe6l65hEo5aYPlMgGpqiTyBGfPn/rSX2Fx7cNW1xdqWtYvkZ30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall-org.20230601.gappssmtp.com header.i=@blackwall-org.20230601.gappssmtp.com header.b=wjX0pBTv; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall-org.20230601.gappssmtp.com header.i=@blackwall-org.20230601.gappssmtp.com header.b="wjX0pBTv"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aaecf50578eso954809966b.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 05:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1743511779; x=1744116579; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eyZLAkPMASU5JOY7VbTqXC3hb3mRoOc8aSxuHfahcL4=;
        b=wjX0pBTvGGsVQe90rk9yokC3dfjkyMBskuQSR8wNF9MgmtXeLSoCp3EPjcIpb0jny6
         rvp3hWZSP5gI+6fvxxiww90Qv6rZiwOCODQE9deHsIhWa/bpcqO+e9NiyFuHDQvJ5ojR
         7fLMe3WYxgNgNVj1iWhmvwGFrNBgwQKHV4eYXkZSd44HrAZ9bsTHQ1VcLP0ZjIKvy8fq
         Rq8Aq0odWq1lLwiNrexzxDiSruu5PPa4M0994nNkjF3DOsb6/Wq5x7WEMo+QGvozodEQ
         w8y09B8LLl9k8EnWkNaKIaw2f/IsATUDveIuXrTsf213236oLnlzW0K5DMJwUXAemnfP
         7zqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743511779; x=1744116579;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eyZLAkPMASU5JOY7VbTqXC3hb3mRoOc8aSxuHfahcL4=;
        b=LR9kDGesFx6fREkpquc/FCQ2SBFb2LlNP7kEDITCHcD4XD0BjrK5ODmrlV2DNuZqmq
         /pO1TewFdRXGdnf8gT+6g0IdrIpf1FNoLnbI4zW3DvxdhEXU2jrQTt5vyalpHy88Q3Ge
         T1NebHVtly5IiXhghuOYc71B36f+kxpf8APt2JP5SydEWUoyAGAra/Lc3yyKQfS8oAwv
         WpdVA267soOnes8l+hYyd1Ed51vhDTgPuQnNiRPB1lAEICW2YdnW2Gg5XaP3otaXLjQH
         5XqBB7q6lQ0f7H98uK4gLiHpjbVhc1YW7RYexA/IhjxDd655IAylaWp+vAx5b5TzO6T3
         /K8A==
X-Forwarded-Encrypted: i=1; AJvYcCUokTb4r3gM7cI22jmfvPrHuMKjn6v9T4fEnNMum25PXx4vdY+459f4ivF+jKwOoBpTpC0QTFpFQNMcIVE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFTn4SRegwEHAuSpq+F8P0DEd/Idwti0JMM/x2X5i1udVGilb/
	fEn46R3RNYBtDVU3CDIRnFJCl6u8YcnepyxXUsxipwFS6cNcLF1/BCIIY850Ea8=
X-Gm-Gg: ASbGnctadF/wD9bSvRqfio1Hr3hAZF3X1IlgNAsquC2VQCUWN3hLQzBNNNypy36BHqv
	2e4A2dphJYnwM0NM3yD5JS33heSgbZWX0+cKfi1S9UwcfGySKEoYIc05AtLdBS0fw7/bhNKdDNc
	cYN4dcX5XE0pfB+DTlsrUbfCP6AMPKyAdjsX/2bQBgOuFWjKJzCLnyxieTJgn0iOGzRcZBanvIp
	eTcO9cKwSSxwPXAWg1zVzVwkCFoI4gbzvzX3T9zqxlOoKDhh+VIRwqJQZq50dQi7r4sEHZNKwd1
	dyMHtEy8zCyMKsC7adLG1QCcHVBlm8REIhaywySGMZwXdT1KLY0=
X-Google-Smtp-Source: AGHT+IG/Kb51o+xFUenOrqg7v/LSXfkndI7kuUbRqS59M+w6EB1lKXEJSo9+uGbDQm2Paooelr9dHw==
X-Received: by 2002:a17:907:2ce6:b0:ac3:413b:69c7 with SMTP id a640c23a62f3a-ac738be07f4mr1054149166b.39.1743511778543;
        Tue, 01 Apr 2025 05:49:38 -0700 (PDT)
Received: from [100.115.92.205] ([109.160.74.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac719278d40sm756428766b.43.2025.04.01.05.49.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 05:49:38 -0700 (PDT)
Message-ID: <7eb3164c-7288-4b3b-9cee-75525607bead@blackwall.org>
Date: Tue, 1 Apr 2025 15:49:35 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch net-next 2/3] net: bridge: mcast: Notify on offload flag
 change
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
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <5d93f576-1d27-4d3f-8b37-0b2127260cca@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/31/25 23:11, Joseph Huang wrote:
> On 3/21/2025 4:47 AM, Nikolay Aleksandrov wrote:
>>> diff --git a/net/bridge/br_switchdev.c b/net/bridge/br_switchdev.c
>>> index 68dccc2ff7b1..5b09cfcdf3f3 100644
>>> --- a/net/bridge/br_switchdev.c
>>> +++ b/net/bridge/br_switchdev.c
>>> @@ -504,20 +504,41 @@ static void br_switchdev_mdb_complete(struct 
>>> net_device *dev, int err, void *pri
>>>       struct net_bridge_mdb_entry *mp;
>>>       struct net_bridge_port *port = data->port;
>>>       struct net_bridge *br = port->br;
>>> +    bool offload_changed = false;
>>> +    bool failed_changed = false;
>>> +    u8 notify;
>>>       spin_lock_bh(&br->multicast_lock);
>>>       mp = br_mdb_ip_get(br, &data->ip);
>>>       if (!mp)
>>>           goto out;
>>> +
>>> +    notify = br->multicast_ctx.multicast_mdb_notify_on_flag_change;
>>
>> let's not waste cycles if there was an error and notify == 0, please 
>> keep the original
>> code path and avoid walking over the group ports.
> 
> But we do want to keep the error flag so that the error shows up in 
> 'bridge mdb show', right? Notify should only affect the real-time 
> notifications, and not the error status itself.
> 

Fair enough, sounds good.

>>
>>> +
>>>       for (pp = &mp->ports; (p = mlock_dereference(*pp, br)) != NULL;
>>>            pp = &p->next) {
>>>           if (p->key.port != port)
>>>               continue;
>>> -        if (err)
>>> +        if (err) {
>>> +            if (!(p->flags & MDB_PG_FLAGS_OFFLOAD_FAILED))
>>> +                failed_changed = true;
>>>               p->flags |= MDB_PG_FLAGS_OFFLOAD_FAILED;
>>> -        else
>>> +        } else {
>>> +            if (!(p->flags & MDB_PG_FLAGS_OFFLOAD))
>>> +                offload_changed = true;
>>>               p->flags |= MDB_PG_FLAGS_OFFLOAD;
>>> +        }
>>> +
>>> +        if (notify == MDB_NOTIFY_ON_FLAG_CHANGE_DISABLE ||
>>> +            (!offload_changed && !failed_changed))
>>> +            continue;
>>> +
>>> +        if (notify == MDB_NOTIFY_ON_FLAG_CHANGE_FAIL_ONLY &&
>>> +            !failed_changed)
>>> +            continue;
>>> +
>>> +        br_mdb_flag_change_notify(br->dev, mp, p);
>>
>> This looks like a mess.. First you need to manage these flags properly 
>> as I wrote in my
>> other reply, they must be mutually exclusive and you can do this in a 
>> helper. Also
>> please read the old flags in the beginning, then check what flags 
>> changed, make a mask
>> what flags are for notifications (again can come from a helper, it can 
>> be generated when
>> the option changes so you don't compute it every time) and decide what 
>> to do if any of
>> those flags changed.
>> Note you have to keep proper flags state regardless of the notify option.
>>
>>>       }
>>>   out:
>>>       spin_unlock_bh(&br->multicast_lock);
>>
> 
> How does this look:
> 
> --- a/net/bridge/br_switchdev.c
> +++ b/net/bridge/br_switchdev.c
> @@ -496,6 +496,21 @@ struct br_switchdev_mdb_complete_info {
>          struct br_ip ip;
>   };
>

#define MDB_NOTIFY_FLAGS MDB_PG_FLAGS_OFFLOAD_FAILED

> +static void br_multicast_set_pg_offload_flags(int err,
> +                                             struct 
> net_bridge_port_group *p)

swap these two arguments please, since we don't use err you can probably
rename it to "failed" and make it a bool

alternatively if you prefer maybe rename it to
br_multicast_set_pg_offload_flag() and pass the correct flag from the
caller
e.g. br_multicast_set_pg_offload_flag(pg, err ?
MDB_PG_FLAGS_OFFLOAD_FAILED :  MDB_PG_FLAGS_OFFLOAD)

I don't mind either way.

> +{
> +       p->flags &= ~(MDB_PG_FLAGS_OFFLOAD | MDB_PG_FLAGS_OFFLOAD_FAILED);
> +       p->flags |= (err ? MDB_PG_FLAGS_OFFLOAD_FAILED : 
> MDB_PG_FLAGS_OFFLOAD);
> +}
> +
> +static bool br_multicast_should_notify(struct net_bridge *br,

hmm perhaps br_mdb_should_notify() to be more specific? I don't mind the
current name, just a thought.

also const br

> +                                      u8 old_flags, u8 new_flags)

u8 changed_flags should suffice

> +{
> +       return (br_boolopt_get(br, 
> BR_BOOLOPT_FAILED_OFFLOAD_NOTIFICATION) &&
> +               ((old_flags & MDB_PG_FLAGS_OFFLOAD_FAILED) !=
> +               (new_flags & MDB_PG_FLAGS_OFFLOAD_FAILED)));

if (changed_flags & MDB_NOTIFY_FLAGS)

also no need for the extra () around the whole statement

> +}
> +

both of these helpers should go into br_private.h

>   static void br_switchdev_mdb_complete(struct net_device *dev, int err, 
> void *priv)
>   {
>          struct br_switchdev_mdb_complete_info *data = priv;
> @@ -504,23 +519,25 @@ static void br_switchdev_mdb_complete(struct 
> net_device *dev, int err, void *pri
>          struct net_bridge_mdb_entry *mp;
>          struct net_bridge_port *port = data->port;
>          struct net_bridge *br = port->br;
> -
> -       if (err)
> -               goto err;
> +       u8 old_flags;
> 
>          spin_lock_bh(&br->multicast_lock);
>          mp = br_mdb_ip_get(br, &data->ip);
>          if (!mp)
>                  goto out;
>          for (pp = &mp->ports; (p = mlock_dereference(*pp, br)) != NULL;
>               pp = &p->next) {
>                  if (p->key.port != port)
>                          continue;
> -               p->flags |= MDB_PG_FLAGS_OFFLOAD;
> +
> +               old_flags = p->flags;
> +               br_multicast_set_pg_offload_flags(err, p);
> +               if (br_multicast_should_notify(br, old_flags, p->flags))

and here it would become:
br_multicast_should_notify(br, old_flags ^ p->flags)

> +                       br_mdb_flag_change_notify(br->dev, mp, p);
>          }
>   out:
>          spin_unlock_bh(&br->multicast_lock);
> -err:
>          kfree(priv);
>   }
> 
> Thanks,
> Joseph

Cheers,
  Nik

