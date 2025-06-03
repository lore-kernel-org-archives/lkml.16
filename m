Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C4C154425
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 02:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748919424; cv=none; b=NpsGi7ttWNwDUI/sFIDB9Pa6FrfDq7THcnG/4ohhbibPPHSBcg2rdST/FO2gy0ga2WLKRAzUfhj4NqIZLlz/TlCbbf+FnBA3yEtyjpIZwAy+cYzWrKayZj/bLZp6axhUuRFpxAD4n3prJ9tvutKmVkOsxJI59zDfnn8Mr01/e6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748919424; c=relaxed/simple;
	bh=FyYvsDY9RRQ7Ye1uQhwbm4kH5XWJt7w+rEpIsRLZx/M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hkuFlf+2oMr/QWPM+VfkX5I16qq5ke56KW+ny6u5ou+6w/xZGfLJCuO6QrNfL5JqlwwNs0BFm98k5kMiyfDGpt7KcPy97v/jFr6GaZAemHqeM8Un/XbSAm2jQH6QNGlssIa9oBro7O92IsC50K/9wKYHwu6UoE2t7SNThFeFdh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JjP8j/cp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JjP8j/cp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748919421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yQ+r5oBf4JFAgK9Q+tIlTdQ7PtffG9vedsHhS1feOvo=;
	b=JjP8j/cpd/+FhI+DFleS41Knvt3HOIRTPoHyIygKl9xPu33TZ9q6zruLrVJdfYt3NVtLoz
	+Znq2h5S/GO9kvmn40nlbsQKzTeEMlbVhSEgy2+qGsQ+XtzaPboDQsJiJ3Lur2JlfrqITg
	uGtzRWTu3lZiVRM5m2YAnR2iWWWJXyc=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-660-yldGV2yYPka3I8PxuFfvrg-1; Mon, 02 Jun 2025 22:57:00 -0400
X-MC-Unique: yldGV2yYPka3I8PxuFfvrg-1
X-Mimecast-MFC-AGG-ID: yldGV2yYPka3I8PxuFfvrg_1748919419
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-30a59538b17so4668499a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 19:56:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748919418; x=1749524218;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yQ+r5oBf4JFAgK9Q+tIlTdQ7PtffG9vedsHhS1feOvo=;
        b=cNytRfJp6lCxwUiSyDijL1NoLqq7Un1xj1+J3azGleJRYxakRHbrIYuhu2Y6Bd80Ed
         JS9iNvTBXdx65EHmG1gktj27T9XHLE7D4MevoL12bG/BVs2f780ysdQDPQXm0gGhrZm1
         /gq9sDlvDr1+yVAKWVgy/kEz3fVfvUXa4eT8l81glJ8fGVPenzMNgBqoBpbMGNL4ZvpE
         /iY3LH9+WkcLHE8N37vPXtke2+oBkWUQxXl4M1TWj69WFN5Gz3YZuguy9E1OdULqNRkq
         SCRvm1eMDWI8hdqrl6bSN7JbTM4Bfe4shAajoGL2Y/eGeGcvpI7suCb9dbgCbOdly6Js
         HAmg==
X-Forwarded-Encrypted: i=1; AJvYcCUXtZ32QV9FMtGVO5WJ7sSU2XV91ySYcAnWjXEbgslnTzjBH3FRosQRLojdKZVQipgjhc1MzQQWyz2t6RM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlAjW75LMKqOYCGqvOmjiCjAYTJoWbnvTeGpCaj/ODb7xiHMpf
	d74thrD3PtPgfIbMI7qJLxbatOsS9HMjPPvx1fQPmDxJA5ZbiQ0cnJxF9CpgiuGDsyAjiovvey4
	eyRIlE1G+p+PsenLeACExsa91xGINnWtyHGIpc9w/ClhfT1kwAsTP39X/Ufrv4qBV5TzwdgZB+F
	c0+3li1ufJSpPKDaeRwuMRBAz1ExE4G1fkxvugy4SuWq057vp42PM=
