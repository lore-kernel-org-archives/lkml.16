Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BB913AA2E
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 07:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747897351; cv=none; b=N7mGyKYtqw2A+ABxWF79knjkjy8ftcfXb4rIqgYi5oufQ2g7xRx1yncyekyRxrUPT8MDd/x43P8M5Kc7qBBc7joigesN+dtxh+v5geM0+TWfYe0zM371VQ+ho2VLt3lhjjXcBuDll4Ks/mTiyXjhF8yg3ljcqf90XFdOVdHs6g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747897351; c=relaxed/simple;
	bh=b0LgYCJ+zS3Y4qZy5tIhukWCpc9KZHUh/mN5i260kEM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ATeTMlybTeCjkcT54U0CKNV1e6t/qfc733qQjR67kNEyxwdsomzAE97RDwDgsRy1rlpS3zjTA8x32kMpKkO3yTQR2vIEbBG98igxdmVjIG3RkPFMAQOINYn5G7JJcyyoLvlzfYPFh2ut1v3XsqTcW6MF9wwUf1TVZBqtGcRM/tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=drMO31Vs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="drMO31Vs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747897348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ag2ux448b2TruItxL58I3ryWzU9MIQdqPkcm2HcLdRo=;
	b=drMO31Vs2AliPOQjLgZg91CPoTrwOfSpTJ+mjrbrJkVRov2Oy1emk5EcOVnLtbwq7s5FM0
	J/dhhu58rrgj0+pQgrfEeWSD5X1CxmJf8VWXhGJxOyo8Nq4DAMHc8eRF4Afn0ZJnn2khXG
	9pc2t9QPuk/siV5jG8h2jlHb4IDmqDQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-219-KbJ_zj1lO5aMGzPmuMa9Wg-1; Thu, 22 May 2025 03:02:26 -0400
X-MC-Unique: KbJ_zj1lO5aMGzPmuMa9Wg-1
X-Mimecast-MFC-AGG-ID: KbJ_zj1lO5aMGzPmuMa9Wg_1747897345
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-acbbb000796so567118766b.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 00:02:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747897345; x=1748502145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ag2ux448b2TruItxL58I3ryWzU9MIQdqPkcm2HcLdRo=;
        b=KWJsoDae4s8+SmVbVPflwFx8OMqeUfwrw/HaaG+bxkctJEZAc+8s01ssV3rwL/xJLM
         S0fi6YoraKFzPDYIu+qJeu88S8pLaoIW1dtAirAn+EvRgr5D2xsYgAn7yKNyDa5taYbs
         6MF+abB9+4PagsvCFax8u2Cr0xuU3vqZ53hid6XKpmCQnc7FWGyfv8oIkjxXe/ZwaA1W
         d5EbE4z3vQ+33uYJl2nWaQsxWInEWrx+RSNLBzqvMhpoBNv+2gNc29eZ6O7x5Dow9E7n
         1i2pZCs1HaOljnA9+rEh0g920t9mOIhvSqYClryCrlAD6w4dqJ7RpOwKYPii0ZdbDQpI
         ZxuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyPPMeiRp/Ro4jgG60zeQZO3gyJFZVF3vIqAkCH5VqAyty9jRy52bbLZ+Rw98sRrGes+UmrM8Rdp8+BFg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt76iSbKstxAzGcGfVxqVRII4sBHkUYg1LM5kilpA/8fxO0z9m
	fUwqa0Ph/mlK+OAMTxyH9BgQjGtj1ynAhLMmHYpnQtdLwrfaauRR6fSgAEs72T9/vJV/B1mDIy8
	ikOetSYRJ8PpPm7fOx7QwyhM/AJlpk857FxEqjAu87BLLEqfeLmvEr5y4TdNiZBa2TAyAc7RVpC
	7y+q8o7LBvR+SYg5xrPkVCkk4xveGlmWlqcBX7LcdM
X-Gm-Gg: ASbGnctYh/QQ9DHn5SLYx2GqytUokTiuq7wrlwwZAqthMCHvstRPjii+SscjOYeyZND
	1xUHMWy/syz20uw52TxtvKVBCIfWfeTXQGTYCT9bfPw8JWCLHwV3lbDTBmclK6Db2BNlOEQ==
X-Received: by 2002:a17:907:7da2:b0:ad2:39a9:f1b2 with SMTP id a640c23a62f3a-ad536fa5966mr2109580466b.59.1747897345041;
        Thu, 22 May 2025 00:02:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE224W/P6ICKS/konR+EeFebTwhEbszkWz9E3Wsg8PLsnr9Hw7dE9zCQrVu1l5zjDhj9J/D3CGCH13JfIKwK50=
