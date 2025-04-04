Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B88E19995D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 08:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743755866; cv=none; b=hFXJnAGcaXpniVtclD8v0INQnQsoqDg8XY6qGQR1sbRuMYIhgdZMPBHuxfsVOIedAOxRqXc+jot+eQhfl++HyrT3JXOT79t7HgUAf48zJ52K4C7NvwzO0Wd79kjwV0yFXsqz4q+0cda4A6FyjYaAU4deb4PcHbjYc5454XhGZWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743755866; c=relaxed/simple;
	bh=QAhyu4E7HQ19zzaz86rUGI9nPrmZDX3iMt2qJViTveA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KXrqctbXOqDJr1wEeO7o3K8CedISjcP8QypVY3jwMo6TapBYqIDFpuSLJ4iGpYifs1IOx3lKNx9Rv/4/AeP4DkgUXA0evqBbqmUhOt1OR0qwcW/Dm4yNUsCMl4mxGCiU6ux3qRsJYu+UdsiSYd9xkQLwYgFnAgBWpo4roPr1JCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=McSve8l1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="McSve8l1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743755863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OI1Zt3NFcFi/P6TNraRk0oZkTYZ+LV6TSig6Xx970e4=;
	b=McSve8l1yAtjAIJGkbT24GjnRJmi/TAnGmIC45h82EM7zuGHzwa2EM3+CvZ84RKxCLfydX
	/7zg7w7M+KUPLqEn/cN5WTPGEes5tQX3n9I0Q+O6vyFlxJJEzwcUWL7Kp4sHMKrevD23Js
	4E9iHYD0O0ek6pMIYC+71OglSxIkK5A=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-266-oiBp9rD5PGCwavJoh4vFGA-1; Fri, 04 Apr 2025 04:37:41 -0400
X-MC-Unique: oiBp9rD5PGCwavJoh4vFGA-1
X-Mimecast-MFC-AGG-ID: oiBp9rD5PGCwavJoh4vFGA_1743755861
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3914608e90eso1175182f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 01:37:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743755860; x=1744360660;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OI1Zt3NFcFi/P6TNraRk0oZkTYZ+LV6TSig6Xx970e4=;
        b=qqC80UHl3dbvKj+uOWyLGRU7QAf2t3endayG+Ap5jvFQmGNnO+xYTMwCwSCbxZwMse
         RLbvyBx+a/MsJY58Luphm92DkeFJOYaW6P2nROVvkJIr9UUTfponu1R2oitZyMuwjoDM
         UV6yFcvHcYdPxniWpsoxVsNJzT19ygpsSZveZ45LzmO/H/is/Hh7xag7HoxdAbCYPIYI
         IVVtC/yOwq1dqqJRLhYHh8KEsQtUrV1LoYIz3RpxWI0YwOqYtaiulLCrQGkS6ZMZQQeh
         JW2nbZO3A+a/Svcm4qIZbB5UbEsn4TkGxGz8JI+WQH14blh6gpuK8mZoHqF3u7d2X6lB
         WuTw==
X-Forwarded-Encrypted: i=1; AJvYcCVPQRNQk9xM/MIuuq4ZTUKsj0hu70SRgw/rL/bhp97uVXaBrspldfngQQ7D6eswc8E/KEUTR3Oj8HaO1cQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVb2SkiJmywDssDAmFfgS5AVx6w1zJDz4N8GH7cvNDPEJr8Xwk
	R736KZumKgTM52UvD5RM+Q2+b5JeHIqyD3bY/XouXi6TrRITw7ZRInFim1tGNAKdhIp1ATcKycd
	hAy0ro74xBHbwXmuvNUDun0++vbvDIDkxVkZe9tuLLCPMbSJjLFmfskpnxUuaGA==