X-Gm-Gg: ASbGncvWhthhGuGz9pCUel7+vFcTUQIgYj61jognBkRO5uQcR4Z7+FbfpmuUMrVlYPY
	TgkdSNumbDjQVj5YpM00JUZSHdTCAVCXYjqjs8MG/d+wYRso6vy5lEIxtFoVnZ2ZTsyF29g==
X-Received: by 2002:a17:90b:2f8c:b0:2ee:d371:3227 with SMTP id 98e67ed59e1d1-31241735b7fmr26145341a91.17.1748919417518;
        Mon, 02 Jun 2025 19:56:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdHD3VSXY/qb/15d/+9RLJ+wolJ2Sye/tJcf7puOqTeU5auMV1IMlnvMY8bntNdJS3BXE9udtSG0+kr7BMVpE=
X-Received: by 2002:a17:90b:2f8c:b0:2ee:d371:3227 with SMTP id
 98e67ed59e1d1-31241735b7fmr26145293a91.17.1748919417021; Mon, 02 Jun 2025
 19:56:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250527161904.75259-1-minhquangbui99@gmail.com>
 <20250527161904.75259-2-minhquangbui99@gmail.com> <CACGkMEvAJziO3KW3Nk9+appXmR92ixcTeWY_XEZz4Qz1MwrhYA@mail.gmail.com>
 <d572e8b6-e25c-480e-9d05-8c7eeb396b12@gmail.com>
In-Reply-To: <d572e8b6-e25c-480e-9d05-8c7eeb396b12@gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 3 Jun 2025 10:56:45 +0800
X-Gm-Features: AX0GCFvMg4Sj0bgAoq7y4zLkkqsNLbY_mZN0K8gVoKoJcPc_6sY9TVMS041R96c
Message-ID: <CACGkMEvBPaqXxnmNqZAbAbYFh=9gONva+dpouAeW-sd1pzK58Q@mail.gmail.com>
Subject: Re: [RFC PATCH net-next v2 1/2] virtio-net: support zerocopy multi
 buffer XDP in mergeable
