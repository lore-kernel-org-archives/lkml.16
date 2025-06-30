Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085EE238C20
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 09:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751274370; cv=none; b=SKzPHwzUbjmilGJLbUrmHge3H/SHhB4m4oOglOB9LHTTOcb+jUtciBBS5/E+841vfy7kIkj4XPro62uOChSXXvuOSzFvznhgMX4uoCBljEFxisYjFpPOWxzOAgNjXRwIjLmDOn4hUbTaduPGvuts208Htkp/9CxC1xChhkmm7GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751274370; c=relaxed/simple;
	bh=wRPjo9rf+tUKuB78jhsyCXImccziciYaYS7TdDqiExs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aLyQQWBgFfZlzPJx0o4lghs4r8CrrujxtYs6ssbGwRArKodHfBBfZ36JPnrwku9icPyHFX1K6VeWeF8gyyqzeURMj5wUZ/nOj6nkrq6wyVTxVG+tj8BG9Ij654Fe2r3V/lWLq3To2KE+Hw3NeC2umqPnKJnXFFX/4brLXDOY/44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ps8VDkqM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ps8VDkqM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751274367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IP0b5VG41bBhmyGe33Uf59EFBAK0BAw5ZnVY9pFjKm8=;
	b=Ps8VDkqM505mNNKYx5/vxNRK68bCYf3S51UlEQnG2rNPGVsQT1cmNwHmeocRj9Mm7aEu3s
	AWw0lSXq2MXTuIMFL89DPS/HQwik1hKwJ1vMPaLiShrynegQFE7OwwjiFfvcv0b+D+8X+v
	IillxBt3qR/psPm829nKoDATji6Msnk=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-416-ZF-PmB_KNUKW1riDrXr6iQ-1; Mon, 30 Jun 2025 05:06:00 -0400
X-MC-Unique: ZF-PmB_KNUKW1riDrXr6iQ-1
X-Mimecast-MFC-AGG-ID: ZF-PmB_KNUKW1riDrXr6iQ_1751274360
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-408d05d8c03so1412776b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 02:06:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751274360; x=1751879160;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IP0b5VG41bBhmyGe33Uf59EFBAK0BAw5ZnVY9pFjKm8=;
        b=T4ipwA7yqmfy5tnVWTlhamC5PZWfdH4MVqJw5ag4l3vit3xXCvLZWt2F4zwKqeRIMJ
         dkHhrlnqeuMp8HgU8LUG++m7gV8RXsAWOmL0Grp1qfNfLv5+FFikS9xQzxMf7wKSFQzy
         UErVZq5dCK2HTHdVVaW+I6t/D/bo0GX1tI4NTcG3u43aUu5b5lIGFgUBDH1Fhn2MMVKV
         FGaM09+HE+0+Kv2QXnE4xsRrf+yIRQMql3Np7xckICrDjM7i/pIMVPcB08SOsIqO1rr2
         nVSMY7STJhVz/FoBIOSsTLglZiyP42AnBEJ9l1suFqF8B0s5dVZmcovyg7OKJ5FUdzN1
         F7eA==
X-Forwarded-Encrypted: i=1; AJvYcCVWgGbabzMZq8Z/uaj90caslcrMbkNm9F4p0q7zOH0KNxiclsDF69e7I5z7wf6c/Hg3yHpPQ9TVHa3ruU4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzowmRvYkLuH12Y6rJJlyBsi6gMye5X4ucRmR9YmJ/oNLV367q
	dcfRDALHfgEFC0pNVVaIvmxiBQA1H0zWI/XA7ZDK9xbhwMdkZOPmb77ICOTHZH9PxtC6/EuH3pX
	EqzB3iJwtHd8fnotT6BUcGS7ofypZo3xZ1f4gFzJGbETUyHo7MAnU9hhSuECOinavWw==
X-Gm-Gg: ASbGnct95bD9JZvcGbXzlyLeH3Kwd8WDgYf5D3MyOBPbLn6RYgTty7k4ZzAazF2GoPE
	ubcHKuqYAhd8VQ9KmoPPQaqZhg9V+H/lmWc76dx1SkNabNXD8byt3Zp44M8UER9WvyPW42AFAZm
	7LvYWdswh0oUhpjdb7U3B7s+unkQVwF7o0XOFu2DO3O3NbBPhIrF7BcNOIoaiO5NrXTmZ+V05WU
	jX/WW30SEnmCZtEDo7qWWAo7eB/xoQpZxJ1r+tbDNPVRNSlPdd80rp6i6Y4l9+cGgwiLtxcwaOT
	/nF/XopGCjU+p1U1/US/OSaf3EXO
X-Received: by 2002:a05:6808:2448:b0:406:6efa:3595 with SMTP id 5614622812f47-40b33e15bb8mr9814797b6e.24.1751274359682;
        Mon, 30 Jun 2025 02:05:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEepeaV8KclWnT/fUB+9LJI7sNEW53kR2xRdO2kaJqSt6uJ0a2hZ7/U6zTmIrJ8UvZVW5bmTA==
