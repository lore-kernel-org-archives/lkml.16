Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF16136658
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 14:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751551460; cv=none; b=tsMABi5GUyqWMKLVa8sfj4D/tNcHRFl1Ky8XUhuShwrvvw5XOHQWFY5jgw6VR2DbkqiWZpphM4cE7pyVVDkjObkDbNY/SRMlqfyYKAd0d1u+SLDg0lJThxgA20bUJbhI52/RmJXZ7syfOaXu2Xx7JHFY+xAvfQTOIMcFKs8Ro+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751551460; c=relaxed/simple;
	bh=2Ja0DRql3lathYbsnh14IuivZQ4FJiihEMyCBFg1y6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=I9jtjY6W23lSnw1d3T1JykCq8K2trNFiNXLgsaGd1WS41yE010m2Q+KvhoUeXdeNddD6FtITvxGKBMuGzvxfqeHjCtk7/uqaL25ps96Lw3w1r/LmzJK7SQksa3gN1qqSI0BVp+uqRl9Q0Nxb6nNXaOJ7in1evR2pcuqbdcMU+DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com; spf=pass smtp.mailfrom=6wind.com; dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b=TtSV7JHA; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b="TtSV7JHA"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3b20fcbaf3aso317676f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 07:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1751551457; x=1752156257; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dDrJgI2UVALwAFMMfVSy2p69AmBm6S+zzAfjuuFd4NM=;
        b=TtSV7JHA98z6F4GHH35zpp4gDOAvs7W87NmDHqfSW96LSgYzE2ROJfELFFr+YWQLwZ
         t+ApmACziJ8WHArk3KjRI7peWUyiXamCAm0KTW0Rxngxz02dBm8L+euTcdeugX8tIyMC
         2dxFv3s9SJ+czqY1sFB42Ciyw2JENoadUcJlZZkAJTjk5w0cFesvYGin7PQVZWIvlDU6
         swCyJ27phZ0eGOUZt7nVNq3bXV4Bw1gyD872B886oIkPmtnK7xVi8gIU7D8GwicNJ7/U
         +/SANI61epMP3IuIEFIS3QISo4DwPMZxImRtfN6NiVFSNkC80xHGjDuiCc08mHxVaOBw
         H7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751551457; x=1752156257;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:to:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dDrJgI2UVALwAFMMfVSy2p69AmBm6S+zzAfjuuFd4NM=;
        b=NyxwnzCmjJ+yfEZOMv1IiyTkDI53IUyTNxwev8vJ+cPdnKXk+PBurthgi3h3v1m5+y
         lNSsQ0eLj1A5G4zfIlPg3xAd6SQyfbWscLX4KD+cYbpFbudh+i9X/1Sk1XWqWGHLSAhU
         oF4HrB7DJVzwdStMXQnEAWt73R8RsEKudLWYnNUBq54nH8yheraY2ZULbRoPYGEwJ3WP
         5qD43S6APq6fRzYh7LUHP/7AfsGSXIWB4wOfeVtTwSHRXZvNdHqACl0uqPaXuv0C7Cq2
         P3GFrUte2CJ6RJhHW1GLiBKb1rGnQWPKyM1CC62wSf7vOQqcCqTORmfo7Pdf/Phfq+TG
         vl9w==
X-Forwarded-Encrypted: i=1; AJvYcCVsYrIra3v0JERq21j1s75wd+707xuaThvKpfji+1PsalcjIwM/RdBp9aAK0P9VbEJz+IXZWmiUrx7TJyM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDfuicXfbHmV0SCNNdheytAVuKEGZo7xhMSNrUo+yYOmXNIdIc
	hfjaQO4mcwDljjE9tSA+qbWRn9aJhoM5HsJsuXqkLF9W7rONEuTSFPdQtf097uc9G+HyYdMt5je
	2PCz78ys=
X-Gm-Gg: ASbGnctY5f5I9TX+xbqFjzfpcuBCf8An+D8LqHvyXQxbQ2n9FdQs2KCZ+uYZI40Uh91
	G/gP+X68JYjsMOvslPSwKv6nBuYU4gkTBccte3PvX+eGq0NaiUNfcEC6NPgCPYbAF/cD6tpA/Np
	Qeg24DAwTgH9A+WrvBr9dcs4eeqRo+DYJMYbQSWKyIRHhckhvYY6uuNVoWKsYgs5dqtDKo93U5m
	KskxNgpmNvo6+tbAMfAtJWVAVeRXj6HxmE6WvPXbHVW8uHwRhz8KiXamI4gDJLl1Yyolripc8cH
	v90S4H8HB/SOBuOvuSmUKWjy1K/iIAFqC/De6hopmk956nh2m7CrdlLs7rEw37qKPVxnvvRA0Pq
	RXsSlq5XpIPZPJoMOHtX7+5dzkyZHUJxKkHzOfPQ=
X-Google-Smtp-Source: AGHT+IF5rCFDzUmRIqGfxH4DlbOtx7wQkmAk4Z9+J1BmQz88TZ603h5r95CnF2l2Jg+U+vKV4H4iEg==
X-Received: by 2002:a5d:64c8:0:b0:3a4:e740:cd6e with SMTP id ffacd0b85a97d-3b37b7687c6mr698382f8f.8.1751551457041;
        Thu, 03 Jul 2025 07:04:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:b41:c160:61e4:bb55:bb2c:ae50? ([2a01:e0a:b41:c160:61e4:bb55:bb2c:ae50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a99c07fcsm27185885e9.35.2025.07.03.07.04.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 07:04:14 -0700 (PDT)
Message-ID: <1e896215-5f3a-40f9-9ab5-121109c48b3c@6wind.com>
Date: Thu, 3 Jul 2025 16:04:14 +0200
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
To: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, David Ahern <dsahern@kernel.org>,
 netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250702074619.139031-1-g.goller@proxmox.com>
 <c39c99a7-73c2-4fc6-a1f2-bc18c0b6301f@6wind.com>
 <jsfa7qvqpspyau47xrqz5gxpzdxfyeyszbhcyuwx7ermzjahaf@jrznbsy3f722>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <jsfa7qvqpspyau47xrqz5gxpzdxfyeyszbhcyuwx7ermzjahaf@jrznbsy3f722>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 03/07/2025 à 13:04, Gabriel Goller a écrit :
[snip]
>>> +    // get extra params from table
>> /* */ for comment
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/
>> Documentation/process/coding-style.rst#n598
> 
> NAK
> (https://lore.kernel.org/lkml/
> CA+55aFyQYJerovMsSoSKS7PessZBr4vNp-3QUUwhqk4A4_jcbg@mail.gmail.com/#r)

I will follow the netdev maintainers' guidelines.

If the doc I pointed to is wrong, please update it. It will be easier to find
than a 9-year-old email.


Regards,
Nicolas
