Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E57628B3F8
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 08:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751875490; cv=none; b=uWCgO0r3L8servgq3WoXA255i3mSL2L+DIU8Tcc2gwogYc1KpnXQi9ncT3EVMIVMDWIxOMhZWq1c58Pb38A1Gf8ZSpCFDSUquVllPkLwilWbpSICQ35w+oXrx9Qgw7FeAN1w6EfF+BKs8hdYicuiXH+RoQWa8sQQvAp3YTAdRxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751875490; c=relaxed/simple;
	bh=nTFJSzbbROWzyo5kgm8Hd3hIMs4eWDghq7sS+14cmwM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QoUWMkgPQo6L1PQgbqEOiDKWltJUXB1ZVNvHrsEjgWNxuwnzOnrZL+dbbx+bGESI9bJ7ATZm6wtkv0mVzDbfR8UM/0nGZvvehsPrzWrotzr1OxZ2sTZQ+4BcjioSjSaCHQafhxzPKADnUNI9tPDavdAHtZoK/LmOM0Yc1VuJ8q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pFOq653q; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pFOq653q"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-606b58241c9so4385029a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 01:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751875487; x=1752480287; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Maqeixhx8tCRu/qNXgeBlZFgwYBHcvoW9ex8fuhhhzc=;
        b=pFOq653qEcSAFlO0K3HuX0qBlrLSvpeTtK4VGrrhlWxWRF6dY+6X5bx5qrLcDnsDi4
         8Q3BXrMWnSRVffM+hGFfdP8E5yUAc/kzQdabyTb0wPTsET3MZUb3def+/9/u/xco+lC7
         snPzllKerJLMwZIEKS80jQbbCOge9rJVXJq9pJwSbcp6q1occpXg0xES0yN+BO+10+ay
         bbuf6n+i1dkslVcxhbySdSKoWo2m3xsSiPr4BJX1o71FYGMkwIDKVr0cXNwna4KvPN3M
         qtArPvkwepcylTQMGnXbaBjcgcSgq22I4mEkXl+NgZpAMAFY6dvgnwa2dFDJBoYvs32/
         H8Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751875487; x=1752480287;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Maqeixhx8tCRu/qNXgeBlZFgwYBHcvoW9ex8fuhhhzc=;
        b=rOVJHISSsNDApt278b/R1Eb7qb54TjA1y3CU4YaoHNvXvACH4Nex5rLgyNkryuLUWl
         c4pwWFUKLTwV7++78ygeuAnlEUdI1hkgfLTqmz9XX6s3gcbuNOiqRK5agDEKXRMrsUKY
         fHqfLvucVPBe1unQbKu+j+fxtb1GdeviJ1boMy5wD5BfqBWgluHjr4xOdS8vVaDqEUUw
         wpb/9VpbTDHVUpkMfLJpSHdvSqAdIvq2fDJa56WP1Lo9a4ZQJa4bcQqI1vPOB7NVvIik
         IfN2W2nz2zw3Hdpzs2eG7K2KckEUG0sy1Xl/RuSRVpMfY/uEO3Rf/6ewdguYSAr5l7f9
         rnog==
X-Forwarded-Encrypted: i=1; AJvYcCWMdwJ67hJfkTl0LSzd14/Uk3elfzhVOu2UL8d6bqXBD4YuYQgyiWzuSHDQkMHmRz1PBMZsynMS+nLOLmE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWEIMXa1FBszVQb+ugOg89jRNnI1Yhec36lmIkVA9wfKpE09D5
	qfw3BAeEDilGq7Pm54P7GInVp9GNoFzhzUTo33eM9d9ahOkmWYY+pcuhFgeDvorYCfs=
X-Gm-Gg: ASbGncvyRo5JgBUHIheNT9MBxvODpd4lg/JJTW4d/UMvRhy7i94TMCsUwHkpH7Ukxtp
	JneWS6LA3Mc1NR9cIRWJLUdOM0hJiDB002PPrcXYyRYRDnFV+TBVu+u/lPJZbkEfNvdBP0D8TiG
	Hao6EpuT8YphAdkfBtGf00HhJZTnPnfttPJ9WZYJi+3/bACVmKjcvzDabujeNR2aJ7lAb4YF34M
	H/1NwIZF0Vxp9qGzrwCYGo/zXMRMt1g42LUaSyACLH7eXVhzCkGHhhNs7IpisixYvaQoyW/15ph
	I8+zi0gLInwE+szMFbWe58vmLc/mjURJB3H2TtJQOjNlnV+S663e2m6pw82DERK9G99aN9xP
X-Google-Smtp-Source: AGHT+IEUHlKtB5liBRzk5NcA+a96n/Q6PDwDBiGP9XZgLxdzbFnIA9c2YL6FQEYngtI56lxutNE19A==
X-Received: by 2002:a05:6402:26cb:b0:60e:e4b:b8e1 with SMTP id 4fb4d7f45d1cf-60fd6e75d9bmr10177572a12.34.1751875487242;
        Mon, 07 Jul 2025 01:04:47 -0700 (PDT)
