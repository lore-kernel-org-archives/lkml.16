Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099EC1465B4
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 02:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750906278; cv=none; b=o9SrtSgQL6jwFadzixzb0//QZJd6uklN2fE97BgbO0edqxmeKGYXEjrXUtZwrWDlW0n9CvEVdND2g+9xOY5zegnC6oZBfrQYAalWORDvyxEDGSoRLmrCWSzQiUZaZAK2Hbwuv0toLbafTi7sICM6r2Atn0a6CsWFrt07XTw89xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750906278; c=relaxed/simple;
	bh=AbbTcY3G90uhbAvwfnDrpva8mh1yG4yY6IHShSbbWSY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qLFlwCfZE1cQlKthjdGPwLO2bv5Jy7lD6poZQVRL+JIYFpZDGWrh/BrhKLLJegnSZb7sZWPaJ1/ECyw1fhZNG29viBMP3JTmMs8vpiT4gmRJn3PrYMUnjpC9voXFIVNIuaU/o8coBb2unKLWt4Z7yo+lTbm90RzGpT1rzCHN8kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Bgk0Jt2i; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Bgk0Jt2i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750906276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xEngYMz6+Uctu+0RSamLzUn3jyWMAMQ76O4pVQprsBY=;
	b=Bgk0Jt2iI9H/Mw3O+hWNIhHvgmXe5183finfMyTyrFHN15RFgzuqwh19wFfg5qMJ4/xRT/
	w5cAL4g9yPtUMEbTRZ887w6u1AseyO04gja/U3YdwJLwBCITv30DbtQrQhhZGmiFauikcc
	BXe91WmOqoWe54cudyHNJjmqBPm7w7w=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-318-YgiCSX7QNWisKrSpa-hYAw-1; Wed, 25 Jun 2025 22:51:14 -0400
X-MC-Unique: YgiCSX7QNWisKrSpa-hYAw-1
X-Mimecast-MFC-AGG-ID: YgiCSX7QNWisKrSpa-hYAw_1750906273
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-313f8835f29so782546a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 19:51:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750906273; x=1751511073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xEngYMz6+Uctu+0RSamLzUn3jyWMAMQ76O4pVQprsBY=;
        b=FXm7ZT6Nsyf3GdhfSC5d1EfD5AEhgUb3NqGE4UGicAKdD6r8MWZoGEvnvEsXPfIweF
         QgTwracUsw/squ/L0Dkt1znpK1Q9dfuMWB/tPRqh0teMDt4aPTVow2v7x+W/Z74hTIz0
         OhWh0ND7PuzvJxr7L8Rlq2GcfGE6mfWZX39/DS9C28GQZv936LOmyTINFi742Ec0aUt/
         VxRVWBnM8SIk+mDsoV+bIIeik9iamcASuoTMQdDy7E3lZklj+Bdnnkyl3v75mmQ+mWWI
         ORPJiFXPkybJmQNxkUYngYbbi9mboWNP1q3xeQShWfqiCyAO81XFTHda82wdQgGz9yLP
         BO0A==
X-Forwarded-Encrypted: i=1; AJvYcCW+jaPYoFGiyqK9Am+t0CFttLMXXGxIAdheBD26wToy4xejlc6TovhU7ZaQVpw21Uk2bTZweX5d4iM+J2M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQsa9Bg68gqA5koXekXxpGd9X60Y8iSMNS5yRhU5knxS8YwVvm
	PnEIGTPOPloU1Ctryyw2c5IXWDKX4GMHNTZApZUtrS8Skm1crMaR9norSx5G3lnY8RjD9c9HoCL
	qKon5zxwG+3AuJh2vs5/+NRLuPQjbmoGCSVrzt3VR/ECxf2GY+E56xVKVDA8Gcf78BTO3vALExS
	j/hqT+KQbnAEtlk1o3SWZLUO48CyLY8PgWKiCctrhW
X-Gm-Gg: ASbGncucoeP2Li72NyRuPd5380cNjjTgH/mWBM8nTZ6CIPCDw/PMeeSwy9+2oPKikxF
	jUzTMqSn9L4YiZ74l78XcqvIOtnSouCnhmMlz5OJLUhOtiP/6qpnmencBOtQ2N42gk5wvJ7py/t
	R3RVzB
