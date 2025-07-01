Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D1E25C6EC
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 10:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751366080; cv=none; b=PeqI8qFlaD2llNCSS3GrYacCDVxdWmxQ/OKl6gE+69/0ZHgyqPlLI4egdfrL1uoGfWK2Eckh4oZerZPvcZAv+sV4DkMz8THs/IKCQlWJzReDECf8gnDCNlaRHxwFr8cMVT6XqODJJinZcexW/ECJWXG8YsI/tJpOrr8zy+zGg6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751366080; c=relaxed/simple;
	bh=Mb60PZKCxPrLuQXD+nGMXcS0bI1nvcxKixTXpIJ6UOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pgLdW4Hk0rE8W3O0IusZVUZ+g0AQMw2dp8w3GPinNgaCW0Bv6XC+lPkDLSODeGKqqxLLMgpKnq9NHJHPYWTWn+R9EVexLzOP9IgLlIXixKgquEBRKElhXWrw9ZGjTv5G+bsUYe74hMJDi7r41iRauGVajyMxFk4deAOMzwiW1LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bywyXmmP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bywyXmmP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751366078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UpDQ5tS+XCWfCgRZS/6IKZjsLJANA+xHzrICS0TndYM=;
	b=bywyXmmPGd8Jf/bYt0iPnYnVXau8opLr4ddAWQCCeh/SMpHESF2PiQmb7Mz25J6i5g8qX1
	4ehbvZTflV3O1Ht3wjPaZRjyAwlivqfh+gJCZCcy1Kl5KkNt0Frj5YZNvwP5QY/lf1QSfj
	mLtU70HsrjJCsb2MmADunIhMFol//nQ=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-351-8vSxWjDKNkisWtHI576LfQ-1; Tue, 01 Jul 2025 06:34:37 -0400
X-MC-Unique: 8vSxWjDKNkisWtHI576LfQ-1
X-Mimecast-MFC-AGG-ID: 8vSxWjDKNkisWtHI576LfQ_1751366076
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-61175565df8so2340131eaf.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 03:34:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751366076; x=1751970876;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UpDQ5tS+XCWfCgRZS/6IKZjsLJANA+xHzrICS0TndYM=;
        b=ioal352E8VA+cG9xwRy4t2Q750WfznwHQNgX0EaOABjU2tlL0dYfyGm+qtEITCrhyr
         mp0+ELQWXK7n8UYXNo5hrENLs0hJpaWGhILi9Eet+V5KOEW8B8N5wyJQPtfcOplSDBz8
         nrk46XO2Wu2cnv9hcbucF/JQrBX+y5oF2EZl6wxSDfS5H6efK0V+AhMQUvSkWk7M1pav
         ZtOS3El8MnKgEjrMLg14uzhlaw3eO1BdndnX1o9PHn2xN0izaas7ZvsRv/cBqwOyWa5o
         8yYZ08JwxWh/q3jGt3Mqa7aDQvwuB03GcZ5Ila0UwCjzA9ee7KzwDi8fBrxzv1HlVl2S
         Zy5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXLQ55P7y/FmkPUDxovbq1fRWp5AJ3zUw62STRWn+J3EC8JGUV5+P2aviyJafF4aQ6gUb4ui9wsSQsjcNo=@vger.kernel.org
X-Gm-Message-State: AOJu0YysjfGptfCCaBTxBUd3hqHfPS4y4AhXhX3tR4YWy2Qp2nb4TR40
	9uKcwdqW2ePN5cTxvado+MSe3CZBEqhjcXRD96A90OiYOnuGZ9BERMf/NjRpADVzQ3cFRYVJOPT
	sNd3SZgmPpQFhjB+6chhcr3i7M/o97jaw2FORluVKbJS2InG17dIZCPtsAYijV07WSM4w8awKFQ
	==
X-Gm-Gg: ASbGncseBSnXK6JQuBmvJq6yatrRv80oxGr1gvZ2aVqDn7P8FnscPujgnPDmZGw4gqR
	pS2TyoIeKHI2jJTGqFTBlTV9ma6Y8/Tc7vwOV+AJqvptV9ucJf02sI6Py4cbBQSNPGH1Hnrr+55
	USZ50ltan2DIRuf+rvdKDiBkBmYcE5Sr3xji84kWCZ5YOeEWbiEu5Wa1j0ry4KICQwcOqIC78ES
	Cf1iwB6f3Z6Xnq4UbWHFt9rdl4oEpMvnhP1JB1w9/BqBodo+Pq13bhssHc060zXr7nBxrXHSha3
	H+slJUSUTaRKlyvKAzzMr53/+XHq
X-Received: by 2002:a05:6820:994:b0:611:aabf:2b7d with SMTP id 006d021491bc7-611b91b8ba5mr12929321eaf.7.1751366075932;
        Tue, 01 Jul 2025 03:34:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvOyh3XEeOqocDMGLPkqu+zdtIY+/LP4pPv1rkoavjsw1qeTINbjxyfJNBqMBK5Rn7C+6dEQ==
X-Received: by 2002:a05:6820:994:b0:611:aabf:2b7d with SMTP id 006d021491bc7-611b91b8ba5mr12929286eaf.7.1751366075453;
        Tue, 01 Jul 2025 03:34:35 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.144.202])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-611b8474da2sm1366811eaf.6.2025.07.01.03.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 03:34:35 -0700 (PDT)
