Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26607219302
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 08:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750321366; cv=none; b=t/wRWh85lt3q2SEX8PX3YwK15TXl3IKv83CAWYVaRQ14F0BF8upq7j2GK0abAykxCvvGMCPXETGg6DLe9eXoaZ1GgVBRAaPmQn5y3WaaeBlTzmmhuX8ZXuzY5TvPe2Ob/H+Q+nx3nCbVEsNykR7hId1osDVw/fAMQ2pSLg5dR10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750321366; c=relaxed/simple;
	bh=QQPn5brLXeGgRXdgdwN3CLvotufHT9a51CMFYMcHLBM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VlTm/2We5SjYuVr3Xzp6/qfNnCP7yIakLV5wEGkMMdi70M/HRUDvrxcmTWhV1UnLm6tUI9Dg9Fk2+Fplio7CQv3OTNVJhWMlRj0tBxiAAvvsQfAa6LvjZZEvjAaFyu3zksntbFKiHLeUZNPMXnXEL+Sys8xDFcxpRzqEk2Hb0hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ba4iNrqt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ba4iNrqt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750321363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3u5UrbIFcsT6z27Fr6GpbRCpPwg+7g2ZbmuUBpBpiQY=;
	b=ba4iNrqtzCFmnibfgrgplgxoMbfXeNRfsgu/f2ofSMz2hWyO5cOYh06FGjWilNhZgnaWqv
	H8bCPwZSJNOIbzvUxKMBMbOPyIgYK4eUl/CIqIgr+femdh3jh+w/NxI9wo/2YcBjYkH0+y
	utqjYQTw3xQ/ghA6mtHUMnZJ4b4raa0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-kZFvpBW-NCuuWUftodP76g-1; Thu, 19 Jun 2025 04:22:42 -0400
X-MC-Unique: kZFvpBW-NCuuWUftodP76g-1
X-Mimecast-MFC-AGG-ID: kZFvpBW-NCuuWUftodP76g_1750321361
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a52bfda108so268007f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 01:22:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750321361; x=1750926161;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3u5UrbIFcsT6z27Fr6GpbRCpPwg+7g2ZbmuUBpBpiQY=;
        b=EPJOb6v3gATMnQSR7SfYcy+U1kQLdnWMw59QrFadgBrMuTM2JBDD5pZw2D0UBXeGQT
         eay7MeJDzl2FUM5GgLUifhhNm6V7owyOL/tSIBk2IAdJQe3rFZtFzz1ACmAJHI3BVebF
         m/TzcNyl7I0HSQOYrNdQcf6JnL5562+/K4Q6GzZAHSoJQWwBEYBBBsyx6BqgTTdLpuf9
         rc0/m3Y0Fsb8i+whOVmHnKglxPG7gMWb5DWRkizu7GE0y1YHCZLHwSOuV8t1yrfHH2Eg
         IG2FjyrBKSn8Kmpzr0aY3z4aXAZs204xHOycWVjWbbtWPZzVPEmgOoIf98HF/2uDct4C
         xCHA==
X-Forwarded-Encrypted: i=1; AJvYcCUv+UT0Kjl7Z0sOkS03cJsl3PAfb/mS4lZuychjO7rft/vsAe83YN3UZYkOVvOS+9aZejrkv84namB3qUE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyuf1Etp9I7mOYwOTPXiMBxLOQkAH6ezAfEwPFpAvay59wywXpj
	OPGJQcJuMhbjQKo9pshT7vC84+JGP9ErSCMLCrB5HRNox7wi8U2gnjtEHx4BhAL8/uXAC48bnkY
	riCIi7wcExYQSx8J2LjZDlilpIoE9EavKSczS/3Kolpv74VisDO+/nGSJ1GiUpK15HA==
X-Gm-Gg: ASbGncu3jt6Xe/bcq676Hp4lGoMNWrvg7re0aBtpP/jS+iZ2u+ZEuAhxX3u/A9F4fIs
	bVZSM/Z5GecJRa9vMsomIRwfKKZYBZD64jDEkqMESH//lg/jKR17ET5tyRwJaHz4kx0lWHrdd0d
	pEAhieEI1r10ezqpcvkSikS/UCfW8KrOP5wxen/a1bMLiSjn5ZIncb1Z/Hrp1PdF/yDX3VUdz4H
	Uh8KuuLI2wi8/JOeg4TZTRQP7p99dWL3aBKNJKyYlle+gdidxNe/84lKykk9TCibAnlU3sV486Q
	9UIxy1RwpqWVkZOWJ5EF1i3mZqX+u6zAV33LMCyyv6stksHKCXQj5c2xW/Hddvow4hYdUA==
