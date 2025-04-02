Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130FC1F5852
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 23:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743637074; cv=none; b=R16JJv9oFjJC52Cdknln0J9YBdq3DKlnK7581EBg62RU6ZujmxGw8xnGfnv5UedpJryFQZsXBjk+n4p37vxLMkK1XUqg/bL8P83txTamaUkc+9mfG4PXJKYnTtG0xBvGjpQhg7Wlk0ZsJ8+XFJ4KFp7h0U6k/6nsd7nGZLkwO/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743637074; c=relaxed/simple;
	bh=ZZsMtMrosl1AIceTIQnLYdW9Uz2x9VViE3xqFN0/+yw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t1JJfBmkZaTA1nICv/8do9zOGTIRMVG7YIX78c+ZLF/ezIf8QFpud0WVkH0ugeX5xcabskAlPMe19sG3OtC38pxLRmoJ6roHHnVVZeXtJEoEogtEEAG0oIRt/TUYRQu2IdFxdpI7Ck6cjQWDA8iWZi8g5+8XpdtUgBcwz6yKndc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net; spf=pass smtp.mailfrom=openvpn.com; dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b=BIrnec7i; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvpn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b="BIrnec7i"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so1841155e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 16:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvpn.net; s=google; t=1743637070; x=1744241870; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=W61q1y0gCFvlI6JDcXrPYkIT1lseWSl+GG45DZFG1F0=;
        b=BIrnec7i4s/pFDUfbhKhz4Dp1diJaKQYlR0HXwaZUpOwSyod2PjZmLRkRUqxj6xpeN
         IJZIZtHo86uqgYj9+K6H8gFurh9BMOutZ9L0nUtvhsYJfMskXD25YfOjqKpH18q8wZem
         Cud5g2zRwEfg7u0wFluXAg64DRY2ajLL7yTl91vF/Lo4CLPnpH3KFSp908aY0o0RWaRx
         nxh1gOKRpaQD0ckEeYRLvwG6DEL9Kcl3B5eb82W7iYeM6s1M461/sipKlRWlhN0VRsCj
         VUfDTT714EpbB5c8ylg9dwnJiFR1CHj77HBZI+trQqv8mA+p97HccXLQu9Tkxo/MK3yP
         a3GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743637070; x=1744241870;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W61q1y0gCFvlI6JDcXrPYkIT1lseWSl+GG45DZFG1F0=;
        b=A2Cv3vb4Xgshj/+HH7VGguJnDu+EZ/8wRRl9h0O/nYlGjo4ixp/ocTYiu9gexG+cWV
         T5ZLS8/OkA0Qx8BYhbeXBWWaAt3NtiQ4JRikZeCimBYETQ1q+40SoWw5vW0RPz/tccgN
         QVBgUUjO+/yXix174J8a49B23sgHk1PnEdP4QLIiihWNObaBpX6I3fBnWw2WWzCPETWs
         N5U7mPVXL0qde9+bwyKRZcGKpCblOYtTRCQXoQaxPXP6+SlhtxfJJ+1SYbEDisA/smFL
         QRo/ya9gMbFCrK55GQ7TWc1vvWDJHZYeFQafc8YDGo1GfjO2CRHFgPmAo4d+qvg58Uln
         +OSg==
X-Forwarded-Encrypted: i=1; AJvYcCUJQDyCd9bCwmPXdII4u2n+BzrMDkkgNRsTQU/RoNmMKNjThjV96SJQojrgdxrF+ZvQEl8Rz5C9040m3mI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzW0cqY8ZPaNNGXQjnGlaXXljX7qf10TrJtOVfH00wSiqw9xyrl
	PWTh7UACt3hlLdewPVX1nQpJ1t4j4KW/iq+8VevgfrJ+k2WV26HByU8DFweOzbV4trDTss8IFo3
	JqtU45Cxg6vrtcnjKVxYG8C+BWO1VQCeRfIbhBsiHQmMIT2PHiC2xUYA=
X-Gm-Gg: ASbGncv5uTV3s0+IvmS3ZAgof3mznEV/y6TvkiMboPvSx+6Pv5L3Jad59Pw+XH2iC9a
	P4bD2Ch8dkUP6c+PoRoE11K2uh2o2lQIi/tsRARyUUeQ+fZOihqjiSOhcp2ljVMCfeYdpd5sAXh
	0RYrYFK7UqzW7gEjeWnxth+lRjPzlDTof7mnBAdyFB8t459gWi/p6JwBOpMUH1Vcf187mWX3xTv
	q9rK2/F02kdxDtg8W+iD2s2WxRhmiFvyBiGD/+eFGl7oBJ8nHqzevV3Kd+b64KQMn/ooda1dJlS
	DQd7ThlvlaH50UIKnoniyg5xXZot/hBtMyNOgT0jzXzi3Q8frKsX2Xy06sJwSs6UmFlrJ1skHVg
	t7P84
X-Google-Smtp-Source: AGHT+IGmXfUesLAV8RjVVzxO44B2DnEvoYBx2M268pdRUhUh4bUu5rXcCLR84zMgAaAcbxmfSkxDjw==
X-Received: by 2002:a05:600c:3b0a:b0:43d:16a0:d98d with SMTP id 5b1f17b1804b1-43ebef77ba7mr9564345e9.15.1743637070303;
        Wed, 02 Apr 2025 16:37:50 -0700 (PDT)
Received: from ?IPV6:2001:67c:2fbc:1:c56:43d3:d3c0:365d? ([2001:67c:2fbc:1:c56:43d3:d3c0:365d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec16602bbsm5264215e9.9.2025.04.02.16.37.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 16:37:49 -0700 (PDT)
Message-ID: <d997447e-8348-48ba-9c72-5deb7fdac8ff@openvpn.net>
Date: Thu, 3 Apr 2025 01:37:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v24 06/23] ovpn: introduce the ovpn_socket object
To: Sabrina Dubroca <sd@queasysnail.net>
Cc: netdev@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Donald Hunter <donald.hunter@gmail.com>, Shuah Khan <shuah@kernel.org>,
 ryazanov.s.a@gmail.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Xiao Liang <shaw.leon@gmail.com>,
 willemdebruijn.kernel@gmail.com
References: <20250318-b4-ovpn-v24-0-3ec4ab5c4a77@openvpn.net>
 <20250318-b4-ovpn-v24-6-3ec4ab5c4a77@openvpn.net> <Z-vkl4NqfrkoJn-l@krikkit>
Content-Language: en-US
From: Antonio Quartulli <antonio@openvpn.net>
Autocrypt: addr=antonio@openvpn.net; keydata=
 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
Organization: OpenVPN Inc.
In-Reply-To: <Z-vkl4NqfrkoJn-l@krikkit>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/04/2025 15:05, Sabrina Dubroca wrote:
> 2025-03-18, 02:40:41 +0100, Antonio Quartulli wrote:
>> +void ovpn_socket_release(struct ovpn_peer *peer)
>> +{
>> +	struct ovpn_socket *sock;
>> +
>> +	might_sleep();
>> +
>> +	/* release may be invoked after socket was detached */
>> +	rcu_read_lock();
>> +	sock = rcu_dereference_protected(peer->sock, true);
>> +	if (!sock) {
>> +		rcu_read_unlock();
>> +		return;
>> +	}
>> +	rcu_assign_pointer(peer->sock, NULL);
> 
> minor nit: that could be rcu_replace_pointer instead of rcu_deref + rcu_assign_pointer
> 
> (and I don't think the rcu_read_lock does much here)

Right - will fix this too.

Regards,

> 

-- 
Antonio Quartulli
OpenVPN Inc.