Date: Tue, 1 Jul 2025 12:34:23 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Michal Luczaj <mhal@rbox.co>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC net v2 1/3] vsock: Fix transport_{g2h,h2g} TOCTOU
Message-ID: <fruzxj3ju4nmm3uipuqq3gcn3jh5et4qpnldzsdahfdcachtyl@o3k7lo2gxzyb>
References: <20250620-vsock-transports-toctou-v2-0-02ebd20b1d03@rbox.co>
 <20250620-vsock-transports-toctou-v2-1-02ebd20b1d03@rbox.co>
 <zdiqu6pszqwb4y5o7oqzdovfvzkbrvc6ijuxoef2iloklahyoy@njsnvn7hfwye>
 <d8d4edb2-bf14-42b2-8592-79d7b014e1a7@rbox.co>
 <owafhdinyjdnol4zwpcdqsz26nfndawl53wnosdhhgmfz6t25n@2dualdqgpq3q>
 <e97b5cae-f6ef-4221-98e1-6efd7fdc6676@rbox.co>
 <4vsrtxs3uttx6w2zyk6rxescpwvrikypiw6tvjheplht6yzonc@ch6k3xlftikw>
 <c39f22fd-9ede-4cdd-956b-29856e9db20a@rbox.co>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <c39f22fd-9ede-4cdd-956b-29856e9db20a@rbox.co>

On Mon, Jun 30, 2025 at 01:02:26PM +0200, Michal Luczaj wrote:
>On 6/30/25 11:05, Stefano Garzarella wrote:
>> On Sun, Jun 29, 2025 at 11:26:12PM +0200, Michal Luczaj wrote:
>>> On 6/27/25 10:02, Stefano Garzarella wrote:
>>>> On Wed, Jun 25, 2025 at 11:23:30PM +0200, Michal Luczaj wrote:
>>>>> On 6/25/25 10:43, Stefano Garzarella wrote:
>>>>>> On Fri, Jun 20, 2025 at 09:52:43PM +0200, Michal Luczaj wrote:
>>>>>>> vsock_find_cid() and vsock_dev_do_ioctl() may race with module unload.
>>>>>>> transport_{g2h,h2g} may become NULL after the NULL check.
>>>>>>>
>>>>>>> Introduce vsock_transport_local_cid() to protect from a potential
>>>>>>> null-ptr-deref.
>>>>>>>
>>>>>>> KASAN: null-ptr-deref in range [0x0000000000000118-0x000000000000011f]
>>>>>>> RIP: 0010:vsock_find_cid+0x47/0x90
>>>>>>> Call Trace:
>>>>>>> __vsock_bind+0x4b2/0x720
>>>>>>> vsock_bind+0x90/0xe0
>>>>>>> __sys_bind+0x14d/0x1e0
>>>>>>> __x64_sys_bind+0x6e/0xc0
>>>>>>> do_syscall_64+0x92/0x1c0
>>>>>>> entry_SYSCALL_64_after_hwframe+0x4b/0x53
>>>>>>>
>>>>>>> KASAN: null-ptr-deref in range [0x0000000000000118-0x000000000000011f]
>>>>>>> RIP: 0010:vsock_dev_do_ioctl.isra.0+0x58/0xf0
>>>>>>> Call Trace:
>>>>>>> __x64_sys_ioctl+0x12d/0x190
>>>>>>> do_syscall_64+0x92/0x1c0
>>>>>>> entry_SYSCALL_64_after_hwframe+0x4b/0x53
>>>>>>>
>>>>>>> Fixes: c0cfa2d8a788 ("vsock: add multi-transports support")
>>>>>>> Suggested-by: Stefano Garzarella <sgarzare@redhat.com>
>>>>>>> Signed-off-by: Michal Luczaj <mhal@rbox.co>
>...
>>> Oh, and come to think of it, we don't really need that (easily contended?)
>>> mutex here. Same can be done with RCU. Which should speed up vsock_bind()
>>> -> __vsock_bind() -> vsock_find_cid(), right? This is what I mean, roughly:
>>>
>>> +static u32 vsock_registered_transport_cid(const struct vsock_transport
>>> __rcu **trans_ptr)
>>> +{
>>> +	const struct vsock_transport *transport;
>>> +	u32 cid = VMADDR_CID_ANY;
>>> +
>>> +	rcu_read_lock();
>>> +	transport = rcu_dereference(*trans_ptr);
>>> +	if (transport)
>>> +		cid = transport->get_local_cid();
>>> +	rcu_read_unlock();
>>> +
>>> +	return cid;
>>> +}
>>> ...
>>> @@ -2713,6 +2726,7 @@ void vsock_core_unregister(const struct
>>> vsock_transport *t)
>>> 		transport_local = NULL;
>>>
>>> 	mutex_unlock(&vsock_register_mutex);
>>> +	synchronize_rcu();
>>> }
>>>
>>> I've realized I'm throwing multiple unrelated ideas/questions, so let me
>>> summarise:
>>> 1. Hackish macro can be used to guard against calling
>>> vsock_registered_transport_cid() on a non-static variable.
>>> 2. We can comment the function to add some context and avoid confusion.
>>
>> I'd go with 2.
>
>All right, will do.
>
>>> 3. Instead of taking mutex in vsock_registered_transport_cid() we can use RCU.
>>
>> Since the vsock_bind() is not in the hot path, maybe a mutex is fine.
>> WDYT?
>
>I wrote a benchmark that attempts (and fails due to a non-existing CID) to
>bind() 100s of vsocks in multiple threads. `perf lock con` shows that this
>mutex is contended, and things are slowed down by 100+% compared with RCU
>approach. Which makes sense: every explicit vsock bind() across the whole
>system would need to acquire the mutex. And now we're also taking the same
>mutex in vsock_assign_transport(), i.e. during connect(). But maybe such
>stress testing is just unrealistic, I really don't know.
>

I still don't think it's a hot path to optimize, but I'm not totally 
against it. If you want to do it though, I would say do it in a separate 
patch.

Thanks,
Stefano

