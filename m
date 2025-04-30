Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42304347C7
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 21:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746047472; cv=none; b=KKkdJ5wNrb5PsSgf5A3M9vpb5IekDEpLMGZ3aHr3zCsPfl5+MJywHRNBZXW4i3xhoXOqLgwv95LnlFQPtE4NxQguvlQDWQFzrgwpqSr7gZo/JNTkfTd/m0W0XVO9YPExttmATr7M2KR0ABau+SXQsIZVsyRcxDHFGQXqm3whuTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746047472; c=relaxed/simple;
	bh=VhIayVP3mCIh7LvgVqLj1wEd0bGGLSeCkZx61RkOg3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jB4fq9rO3FMVU0tRwP61ynSg5PsqswAJ4euFnkORLNxPd0xMiy/U3uN2/VykpDoThHZPRbMtXvePC+vCW2BWgI0xrKWZeAYNsBodLfss0swYOS9UU1T+2/aas6qQkbPfNG3dCReuTdKNQPq4n7ziRatK64T+/5ysH22iFxtH01U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OlBVwyyj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OlBVwyyj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746047469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Wa06aXs1SXZcO4J3OJQX941rqQmbMWZJsDbAWyX8zGE=;
	b=OlBVwyyjr5taHFTJW4ZEzKB4CdxzqdS/RlYpHoEUUnNgiLQ1i3Eu5Zd9lHQrkhwIERxlQs
	LnRODfnLgqZV43pOtIpGC0WTCjNmhL5RmqOy+hbyB/BW5FX3lfImVV+bjxZ8hAm8MBELv9
	0wDW1p/5IKUkAVVDaP0WO7YMsbB5msg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-w7DnuGe_OTeByARLL4Cq5g-1; Wed, 30 Apr 2025 17:06:55 -0400
X-MC-Unique: w7DnuGe_OTeByARLL4Cq5g-1
X-Mimecast-MFC-AGG-ID: w7DnuGe_OTeByARLL4Cq5g_1746047214
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-39130f02631so66269f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 14:06:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746047214; x=1746652014;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Wa06aXs1SXZcO4J3OJQX941rqQmbMWZJsDbAWyX8zGE=;
        b=ATHxjRHrKGrBPi3BUXVKWWm5Q7fLuh0hzysLX8B790y+g+KxJhamEjJpK6T2qRuFnJ
         u9xpIHlYA+7xGJz7ZWVm71ekQl6L74pewiSyOjXkTkO37hkgjZ0QsitMppz6ijJX3ide
         5qKLIvO0OK45RxswXrOt9ZKIN+pcKujoA7EWMSBRf0MEAKEnYN3AN4DTDG67TKskjGVh
         in6xZjCiJrA4BvS9+/HHED2WiY0zz6ulrtRYfhC0oBaB3RDOM0D3AJUES7g1vVafuMHk
         c4K/XaPSkzGsZ3ClvWPKWNZm0Hhwa71qhc+YU6cc9bCxNrhSLjhPcwQvNLWC8Rldum/7
         YFxg==
X-Forwarded-Encrypted: i=1; AJvYcCUWAITNSEnuMiEHSJ0tkxkS1XmJ1PYF61L4IRf6Y2qZVO1vWNdd5UQLsA+cig3rsrWov0h/bQNMn1rLbjU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZYsm3kkBvfjvtBpM47yv+vwbXw53KHUjivl0lx5HaX2uTDzAw
	IquU7wYDR7MRC+OOOHJ7hqa7CVumAfPTOXD5+kUBO6I5H90jSZGUJIXwzKwCHPBQj/6TeGYHSK8
	fuXE2XfAGgoARNnNsTh1UwDu4fkwHMPyLP9NWwgRaCDLxweHsms04rgX85xHknw==
X-Gm-Gg: ASbGncuv90xuFA0G1qzpQ7r2XwRa483rSiFD/2fNXP1on5NWTLdWuG1QCXdfxHmOHOa
	XvPulaFaDFK5DvWmhtMSCWhX6mnApmLmwqxc1nK3D0MFk56889uJcCvholvSSAm3nusFs8/zVdi
	hZhWTLa/aq1ziGc3DcgtuCy6X0obin/jAOdZdZiJg0Ja1+cp3Xn3Xk/Y+QNZoQtU3JLxQsN6ipZ
	Vyy7g91kRwZMf5ocUu1Oi4JpEUIl/hFAAOKFlof8kCI1O0uDQTBYzUO/HeqZvsIou5I7p4k5qjx
	LTsoepFRsVCqa0nHauAC7U58V542t6GK/aEPGnSlYi4+GQwlXgiFC0uKoHITig+3/JDTr81gss6
	NBgyyFpQ5DRet1L/qBob6acfvWpu5ITZga/Zjb6Y=
X-Received: by 2002:a5d:584f:0:b0:3a0:7a7c:235f with SMTP id ffacd0b85a97d-3a08f7c984fmr4718908f8f.40.1746047214042;
        Wed, 30 Apr 2025 14:06:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaRXX9etuJVkVeKdOuakQfjqv8dWdE/LkCKEV2pPJTxXvOqBTRL9kN3ETfDErFnieoCN+cnw==
X-Received: by 2002:a5d:584f:0:b0:3a0:7a7c:235f with SMTP id ffacd0b85a97d-3a08f7c984fmr4718899f8f.40.1746047213771;
        Wed, 30 Apr 2025 14:06:53 -0700 (PDT)
Received: from ?IPV6:2003:cb:c745:a500:7f54:d66b:cf40:8ee9? (p200300cbc745a5007f54d66bcf408ee9.dip0.t-ipconnect.de. [2003:cb:c745:a500:7f54:d66b:cf40:8ee9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e47307sm18128951f8f.65.2025.04.30.14.06.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 14:06:53 -0700 (PDT)
Message-ID: <9b9d525a-b145-43c5-827f-bced335ca95b@redhat.com>
Date: Wed, 30 Apr 2025 23:06:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] mm: kmemleak: small cleanup
To: Luiz Capitulino <luizcap@redhat.com>, catalin.marinas@arm.com
Cc: lcapitulino@gmail.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <cover.1746046744.git.luizcap@redhat.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <cover.1746046744.git.luizcap@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.04.25 22:59, Luiz Capitulino wrote:
> Hi,
> 
> This is a trivial mm/kmemleak.c cleanup. I found these while reading through
> the code.
> 
> Luiz Capitulino (3):
>    mm: kmemleak: drop kmemleak_warning variable
>    mm: kmemleak: drop wrong comment
>    mm: kmemleak: mark variables as __read_mostly
> 
>   mm/kmemleak.c | 9 ++-------
>   1 file changed, 2 insertions(+), 7 deletions(-)
> 

For the series

Acked-by: David Hildenbrand <david@redhat.com>

Thanks Luiz!

-- 
Cheers,

David / dhildenb

