Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2D92641E7
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 09:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104542; cv=none; b=rVgMjn9H9II3WRBPfk5DgXaHIdrQvYiC7ko13Mis/WTYi4bSWK6ziEiYANzmqhkKr8GiiYs4JLfY4PeDQRukL6wnkx1uAcZcdstp86LiI6YCqCRgfzYLId6RLEj7ZhHJKmdE99SEQIIVI2xO9s+QNtlm4y6eubanOD99JA020ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104542; c=relaxed/simple;
	bh=6GXjoR9+j3K5oqC5DbXewEtoWag0AaWHJyjmg134Js8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZU+K9HWGH1sujrdxpEeAyg/FajzIJJT/U2nhjkCrUy7/2d7LSc6Qlx0Fp7+3vbc2S9d0J3gF47mxzu0ElK29F9zKfBGuPNnGYYDYUOYXbzihkP14LboUMJU4LR0D5grFVy9l3P4EYVCOHk2wUHpGSuKUUELGkABdDXnQGtyp0Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AjFf/ewd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AjFf/ewd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744104539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5kFJkKUSX4bPqKPH1LRnxjH0+XkR8hOBduchqaJy8g8=;
	b=AjFf/ewdlHHT0pmbgyMqtX2TkSZVxkm1qzBrWkeTmYiNcYF0gD0pvOp3tbR8L0mDkUbFn4
	3R4HtoMxPzpNSkRWByoOgVivYK8rbSZNgf7CMPFFTbyywp59JScdM1fFBW6quxCjjg/YWc
	H2HQqTs3Ctwhc38C4pdqBuYg8QTMNAk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-223-AEF2E9ETOSSHbhJsyPqaXA-1; Tue, 08 Apr 2025 05:28:58 -0400
X-MC-Unique: AEF2E9ETOSSHbhJsyPqaXA-1
X-Mimecast-MFC-AGG-ID: AEF2E9ETOSSHbhJsyPqaXA_1744104537
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43ceeaf1524so30011735e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 02:28:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744104537; x=1744709337;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5kFJkKUSX4bPqKPH1LRnxjH0+XkR8hOBduchqaJy8g8=;
        b=w1kEYmDpFdzDTfuXlYmDeyewcO5f2jncUeKWLdXRIqNIrpxHCRBA++u0lDr4W8yVEC
         EhzjZ8eDsIm7F6R2etua1NrtfOtCN4BcVOY+spL/y7P4KctG6wWLM2KmGTFVGTZIVN3f
         TQfCVsO2B+dPMO5Ju4gH/X2WW4RlvI1LyTR5Xb4au9rgnwQ8Hxt3Rv/wLeTvGkj2yYPb
         3bk1q9xzYxlhuytXFYCDQNxIimixMGsnOeNXdfY0L+pCULDMS2PyhgG5Ia4RY9EYaQXj
         4jiNa4DSZFFyW5xlA/PaefJCtM5MSXaJvkSNACDu4P+sZpvd0kt4rsYsXO7wgkPepQFV
         b2Mw==
X-Forwarded-Encrypted: i=1; AJvYcCXqTD0Diyzo8GjHxAJ/MuMx8rezC5qSy1TQgf+W1kaffVB5EkOAdkbj/IvQtVCYCPwaJ/KbZq0Kk9O8P88=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKRPCyFxN+a0NtoL+bl+YhHV8EWmO/nfE4Ikkrc5I7BhrRZVKU
	5f/pDTF+9MhWVBlrWogyLcW6ZrX03jxeYYFn75zcnM4PBDRL2dQ54tABJgrgYfQhP6DaEcXL5F3
	TRhjO+ZJxUY6Bb9zTZ9n2zDTAGP8rB3uYc3Sf0BfW+usFc7VXyDGUchfS6Fpq0Q==
