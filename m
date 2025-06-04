Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C143D2C324C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 01:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749000442; cv=none; b=cNfTRlZUTF1fKMTMKPQuBUPf0H+lXb2B1y6IeJGl/D00P1eHukcyqh91tsMt6+QypZu6D8r6CgOVSut/+48aKK4lcQTekLFmxEimV7nPQ+GH/sNjtmwhMsElt1TNOXmKMjt6hgq/OH5YONI7h8BUf3FNY9+zR9l1rHo2tL6whL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749000442; c=relaxed/simple;
	bh=zj+kNdMecZ1mWILUvz4WG8GAQb/rm/mvr7EU/CCZ8DI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=erwx925NhX0Tpv6cDParoE9o/xUayLu7JytodqZrORR+kQvQIKo5VK6Mx1LuBCrTidQpA1XRUYo1lZk5HLYoMutFQm0GZr96mkCNIXzRgV/62gEpF4Af2ut4oMGfBqtTZfZ7YpMGP3gOoavzNik82x3ZECU4+5P9ErmhzA3uN5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FiMEPWcI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FiMEPWcI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749000438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BVmJXGHCgwooCqymme55wOEwxwtQ0yZmHm9VDK+DDWs=;
	b=FiMEPWcI1myBY4wOs3/HanZaJbN5Mgdem+ditHx8t0gyxyHlexv1G4UD3Jh87sqbgFRkIj
	iKY9rdemcTeP2mhXCaiiMmrQroNebtxOMa2UlkBTHjtY5zHXlAuqQVyYKZbTBBZ/7gdnQJ
	TU4R8ym7NySQXWpFIJeBtZit2Dxiqhw=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-467-6B--Hj6yNlubc2byGe5N5g-1; Tue, 03 Jun 2025 21:27:17 -0400
X-MC-Unique: 6B--Hj6yNlubc2byGe5N5g-1
X-Mimecast-MFC-AGG-ID: 6B--Hj6yNlubc2byGe5N5g_1749000436
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7462aff55bfso5034694b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 18:27:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749000436; x=1749605236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BVmJXGHCgwooCqymme55wOEwxwtQ0yZmHm9VDK+DDWs=;
        b=HKT4myVdiMkfhAr0JSrYcMNPEzc+lJzcvMAJwF6U8Y1gWnHZGKGIfZort+OO9iWJwO
         OX1+NjXnwAkYUHE6wZxaWXWfRjNVvMyJAm9TaVsEyk2kWNVNyBIWUdLxGdMG97eBeOLw
         IkGAiRPa7bEMmBGs0hVrfGo8WfFeLYED4SE0UJWGd/qrXJj+0HIEWYRCKLhZ4NedI7og
         igUroC0OiCUvhxoqjHXwhMs6REMS2qL/5uExSYGMPr/MLiq3jXdaGFjQGLlYaf4Xq5zy
         0d33nAmO6/TJf/Rqx8ClU/xmttSAQ5nkeN+N+L6C9tRG147rtpnUiHc+6Zr8xjE9qZ1E
         +AJw==
X-Forwarded-Encrypted: i=1; AJvYcCUXdEnSgrFTP0zkGNYX6VxpKo8QOqWkglJausM0JrtB4A0ad79ku2TafS06lzbA4+iCkaSSHedejtSBtZY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXB2yjiPhy/+J2s192VaqacEEjJYLdbDZwjcp4vA62bisrjXx1
	AAqtxeGdwIEZlG67uBiuebEDWVG/nZo4b3mwLJmhWVZO4hb5E4Yvccr4YP2b/ZxsdVtffUC5jHO
	xHGq9s8MEvV/M3IV5MesT/w2DypK+302ErOUwnzqEqlS5eyQ2Dmo0LV7tvyk3Rrw57K04hUXWrC
	TyA54IoizHSygY0axZ94BvCySRFRj/fhP0mD/9ltai
X-Gm-Gg: ASbGncv451CVr4hUjrd5l4p3SEooGJvJIg471Z4uCifctOczAzQJ6IzR881XsgmIx+0
	WT8C0ckYxUpDWc0RZaZEnzI3ec2QvVmpBJYO7dMQGSQb2hNmSqgo5/jSqL18r4mjwLascXg==
X-Received: by 2002:a05:6a00:218e:b0:746:cc71:cc0d with SMTP id d2e1a72fcca58-7480b48d71emr1594628b3a.12.1749000436442;
        Tue, 03 Jun 2025 18:27:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFU7UshbqAmiFChVYE6GtmnkwbH2sxix2Z0rwMiDn2wsmE31jBilsjSxpe70S1Y+X8iIvmuRFYjW8X4WKcP5fA=
X-Received: by 2002:a05:6a00:218e:b0:746:cc71:cc0d with SMTP id
 d2e1a72fcca58-7480b48d71emr1594593b3a.12.1749000436015; Tue, 03 Jun 2025
 18:27:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530-rss-v12-0-95d8b348de91@daynix.com> <20250530-rss-v12-3-95d8b348de91@daynix.com>
