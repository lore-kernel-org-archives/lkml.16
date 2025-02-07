Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0048A1E22FA
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 13:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738933955; cv=none; b=XC33f6LOWeK1584/Uw8CPxtmbhpF3FK5BGWN2ydQ60ReB/ZBUYMdsAXWtO5yxeHMEr9CLHbPMomCyCFO0eNGfjGVRN0zvjJSMW3ezDsWGhQn4Jvb8aFkApBD0Hl2VqFU8m/YPKnOihOlp70dLVTyFfMqYOOSLaQ9aouRaizxRIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738933955; c=relaxed/simple;
	bh=V8LDVkl2nRQ6eAdBK40xG1bKfK4P9CzdnIHedeqf3Ic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W59XVn4GiJns8k+aFpW5ZhQh+/bfligcGWCm8GfF34bJHwzHdEFaB452wngsRj2zQOZR0V7SAitVO8h6LLlcJtZkJanJOyL1vTOE24IXq90q6KuXgkE6O1JNgp1Mdp4gq610601WDPTjRjcaMTjllDxPD6O1ncAeHEivbIw3qRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net; spf=pass smtp.mailfrom=openvpn.com; dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b=XK/cYaOa; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvpn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b="XK/cYaOa"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-438a39e659cso13515035e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 05:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvpn.net; s=google; t=1738933951; x=1739538751; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ULYqwQI7CRaAqRL8oB/X08x15C2FHRC/9lLiC6I/SiA=;
        b=XK/cYaOaEdxWlPmatP+1cDEoWY86h/rHp6XPTISPoA19PK9HjNN4IPbVCTUMCklbsL
         NZsl9+vVOXScvoSBGykt7UkM25yN2Fe0kSvVKmGp5lWiutfY9Qm4XFyklSyZ33ZOaf0y
         yMrEH6mqigDxcBUqtPhIPJgkmc8SnfWPIOvPJVUdmrheFfWx1C4w7tm1tPdcIMVRTMUZ
         lFQRpn8ntvuD9SjNiJppZeXjMDpI9OtyXXTf9WPml9rS0r/aN+l2tZ/DbSvG9EaTlZ1J
         np4fNTrVnvpNbjYmanOfDXIt5WOw/vGDILpjox8sMa9JQpDQSIFhkdgWyGcKJT0aXWLX
         CW0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738933951; x=1739538751;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ULYqwQI7CRaAqRL8oB/X08x15C2FHRC/9lLiC6I/SiA=;
        b=kMl//SbQaEUN3Jvb4zmxP9MR11Ccl9XkwkRATdwMJEz1mzsFAp3nEEQH7dHuYbkUAW
         oBS/BGSR4sVGjWT1TiXr/skgHaTFlAAqMPFp670xLo5F2m+LxopZR/2giLBwTLl3uoyz
         X1rX5/z+W2MeN0jJV+7dfHhT0BXhgHwfvoDFwxx1bRDc1w2Hdv5iKDT9IYZi+LgdIFKv
         FQWwhN1KNe5s/mkAu4/Er3+x106etOyTvV0n68iqp8Rrg4yKhHn18S2HaCzdk7pnjNHR
         w+ViiTezYD+rTFREOni/EHIxzOafQVHYEUmBEtaaSEalvQNwGpVQCYzqi9oozHB2y2MW
         nlvw==
X-Forwarded-Encrypted: i=1; AJvYcCXFzo060tOJA+Ic+GvV/3HzrcnAk1XRlRBsVp498tgrRkdO+L9n/NVrbRfQ5wRyLS88G0eglI6bb8l1EZ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYGrrzNHP3a5n8WMHv5Bch9GYxU6rR8RwUspNcUGgg5Tkte1ZP
	94+JoGWharQb/0ZozfmPwZQ38PT8tHTiDim+AQd6WInU1WE502KS3WZ11UVIZbw=
X-Gm-Gg: ASbGncvpCX9Q596B6BRdQb+l2H3ICjwQuxOjXDLZPGOLav3ui+UKYvY5XpBTCbhD6P9
	IRINhJt2LA/fwLN6ucZdQ7B/VyCIfHglQOY/KdkLg1OIf0bxxHbFF68GQqDYcd938tpPyvxsq2A
	upnwV9QifM5rg9+P7GKZsYpcpGRTAz/vnjh0DrXhwTPswBDSg+R+zCgfeUOKgCp/xo9fpV+3rpC
	4Q6dM9DgGv2Je7HQtuKK9csgz4kMPZBIvDZKPsixfqaNdYNt0Z6V9g0w0Wk3KtqaB/1WhtFJ6Nq
	YgtO5Tfi+BDjO8md+XwPeAOgil6eilstDsN6ztZXofweQzRghN3iww==
