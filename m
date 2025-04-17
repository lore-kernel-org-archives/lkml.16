Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AA32F24
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 13:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744895840; cv=none; b=kYf1ibjA9GpylKbBQzqBU9mB4B82EQEtd3buXN1Jb3TQcm2qooY2OQFCjVtUfwsQWmU81E2T4tBw1QVM7ueiqL9D+olc4rbzb5YA7NeoJjqd4KWwwB+szRpamS+sYdeYiLA3ryda4FCuIDYo0xqGKUlWAPN57g4h4S85y2zNEGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744895840; c=relaxed/simple;
	bh=w1gNiTdtro19oJd8N1VuhyxJwViS9e9fOs1UAKkND3w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p0yTjV26eR6feAItARjuk2IPbxuTHwRiQn975QMV23EuVc9Bbt1QEUAg25euho+2zlv5BhHKfdqF9emQ3cgl4nkmPro2VywW+lDEEc3OobH41X9fDug8sV9E+gLR8ngIVEKGuLpVQE8a//2Hv5yIY6xeVE6kN0DP8pfqSdJcjoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dYapBYM7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dYapBYM7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744895835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zhyHByvuNmnkzLLWMwyPda0e7IshL4F1qmQONxtFvxA=;
	b=dYapBYM7MkkBOICjjLk+/sC1NA90l1LXZl+P0FwAHWcY4xmygHI5xw111fJTXxka4QjjnH
	FeClbplEke+b1Aap1oUP6HDy4GMgYKc9P9YMYw2x920RHT/cnPGAMAgVb6kpKELb4HtSPs
	iQrBSPwfJ53Nz83EZ31uJLLT0ylXvUE=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-80-nQeRKg42MuqtvS4s0bhR4A-1; Thu, 17 Apr 2025 09:17:10 -0400
X-MC-Unique: nQeRKg42MuqtvS4s0bhR4A-1
X-Mimecast-MFC-AGG-ID: nQeRKg42MuqtvS4s0bhR4A_1744895830
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-476664bffbeso13144571cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 06:17:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744895830; x=1745500630;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zhyHByvuNmnkzLLWMwyPda0e7IshL4F1qmQONxtFvxA=;
        b=bmQ+x6WC//Gac47Kt0NAm2uDbe4NABb2q1VlvTv/+4gYM1XmJtnhANfKZW/OFkPCOV
         HY3QVgQDVgD4guCTPC4R4bfkQGiwuV5tvv+AfdMmAAVSR/uJsMBEskTjt1/RxbQKEzkD
         O2KKQeVB+XqxWmhQaMrwjlOd0SsrqwWU23DLJXMLLgSdH+ZABXreMeaZ2evID7jbjXBI
         P9bBwUXQ+Et3U5X1Q0aTVKg8+PMPjMwFILMjiC1nlR4tYKnsiN7Ddr+s7CpOXGCfzHOA
         Zer8H8E+oRL4GEW68BVZrcE2v3iclJ0QSVj4k7ddio0v3a3TBxi0imgIs2j2d7B+s6nI
         l3Ow==
X-Forwarded-Encrypted: i=1; AJvYcCXav+pw2i1gQAEBNn6vyXM/q1uTKWUyJafKXUqG+vKkUy5nYuQgXm/O547kV5FjOL0KnI56r2wifvrZs8U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwR7QC7O2dqcFXr2wQAiNa1ciImtXiOJAoHHZ6G3Ko7hp89LZLZ
	iTU9W6PiyuyJZgc+6760uqXZBYfbPaXntNMr8rihw56zaY05GOY8kV+tIn1MQjPG6r1AlpkYIBX
	iqSDDEJnVwAvmEt+kyfwrRcUO4P/4Q+X9/IFFEJwyBwmHvbvx2fnZcts94qdHNw==
X-Gm-Gg: ASbGnctfblMR5RU7SqKccah61X/fnCIDtPuCjvgu4OIXrWvFkN09lGe+T/RttGAWSuI
	PsT62im6MLqtsMT9J4wj9YRwbw9MoMJVl1Dj1V7SJ3gTaMVBLBAINeqL8sQ28seNo+FI9iU6cjf
	0orwcEAHhx6Nz7IjMS4rR1WLCQMXey8TWkf/cpuHJ9JJHFiugpdJjw5qixHn9yyLLY2dX7Dc/UC
	n+pzRvhiH7XzJ+wn9lm26nPaKnZKkL7q8bb6UqDFT/KnjCOxzrWGxQGc610e5tIVHT56azDapkI
	Gu/WCjb+LwQ8CDSEIVfOCE3W9LT8gKzbY01+fBzNfg==
X-Received: by 2002:a05:6214:238b:b0:6e8:efd0:2dad with SMTP id 6a1803df08f44-6f2b2f4290amr78455786d6.12.1744895829916;
        Thu, 17 Apr 2025 06:17:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAmv1LbYEq+ryV1sjdA7s1b6xi/JjBxP7J1Dpv+giy9IaehE8vpbhOIDRrQSohSJsu2RT5dQ==
X-Received: by 2002:a05:6214:238b:b0:6e8:efd0:2dad with SMTP id 6a1803df08f44-6f2b2f4290amr78455536d6.12.1744895829629;
        Thu, 17 Apr 2025 06:17:09 -0700 (PDT)
Received: from [192.168.88.253] (146-241-55-253.dyn.eolo.it. [146.241.55.253])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f0de973221sm126961266d6.42.2025.04.17.06.17.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 06:17:09 -0700 (PDT)
Message-ID: <0f67e414-d39a-4b71-9c9e-7dc027cc4ac3@redhat.com>
Date: Thu, 17 Apr 2025 15:17:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] udp: Add tracepoint for udp_sendmsg()
To: Breno Leitao <leitao@debian.org>
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 "David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, kuniyu@amazon.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 yonghong.song@linux.dev, song@kernel.org, kernel-team@meta.com
References: <20250416-udp_sendmsg-v1-1-1a886b8733c2@debian.org>
 <67a977bc-a4b9-4c8b-bf2f-9e9e6bb0811e@redhat.com>
 <aADnW6G4X2GScQIF@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <aADnW6G4X2GScQIF@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/17/25 1:34 PM, Breno Leitao wrote:
> On Thu, Apr 17, 2025 at 08:57:24AM +0200, Paolo Abeni wrote:
>> On 4/16/25 9:23 PM, Breno Leitao wrote:
>>> Add a lightweight tracepoint to monitor UDP send message operations,
>>> similar to the recently introduced tcp_sendmsg_locked() trace event in
>>> commit 0f08335ade712 ("trace: tcp: Add tracepoint for
>>> tcp_sendmsg_locked()")
>>
>> Why is it needed? what would add on top of a plain perf probe, which
>> will be always available for such function with such argument, as the
>> function can't be inlined?
> 
> Why this function can't be inlined? 

Because the kernel need to be able find a pointer to it:

	.sendmsg		= udp_sendmsg,

I'll be really curious to learn how the compiler could inline that.

/P

