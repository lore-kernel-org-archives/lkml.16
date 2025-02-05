Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881631FC7DA
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 17:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738777745; cv=none; b=AI9a2i4T55r9GZwh4oN6gT225FtCiBnD48E7iQmGE4LvAwYgQBjpgbPLYEATiCMvQ0o3Bg9+m3o9meqdyuHa1c7g/VhlaQavasCzowC1CYKGvvC4oSfx6o9b8D/HG0l4d5dUFM/LNT/FwxVireg5/LLytYB3SEl69zaCpkuS/kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738777745; c=relaxed/simple;
	bh=/u62dmBR/ElLvSnF0c2PDOI2w0kdMLqx8LmycyWZfzE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oM1I7dafIJWrFdWYNGXy1ADpJOKLt2/De76dpe2MqI/YR9jMhhWag2twoaKFOwpCxK4e7LhfCjPjqdEuaqUofPXdNEcRvrBEULjjfIAztT1Yie9gPadGafLHqJn993z/hJc3EXyT2EEipbBJQGteG28huiJAYtZ4BAp5WX+zRys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uqpTAfY7; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uqpTAfY7"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ab7157cf352so236897766b.0
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 09:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738777742; x=1739382542; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zQSBOXqhcCachV8zft/ScV1fAUdaea+WUZiYV/mWDWA=;
        b=uqpTAfY72ChwJxTgZzIEtB5RyCziQaK4TMUTFBYYzG8ALRiJI7YiWT3leZb/0EKebT
         7baWKcC7je1Jy9aqd3Y4dMCgHlaH44ZmVJXlQtw82wDOA7b2YxbDjjr2T6rc4HuJBscp
         rm2sXXR7VuJUj0kiSiN0OHhJF9G1X1uHmRHi5OWS9QokobsfrJF/KSGF8F9gH3pG720f
         3m9+hu6UOlVgwNLvLhGXtoHwffmpT7T711s23ZZll9A778BCLgsVdBR6ANVN6iFK5ATv
         2B6uB/jWkqBRZW07kyst+atf0lbcgAYcrgW2OSHcgiaLkz2u5F6WbvxxThGAkhAZZSxH
         NiYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738777742; x=1739382542;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zQSBOXqhcCachV8zft/ScV1fAUdaea+WUZiYV/mWDWA=;
        b=HLHY/PgLVzWJRP7Vki+qQf8YWECys14VsMZJZ0EI4B67RdFZgtyEfvcpeiAM65ZD+o
         Vzu6DyY7HJK4+L1I1BPsK6c4Ks6vIovr/IBGrr2cvP2u8mEGWlV5XKW81koLy75WzZIf
         9ifgG/PfLWpnYEQQoGsxNtSxRqcPIOWiuvTtrm/xUzXtSRCI7Or72AjY/tslHsB00WEX
         8XM2A3QG1B2kEb+gaNkq/U7YXLtzFtctalZz6KA2sKYs1Zh0Nb3LuBybEVegh+KKlJDy
         lypwlgvTxEvq1CKOjWx6b8TKDsvw+A+162fNPvOKenv2cb8l02AS7DFtm/Y6/Y2nqHE5
         4Iyw==
X-Forwarded-Encrypted: i=1; AJvYcCV9V6uu3DiKDsj+PuHhrF3jSQawaLVbeivJjvwVh2rGHHW4vhRKhS80+RlUftWm+oTjr6dsSgev4CWvJNs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJUXDPiyeYpTFshVDoOrDgRjyo2iabUO5CqSVgZdquiPJkLKZM
	ZhiK9OdVaPVg4aYdsJQCtCFxxe9nL2Z7btrFhsJVPjAdeFDGOFBs6c2vaIhSGHpR/3DnBdMcbCH
	ocqWUo2glBEnD1bXT0FkRYWqxkwZcmi20Eok6
X-Gm-Gg: ASbGnct6bo33Neif7hh26WFxGKHgnPBPLOyENRBUcTj0mIrwSejN/TWK3NXsytKFNjx
	UetjFYvE6z4kYgouoNvGzMCCdtFPmoEAuQgMohgmjOlUltKIKWYppKauH1Cfb1QzOSwwkI98Z
X-Google-Smtp-Source: AGHT+IHJ8jmvk2vlvaC+lS/sj7o4RSpBTPngYU6t0we792og/hqSw+9hG/n7P/6UGVrDc5IFt2nzYS57fa68T5dlKVI=
X-Received: by 2002:a17:907:7fa3:b0:ab6:e04e:b29 with SMTP id
 a640c23a62f3a-ab76e84c376mr17529966b.3.1738777741553; Wed, 05 Feb 2025
 09:49:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250205163609.3208829-1-aleksander.lobakin@intel.com> <20250205163609.3208829-2-aleksander.lobakin@intel.com>