X-Received: by 2002:a05:6808:2448:b0:406:6efa:3595 with SMTP id 5614622812f47-40b33e15bb8mr9814779b6e.24.1751274359216;
        Mon, 30 Jun 2025 02:05:59 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.177.127])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40b32421052sm1617002b6e.37.2025.06.30.02.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 02:05:58 -0700 (PDT)
Date: Mon, 30 Jun 2025 11:05:44 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Michal Luczaj <mhal@rbox.co>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC net v2 1/3] vsock: Fix transport_{g2h,h2g} TOCTOU
Message-ID: <4vsrtxs3uttx6w2zyk6rxescpwvrikypiw6tvjheplht6yzonc@ch6k3xlftikw>
References: <20250620-vsock-transports-toctou-v2-0-02ebd20b1d03@rbox.co>
 <20250620-vsock-transports-toctou-v2-1-02ebd20b1d03@rbox.co>
 <zdiqu6pszqwb4y5o7oqzdovfvzkbrvc6ijuxoef2iloklahyoy@njsnvn7hfwye>
 <d8d4edb2-bf14-42b2-8592-79d7b014e1a7@rbox.co>
 <owafhdinyjdnol4zwpcdqsz26nfndawl53wnosdhhgmfz6t25n@2dualdqgpq3q>
 <e97b5cae-f6ef-4221-98e1-6efd7fdc6676@rbox.co>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e97b5cae-f6ef-4221-98e1-6efd7fdc6676@rbox.co>

On Sun, Jun 29, 2025 at 11:26:12PM +0200, Michal Luczaj wrote:
>On 6/27/25 10:02, Stefano Garzarella wrote:
>> On Wed, Jun 25, 2025 at 11:23:30PM +0200, Michal Luczaj wrote:
>>> On 6/25/25 10:43, Stefano Garzarella wrote:
>>>> On Fri, Jun 20, 2025 at 09:52:43PM +0200, Michal Luczaj wrote:
>>>>> vsock_find_cid() and vsock_dev_do_ioctl() may race with module unload.
>>>>> transport_{g2h,h2g} may become NULL after the NULL check.
>>>>>
>>>>> Introduce vsock_transport_local_cid() to protect from a potential
>>>>> null-ptr-deref.
>>>>>
>>>>> KASAN: null-ptr-deref in range [0x0000000000000118-0x000000000000011f]
>>>>> RIP: 0010:vsock_find_cid+0x47/0x90
>>>>> Call Trace:
>>>>> __vsock_bind+0x4b2/0x720
>>>>> vsock_bind+0x90/0xe0
>>>>> __sys_bind+0x14d/0x1e0
>>>>> __x64_sys_bind+0x6e/0xc0
>>>>> do_syscall_64+0x92/0x1c0
>>>>> entry_SYSCALL_64_after_hwframe+0x4b/0x53
>>>>>
>>>>> KASAN: null-ptr-deref in range [0x0000000000000118-0x000000000000011f]
>>>>> RIP: 0010:vsock_dev_do_ioctl.isra.0+0x58/0xf0
>>>>> Call Trace:
>>>>> __x64_sys_ioctl+0x12d/0x190
>>>>> do_syscall_64+0x92/0x1c0
>>>>> entry_SYSCALL_64_after_hwframe+0x4b/0x53
>>>>>
>>>>> Fixes: c0cfa2d8a788 ("vsock: add multi-transports support")
>>>>> Suggested-by: Stefano Garzarella <sgarzare@redhat.com>
>>>>> Signed-off-by: Michal Luczaj <mhal@rbox.co>
>>>>> ---
>>>>> net/vmw_vsock/af_vsock.c | 23 +++++++++++++++++------
>>>>> 1 file changed, 17 insertions(+), 6 deletions(-)
>>>>>
>>>>> diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
>>>>> index 2e7a3034e965db30b6ee295370d866e6d8b1c341..63a920af5bfe6960306a3e5eeae0cbf30648985e 100644
>>>>> --- a/net/vmw_vsock/af_vsock.c
>>>>> +++ b/net/vmw_vsock/af_vsock.c
>>>>> @@ -531,9 +531,21 @@ int vsock_assign_transport(struct vsock_sock *vsk, struct vsock_sock *psk)
>>>>> }
>>>>> EXPORT_SYMBOL_GPL(vsock_assign_transport);
>>>>>
>>>>> +static u32 vsock_transport_local_cid(const struct vsock_transport **transport)
>>>>
>>>> Why we need double pointer?
>>>
>>> Because of a possible race. If @transport is `struct vsock_transport*` and
>>> we pass `transport_g2h`, the passed non-NULL pointer value may immediately
>>> become stale (due to module unload). But if it's `vsock_transport**` and we
>>> pass `&transport_g2h`, then we can take the mutex, check `*transport` for
>>> NULL and safely go ahead.
>>>
>>> Or are you saying this could be simplified?
>>
>> Nope, you're right! I was still thinking about my old version where we
>> had the switch inside...
>>
>> BTW I'd like to change the name, `vsock_transport_local` prefix is
>> confusing IMO, since it seems related only to the `transport_local`.
>>
>> Another thing I'm worried about is that we'll then start using it on
>> `vsk->transport` when this is only to be used on registered transports
>> (i.e. `static ...`), though, I don't think there's a way to force type
>> checking from the compiler (unless you wrap it in a struct). (...)
>
>I've found (on SO[1]) this somewhat hackish compile-time `static`-checking:
>
>static u32 __vsock_registered_transport_cid(const struct vsock_transport
>**transport)
>{
>	u32 cid = VMADDR_CID_ANY;
>
>	mutex_lock(&vsock_register_mutex);
>	if (*transport)
>		cid = (*transport)->get_local_cid();
>	mutex_unlock(&vsock_register_mutex);
>
>	return cid;
>}
>
>#define ASSERT_REGISTERED_TRANSPORT(t)					\
>	__always_unused static void *__UNIQUE_ID(vsock) = (t)
>
>#define vsock_registered_transport_cid(transport)			\
>({									\
>	ASSERT_REGISTERED_TRANSPORT(transport);				\
>	__vsock_registered_transport_cid(transport);			\
>})
>
>It does the trick, compilation fails on
>vsock_registered_transport_cid(&vsk->transport):
>
>net/vmw_vsock/af_vsock.c: In function ‘vsock_send_shutdown’:
>net/vmw_vsock/af_vsock.c:565:59: error: initializer element is not constant
>  565 |         __always_unused static void *__UNIQUE_ID(vsock) = (t)
>      |                                                           ^
>net/vmw_vsock/af_vsock.c:569:9: note: in expansion of macro
>‘ASSERT_REGISTERED_TRANSPORT’
>  569 |         ASSERT_REGISTERED_TRANSPORT(transport);
>    \
>      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>net/vmw_vsock/af_vsock.c:626:9: note: in expansion of macro
>‘vsock_registered_transport_cid’
>  626 |         vsock_registered_transport_cid(&vsk->transport);
>      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
>But perhaps adding a comment wouldn't hurt either, e.g.
>
>/* Provide safe access to static transport_{h2g,g2h,dgram,local} callbacks.
> * Otherwise we may race with module removal. Do not use on
> * `vsk->transport`.
> */

