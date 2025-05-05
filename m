Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE781DBB2E
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 07:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746431020; cv=none; b=slI2PriDWQSKJN64slbX0I4pL0n8/Npih8UdVsdve6FYKI3DATMbUc5zOcxDhj8V7jFunwBzAGHV0x3Iqry4iOZXDghxn0ecdHtN9pyjv2SazVbmyNyfaKCJQVAnLbVlHhbwY9risFaQ5XrKMG4yTovPdrg0bE+gImhmMG1Pr0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746431020; c=relaxed/simple;
	bh=/1L4VXQZnM4TVg9Q0XEcQOC1Z7dwzdgPChSwdWfL7fE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=onr5+zjFQwAsUsngZYMeXW7pm9qf7ftMIXBwA3JpXkb0Lp2AOPS8ymjbYQjAv5Bt7qU5/w7BuE3fjeOH03WvVchJuQPEducRoO584muz+pib/34Sh8PJPRRZrNAmRVm4v6by63VWoKKLe/C9zVRaKK9XuxlvZGGiq8azzainOE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Rn4LMp9s; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Rn4LMp9s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746431017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NYutuEk9tS5pMcj+KQxarlK855jenHaF07JshpvJP/c=;
	b=Rn4LMp9s+uznmaMAOVagYdFa2TzX7VxnzkqJ/lpx9BzzCjv3MpEfZ8tMyQEDk25aBMDpUE
	Nckhmx2ylr7gTX0ks4Nh1+c2BrMpYFjXotVSO0xs5QC1SZiRxfdJN1S+eDDWOym9yw3SR9
	JxMNRYEpD5TuXFyi8kpddXU0J78GizQ=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-352-67P9yYwTOKSulrtDfG10IA-1; Mon, 05 May 2025 03:43:36 -0400
X-MC-Unique: 67P9yYwTOKSulrtDfG10IA-1
X-Mimecast-MFC-AGG-ID: 67P9yYwTOKSulrtDfG10IA_1746431015
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-54e8141b4adso3178989e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 00:43:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746431015; x=1747035815;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NYutuEk9tS5pMcj+KQxarlK855jenHaF07JshpvJP/c=;
        b=CyK/OFcAefPlBqUQLM0M43lCs8YYErvYgYaq30IEr/O3/nkwx70JjWxQ1IvDfDhomW
         72FUCjGGYZ/YU+eqVaPtdER5Zr/XRnEVeixiK7KMxr5mIhtlxr9mtp3KWkM+Ql2zKs+h
         UKzpMpxUgZUSZ+anrd/G3gwo+cfSG82s/VmSv4nEOpj0yfniX0x/1N6SCiXhIBdfKWZu
         h0CqHnmmLUFJMXOxN6DK+sHB9dgHsrF73OoJ0c94pif84IRyrGEFgvYTSPKcEMnLMyEs
         wWCykjCr3qTPgB9vspM4rsUyVo5+ekoKjb77qZw8+sPYOqKfV3C+fl/txppZKYn87Bg9
         7fSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAZV9tZ2ICeJMh5rTCmZRObOZFkr3d1XQqDHczmoScUM8WMkeIvbftShXmaLLlqfYQxDcf9BdIkK4c87c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYvGw8YZdSdFF6004k2iPNSqZDbkoVwNy+/7bXfjqFoRwCBUS0
	OQdvtcsqwwFFwaeA8h+V4aPZgDXBYTrrjTTV/zJsfkQx6y/46mWLiuvdVgk0isqoZV5TKFGxn2t
	+0+hheQZHtWyWMtCoJtDY1cLn1+BVRlVhOk0tsmDDymhKoy1Hmtkp4u7gFGzC6ReCMWfchPq68Q
	s=
X-Gm-Gg: ASbGncuD+c6oe/cGlHhlR4SzKjXXXbN6sdHd36BxAPDrQfdT2GSC3KYURgFJ9XBzN2F
	heLSWa2nxvlavEal3bX8zHc5JJV8AKF/rxjH+sIIIelWosF+qTsIl9GFaGQNYSyx9Zwz2+JXtUx
	sbqz/Egf4QM3rf58cl5cJkA4Oo5wt4BVhz9q6wVEmHMaS5f+SuMNif0vNS3J7oNqqaKu+OYX52p
	IRkD7EA8HprdK7BjVM1vlPvSQO30iC8GE0egums5vmZ1YRdyfRiZJDGL43TQ6augMrNng8y8QY/
	rNZdXiHWAycmNTOr9goVbRHoWtiKiCyuo4myAdQPI/QT1mST9BWKHoRIL6U=
