Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08711FC11E
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 08:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738572015; cv=none; b=L1LJ78vP+cA8aLfluQV6T1f+q52ba/t4Ud82/GbBBJWXWhcBYHzmrBVW993Vc8nwS8ZK0qlKLKhAhryYA4CPGnxMg8RQsZDusnd1N7DcfORunTaj0IyORP9QSx36Am0iO+D3qa6YkcRvQQg5FocFhoC9u8hA8D8fhS678FB8aZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738572015; c=relaxed/simple;
	bh=S+86EJ1lLsVul0int75aL7Lj7PiAJjUt0p43qzaqYOw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f48qotB5gJa9CEIHsXzES3aGEHUSKj1wW1zvpwb5N/qIydI/2UjFdvrNTkFdTtsDw4g8rB7yV84bvpDuA+V2SV2x7YusbQFIqgVlKUBB8CANbd60D2h1+5OSMleHqnZRyrYtzhrLcRcMVfMelwWoIb5TBlz6K/Ofi/UsHMd/DCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net; spf=pass smtp.mailfrom=openvpn.com; dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b=ZldHIGBU; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvpn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b="ZldHIGBU"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-385e0e224cbso2189116f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 00:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvpn.net; s=google; t=1738572011; x=1739176811; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cEHwfTC0nlTwzp6/24FbLsvLnBpQSYFrP5VEo1YUJGk=;
        b=ZldHIGBU2b6lQ+UkRSddPZigzWjn2Ll/j7MJASQlIjKQuzbF7VVa9FDsRixYgj3VBu
         s2UGWuu4sJHgaTM961QI6zjA1UvqyPeVwjHPZgl0dlDtbq+miwRhJdCvuLMAoKfuL8fG
         sornuyJQk561BXx7x++KL7GFlbS5/AtMJGjZDDM7gwye0vUWHrFcNc8MB+UnQowfbbax
         KoFfQU6r9aJ5PSjV4bBKK7NV7lOLg5DeNnrVxf+mExV2cpsdtJc738h5qZJTXKmCMLYn
         aUDtFBc+FyonlTt4Q0+zXRWd92BRExPNNu0LH8isYcj5TPGmusOOjWJiUzNGIUAm1dHV
         UeTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738572011; x=1739176811;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cEHwfTC0nlTwzp6/24FbLsvLnBpQSYFrP5VEo1YUJGk=;
        b=iKBlNXn9oAQXe5wVLnFXTpwKxJggSQ9DirnBBDbbSchytHEWL236YCyJmvUmbn3tGU
         MA1h5nm7SP5mhkGXQSC4ZHnUECopo22GEeCFMhlHtdEZzA/CKZ4o0xirdc3LoKkcKF1E
         626iZhysPyh2ai19igJfFrjH/6Pm8Ev4yw05btNqgsc7ri4TLPaRjSfQx73bWTE0ZxEL
         quUTlLsoJ/qI0FFVMUXpyaj1N5SPpjLXzZ/DyBGjH3bQod9fSibaYq2OT1vDz3lGu/00
         qYAmlW5i+bhaTBWx/aOgh6kkOsOiT3ZqOeT0XtpEwn57HCFjntaSl5iyh8VIatqfdZlb
         CrXg==
X-Forwarded-Encrypted: i=1; AJvYcCVFbqnwb5+Or/zcAhm4Vj+vdAjqW7nnIozdqmQx/ND+fOhM41e0L18DOAWlEVvyYIoKb1X+tlq/iA4+Mvk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3/GGnoqMgr48hhZkeMr/tSNO6UHrryU1rQbKkMIvxReEBMScd
	eIPK2zohas64uOSXR+cXWN2jKZy/CfIKT6CpZSJrFKzBQeyv50eNeDslWWkicJE=
