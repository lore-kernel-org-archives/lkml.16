Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5494B1E76
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 07:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747640044; cv=none; b=QDRD8yeCh6APGVlAmZXtUROB4ehd8TDrNYGMUY1NMiVimuP/WGxqQk7Kjmo+06vP+Fq68Z9zuhegeq9w84abwMOmH75AZsmrS9XCZBJI4pz+HYkrOxG1T99mmElzwV2M9N4wGFgG6WDgl7SRpoQUO8o8cB1Zl0Hq9f3/BJMMY1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747640044; c=relaxed/simple;
	bh=c4WpwzjjQW3Ir5YR3mHwmejlUptT9bbw4pzcglxmoM8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=esRrkH5GTpoZahdZZL3GC8SXI4ZmkoQ79D1tviPwA++8L+aYM/mI6muPXX2NhhUwtzHLifXV6lvPBmTbGyvs3u1fWMIbouhnTLOdQzo4+GJaSLz0wHgjPVDDb2lNvo3/FpK0GmOQWDLt4s9M6Vzm5Kq5yhl0amTlqfNRx283C+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XTfCHQlR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XTfCHQlR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747640041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L36k71D4/uqkhsgnGcmxH0oB9aRxvFgq9af1uUmqGOQ=;
	b=XTfCHQlRYIID69xjculuVcJaOCjeZBx0EB7f/MezRoVv1HFQYPCWMq8Hf6jcAI23AWzqiT
	iRqFZpxBvG2G8S5sK5DXHeHy7qIg50ko1FirBUdEVhsAyUl1EhyUatyibxPoupWRr8SCRU
	9moUaXqFIr0efJgZb7N0LyVf+Gi4Pvk=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-47-XJaBFw0_Ny-F4MJ1XZOzRA-1; Mon, 19 May 2025 03:33:58 -0400
X-MC-Unique: XJaBFw0_Ny-F4MJ1XZOzRA-1
X-Mimecast-MFC-AGG-ID: XJaBFw0_Ny-F4MJ1XZOzRA_1747640038
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-30e895056f0so3403504a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 00:33:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747640037; x=1748244837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L36k71D4/uqkhsgnGcmxH0oB9aRxvFgq9af1uUmqGOQ=;
        b=tkV76v4JyLHjFa0U8SeaSY3ke058o2qrzyxOTz181mQsjgeUOjWj3vjBPTrGlWA8DX
         L+HK6nh49NnauJzWHD+kPsmhdkcS8YChZWMf6hK7oJC3+p4rAsSvMqYoPlXU25J1t0u/
         B9QQwQEniq6GN8d/Tuekph9ySlKyWCJzrUX6tlzDp21rCPu4nibX91uPy+nbQajpcFeZ
         go90xzudjYwItTmZHczgbZHfCoBs5tYgU4fNsxnbnjgWmXO/KKaojTwYLUtKVydIjmUZ
         NfyttW7hhmQs0UCjf3XXWKy5d+XEnhqAr/I0ho9dAo6wrUTlCBxhONTmGVoTt4xpmzQB
         Adyg==
X-Forwarded-Encrypted: i=1; AJvYcCUaGQNV0eMx2WXTCZDtb7876+VbarB598DHqSW/gGEOJymNsEwoSgiXco22VqGGfGT85ETrWO2MKXv4Mn0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYQj+kjUNeHwAdpveGPkAmQjBNN35egneWVa/y2cjSQSnY0dlv
	AyvcICfFVXNOvBa6uaOLoQygEpLBbax+xzw+XhUBSjLJ8SpaL6BbnoriNmqupOBxXseBuZN5vaO
	mGdw3IMVP8Y/k+JhtGAiZwtwSOeQb514A7A2d4dqdQFofTEwLilFh1gmbjkbSgS2SkdGSlj1dh0
	d/ViendSenK+DRwy2g4rYYvEmbCfILmovz4Z3hTC82QbhUUeUdDu9jBA==
