Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985BC1C3BEE
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 09:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738576467; cv=none; b=Hh9VbJaQzDzQJBGT8MR6j+itFrJkWA5D716uAMC2tlNqgbNZeU0Ryzl6srR9W9evmpOPXleJZOXJGp6qqDptrxIGKdfue8mHrXEZJ+cyKHZLeBZ3jGksystge9RzamhgtKEmLN5jBUZCyzUuB1HJxMBTrNOY7HX5k9xUmgqmIv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738576467; c=relaxed/simple;
	bh=eSmxloYDYU8L7DSmQw+qJpOAKVq/lSAURecTBARj2aE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DdjElUxrgge0Ew8Je/dAMfVkV95Jrc45RlmJ3SAqMuyzeBj9eCOy68KH5sQ1GxrZPeRwrNoLiTQkklH8XNJyZVcBRgKatKOXt2FkuU0yvtXNTeJCKsKAue0nznV+we3iyNEq85Eq6bFjm4gD2uBh5jp7W4BLhGevkCACK4aLm0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net; spf=pass smtp.mailfrom=openvpn.com; dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b=LCbfFJcO; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvpn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b="LCbfFJcO"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4361f65ca01so43245255e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 01:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvpn.net; s=google; t=1738576464; x=1739181264; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=96711Zo9CR2XVG17Nter5UiX4vK8kBFFsAbRByM3Gl8=;
        b=LCbfFJcOjseqbaie/9EPKxqNVz8GWV0SGSsJU9/9ALvKv3a6jgEI5gxaWP/sqkOizA
         BnFA+tMQXuRbJNyrZvYklQNRKk7YigpFhN/ElPNnmhXz7BkqWQAXOL8vET0q/NI7VR3i
         la7A+iv7/jyPE2ICOr6r9VQ73F+o9NuUE8hW/6ieSloUhrFoIvyHOJYfHqkOmpoA12cZ
         LeV+lQ59EYArpQTM7wzII22ceEYuaHkL4iDpn897cv+epFCFaaMPZDZw1zixMsmjScNc
         ASPvvmr4FHEduCM/aVbkS8i/x5aa+pnyXbIY9P9gCSZ8PnkQFjI5Fl0SqCxqPp0DWfio
         mCWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738576464; x=1739181264;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=96711Zo9CR2XVG17Nter5UiX4vK8kBFFsAbRByM3Gl8=;
        b=uupDZhHtN9c2bq/PCytG4LQENHXYMT8nBMoFN6GN6oHIRf3YvQuV7AG3yD8SwPUjU+
         NnEmoW0ZbfXJRv/YeNDAfjEPtK+JEmsmulprocnz+5X6nlEM8PsA+R3gAPp2ndIsgxer
         Bir6zCAkevwAFswm0k05e2MP9p2XUNSp/O+a2d0wSA156riISzHILsEtqbhMeXkghvli
         QfzAUbYuiZfuZ/ShyvNn9RGrBXwRvrY24RPrqKj0dsE6c5ux96U5ONCQbCjAg0fotke1
         yFFB5yPCRrxeJoGGCHBPc8h6whhaf2QT6/QaKNgNgbZl3o25csO4XB9BGT8I9bEmSVXo
         W/HA==
X-Forwarded-Encrypted: i=1; AJvYcCU75xA0Iqj9FKT9wqotSrHbqak/esCvpz5cjzCWf5MHVKloC3j3xFBUBoINx8n+ofz6/Whh7l3006teYK0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFKLcTT48FNKqI+DSBAMZeszlpbbMaIFKqVE2BCnL6MojXi/MI
	BcuSil8HnjBNrXP3fWyqbIgEZcW4UKBe/pgGAeuR2pxyIaBwWnLB4xYHuC9JeJA=
X-Gm-Gg: ASbGncuEfOgUdbJ0Z8bAayBzfKEZFGLMzoVT8lbcb+4lYjPPJZWmcAzR15DfG1YiZpB
	zg3+HP5CaUfOS1whs1v1ck7bXkwRi9sTlmLZnYJaOtPZDemtsE81YiVOHXO2szG2sLBZCu0Rajb
	QPT/xxN4gBseySuf5EYR3M9U+THd76+t2O2/oPJmjSCHgazDyjA7JDg6CFm/esWRpeLIHUg+yvz
	wgudltDR0GRsYotjcubIUX+a3VM0z24Ilp54mrlDe7kMnw/1ZmfDmP6pow+K0ncI+dy0OUJmMpl
	cRPJMqMVbZYTC0ODWjWJJ0nMmuFeLQXDr1mVauNBrOKea7Q3wTIYng==
