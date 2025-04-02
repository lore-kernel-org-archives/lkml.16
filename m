Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895F923908C
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 13:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743600389; cv=none; b=EcQ+VIlVKp8hnscK7/BoaRauzHzpSCuO/nLOibFrvjwibaL3kw3KtHgZvCD153gqbs8gqwxrbpTO0V5ec3Kvuxn5jVuGDiOMWFAGxtYzyVmMclkXGwhkVzJ7fcVHDqALFtO553XyR9RN/UJdUcNODZIBGYb8tt2soVeF7V1bnlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743600389; c=relaxed/simple;
	bh=y7aDu52OtjP82L/t8qz2xzSOvpOmNkeVv0GRqHlG5Og=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ffrMyUdy7pUMwWzmWq9mWvanun2CvdvlQ+fXIffwFTz073XywDDt1M9qFEHjGipbFIOc2qm+RvvpvfSMlANShfWmtKJKn8uZQRQUQHDVQ+R21U5Fgn7iI0xcNYpT8hF8roAHX5H2DA0aEV78N6WCB9t5kq6oHp6DU+t8BRhJG9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TTB1G5Sp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TTB1G5Sp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743600385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6110eyhDOYjIRZ5MJbmf8dHwQ9jqIHg+d8375Mf4B3A=;
	b=TTB1G5Sp3cB3vlh9ypJem9K8UQo87FAAB5GPc4ePAXktUQsRoRkiE+DP3j0DzGaJaaLv9T
	gvyeII1M4LSB42NF/tmJaH+lqaIOnOVf7KJnhQuuPll2Tlv0CO84kf9Eq6XyjoU2H6l2cV
	fLiCco0pHdOVtFIAGg2eGqqio2dBsmQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-Z0LgZb9oOtG7t8bTTFojOQ-1; Wed, 02 Apr 2025 09:26:24 -0400
X-MC-Unique: Z0LgZb9oOtG7t8bTTFojOQ-1
X-Mimecast-MFC-AGG-ID: Z0LgZb9oOtG7t8bTTFojOQ_1743600383
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-39135d31ca4so535267f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 06:26:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743600383; x=1744205183;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6110eyhDOYjIRZ5MJbmf8dHwQ9jqIHg+d8375Mf4B3A=;
        b=JPzlm+EMT79o3n16rAQ9kx9EB5MAYCCLUkD5rUcnPB946rHGoO0KzWIGpFP4rrUplw
         dzEqGfVkJgB9n1o9xtn/QCVMGOq0cgJznHjxeMdlt/07zy66E7Rq8lvzLuqprNpzFk2c
         DLuUl7WYte1hRyEO77NBhD8w/clz2wvTWMdjWhWTSttCoCz+RyIUl7DVn1G4qsFZiet0
         jh63z3Eyst2aD3TBRn8O+PNj6sYp+pkmEJOSE5UjzGMnw62dux5plam9MKm99Zb09+5v
         w0csjZdoZX1nzNghDM52TiBB6DYqfXsf9ayAjQOWyZ/ROThiVYuvWS7hD+5jhUcHnEMx
         fw1g==
X-Forwarded-Encrypted: i=1; AJvYcCXhJZgkaYIz/FjfaDMWH4KhwWCoE2nWMmRrluJeRw/e+b9k1ySTxmvqTEddNMZHugEGUs6LCvEml3cuGls=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1VI458RCAS2FJmK1jxfSU+BLu7c7eTgcHMRhNVT/dawxoDTuA
	C02/Mo9f58OCyfw+r5oPKC5HArRmOI7Yy+/JOeg49Ffvzfesz3zVo0ZStB1FF+DsZcsbdRFAPQd
	/6s7bmvgcfmMRCNbCdux58nOiK3eZwQmuC+CWa7SDwlF4yGccFNBHUC4BBbOi7A==
X-Gm-Gg: ASbGncvArCXiyVUI7wokh8LY75arU4Q8I+Yw8xOPKl3aRWblmHZAoZnkTiIJo2y55yf
	+QDljjb4ZesCs5Ixq5XyIRjBHoKjXWzG2AGPpW2UCzBbk2Plq6okCnmA2jKmH32dAA3zclFBftN
	8tlMt9Cd8h7r8A6XiJYm+Y2Gr3s1AoK26Q08917EC7mTvvxHmlmmAxtZdkp/s8ywZ3gw0PN7ChG
	+EeegMY0lTq1OhOXqEXUZhjyquE81ADqKWjdVEid2rL88BYNs3k6gYpf0ZK3T5Vujtejfytrv+m
	ulxyBixHiw0H0GmhLTNE9vOlCMDMLM9133owdi71yC9imklsVIX05HUAck0=
X-Received: by 2002:a05:6000:22c6:b0:38d:b52d:e11c with SMTP id ffacd0b85a97d-39c2a677e96mr1839707f8f.15.1743600383062;
        Wed, 02 Apr 2025 06:26:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHW+mpa2QDuIfLk4f0y2/+06+UXRGWFHMhO1XRJbckZ1MK2jGpB/+Qi23vZe6cIC+p2ME0POw==
X-Received: by 2002:a05:6000:22c6:b0:38d:b52d:e11c with SMTP id ffacd0b85a97d-39c2a677e96mr1839679f8f.15.1743600382569;
        Wed, 02 Apr 2025 06:26:22 -0700 (PDT)