X-Received: by 2002:a17:90b:562d:b0:30e:3718:e9d with SMTP id 98e67ed59e1d1-315f26b3e52mr7507595a91.35.1750906273385;
        Wed, 25 Jun 2025 19:51:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFy1oEFNW+pNyBHKxl5UFz4XuW+PyQ5F7+ZNjbo3jFzhfPpd3FRUMNsXAMnW3CCIEXyQmt+3K6tjBWZQ09ordg=
X-Received: by 2002:a17:90b:562d:b0:30e:3718:e9d with SMTP id
 98e67ed59e1d1-315f26b3e52mr7507572a91.35.1750906273025; Wed, 25 Jun 2025
 19:51:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625160849.61344-1-minhquangbui99@gmail.com> <20250625160849.61344-5-minhquangbui99@gmail.com>
In-Reply-To: <20250625160849.61344-5-minhquangbui99@gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 26 Jun 2025 10:51:01 +0800
X-Gm-Features: Ac12FXxCVxp6548gkQ8YE-vjFv3IjVZGUSKTIBIUxHnJq7DtVbLHmVNL-WVcg1k
Message-ID: <CACGkMEv-EgkZs6d4MHwxj0t_-pQvxMRLTdgguP7GUijbg-kEoA@mail.gmail.com>
Subject: Re: [PATCH net 4/4] virtio-net: allow more allocated space for
 mergeable XDP
To: Bui Quang Minh <minhquangbui99@gmail.com>
Cc: netdev@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, virtualization@lists.linux.dev, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 26, 2025 at 12:10=E2=80=AFAM Bui Quang Minh
<minhquangbui99@gmail.com> wrote:
>
> When the mergeable receive buffer is prefilled before XDP is set, it
> does not reserve the space for XDP_PACKET_HEADROOM and skb_shared_info.
> So when XDP is set and this buffer is used to receive frame, we need to
> create a new buffer with reserved headroom, tailroom and copy the frame
> data over. Currently, the new buffer's size is restricted to PAGE_SIZE
> only. If the frame data's length + headroom + tailroom exceeds
> PAGE_SIZE, the frame is dropped.
>
> However, it seems like there is no restriction on the total size in XDP.
> So we can just increase the size of new buffer to 2 * PAGE_SIZE in that
> case and continue to process the frame.
>
> In my opinion, the current drop behavior is fine and expected so this
> commit is just an improvement not a bug fix.

Then this should go for net-next.

>
> Signed-off-by: Bui Quang Minh <minhquangbui99@gmail.com>
> ---
>  drivers/net/virtio_net.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> index 844cb2a78be0..663cec686045 100644
> --- a/drivers/net/virtio_net.c
> +++ b/drivers/net/virtio_net.c
> @@ -2277,13 +2277,26 @@ static void *mergeable_xdp_get_buf(struct virtnet=
_info *vi,
>                                               len);
>                 if (!xdp_page)
>                         return NULL;
> +
> +               *frame_sz =3D PAGE_SIZE;
>         } else {
> +               unsigned int total_len;
> +
>                 xdp_room =3D SKB_DATA_ALIGN(XDP_PACKET_HEADROOM +
>                                           sizeof(struct skb_shared_info))=
;
> -               if (*len + xdp_room > PAGE_SIZE)
> +               total_len =3D *len + xdp_room;
> +
> +               /* This must never happen because len cannot exceed PAGE_=
SIZE */
> +               if (unlikely(total_len > 2 * PAGE_SIZE))
>                         return NULL;
>
> -               xdp_page =3D alloc_page(GFP_ATOMIC);
> +               if (total_len > PAGE_SIZE) {
> +                       xdp_page =3D alloc_pages(GFP_ATOMIC, 1);

I'm not sure it's worth optimizing the corner case here that may bring
burdens for maintenance.

And a good optimization here is to reduce the logic duplication by
reusing xdp_linearize_page().


> +                       *frame_sz =3D 2 * PAGE_SIZE;
> +               } else {
> +                       xdp_page =3D alloc_page(GFP_ATOMIC);
> +                       *frame_sz =3D PAGE_SIZE;
> +               }
>                 if (!xdp_page)
>                         return NULL;
>
> @@ -2291,8 +2304,6 @@ static void *mergeable_xdp_get_buf(struct virtnet_i=
nfo *vi,
>                        page_address(*page) + offset, *len);
>         }
>
> -       *frame_sz =3D PAGE_SIZE;
> -
>         put_page(*page);
>
>         *page =3D xdp_page;
> --

Thanks

> 2.43.0
>