X-Received: by 2002:a05:6000:290c:b0:3a1:fcd9:f2ff with SMTP id ffacd0b85a97d-3a572367b8cmr15459215f8f.12.1750321360968;
        Thu, 19 Jun 2025 01:22:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsOdd0l9YaAvmzLQkt7CerKsMYQhEqusgDN65H96bS9PmclWT9LmYHKBzNBEHcDUr17wFnYQ==
X-Received: by 2002:a05:6000:290c:b0:3a1:fcd9:f2ff with SMTP id ffacd0b85a97d-3a572367b8cmr15459191f8f.12.1750321360551;
        Thu, 19 Jun 2025 01:22:40 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:271a:7310:d5d8:c311:8743:3e10? ([2a0d:3344:271a:7310:d5d8:c311:8743:3e10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a7f8f9sm18758020f8f.42.2025.06.19.01.22.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 01:22:38 -0700 (PDT)
Message-ID: <10fe50a5-2829-40a2-8741-c67c33898fa6@redhat.com>
Date: Thu, 19 Jun 2025 10:22:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 1/2] tcp_metrics: set maximum cwnd from the dst entry
To: Petr Tesarik <ptesarik@suse.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Neal Cardwell <ncardwell@google.com>,
 Kuniyuki Iwashima <kuniyu@google.com>,
 "open list:NETWORKING [TCP]" <netdev@vger.kernel.org>,
 David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250613102012.724405-1-ptesarik@suse.com>
 <20250613102012.724405-2-ptesarik@suse.com>
 <da990565-b8ec-4d34-9739-cf13a2a7d2b3@redhat.com>
 <20250617133935.60f621db@mordecai.tesarici.cz>
 <20250618190124.04b7a2c3@mordecai.tesarici.cz>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250618190124.04b7a2c3@mordecai.tesarici.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/18/25 7:01 PM, Petr Tesarik wrote:
> On Tue, 17 Jun 2025 13:39:35 +0200 Petr Tesarik <ptesarik@suse.com> wrote:
>> On Tue, 17 Jun 2025 13:00:53 +0200 Paolo Abeni <pabeni@redhat.com> wrote:
>>> On 6/13/25 12:20 PM, Petr Tesarik wrote:  
>>>> diff --git a/net/ipv4/tcp_metrics.c b/net/ipv4/tcp_metrics.c
>>>> index 4251670e328c8..dd8f3457bd72e 100644
>>>> --- a/net/ipv4/tcp_metrics.c
>>>> +++ b/net/ipv4/tcp_metrics.c
>>>> @@ -477,6 +477,9 @@ void tcp_init_metrics(struct sock *sk)
>>>>  	if (!dst)
>>>>  		goto reset;
>>>>  
>>>> +	if (dst_metric_locked(dst, RTAX_CWND))
>>>> +		tp->snd_cwnd_clamp = dst_metric(dst, RTAX_CWND);
>>>> +
>>>>  	rcu_read_lock();
>>>>  	tm = tcp_get_metrics(sk, dst, false);
>>>>  	if (!tm) {
>>>> @@ -484,9 +487,6 @@ void tcp_init_metrics(struct sock *sk)
>>>>  		goto reset;
>>>>  	}
>>>>  
>>>> -	if (tcp_metric_locked(tm, TCP_METRIC_CWND))
>>>> -		tp->snd_cwnd_clamp = tcp_metric_get(tm, TCP_METRIC_CWND);
>>>> -
>>>>  	val = READ_ONCE(net->ipv4.sysctl_tcp_no_ssthresh_metrics_save) ?
>>>>  	      0 : tcp_metric_get(tm, TCP_METRIC_SSTHRESH);
>>>>  	if (val) {    
>>>
>>> It's unclear to me why you drop the tcp_metric_get() here. It looks like
>>> the above will cause a functional regression, with unlocked cached
>>> metrics no longer taking effects?  
>>
>> Unlocked cached TCP_METRIC_CWND has never taken effects. As you can
>> see, tcp_metric_get() was executed only if the metric was locked. 

Uhm... the locking propagation from dst to tcp storage was not so
straight forward to me, I missed it. Please be a little more verbose
about this part in the commit message.

Thanks,

Paolo

