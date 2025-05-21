Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1C921FF55
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 08:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747817284; cv=none; b=IrtpW14du0LPfqN64Qh70t+t9qYRhClx6eGO48FVSeHyww17lTbTX5rxJAm2cgwWEDN79ZtPWnccoS9FFi0Tzto82LQBcaJwsvDAyX+0IdOgHuwlHZTQ90S7HsP/apWw32sKPxLssN+uwxH0rygPZPpbIWOmH6SUGmo4BvxsUrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747817284; c=relaxed/simple;
	bh=e3U9yFZ8fnoT/rbSlffadk7a6MtC1GxvpZTfuv0H73g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RSJOpvid/baxgl7LuHO8e6hL4pDXT5UQ+r9OGZLaMn1hYBmVRDz3aU5tHiqGuTlHGNa4am/HCcyAw0uoTwUPbCRjzb9FsEUFnyqKWMDBvAIDfnXz9NoQDXpSOm8yb8tq5PUrvZzFRlyG4ELmeq6nyHH1eFXoTJdZCJKh8tdXbg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dTm/Ok/O; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dTm/Ok/O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747817281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=NPyJfZU6esjYftTB7FY555Mgbdkf9fI4uXkZ64T9MM0=;
	b=dTm/Ok/OpbshfLwlQTFeh0eSUzNqMaQ3qDOGA5Pf87r06X2t6V4Q8ayzXFm+iuZf3S+iS0
	BY8ZLF2unoueSaeIdMTOc1HfspmW5r8Zpths+bMIBchJ+OifiFXscBSN5iPYiUNnadeRuS
	xnPlKiLNz3UyulMpRzQVvDjWrtgUyrA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-536-veRiEBYPPYO8lbFv4WQ6xQ-1; Wed, 21 May 2025 04:47:58 -0400
X-MC-Unique: veRiEBYPPYO8lbFv4WQ6xQ-1
X-Mimecast-MFC-AGG-ID: veRiEBYPPYO8lbFv4WQ6xQ_1747817277
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43ea256f039so51703685e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 01:47:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747817277; x=1748422077;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NPyJfZU6esjYftTB7FY555Mgbdkf9fI4uXkZ64T9MM0=;
        b=pRGofAOgpZo1qicd+reDTNJSJQsQPQP80HLGeDJTapdqoMuHCJOb52Mp94xyqF4wug
         hDLYrimadxjTtEGIYoCjfijhAUhZNF7P4j/k+oaxk0TM2bZpHB6dXQW9HDVtahFQ1dUe
         DD3NtKQy30qVz8+pVXaQbPkm/n5Nn7AxVDrz4tXqp9PQVuS/zdeV87cuBKf7j9xF0lSB
         BSfTreYEtcyMS6G+jP9YmmjChoGm6w9mkWM6B+mqgtuF58ackgzmN/jXiCI1Xb1m4Was
         x0iaW6Hs6mupfnwetOLqVS9Wa6FSndd9qVUV/eeRZByStxdqUnqzbPNLNScK31dkOwq4
         iHAA==
X-Forwarded-Encrypted: i=1; AJvYcCU5VdLFdbpNNvBNMV3Vre7+/emqs0zF3i2euhR3nX99ilwTzdJ1FBdy5HXC5q1ACEIWhoS/EvJbf9xHVjU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzD7Z7w4q2Pc8J6Bk1+flZI2vg0mwM+gty/vMf1fU66e5eO7U8z
	nlZiHs82QOUEisu4auQOL1eGZ33AzN8jg5SDl80XAbNXNmKyUxH1ccDr6jKn+FHg8orRIyw3BRF
	JQZhuVUWTHR8Xs9BXHKCnOBdSkGCmdwsS4xulreRKZZrG9bROZ2Fs6IlilJd2FJtlNg==
X-Gm-Gg: ASbGncuLPWP2qHho4mr4nmMmA8BVox+NILoh/11LdOMGseqiMGgnImee3LQbsEGokhZ
	0PcTjzJlZa/xdqbwHgHGgTtXpK8HRtq/UfBFyTYXyHq8xYSYEpFGsBfnidaEBrr8DLAXDy6Z4Sl
	CtCQMCQdA7cQoZjVcJqgM0yxDm3mz04vRYYN7iVGDl19EP6ak0Gg7U21J8fqC/Sqf6rQVaokPVb
	N4r7QKDOJRQyaTY2Tn7c2zt3D1y9usRzKz7sopYTHwSxAOQFlBbiW5sn5p2266ZvY9jyK9zNtVU
	YBQGDSVR33v2AyxdZvZwmkvFn4AkxmmHlcIVp0W4X6V0FWY2sQ==
X-Received: by 2002:a05:600c:628c:b0:43d:b32:40aa with SMTP id 5b1f17b1804b1-442fd60a536mr194434605e9.3.1747817277087;
        Wed, 21 May 2025 01:47:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFeIhX19ln1L5zb69S7/ie3tkjrx6/LCoh/olcSsAiYChGBcw5RtQbEibmhd+XOb3hwe2F3Q==
