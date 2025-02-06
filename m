Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773E01A08CA
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 18:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738866965; cv=none; b=J3GL7hZpl0VW+W4aj6vjbOg64c4FzCUYUuuWI2fZeOOa0c50jq7g6EN0KFTY9qgDHXD3dLWXChArAtEkZEwNXaXcrw+PjNG+lvtZ1gE35BM+otqoBh9fZ+9/uo50dHnvIQ4085VBwajcRbC+cHwodBtbCVCmwUwr2L3VmTraqXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738866965; c=relaxed/simple;
	bh=6k0c514ifgRxumVpwmuklzpT5/ghthq6fO5uum6kidQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wa0h2mW5sDwt/wQGbUxHnW0kdbnTGb4qM618Hs40tzjuEhER5r+MdgEuXq6uxKv2cq0TNdFZPAd+JUujSyVTZP9wDWupqhtHt36ja2+12yASr0drQr6ndTv3kkYW2Bh7LR7OOJq+IG7emBNjvdyDHD9sK8LPaNdmQuvIrHxxyTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4JoHTE0C; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4JoHTE0C"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5dcef33eeceso2097742a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 10:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738866962; x=1739471762; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O8XOC3TytrR9S7MCmV022YQgT71sHiaPGs7/xP0Tr+s=;
        b=4JoHTE0CWwe2DfunqmhhT+qByDmP4059sqtY5kqDq3IAbcqe0L+YmbKjWfGbyyNBw+
         6/hKCvrpuP7RtBUc/dvQ19qLaKYWjFEAqlm/Ir4GiIf9/SaGLHozHbKKgiJ2FDdhaRMH
         7UAAyJB5TRTtE1Xtn1bT2ZXa9fxZALhTI5eO/CJTqZxyedOBrpVoTVbWmuAOFpHqtVfZ
         BRSBS18fV1bchahTZNXWGQg803aVLe1u0OKBJ4QHq/iKjob9XEaQXotnWd0q8gNLWVt4
         oENyDKCzoEI9W5PjRmAclXdzeoUCXJLTBJR0YfBStsjSTKdLgErZrD/1dJZHgd/XjzYL
         OyZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738866962; x=1739471762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O8XOC3TytrR9S7MCmV022YQgT71sHiaPGs7/xP0Tr+s=;
        b=MgWEbrS36qkFL1YT5JTSY180IkmngrDIjY/00gMyhqLwCWTkAcaqMReW9oT+Gee52r
         GGRmYK8tARC42AnvnNH1TBnRgvvDqHRtRV6zwcTV/vuwa7ocFCZ1FrPY/Jjvpeq3YRW3
         rpLV09l+VGRFgOnnpdktr7Z0q+qRedROnn8oZxb55Uu43eB36GfwD7Mh28WQOglOtbNm
         Acp/xDWY+QHyzcE0Ji0JLlDO9/Zx7LRcH329VGyEVI5/W6RjgcVb+yYBBeX2qmP8F5Gs
         yHWiTShMRMonUbRXChuZR9C1OpEmHffoybfoHM3JV7uLMrsbp9NEWPUwsJ/22dtPf3Hn
         DVgg==
X-Forwarded-Encrypted: i=1; AJvYcCXL4aZzdqPENoxvl8pc9KV+6KNDK6sQPssdi3HO2TG+swoZNfg1rsuofLH+oC7amqhNHuMK2MeA1UtSyic=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqb6QCyzK4dKJ8HeDjkafQv6P4M+IoDo6j+1CTkwFfu7zDGMWl
	7y1jn5I3wumCcg1QOpERuw1Bu3ihei3wVCwseQYPJJHCkP8ERNKf2qcfhMNN+1QsXp38i/R+jmN
	05zpoQ6zs7pHBi5lM78g9R0vpBmyn/k+A8rlt
X-Gm-Gg: ASbGncsVQ7kAkWtMw1Iwi8prIJmm/Sr1REYLI2HzBuXEh145rrKH9N5BXfpZBjPYLIV
	edevQUiPq347YX5bHb8VNn2lWBmNK8VA+oG3E+/cgT2+8A48+V8POzFt/1/qfEx2qDqYJ1/wJaw
	==
X-Google-Smtp-Source: AGHT+IFXoIlo5OhRCrRfNENEXc9lTNGNnilDEW1dMSiWoU33MHjOBEIQu2SK614pEEXybYMSzqUG2hkz3c1RbOLHTv0=
X-Received: by 2002:a05:6402:13ca:b0:5de:3ce0:a489 with SMTP id
 4fb4d7f45d1cf-5de45048206mr508392a12.10.1738866961551; Thu, 06 Feb 2025
 10:36:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250205163609.3208829-1-aleksander.lobakin@intel.com>
 <20250205163609.3208829-2-aleksander.lobakin@intel.com> <CANn89iJjCOThDqwsK4v2O8LfcwAB55YohNZ8T2sR40uM2ZoX5w@mail.gmail.com>
 <fe1b0def-89d1-4db3-bf98-7d6c61ff5361@intel.com>