X-Gm-Gg: ASbGncsW1uO/NvcUqMPcs3P5XP1OEOni1WUmb7A+19vDCgFjLmbZvhK0YehiTsuWjtz
	Usy31b5rLKrBvGU3o6KR1Lc1Z6FGGUj7qXNLakkovwO+AEKsCN8CjO6vcmcv/czsyfiTVPzCXHV
	m1Ef1bPgw5pFpC1E9XB7U+Wr0eM/mjWWc40V86hkRllPHKGgequsfPyXKW/MuaO8iQWoccU/PWt
	t5IHdeNNGOn2nV9o3zUYWDvka0wDZ//x0WE2NUJL0gUquTr4BNMWWt2JiyaA+fnQKYTKTEGlP0S
	rK8c+Jq+uDICgimRt4bnqJNwyh71AAJz9herzWqK1tw=
X-Received: by 2002:a05:600c:4fcf:b0:439:8878:5029 with SMTP id 5b1f17b1804b1-43f0e559b59mr17275595e9.2.1744104537139;
        Tue, 08 Apr 2025 02:28:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhpOS2RXvhgff3wksFzuaqSdXSfMzYI4OqpbYjwZCmgj2nkzJ65yFcKEppTsA1r/gQVzTICQ==
X-Received: by 2002:a05:600c:4fcf:b0:439:8878:5029 with SMTP id 5b1f17b1804b1-43f0e559b59mr17275315e9.2.1744104536739;
        Tue, 08 Apr 2025 02:28:56 -0700 (PDT)
Received: from [192.168.88.253] (146-241-84-24.dyn.eolo.it. [146.241.84.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1660eb3sm159792645e9.11.2025.04.08.02.28.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 02:28:56 -0700 (PDT)
Message-ID: <1b78c63b-7c07-4d25-8785-bfb0e28c71ad@redhat.com>
Date: Tue, 8 Apr 2025 11:28:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] virtio-net: disable delayed refill when pausing rx
To: Jason Wang <jasowang@redhat.com>,
 Bui Quang Minh <minhquangbui99@gmail.com>
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 virtualization@lists.linux.dev
References: <20250404093903.37416-1-minhquangbui99@gmail.com>
 <1743987836.9938157-1-xuanzhuo@linux.alibaba.com>
 <30419bd6-13b1-4426-9f93-b38b66ef7c3a@gmail.com>
 <CACGkMEs7O7D5sztwJVn45c+1pap20Oi5f=02Sy_qxFjbeHuYiQ@mail.gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CACGkMEs7O7D5sztwJVn45c+1pap20Oi5f=02Sy_qxFjbeHuYiQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 4/8/25 9:34 AM, Jason Wang wrote:
> On Mon, Apr 7, 2025 at 10:27 AM Bui Quang Minh <minhquangbui99@gmail.com> wrote:
>> On 4/7/25 08:03, Xuan Zhuo wrote:
>>> On Fri,  4 Apr 2025 16:39:03 +0700, Bui Quang Minh <minhquangbui99@gmail.com> wrote:
>>>> When pausing rx (e.g. set up xdp, xsk pool, rx resize), we call
>>>> napi_disable() on the receive queue's napi. In delayed refill_work, it
>>>> also calls napi_disable() on the receive queue's napi. This can leads to
>>>> deadlock when napi_disable() is called on an already disabled napi. This
>>>> scenario can be reproducible by binding a XDP socket to virtio-net
>>>> interface without setting up the fill ring. As a result, try_fill_recv
>>>> will fail until the fill ring is set up and refill_work is scheduled.
>>>
>>> So, what is the problem? The refill_work is waiting? As I know, that thread
>>> will sleep some time, so the cpu can do other work.
>>
>> When napi_disable is called on an already disabled napi, it will sleep
>> in napi_disable_locked while still holding the netdev_lock. As a result,
>> later napi_enable gets stuck too as it cannot acquire the netdev_lock.
>> This leads to refill_work and the pause-then-resume tx are stuck altogether.
> 
> This needs to be added to the chagelog. And it looks like this is a fix for
> 
> commit 413f0271f3966e0c73d4937963f19335af19e628
> Author: Jakub Kicinski <kuba@kernel.org>
> Date:   Tue Jan 14 19:53:14 2025 -0800
> 
>     net: protect NAPI enablement with netdev_lock()
> 
> ?
> 
> I wonder if it's simpler to just hold the netdev lock in resize or xsk
> binding instead of this.

Setting:

	dev->request_ops_lock = true;

in virtnet_probe() before calling register_netdevice() should achieve
the above. Could you please have a try?

Thanks,

Paolo