In-Reply-To: <20250205163609.3208829-2-aleksander.lobakin@intel.com>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 5 Feb 2025 18:48:50 +0100
X-Gm-Features: AWEUYZkuOxhIaitZ5J2JCfpt9TDbTEs11u0nOVrp_WhyR-akpJsCIQE0mTy2wI0
Message-ID: <CANn89iJjCOThDqwsK4v2O8LfcwAB55YohNZ8T2sR40uM2ZoX5w@mail.gmail.com>
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

On Wed, Feb 5, 2025 at 5:46=E2=80=AFPM Alexander Lobakin
<aleksander.lobakin@intel.com> wrote:
>
> In fact, these two are not tied closely to each other. The only
> requirements to GRO are to use it in the BH context and have some
> sane limits on the packet batches, e.g. NAPI has a limit of its
> budget (64/8/etc.).
> Move purely GRO fields into a new tagged group, &gro_node. Embed it
> into &napi_struct and adjust all the references. napi_id doesn't
> really belong to GRO, but:
>
> 1. struct gro_node has a 4-byte padding at the end anyway. If you
>    leave napi_id outside, struct napi_struct takes additional 8 bytes
>    (u32 napi_id + another 4-byte padding).
> 2. gro_receive_skb() uses it to mark skbs. We don't want to split it
>    into two functions or add an `if`, as this would be less efficient,
>    but we need it to be NAPI-independent. The current approach doesn't
>    change anything for NAPI-backed GROs; for standalone ones (which
>    are less important currently), the embedded napi_id will be just
>    zero =3D> no-op.
>
> Three Ethernet drivers use napi_gro_flush() not really meant to be
> exported, so move it to <net/gro.h> and add that include there.
> napi_gro_receive() is used in more than 100 drivers, keep it
> in <linux/netdevice.h>.
> This does not make GRO ready to use outside of the NAPI context
> yet.
>
> Tested-by: Daniel Xu <dxu@dxuuu.xyz>
> Acked-by: Jakub Kicinski <kuba@kernel.org>
> Reviewed-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>
> Signed-off-by: Alexander Lobakin <aleksander.lobakin@intel.com>
> ---
>  include/linux/netdevice.h                  | 26 +++++---
>  include/net/busy_poll.h                    | 11 +++-
>  include/net/gro.h                          | 35 +++++++----
>  drivers/net/ethernet/brocade/bna/bnad.c    |  1 +
>  drivers/net/ethernet/cortina/gemini.c      |  1 +
>  drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c |  1 +
>  net/core/dev.c                             | 60 ++++++++-----------
>  net/core/gro.c                             | 69 +++++++++++-----------
>  8 files changed, 112 insertions(+), 92 deletions(-)
>
> diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
> index 2a59034a5fa2..d29b6ebde73f 100644
> --- a/include/linux/netdevice.h
> +++ b/include/linux/netdevice.h
> @@ -340,8 +340,8 @@ struct gro_list {
>  };
>
>  /*
> - * size of gro hash buckets, must less than bit number of
> - * napi_struct::gro_bitmask
> + * size of gro hash buckets, must be <=3D the number of bits in
> + * gro_node::bitmask
>   */
>  #define GRO_HASH_BUCKETS       8
>
> @@ -370,7 +370,6 @@ struct napi_struct {
>         unsigned long           state;
>         int                     weight;
>         u32                     defer_hard_irqs_count;
> -       unsigned long           gro_bitmask;
>         int                     (*poll)(struct napi_struct *, int);
>  #ifdef CONFIG_NETPOLL
>         /* CPU actively polling if netpoll is configured */
> @@ -379,11 +378,14 @@ struct napi_struct {
>         /* CPU on which NAPI has been scheduled for processing */
>         int                     list_owner;
>         struct net_device       *dev;
> -       struct gro_list         gro_hash[GRO_HASH_BUCKETS];
>         struct sk_buff          *skb;
> -       struct list_head        rx_list; /* Pending GRO_NORMAL skbs */
> -       int                     rx_count; /* length of rx_list */
> -       unsigned int            napi_id; /* protected by netdev_lock */
> +       struct_group_tagged(gro_node, gro,
> +               unsigned long           bitmask;
> +               struct gro_list         hash[GRO_HASH_BUCKETS];
> +               struct list_head        rx_list; /* Pending GRO_NORMAL sk=
bs */
> +               int                     rx_count; /* length of rx_list */
> +               u32                     napi_id; /* protected by netdev_l=
ock */
> +

I am old school, I would prefer a proper/standalone old C construct.

struct gro_node  {
                unsigned long           bitmask;
               struct gro_list         hash[GRO_HASH_BUCKETS];
               struct list_head        rx_list; /* Pending GRO_NORMAL skbs =
*/
               int                     rx_count; /* length of rx_list */
               u32                     napi_id; /* protected by netdev_lock=
 */
};

Really, what struct_group_tagged() can possibly bring here, other than
obfuscation ?

Less than 30 uses in the whole kernel tree...