X-Google-Smtp-Source: AGHT+IF9wBsCSNNxAMG2g04BTTFcZiuGmMSSq1jpBjzRykjiBDMEmwtMfluBKIAcP83yb2c/VLnsOg==
X-Received: by 2002:a05:600c:4f52:b0:434:b9c6:68f7 with SMTP id 5b1f17b1804b1-439249b2ba4mr23665845e9.26.1738933951145;
        Fri, 07 Feb 2025 05:12:31 -0800 (PST)
Received: from ?IPV6:2001:67c:2fbc:1:5aa9:f4c3:dbe3:332c? ([2001:67c:2fbc:1:5aa9:f4c3:dbe3:332c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d94d7c7sm88973265e9.14.2025.02.07.05.12.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 05:12:30 -0800 (PST)
Message-ID: <3dca88d7-7037-4721-aae7-35970e97be21@openvpn.net>
Date: Fri, 7 Feb 2025 14:13:40 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v18 09/25] ovpn: implement packet processing
To: Sabrina Dubroca <sd@queasysnail.net>
Cc: netdev@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Donald Hunter <donald.hunter@gmail.com>, Shuah Khan <shuah@kernel.org>,
 ryazanov.s.a@gmail.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Xiao Liang <shaw.leon@gmail.com>
References: <20250113-b4-ovpn-v18-0-1f00db9c2bd6@openvpn.net>
 <20250113-b4-ovpn-v18-9-1f00db9c2bd6@openvpn.net> <Z6PdEurGNirlnkoM@hog>
Content-Language: en-US
From: Antonio Quartulli <antonio@openvpn.net>
Autocrypt: addr=antonio@openvpn.net; keydata=
 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
Organization: OpenVPN Inc.
In-Reply-To: <Z6PdEurGNirlnkoM@hog>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/02/2025 22:50, Sabrina Dubroca wrote:
> Hi Antonio,
> 
> Another one I should have spotted a long time ago :(

better late than never (I think..)

> 
> 2025-01-13, 10:31:28 +0100, Antonio Quartulli wrote:
>> +int ovpn_aead_encrypt(struct ovpn_peer *peer, struct ovpn_crypto_key_slot *ks,
>> +		      struct sk_buff *skb)
>> +{
>> +	const unsigned int tag_size = crypto_aead_authsize(ks->encrypt);
>> +	struct aead_request *req;
>> +	struct sk_buff *trailer;
>> +	struct scatterlist *sg;
>> +	u8 iv[OVPN_NONCE_SIZE];
> 
> You'll have to kmalloc this as well, it gets passed to the crypto API
> and with async crypto, it'll be used after ovpn_aead_encrypt has
> returned.
> 
> [...]
>> +	/* setup async crypto operation */
>> +	aead_request_set_tfm(req, ks->encrypt);
>> +	aead_request_set_callback(req, 0, ovpn_encrypt_post, skb);
>> +	aead_request_set_crypt(req, sg, sg,
>> +			       skb->len - ovpn_aead_encap_overhead(ks), iv);
>                                                                          ^^
> passed here
> 
> 
>> +	aead_request_set_ad(req, OVPN_AAD_SIZE);
>> +
>> +	/* encrypt it */
>> +	return crypto_aead_encrypt(req);
>> +free_sg:
>> +	kfree(ovpn_skb_cb(skb)->sg);
>> +	ovpn_skb_cb(skb)->sg = NULL;
>> +	return ret;
>> +}
>> +
>> +int ovpn_aead_decrypt(struct ovpn_peer *peer, struct ovpn_crypto_key_slot *ks,
>> +		      struct sk_buff *skb)
>> +{
>> +	const unsigned int tag_size = crypto_aead_authsize(ks->decrypt);
>> +	int ret, payload_len, nfrags;
>> +	unsigned int payload_offset;
>> +	struct aead_request *req;
>> +	struct sk_buff *trailer;
>> +	struct scatterlist *sg;
>> +	u8 iv[OVPN_NONCE_SIZE];
> 
> And same here.
> 
> (maybe something for the todolist: ovpn could copy the alloc trick
> from esp_alloc_tmp, like I did for macsec_alloc_req -- not required,
> but could be nice to avoid many small allocs and all their failure
> checks)
> 

Ouch, you're right. I will pre-allocate iv as well, like I do for sg.

And thanks for the hints, I'll add that to my todo.

Cheers,


-- 
Antonio Quartulli
OpenVPN Inc.