X-Received: by 2002:a05:600c:628c:b0:43d:b32:40aa with SMTP id 5b1f17b1804b1-442fd60a536mr194434415e9.3.1747817276734;
        Wed, 21 May 2025 01:47:56 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e10:ef90:343a:68f:2e91:95c? ([2a01:e0a:e10:ef90:343a:68f:2e91:95c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca5a5b4sm18733188f8f.21.2025.05.21.01.47.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 01:47:56 -0700 (PDT)
Message-ID: <f653cb76-d0ea-4ece-a14f-6e4379bc71d5@redhat.com>
Date: Wed, 21 May 2025 10:47:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] virtio_net: Enforce minimum TX ring size for
 reliability
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, Xuan Zhuo <xuanzhuo@linux.alibaba.com>
References: <20250520110526.635507-1-lvivier@redhat.com>
 <20250520110526.635507-3-lvivier@redhat.com>
 <CACGkMEudOrbPjwLbQKXeLc9K4oSq8vDH5YD-hbrsJn1aYK6xxQ@mail.gmail.com>
 <4085eec2-6d1c-4769-9b0e-5b5771b3e4bf@redhat.com>
 <20250521043819-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Laurent Vivier <lvivier@redhat.com>
Autocrypt: addr=lvivier@redhat.com; keydata=
 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
In-Reply-To: <20250521043819-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 21/05/2025 10:39, Michael S. Tsirkin wrote:
> On Wed, May 21, 2025 at 09:45:47AM +0200, Laurent Vivier wrote:
>> On 21/05/2025 03:01, Jason Wang wrote:
>>> On Tue, May 20, 2025 at 7:05 PM Laurent Vivier <lvivier@redhat.com> wrote:
>>>>
>>>> The `tx_may_stop()` logic stops TX queues if free descriptors
>>>> (`sq->vq->num_free`) fall below the threshold of (2 + `MAX_SKB_FRAGS`).
>>>> If the total ring size (`ring_num`) is not strictly greater than this
>>>> value, queues can become persistently stopped or stop after minimal
>>>> use, severely degrading performance.
>>>>
>>>> A single sk_buff transmission typically requires descriptors for:
>>>> - The virtio_net_hdr (1 descriptor)
>>>> - The sk_buff's linear data (head) (1 descriptor)
>>>> - Paged fragments (up to MAX_SKB_FRAGS descriptors)
>>>>
>>>> This patch enforces that the TX ring size ('ring_num') must be strictly
>>>> greater than (2 + MAX_SKB_FRAGS). This ensures that the ring is
>>>> always large enough to hold at least one maximally-fragmented packet
>>>> plus at least one additional slot.
>>>>
>>>> Reported-by: Lei Yang <leiyang@redhat.com>
>>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>>>> ---
>>>>    drivers/net/virtio_net.c | 6 ++++++
>>>>    1 file changed, 6 insertions(+)
>>>>
>>>> diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
>>>> index e53ba600605a..866961f368a2 100644
>>>> --- a/drivers/net/virtio_net.c
>>>> +++ b/drivers/net/virtio_net.c
>>>> @@ -3481,6 +3481,12 @@ static int virtnet_tx_resize(struct virtnet_info *vi, struct send_queue *sq,
>>>>    {
>>>>           int qindex, err;
>>>>
>>>> +       if (ring_num <= 2+MAX_SKB_FRAGS) {
>>>
>>> Nit: space is probably needed around "+"
>>
>> I agree, but I kept the original syntax used everywhere in the file. It
>> eases the search of the value in the file.
> 
> 
> it's a mixed bag:
> 
> drivers/net/virtio_net.c:       struct scatterlist sg[MAX_SKB_FRAGS + 2];
> drivers/net/virtio_net.c:       struct scatterlist sg[MAX_SKB_FRAGS + 2];
> drivers/net/virtio_net.c:       if (unlikely(len > MAX_SKB_FRAGS * PAGE_SIZE)) {
> drivers/net/virtio_net.c:       if (sq->vq->num_free < 2+MAX_SKB_FRAGS) {
> drivers/net/virtio_net.c:                       if (sq->vq->num_free >= 2+MAX_SKB_FRAGS) {
> drivers/net/virtio_net.c:       if (*num_buf > MAX_SKB_FRAGS + 1)
> drivers/net/virtio_net.c:       if (unlikely(num_skb_frags == MAX_SKB_FRAGS)) {
> drivers/net/virtio_net.c:               if (sq->vq->num_free >= 2 + MAX_SKB_FRAGS) {
> drivers/net/virtio_net.c:       if (sq->vq->num_free >= 2 + MAX_SKB_FRAGS) {
> drivers/net/virtio_net.c:               vi->big_packets_num_skbfrags = guest_gso ? MAX_SKB_FRAGS : DIV_ROUND_UP(mtu, PAGE_SIZE);
> 
> 
> we should fix it all. I think MAX_SKB_FRAGS + 2 is also cleaner than the
> weird 2 + syntax.

OK, I'm going to add a patch that will cleanup all this stuff.

Thanks,
Laurent

> 
> 
> 
>>>
>>>> +               netdev_err(vi->dev, "tx size (%d) cannot be smaller than %d\n",
>>>> +                          ring_num, 2+MAX_SKB_FRAGS);
>>>
>>> And here.
>>>
>>>> +               return -EINVAL;
>>>> +       }
>>>> +
>>>>           qindex = sq - vi->sq;
>>>>
>>>>           virtnet_tx_pause(vi, sq);
>>>> --
>>>> 2.49.0
>>>>
>>>
>>> Other than this.
>>>
>>> Acked-by: Jason Wang <jasowang@redhat.com>
>>>
>>> (Maybe we can proceed on don't stall if we had at least 1 left if
>>> indirect descriptors are supported).
>>
>> But in this case, how to know when to stall the queue?
>>
>> Thank,
>> Laurent
>>>
>>> Thanks
>>>
> 