X-Gm-Gg: ASbGncvroMJHxWJixunJUOLib6aZ1h5VIPko31TDJukzPLW7qTc+I8seohi1yBEIs4H
	zojjEopo3q3VKOz9/ojd33KOscajNcVjG/JmIX1Ou7H4YgHW6+nyv5p27LpGYJCQqLnHmZg==
X-Received: by 2002:a17:90b:1c05:b0:301:6343:1626 with SMTP id 98e67ed59e1d1-30e7d4f91ccmr16120689a91.1.1747640037352;
        Mon, 19 May 2025 00:33:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH61OdSqHaj4dIZRHET3XmRLhqM7Vju7sBVwxY2sKD2SfKrCk85AZqSLB8x0epgpZOBB6VLdBsnwWE0sYmUSlg=
X-Received: by 2002:a17:90b:1c05:b0:301:6343:1626 with SMTP id
 98e67ed59e1d1-30e7d4f91ccmr16120663a91.1.1747640036767; Mon, 19 May 2025
 00:33:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250324054333.1954-1-jasowang@redhat.com> <20250324060127.2358-1-jasowang@redhat.com>
 <20250407041729-mutt-send-email-mst@kernel.org> <CACGkMEv-=V0a7jpR9e-i=Oe+PE9pN_cH3yDBmyOYhwPcJXOHPQ@mail.gmail.com>
 <20250408073317-mutt-send-email-mst@kernel.org> <CACGkMEtmDM4_ZbAi4O8OUwZaPZnGLKEhnXkQGStFmeXETJtpkA@mail.gmail.com>
 <20250514091029-mutt-send-email-mst@kernel.org> <20250514102109-mutt-send-email-mst@kernel.org>
 <CACGkMEsTwcKHQfp5skDHE6mp-tdK88oKteU2ZtKY19ik8HgN0A@mail.gmail.com> <20250516060737-mutt-send-email-mst@kernel.org>
In-Reply-To: <20250516060737-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 19 May 2025 15:33:42 +0800
X-Gm-Features: AX0GCFsGM8qB64Wjg8iXYSmaEdpYHSkvFeUHNmWk5NyZB0yqAZqnMtEES_vep9A
Message-ID: <CACGkMEvf+bSjX47s6ENC4RkNq5=RNzcMCgftt5D4P=kDi+9JwA@mail.gmail.com>
Subject: Re: [PATCH 13/19] virtio_ring: introduce virtqueue ops
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: xuanzhuo@linux.alibaba.com, eperezma@redhat.com, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 6:35=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Fri, May 16, 2025 at 09:30:01AM +0800, Jason Wang wrote:
> > On Wed, May 14, 2025 at 10:24=E2=80=AFPM Michael S. Tsirkin <mst@redhat=
.com> wrote:
> > >
> > > On Wed, May 14, 2025 at 10:19:05AM -0400, Michael S. Tsirkin wrote:
> > > > On Wed, Apr 09, 2025 at 12:06:03PM +0800, Jason Wang wrote:
> > > > > On Tue, Apr 8, 2025 at 7:37=E2=80=AFPM Michael S. Tsirkin <mst@re=
dhat.com> wrote:
> > > > > >
> > > > > > On Tue, Apr 08, 2025 at 03:02:35PM +0800, Jason Wang wrote:
> > > > > > > On Mon, Apr 7, 2025 at 4:20=E2=80=AFPM Michael S. Tsirkin <ms=
t@redhat.com> wrote:
> > > > > > > >
> > > > > > > > On Mon, Mar 24, 2025 at 02:01:21PM +0800, Jason Wang wrote:
> > > > > > > > > This patch introduces virtqueue ops which is a set of the=
 callbacks
> > > > > > > > > that will be called for different queue layout or feature=
s. This would
> > > > > > > > > help to avoid branches for split/packed and will ease the=
 future