X-Gm-Gg: ASbGncv8fZVnbkEKYK3E0fqC77i0rNL8Dc9QafBGYprsfikIm3TNvIUI3Ea/ymm+PdD
	hsb2Aq96lzSXOuXJRGlP4V/KXnM7WMLpOXTK69Trk2RYyobob3supvfK9Phlkkt2A9IjTQGuv+E
	wLZhOVIdhbC5v+DkXV3Mo4+s0BWOP1AybuPxUCFax/SQOJ5BRe9Yrx+1i6iNHpc3GgsYJG6d9U7
	5qhiC98HhaTxS23oNnBWh9Kadhqojkbg26X/1YwKz+oz5SzrUeEKBGNd2sDLt/0SLiIxYsMKu4O
	cXMWAlJt9xJ/X8mqGcQIsbZda2yUBFwiJ74fw6wJ3cLgHp8NBDo63w==
X-Google-Smtp-Source: AGHT+IFsf/cTF2ZBcKE5MVojia1h7vGdqQrlMxrM+ECVRLY29yr0IVdVHjq7QNVjyJAzKl2Vtsi0pw==
X-Received: by 2002:a5d:47a1:0:b0:38c:5bb2:b938 with SMTP id ffacd0b85a97d-38c5bb2bd19mr12298533f8f.2.1738572011053;
        Mon, 03 Feb 2025 00:40:11 -0800 (PST)
Received: from ?IPV6:2001:67c:2fbc:1:b4fe:e6fa:32a0:6a72? ([2001:67c:2fbc:1:b4fe:e6fa:32a0:6a72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c102e19sm12279954f8f.36.2025.02.03.00.40.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 00:40:10 -0800 (PST)
Message-ID: <1c53012a-5771-47d7-9bf4-104f8d9093a6@openvpn.net>
Date: Mon, 3 Feb 2025 09:41:18 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v18 05/25] ovpn: introduce the ovpn_peer object
To: Sabrina Dubroca <sd@queasysnail.net>
Cc: netdev@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Donald Hunter <donald.hunter@gmail.com>, Shuah Khan <shuah@kernel.org>,
 ryazanov.s.a@gmail.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Xiao Liang <shaw.leon@gmail.com>
References: <20250113-b4-ovpn-v18-0-1f00db9c2bd6@openvpn.net>
 <20250113-b4-ovpn-v18-5-1f00db9c2bd6@openvpn.net> <Z5_4OmdmKvHJ5P-_@hog>
Content-Language: en-US
From: Antonio Quartulli <antonio@openvpn.net>
Autocrypt: addr=antonio@openvpn.net; keydata=
 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
Organization: OpenVPN Inc.
In-Reply-To: <Z5_4OmdmKvHJ5P-_@hog>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/02/2025 23:56, Sabrina Dubroca wrote:
> 2025-01-13, 10:31:24 +0100, Antonio Quartulli wrote:
>> +static int ovpn_peer_del_p2p(struct ovpn_peer *peer,
>> +			     enum ovpn_del_peer_reason reason)
>> +{
>> +	struct ovpn_peer *tmp;
>> +
>> +	lockdep_assert_held(&peer->ovpn->lock);
>> +
>> +	tmp = rcu_dereference_protected(peer->ovpn->peer,
>> +					lockdep_is_held(&peer->ovpn->lock));
>> +	if (tmp != peer) {
>> +		DEBUG_NET_WARN_ON_ONCE(1);
> 
> I think this WARN should be removed. If 2 almost-simultanenous
> DEL_PEER manage to fetch the peer, the first will delete it and NULL
> peer->ovpn->peer, then when it releases ovpn->lock, the 2nd will find
> NULL != peer and hit this WARN.
> 
> (probably not happening in practical cases, but syzbot will manage to
> hit it)

I can see this happening with two almost-simultaneous netlink PEER_DEL 
calls.

Thanks, will get rid of the warning.

Regards,

> 
>> +		return -ENOENT;
>> +	}
>> +
>> +	ovpn_peer_remove(peer, reason);
>> +
>> +	return 0;
>> +}
> 

-- 
Antonio Quartulli
OpenVPN Inc.

