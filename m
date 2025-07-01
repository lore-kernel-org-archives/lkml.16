Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25DA61F3BAE
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 10:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751366251; cv=none; b=JQBtjysE4Ljk3ecy2KgK3AVoPQojvaNHl/L6Rv5f4QZg1k2v3POBQiGHns6B1kNNAj1ykUeC6/TvvpuZPXa8dtvIDRio6pPx41w1E8WZiFkhgHLfW0RZDUt1O4VXsvin0jau/ymePoD1wAqSNASk9S0tRzuDlPKuQxSKmx4wS6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751366251; c=relaxed/simple;
	bh=heXSovKMp8WMZ4/NmKFQEomaA05X7Vw0t+hCl43nhvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UUBw4fAlD5LVQ4D1DLFke8ZUPxYXQ0u2nGi7d4uao2oNFCD4Nmzq6NJvsVlwjdkZ5nzMXuAXVbbQuoHKQBOpUB6gAFl78Os1RCvLXew5rNN4S5OJYitKtPtst4eFFt7iRFqNbd/rK5iHMNNK5Iv6wM2Exc+63yJx2wcKvQtZRWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Bg3kZWqr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Bg3kZWqr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751366249;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n2ir46AUDqqNyeG2en8npeW9OEH0djU5Wi0RBd8xUlA=;
	b=Bg3kZWqrGMOkDohS2MVzZHxtsKyyqExL6zEhzvzELiCI+wUmUWsRqFqVGGG9lWMdm1Si6S
	Vqzb+N7/MuVWfBe5WTyimxIoMkzW7O0tHflqmj265QfhOVnr4SPOCs3gZqeSjcfCKlub6k
	yPC8ARjVy5+OzjPJLWTogNak1AmTeQA=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-uSu5KdcJN6Wbi2F7GBX1Kw-1; Tue, 01 Jul 2025 06:37:28 -0400
X-MC-Unique: uSu5KdcJN6Wbi2F7GBX1Kw-1
X-Mimecast-MFC-AGG-ID: uSu5KdcJN6Wbi2F7GBX1Kw_1751366247
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-60d60b8ef64so2348083eaf.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 03:37:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751366247; x=1751971047;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n2ir46AUDqqNyeG2en8npeW9OEH0djU5Wi0RBd8xUlA=;
        b=cvuYIw1hPPpw/CLxdr3erccVgw4+L9FpIOJMbJalPst2sP692J/w/YFAOa5evX8zAu
         FBk1dKPmOrOguNHB7rAMU56QwL7PHzKgtI+90fWaHIdzNZMGlY3emZrB8l4L88qQ4Bj5
         acsNbAHuDs6Mp6GGPkqhfOaQITlXk/Dc9Y125DfcRPrOTnZbj3CKpBvK/FDNOfwaWdKs
         HjeRyPtzIJOYO9JBHOpylJlyp+jWZHhSU52BbRPld/49summKjzdEjU62OQ4EX9IB2UD
         MJVeRyCH6Cot01FrJTJuRNjF0BPCw8VOOA5UON6dpecKQc6XnUVCmzpup9joAYHJ6c6O
         7wPA==
X-Gm-Message-State: AOJu0Yw/xpbRvBIK0EBCMe6BiJkquiTlT91JU5UyGatPY5E7iNsxgI6v
	Bu4bXYouH24PfH2lmDlyxG9WQhMVqWDDkiSuwFI2iG37kLE79/UM7pIVnH/93cIpA12RUmVa1go
	0idK+/uCkMDWv34csMqGOjDOscmxJvzOlyuZ2apIZGuWQ1KA9RM7GUEpO4KxGiISEnA==