> > > > > > > > > implementation like in order.
> > > > > > > > >
> > > > > > > > > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > > > > > > >
> > > > > > > >
> > > > > > > >
> > > > > > > >
> > > > > > > > > ---
> > > > > > > > >  drivers/virtio/virtio_ring.c | 96 ++++++++++++++++++++++=
+++-----------
> > > > > > > > >  1 file changed, 67 insertions(+), 29 deletions(-)
> > > > > > > > >
> > > > > > > > > diff --git a/drivers/virtio/virtio_ring.c b/drivers/virti=
o/virtio_ring.c
> > > > > > > > > index a2884eae14d9..ce1dc90ee89d 100644
> > > > > > > > > --- a/drivers/virtio/virtio_ring.c
> > > > > > > > > +++ b/drivers/virtio/virtio_ring.c
> > > > > > > > > @@ -159,9 +159,30 @@ struct vring_virtqueue_packed {
> > > > > > > > >       size_t event_size_in_bytes;
> > > > > > > > >  };
> > > > > > > > >
> > > > > > > > > +struct vring_virtqueue;
> > > > > > > > > +
> > > > > > > > > +struct virtqueue_ops {
> > > > > > > > > +     int (*add)(struct vring_virtqueue *_vq, struct scat=
terlist *sgs[],
> > > > > > > > > +                unsigned int total_sg, unsigned int out_=
sgs,
> > > > > > > > > +                unsigned int in_sgs, void *data,
> > > > > > > > > +                void *ctx, bool premapped, gfp_t gfp);
> > > > > > > > > +     void *(*get)(struct vring_virtqueue *vq, unsigned i=
nt *len, void **ctx);
> > > > > > > > > +     bool (*kick_prepare)(struct vring_virtqueue *vq);
> > > > > > > > > +     void (*disable_cb)(struct vring_virtqueue *vq);
> > > > > > > > > +     bool (*enable_cb_delayed)(struct vring_virtqueue *v=
q);
> > > > > > > > > +     unsigned int (*enable_cb_prepare)(struct vring_virt=
queue *vq);
> > > > > > > > > +     bool (*poll)(const struct vring_virtqueue *vq, u16 =
last_used_idx);
> > > > > > > > > +     void *(*detach_unused_buf)(struct vring_virtqueue *=
vq);
> > > > > > > > > +     bool (*more_used)(const struct vring_virtqueue *vq)=
;
> > > > > > > > > +     int (*resize)(struct vring_virtqueue *vq, u32 num);
> > > > > > > > > +     void (*reset)(struct vring_virtqueue *vq);
> > > > > > > > > +};
> > > > > > > >
> > > > > > > > I like it that it's organized but
> > > > > > > > I worry about the overhead of indirect calls here.
> > > > > > >
> > > > > > > We can switch to use INDIRECT_CALL_X() here
> > > > > >
> > > > > > If you think it's cleaner.. but INDIRECT_CALL is all chained
> > > > >
> > > > > Yes, and it would be problematic as the number of ops increased.
> > > > >
> > > > > > while a switch can do a binary search.
> > > > > >
> > > > >
> > > > > Do you mean a nested switch?
> > > >
> > > > Not sure what is nested. gcc does a decent job of optimizing
> > > > switches. You have 4 types of ops:
> > > > packed/packed in order/split/split in order
> > > >
> > > > So:
> > > >
> > > > enum {
> > > >       VQ_SPLIT,
> > > >       VQ_SPLIT_IN_ORDER,
> > > >       VQ_PACKED,
> > > >       VQ_PACKED_IN_ORDER,
> > > > }
> > > >
> > > >
> > > > I do not see how it is worse?
> > > >
> > > >
> > >
> > >
> > >
> > > Actually, here is an idea - create an array of ops:
> > >
> > >
> > >
> > > enum vqtype {
> > >         SPLIT,
> > >         SPLIT_IN_ORDER,
> > >         PACKED,
> > >         PACKED_IN_ORDER,
> > >         MAX
> > > };
> > >
> > >
> > > struct ops {
> > >         int (*add)(int bar);
> > > };
> > >
> > > extern int packed(int);
> > > extern int packedinorder(int);
> > > extern int split(int);
> > > extern int splitinorder(int);
> > >
> > > const struct ops allops[MAX] =3D { [SPLIT] =3D {split}, [SPLIT_IN_ORD=
ER] =3D { splitinorder}, [PACKED] =3D { packed }, [PACKED_IN_ORDER] =3D {pa=
ckedinorder}};
> > >
> > > int main(int argc, char **argv)
> > > {
> > >         switch (argc) {
> > >                 case 0:
> > >                         return allops[PACKED].foo(argc);
> > >                 case 1:
> > >                         return allops[SPLIT].foo(argc);
> > >                 default:
> > >                         return allops[PACKED_IN_ORDER].foo(argc);
> >
> > This still looks like an indirection call as we don't call the symbol
> > directly but need to load the function address into a register.
>
> See below.
>
>
>
> > >         }
> > > }
> > >
> > >
> > > I tested this and compiler is able to elide the indirect calls.
> >
> > I've tried the following:
> >
> > struct virtqueue_ops split_ops =3D {
> >         .add =3D virtqueue_add_split,
> >         .get =3D virtqueue_get_buf_ctx_split,
> >         .kick_prepare =3D virtqueue_kick_prepare_split,
> >         .disable_cb =3D virtqueue_disable_cb_split,
> >         .enable_cb_delayed =3D virtqueue_enable_cb_delayed_split,
> >         .enable_cb_prepare =3D virtqueue_enable_cb_prepare_split,
> >         .poll =3D virtqueue_poll_split,
> >         .detach_unused_buf =3D virtqueue_detach_unused_buf_split,
> >         .more_used =3D more_used_split,
> >         .resize =3D virtqueue_resize_split,
> >         .reset =3D virtqueue_reset_split,
> > };
> >
> > struct virtqueue_ops packed_ops =3D {
> >         .add =3D virtqueue_add_packed,
> >         .get =3D virtqueue_get_buf_ctx_packed,
> >         .kick_prepare =3D virtqueue_kick_prepare_packed,
> >         .disable_cb =3D virtqueue_disable_cb_packed,
> >         .enable_cb_delayed =3D virtqueue_enable_cb_delayed_packed,
> >         .enable_cb_prepare =3D virtqueue_enable_cb_prepare_packed,
> >         .poll =3D virtqueue_poll_packed,
> >         .detach_unused_buf =3D virtqueue_detach_unused_buf_packed,
> >         .more_used =3D more_used_packed,
> >         .resize =3D virtqueue_resize_packed,
> >         .reset =3D virtqueue_reset_packed,
> > };
> >
> > const struct virtqueue_ops *all_ops[VQ_TYPE_MAX] =3D { [SPLIT] =3D &spl=
it_ops,
> >                                                      [PACKED] =3D &pack=
ed_ops};
> >
> > unsigned int virtqueue_enable_cb_prepare(struct virtqueue *_vq)
> > {
> >         struct vring_virtqueue *vq =3D to_vvq(_vq);
> >
> >         if (vq->event_triggered)
> >                 vq->event_triggered =3D false;
> >
> >         switch (vq->layout) {
> > case SPLIT:
> >                 return all_ops[SPLIT]->enable_cb_prepare(vq);
> >                 break;
> >         case PACKED:
> >                 return all_ops[PACKED]->enable_cb_prepare(vq);
> >                 break;
> >         default:
> >                 BUG();
> >                 break;
> >         }
> >
> > return -EFAULT;
> > }
> > EXPORT_SYMBOL_GPL(virtqueue_enable_cb_prepare);
> >
> > Compilers gives me (when RETPOLINE is enabled):
> >
> > ffffffff8193a870 <virtqueue_enable_cb_prepare>:
> > ffffffff8193a870:       f3 0f 1e fa             endbr64
> > ffffffff8193a874:       e8 47 68 93 ff          callq
> > ffffffff812710c0 <__fentry__>
> > ffffffff8193a879:       80 bf 8e 00 00 00 00    cmpb   $0x0,0x8e(%rdi)
> > ffffffff8193a880:       74 07                   je
> > ffffffff8193a889 <virtqueue_enable_cb_prepare+0x19>
> > ffffffff8193a882:       c6 87 8e 00 00 00 00    movb   $0x0,0x8e(%rdi)
> > ffffffff8193a889:       8b 87 80 00 00 00       mov    0x80(%rdi),%eax
> > ffffffff8193a88f:       85 c0                   test   %eax,%eax
> > ffffffff8193a891:       74 15                   je
> > ffffffff8193a8a8 <virtqueue_enable_cb_prepare+0x38>
> > ffffffff8193a893:       83 f8 01                cmp    $0x1,%eax
> > ffffffff8193a896:       75 20                   jne
> > ffffffff8193a8b8 <virtqueue_enable_cb_prepare+0x48>
> > ffffffff8193a898:       48 8b 05 49 03 4a 01    mov
> > 0x14a0349(%rip),%rax        # ffffffff82ddabe8 <all_ops+0x8>
> > ffffffff8193a89f:       48 8b 40 28             mov    0x28(%rax),%rax
> > ffffffff8193a8a3:       e9 b8 d8 9b 00          jmpq
> > ffffffff822f8160 <__x86_indirect_thunk_array>
> > ffffffff8193a8a8:       48 8b 05 31 03 4a 01    mov
> > 0x14a0331(%rip),%rax        # ffffffff82ddabe0 <all_ops>
> > ffffffff8193a8af:       48 8b 40 28             mov    0x28(%rax),%rax
> > ffffffff8193a8b3:       e9 a8 d8 9b 00          jmpq
> > ffffffff822f8160 <__x86_indirect_thunk_array>
> > ffffffff8193a8b8:       0f 0b                   ud2
> > ffffffff8193a8ba:       66 0f 1f 44 00 00       nopw   0x0(%rax,%rax,1)
> >
> > indirection call is still being mitigated via thunk.
>
>
>
> This is because you put the pointers there, and the pointers
> are not const themselves.
>
>
> const struct virtqueue_ops * const all_ops[VQ_TYPE_MAX]
>
> should do the trick.
>
>
>
> Here is the example I wrote:
>
> enum vqtype {
>         SPLIT,
>         SPLIT_IN_ORDER,
>         PACKED,
>         PACKED_IN_ORDER,
>         MAX
> };
>
>
> struct ops {
>         int (*foo)(int bar);
> };
>
> extern int packed(int);
> extern int packedinorder(int);
> extern int split(int);
> extern int splitinorder(int);
>
> const struct ops splitops =3D { split };
> const struct ops packedops =3D { packed };
> const struct ops packedinorderops =3D { packedinorder };
> const struct ops splitinorderops =3D { splitinorder };
>
> const struct ops *const allopsp[MAX] =3D { [SPLIT] =3D &splitops, [SPLIT_=
IN_ORDER] =3D &splitinorderops, [PACKED] =3D &packedops, [PACKED_IN_ORDER] =
=3D &packedinorderops};
> const struct ops allops[MAX] =3D { [SPLIT] =3D {split}, [SPLIT_IN_ORDER] =
=3D { splitinorder}, [PACKED] =3D { packed }, [PACKED_IN_ORDER] =3D {packed=
inorder}};
>
> int foo(int argc)
> {
>         switch (argc) {
>                 case 0:
>                 return allops[PACKED].foo(argc);
>                 case 1:
>                 return allops[SPLIT].foo(argc);
>                 case 2:
>                 return allops[PACKED_IN_ORDER].foo(argc);
>                 case 3:
>                 return allops[SPLIT_IN_ORDER].foo(argc);
>                 default:
>                 return 0;
>         }
> }
> extern int foo(int argc);
> int bar(int argc)
> {
>         switch (argc) {
>                 case 0:
>                 return allopsp[PACKED]->foo(argc);
>                 case 1:
>                 return allopsp[SPLIT]->foo(argc);
>                 case 2:
>                 return allopsp[PACKED_IN_ORDER]->foo(argc);
>                 case 3:
>                 return allopsp[SPLIT_IN_ORDER]->foo(argc);
>                 default:
>                 return 0;
>         }
> }
> extern int bar(int argc);
> int main(int argc, char **argv)
> {
>         foo(argc);
>         bar(argc);
>         return 0;
> }
>
>
>
> then:
> $ gcc -c -O2 -ggdb main.c
> $ objdump -r -ld main.o
>
> main.o:     file format elf64-x86-64
> mst@tuck:~$ objdump -r -ld main.o
>
> main.o:     file format elf64-x86-64
>
>
> Disassembly of section .text:
>
> 0000000000000000 <foo>:
> foo():
> /home/mst/main.c:29
>    0:   83 ff 02                cmp    $0x2,%edi
>    3:   74 2a                   je     2f <foo+0x2f>
>    5:   7f 12                   jg     19 <foo+0x19>
>    7:   85 ff                   test   %edi,%edi
>    9:   74 1d                   je     28 <foo+0x28>
>    b:   ff cf                   dec    %edi
>    d:   75 2a                   jne    39 <foo+0x39>
> /home/mst/main.c:33
>    f:   bf 01 00 00 00          mov    $0x1,%edi
>   14:   e9 00 00 00 00          jmp    19 <foo+0x19>
>                         15: R_X86_64_PLT32      split-0x4
> /home/mst/main.c:29
>   19:   83 ff 03                cmp    $0x3,%edi
>   1c:   75 1b                   jne    39 <foo+0x39>
> /home/mst/main.c:37
>   1e:   bf 03 00 00 00          mov    $0x3,%edi
>   23:   e9 00 00 00 00          jmp    28 <foo+0x28>
>                         24: R_X86_64_PLT32      splitinorder-0x4
> /home/mst/main.c:31
>   28:   31 ff                   xor    %edi,%edi
>   2a:   e9 00 00 00 00          jmp    2f <foo+0x2f>
>                         2b: R_X86_64_PLT32      packed-0x4
> /home/mst/main.c:35
>   2f:   bf 02 00 00 00          mov    $0x2,%edi
>   34:   e9 00 00 00 00          jmp    39 <foo+0x39>
>                         35: R_X86_64_PLT32      packedinorder-0x4
> /home/mst/main.c:41
>   39:   31 c0                   xor    %eax,%eax
>   3b:   c3                      ret
>
> 000000000000003c <bar>:
> bar():
> /home/mst/main.c:43
>   3c:   eb c2                   jmp    0 <foo>
>
> Disassembly of section .text.startup:
>
> 0000000000000000 <main>:
> main():
> /home/mst/main.c:60
>    0:   48 83 ec 18             sub    $0x18,%rsp
> /home/mst/main.c:61
>    4:   89 7c 24 0c             mov    %edi,0xc(%rsp)
>    8:   e8 00 00 00 00          call   d <main+0xd>
>                         9: R_X86_64_PLT32       foo-0x4
> /home/mst/main.c:62
>    d:   8b 7c 24 0c             mov    0xc(%rsp),%edi
>   11:   e8 00 00 00 00          call   16 <main+0x16>
>                         12: R_X86_64_PLT32      foo-0x4
> /home/mst/main.c:64
>   16:   31 c0                   xor    %eax,%eax
>   18:   48 83 c4 18             add    $0x18,%rsp
>
>
> compiler was able to figure out they are the same.
>
>

Exactly, it works.

Let me redo the benchmark and post a new version.

Thanks

