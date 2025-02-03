Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DDC288B1
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 09:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738573235; cv=none; b=MgI87EX8ocMIht1WbPBtBl6OKFwx/VnsD4ldO5B6W6U/otyXZR7ckFwXsf28khrRJstObEKN40iw7Kt6dKcUQ/MV5csOUdc+t8YCnJBDxTSfL7sWJVd/EORaMRaCFxxintKgTCBOkh2JYvf57HG5msWivRY3JZ18FTXOcC1c5+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738573235; c=relaxed/simple;
	bh=e2U740/TyJ7D0EVHUpDWOECfvQvB+F693i8X3BKVLnY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ilsjt06AwKkbOdfmuyh7SRMT9obfBEdl80xMNFv86q77kBixV0bXEhZ8d4B0eeQXyfrXCSFqWfFrxIFYY8FjVyw2N1N/i3zZ1yEqQ5gSauax2sIn7CpIhQaM2jcxPEb+5wBvJHzCcM/jPgE5ztk/7RYRPMF4kXPpIrnROSs9Hc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net; spf=pass smtp.mailfrom=openvpn.com; dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b=CqBzygEu; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvpn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b="CqBzygEu"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-436326dcb1cso27650855e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 01:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvpn.net; s=google; t=1738573231; x=1739178031; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Gtpy7okcbXspLYE0kY1UPu6cNVYKGNTEI9uXH925J1M=;
        b=CqBzygEum1fbABSEq4QG9So5iMvY+cx8wNwwOKFWOFHo/Km/kcdCbA04rgTgE7Edm2
         eTXmB8oOYHQC9hdQo1qH5W59slGLZ6kmESEdwTsmpm7S4oXRzvnfyoN9l7vBAIq0nUcv
         2YHSwovZuXPrymLG9w3gRPaWk7ZC8dJyn3rQXz6VyikhJ2xsMM28DWxssxppR5ID+cD0
         uzCT4uRemuRkiyODeDQcSbuMHX57ohEqd5Th6F/7d03TJ1z6w84tdhy7pyFfbnU7IS8L
         ik8rIzROBhSnmF8IjyfAU3ipsldPwOaIcjx5wHIft8n7dVWDw1V+QCLkmtinalnAruE/
         C5/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738573231; x=1739178031;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gtpy7okcbXspLYE0kY1UPu6cNVYKGNTEI9uXH925J1M=;
        b=ovo//SnmxIk4v/KvW3+XMFfVpk+eGFuh67QYAom67Q3YWIsHwHg52xS1IJoPcrUOus
         6bngPmQl299yJbnG6MG2zvx5W/3Kthp0dmqiIdBQpanKb6h72oSmCIbTUxGVhKhpXHR5
         MVAQJirWbR6YV2R/05gPpYB5P8wFwH1Z8ts91RwMV+16laZtQycVzSejGHjfxubBr/+u
         N5KerMb0xJ+TF2W/4GNkCsSB08txJfSSdRr+5IQptXVxhbY3DZI8n/HsjAXsP0nlagP6
         OycLUry+pg5fPmcHpwa2QttMeXFhiKeIjpf/5aOHMdxHNZmF3Iz/vdfB8cU1TT8eDvDe
         eXEw==
X-Forwarded-Encrypted: i=1; AJvYcCUBu6+MbHhc7qAUiMSoUxYZL3lPCb8yFJ0Dy9OU+O4wbBdXsW6b3YSKcB+IQ0bMSsCIoYwxvbLdPek0Rfs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0ohmBC1ofI/FC4v0VEfuqg94UVfF4V2THBuriMdO5haS0EgW1
	EG5rcvvzbMMAPWfNc4JFP3xLomMkeJcqYM5kLSdPrvAoPvK72jxI7mL/5kWbvNI=
X-Gm-Gg: ASbGnct8oj3cEeZYIQHb9zrPdQ0SbvW7kOjgZtfIgaWLJVNovJNIdAulmqherulDl1i
	jbYIYGLiHxgJ2cPP0Y8ibkFKQxyd7Pp8ehwaOO8Go/6cBMHatsdsQtj7uo++CzFhCfm6Tq6JmtK
	AyLvb0vOLXlK6fh5AK60QzPVzq7N6Uc0t5+zebvV2RHjxzbZtkRokNQA6wUs7Y8jUsbTJ91qw/2
	Jaug/rQZCajCX4uAV78WFDCAf7PzzeMrX8Nkxuk+Z0eJvjLSGHTvK/c37NsuFAwV2p881Op4x6o
	2bHXMmAtyccZjhuq7qXuNJcsKHeXrbAYCLCZ882k9exKRUxtj4C1sA==
X-Google-Smtp-Source: AGHT+IHK7nRLGn7h9FtV37zDyhqpCDn1f5ZOCYXKBkogI+dLLiWyR5vjZNb6uUUsazwYRoZHbCA+1g==
X-Received: by 2002:a05:600c:501e:b0:434:9e46:5bc with SMTP id 5b1f17b1804b1-438dc3bd80cmr201462175e9.10.1738573230628;
        Mon, 03 Feb 2025 01:00:30 -0800 (PST)
