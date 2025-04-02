Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EADE1EE001
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 12:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743595459; cv=none; b=cNT7nESC7UQLqI6N7B2DDsNvGbiTUumnaKQDOs3e01GGuyvroL7i5CeFM7GXvtohNDGJf+iWv+f11tNGvCZXUWXqW/rwbPsWKLM7zL48I8X3P25SMvJvZLQnWf88q2ZjBYfpXxx0EHPvboxkBhhvjhbmCfPFouSYVPaLBi4ztuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743595459; c=relaxed/simple;
	bh=lpW/o2RA5tgkWP0FqFy/0nwz89bljtXDM1MP0hykgC8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IFEOmD/veBSATcJDHmCvPRu6YokEM2kTGm4nMK96YHmVmHLZexiEa69SydhXN43kutYZDkJU42gX87l6yvipO/Jsq4f35gRYHr0NuBeWCoLw+rsvBYwmPGI8XxyZ3xJ7wY3MijysJ18EUYgL3rezwCFysK54e0CXDqWXs/q5FXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net; spf=pass smtp.mailfrom=openvpn.com; dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b=SPhxsz0m; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvpn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b="SPhxsz0m"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac34257295dso222147866b.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 05:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvpn.net; s=google; t=1743595454; x=1744200254; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mBYrvzIL73mZMnAvFss/1pIbuShofo0k+zpJBk1+x0Y=;
        b=SPhxsz0mP9ZMm31nLvRUZxoj2z9V77zJ3Fl+u9ScmhdboA8SdUYL0d4ygqwSH+3DNV
         /ZB0I4GWkK0VmU2OyNiYP5BEiLoLB05AeTtYXNAYQ8tfIXM2MSOTcsP00eHGf2NvAqqJ
         FU127bwW62pKYhgDSr47/Ozn6aX674BP158U1WUy8QRHx7H6+OgpZWs/9SZfs0s9KgOU
         1iX03SozPyT0VBRNtGJgrFyDlni7wYaRcy+hv25VGhYdudN92Z8tnfLTOdM/c3FZ/Wur
         OCRfNBLiyXjHOJgZow1GfJzmvAIQMXoW3Oo9YOaGmo/oGgnUEho4G9J+7z+m9hRR/hNd
         tw6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743595454; x=1744200254;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mBYrvzIL73mZMnAvFss/1pIbuShofo0k+zpJBk1+x0Y=;
        b=feBMTI6hbw+HZG+6/p+wI2wW0pkO/m/EvWUudlSO2Hpgx05ccdOdKTBJcUAL8RJ+hH
         rEZdgNHzpfmGO87bUItQXxUBOfLLgtkN2/9wb/4EpI6ypeQdBfkHhZ6huLFaeGCqjiT8
         9HzS0oclYRez6BlS9/LVHVlmfvj3+SngOKKMWv4HDFsJXR8Xh8cwca1IETLUYRtOw6n0
         NjYjXsUQRmNhCCSarA9cb5F3hORpsJltLiU2WMqhqTRhEpYSjEekV7R3w+E4h0s28ajm
         U9pS9ye9K72/FzjVDhN06lQ5Uf1SDyqxslr9C/7NScF+ouGVS6WYtFtt5jmU49WjnywO
         jnKg==
X-Forwarded-Encrypted: i=1; AJvYcCVd3Irj5hyqc+mArTJx/iSLjoR5KgwdeApVpJfDXIrU3cNuNy2cuWl4y2r/UFDKEpthzy/JwBBzyny1NOs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxyu4gtr0Clg2lganBiVP+ds7CI9inlbfAFlQCtKuOpDD/xdKyc
	qdXB3kiyT2mO7dcp7gVwb36qu6Elb/Q2lkcbVFjjrGOBGOtIlLB0WekP++9yYJHN2t1wD3qbM2N
	966U1pZPQj0ckOiwk78agR7yN5CU0FK8uCYtDoKW0/M2cXoQcfDlHDkw=
X-Gm-Gg: ASbGncuM4mqWnzj3tAogfOnGUwvOgUI1b1wDiKy23/zWWjGSrsitAgKC1I3C8tAGN3m
	jEVL1dylwpeTZRAM7p8RdFlkbgOZod07D98ROq9uqevyLV5I3h0PVUaD0wrBGdpA4jw8Px+ERWJ
	hNqywx8mD6XcSxw/4kkRzgcimcHEb5a7ORpFkA+kYYMy1nj5wlycKRiIg3Bf9eQJibwDDc9Qo4i
	ni92unXdsOIs/Rtu27ew4ao9CCMz5I9yFl5oZNkDChFoDegtBWvXWmo2+WJTwKt04c1p/Vfnjt7
	/Wjg0OymvLPDSZ8S2aX+Prg6ZfaWgOqv8C8kke3Lcu5cjJH0EpkOK0G5PKy90MHnUxAhalTuSI/
	VwuP1qqA=
X-Google-Smtp-Source: AGHT+IGYQ7kJJcuc8T9fvq2VTLjEsxmhNZWdeJxeOjlwY3o7lDQ6wZyc5AdoMU86aeVCa3KRFhv3uA==
X-Received: by 2002:a17:906:5908:b0:ac7:3a23:569c with SMTP id a640c23a62f3a-ac73a235730mr1305943866b.1.1743595454094;
        Wed, 02 Apr 2025 05:04:14 -0700 (PDT)
Received: from ?IPV6:2001:67c:2fbc:1:9a9c:dc9e:39c6:2380? ([2001:67c:2fbc:1:9a9c:dc9e:39c6:2380])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71922cc94sm907520266b.28.2025.04.02.05.04.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 05:04:13 -0700 (PDT)
Message-ID: <82ed4c04-d143-42a8-88a6-6dceea2518cc@openvpn.net>
Date: Wed, 2 Apr 2025 14:04:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v24 08/23] ovpn: implement basic RX path (UDP)
To: Sabrina Dubroca <sd@queasysnail.net>
Cc: netdev@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Donald Hunter <donald.hunter@gmail.com>, Shuah Khan <shuah@kernel.org>,
 ryazanov.s.a@gmail.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Xiao Liang <shaw.leon@gmail.com>
References: <20250318-b4-ovpn-v24-0-3ec4ab5c4a77@openvpn.net>
 <20250318-b4-ovpn-v24-8-3ec4ab5c4a77@openvpn.net> <Z-u2NqykODnOrEgl@krikkit>
Content-Language: en-US
From: Antonio Quartulli <antonio@openvpn.net>
Autocrypt: addr=antonio@openvpn.net; keydata=
 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
Organization: OpenVPN Inc.
In-Reply-To: <Z-u2NqykODnOrEgl@krikkit>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/04/2025 11:47, Sabrina Dubroca wrote:
> 2025-03-18, 02:40:43 +0100, Antonio Quartulli wrote:
>> diff --git a/net/ipv6/udp.c b/net/ipv6/udp.c
>> index 024458ef163c9e24dfb37aea2690b2030f6a0fbc..b30175e34230d3dbf5d253838df894f0625c705c 100644
>> --- a/net/ipv6/udp.c
>> +++ b/net/ipv6/udp.c
>> @@ -1933,6 +1933,7 @@ struct proto udpv6_prot = {
>>   	.h.udp_table		= NULL,
>>   	.diag_destroy		= udp_abort,
>>   };
>> +EXPORT_SYMBOL_GPL(udpv6_prot);
> 
> This is not needed anymore.
> 

ACK


-- 
Antonio Quartulli
OpenVPN Inc.

