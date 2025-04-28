Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4117B262FCA
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 13:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745848621; cv=none; b=PdenafBCf+3ZFlFZuQiqR87lgV5tTw7FXO9NQx1B8wbfUWJAjJrexi+QB6G8/aB6I2mA8xSM3QL6fY7fAhzBhmNHtAw72xbFHdAR59BnolfJVLIvMc0zFSCT8ECCejxX8+w1upO8tfpYUsvSDn50sXcI9WtTc14mm3LNvMdtU+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745848621; c=relaxed/simple;
	bh=70lfu/B2ib3SJpO5ooGMaAt1QBpRSWIEV/Np9sKATMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VzQslkKRodH+He4nt9ig1xF0aTJ5s/JCBvNtHPVSrf5jmqvBt0PERBtffe18334HXM/0L320wLjyUjSGSBpoi+G7MBzGv6jeVaYeNVU3p2R85WEBn35nvLZE0ConCAdD+GLyVku8Me4NZl4PzEIN/guWAXmKEHFXyA9jDLUyvyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SjeRAvqr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SjeRAvqr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745848619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UHyYAaJAMEZKibWtlyqh2W6HZtpo9zi498VVY4y0rAg=;
	b=SjeRAvqroFS6XltalVLoQhkO0cXVeoI1CmmDqrL4SeNSITFcowaHG8L2CtedWD58dj0Pc6
	yfoJG3CoYzOai1eBv4oTr2gq7EWSKVeBitCljVIROSdZQnfOAvuen7EBN4iCXWJPgnkbgy
	k/wWbZ6bga3BnaXuA3sI01a7WFLFlUE=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-354-igm4VrrxOuy36hbbI65Yiw-1; Mon, 28 Apr 2025 09:56:57 -0400
X-MC-Unique: igm4VrrxOuy36hbbI65Yiw-1
X-Mimecast-MFC-AGG-ID: igm4VrrxOuy36hbbI65Yiw_1745848617
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c54e9f6e00so937115885a.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 06:56:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745848617; x=1746453417;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UHyYAaJAMEZKibWtlyqh2W6HZtpo9zi498VVY4y0rAg=;
        b=EtGjMlurvhauHLQiaKjLjKCAchuetMYlFL7bQQA5J3y47idioTa5JsoXZ2K9+Ws9d2
         1E7w2ghKMjy7TcBXJXO2XLowC/8ZzlCpkfKVMaLAFhFmDRY047jgw2lzY1gZxVOH1bRL
         vra9/9UGib6ZWT/8Xf8afsssxGtzAwAB1BXUCMg7g4yIGXS6q+ukrC3dZL3zs88bdWdf
         rvAVPTuCCycjeYtj9xh4+3PMVPdJIgPuo0N0OLj6CkHfjpIQPg5UdO+sSce73Kkk06Rk
         ZNbM0IAenqffY5dg9lnWQmz6tOr6eoquW/vgP5CrKJ9CD4OpJe/eqkoYP9ZkxIFjD0yw
         j3oQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrtRwC0EcRcXDkvlquAXnUWn0wwb8FNPGtB23mUAEBruKFlbtvmavXMvOFZs6VPyV6yrhInz7/uaTUUfA=@vger.kernel.org
X-Gm-Message-State: AOJu0YznE7TuItCe5DNQodu9uZLTxIiiOSTOxg3u9DLLuMs0CqAjuRyR
	dl2TyGPEA53o4lQb6J7jxuXN2+p3vTKBa/LOwiDewJiVRhDGNlo8VrCr3IM4NcABm5urpb9xxLG
	B/yKsjj0OZXIJgYbNfvSbOV9wuSNeFHX3AvIR0+XEihgiteXEdcLHEzXDWxulUQ==
X-Gm-Gg: ASbGncsx/auctMnddgapwZ1Sgl5fcL48lr/HEbK4uu/gwcpK/NKzn6t4vFVK7PKehmQ
	D1R9ipL16+4i1I9H27dhf5BZHpWdy6iq8mxmfTpfgHkdR6GHe+bnrYtZVU5NJyNl7PGD/wxByuL
	W4IwyL+20pG0xigqCbe1nwy6uzVvsRjxcCgqHvbahw/IZShdAnVnQ3po0TVcZvoPIjoOmkzEFu1
	mdhE2snoT/rgimKOfzNuhK9zD+jq9klYjhr95RfYn2+dQyeYxS216t2MOW8cngziI6h2w27L3mJ
	e16+yfGn5bBeqpxZ