X-Received: by 2002:a17:907:7da2:b0:ad2:39a9:f1b2 with SMTP id
 a640c23a62f3a-ad536fa5966mr2109577066b.59.1747897344587; Thu, 22 May 2025
 00:02:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250324054333.1954-1-jasowang@redhat.com> <CAPpAL=x4BWNh__YpzkzpErkseh04FT7WNLmg=xMXtfZ0S9BabQ@mail.gmail.com>
 <CAJaqyWdtKEYiY2tBB0F477LqxVs8fzaix96551WSMa=KdT3C5Q@mail.gmail.com> <20250518173443-mutt-send-email-mst@kernel.org>
In-Reply-To: <20250518173443-mutt-send-email-mst@kernel.org>
From: Lei Yang <leiyang@redhat.com>
Date: Thu, 22 May 2025 15:01:47 +0800
X-Gm-Features: AX0GCFuYF7XdFlyXEtLr_TPKhkebV0K74gj6NfVMZNAX5P30zqgaAxprNPeRmtA
Message-ID: <CAPpAL=zhKD7q3OmcR9_nWqMXk1grz0gNJ2Wqk923k4i+kuMfgw@mail.gmail.com>
Subject: Re: [PATCH 00/19] virtio_ring in order support
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Eugenio Perez Martin <eperezma@redhat.com>, Jason Wang <jasowang@redhat.com>, xuanzhuo@linux.alibaba.com, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 5:35=E2=80=AFAM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Wed, Mar 26, 2025 at 07:39:47AM +0100, Eugenio Perez Martin wrote:
> > On Mon, Mar 24, 2025 at 3:44=E2=80=AFPM Lei Yang <leiyang@redhat.com> w=
rote:
> > >
> > > QE tested this series of patches with virtio-net regression tests,
> > > everything works fine.
> > >
> >
> > Hi Lei,
> >
> > Is it possible to test this series also with virtio-net-pci,...,in_orde=
r=3Don?
> >
> > Thanks!
>
>
> Lei, what do you think?


Sure,  I will test it and provide test results ASAP.

Thanks
Lei
>
>
> > > Tested-by: Lei Yang <leiyang@redhat.com>
> > >
> > > On Mon, Mar 24, 2025 at 1:45=E2=80=AFPM Jason Wang <jasowang@redhat.c=
om> wrote:
> > > >
> > > > Hello all:
> > > >
> > > > This sereis tries to implement the VIRTIO_F_IN_ORDER to
> > > > virtio_ring. This is done by introducing virtqueue ops so we can
> > > > implement separate helpers for different virtqueue layout/features
> > > > then the in-order were implmeented on top.
> > > >
> > > > Tests shows 5% imporvemnt in RX PPS with KVM guest + testpmd on the
> > > > host.
> > > >
> > > > Please review.
> > > >
> > > > Thanks
> > > >
> > > > Jason Wang (19):
> > > >   virtio_ring: rename virtqueue_reinit_xxx to virtqueue_reset_xxx()
> > > >   virtio_ring: switch to use vring_virtqueue in virtqueue_poll vari=
ants
> > > >   virtio_ring: unify logic of virtqueue_poll() and more_used()
> > > >   virtio_ring: switch to use vring_virtqueue for virtqueue resize
> > > >     variants
> > > >   virtio_ring: switch to use vring_virtqueue for virtqueue_kick_pre=
pare
> > > >     variants
> > > >   virtio_ring: switch to use vring_virtqueue for virtqueue_add vari=
ants
> > > >   virtio: switch to use vring_virtqueue for virtqueue_add variants
> > > >   virtio_ring: switch to use vring_virtqueue for enable_cb_prepare
> > > >     variants
> > > >   virtio_ring: use vring_virtqueue for enable_cb_delayed variants
> > > >   virtio_ring: switch to use vring_virtqueue for disable_cb variant=
s
> > > >   virtio_ring: switch to use vring_virtqueue for detach_unused_buf
> > > >     variants
> > > >   virtio_ring: use u16 for last_used_idx in virtqueue_poll_split()
> > > >   virtio_ring: introduce virtqueue ops
> > > >   virtio_ring: determine descriptor flags at one time
> > > >   virtio_ring: factor out core logic of buffer detaching
> > > >   virtio_ring: factor out core logic for updating last_used_idx
> > > >   virtio_ring: move next_avail_idx to vring_virtqueue
> > > >   virtio_ring: factor out split indirect detaching logic
> > > >   virtio_ring: add in order support
> > > >
> > > >  drivers/virtio/virtio_ring.c | 856 ++++++++++++++++++++++++++-----=
----
> > > >  1 file changed, 653 insertions(+), 203 deletions(-)
> > > >
> > > > --
> > > > 2.42.0
> > > >
> > > >
> > >
>