X-Gm-Gg: ASbGnctfacp/hs8xtrXNKhnnXmGhyM8O5RNVvqC/t7UD7DDB9MiYWb/HvIYFP4zjdcM
	/KhVMQx1Yq6K7OkXTOQ4ZZocauhoWdtvC+c/VKb1vp2Do/excwWiMenER7HdA7FLX3MWMbYUo8W
	deq2WpJUrdJ9Nlq3MAOTcB30eEa5oS1dPtYR26sqPDL2BQZuxp6ZlLnVjn2EgZ0Ui9aJTzXRwO5
	8fcKmuFHymnYx0NHgQU61wSDfy3OpCyZDnCLdOUT6vu5KmUda6WwM9WfGtWaK1awlATxcS2YPgP
	jDxwSfiJEA==
X-Received: by 2002:a05:6000:430c:b0:391:2e31:c7e5 with SMTP id ffacd0b85a97d-39cb36b2ab2mr2013767f8f.6.1743755860543;
        Fri, 04 Apr 2025 01:37:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEeh87271OU/aKTaskLblwGps7bO+cJZTClXWXzF8apC0wBecu3MvRM0wP/QWFDltqL8vhYdA==
X-Received: by 2002:a05:6000:430c:b0:391:2e31:c7e5 with SMTP id ffacd0b85a97d-39cb36b2ab2mr2013743f8f.6.1743755860159;
        Fri, 04 Apr 2025 01:37:40 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a7225sm3768866f8f.26.2025.04.04.01.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 01:37:39 -0700 (PDT)
Date: Fri, 4 Apr 2025 04:37:36 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Alexander Graf <graf@amazon.com>, Stefan Hajnoczi <stefanha@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux.dev, kvm@vger.kernel.org,
	Asias He <asias@redhat.com>, Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S . Miller" <davem@davemloft.net>, nh-open-source@amazon.com
Subject: Re: [PATCH v2] vsock/virtio: Remove queued_replies pushback logic
Message-ID: <20250404043326-mutt-send-email-mst@kernel.org>
References: <20250401201349.23867-1-graf@amazon.com>
 <20250402161424.GA305204@fedora>
 <20250403073111-mutt-send-email-mst@kernel.org>
 <32ca5221-5b25-4bfd-acd7-9eebae8c3635@amazon.com>
 <20250404041050-mutt-send-email-mst@kernel.org>
 <fiyxlnv7gglcfkr7ue4tiaktqjptdkr5or6skrr6f7dof26d56@wmg3zhhqlcoj>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fiyxlnv7gglcfkr7ue4tiaktqjptdkr5or6skrr6f7dof26d56@wmg3zhhqlcoj>

