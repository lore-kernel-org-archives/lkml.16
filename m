Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E72134CB
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 01:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748309242; cv=none; b=Upju5S98FDGBm78aNgc6yzyxPfWkLrTS1hjUY4cmzzZbPj4ZzqpAmUGHNFWQlmBemwGcx1fzWUMsgYPXNmc7WuLPLF+zfAumISLtU5sufFWaEZQZNKwykEA7PlTHyauCwvjNTBTSS0BLnpKFOaNtMGgL/omNcefM6lPgEsSs1uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748309242; c=relaxed/simple;
	bh=FFKS18dYV5Y8MHYJB2kMbWfKFB4Nsx/TPtY/OyRPyFU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hLLuiDPLQkFtFjtytQMoAEGg9FxRNNDF8t8sautQoYs9LYUOoLozmuQEh/U0g60uyTVr12w2zwu5HYT4rRx5EGYP8M5um7UI7UTrs/FjYf9rcpkuFEJWRNdBOF2l+jWUIScGNaBqM1+hA2IqGOIG4TW0AQ0q3c4TisynB6n/CAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bn65vfV2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bn65vfV2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748309238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3x4oTme+lZoqSj5iXtS0M9usiPX4bxGfp/DJRe7z3no=;
	b=bn65vfV2ryzuOSan4szidsY3WurX5wbW6zLQ2dbE2eDCDNMVx8tatChA0qWGWQjCfZ3Eov
	fitJnF7loX8kmhas21e1rFQbqEtwKtyDuTS+/FqJTme9cOIUhsBfqRfMOw0PSDV6mzBmjc
	fGpPxnwJazDNt6CM5WmPRIO11Xu7NFU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-mciw8MSWPMGDrJ7-nzXBVw-1; Mon, 26 May 2025 21:27:17 -0400
X-MC-Unique: mciw8MSWPMGDrJ7-nzXBVw-1
X-Mimecast-MFC-AGG-ID: mciw8MSWPMGDrJ7-nzXBVw_1748309236
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-acf00f500d2so179132766b.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 18:27:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748309236; x=1748914036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3x4oTme+lZoqSj5iXtS0M9usiPX4bxGfp/DJRe7z3no=;
        b=hDai+wEfMZLrDAOzIE6xCpePFnwkW+hNZruFsDbVjekj6vZQVZcf3zSQxoFHfJDFYR
         +HkCYhUsza6T8Iv7KzkAOFCi1avYsnJSxe1fa54QIOVQawgYM0lR0INsZhR2AEHLJHSs
         J8vGKg0rg9uZtCL0qgr0OlXTEkvsRTz5kCxYRCbKjGjU8oiKCGcjlBcLz6v9MAdvbOVh
         sgeGNtr/LSLlBQF/g+SLzP0Hsc22bgmHLzHmR1ZEyZDjtCDhSHKCem7J0DasVJshTy8l
         TpRCN+TsE41hkwBBtQAraOopzfDWUbNZ2K7mi4vGOozJrePfntwejE+i+vXI4kRKY6CG
         MG2Q==
X-Forwarded-Encrypted: i=1; AJvYcCU7I0+p9XQtbpQaxhJTHlcnoDa+2ANgjZ23ihBlSjZOk5Owg0j+FK9TwRSK41WE7+c+X28HP5yjujwWZGQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyX+2dZZKU5E26QyrYhcApF19cMWKoJfa5UdYE7qkSTVXwgcZr9
	dbpiqFZjIax2GoABpLWImk01Wr6B/nvT/XYI0ngSuw7/WdYyrs3mfx1a4PVBTTehTJZrtI3Jxn/
	85O7luiNUS0w0YxfPnhJ5zmCm9iv2FFTxtixBWCzlCGUympJ4D9+qemjD6MacL6JJEd8lH/IPaa
	3rO5IGLKGnHfBLpiZcBah9FEWgs6+qEjhsSC0Kl5jK
X-Gm-Gg: ASbGncv6q0geFdAbLEsAAERHyRTL+JHTbcd5dedQ0niLseNFoQhk4wScC3XSSHB8VSo
	mpGkK4JFTDxet3XQrUNkUdnYXEyB/9GUKIXpgh/t+78IP9JeqNfKEKDqtzXU+nT4e/AHVDw==
X-Received: by 2002:a17:907:c26:b0:ad4:fb9a:ab36 with SMTP id a640c23a62f3a-ad85b03b2a7mr1022781266b.5.1748309235939;
        Mon, 26 May 2025 18:27:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGoNFm7L9s5ZKvOxaLRZiEkKRCVhf+AcjOxcEfulOX78/o+U1rspOYdTK2k8m/1vEqOWfjdxnI22a2qLEer4Sk=
X-Received: by 2002:a17:907:c26:b0:ad4:fb9a:ab36 with SMTP id
 a640c23a62f3a-ad85b03b2a7mr1022780266b.5.1748309235570; Mon, 26 May 2025
 18:27:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250324054333.1954-1-jasowang@redhat.com> <CAPpAL=x4BWNh__YpzkzpErkseh04FT7WNLmg=xMXtfZ0S9BabQ@mail.gmail.com>
 <CAJaqyWdtKEYiY2tBB0F477LqxVs8fzaix96551WSMa=KdT3C5Q@mail.gmail.com>
 <20250518173443-mutt-send-email-mst@kernel.org> <CAPpAL=zhKD7q3OmcR9_nWqMXk1grz0gNJ2Wqk923k4i+kuMfgw@mail.gmail.com>
