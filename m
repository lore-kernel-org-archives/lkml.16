Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90DD1FF7C5
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 09:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738575916; cv=none; b=NjJjBJQ6GxK+91MJXwyYz2G+HK1Rvq6HHO4LIv10U9D5DMrlLkK/L3lsOhTdSVZV5jt1X0HdttsS6wd3a26wqtD8l5ut6zAcFiDihvFlxUIZeHx5mkKBbM6mhgIBg9vMS+Xp9Xxe30+sqioO56/WVeoNAOPGiYSombEJKZPDDZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738575916; c=relaxed/simple;
	bh=DnAaTSWB9Ufq4j8GcgVdkYGxQaZHUSHEOIBDNJV/MC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GMl3XZKnVn/CN4/WbShQl8S3tRybBbE+mLoovdEM0Ad1SsLnD9NAD9P6Rx98lampan4HW+i12hFh2pUE1ky9UX9NrTcMJzpD651c7wLOtum5uDZFL75RaK5OzGsr17MDBMQ+riy3+x96PAqH3Uqetu+MtFwtpMFMMm1ZV4KoIaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net; spf=pass smtp.mailfrom=openvpn.com; dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b=Bgk8e8cr; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvpn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b="Bgk8e8cr"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-438a3216fc2so41876175e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 01:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvpn.net; s=google; t=1738575912; x=1739180712; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bWyq858Fdd6NVKF4yL/YP3TOhGbx7YHYk3DfUJZJrbk=;
        b=Bgk8e8crVtsj1hi35slWNcRAcg2NxN4dzoJkW97RvY3+oXTvdcOMA1FFwiarvo+/uB
         6o5mDHoXdM3Dk0sXTKfLHK/XNXdjvzV8Imt6UQqXEPbHJV/nQ85r9FRlNAqHYJAzETJS
         HX47jHHH/CQVcaIeIpFsVfKaiKecgfegFYLssX7rYyK6UPNWfsTwWkh/6ghleONCW6Zn
         UMikkfxddtd51Sthw9pxHmaJJhuj70gR0KJmrb6HoWDgeeejB5z0DUWKREYu25n1dBmH
         Ezk0ToySH4l5CNOJ+pqpjBTw8Tr4ohWtCFZxMjlqH0a9aPKXBo55MudsUWdLWjiPVArO
         GFIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738575912; x=1739180712;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWyq858Fdd6NVKF4yL/YP3TOhGbx7YHYk3DfUJZJrbk=;
        b=KbAgFSdJWnfqn3UaKqIIVp5B/EckwUIZynWrAwny70/gPKj0PXF8FrEtATEdLKyiwI
         toaDZmvLd8N6624hgVg+6+NcxxPgI5JSDkW0UedJIRCtY5cLYUee9/aJMTD9WZY3UpCu
         m83VQJQzRVl6jchLGk8XOJR8VAEygvnFnhtJ+pIPPhENPVUG192N8S7XVsN2LJ+2z6vB
         xqM9vyHieV33Yv6ZDRbfT6Ir+/iQ4kRJn2zFXFOI6EuL7iSdKuIxtLjHvRVZ3pvd8iO+
         NupAkTznEyKX1BTIFBksbiCirU9BUQVaZljf0p87dClZL/DsaZMbrwfFhZseaPSBTzqJ
         ceIA==
X-Forwarded-Encrypted: i=1; AJvYcCV0AGFuat8KJLq7KF3ZjdAwp2sgPMJ9sbFu/3VAVfHiAiLUCsLxrKiIQVpI+bGFK7ciuXuYayYy16ug3To=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQg8Rv6I+NcbnGHLrZPDuBfw1JnsbdMt0/R2Lim+b+Eumt06+l
	TNJTYUQuHlkpJ759ZwBkx5O7NUOXMWZRd3w1BjBgj9f7vpT3gJcKXBwNxD/nC+g=
X-Gm-Gg: ASbGncu7nSDDtg7d0JjJKa/8x1f8dZxrwyy0eBa1eqbLCzn7NiKU/E3Y64cW7qtt/t2
	x606ZFLQENyB5rsZimkg0u+l+mTh5Bkp2s0fXq8FXmEDrnNYuxyOSBys4gCSTwnu+d0sDMk4sdE
	tcKznbHCzkR8YKijpvSmOD+++d3U/NOYSJTrS1yUff4+rTtsUCS9Ugo8zV+OMfex1My5Ve16WvW
	pIQcTgSJXWGFhB92IH6Hi+BEE4KyoWS4OTAShpncU9xokR+jbw5kzLM29f2JCEiq9WNqguWXEwi
	PPhAhP3a/48CfhjnJr0k5R7J//sDHMRjeyueoLj7JjtyeTWVV6IRLw==