Received: from sgarzare-redhat (host-87-11-6-59.retail.telecomitalia.it. [87.11.6.59])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b658c87sm17171730f8f.9.2025.04.02.06.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 06:26:21 -0700 (PDT)
Date: Wed, 2 Apr 2025 15:26:17 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Simon Horman <horms@kernel.org>, Alexander Graf <graf@amazon.com>
Cc: netdev@vger.kernel.org, Stefan Hajnoczi <stefanha@redhat.com>, 
	linux-kernel@vger.kernel.org, virtualization@lists.linux.dev, kvm@vger.kernel.org, 
	Asias He <asias@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, 
	Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>, 
	Eric Dumazet <edumazet@google.com>, "David S . Miller" <davem@davemloft.net>, 
	nh-open-source@amazon.com
Subject: Re: [PATCH v2] vsock/virtio: Remove queued_replies pushback logic
Message-ID: <cumaux64rfyptgzo2ccvp55l5ha2g75z3kptdwbgwgjek6654x@dbavqjiinal3>
References: <20250401201349.23867-1-graf@amazon.com>
 <20250402092605.GJ214849@horms.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250402092605.GJ214849@horms.kernel.org>

On Wed, Apr 02, 2025 at 10:26:05AM +0100, Simon Horman wrote:
>On Tue, Apr 01, 2025 at 08:13:49PM +0000, Alexander Graf wrote:
>> Ever since the introduction of the virtio vsock driver, it included
>> pushback logic that blocks it from taking any new RX packets until the
>> TX queue backlog becomes shallower than the virtqueue size.
>>
>> This logic works fine when you connect a user space application on the
>> hypervisor with a virtio-vsock target, because the guest will stop
>> receiving data until the host pulled all outstanding data from the VM.
>>
>> With Nitro Enclaves however, we connect 2 VMs directly via vsock:
>>
>>   Parent      Enclave
>>
>>     RX -------- TX
>>     TX -------- RX
>>
>> This means we now have 2 virtio-vsock backends that both have the pushback
>> logic. If the parent's TX queue runs full at the same time as the
>> Enclave's, both virtio-vsock drivers fall into the pushback path and
>> no longer accept RX traffic. However, that RX traffic is TX traffic on
>> the other side which blocks that driver from making any forward
>> progress. We're now in a deadlock.
>>
>> To resolve this, let's remove that pushback logic altogether and rely on
>> higher levels (like credits) to ensure we do not consume unbounded
>> memory.
>>
>> RX and TX queues share the same work queue. To prevent starvation of TX
>> by an RX flood and vice versa now that the pushback logic is gone, let's
>> deliberately reschedule RX and TX work after a fixed threshold (256) of
>> packets to process.
>>
>> Fixes: 0ea9e1d3a9e3 ("VSOCK: Introduce virtio_transport.ko")
>> Signed-off-by: Alexander Graf <graf@amazon.com>
>> ---
>>  net/vmw_vsock/virtio_transport.c | 70 +++++++++-----------------------
>>  1 file changed, 19 insertions(+), 51 deletions(-)
>>
>> diff --git a/net/vmw_vsock/virtio_transport.c b/net/vmw_vsock/virtio_transport.c
>
>...
>
>> @@ -158,7 +162,7 @@ virtio_transport_send_pkt_work(struct work_struct *work)
>>  		container_of(work, struct virtio_vsock, send_pkt_work);
>>  	struct virtqueue *vq;
>>  	bool added = false;
>> -	bool restart_rx = false;
>> +	int pkts = 0;
>>
>>  	mutex_lock(&vsock->tx_lock);
>>
>> @@ -172,6 +176,12 @@ virtio_transport_send_pkt_work(struct work_struct *work)
>>  		bool reply;
>>  		int ret;
>>
>> +		if (++pkts > VSOCK_MAX_PKTS_PER_WORK) {
>> +			/* Allow other works on the same queue to run */
>> +			queue_work(virtio_vsock_workqueue, work);
>> +			break;
>> +		}
>> +
>>  		skb = virtio_vsock_skb_dequeue(&vsock->send_pkt_queue);
>>  		if (!skb)
>>  			break;
>
>Hi Alexander,
>
>The next non-blank line of code looks like this:
>
>		reply = virtio_vsock_skb_reply(skb);
>
>But with this patch reply is assigned but otherwise unused.

Thanks for the report!

>So perhaps the line above, and the declaration of reply, can be removed?

@Alex: yes, please remove it.

A part of that the rest LGTM!

I've been running some tests for a while and everything seems okay.

I guess we can do something similar also in vhost-vsock, where we 
already have "vhost weight" support. IIUC it was added later by commit 
e79b431fb901 ("vhost: vsock: add weight support"), but we never removed 
"queued_replies" stuff, that IMO after that commit is pretty much 
useless.

I'm not asking to that in this series, if you don't have time I can do 
it separately ;-)

Thanks,
Stefano

>
>Flagged by W=1 builds.
>
>> @@ -184,17 +194,6 @@ virtio_transport_send_pkt_work(struct work_struct *work)
>>  			break;
>>  		}
>>
>> -		if (reply) {
>> -			struct virtqueue *rx_vq = vsock->vqs[VSOCK_VQ_RX];
>> -			int val;
>> -
>> -			val = atomic_dec_return(&vsock->queued_replies);
>> -
>> -			/* Do we now have resources to resume rx processing? */
>> -			if (val + 1 == virtqueue_get_vring_size(rx_vq))
>> -				restart_rx = true;
>> -		}
>> -
>>  		added = true;
>>  	}
>>
>> @@ -203,9 +202,6 @@ virtio_transport_send_pkt_work(struct work_struct *work)
>>
>>  out:
>>  	mutex_unlock(&vsock->tx_lock);
>> -
>> -	if (restart_rx)
>> -		queue_work(virtio_vsock_workqueue, &vsock->rx_work);
>>  }
>>
>>  /* Caller need to hold RCU for vsock.
>
>...
>

