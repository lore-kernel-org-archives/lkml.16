Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9E813B58A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 03:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751860164; cv=none; b=DZTH5pkUo53o1RZcS5qhTk1Ag/k2Sy+f9mx0ILlEARpUtQy59AvtE/zvdHZf34wqpSNY9+o9S4qz9K9EclmJoqATYvy4J+30RjXuzzv/WCqcdL66NecVAobyFNXXrArGT4ymUUzmf6YBxKv2XpI/NDlMX0M86UDCoOnIE8f//BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751860164; c=relaxed/simple;
	bh=rbEkyEc54JX0hon4H2QR8j8z7VQjU5iAOMrPuzptzX8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X2kesxW5yNG1HewghPt44wCvErfp1T4NEe9hDQ+4XRG4/6aIC5/r1WErmPpOpTcJSSakIEI9qqUPgdpONKXnL7eplv7d4N21vq4umjEOJrA2RBOcaz89j4J9STyKqptV07LNz1XM0+A0ur+Pdh4qVdYFKP4TsoG07i2/y01IW6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iVCFPXsp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iVCFPXsp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751860161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LEqeCIto7afaKCbzfho3gYL4/zINVSmga5IJMeGkA5Y=;
	b=iVCFPXspPDtveVzou1w6lWVz3ne1OJqS97yerI/maxqYA+suZx9weWRyx2k8lfalwiGu7D
	q4jG34JRf0FFbM3B47Es8aa35s/29nmVwToU3wZldYsmi3VClWPONa+WSuqNDa8zSFpifW
	+iEBKSzhQgRD4Ct13XAsmynEZpLtugc=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-90-SBlGBiyKM3yE6ccoX0kHQA-1; Sun, 06 Jul 2025 23:49:19 -0400
X-MC-Unique: SBlGBiyKM3yE6ccoX0kHQA-1
X-Mimecast-MFC-AGG-ID: SBlGBiyKM3yE6ccoX0kHQA_1751860159
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b31cc625817so2897732a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 20:49:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751860159; x=1752464959;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LEqeCIto7afaKCbzfho3gYL4/zINVSmga5IJMeGkA5Y=;
        b=JUBm5GZ448L9i56Gly5H4vkjjWyheqedviwO9nLDJHvmWbR1K9qKrLzADIfAqHpuAW
         W1Deyn0xujkEyms0paVXIeooM0UJlrbR5iwHtDdS88TnnKalp6SvsuWb8ZjSuQnM7J3f
         PwBra8FVQCIboWKY5Mf46P2IRjzZ3sRhnbsQs838zb4XFGSD59D49x2xHilBy2MFKeov
         wyAbr1wFrK7ENhHfhq98okd8GQG25/DVh6MDANVUVh7e0mhiR2PTUQuPJGIgIORwwfkS
         yjwcvfFyAu9Y1FOqzGx/V5/IZ6E2d8LiLTMcb+b+1iOlkITOBtaX/52cukfDLWUIq93g
         lRZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXS48xrv8u9RZBDZLweo8ZzFsGv+tzpzQPttD/7URPKiAhoYV8sIWG1ONDJZQiY20fAZ2IEh/kaoce4y6k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgS4z8R09VqnG95aLTeebrcSVO6rnpJlBIomqbZSbZOQOAhDGI
	AREvCofiNgAlKVenEr4jtQiyRKwXWyUd6pfBMNk2C3go6Kbqh4JXropmIM9QqhtqGftuUMo5z/+
	Xv9h9eJQtEa/d8swBZZUwhpNOMaXUx1sXcmXoxC7kXg52sOov9Zk9CAOlXau1XEOAlNC5oB8KNI
	X/MqpRaLSWel3gYTJaijPiIO0ql2s/Dhtv1lcgVBug
X-Gm-Gg: ASbGncuXonb/mZaECHa8GJ9gULT9+KrJPx4QRk7EUgzIKVFyeOPuhVz5a+n83MmuK+9
	k0AjWpWdvTBhADMIkq+YVJhKjAH3CcLSTXONJKbbF7zFPZdwuE4I7KIQ0jeWL8NA6z27bfUAMta
	lPsxPy
X-Received: by 2002:a17:90b:2f03:b0:315:f6d6:d29c with SMTP id 98e67ed59e1d1-31aab057582mr15693148a91.15.1751860158576;
        Sun, 06 Jul 2025 20:49:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoqktEzX7UFCYL8rORdV2btU2Z2RPP0g5Ib6nxAwRfGWFKbHnpjyJ/v7HeB/oOqzeco9o2bSl+UclX/oDvuho=