X-Google-Smtp-Source: AGHT+IEAyihP1x+9lWz+qA1pD0F07WlyGqWEKzFWo4Qx/8RNOunbW5iuc46GcTZGtV9TeGblCzFBHw==
X-Received: by 2002:a5d:598c:0:b0:38c:5b62:9fb9 with SMTP id ffacd0b85a97d-38c5b62a1a6mr13709368f8f.43.1738575912014;
        Mon, 03 Feb 2025 01:45:12 -0800 (PST)
Received: from ?IPV6:2001:67c:2fbc:1:b4fe:e6fa:32a0:6a72? ([2001:67c:2fbc:1:b4fe:e6fa:32a0:6a72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e23deedfsm150653445e9.16.2025.02.03.01.45.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 01:45:11 -0800 (PST)
Message-ID: <4a539c83-f436-4b1e-9707-64c05dcfdbd2@openvpn.net>
Date: Mon, 3 Feb 2025 10:46:19 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v18 20/25] ovpn: implement peer
 add/get/dump/delete via netlink
To: Sabrina Dubroca <sd@queasysnail.net>
Cc: netdev@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Donald Hunter <donald.hunter@gmail.com>, Shuah Khan <shuah@kernel.org>,
 ryazanov.s.a@gmail.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Xiao Liang <shaw.leon@gmail.com>
References: <20250113-b4-ovpn-v18-0-1f00db9c2bd6@openvpn.net>
 <20250113-b4-ovpn-v18-20-1f00db9c2bd6@openvpn.net> <Z5_6pC-zsVzukJs3@hog>
Content-Language: en-US
From: Antonio Quartulli <antonio@openvpn.net>
Autocrypt: addr=antonio@openvpn.net; keydata=
 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
Organization: OpenVPN Inc.
In-Reply-To: <Z5_6pC-zsVzukJs3@hog>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/02/2025 00:07, Sabrina Dubroca wrote:
> 2025-01-13, 10:31:39 +0100, Antonio Quartulli wrote:
>> +static int ovpn_nl_attr_sockaddr_remote(struct nlattr **attrs,
>> +					struct sockaddr_storage *ss)
>> +{
>> +	struct sockaddr_in6 *sin6;
>> +	struct sockaddr_in *sin;
>> +	struct in6_addr *in6;
>> +	__be16 port = 0;
>> +	__be32 *in;
>> +	int af;
>> +
>> +	ss->ss_family = AF_UNSPEC;
>> +
>> +	if (attrs[OVPN_A_PEER_REMOTE_PORT])
>> +		port = nla_get_be16(attrs[OVPN_A_PEER_REMOTE_PORT]);
>> +
>> +	if (attrs[OVPN_A_PEER_REMOTE_IPV4]) {
>> +		af = AF_INET;
>> +		ss->ss_family = AF_INET;
>> +		in = nla_data(attrs[OVPN_A_PEER_REMOTE_IPV4]);
>> +	} else if (attrs[OVPN_A_PEER_REMOTE_IPV6]) {
>> +		af = AF_INET6;
>> +		ss->ss_family = AF_INET6;
>> +		in6 = nla_data(attrs[OVPN_A_PEER_REMOTE_IPV6]);
>> +	} else {
>> +		return AF_UNSPEC;
>> +	}
>> +
>> +	switch (ss->ss_family) {
>> +	case AF_INET6:
>> +		/* If this is a regular IPv6 just break and move on,
>> +		 * otherwise switch to AF_INET and extract the IPv4 accordingly
>> +		 */
>> +		if (!ipv6_addr_v4mapped(in6)) {
>> +			sin6 = (struct sockaddr_in6 *)ss;
>> +			sin6->sin6_port = port;
>> +			memcpy(&sin6->sin6_addr, in6, sizeof(*in6));
>> +			break;
>> +		}
>> +
>> +		/* v4-mapped-v6 address */
>> +		ss->ss_family = AF_INET;
>> +		in = &in6->s6_addr32[3];
>> +		fallthrough;
>> +	case AF_INET:
>> +		sin = (struct sockaddr_in *)ss;
>> +		sin->sin_port = port;
>> +		sin->sin_addr.s_addr = *in;
>> +		break;
>> +	}
>> +
>> +	/* don't return ss->ss_family as it may have changed in case of
>> +	 * v4-mapped-v6 address
>> +	 */
> 
> nit: I'm not sure that matters since the only thing the caller checks
> is ret != AF_UNSPEC, and at this point, while ss_family could have
> been changed, it would have changed from AF_INET6 to AF_INET, so it's
> != AF_UNSPEC.

I am pretty sure at some point the return value was used for some 
reason, but now it is indeed useless.

Well, I think I wiil just convert the return type to bool:
true -> we have a remote
false -> we don't

> 
>> +	return af;
>> +}
> 
> [...]
>> +static int ovpn_nl_peer_precheck(struct ovpn_priv *ovpn,
>> +				 struct genl_info *info,
>> +				 struct nlattr **attrs)
>> +{
> [...]
>> +
>> +	/* VPN IPs are needed only in MP mode for selecting the right peer */
>> +	if (ovpn->mode == OVPN_MODE_P2P && (attrs[OVPN_A_PEER_VPN_IPV4] ||
>> +					    attrs[OVPN_A_PEER_VPN_IPV6])) {
> 
> And in MP mode, at least one VPN_IP* is required?

Yeah. I'll add a check for this requirement too.

> 
> 
> [...]
>>   int ovpn_nl_peer_new_doit(struct sk_buff *skb, struct genl_info *info)
>>   {
> [...]
>> +	/* Only when using UDP as transport protocol the remote endpoint
>> +	 * can be configured so that ovpn knows where to send packets to.
>> +	 *
>> +	 * In case of TCP, the socket is connected to the peer and ovpn
>> +	 * will just send bytes over it, without the need to specify a
>> +	 * destination.
>> +	 */
>> +	if (sock->sk->sk_protocol != IPPROTO_UDP &&
>> +	    (attrs[OVPN_A_PEER_REMOTE_IPV4] ||
>> +	     attrs[OVPN_A_PEER_REMOTE_IPV6])) {
> 
> Is a peer on a UDP socket without any remote (neither
> OVPN_A_PEER_REMOTE_IPV4 nor OVPN_A_PEER_REMOTE_IPV6) valid? We just
> wait until we get data from it to update the endpoint?
> 
> Or should there be a check to make sure that one was provided?

Yeah, I'll add a check.

> 
>> +		NL_SET_ERR_MSG_FMT_MOD(info->extack,
>> +				       "unexpected remote IP address for non UDP socket");
>> +		sockfd_put(sock);
>> +		return -EINVAL;
>> +	}
>> +
>> +	ovpn_sock = ovpn_socket_new(sock, peer);
>> +	if (IS_ERR(ovpn_sock)) {
>> +		NL_SET_ERR_MSG_FMT_MOD(info->extack,
>> +				       "cannot encapsulate socket: %ld",
>> +				       PTR_ERR(ovpn_sock));
>> +		sockfd_put(sock);
>> +		return -ENOTSOCK;
> 
> Maybe s/-ENOTSOCK/PTR_ERR(ovpn_sock)/ ?
> Overwriting ovpn_socket_new's -EBUSY etc with -ENOTSOCK is a bit
> misleading to the caller.

This is the error code that userspace will see.
Returning -EBUSY/-EALREADY for a socket error from the PEER_NEW call 
would be too vague IMHO (the user wouldn't know this is coming from the 
socket processing subroutine).

Hence the decision to explicitly return -ENOSOCK (something's wrong with 
the socket you passed) and then send the underling error in the ERR_MSG 
(which the user can inspect if he wants to learn more about what exactly 
went wrong).
Doesn't it make sense?

> 
>> +	}
>> +
>> +	peer->sock = ovpn_sock;
>> +
>> +	ret = ovpn_nl_peer_modify(peer, info, attrs);
>> +	if (ret < 0)
>> +		goto peer_release;
>> +
>> +	ret = ovpn_peer_add(ovpn, peer);
>> +	if (ret < 0) {
>> +		NL_SET_ERR_MSG_FMT_MOD(info->extack,
>> +				       "cannot add new peer (id=%u) to hashtable: %d\n",
>> +				       peer->id, ret);
>> +		goto peer_release;
>> +	}
>> +
>> +	return 0;
>> +
>> +peer_release:
> 
> I think you need to add:
> 
> 	ovpn_socket_release(peer);
> 
> If ovpn_socket_new succeeded, ovpn_peer_release only takes care of the
> peer but not its socket.

You're right, because now the socket is released only in ovpn_peer_remove().

Will add a call to ovpn_socket_release(). Thanks!

> 
>> +	/* release right away because peer is not used in any context */
>> +	ovpn_peer_release(peer);
>> +
>> +	return ret;
>>   }
>>   
>>   int ovpn_nl_peer_set_doit(struct sk_buff *skb, struct genl_info *info)
>>   {
> [...]
>> +	if (attrs[OVPN_A_PEER_SOCKET]) {
>> +		NL_SET_ERR_MSG_FMT_MOD(info->extack,
>> +				       "socket cannot be modified");
>> +		return -EINVAL;
>> +	}
>> +
>> +	peer_id = nla_get_u32(attrs[OVPN_A_PEER_ID]);
>> +	peer = ovpn_peer_get_by_id(ovpn, peer_id);
>> +	if (!peer) {
>> +		NL_SET_ERR_MSG_FMT_MOD(info->extack,
>> +				       "cannot find peer with id %u", peer_id);
>> +		return -ENOENT;
>> +	}
> 
> The check for non-UDP socket with a remote address configured should
> be replicated here, no?

ah, good catch! we may be adding a remote while using a TCP socket.
Will add check here.

Thanks!

> 

-- 
Antonio Quartulli
OpenVPN Inc.

