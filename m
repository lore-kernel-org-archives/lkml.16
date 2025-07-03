Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FA3293C4F
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 06:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751525902; cv=none; b=me12B82/FAztLeEycSN4FjuDzx8XjhGQ/ZuFzr7Z/DRLYxVlDKmCAN98S0na1txCMWX7t8HnJOZY+q/m1BEAprQJq/zl6xArirYyVnEQhn1GfwuV6nWzcrA3LVjighrFdbER6lk+YJwqUJUihknk9TQceYjD2MQ+SgmXXQfbzBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751525902; c=relaxed/simple;
	bh=bickAPlR7/NP79mWKt8/KneNlEYimMJnZ+NoqIvI854=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j3UUefx1mJ/QwyVWihNGFOtaseIv4ygXpb+6eZF8NZSdDpQIl5XrlPp420aXwsvU8wuf9a5Bt+7S55R7rTZq7dDGcjYAduihfrzhB1//lkqSDdZfcDpxAjWZSOsH1MXdYccy9lU2rTJy2Z0eUguUhDzrKwAjThP3QIfPsuN+MYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com; spf=pass smtp.mailfrom=6wind.com; dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b=dh1tWdqt; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b="dh1tWdqt"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a4e749d7b2so1347340f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 23:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1751525898; x=1752130698; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uGKG5g4X2FtIIBBBni+nAn11AVuFyvfdg7Z2wu+7sP4=;
        b=dh1tWdqtB6NPRpo0/mK42wwS3VGH8FsFkNqIPeIBLmg2QY0JnNQYPvTHM1jVhMFlgE
         GzB2f+xQMNHHNfYWjtScja1t9a+QNdGQG9TMZc7eHL2qzKu9XgbFFPhZNdKL8tey+GWy
         WTT7UUPUJegTvHMkoI7HuC8xzcHny0hH36hPfjMFDEaYMl3u1VgaBKM4PKs7G6FNW8O7
         EBLSHSWkFMAF1Zu3cRCQWTCWrkNxVtt3C7zgBVG0oCLLoUR73tHtNWhM/32/XDzs+OdY
         +EmF4HdNtwnp0btOurmMHkZ+r5HQEJOVf/KpGbiwfxCz+jUYTG1l+PzElCNtxElkYd3N
         wpCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751525898; x=1752130698;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uGKG5g4X2FtIIBBBni+nAn11AVuFyvfdg7Z2wu+7sP4=;
        b=Lx09my9ykd1OJkUaMfJysw0QjyizlQ9FOYzgYIw46fBr0fjLsxlRGelYlSG/WJQDXI
         P5TEnu2GYcKONK9i2/tp9TRxz008fqKQTVOQgW34YmHe8olaL7QKdvXNwVYsyXyEyL9Q
         LW3m532Io9QndHl1kSX5RXBQ6eWwTs42WwrbZTw9OG4Z0Jmc+O/kcfZcEetgRGQvmKuh
         UZDXaejCHKQ4MuZmq3cmzoAhFBnvtBBLaeckzuC4jOg8CIgKhci2jTleThlYA6WpSlO9
         MkDzdlmOOp7CcF4KvPsYsiq/gJJ3v6cn2SQEnXsdqXAOT1q14RJsfGNXmnSdV7CHZ3rs
         kSIA==
X-Forwarded-Encrypted: i=1; AJvYcCV2pttr0NZ5DmY1b7ZEAMTr6bc4o50qPseqPrBXjNDQBKCy/Xdj1AmAitjz+Erz8gYuPnz5uhXFJzk5oew=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHFJ9pLyLU3C1hP5Vdo7D8iI3vdkpOEjra6C+brjDdPmS+Uq/v
	eVTpOEaApA/8Vg7cJgwY8NzlFt5wolmqBSLJMaRAG3ZPQFVHKbaGlJXIRYk0WjWYu1I=
X-Gm-Gg: ASbGncs1Q50SswczmUN8/wUARdWJcPLMyrGtXY9+ZeFffZVBUB4rivqRRGBmuFME3J5
	OaKGrIvl899SzLBxGD8po6Ai1pJhdVryE9wQcYsx/mDH/cZ6cCyBLAUza0CG9oV7JZi64jIQUEM
	sIcPspiDwXOGTNzIwtAcgXPH+15Sn6cb/14KCCkai2IJ4FnNekYoKfuj+3Fqi7ey+VtDBhnBlK9
	ThLpOQtTfysQaIr9ddPsuY2tDX9ErkbiqJAiyymXpQmuc0uAk2GpblcS4mRJyj+QJL8P7E4tL+W
	j7lj3f/kv/0DuAHsOR2MNJU+OnHqxpJLg88NzsmWOA8BpUUB6X4cmYesFyJln9woZbepvDzEx+U
	e1hAs7aarjOmEJAL4UDr3lS6E+ihs3AX1tgZFp7I=
X-Google-Smtp-Source: AGHT+IFFoiiowVu/8wR0tlX292EVRJFeXC5GLN8cUKtKtyQtGsaIToPUA9LCF0OxS2wvlY0ljK8jzQ==
X-Received: by 2002:a05:6000:24c7:b0:3a4:dbdf:7152 with SMTP id ffacd0b85a97d-3b20110b371mr1611335f8f.14.1751525897572;
        Wed, 02 Jul 2025 23:58:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:b41:c160:5568:c43d:79bc:c2ec? ([2a01:e0a:b41:c160:5568:c43d:79bc:c2ec])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e5966csm17977144f8f.72.2025.07.02.23.58.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 23:58:16 -0700 (PDT)
Message-ID: <869cd247-2cde-46bd-9100-0011d8dbd47c@6wind.com>
Date: Thu, 3 Jul 2025 08:58:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH v3] ipv6: add `force_forwarding` sysctl to enable
 per-interface forwarding
To: Randy Dunlap <rdunlap@infradead.org>,
 Gabriel Goller <g.goller@proxmox.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 David Ahern <dsahern@kernel.org>
Cc: netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250702074619.139031-1-g.goller@proxmox.com>
 <c39c99a7-73c2-4fc6-a1f2-bc18c0b6301f@6wind.com>
 <53d8eaa7-6684-4596-ae98-69688068b84c@infradead.org>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <53d8eaa7-6684-4596-ae98-69688068b84c@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 03/07/2025 à 00:26, Randy Dunlap a écrit :

[snip]

>>> +static int addrconf_sysctl_force_forwarding(const struct ctl_table *ctl, int write,
>>> +					    void *buffer, size_t *lenp, loff_t *ppos)
>>> +{
>>> +	int *valp = ctl->data;
>>> +	int ret;
>>> +	int old, new;
>>> +
>>> +	// get extra params from table
>> /* */ for comment
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst#n598
> 
> Hm, lots there from the BK to git transfer in 2005, with a few updates by Mauro, Jakub, and myself.
> 
> 
> More recently (2016!), Linus said this:
>   https://lore.kernel.org/lkml/CA+55aFyQYJerovMsSoSKS7PessZBr4vNp-3QUUwhqk4A4_jcbg@mail.gmail.com/
> 
> which seems to allow for "//" style commenting. But yeah, it hasn't been added to
> coding-style.rst.
I wasn't aware. I always seen '//' rejected.

> 
>>> +	struct inet6_dev *idev = ctl->extra1;
>>> +	struct net *net = ctl->extra2;
>> Reverse x-mas tree for the variables declaration
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/maintainer-netdev.rst#n368
> 
> Shouldn't maintainer-netdev.rst contain something about netdev-style comment blocks?
> (not that I'm offering since I think it's ugly)
> 
It has been removed:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=82b8000c28b5
