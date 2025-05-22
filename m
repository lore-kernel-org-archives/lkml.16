Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE3E482EF
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 01:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747878931; cv=none; b=YHfNrsBGXpEROTtgHS7H5E6WeJGWAPS3LEYdO6h1ni43QQxHZxNOZiLA3Z5WPr4GFKGLsJA+V6CW6YTAw6qqKzKuPYqtP/BkNx+KBkyTCO+uP2CgxG/LeapGDXYQERK4/ncXz6Tv32mg5HklQhf2iWBonoSXC0/YfBLMBI0P2aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747878931; c=relaxed/simple;
	bh=lTa/ncMxSJ23HEwwxo9vqj+1qB7P74qJQPqHqzNdht4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GKGQmYng59RG7W/vt6AbLNNlGBU8t3lNf2JZpU1NUlJHlhri4q/gxzT8YU06HS8DJeHJGWDVfi+q17en2X4LoWyq00N6K04a8lKR6gnHBFwoPyXFUJzy7eQeKOxPd+IB/aEx5PqAZ3/bcYsPuOqjExnPz7rEjLcoXRQgjm7iBso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZqjyS+UC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZqjyS+UC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747878928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5p6niAmsA49GKKuxaQzP63RobFGTOxmdcSlTneNzlWA=;
	b=ZqjyS+UC80w4E1r+v4yXlkdmqZl3gnvouSfklgJKCcU1PHtJ7FxN6EcU94AMeqCFsNIGxc
	q3SjuqsVJap9HlmXEWc9gu8KQGaFVHlEFgce37RWyKDnIvlilum4MEXEvyeoZHrhvt0aF/
	9h4bC7RXnp4desZFQ6PR9mCHNP7Uo04=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-EIvKSJ8gMb2G95ibPaI6tw-1; Wed, 21 May 2025 21:55:26 -0400
X-MC-Unique: EIvKSJ8gMb2G95ibPaI6tw-1
X-Mimecast-MFC-AGG-ID: EIvKSJ8gMb2G95ibPaI6tw_1747878926
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-30e7f19c8cfso8049883a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 18:55:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747878926; x=1748483726;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5p6niAmsA49GKKuxaQzP63RobFGTOxmdcSlTneNzlWA=;
        b=XfkQNuv3O0XWsudvool6JQ9EK9/V+CTTzPd0YpVrSzjZx1/fcACxlfPf8pp8X42BZy
         pjjP6oTWScKPsLebAcPA9CN2+NHrEgBeMtNia+juD5otuBOlluyOO3dTQCtveuvCnqKS
         1kmrfvfRrm5MC2RP/WnONTFvphnGNcPWqa9T/d/kPM+IMeoLyDNlBYD2jAjSbCmXvYJr
         m/6WQYalAp/rzhc7+dAEuveakZfoPBlSswnDVIQdEF9xG4wqr2SgqWhmcz7GKZ8hrwPp
         00VnN2/BJOZNUAstcU7Oo+IDfJUWEmAOwlf8Sde9xmvICqAke2JKsNiUbzcv2d8VwCYv
         2swQ==
X-Gm-Message-State: AOJu0YxmQgofaJ8EM3hSBdW2caFmbEWdiaTQZ+EXYnB0z+9Pcnxlj2vP
	7s+a6lFNB5SnbnbaU5rtZZhdNlZi4vrpJLB+oe9ooCqoUPvDoVzbk9sY+vntsBvD8Sz4O854SOO
	2rJ/TCjGIKx7z105+SIG14Wney5j802/mie8vTJriC6347kXrV0Ro4bmtUma8zRxM1FuD0J5otF
	VXorIqK05OhnxLj+wi8t0zr0yDq8u5N4ZOah+EDIs2
X-Gm-Gg: ASbGncvYqKWtfZGLzP7baflg/wf/FlMFEX4hhAkHN29GkYeiDk5HCWnagnMcLyDL736
	0coZUFjccq7WK5JmjOMBW5KWtwClW4l0uADJn492X8J7baD4aV/nv+ctOBH2snwylpgVbYw==
X-Received: by 2002:a17:90b:4b0f:b0:2f6:be57:49d2 with SMTP id 98e67ed59e1d1-30e7d545920mr40201618a91.17.1747878925637;
        Wed, 21 May 2025 18:55:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEZdAF/K3AxA6D+lZBWg1vtRPNFwaImx+KwrixRafFi2yqI13mXEGAuap0K+TLCkX4QpfLLC8MCWV91G2CgRs=