In-Reply-To: <20250530-rss-v12-3-95d8b348de91@daynix.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 4 Jun 2025 09:27:05 +0800
X-Gm-Features: AX0GCFuYlEXU2HjXeMTaDnRIvTFcw3ocyvQ95aagHgYzrm-PLm8iX2G4BD1kF-4
Message-ID: <CACGkMEvVf0LrquZcWSv3vp-r44sTj0ZDnjwbwB20N0aU35+vxw@mail.gmail.com>
Subject: Re: [PATCH net-next v12 03/10] tun: Allow steering eBPF program to
 fall back
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, kvm@vger.kernel.org, 
	virtualization@lists.linux-foundation.org, linux-kselftest@vger.kernel.org, 
	Yuri Benditovich <yuri.benditovich@daynix.com>, Andrew Melnychenko <andrew@daynix.com>, 
	Stephen Hemminger <stephen@networkplumber.org>, gur.stavi@huawei.com, 
	Lei Yang <leiyang@redhat.com>, Simon Horman <horms@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 30, 2025 at 12:50=E2=80=AFPM Akihiko Odaki <akihiko.odaki@dayni=
x.com> wrote:
>
> This clarifies a steering eBPF program takes precedence over the other
> steering algorithms.

Let's give an example on the use case for this.

>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>  Documentation/networking/tuntap.rst |  7 +++++++
>  drivers/net/tun.c                   | 28 +++++++++++++++++-----------
>  include/uapi/linux/if_tun.h         |  9 +++++++++
>  3 files changed, 33 insertions(+), 11 deletions(-)
>
> diff --git a/Documentation/networking/tuntap.rst b/Documentation/networki=
ng/tuntap.rst
> index 4d7087f727be..86b4ae8caa8a 100644
> --- a/Documentation/networking/tuntap.rst
> +++ b/Documentation/networking/tuntap.rst
> @@ -206,6 +206,13 @@ enable is true we enable it, otherwise we disable it=
::
>        return ioctl(fd, TUNSETQUEUE, (void *)&ifr);
>    }
>
> +3.4 Reference
> +-------------
> +
> +``linux/if_tun.h`` defines the interface described below:
> +
> +.. kernel-doc:: include/uapi/linux/if_tun.h
> +
>  Universal TUN/TAP device driver Frequently Asked Question
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>
> diff --git a/drivers/net/tun.c b/drivers/net/tun.c
> index d8f4d3e996a7..9133ab9ed3f5 100644
> --- a/drivers/net/tun.c
> +++ b/drivers/net/tun.c
> @@ -476,21 +476,29 @@ static u16 tun_automq_select_queue(struct tun_struc=
t *tun, struct sk_buff *skb)
>         return txq;
>  }
>
> -static u16 tun_ebpf_select_queue(struct tun_struct *tun, struct sk_buff =
*skb)
> +static bool tun_ebpf_select_queue(struct tun_struct *tun, struct sk_buff=
 *skb,
> +                                 u16 *ret)
>  {
>         struct tun_prog *prog;
>         u32 numqueues;
> -       u16 ret =3D 0;
> +       u32 prog_ret;
> +
> +       prog =3D rcu_dereference(tun->steering_prog);
> +       if (!prog)
> +               return false;
>
>         numqueues =3D READ_ONCE(tun->numqueues);
> -       if (!numqueues)
> -               return 0;
> +       if (!numqueues) {
> +               *ret =3D 0;
> +               return true;
> +       }
>
> -       prog =3D rcu_dereference(tun->steering_prog);
> -       if (prog)
> -               ret =3D bpf_prog_run_clear_cb(prog->prog, skb);
> +       prog_ret =3D bpf_prog_run_clear_cb(prog->prog, skb);
> +       if (prog_ret =3D=3D TUN_STEERINGEBPF_FALLBACK)
> +               return false;

This seems to break the uAPI. So I think we need a new ioctl to enable
the behaviour

>
> -       return ret % numqueues;
> +       *ret =3D (u16)prog_ret % numqueues;
> +       return true;
>  }
>
>  static u16 tun_select_queue(struct net_device *dev, struct sk_buff *skb,
> @@ -500,9 +508,7 @@ static u16 tun_select_queue(struct net_device *dev, s=
truct sk_buff *skb,
>         u16 ret;
>
>         rcu_read_lock();
> -       if (rcu_dereference(tun->steering_prog))
> -               ret =3D tun_ebpf_select_queue(tun, skb);
> -       else
> +       if (!tun_ebpf_select_queue(tun, skb, &ret))
>                 ret =3D tun_automq_select_queue(tun, skb);
>         rcu_read_unlock();
>
> diff --git a/include/uapi/linux/if_tun.h b/include/uapi/linux/if_tun.h
> index 287cdc81c939..980de74724fc 100644
> --- a/include/uapi/linux/if_tun.h
> +++ b/include/uapi/linux/if_tun.h
> @@ -115,4 +115,13 @@ struct tun_filter {
>         __u8   addr[][ETH_ALEN];
>  };
>
> +/**
> + * define TUN_STEERINGEBPF_FALLBACK - A steering eBPF return value to fa=
ll back
> + *
> + * A steering eBPF program may return this value to fall back to the ste=
ering
> + * algorithm that should have been used if the program was not set. This=
 allows
> + * selectively overriding the steering decision.
> + */
> +#define TUN_STEERINGEBPF_FALLBACK -1

Not a native speaker, consider it works more like XDP_PASS, would it
be better to use "TUN_STERRING_PASS"?

Thanks

> +
>  #endif /* _UAPI__IF_TUN_H */
>
> --
> 2.49.0
>

