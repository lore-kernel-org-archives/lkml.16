Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CA2224882
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 10:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750759376; cv=none; b=rB+OAUbR7mn8yo8Sv22mWtIN7eO92KqiFMwI5wa2exMBPaiT5ykrx1eldewi80XVb7gQev14bsH8k884x6mMGswAcMEimrSq4HNa+T8mxwWvlwWfek+4n3O45jsP9i2au+03ps1rwKIz4dhyUVwO9Or29IObCkyJRquQr7QEgdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750759376; c=relaxed/simple;
	bh=iOw/L11BDQrjLHtuit0xpOKB235eAAjDVcmGUBFHfS0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EJqf/7/P3XeLQf6xQBFvR+ve+Tt7SN59j0lMAuA31HS/YrjaggYM85I21m1OOrz1u0BYi0uz0kXjherXG20Vy2eT1QXpXp/RZVu+i15I6VgfKvP4wKWAy4ohdzqqIjwneVY9KUaV4MCFMJVFKa5xrklHropa+kZaMQ0FcplANHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MDGXSErI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MDGXSErI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750759374;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FRBtRqPAyg+QV0d52jJWOCZGpVdQ0NwXgV55dkzF008=;
	b=MDGXSErIRdeXkMn3oQSD8twgpjlNW+gPlgRzmLgByd6tVAiYdy+N0IIcQBJvHjNkbeiT2G
	GkJoi9OjlcJerlz5xTG7ra7NpGlPPNEMSByY16XDiDLKTv5yE9HuWZs/SXR2uLKClIxmtw
	YhZKLzAx55Wo1N981oVZN2A01KIinJ4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-Afq-tQe8NUG-HGkAm0uj6w-1; Tue, 24 Jun 2025 06:02:52 -0400
X-MC-Unique: Afq-tQe8NUG-HGkAm0uj6w-1
X-Mimecast-MFC-AGG-ID: Afq-tQe8NUG-HGkAm0uj6w_1750759372
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-45311704d1fso32822005e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 03:02:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750759371; x=1751364171;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FRBtRqPAyg+QV0d52jJWOCZGpVdQ0NwXgV55dkzF008=;
        b=bJ06j/02MBi+zSlsai26xc5GJqGbDrnlbr60wuGZkM/Qh0AJhwMgbxYEa11AF9y9TX
         K3/nw30p99jTwyh+ajHXpRICBwDken0UjTboDuRyP8G/x5RNxT+0/NXI0iMRK2jxRIvJ
         CJ0Z2vOueOcytWCBxLMcOKhEySfPJFquEGrDHwj0jZKWXZvuun+NX2FgNY/iYFcqn1U+
         DMPdPjfomusVi7+tLyQ63JjfUOW8L7pTnxiLQkUZeQgRCp0sUwBP8ipmZSfMLEsASYHH
         b888/TIm1B6gQEgQ09qUi2OYjECn4wW26Tr9JKlOhY1odhNp4gNJ/TgSw9eTXKg/5mZV
         u3Rw==
X-Forwarded-Encrypted: i=1; AJvYcCWX3Z9zfBprScuCARL09zxC3MwgnGnzZKz+bT65jXEezt+fm3vBMhGcdNr6pnMBe7fsqwhGWtGnbGRZLc8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrnO5wcOBSrCe18zH3sDoLlNxWzvFUfJdo9E+X3TdSVBumx/1w
	Vo2KA7aU7zky8gRbqHSFvvHE8v5hHjB/71pQ7HtZfRF6TwOiewpnLdiDS6CfdoJ+WBVEpI99BMq
	pTexwKQzZRLUDKzNupVNgqBvPqSHFWYrr4SzV/QqvroGYExr/yHw8EF/jpYY0cSx1Qg==
X-Gm-Gg: ASbGnctE16h+stUl6BQ/xKbqTrkwBeDdjL/mj9v5RuxyA8TTmdZ9+39nc4PeiSNxY5c
	hBXTg+95YGp3Mf+B3/3b4Mlw1E4PDkpxg7/Q1g789U6skvqf+2uex/2J8hyNG5LgcL0bOF0qAqz
	TGNKtraPzexIhrLSd/0q73+8/CaTEnzBy5dq2SGtuB78VtactWOkI1WvdhMnPrUpUOHHgYuU1RF
	jZNGENKouOg9clB2NMvwOZQ+GTQp7ZZuIpj6L2pugnrfkQDvMuOeCLo0LtqzNEjdhYVN5j3RSrI
	dxqjk+1foBq/kk5b5325cINqe3eJIg==
X-Received: by 2002:a05:600c:1d95:b0:43b:ce36:7574 with SMTP id 5b1f17b1804b1-453659c9cd3mr127322935e9.11.1750759371550;
        Tue, 24 Jun 2025 03:02:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4nOxjPFsJ1eZqeyQQfzna9JUiKLhgP6SNKYrgYsBIKI61asj0UadPwdpCO34yq47DYpw21w==
X-Received: by 2002:a05:600c:1d95:b0:43b:ce36:7574 with SMTP id 5b1f17b1804b1-453659c9cd3mr127322615e9.11.1750759371097;
        Tue, 24 Jun 2025 03:02:51 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2445:d510::f39? ([2a0d:3344:2445:d510::f39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ead202asm170467905e9.27.2025.06.24.03.02.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 03:02:50 -0700 (PDT)
Message-ID: <5fb3c0e4-759c-4f56-8a78-e599c891f618@redhat.com>
Date: Tue, 24 Jun 2025 12:02:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 1/2] virtio-net: xsk: rx: fix the frame's length
 check
To: Bui Quang Minh <minhquangbui99@gmail.com>, netdev@vger.kernel.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org
References: <20250621144952.32469-1-minhquangbui99@gmail.com>
 <20250621144952.32469-2-minhquangbui99@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250621144952.32469-2-minhquangbui99@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/21/25 4:49 PM, Bui Quang Minh wrote:
> When calling buf_to_xdp, the len argument is the frame data's length
> without virtio header's length (vi->hdr_len). We check that len with
> 
> 	xsk_pool_get_rx_frame_size() + vi->hdr_len
> 
> to ensure the provided len does not larger than the allocated chunk
> size. The additional vi->hdr_len is because in virtnet_add_recvbuf_xsk,
> we use part of XDP_PACKET_HEADROOM for virtio header and ask the vhost
> to start placing data from
> 
> 	hard_start + XDP_PACKET_HEADROOM - vi->hdr_len
> not
> 	hard_start + XDP_PACKET_HEADROOM
> 
> But the first buffer has virtio_header, so the maximum frame's length in
> the first buffer can only be
> 
> 	xsk_pool_get_rx_frame_size()
> not
> 	xsk_pool_get_rx_frame_size() + vi->hdr_len
> 
> like in the current check.
> 
> This commit adds an additional argument to buf_to_xdp differentiate
> between the first buffer and other ones to correctly calculate the maximum
> frame's length.
> 
> Fixes: a4e7ba702701 ("virtio_net: xsk: rx: support recv small mode")

It looks like the checks in the blamed commit above are correct and the
bug has been added with commit 99c861b44eb1f ("virtio_net: xsk: rx:
support recv merge mode")???

/P