X-Received: by 2002:a05:620a:2887:b0:7c0:a1c8:1db3 with SMTP id af79cd13be357-7c9585c5877mr2487230185a.11.1745848616976;
        Mon, 28 Apr 2025 06:56:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFF77QtEVSxz59mKWcWmWXJCMGCmi0uBQwkt5f3Bu+dckdVzt5kbvV5X2qwCObb0VZdyOuwAw==
X-Received: by 2002:a05:620a:2887:b0:7c0:a1c8:1db3 with SMTP id af79cd13be357-7c9585c5877mr2487224585a.11.1745848616412;
        Mon, 28 Apr 2025 06:56:56 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.205.27])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c958cbd048sm623795385a.43.2025.04.28.06.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 06:56:55 -0700 (PDT)
Date: Mon, 28 Apr 2025 15:56:38 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Michal Luczaj <mhal@rbox.co>
Cc: Luigi Leonardi <leonardi@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Subject: Re: [PATCH net-next v2 1/3] vsock: Linger on unsent data
Message-ID: <wff4t4owsukm2jynm2dhju4rrtegyjjlrhu7o5xppsxfqrcus4@wmsvcwkdtdat>
References: <20250421-vsock-linger-v2-0-fe9febd64668@rbox.co>
 <20250421-vsock-linger-v2-1-fe9febd64668@rbox.co>
 <km2nad6hkdi3ngtho2xexyhhosh4aq37scir2hgxkcfiwes2wd@5dyliiq7cpuh>
 <k47d2h7dwn26eti2p6nv2fupuybabvbexwinvxv7jnfbn6o3ep@cqtbaqlqyfrq>
 <ee09df9b-9804-49de-b43b-99ccd4cbe742@rbox.co>
 <wnonuiluxgy6ixoioi57lwlixfgcu27kcewv4ajb3k3hihi773@nv3om2t3tsgo>
 <5a4f8925-0e4d-4e4c-9230-6c69af179d3e@rbox.co>
 <CAGxU2F6YSwrpV4wXH=mWSgK698sjxfQ=zzXS8tVmo3D84-bBqw@mail.gmail.com>
 <81940d67-1a9b-42e1-8594-33af86397df6@rbox.co>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <81940d67-1a9b-42e1-8594-33af86397df6@rbox.co>

On Thu, Apr 24, 2025 at 01:24:59PM +0200, Michal Luczaj wrote:
>On 4/24/25 10:36, Stefano Garzarella wrote:
>> On Thu, 24 Apr 2025 at 09:53, Michal Luczaj <mhal@rbox.co> wrote:
>>> On 4/24/25 09:28, Stefano Garzarella wrote:

[...]

>>> You're right, it was me who was confused. VMCI and Hyper-V have their own
>>> vsock_transport::release callbacks that do not call
>>> virtio_transport_wait_close().
>>>
>>> So VMCI and Hyper-V never lingered anyway?
>>
>> I think so.
>>
>> Indeed I was happy with v1, since I think this should be supported by
>> the vsock core and should not depend on the transport.
>> But we can do also later.
>
>OK, for now let me fix this nonsense in comment and commit message.

Thanks!

>
>But I'll wait for your opinion on [1] (drop, squash, change order of
>patches?) before posting v3.

I'm fine with a second patch to fix the indentation and the order looks 
fine.

BTW I'm thinking if it makes sense to go back on moving the lingering in 
the core. I mean, if `unsent_bytes` is implemented, support linger, if 
not, don't support it, like now.

That said, this should be implemented in another patch (or eventually 
another series if you prefer), so my idea is the following split:
- use unsent_bytes() just in virtio
- move linger support in af_vsock.c (depending on transports 
   implementing unsent_bytes())
- implement unsent_bytes() in other transports (in the future)

WDYT?

Thanks,
Stefano