X-Received: by 2002:a17:90b:2f03:b0:315:f6d6:d29c with SMTP id
 98e67ed59e1d1-31aab057582mr15693113a91.15.1751860158013; Sun, 06 Jul 2025
 20:49:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250706141150.25344-1-minhquangbui99@gmail.com> <CACGkMEvCZ1D7k+=V-Ta9hXpdW4ofnbXfQ4JcADXabC13CA884A@mail.gmail.com>
In-Reply-To: <CACGkMEvCZ1D7k+=V-Ta9hXpdW4ofnbXfQ4JcADXabC13CA884A@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 7 Jul 2025 11:49:06 +0800
X-Gm-Features: Ac12FXxJfbQxhcxDTY2Mp6Wx8JjbygNOJDdfIFZy8GLMK_DojQ4RAdYyPAaOF9U
Message-ID: <CACGkMEvBf3_cReVDxX2dRALrS=fQvg9pMY1LKwmbf=Gp9zSTPQ@mail.gmail.com>
Subject: Re: [PATCH net] virtio-net: fix received length check in big packets
To: Bui Quang Minh <minhquangbui99@gmail.com>
Cc: netdev@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Gavin Li <gavinl@nvidia.com>, Gavi Teitz <gavi@nvidia.com>, Parav Pandit <parav@nvidia.com>, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 7, 2025 at 11:48=E2=80=AFAM Jason Wang <jasowang@redhat.com> wr=
ote:
>
> On Sun, Jul 6, 2025 at 10:12=E2=80=AFPM Bui Quang Minh <minhquangbui99@gm=
ail.com> wrote:
> >
> > Since commit 4959aebba8c0 ("virtio-net: use mtu size as buffer length
> > for big packets"), the allocated size for big packets is not
> > MAX_SKB_FRAGS * PAGE_SIZE anymore but depends on negotiated MTU. The
> > number of allocated frags for big packets is stored in
> > vi->big_packets_num_skbfrags. This commit fixes the received length
> > check corresponding to that change. The current incorrect check can lea=
d
> > to NULL page pointer dereference in the below while loop when erroneous
> > length is received.
> >
> > Fixes: 4959aebba8c0 ("virtio-net: use mtu size as buffer length for big=
 packets")
> > Signed-off-by: Bui Quang Minh <minhquangbui99@gmail.com>
> > ---
> >  drivers/net/virtio_net.c | 10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> > index 5d674eb9a0f2..ead1cd2fb8af 100644
> > --- a/drivers/net/virtio_net.c
> > +++ b/drivers/net/virtio_net.c
> > @@ -823,7 +823,7 @@ static struct sk_buff *page_to_skb(struct virtnet_i=
nfo *vi,
> >  {
> >         struct sk_buff *skb;
> >         struct virtio_net_common_hdr *hdr;
> > -       unsigned int copy, hdr_len, hdr_padded_len;
> > +       unsigned int copy, hdr_len, hdr_padded_len, max_remaining_len;
> >         struct page *page_to_free =3D NULL;
> >         int tailroom, shinfo_size;
> >         char *p, *hdr_p, *buf;
> > @@ -887,12 +887,16 @@ static struct sk_buff *page_to_skb(struct virtnet=
_info *vi,
> >          * tries to receive more than is possible. This is usually
> >          * the case of a broken device.
> >          */
> > -       if (unlikely(len > MAX_SKB_FRAGS * PAGE_SIZE)) {
> > +       BUG_ON(offset >=3D PAGE_SIZE);
> > +       max_remaining_len =3D (unsigned int)PAGE_SIZE - offset;
> > +       max_remaining_len +=3D vi->big_packets_num_skbfrags * PAGE_SIZE=
;
> > +       if (unlikely(len > max_remaining_len)) {
> >                 net_dbg_ratelimited("%s: too much data\n", skb->dev->na=
me);
> >                 dev_kfree_skb(skb);
> > +               give_pages(rq, page);
>
> Should this be an independent fix?

Btw, the page_to_skb() is really kind of messed up right now that it
is used by both big and mergeable. We may need to consider splitting
the logic in the future.

Thanks

>
> >                 return NULL;
> >         }
> > -       BUG_ON(offset >=3D PAGE_SIZE);
> > +
> >         while (len) {
> >                 unsigned int frag_size =3D min((unsigned)PAGE_SIZE - of=
fset, len);
> >                 skb_add_rx_frag(skb, skb_shinfo(skb)->nr_frags, page, o=
ffset,
> > --
> > 2.43.0
> >
>
> Thanks

