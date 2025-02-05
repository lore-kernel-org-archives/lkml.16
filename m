Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02BF22A4E2
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 09:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738746701; cv=none; b=ASohFBpFzNzAhzIKqzk9owJNue0ZtvJfuwlWX+g0+T0ISTYVdZbty3v9AJX5LLelw9WQxWPQgtkbvKkWYdmV1GQ7xNraGITbEpNntSLXe0lM2OExqDglIHn35wrji/I0pQ2J3aca7cEUG3Q4XYyxGGddSK8nDbBzn15cOTjO6pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738746701; c=relaxed/simple;
	bh=FrfX+Va6jShG2kQ7vxJe5JbRNE5XziiWylZStKahXbA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qf5JV+lK+Cv0Q9MtVc1q7ppaebSYOTzRz1345Y6rsHyTmx1HK8masgVjS+Z3SmOWoLExmp4aU1lJIFkKRKYKZW6YsSr6i+mBFPv9sLxttZwo/ocaSFB33GM3iaZqO50AUlLuGZZZQrSSY61khC+AhSYgwkiX+vPy1tyW8uMzjDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net; spf=pass smtp.mailfrom=openvpn.com; dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b=ROXlN+eo; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvpn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b="ROXlN+eo"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aaef00ab172so1027311566b.3
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 01:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvpn.net; s=google; t=1738746697; x=1739351497; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hN00tjsFn+X2j7iH9Mfyzq5iQc++plfpKz8SCs0r79A=;
        b=ROXlN+eo+V0u7RDQCIjMLzPFMpkdHKcwnRcuGapESZCagpUAvTkmoCO1Nr6AStIwJH
         aVpAq6tiep5D48HxImSHQy+4JGIctmqMdnGz4ynZqdLoLuxOhysVYyMYgi5xDayzP4Zh
         Vq7mSBBxlfdgor1zyk/69XbvNMgVhrBr0x7NI92mTSHaRIvrAqnA00l9gI8AXzGNerRO
         DQvg2uiSHyVIqXCpMkSDWSYVu5YA6SES0/8Eg0Qba+lGUuEco8u0smBTMSgFBIPC4DAd
         K+/ZJZQn8UXgoJZnDmTMX+bpJrV044vgeijbyj1V8Tviz2tkxaBZcGowXNgvgJ6w0AVt
         k9fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738746697; x=1739351497;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hN00tjsFn+X2j7iH9Mfyzq5iQc++plfpKz8SCs0r79A=;
        b=CMRyFloBcbgHtrmRSmCjKzycy+bInGCfrQxyuRZ+Dt8pyU2LSmTopN7+yf2u/QJMOY
         b6xY2Mfte1aH4toFGQ16RjT2pT2OY/cY6mEcL2JZCPnDucieKAJ7ZWvN3dY+T+pmWy2d
         3XQe1zhJk3Gef1InHXxOgsMal46GFz/gedBOWc4MoJBEevLt0npdYW+5kMekcNB4KkFz
         6Vdl1se/LwcLzAVpHOASc6yY/29cS3ZGEwgyabJkLwL8lMnvovV3yTGwwrKzw1Dp7s/e
         KUuEWIsHmgvuT18yUpa13Aotdp3UzfhsdCVrsuTA06ogEgI4td0uWiQkyXsYCc5zyYvU
         wz8A==
X-Forwarded-Encrypted: i=1; AJvYcCX4155oIIfRo0SbhTravvr9BTtCYhs0mJrYUjgAsz+DRis8p1k5kyGuxL7RJGpcGeaU07/FOITD6Nscms4=@vger.kernel.org
X-Gm-Message-State: AOJu0YysUJAQ1bdRmEv2Uu3swIQuQ2/ZQjy6DSwr8RSfveyxpFp1AOJk
	cF22OWezXgFojBhk0K9EcbqwTtoks7HwWKqlzaP1/rJHCvIKcLEw6wfC4xTJOrg=
