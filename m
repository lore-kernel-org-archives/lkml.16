Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372C0F510
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 03:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751860113; cv=none; b=rOKU6evAtVtilSLYvyy53707E0yZsAYS65CTUxvnEMwebXnUD/WHLn6L9gtCWvXY7mkVcXo5AR2yRuakg1LNl5kTroR39xYBsb/cCYLYJtZXsTzlZUlwH3TuX5StpO7yqJjoKcWSZNApb96LPlOy+o57rHbFkXFmu9W1hM+H37g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751860113; c=relaxed/simple;
	bh=hUgXGL6XScPWELGspZVQ6oo3NDlNSw5oN4mTr0d1/Gw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KKxmGzpOnLTjnAGeA17lxlwmfqcLgm/kc2CLOJGLHsJqkj5kpd47hZq6dEhf6VrvyeVXFgEnYUD8THj9PmRkj5eVv8yAdocv8JqJWNHeaLiPt/IQl1fPf4I8jRBL2LFqssg40b06liUvaCna+IQYHP2BIpOiJ3tghW1ybGk82uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ewhri7ca; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ewhri7ca"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751860111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EW/dDjcSXDhHVRdF+Q/wfrSLxpfj5IbBx6F7oYcVw2A=;
	b=Ewhri7cagVY0KePoMhwCgsuArwKCzF74/7om5qGntoHSshi0AyNEoxYdQJd45H0lDOGQ+3
	kn+BCxB06oqn7Cw7y/FfYdwnP/YHYHV+yV1tjzB9MYAARzX9PnFeS+xDOaAv9XiIrRLdsF
	zP2ZLgJog8L4/UZy6qmB16zqvcFPhwY=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-0fY1YAvZNOiyZisdZu2nIQ-1; Sun, 06 Jul 2025 23:48:29 -0400
X-MC-Unique: 0fY1YAvZNOiyZisdZu2nIQ-1
X-Mimecast-MFC-AGG-ID: 0fY1YAvZNOiyZisdZu2nIQ_1751860109
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-311e7337f26so2165563a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 20:48:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751860108; x=1752464908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EW/dDjcSXDhHVRdF+Q/wfrSLxpfj5IbBx6F7oYcVw2A=;
        b=obMNspEjfumvQeVfmx+ZiRu37PH5v7gEYb6QlOm01sNaDthZ4ESV21hogdzRvY5GZZ
         DjjpF8fqODPIOi6dQkC4ITw55wvf22OtajEk4IXkDlrvUIt7GmRRSVF8GAfAuE6w1CYb
         tkjy9jnSIdDbk1N8hwEfnBbGsttpQVwxVwlglhWzxLBXIXAGU6uW8PBGsxGTS47Y2e97
         qDG0Ad0oR8Q8PVui/WjhtBkf7GpNGul1aoYsqmS50F5k1Tde9OYXyrcYOW1+bbxy/14I
         AeT3Qw/1H9tHDdoXm6Si35xuBk8Fzth3YGTJs8IQGiCXiVau8sAysibPs37/rzO+dtez
         80oQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdf3NrELvfB/5r8ublN89DijZiH4DLbh8rcAn/OLdLO1KKIVRldcvS0P/XcOzpOSj+SN4RRxVyGOT5ykw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpGcWBNFIaIuMVkyfgEJaDx9EP5WKGt6LC6gz0x2+tTeLFOaGs
	sruT4fkaJUjGSaz/RtbYxm4uvAbK4XhphvZcObwMMBpO78wQ7iem5wRUQwbjA3XnQL8iXcw8rhI
	Q0fiK0UprwqJkUD+JxOAyW5g9Gd7WPi3huF29wX0nejKyuX18oT7TQfkS3FuvaeZN/6GrynUftS
	G3c1WjKm6a5UN5N5fuT3LEAfQBO+5sTFJH5cNIUxYp
X-Gm-Gg: ASbGncus05Wrf358O+3ar8gcoOooRUPxqqI3kKDyB5QHrOstuAg/LDNpkR7PFjjwd1b
	+rqiSrDC4SCCZQu08XO6RDCUCuH8Ty7sJfkWz73/D4+7EVy8A9DZSobxSCmRXVSYb3Ng6QSiGu+
	uzNB4T
