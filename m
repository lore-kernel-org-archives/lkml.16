Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E80079CD
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 00:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748997454; cv=none; b=mN2koc3Z/9cSDxLulcnSbOAvCKwY7kRvXNZzIVre2w5TsyQPlWV9bPENTv82ZCmgZpiy9o/oHXfDhV0yweg0Zu8rQ7F761y4bFR5L1CL6OHQzEDBysmvYVpG73QcB7CQL2zRKgDHA/8uQQaI7pIjwQE41QmbMyqT7Pq4NFopZkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748997454; c=relaxed/simple;
	bh=FIhhwRMnEvPjuGUpf9qf+tqZDLEP9lZKLjQ3YYZd4as=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UHAsLGLSSXofxQ+XYWViEAjgoqpD7xaHGHGevWsPUBMksV/7SkGN5nkrUttys9x7hn/AwTG6j5wRvNEKLdTBFeJ+Jbm3SywXt2MI/ctKUG2oSX/Bzuu5gHzbd7uMvaYTjGXgFOtgx4EBvURFIrlWp2i7lXNZE7Hh06DpsgZ6XSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IeyVi1Bx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IeyVi1Bx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748997452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TCJQT/kav5ff3pRxvzcaTAEwPIznqrXjhdq5yD+vQEE=;
	b=IeyVi1BxRcWuhlZAvHSmxFJmdP5hBXqbCxwsPS8J0plqYgBA+U7TgZcdGD+Yd+vWoWudlP
	Ha1TejpBZ8g1yBzqaku97nhAzVHc4LesjiZ8bxSKx31UrgukMPrkIxpKs9AyFROtcaZgER
	HZkzUR99jlSltGRmTPxIpJWFdzj2NzA=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-99UiBA0lOkKJyFnpKB9UFA-1; Tue, 03 Jun 2025 20:37:30 -0400
X-MC-Unique: 99UiBA0lOkKJyFnpKB9UFA-1
X-Mimecast-MFC-AGG-ID: 99UiBA0lOkKJyFnpKB9UFA_1748997449
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-310efe825ccso6228259a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 17:37:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748997449; x=1749602249;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TCJQT/kav5ff3pRxvzcaTAEwPIznqrXjhdq5yD+vQEE=;
        b=sYyrXEJyPDUkVj5IefZHxGbCHAwoEaNnHYs/0ngELo7d0CndMho9GSOlVi3/slDyFb
         ZPvdTqipNFqlBTGurwURijufvrKBrMAeFVweAOO+B3K8gf/+GCeqqMyjDI1/VDCGmQrP
         FDLS8ekC3zFZG0ZMj3cH1xhfCcVDsU389KY8T62p5NqICDNJZTAbBzUxNnVQ80J2Zd/D
         BIt4jbQxhb/dL+OvlVzKquhx+bgzr5K5fOib96rzIuE+4dllhYgghm9TCPGCyjvsDFb7
         rWHKDfB07T62qShkdXGsouCDBX0w1V6SO+22NFNMAgydU9X2YaOo4DhthfSvL9wQe9vu
         E3Pg==
X-Forwarded-Encrypted: i=1; AJvYcCUgdNYogzn+ygJu+iTSXfaRDekT44X0qPchawo5Is/pBrHTY0UrhJT9u+bmYc+6oo+82v5DMTr32uDDBl4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxesDOhD4swl06lgslKnm3uln7p1wQmf4nINhv6E+9qp4K0U07V
	9Q0vp4tLISC8rZLTyZxMEsQt0UC+cK9YnHvG6h7kj3SRl8hZN2ndP9RV/tR+rTwBZd+b7uYrwWz
	CjwRB+ysNhPEYedPVnMIRF3vqQTkeHuHnJr8X5iUDO6QHSqXsNAsNL0o5jTSIE3ISesJCczin7M
	3xDai6PY9W2f7sHWRIUVFsAm/5CLw5AxkdEmxanDRV
X-Gm-Gg: ASbGncuRcQkMrTa6hIuW5YZxYsoeBIyCbIvnLX/DvQFt/HoDD3216xZKk357SUhyt/J
	NyneBdMsHyPgEugUQlPg9Xb2BxC4ZnUikYXFkCOqfrDpSVHRRflMle3CzkMvMY9NYab30+w==
X-Received: by 2002:a17:90b:51c4:b0:311:c1ec:7d0c with SMTP id 98e67ed59e1d1-3130cd65aaemr1426540a91.27.1748997449159;
        Tue, 03 Jun 2025 17:37:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQeODWbQfUbRlPw0j1gKXQJysD64GEXXnB2RuYnjq0y+PzQoFeIG5PN3PQdqbkgUndiDNUyG9oiwKSrJbbewE=
X-Received: by 2002:a17:90b:51c4:b0:311:c1ec:7d0c with SMTP id
 98e67ed59e1d1-3130cd65aaemr1426509a91.27.1748997448759; Tue, 03 Jun 2025
 17:37:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250603150613.83802-1-minhquangbui99@gmail.com>
In-Reply-To: <20250603150613.83802-1-minhquangbui99@gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 4 Jun 2025 08:37:16 +0800
X-Gm-Features: AX0GCFt_tMiNdtyDIBlXvuQJILPten36fjn0u2OKQnhU-6uwjA7mU6t1xM2SrDY
Message-ID: <CACGkMEuHDLJiw=VdX38xqkaS-FJPTAU6+XUNwfGkNZGfp+6tKg@mail.gmail.com>
Subject: Re: [PATCH net] virtio-net: drop the multi-buffer XDP packet in zerocopy
To: Bui Quang Minh <minhquangbui99@gmail.com>
Cc: netdev@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 3, 2025 at 11:07=E2=80=AFPM Bui Quang Minh <minhquangbui99@gmai=
l.com> wrote:
>
> In virtio-net, we have not yet supported multi-buffer XDP packet in
> zerocopy mode when there is a binding XDP program. However, in that
> case, when receiving multi-buffer XDP packet, we skip the XDP program
> and return XDP_PASS. As a result, the packet is passed to normal network
> stack which is an incorrect behavior. This commit instead returns
> XDP_DROP in that case.
>
> Fixes: 99c861b44eb1 ("virtio_net: xsk: rx: support recv merge mode")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bui Quang Minh <minhquangbui99@gmail.com>
> ---
>  drivers/net/virtio_net.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> index e53ba600605a..4c35324d6e5b 100644
> --- a/drivers/net/virtio_net.c
> +++ b/drivers/net/virtio_net.c
> @@ -1309,9 +1309,14 @@ static struct sk_buff *virtnet_receive_xsk_merge(s=
truct net_device *dev, struct
>         ret =3D XDP_PASS;

It would be simpler to just assign XDP_DROP here?

Or if you wish to stick to the way, we can simply remove this assignment.

>         rcu_read_lock();
>         prog =3D rcu_dereference(rq->xdp_prog);
> -       /* TODO: support multi buffer. */
> -       if (prog && num_buf =3D=3D 1)
> -               ret =3D virtnet_xdp_handler(prog, xdp, dev, xdp_xmit, sta=
ts);
> +       if (prog) {
> +               /* TODO: support multi buffer. */
> +               if (num_buf =3D=3D 1)
> +                       ret =3D virtnet_xdp_handler(prog, xdp, dev, xdp_x=
mit,
> +                                                 stats);
> +               else
> +                       ret =3D XDP_DROP;
> +       }
>         rcu_read_unlock();
>
>         switch (ret) {
> --
> 2.43.0
>

Thanks