X-Google-Smtp-Source: AGHT+IFAl7UbKfI1GKffJcPjedN1nuCRKvEEkQnMY9cXhghwcJTAvGfBl5nsP69ucOB3VdXDqNL09Q==
X-Received: by 2002:a05:600c:4e0f:b0:431:93d8:e1a1 with SMTP id 5b1f17b1804b1-438dc421388mr154443835e9.27.1738576463796;
        Mon, 03 Feb 2025 01:54:23 -0800 (PST)
Received: from ?IPV6:2001:67c:2fbc:1:b4fe:e6fa:32a0:6a72? ([2001:67c:2fbc:1:b4fe:e6fa:32a0:6a72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c11b58esm12003819f8f.42.2025.02.03.01.54.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 01:54:23 -0800 (PST)
Message-ID: <eb6bd31b-686b-4edc-bcdf-935cb452b271@openvpn.net>
Date: Mon, 3 Feb 2025 10:55:31 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v18 17/25] ovpn: implement keepalive mechanism
To: Sabrina Dubroca <sd@queasysnail.net>
Cc: netdev@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Donald Hunter <donald.hunter@gmail.com>, Shuah Khan <shuah@kernel.org>,
 ryazanov.s.a@gmail.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Xiao Liang <shaw.leon@gmail.com>
References: <20250113-b4-ovpn-v18-0-1f00db9c2bd6@openvpn.net>
 <20250113-b4-ovpn-v18-17-1f00db9c2bd6@openvpn.net> <Z6CKYA8ueI-ZGybN@hog>
Content-Language: en-US
From: Antonio Quartulli <antonio@openvpn.net>
Autocrypt: addr=antonio@openvpn.net; keydata=
 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
Organization: OpenVPN Inc.
In-Reply-To: <Z6CKYA8ueI-ZGybN@hog>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/02/2025 10:20, Sabrina Dubroca wrote:
> 2025-01-13, 10:31:36 +0100, Antonio Quartulli wrote:
>> +void ovpn_xmit_special(struct ovpn_peer *peer, const void *data,
>> +		       const unsigned int len)
>> +{
>> +	struct ovpn_priv *ovpn;
>> +	struct sk_buff *skb;
>> +
>> +	ovpn = peer->ovpn;
>> +	if (unlikely(!ovpn))
>> +		return;
>> +
>> +	skb = alloc_skb(256 + len, GFP_ATOMIC);
>> +	if (unlikely(!skb))
>> +		return;
>> +
>> +	skb_reserve(skb, 128);
>> +	skb->priority = TC_PRIO_BESTEFFORT;
>> +	__skb_put_data(skb, data, len);
>> +
>> +	/* increase reference counter when passing peer to sending queue */
>> +	if (!ovpn_peer_hold(peer)) {
>> +		netdev_dbg(ovpn->dev,
>> +			   "cannot hold peer reference for sending special packet\n");
>> +		kfree_skb(skb);
>> +		return;
>> +	}
>> +
>> +	ovpn_send(ovpn, skb, peer);
>> +}
> 
> [...]
>> +static void ovpn_peer_keepalive_send(struct work_struct *work)
>> +{
>> +	struct ovpn_peer *peer = container_of(work, struct ovpn_peer,
>> +					      keepalive_work);
>> +
>> +	local_bh_disable();
>> +	ovpn_xmit_special(peer, ovpn_keepalive_message,
>> +			  sizeof(ovpn_keepalive_message));
>> +	local_bh_enable();
>> +	ovpn_peer_put(peer);
> 
> nit: could we simply drop this put and the hold in ovpn_xmit_special?
> ovpn_peer_keepalive_send has a reference on the peer from the WQ, just
> transfer it to ovpn_xmit_special and then ovpn_send. No need to
> pretend to acquire one for ovpn_send's sake and drop the one we got
> from the WQ? (ovpn_xmit_special would need to _put(peer) in case of
> early return)

Ok, will drop both and add a comment to remember the casual reader that 
we already hold a reference (+ put() in error path).

Regards,

> 
>> +}
> 

-- 
Antonio Quartulli
OpenVPN Inc.