X-Received: by 2002:a05:6512:3c94:b0:54e:85c8:ab88 with SMTP id 2adb3069b0e04-54fa4f9bd0amr1970496e87.41.1746431014779;
        Mon, 05 May 2025 00:43:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsEsHgZOcmzKyEYKe53zgGMeSaMF3WinuQkv4wSGTWsyP+GpxlPUt85uINmh0HuIcOZYrSLQ==
X-Received: by 2002:a05:600c:1e09:b0:43c:f895:cb4e with SMTP id 5b1f17b1804b1-441cb49494cmr15680615e9.17.1746430567130;
        Mon, 05 May 2025 00:36:07 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2706:e010:b099:aac6:4e70:6198? ([2a0d:3344:2706:e010:b099:aac6:4e70:6198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b391c42bsm162401715e9.39.2025.05.05.00.36.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 00:36:06 -0700 (PDT)
Message-ID: <8cdf120d-a0f0-4dcc-a8f9-cea967ce6e7b@redhat.com>
Date: Mon, 5 May 2025 09:36:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v13 4/9] net: devmem: Implement TX path
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, io-uring@vger.kernel.org,
 virtualization@lists.linux.dev, kvm@vger.kernel.org,
 linux-kselftest@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, Donald Hunter <donald.hunter@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Jeroen de Borst <jeroendb@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Kuniyuki Iwashima <kuniyu@amazon.com>, Willem de Bruijn
 <willemb@google.com>, Jens Axboe <axboe@kernel.dk>,
 Pavel Begunkov <asml.silence@gmail.com>, David Ahern <dsahern@kernel.org>,
 Neal Cardwell <ncardwell@google.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Shuah Khan <shuah@kernel.org>,
 sdf@fomichev.me, dw@davidwei.uk, Jamal Hadi Salim <jhs@mojatatu.com>,
 Victor Nogueira <victor@mojatatu.com>, Pedro Tammela
 <pctammela@mojatatu.com>, Samiullah Khawaja <skhawaja@google.com>,
 Kaiyuan Zhang <kaiyuanz@google.com>
References: <20250429032645.363766-1-almasrymina@google.com>
 <20250429032645.363766-5-almasrymina@google.com>
 <53433089-7beb-46cf-ae8a-6c58cd909e31@redhat.com>
 <CAHS8izMefrkHf9WXerrOY4Wo8U2KmxSVkgY+4JB+6iDuoCZ3WQ@mail.gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CAHS8izMefrkHf9WXerrOY4Wo8U2KmxSVkgY+4JB+6iDuoCZ3WQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/2/25 9:20 PM, Mina Almasry wrote:
> On Fri, May 2, 2025 at 4:47 AM Paolo Abeni <pabeni@redhat.com> wrote:
>>> @@ -1078,7 +1092,8 @@ int tcp_sendmsg_locked(struct sock *sk, struct msghdr *msg, size_t size)
>>>                               zc = MSG_ZEROCOPY;
>>>               } else if (sock_flag(sk, SOCK_ZEROCOPY)) {
>>>                       skb = tcp_write_queue_tail(sk);
>>> -                     uarg = msg_zerocopy_realloc(sk, size, skb_zcopy(skb));
>>> +                     uarg = msg_zerocopy_realloc(sk, size, skb_zcopy(skb),
>>> +                                                 sockc_valid && !!sockc.dmabuf_id);
>>
>> If sock_cmsg_send() failed and the user did not provide a dmabuf_id,
>> memory accounting will be incorrect.
> 
> Forgive me but I don't see it. sockc_valid will be false, so
> msg_zerocopy_realloc will do the normal MSG_ZEROCOPY accounting. Then
> below whech check sockc_valid in place of where we did the
> sock_cmsg_send before, and goto err. I assume the goto err should undo
> the memory accounting in the new code as in the old code. Can you
> elaborate on the bug you see?

Uhm, I think I misread the condition used for msg_zerocopy_realloc()
last argument.

Re-reading it now it the problem I see is that if sock_cmsg_send() fails
after correctly setting 'dmabuf_id', msg_zerocopy_realloc() will account
the dmabuf memory, which looks unexpected.

Somewhat related, I don't see any change to the msg_zerocopy/ubuf
complete/cleanup path(s): what will happen to the devmem ubuf memory at
uarg->complete() time? It looks like it will go unexpectedly through
mm_unaccount_pinned_pages()???

Thanks,

Paolo

