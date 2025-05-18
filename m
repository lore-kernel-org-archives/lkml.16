Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702262AE6F
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 21:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747604104; cv=none; b=aVVrJt2C52lFESW9YqxbyWIrshLh+A3Y+jH+XbHTAAxt4+XLrCmw7FGHooBn8cNHD3ZAzmeIeztk0u77Ha9YMfD92+uuK8AeATyjaXfoZVKKmz4hbvl6VetReAd4b2Iv8NMBQX1rlrsHVq6slOyZE/umkB6Gd4dLkPuI8XSoND4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747604104; c=relaxed/simple;
	bh=i0UDS7ryfYcPCMwpdiJCN/3dodGTDQwtvPmmnU5MzBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sl9XYS94hywgek2mq8VdRBZm5pS8eeUZPj9qPeH6qN5X9kO/unoqZKfapsXMTE+Ut4OwxlxY0baSWDhRuGtHb8MN1ocCkw/CkhJySRLtzw5Op46YrXtFhvsy3EWGzsQxqc3msDOEedrum+nUVvaEn8yYau0/HK2EgKTNFIDt2l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NST0I6VL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NST0I6VL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747604101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HAhV+nhTtB3oWTNdnOV38bF76ng9ASrCOJfLirGrigw=;
	b=NST0I6VLRt9/PLIVQieLr93Ca4j9e72GHuxmC/zn40nqPrgDYIguOWW5qNds+1mO9gghdv
	4eUn1XajAjnfiDSwR55NofNkm9zPWH9QbQ6x9v4NXZgYacuta0RtncieSUWQmB+eelkWh7
	xwYReL4CiTqmO4fo/YH0PZWn3gw1Jqo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-142-lPJyAOSeMruZ-vabEcsOnQ-1; Sun, 18 May 2025 17:34:59 -0400
X-MC-Unique: lPJyAOSeMruZ-vabEcsOnQ-1
X-Mimecast-MFC-AGG-ID: lPJyAOSeMruZ-vabEcsOnQ_1747604099
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-441c96c1977so27162825e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 14:34:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747604098; x=1748208898;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HAhV+nhTtB3oWTNdnOV38bF76ng9ASrCOJfLirGrigw=;
        b=UrttAuE3S1ugGJt3e+Sl4kVc99MFHotCcWNHr2Y29a6iuzMF/CZ045x4YJuI9akjy6
         0ILJLaUzkTtKBjboqR+l4/h1eMO75h0McvAFTgnf634kDEvpZH4VmOaXGKfVFFZYxCBB
         Igl+tDsH6h0PZ9lIOVYITvfEYYXp3t3dwq7ppmlWAgZAff6mJ78UgGoCI2Kny41mwGiD
         gUheiFNq5T7gh2+xiI7X0W7a+KFY8WVot/n6TCG+cnP/oWdLf20pw3F5quXejUNpxZyG
         MtaGUHWejs9WFqKP4/7wfY8PsdR2/RLW9WkhMd0fkpyTlGHyrE9RWVSKo+KxcnUAMcyV
         CNQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzqaqBEhPIbjw2F1cBeZiisLBL9O9xlaTcZcjS/q3iBIEwPPYmE86HKc8nQALhgRuwWs5oTGFIQoUDdVI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnG82+LSdR9SK+pXsjoifBshhmpk1W85bLBXdwS7mN1MZqWpTp
	2jcb6+B2rm3SUjjF/C+O4cvSR0FsX0Q7OV9cP7nbTyox/hIZXGnzqcyi7xVap+d/+Zj6fuIi3gv
	3yKnwdaOVisnQ4tVt8VjYM1BwhUU6wUNVTS58SRrGqB2HaxnZqClYCOsc9xCVUXcLKA==
X-Gm-Gg: ASbGncuYIF0SWIPaJiRQIlpSfqFPnH8NUlj3J59OI1/e8UV+OdaKjkyIOm7eR4wvE3t
	8i3E30iw3tKlaUg754ItTPSiXETFqaOxozfv189ZXzWz6oXFtiLw/dTLV2WwfOKZzKPv/G1/lFa
	XhKiqwLjZU3lri1NkYR08BbMn5uc6On666MSR4QhkNIRBHyGD79M/ZRxW6A11VOURQ/fr1KyRi3
	QmF48nnUFzzKnArIdKxmbej44rQZXPpPBc7vn31MeB1E4AyI6+DLhOnOzyHfZVULwjoCw2LEFgY
	HaamSA==