X-Received: by 2002:a17:90b:4b0f:b0:2f6:be57:49d2 with SMTP id
 98e67ed59e1d1-30e7d545920mr40201585a91.17.1747878925224; Wed, 21 May 2025
 18:55:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520110526.635507-1-lvivier@redhat.com> <20250520110526.635507-3-lvivier@redhat.com>
 <CACGkMEudOrbPjwLbQKXeLc9K4oSq8vDH5YD-hbrsJn1aYK6xxQ@mail.gmail.com> <4085eec2-6d1c-4769-9b0e-5b5771b3e4bf@redhat.com>
In-Reply-To: <4085eec2-6d1c-4769-9b0e-5b5771b3e4bf@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 22 May 2025 09:55:13 +0800
X-Gm-Features: AX0GCFsI-RHUVMOpNpFz6B59ePV0fkZx_9XGRIMqoQe4ffj9q7Qt8i8HQBzGKic
Message-ID: <CACGkMEv7PczQpxY79jQ_EMwmRvhq8JFdr40UmzAoHOKV2OCRjQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] virtio_net: Enforce minimum TX ring size for reliability
To: Laurent Vivier <lvivier@redhat.com>
Cc: linux-kernel@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 3:45=E2=80=AFPM Laurent Vivier <lvivier@redhat.com>=
 wrote:
>
> On 21/05/2025 03:01, Jason Wang wrote:
> > On Tue, May 20, 2025 at 7:05=E2=80=AFPM Laurent Vivier <lvivier@redhat.=
com> wrote:
> >>
> >> The `tx_may_stop()` logic stops TX queues if free descriptors
> >> (`sq->vq->num_free`) fall below the threshold of (2 + `MAX_SKB_FRAGS`)=
.
> >> If the total ring size (`ring_num`) is not strictly greater than this
> >> value, queues can become persistently stopped or stop after minimal
> >> use, severely degrading performance.
> >>
> >> A single sk_buff transmission typically requires descriptors for:
> >> - The virtio_net_hdr (1 descriptor)
> >> - The sk_buff's linear data (head) (1 descriptor)
> >> - Paged fragments (up to MAX_SKB_FRAGS descriptors)
> >>
> >> This patch enforces that the TX ring size ('ring_num') must be strictl=
y
> >> greater than (2 + MAX_SKB_FRAGS). This ensures that the ring is
> >> always large enough to hold at least one maximally-fragmented packet
> >> plus at least one additional slot.
> >>
> >> Reported-by: Lei Yang <leiyang@redhat.com>
> >> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> >> ---
> >>   drivers/net/virtio_net.c | 6 ++++++
> >>   1 file changed, 6 insertions(+)
> >>
> >> diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> >> index e53ba600605a..866961f368a2 100644
> >> --- a/drivers/net/virtio_net.c
> >> +++ b/drivers/net/virtio_net.c
> >> @@ -3481,6 +3481,12 @@ static int virtnet_tx_resize(struct virtnet_inf=
o *vi, struct send_queue *sq,
> >>   {
> >>          int qindex, err;
> >>
> >> +       if (ring_num <=3D 2+MAX_SKB_FRAGS) {
> >
> > Nit: space is probably needed around "+"
>
> I agree, but I kept the original syntax used everywhere in the file. It e=
ases the search
> of the value in the file.
>
> >
> >> +               netdev_err(vi->dev, "tx size (%d) cannot be smaller th=
an %d\n",
> >> +                          ring_num, 2+MAX_SKB_FRAGS);
> >
> > And here.
> >
> >> +               return -EINVAL;
> >> +       }
> >> +
> >>          qindex =3D sq - vi->sq;
> >>
> >>          virtnet_tx_pause(vi, sq);
> >> --
> >> 2.49.0
> >>
> >
> > Other than this.
> >
> > Acked-by: Jason Wang <jasowang@redhat.com>
> >
> > (Maybe we can proceed on don't stall if we had at least 1 left if
> > indirect descriptors are supported).
>
> But in this case, how to know when to stall the queue?

I meant something like:

        if (sq->vq->num_free < virito_has_feature(INDIRECT) ? 1 :
2+MAX_SKB_FRAGS) {
        }

This might be useful for the case where MAX_SKB_FRAGS is greater than
17 as well.

(But it's an independent topic anyhow)

Thanks

>
> Thank,
> Laurent
> >
> > Thanks
> >
>