Received: from ?IPV6:2001:67c:2fbc:1:b4fe:e6fa:32a0:6a72? ([2001:67c:2fbc:1:b4fe:e6fa:32a0:6a72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1b5edasm11911048f8f.80.2025.02.03.01.00.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 01:00:30 -0800 (PST)
Message-ID: <35eb070a-26c9-43f5-975c-d624fc2d13d1@openvpn.net>
Date: Mon, 3 Feb 2025 10:01:38 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v18 15/25] ovpn: implement multi-peer support
To: Sabrina Dubroca <sd@queasysnail.net>
Cc: netdev@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Donald Hunter <donald.hunter@gmail.com>, Shuah Khan <shuah@kernel.org>,
 ryazanov.s.a@gmail.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Xiao Liang <shaw.leon@gmail.com>
References: <20250113-b4-ovpn-v18-0-1f00db9c2bd6@openvpn.net>
 <20250113-b4-ovpn-v18-15-1f00db9c2bd6@openvpn.net> <Z5_5D4boBEaVdf4W@hog>
Content-Language: en-US
From: Antonio Quartulli <antonio@openvpn.net>
Autocrypt: addr=antonio@openvpn.net; keydata=
 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
Organization: OpenVPN Inc.
In-Reply-To: <Z5_5D4boBEaVdf4W@hog>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/02/2025 00:00, Sabrina Dubroca wrote:
> 2025-01-13, 10:31:34 +0100, Antonio Quartulli wrote:
>>   static int ovpn_newlink(struct net *src_net, struct net_device *dev,
>>   			struct nlattr *tb[], struct nlattr *data[],
>>   			struct netlink_ext_ack *extack)
>>   {
>>   	struct ovpn_priv *ovpn = netdev_priv(dev);
>>   	enum ovpn_mode mode = OVPN_MODE_P2P;
>> +	int err;
>>   
>>   	if (data && data[IFLA_OVPN_MODE]) {
>>   		mode = nla_get_u8(data[IFLA_OVPN_MODE]);
>> @@ -136,6 +183,10 @@ static int ovpn_newlink(struct net *src_net, struct net_device *dev,
>>   	ovpn->mode = mode;
>>   	spin_lock_init(&ovpn->lock);
>>   
>> +	err = ovpn_mp_alloc(ovpn);
> 
> If register_netdevice fails, ovpn->peers won't get freed in some cases
> (only if we got past ndo_init). So this should go into ndo_init.

This is something I was investigating during the weekend.
You just confirmed my suspicion. Thanks.

Will move it to ndo_init().

> 
>> +	if (err < 0)
>> +		return err;
>> +
>>   	/* turn carrier explicitly off after registration, this way state is
>>   	 * clearly defined
>>   	 */
> 
> 
> [...]
>> +static int ovpn_peer_add_mp(struct ovpn_priv *ovpn, struct ovpn_peer *peer)
>> +{
> [...]
>> +	hlist_add_head_rcu(&peer->hash_entry_id,
>> +			   ovpn_get_hash_head(ovpn->peers->by_id, &peer->id,
>> +					      sizeof(peer->id)));
>> +
>> +	if (peer->vpn_addrs.ipv4.s_addr != htonl(INADDR_ANY)) {
>> +		nhead = ovpn_get_hash_head(ovpn->peers->by_vpn_addr,
>> +					   &peer->vpn_addrs.ipv4,
>> +					   sizeof(peer->vpn_addrs.ipv4));
>> +		hlist_nulls_add_head_rcu(&peer->hash_entry_addr4, nhead);
>> +	}
>> +
>> +	if (!ipv6_addr_any(&peer->vpn_addrs.ipv6)) {
>> +		nhead = ovpn_get_hash_head(ovpn->peers->by_vpn_addr,
>> +					   &peer->vpn_addrs.ipv6,
>> +					   sizeof(peer->vpn_addrs.ipv6));
>> +		hlist_nulls_add_head_rcu(&peer->hash_entry_addr6, nhead);
>> +	}
> 
> You can't add hash_entry_addr4 and hash_entry_addr6 to the same
> hashtable.  ovpn_peer_get_by_vpn_addr{4,6} use those fields as
> "member" for hlist_nulls_for_each_entry_rcu, so container_of (in
> hlist_nulls_entry) will return a "peer" that's not really a peer
> object in memory when we walk past an entry for the wrong address
> family:
>    container_of(peer_v4->hash_entry_addr4, struct ovpn_peer, hash_entry_addr6)
> or
>    container_of(peer_v6->hash_entry_addr6, struct ovpn_peer, hash_entry_addr4)
> 
> (probably not visible in testing since we'll never really get 2 peers
> (and of different families) into the same bucket, and then also get
> them to pass the addr_equal test in ovpn_peer_get_by_vpn_addr{4,6}.
> easiest way to try to trigger problems would be making the hashtable
> single bucket, and even then...)

cr0p.
This has been lurking here for so long.
You can imagine what the original idea was, but I didn't see that issue 
with walking the list.

I have been wondering for so long if using just one hashtable could hide 
some problem, but until now I couldn't come up with any.

Ans yes, this is close to impossible to trigger, but yet, it is not correct.

Will add an extra hashtable in order to separate v4 from v6.

In the background we're already working on moving to rhashtables and 
there we were forced to have v4 and v6 separate anyway.

Thanks a lot.
Regards,

> 

-- 
Antonio Quartulli
OpenVPN Inc.