X-Received: by 2002:a05:600c:890b:b0:442:ffaa:6681 with SMTP id 5b1f17b1804b1-442ffaa6b6fmr59316765e9.28.1747604098620;
        Sun, 18 May 2025 14:34:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1oH302delN9nxpqrLIprfMWk3Ho5eH4z0R+50eE4GeFmN2TZ6xrwqN7ULXYhrVRrz8ClBGw==
X-Received: by 2002:a05:600c:890b:b0:442:ffaa:6681 with SMTP id 5b1f17b1804b1-442ffaa6b6fmr59316695e9.28.1747604098314;
        Sun, 18 May 2025 14:34:58 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f9053b4dsm144106535e9.4.2025.05.18.14.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 14:34:57 -0700 (PDT)
Date: Sun, 18 May 2025 17:34:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: Lei Yang <leiyang@redhat.com>, Jason Wang <jasowang@redhat.com>,
	xuanzhuo@linux.alibaba.com, virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/19] virtio_ring in order support
Message-ID: <20250518173443-mutt-send-email-mst@kernel.org>
References: <20250324054333.1954-1-jasowang@redhat.com>
 <CAPpAL=x4BWNh__YpzkzpErkseh04FT7WNLmg=xMXtfZ0S9BabQ@mail.gmail.com>
 <CAJaqyWdtKEYiY2tBB0F477LqxVs8fzaix96551WSMa=KdT3C5Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJaqyWdtKEYiY2tBB0F477LqxVs8fzaix96551WSMa=KdT3C5Q@mail.gmail.com>

On Wed, Mar 26, 2025 at 07:39:47AM +0100, Eugenio Perez Martin wrote:
> On Mon, Mar 24, 2025 at 3:44 PM Lei Yang <leiyang@redhat.com> wrote:
> >
> > QE tested this series of patches with virtio-net regression tests,
> > everything works fine.
> >
> 
> Hi Lei,
> 
> Is it possible to test this series also with virtio-net-pci,...,in_order=on?
> 
> Thanks!


Lei, what do you think?

> > Tested-by: Lei Yang <leiyang@redhat.com>
> >
> > On Mon, Mar 24, 2025 at 1:45 PM Jason Wang <jasowang@redhat.com> wrote:
> > >
> > > Hello all:
> > >
> > > This sereis tries to implement the VIRTIO_F_IN_ORDER to
> > > virtio_ring. This is done by introducing virtqueue ops so we can
> > > implement separate helpers for different virtqueue layout/features
> > > then the in-order were implmeented on top.
> > >
> > > Tests shows 5% imporvemnt in RX PPS with KVM guest + testpmd on the
> > > host.
> > >
> > > Please review.
> > >
> > > Thanks
> > >
> > > Jason Wang (19):
> > >   virtio_ring: rename virtqueue_reinit_xxx to virtqueue_reset_xxx()
> > >   virtio_ring: switch to use vring_virtqueue in virtqueue_poll variants
> > >   virtio_ring: unify logic of virtqueue_poll() and more_used()
> > >   virtio_ring: switch to use vring_virtqueue for virtqueue resize
> > >     variants
> > >   virtio_ring: switch to use vring_virtqueue for virtqueue_kick_prepare
> > >     variants
> > >   virtio_ring: switch to use vring_virtqueue for virtqueue_add variants
> > >   virtio: switch to use vring_virtqueue for virtqueue_add variants
> > >   virtio_ring: switch to use vring_virtqueue for enable_cb_prepare
> > >     variants
> > >   virtio_ring: use vring_virtqueue for enable_cb_delayed variants
> > >   virtio_ring: switch to use vring_virtqueue for disable_cb variants
> > >   virtio_ring: switch to use vring_virtqueue for detach_unused_buf
> > >     variants
> > >   virtio_ring: use u16 for last_used_idx in virtqueue_poll_split()
> > >   virtio_ring: introduce virtqueue ops
> > >   virtio_ring: determine descriptor flags at one time
> > >   virtio_ring: factor out core logic of buffer detaching
> > >   virtio_ring: factor out core logic for updating last_used_idx
> > >   virtio_ring: move next_avail_idx to vring_virtqueue
> > >   virtio_ring: factor out split indirect detaching logic
> > >   virtio_ring: add in order support
> > >
> > >  drivers/virtio/virtio_ring.c | 856 ++++++++++++++++++++++++++---------
> > >  1 file changed, 653 insertions(+), 203 deletions(-)
> > >
> > > --
> > > 2.42.0
> > >
> > >
> >