To: Bui Quang Minh <minhquangbui99@gmail.com>
Cc: netdev@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 29, 2025 at 8:28=E2=80=AFPM Bui Quang Minh <minhquangbui99@gmai=
l.com> wrote:
>
> On 5/29/25 12:59, Jason Wang wrote:
> > On Wed, May 28, 2025 at 12:19=E2=80=AFAM Bui Quang Minh
> > <minhquangbui99@gmail.com> wrote:
> >> Currently, in zerocopy mode with mergeable receive buffer, virtio-net
> >> does not support multi buffer but a single buffer only. This commit ad=
ds
> >> support for multi mergeable receive buffer in the zerocopy XDP path by
> >> utilizing XDP buffer with frags.
> >>
> >> Signed-off-by: Bui Quang Minh <minhquangbui99@gmail.com>
> >> ---
> >>   drivers/net/virtio_net.c | 123 +++++++++++++++++++++----------------=
--
> >>   1 file changed, 66 insertions(+), 57 deletions(-)
> >>
> >> diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> >> index e53ba600605a..a9558650f205 100644
> >> --- a/drivers/net/virtio_net.c
> >> +++ b/drivers/net/virtio_net.c
> >> @@ -45,6 +45,8 @@ module_param(napi_tx, bool, 0644);
> >>   #define VIRTIO_XDP_TX          BIT(0)
> >>   #define VIRTIO_XDP_REDIR       BIT(1)
> >>
> >> +#define VIRTNET_MAX_ZC_SEGS    8
> >> +
> >>   /* RX packet size EWMA. The average packet size is used to determine=
 the packet
> >>    * buffer size when refilling RX rings. As the entire RX ring may be=
 refilled
> >>    * at once, the weight is chosen so that the EWMA will be insensitiv=
e to short-
> >> @@ -1232,65 +1234,53 @@ static void xsk_drop_follow_bufs(struct net_de=
vice *dev,
> >>          }
> >>   }
> >>
> >> -static int xsk_append_merge_buffer(struct virtnet_info *vi,
> >> -                                  struct receive_queue *rq,
> >> -                                  struct sk_buff *head_skb,
> >> -                                  u32 num_buf,
> >> -                                  struct virtio_net_hdr_mrg_rxbuf *hd=
r,
> >> -                                  struct virtnet_rq_stats *stats)
> >> +static int virtnet_build_xsk_buff_mrg(struct virtnet_info *vi,
> >> +                                     struct receive_queue *rq,
> >> +                                     u32 num_buf,
> >> +                                     struct xdp_buff *xdp,
> >> +                                     struct virtnet_rq_stats *stats)
> >>   {
> >> -       struct sk_buff *curr_skb;
> >> -       struct xdp_buff *xdp;
> >> -       u32 len, truesize;
> >> -       struct page *page;
> >> +       unsigned int len;
> >>          void *buf;
> >>
> >> -       curr_skb =3D head_skb;
> >> +       if (num_buf < 2)
> >> +               return 0;
> >> +
> >> +       while (num_buf > 1) {
> >> +               struct xdp_buff *new_xdp;
> >>
> >> -       while (--num_buf) {
> >>                  buf =3D virtqueue_get_buf(rq->vq, &len);
> >> -               if (unlikely(!buf)) {
> >> -                       pr_debug("%s: rx error: %d buffers out of %d m=
issing\n",
> >> -                                vi->dev->name, num_buf,
> >> -                                virtio16_to_cpu(vi->vdev,
> >> -                                                hdr->num_buffers));
> >> +               if (!unlikely(buf)) {
> >> +                       pr_debug("%s: rx error: %d buffers missing\n",
> >> +                                vi->dev->name, num_buf);
> >>                          DEV_STATS_INC(vi->dev, rx_length_errors);
> >> -                       return -EINVAL;
> >> -               }
> >> -
> >> -               u64_stats_add(&stats->bytes, len);
> >> -
> >> -               xdp =3D buf_to_xdp(vi, rq, buf, len);
> >> -               if (!xdp)
> >> -                       goto err;
> >> -
> >> -               buf =3D napi_alloc_frag(len);
> >> -               if (!buf) {
> >> -                       xsk_buff_free(xdp);
> >> -                       goto err;
> >> +                       return -1;
> >>                  }
> >>
> >> -               memcpy(buf, xdp->data - vi->hdr_len, len);
> >> -
> >> -               xsk_buff_free(xdp);
> >> +               new_xdp =3D buf_to_xdp(vi, rq, buf, len);
> >> +               if (!new_xdp)
> >> +                       goto drop_bufs;
> >>
> >> -               page =3D virt_to_page(buf);
> >> +               /* In virtnet_add_recvbuf_xsk(), we ask the host to fi=
ll from
> >> +                * xdp->data - vi->hdr_len with both virtio_net_hdr an=
d data.
> >> +                * However, only the first packet has the virtio_net_h=
dr, the
> >> +                * following ones do not. So we need to adjust the fol=
lowing
> > Typo here.
>
> I'm sorry, could you clarify which word contains the typo?
>
> >
> >> +                * packets' data pointer to the correct place.
> >> +                */
> > I wonder what happens if we don't use this trick? I meant we don't
> > reuse the header room for the virtio-net header. This seems to be fine
> > for a mergeable buffer and can help to reduce the trick.
>
> I don't think using the header room for virtio-net header creates this
> case handling. In my opinion, it comes from the slightly difference in
> the recvbuf between single buffer and multi-buffer. When we have n
> single-buffer packets, each buffer will have its own virtio-net header.
> But when we have 1 multi-buffer packet (which spans across n buffers),
> only the first buffer has virtio-net header, the following buffers do not=
.
>
> There 2 important pointers here. The pointer we announce to the vhost
> side to fill the data, let's call it announced_addr, and xdp_buff->data
> which is expected to point the the start of Ethernet frame. Currently,
>
>      announced_addr =3D xdp_buff->data - hdr_len
>
> The host side will write the virtio-net header to announced_addr then
> the Ethernet frame's data in the first buffer. In case of multi-buffer
> packet, in the following buffers, host side writes the Ethernet frame's
> data to the announced_addr no virtio-net header. So in the virtio-net,
> we need to subtract xdp_buff->data, otherwise, we lose some Ethernet
> frame's data.
>
> I think a slightly better solution is that we set announced_addr =3D
> xdp_buff->data then we only need to xdp_buff->data +=3D hdr_len for the
> first buffer and do need to adjust xdp_buff->data of the following buffer=
s.