X-Gm-Gg: ASbGnctAgHkjuQEbEsoVUS+FGBqjavrSt3jZTT8mdQPwbdWUltAYkQ86FOfNVwKwpUA
	fd4VUL2ZtYdyrNFD6qpq747Po7qCGGrzTL/AfUXZIiPCf7spW2SiFY+moj0fPZ/BrZmeBMZBkgb
	/TVz+RgMmCKoGutHj54QXjirVk7rM/uvXKSVyTI/jCFPS5nyQDlcLTKyYOeMhmMNlt20h+j1k4c
	urCva9HGDUhbiPj0yuCiOffnkKqSZSdHLJa5YskC3ms3g1G8bfkJ52IUl6/vrMPRvWaq80ACaR8
	oZPVFJMFJRSlUTDSCS5bq6FIRByXMZve34tlrTqtn9GoV5RUVcnnyg==
X-Google-Smtp-Source: AGHT+IEoQAuCOq42UVqvlrSsUfc0NnaMiOTk8hK4xlAbqdB6mJYOEgWtx7QtTS2IN0r2sXN8sU1+Gg==
X-Received: by 2002:a05:6402:13c8:b0:5dc:80ba:dda1 with SMTP id 4fb4d7f45d1cf-5dcdb711b67mr4827035a12.9.1738746696686;
        Wed, 05 Feb 2025 01:11:36 -0800 (PST)
Received: from ?IPV6:2001:67c:2fbc:1:e45d:9f15:4f3d:f5b0? ([2001:67c:2fbc:1:e45d:9f15:4f3d:f5b0])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47d1014sm1069717466b.66.2025.02.05.01.11.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 01:11:35 -0800 (PST)
Message-ID: <4c97399a-8975-40ca-aa6a-0c18a366d596@openvpn.net>
Date: Wed, 5 Feb 2025 10:12:45 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v18 07/25] ovpn: implement basic TX path (UDP)
To: Sabrina Dubroca <sd@queasysnail.net>
Cc: netdev@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Donald Hunter <donald.hunter@gmail.com>, Shuah Khan <shuah@kernel.org>,
 ryazanov.s.a@gmail.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Xiao Liang <shaw.leon@gmail.com>
References: <20250113-b4-ovpn-v18-0-1f00db9c2bd6@openvpn.net>
 <20250113-b4-ovpn-v18-7-1f00db9c2bd6@openvpn.net> <Z6CR6QGVrMqauP2H@hog>
 <Z6I9yn3Nh-9Ebvv9@hog>
Content-Language: en-US
From: Antonio Quartulli <antonio@openvpn.net>
Autocrypt: addr=antonio@openvpn.net; keydata=
 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
Organization: OpenVPN Inc.
In-Reply-To: <Z6I9yn3Nh-9Ebvv9@hog>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/02/2025 17:18, Sabrina Dubroca wrote:
> 2025-02-03, 10:52:41 +0100, Sabrina Dubroca wrote:
>> 2025-01-13, 10:31:26 +0100, Antonio Quartulli wrote:
>>> +static void ovpn_encrypt_post(struct sk_buff *skb, int ret)
>>> +{
>>> +	struct ovpn_peer *peer = ovpn_skb_cb(skb)->peer;
>>> +
>>> +	if (unlikely(ret < 0))
>>> +		goto err;
>>> +
>>> +	skb_mark_not_on_list(skb);
>>> +
>>> +	switch (peer->sock->sock->sk->sk_protocol) {
>>
>> We have a ref on the peer, but not on the ovpn_sock. DEL_PEER could
>> have detached the sock by the time the crypto completes.
>>
>> (unfortunately I don't have any idea to fix this yet)
> 
> Maybe an idea:
> 
> Since ovpn_sock itself lives under RCU (because of sk_user_data),
> peer->sock should be an RCU pointer and also follow RCU rules. For
> most parts (io.c, netlink.c) the conversion is not too
> problematic. TCP is more difficult.
> 
> I still need to think about whether this works, and whether this is
> worth the complexity, or if we could solve this in another way.

It may actually be a reasonable solution.
And maybe it is not that complex to get done.

I'll see what I come up with.

Regards,


-- 
Antonio Quartulli
OpenVPN Inc.