Received: from [192.168.0.251] ([188.27.86.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fc81a70e4sm5076483a12.0.2025.07.07.01.04.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 01:04:46 -0700 (PDT)
Message-ID: <8513b123-0330-4f49-b811-834ae929cd38@linaro.org>
Date: Mon, 7 Jul 2025 09:04:45 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mailbox: stop the release and reacquire of the chan lock
To: Peng Fan <peng.fan@oss.nxp.com>, Jassi Brar <jassisinghbrar@gmail.com>
Cc: peter.griffin@linaro.org, andre.draszik@linaro.org,
 willmcvicker@google.com, cristian.marussi@arm.com, sudeep.holla@arm.com,
 kernel-team@android.com, arm-scmi@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250606-mbox-drop-reacquire-lock-v1-1-d36d1a13d83f@linaro.org>
 <CABb+yY2HYgS25xouVJpq+Aia1M=b1_ocbHiyrnVqZcf0c0xcGg@mail.gmail.com>
 <fac9a5fb-7a39-4c12-9dca-d2338b6dad8c@linaro.org>
 <CABb+yY1pn3+dFd=e80PaqEP2saF84f3buPt=ZYnTjDbSv3RN6g@mail.gmail.com>
 <20250707044219.GA11488@nxa18884-linux>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250707044219.GA11488@nxa18884-linux>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/7/25 5:42 AM, Peng Fan wrote:
> Hi Jassi, Tudor

hiya. Thanks for chiming in.

> On Sat, Jul 05, 2025 at 09:19:08PM -0500, Jassi Brar wrote:
>> On Fri, Jul 4, 2025 at 7:30???AM Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>>>
>>> Hi, Jassi,
>>>
>>> Sorry for the delay, I was out for a while.
>>>
>>> On 6/23/25 12:41 AM, Jassi Brar wrote:
>>>> On Fri, Jun 6, 2025 at 8:41???AM Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>>>>>
>>>>> There are two cases where the chan lock is released and reacquired
>>>>> were it shouldn't really be:
>>>>>
>>>>> 1/ released at the end of add_to_rbuf() and reacquired at the beginning
>>>>> of msg_submit(). After the lock is released at the end of add_to_rbuf(),
>>>>> if the mailbox core is under heavy load, the mailbox software queue may
>>>>> fill up without any of the threads getting the chance to drain the
>>>>> software queue.
>>>>>         T#0 acquires chan lock, fills rbuf, releases the lock, then
>>>>>         T#1 acquires chan lock, fills rbuf, releases the lock, then
>>>>>         ...
>>>>>         T#MBOX_TX_QUEUE_LEN returns -ENOBUFS;
>>>>> We shall drain the software queue as fast as we can, while still holding
>>>>> the channel lock.
>>>>>
>>>> I don't see any issue to fix to begin with.
>>>> T#0 does drain the queue by moving on to submit the message after
>>>> adding it to the rbuf.
>>>
>>> The problem is that the code releases the chan->lock after adding the
>>> message to rbuf and then reacquires it on submit. A thread can be
>>> preempted after add_to_rbuf(), without getting the chance to get to
>>> msg_submit().
>>>
>>> Let's assume that
>>> T#0 adds to rbuf and gets preempted by T#1
>>> T#1 adds to rbuf and gets preempted by T#2
>>> ...
>>> T#n-1 adds to rbuf and gets preempted by T#n
>>>
>>> We fill the mailbox software queue without any thread getting to
>>> msg_submit().
> 
> I try to understand this case. Is this patch from code inspection or
> the issue could be reproduced on real platform?

code inspection. ACPM, the mailbox client that I'm using, does not yet
have enough clients to hit this.

> 
> If the client continuously issues 'mbox_send_message',
> there might be possibility that 'msg_submit' does not have chance to get
> get chan lock.

right. That's why I proposed to drain the FIFO before new requests are
introduced. This is a common practice when dealing with queues.

"Draining a FIFO" means ensuring that all existing data or requests
currently stored within the FIFO are processed, transmitted, or consumed
before new data or requests are introduced.

> 
>>>
>> I get that but I still don't see a problem.
>> When the queue gets filled the next submission will be rejected and
>> have to wait until the mailbox gets some work done. Which is the

yes, but it's not optimal.

>> expected behaviour. And will be the same even if we don't release the
>> lock between add_to_rbug and and msg_submit and there are enough
>> mbox_send_message calls coming in faster than the transmission bus.

I agree, but you're exposing a different scenario.

My scenario was that on high client requests the code may fill the queue
without any of the requests getting the chance to be consumed. Nothing
gets to the transmission bus.

If we don't release the lock between add_to_rbuf and and msg_submit we
make sure that all the requests in the FIFO are transmitted to the
mailbox controller, thus we allow the controller to consume the FIFO. We
shall fill the FIFO harder, as the controller consumes the requests faster.

> 
> Not sure I get it clear, do you mean this?
> When the mailbox queue is full, any new message submission will be rejected.
> The sender must wait until space becomes available as messages are processed.
> 
> This is the expected behavior and ensures proper flow control. Even if we
> avoid releasing the lock between add_to_rbuf() and msg_submit(), the outcome
> remains the same: if mbox_send_message() calls arrive faster than the bus can
> transmit, the queue will eventually fill up and block further submissions.

I guess I explained above the differences.

Cheers,
ta