X-Gm-Gg: ASbGncsWUxnlyW+MacZ4cwHXv84li02Tb8TaQ9GksL1hmKT3sTn+oISI2M8iV/9kHW6
	wC8h7LZ5/WD/RQ1lLZsAtBgCux97rssWdz5foI/Ej78BESvrZaS9uLJ/+7tnqtkFBlmwpDbEQ0k
	m54x++65PTEdn8aCESK1W2iD8aLqi4uhupdLWSaoRI7us1oYadljOT8nNGI1Em4TZKxqslK7jg0
	S9uEzsVLn9IhOoy4MtiSkvN8MSfgRtFt1bLK/uzwCw4jacBSdHszVwe/6wN2vzDyX6YtWOqybwp
	ufGz0YyxZp5rxtoQNX0lN1J9I4Ss
X-Received: by 2002:a05:6830:4d87:b0:731:cac7:364e with SMTP id 46e09a7af769-73afc63c25dmr9915284a34.22.1751366247264;
        Tue, 01 Jul 2025 03:37:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyVKJMDrLHZZIEx6Kk38/Nas6gM9Ud+smX4Ebygc9Zz6lBqLLrkX5YBPiqMFvYh1w2+bHAbw==
X-Received: by 2002:a05:6830:4d87:b0:731:cac7:364e with SMTP id 46e09a7af769-73afc63c25dmr9915263a34.22.1751366246892;
        Tue, 01 Jul 2025 03:37:26 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.144.202])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73afb107871sm2055408a34.58.2025.07.01.03.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 03:37:26 -0700 (PDT)
Date: Tue, 1 Jul 2025 12:37:13 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, Keir Fraser <keirf@google.com>, 
	Steven Moreland <smoreland@google.com>, Frederick Mayle <fmayle@google.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowang@redhat.com>, Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, 
	netdev@vger.kernel.org, virtualization@lists.linux.dev
Subject: Re: [PATCH 1/5] vhost/vsock: Avoid allocating arbitrarily-sized SKBs
Message-ID: <njwfflmq7swifmc5gwbovtju4bg2zg4cibpichtjhlkqkprvtb@5r5giy2irbzd>
References: <20250625131543.5155-1-will@kernel.org>
 <20250625131543.5155-2-will@kernel.org>
 <7byn5byoqlpcebhahnkpln3o2w2es2ae3jpzocffkni3mfhcd5@b5hfo66jn64o>
 <aGKIO8yqBSxXZrE2@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <aGKIO8yqBSxXZrE2@willie-the-truck>

On Mon, Jun 30, 2025 at 01:51:07PM +0100, Will Deacon wrote:
>On Fri, Jun 27, 2025 at 12:36:46PM +0200, Stefano Garzarella wrote:
>> On Wed, Jun 25, 2025 at 02:15:39PM +0100, Will Deacon wrote:
>> > vhost_vsock_alloc_skb() returns NULL for packets advertising a length
>> > larger than VIRTIO_VSOCK_MAX_PKT_BUF_SIZE in the packet header. However,
>> > this is only checked once the SKB has been allocated and, if the length
>> > in the packet header is zero, the SKB may not be freed immediately.
>> >
>> > Hoist the size check before the SKB allocation so that an iovec larger
>> > than VIRTIO_VSOCK_MAX_PKT_BUF_SIZE + the header size is rejected
>> > outright. The subsequent check on the length field in the header can
>> > then simply check that the allocated SKB is indeed large enough to hold
>> > the packet.
>>
>> LGTM, but should we consider this as stable material adding a Fixes tag?
>
>Yup, absolutely. I put it first so that it can be backported easily but,
>for some reason, I thought networking didn't CC stable. I have no idea
>_why_ I thought that, so I'll add it (and a Fixes: line) for v2!

yeah, this was the case till last year IIRC, but we always used Fixes 
tag, also if we didn't cc stable.

>
>That seems to be:
>
>  Fixes: 71dc9ec9ac7d ("virtio/vsock: replace virtio_vsock_pkt with sk_buff")
>
>from what I can tell.

I think so!

Thanks,
Stefano