X-Received: by 2002:a17:90b:274c:b0:31c:15d9:8ae with SMTP id 98e67ed59e1d1-31c15d9099amr1263943a91.33.1751860108576;
        Sun, 06 Jul 2025 20:48:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjLb5nG3GcvhfATU5YJqipasKEl1n2CvdNYfWsQeu5NtxG78x5LGLp605MHradsamcw9tKsvLkrHk8wmRzWvI=
X-Received: by 2002:a17:90b:274c:b0:31c:15d9:8ae with SMTP id
 98e67ed59e1d1-31c15d9099amr1263906a91.33.1751860108149; Sun, 06 Jul 2025
 20:48:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250706141150.25344-1-minhquangbui99@gmail.com>
In-Reply-To: <20250706141150.25344-1-minhquangbui99@gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 7 Jul 2025 11:48:16 +0800
X-Gm-Features: Ac12FXxSGGJmrV5EcaTZUCctsvVfb41fa-ZbkWFbatrKcNL0Fp0w8Ch0gj5Rdr8
Message-ID: <CACGkMEvCZ1D7k+=V-Ta9hXpdW4ofnbXfQ4JcADXabC13CA884A@mail.gmail.com>
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

On Sun, Jul 6, 2025 at 10:12=E2=80=AFPM Bui Quang Minh <minhquangbui99@gmai=
l.com> wrote:
>
> Since commit 4959aebba8c0 ("virtio-net: use mtu size as buffer length
> for big packets"), the allocated size for big packets is not
> MAX_SKB_FRAGS * PAGE_SIZE anymore but depends on negotiated MTU. The
> number of allocated frags for big packets is stored in
> vi->big_packets_num_skbfrags. This commit fixes the received length
> check corresponding to that change. The current incorrect check can lead
> to NULL page pointer dereference in the below while loop when erroneous
> length is received.
>
> Fixes: 4959aebba8c0 ("virtio-net: use mtu size as buffer length for big p=
ackets")
> Signed-off-by: Bui Quang Minh <minhquangbui99@gmail.com>
> ---
>  drivers/net/virtio_net.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> index 5d674eb9a0f2..ead1cd2fb8af 100644
> --- a/drivers/net/virtio_net.c
> +++ b/drivers/net/virtio_net.c
> @@ -823,7 +823,7 @@ static struct sk_buff *page_to_skb(struct virtnet_inf=
o *vi,
>  {
>         struct sk_buff *skb;
>         struct virtio_net_common_hdr *hdr;
> -       unsigned int copy, hdr_len, hdr_padded_len;
> +       unsigned int copy, hdr_len, hdr_padded_len, max_remaining_len;
>         struct page *page_to_free =3D NULL;
>         int tailroom, shinfo_size;
>         char *p, *hdr_p, *buf;
> @@ -887,12 +887,16 @@ static struct sk_buff *page_to_skb(struct virtnet_i=
nfo *vi,
>          * tries to receive more than is possible. This is usually
>          * the case of a broken device.
>          */
> -       if (unlikely(len > MAX_SKB_FRAGS * PAGE_SIZE)) {
> +       BUG_ON(offset >=3D PAGE_SIZE);
> +       max_remaining_len =3D (unsigned int)PAGE_SIZE - offset;
> +       max_remaining_len +=3D vi->big_packets_num_skbfrags * PAGE_SIZE;
> +       if (unlikely(len > max_remaining_len)) {
>                 net_dbg_ratelimited("%s: too much data\n", skb->dev->name=
);
>                 dev_kfree_skb(skb);
> +               give_pages(rq, page);

Should this be an independent fix?

>                 return NULL;
>         }
> -       BUG_ON(offset >=3D PAGE_SIZE);
> +
>         while (len) {
>                 unsigned int frag_size =3D min((unsigned)PAGE_SIZE - offs=
et, len);
>                 skb_add_rx_frag(skb, skb_shinfo(skb)->nr_frags, page, off=
set,
> --
> 2.43.0
>

Thanks