In-Reply-To: <CAPpAL=zhKD7q3OmcR9_nWqMXk1grz0gNJ2Wqk923k4i+kuMfgw@mail.gmail.com>
From: Lei Yang <leiyang@redhat.com>
Date: Tue, 27 May 2025 09:26:39 +0800
X-Gm-Features: AX0GCFulx4w1yysYV3ELshmY7Ct7E7TGXNXAtA90EnSMjyBRj3ZkTj5E7rSOd2g
Message-ID: <CAPpAL=x4vRMXFBvEpwrJv6xUZgYrgB41=d1qdDBzENp0NM4O1Q@mail.gmail.com>
Subject: Re: [PATCH 00/19] virtio_ring in order support
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Eugenio Perez Martin <eperezma@redhat.com>, Jason Wang <jasowang@redhat.com>, xuanzhuo@linux.alibaba.com, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 3:01=E2=80=AFPM Lei Yang <leiyang@redhat.com> wrote=
:
>
> On Mon, May 19, 2025 at 5:35=E2=80=AFAM Michael S. Tsirkin <mst@redhat.co=
m> wrote:
> >
> > On Wed, Mar 26, 2025 at 07:39:47AM +0100, Eugenio Perez Martin wrote:
> > > On Mon, Mar 24, 2025 at 3:44=E2=80=AFPM Lei Yang <leiyang@redhat.com>=
 wrote:
> > > >
> > > > QE tested this series of patches with virtio-net regression tests,
> > > > everything works fine.
> > > >
> > >
> > > Hi Lei,
> > >
> > > Is it possible to test this series also with virtio-net-pci,...,in_or=
der=3Don?

Virtio-net regression tested pass with virtio-net-pci,...,in_order=3Don.

Tested-by: Lei Yang <leiyang@redhat.com>
> > >
> > > Thanks!
> >
> >
> > Lei, what do you think?
>
>
> Sure,  I will test it and provide test results ASAP.
>
> Thanks
> Lei
> >
> >
> > > > Tested-by: Lei Yang <leiyang@redhat.com>
> > > >
> > > > On Mon, Mar 24, 2025 at 1:45=E2=80=AFPM Jason Wang <jasowang@redhat=
.com> wrote:
> > > > >
> > > > > Hello all:
> > > > >
> > > > > This sereis tries to implement the VIRTIO_F_IN_ORDER to
> > > > > virtio_ring. This is done by introducing virtqueue ops so we can
> > > > > implement separate helpers for different virtqueue layout/feature=
s
> > > > > then the in-order were implmeented on top.
> > > > >
> > > > > Tests shows 5% imporvemnt in RX PPS with KVM guest + testpmd on t=
he
> > > > > host.
> > > > >
> > > > > Please review.
> > > > >
> > > > > Thanks
> > > > >
> > > > > Jason Wang (19):
> > > > >   virtio_ring: rename virtqueue_reinit_xxx to virtqueue_reset_xxx=
()
> > > > >   virtio_ring: switch to use vring_virtqueue in virtqueue_poll va=
riants
> > > > >   virtio_ring: unify logic of virtqueue_poll() and more_used()
> > > > >   virtio_ring: switch to use vring_virtqueue for virtqueue resize
> > > > >     variants
> > > > >   virtio_ring: switch to use vring_virtqueue for virtqueue_kick_p=
repare
> > > > >     variants
> > > > >   virtio_ring: switch to use vring_virtqueue for virtqueue_add va=
riants
> > > > >   virtio: switch to use vring_virtqueue for virtqueue_add variant=
s
> > > > >   virtio_ring: switch to use vring_virtqueue for enable_cb_prepar=
e
> > > > >     variants
> > > > >   virtio_ring: use vring_virtqueue for enable_cb_delayed variants
> > > > >   virtio_ring: switch to use vring_virtqueue for disable_cb varia=
nts
> > > > >   virtio_ring: switch to use vring_virtqueue for detach_unused_bu=
f
> > > > >     variants
> > > > >   virtio_ring: use u16 for last_used_idx in virtqueue_poll_split(=
)
> > > > >   virtio_ring: introduce virtqueue ops
> > > > >   virtio_ring: determine descriptor flags at one time
> > > > >   virtio_ring: factor out core logic of buffer detaching
> > > > >   virtio_ring: factor out core logic for updating last_used_idx
> > > > >   virtio_ring: move next_avail_idx to vring_virtqueue
> > > > >   virtio_ring: factor out split indirect detaching logic
> > > > >   virtio_ring: add in order support
> > > > >
> > > > >  drivers/virtio/virtio_ring.c | 856 ++++++++++++++++++++++++++---=
------
> > > > >  1 file changed, 653 insertions(+), 203 deletions(-)
> > > > >
> > > > > --
> > > > > 2.42.0
> > > > >
> > > > >
> > > >
> >