In-Reply-To: <fe1b0def-89d1-4db3-bf98-7d6c61ff5361@intel.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 6 Feb 2025 19:35:50 +0100
X-Gm-Features: AWEUYZkgMWMsqddmhSmfJEHSnYJnyX3bRJ9m7a-gsPgESmDHp_hBbW4k9tvnkg4
Message-ID: <CANn89iJr1R4BGK2Qd+OEgsE7kEPi7X8tgyxjHnYoU7VOU_wgfA@mail.gmail.com>
Subject: Re: [PATCH net-next v4 1/8] net: gro: decouple GRO from the NAPI layer
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Daniel Xu <dxu@dxuuu.xyz>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 1:15=E2=80=AFPM Alexander Lobakin
<aleksander.lobakin@intel.com> wrote:
>
> From: Eric Dumazet <edumazet@google.com>
> Date: Wed, 5 Feb 2025 18:48:50 +0100
>
> > On Wed, Feb 5, 2025 at 5:46=E2=80=AFPM Alexander Lobakin
> > <aleksander.lobakin@intel.com> wrote:
> >>
> >> In fact, these two are not tied closely to each other. The only
> >> requirements to GRO are to use it in the BH context and have some
> >> sane limits on the packet batches, e.g. NAPI has a limit of its
> >> budget (64/8/etc.).
> >> Move purely GRO fields into a new tagged group, &gro_node. Embed it
> >> into &napi_struct and adjust all the references. napi_id doesn't
> >> really belong to GRO, but:
> >>
> >> 1. struct gro_node has a 4-byte padding at the end anyway. If you
> >>    leave napi_id outside, struct napi_struct takes additional 8 bytes
> >>    (u32 napi_id + another 4-byte padding).
> >> 2. gro_receive_skb() uses it to mark skbs. We don't want to split it
> >>    into two functions or add an `if`, as this would be less efficient,
> >>    but we need it to be NAPI-independent. The current approach doesn't
> >>    change anything for NAPI-backed GROs; for standalone ones (which
> >>    are less important currently), the embedded napi_id will be just
> >>    zero =3D> no-op.
> >>
> >> Three Ethernet drivers use napi_gro_flush() not really meant to be
> >> exported, so move it to <net/gro.h> and add that include there.
> >> napi_gro_receive() is used in more than 100 drivers, keep it
> >> in <linux/netdevice.h>.
> >> This does not make GRO ready to use outside of the NAPI context
> >> yet.
> >>
> >> Tested-by: Daniel Xu <dxu@dxuuu.xyz>
> >> Acked-by: Jakub Kicinski <kuba@kernel.org>
> >> Reviewed-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>
> >> Signed-off-by: Alexander Lobakin <aleksander.lobakin@intel.com>
> >> ---
> >>  include/linux/netdevice.h                  | 26 +++++---
> >>  include/net/busy_poll.h                    | 11 +++-
> >>  include/net/gro.h                          | 35 +++++++----
> >>  drivers/net/ethernet/brocade/bna/bnad.c    |  1 +
> >>  drivers/net/ethernet/cortina/gemini.c      |  1 +
> >>  drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c |  1 +
> >>  net/core/dev.c                             | 60 ++++++++-----------
> >>  net/core/gro.c                             | 69 +++++++++++----------=
-
> >>  8 files changed, 112 insertions(+), 92 deletions(-)
> >>
> >> diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
> >> index 2a59034a5fa2..d29b6ebde73f 100644
> >> --- a/include/linux/netdevice.h
> >> +++ b/include/linux/netdevice.h
> >> @@ -340,8 +340,8 @@ struct gro_list {
> >>  };
> >>
> >>  /*
> >> - * size of gro hash buckets, must less than bit number of
> >> - * napi_struct::gro_bitmask
> >> + * size of gro hash buckets, must be <=3D the number of bits in
> >> + * gro_node::bitmask
> >>   */
> >>  #define GRO_HASH_BUCKETS       8
> >>
> >> @@ -370,7 +370,6 @@ struct napi_struct {
> >>         unsigned long           state;
> >>         int                     weight;
> >>         u32                     defer_hard_irqs_count;
> >> -       unsigned long           gro_bitmask;
> >>         int                     (*poll)(struct napi_struct *, int);
> >>  #ifdef CONFIG_NETPOLL
> >>         /* CPU actively polling if netpoll is configured */
> >> @@ -379,11 +378,14 @@ struct napi_struct {
> >>         /* CPU on which NAPI has been scheduled for processing */
> >>         int                     list_owner;
> >>         struct net_device       *dev;
> >> -       struct gro_list         gro_hash[GRO_HASH_BUCKETS];
> >>         struct sk_buff          *skb;
> >> -       struct list_head        rx_list; /* Pending GRO_NORMAL skbs */
> >> -       int                     rx_count; /* length of rx_list */
> >> -       unsigned int            napi_id; /* protected by netdev_lock *=
/
> >> +       struct_group_tagged(gro_node, gro,
> >> +               unsigned long           bitmask;
> >> +               struct gro_list         hash[GRO_HASH_BUCKETS];
> >> +               struct list_head        rx_list; /* Pending GRO_NORMAL=
 skbs */
> >> +               int                     rx_count; /* length of rx_list=
 */
> >> +               u32                     napi_id; /* protected by netde=
v_lock */
> >> +
> >
> > I am old school, I would prefer a proper/standalone old C construct.
> >
> > struct gro_node  {
> >                 unsigned long           bitmask;
> >                struct gro_list         hash[GRO_HASH_BUCKETS];
> >                struct list_head        rx_list; /* Pending GRO_NORMAL s=
kbs */
> >                int                     rx_count; /* length of rx_list *=
/
> >                u32                     napi_id; /* protected by netdev_=
lock */
> > };
> >
> > Really, what struct_group_tagged() can possibly bring here, other than
> > obfuscation ?
>
> You'd need to adjust every ->napi_id access, which is a lot.
> Plus, as I wrote previously, napi_id doesn't really belong here, but
> embedding it here eases life.
>
> I'm often an old school, too, but sometimes this helps a lot.
> Unless you have very strong preference on this.
>

Is struct_group_tagged even supported by ctags ?

In terms of maintenance, I am sorry to say this looks bad to me.

Even without ctags, I find git grep -n "struct xxxx {" quite good.