On Fri, Apr 04, 2025 at 10:30:43AM +0200, Stefano Garzarella wrote:
> On Fri, Apr 04, 2025 at 04:14:51AM -0400, Michael S. Tsirkin wrote:
> > On Fri, Apr 04, 2025 at 10:04:38AM +0200, Alexander Graf wrote:
> > > 
> > > On 03.04.25 14:21, Michael S. Tsirkin wrote:
> > > > On Wed, Apr 02, 2025 at 12:14:24PM -0400, Stefan Hajnoczi wrote:
> > > > > On Tue, Apr 01, 2025 at 08:13:49PM +0000, Alexander Graf wrote:
> > > > > > Ever since the introduction of the virtio vsock driver, it included
> > > > > > pushback logic that blocks it from taking any new RX packets until the
> > > > > > TX queue backlog becomes shallower than the virtqueue size.
> > > > > >
> > > > > > This logic works fine when you connect a user space application on the
> > > > > > hypervisor with a virtio-vsock target, because the guest will stop
> > > > > > receiving data until the host pulled all outstanding data from the VM.
> > > > > >
> > > > > > With Nitro Enclaves however, we connect 2 VMs directly via vsock:
> > > > > >
> > > > > >    Parent      Enclave
> > > > > >
> > > > > >      RX -------- TX
> > > > > >      TX -------- RX
> > > > > >
> > > > > > This means we now have 2 virtio-vsock backends that both have the pushback
> > > > > > logic. If the parent's TX queue runs full at the same time as the
> > > > > > Enclave's, both virtio-vsock drivers fall into the pushback path and
> > > > > > no longer accept RX traffic. However, that RX traffic is TX traffic on
> > > > > > the other side which blocks that driver from making any forward
> > > > > > progress. We're now in a deadlock.
> > > > > >
> > > > > > To resolve this, let's remove that pushback logic altogether and rely on
> > > > > > higher levels (like credits) to ensure we do not consume unbounded
> > > > > > memory.
> > > > > The reason for queued_replies is that rx packet processing may emit tx
> > > > > packets. Therefore tx virtqueue space is required in order to process
> > > > > the rx virtqueue.
> > > > >
> > > > > queued_replies puts a bound on the amount of tx packets that can be
> > > > > queued in memory so the other side cannot consume unlimited memory. Once
> > > > > that bound has been reached, rx processing stops until the other side
> > > > > frees up tx virtqueue space.
> > > > >
> > > > > It's been a while since I looked at this problem, so I don't have a
> > > > > solution ready. In fact, last time I thought about it I wondered if the
> > > > > design of virtio-vsock fundamentally suffers from deadlocks.
> > > > >
> > > > > I don't think removing queued_replies is possible without a replacement
> > > > > for the bounded memory and virtqueue exhaustion issue though. Credits
> > > > > are not a solution - they are about socket buffer space, not about
> > > > > virtqueue space, which includes control packets that are not accounted
> > > > > by socket buffer space.
> > > >
> > > > Hmm.
> > > > Actually, let's think which packets require a response.
> > > >
> > > > VIRTIO_VSOCK_OP_REQUEST
> > > > VIRTIO_VSOCK_OP_SHUTDOWN
> > > > VIRTIO_VSOCK_OP_CREDIT_REQUEST
> > > >
> > > >
> > > > the response to these always reports a state of an existing socket.
> > > > and, only one type of response is relevant for each socket.
> > > >
> > > > So here's my suggestion:
> > > > stop queueing replies on the vsock device, instead,
> > > > simply store the response on the socket, and create a list of sockets
> > > > that have replies to be transmitted
> > > >
> > > >
> > > > WDYT?
> > > 
> > > 
> > > Wouldn't that create the same problem again? The socket will eventually push
> > > back any new data that it can take because its FIFO is full. At that point,
> > > the "other side" could still have a queue full of requests on exactly that
> > > socket that need to get processed. We can now not pull those packets off the
> > > virtio queue, because we can not enqueue responses.
> > 
> > Either I don't understand what you wrote or I did not explain myself
> > clearly.
> 
> I didn't fully understand either, but with this last message of yours it's
> clear to me and I like the idea!
> 
> > 
> > In this idea there needs to be a single response enqueued
> > like this in the socket, because, no more than one ever needs to
> > be outstanding per socket.
> > 
> > For example, until VIRTIO_VSOCK_OP_REQUEST
> > is responded to, the socket is not active and does not need to
> > send anything.
> 
> One case I see is responding when we don't have the socket listening (e.g.
> the port is not open), so if before the user had a message that the port was
> not open, now instead connect() will timeout. So we could respond if we have
> space in the virtqueue, otherwise discard it without losing any important
> information or guarantee of a lossless channel.
> 
> So in summary:
> 
> - if we have an associated socket, then always respond (possibly
>   allocating memory in the intermediate queue if the virtqueue is full
>   as we already do). We need to figure out if a flood of
>   VIRTIO_VSOCK_OP_CREDIT_REQUEST would cause problems, but we can always
>   decide not to respond if we have sent this identical information
>   before.

If taking this path, need to consider not responding is within spec or not.
But again, credit update needed is just a single flag we need to set
on a socket. If we have anything we need to send, it can also update
the credits.


> - if there is no associated socket, we only respond if virtqueue has
>   space.
> 
> I like it and it seems feasible without changing anything in the
> specification.
> 
> Did I get it right?
> 
> Thanks,
> Stefano

That was the idea, yes.

-- 
MST