Exactly my point.

>
> >
> >> +               new_xdp->data -=3D vi->hdr_len;
> >> +               new_xdp->data_end =3D new_xdp->data + len;
> >>
> >> -               truesize =3D len;
> >> +               if (!xsk_buff_add_frag(xdp, new_xdp))
> >> +                       goto drop_bufs;
> >>
> >> -               curr_skb  =3D virtnet_skb_append_frag(head_skb, curr_s=
kb, page,
> >> -                                                   buf, len, truesize=
);
> >> -               if (!curr_skb) {
> >> -                       put_page(page);
> >> -                       goto err;
> >> -               }
> >> +               num_buf--;
> >>          }
> >>
> >>          return 0;
> >>
> >> -err:
> >> +drop_bufs:
> >>          xsk_drop_follow_bufs(vi->dev, rq, num_buf, stats);
> >> -       return -EINVAL;
> >> +       return -1;
> >>   }
> >>
> >>   static struct sk_buff *virtnet_receive_xsk_merge(struct net_device *=
dev, struct virtnet_info *vi,
> >> @@ -1307,23 +1297,42 @@ static struct sk_buff *virtnet_receive_xsk_mer=
ge(struct net_device *dev, struct
> >>          num_buf =3D virtio16_to_cpu(vi->vdev, hdr->num_buffers);
> >>
> >>          ret =3D XDP_PASS;
> >> +       if (virtnet_build_xsk_buff_mrg(vi, rq, num_buf, xdp, stats))
> >> +               goto drop;
> >> +
> >>          rcu_read_lock();
> >>          prog =3D rcu_dereference(rq->xdp_prog);
> >> -       /* TODO: support multi buffer. */
> >> -       if (prog && num_buf =3D=3D 1)
> >> -               ret =3D virtnet_xdp_handler(prog, xdp, dev, xdp_xmit, =
stats);
> > Without this patch it looks like we had a bug:
> >
> >          ret =3D XDP_PASS;
> >          rcu_read_lock();
> >          prog =3D rcu_dereference(rq->xdp_prog);
> >          /* TODO: support multi buffer. */
> >          if (prog && num_buf =3D=3D 1)
> >                  ret =3D virtnet_xdp_handler(prog, xdp, dev, xdp_xmit, =
stats);
> >          rcu_read_unlock();
> >
> > This implies if num_buf is greater than 1, we will assume XDP_PASS?
>
> Yes, I think XDP_DROP should be returned in that case.

Care to post a patch and cc stable?

>
> >
> >> +       if (prog) {
> >> +               /* We are in zerocopy mode so we cannot copy the multi=
-buffer
> >> +                * xdp buff to a single linear xdp buff. If we do so, =
in case
> >> +                * the BPF program decides to redirect to a XDP socket=
 (XSK),
> >> +                * it will trigger the zerocopy receive logic in XDP s=
ocket.
> >> +                * The receive logic thinks it receives zerocopy buffe=
r while
> >> +                * in fact, it is the copy one and everything is messe=
d up.
> >> +                * So just drop the packet here if we have a multi-buf=
fer xdp
> >> +                * buff and the BPF program does not support it.
> >> +                */
> >> +               if (xdp_buff_has_frags(xdp) && !prog->aux->xdp_has_fra=
gs)
> >> +                       ret =3D XDP_DROP;
> > Could we move the check before trying to build a multi-buffer XDP buff?
>
> Yes, I'll fix this in next version.
>
> >
> >> +               else
> >> +                       ret =3D virtnet_xdp_handler(prog, xdp, dev, xd=
p_xmit,
> >> +                                                 stats);
> >> +       }
> >>          rcu_read_unlock();
> >>
> >>          switch (ret) {
> >>          case XDP_PASS:
> >> -               skb =3D xsk_construct_skb(rq, xdp);
> >> +               skb =3D xdp_build_skb_from_zc(xdp);
> > Is this better to make this change a separate patch?
>
> Okay, I'll create a separate patch to convert the current XDP_PASS
> handler to use xdp_build_skb_from_zc helper.

That would be better.

>
> >
> >>                  if (!skb)
> >> -                       goto drop_bufs;
> >> +                       break;
> >>
> >> -               if (xsk_append_merge_buffer(vi, rq, skb, num_buf, hdr,=
 stats)) {
> >> -                       dev_kfree_skb(skb);
> >> -                       goto drop;
> >> -               }
> >> +               /* Later, in virtnet_receive_done(), eth_type_trans()
> >> +                * is called. However, in xdp_build_skb_from_zc(), it =
is called
> >> +                * already. As a result, we need to reset the data to =
before
> >> +                * the mac header so that the later call in
> >> +                * virtnet_receive_done() works correctly.
> >> +                */
> >> +               skb_push(skb, ETH_HLEN);
> >>
> >>                  return skb;
> >>
> >> @@ -1332,14 +1341,11 @@ static struct sk_buff *virtnet_receive_xsk_mer=
ge(struct net_device *dev, struct
> >>                  return NULL;
> >>
> >>          default:
> >> -               /* drop packet */
> >> -               xsk_buff_free(xdp);
> >> +               break;
> >>          }
> >>
> >> -drop_bufs:
> >> -       xsk_drop_follow_bufs(dev, rq, num_buf, stats);
> >> -
> >>   drop:
> >> +       xsk_buff_free(xdp);
> >>          u64_stats_inc(&stats->drops);
> >>          return NULL;
> >>   }
> >> @@ -1396,6 +1402,8 @@ static int virtnet_add_recvbuf_xsk(struct virtne=
t_info *vi, struct receive_queue
> >>                  return -ENOMEM;
> >>
> >>          len =3D xsk_pool_get_rx_frame_size(pool) + vi->hdr_len;
> >> +       /* Reserve some space for skb_shared_info */
> >> +       len -=3D SKB_DATA_ALIGN(sizeof(struct skb_shared_info));
> >>
> >>          for (i =3D 0; i < num; ++i) {
> >>                  /* Use the part of XDP_PACKET_HEADROOM as the virtnet=
 hdr space.
> >> @@ -6734,6 +6742,7 @@ static int virtnet_probe(struct virtio_device *v=
dev)
> >>          dev->netdev_ops =3D &virtnet_netdev;
> >>          dev->stat_ops =3D &virtnet_stat_ops;
> >>          dev->features =3D NETIF_F_HIGHDMA;
> >> +       dev->xdp_zc_max_segs =3D VIRTNET_MAX_ZC_SEGS;
> >>
> >>          dev->ethtool_ops =3D &virtnet_ethtool_ops;
> >>          SET_NETDEV_DEV(dev, &vdev->dev);
> >> --
> >> 2.43.0
> >>
> > Thanks
> >
>

Thanks