Yeah, I'd just go with the comment, without introduce complex macros.
Also because in the worst case we don't do anything wrong.

BTW if we have some macros already defined in the kernel that we can 
re-use, it's fine.

>
>? ...which begs another question: do we stick to the netdev special comment
>style? See commit 82b8000c28b5 ("net: drop special comment style").

If checkpatch is fine, I'm fine :-)

>
>Oh, and come to think of it, we don't really need that (easily contended?)
>mutex here. Same can be done with RCU. Which should speed up vsock_bind()
>-> __vsock_bind() -> vsock_find_cid(), right? This is what I mean, roughly:
>
>+static u32 vsock_registered_transport_cid(const struct vsock_transport
>__rcu **trans_ptr)
>+{
>+	const struct vsock_transport *transport;
>+	u32 cid = VMADDR_CID_ANY;
>+
>+	rcu_read_lock();
>+	transport = rcu_dereference(*trans_ptr);
>+	if (transport)
>+		cid = transport->get_local_cid();
>+	rcu_read_unlock();
>+
>+	return cid;
>+}
>...
>@@ -2713,6 +2726,7 @@ void vsock_core_unregister(const struct
>vsock_transport *t)
> 		transport_local = NULL;
>
> 	mutex_unlock(&vsock_register_mutex);
>+	synchronize_rcu();
> }
>
>I've realized I'm throwing multiple unrelated ideas/questions, so let me
>summarise:
>1. Hackish macro can be used to guard against calling
>vsock_registered_transport_cid() on a non-static variable.
>2. We can comment the function to add some context and avoid confusion.

I'd go with 2.

>3. Instead of taking mutex in vsock_registered_transport_cid() we can use RCU.

Since the vsock_bind() is not in the hot path, maybe a mutex is fine.
WDYT?

Thanks,
Stefano

>
>> So, if we can't do much, I'd add a comment and make the function name
>> more clear. e.g. vsock_registered_transport_cid() ? or something
>> similar.
>
>Sure, will do.
>
>Thanks!
>
>[1]:
>https://stackoverflow.com/questions/5645695/how-can-i-add-a-static-assert-to-check-if-a-variable-is-static/5672637#5672637
>

