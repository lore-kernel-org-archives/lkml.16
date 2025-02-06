Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F1A2248AC
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 06:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738823214; cv=none; b=gc1Gr4a2CReV0rSz4P0r+peLk5vZlzBKPzshyfDHaw2Gx718rCnCyYwhZRR8SAZlYt5ki/D7Wqoj0K3Wir0e68d8ci9EUuGwK2/9xKaPp7Bxj3xzXbP5eh/16B7xtl+KChFIQi15rhhgPCqtU+K9aTRE1iXSWzGC/5oC/PQc+V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738823214; c=relaxed/simple;
	bh=DqeZXYxlQUMWfDhfpNmpJNCxBahKqpqoaaTG93nE3v4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DygRu31kIfptLjBbSw7ysKyvZUZ7dsgUTkiKyxdSjU2WvGjMhkcvua2mKwj3h1b9N+d/ZNRnxRjvvfJTshLC7z85lUM5qgcv24svBbyPE8Aju93E6QeNx/OKskuuSE+v0iBsAKFmCnmL0Rg4cSFB/JcpmVlN3HPpjjrbPx8MgZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f7p6f/Ji; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f7p6f/Ji"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-435b0df5dbdso34575e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 22:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738823210; x=1739428010; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=03yRrzqwkoQNcy0a5o+voo3nHbEC43zmbznaf95qV3A=;
        b=f7p6f/JiSYs+9TIebmj9GbyRB9hYmRtYlqsQSwKCcnjgC00og8o85b0YGkpQWlSOI0
         EoRK0ootfVKU+duytEwWBDFCHLGnEFRPYEaM9Yjvx1Jk1Gd8cZMl8yhyj9n1PPLSND7o
         RtsC6OtOPzy/8QCnIKKEUvp6j0OeV1ThpBuaA4SCR2Ci/siblXixd0Nzds6gA0RQUVgP
         WzlW0tVqeieoLGmgLoftjeY3nTV/1FVOHTzUrYBKKJFQPqIs2y18TwzdFrkyLJDemcRd
         fH8LJMggqweM3JIN9cn6T44+3yKqATnFrf32oBjxGY2X8gnkTzF4qF2Z+K2BY1g1SU+c
         eG0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738823210; x=1739428010;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=03yRrzqwkoQNcy0a5o+voo3nHbEC43zmbznaf95qV3A=;
        b=ecoPstVSoiGbHVRWkip692L7Mcmc2yDk3BNOVYVyCH63jJ0RhOtZhdTfNjV72XSKBq
         JQgZ6oERzEGDGzJpxLqYMWq49ipqyOTn7U/6Q/GPALO1dKClTpMn+Ndhw/tOvP/jrUO7
         TGAC5UPGWe+N1ktUqkuCD0N3T2qbHqNF1iboKsIYM6xR9ai7V0U1j9k+K+QFUJ520bLm
         b9tmLsWJTQFIG1MQriEwr6KSm7U79/7zWBETCf1rXZ4fo+p0SBdxsMSiCIhMESe17o1y
         6DPwcOSkvE6GSHDaqKr1TvVG2xep4Nm78jPY8G8Gb9t1Pe1HpTdDDBXsrGN1ig1rr68v
         6Yyg==
X-Forwarded-Encrypted: i=1; AJvYcCV1Fd//iV2o1Hx3AJr0U/4W4taYZ8QuFTKuE4hjasxs2f2AP8cLOusW1iqelV/kPxw90s7P3OLQUizwT9A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5MeajsiBIJQ1GR9wCujVTe8JFmP1iz7zKqEPePTRFXkUL5XU+
	Z0dHrSZ2Itx2x3ND9mn0PXanMjNMaI4nCp4nMZiQMZcpnSPhjLBA43iaEvW5ADCzIYfJsKOWuzq
	3K0UPJsUuoTz8aY0B9xr0LLwHD/k3NesVRxis
X-Gm-Gg: ASbGncvmGOnnhgmVjbDvisVEdeS3ii+RIJ4QENF6+JQo3JIDVlgWLEbb/4s2gJPV1Ug
	ymtHOIB3+zaA0GTae4ZXGED1aOhZpFbUMFiGaAgrx0xmmzchiJdIWyjX9GZyskC8hYlEQCgag2w
	==
X-Google-Smtp-Source: AGHT+IEVztvMJcFJufCLJxG+rqwnV37blaPqUEHHEG4/YPqrXsBOAtuTMRsxeRmxk2+eGpCVw71JruXFsZiuK4zhtvw=
X-Received: by 2002:a05:600c:1f84:b0:436:186e:13a6 with SMTP id
 5b1f17b1804b1-439179d18e5mr495335e9.6.1738823210278; Wed, 05 Feb 2025
 22:26:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250204213121.14195-1-jeroendb@google.com> <20250205162839.GH554665@kernel.org>
In-Reply-To: <20250205162839.GH554665@kernel.org>
From: Ziwei Xiao <ziweixiao@google.com>
Date: Wed, 5 Feb 2025 22:26:38 -0800
X-Gm-Features: AWEUYZn5QfQLmyauxa5E7e57SqvtCHGB3sOJiulqpZDH_lPqPTh9ZQ-BqHXPV_s
Message-ID: <CAG-FcCMAT7Bvmxgo1aJh+Bv=z8MJKJN9LyzxOBuQVNMO2A=2qQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2] gve: Add RSS cache for non RSS device option scenario
To: Simon Horman <horms@kernel.org>
Cc: Jeroen de Borst <jeroendb@google.com>, netdev@vger.kernel.org, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	pkaligineedi@google.com, shailend@google.com, andrew+netdev@lunn.ch, 
	willemb@google.com, hramamurthy@google.com, linux-kernel@vger.kernel.org, 
	Jeroen de Borst <jeroend@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 5, 2025 at 8:28=E2=80=AFAM Simon Horman <horms@kernel.org> wrot=
e:
>
> On Tue, Feb 04, 2025 at 01:31:21PM -0800, Jeroen de Borst wrote:
> > From: Ziwei Xiao <ziweixiao@google.com>
> >
> > Not all the devices have the capability for the driver to query for the
> > registered RSS configuration. The driver can discover this by checking
> > the relevant device option during setup. If it cannot, the driver needs
> > to store the RSS config cache and directly return such cache when
> > queried by the ethtool. RSS config is inited when driver probes. Also t=
he
> > default RSS config will be adjusted when there is RX queue count change=
.
> >
> > At this point, only keys of GVE_RSS_KEY_SIZE and indirection tables of
> > GVE_RSS_INDIR_SIZE are supported.
> >
> > Signed-off-by: Ziwei Xiao <ziweixiao@google.com>
> > Reviewed-by: Harshitha Ramamurthy <hramamurthy@google.com>
> > Reviewed-by: Willem de Bruijn <willemb@google.com>
> > Signed-off-by: Praveen Kaligineedi <pkaligineedi@google.com>
> > Signed-off-by: Jeroen de Borst <jeroend@google.com>
> > ---
> > Changes in v2:
> >  - Change to initialize RSS config when the driver is up instead of
> >    doing that when the user setting the RSS.(Jakub Kicinski)
> >  - Use NL_SET_ERR_MSG_MOD to log errors when there is extack
> >    available.(Jakub Kicinski)
> >  - Use ethtool_rxfh_indir_default to set default RSS indir
> >    table.(Jakub Kicinski)
> >  - Adjust the default RSS config when there is RX queue count change to
> >    ensure the default RSS config is correct.
> >
> >  drivers/net/ethernet/google/gve/gve.h         | 16 +++-
> >  drivers/net/ethernet/google/gve/gve_adminq.c  | 64 ++++++++++---
> >  drivers/net/ethernet/google/gve/gve_ethtool.c | 60 ++++++++++--
> >  drivers/net/ethernet/google/gve/gve_main.c    | 92 ++++++++++++++++++-
> >  4 files changed, 209 insertions(+), 23 deletions(-)
>
> ...
>
> > diff --git a/drivers/net/ethernet/google/gve/gve_ethtool.c b/drivers/ne=
t/ethernet/google/gve/gve_ethtool.c
> > index bdfc6e77b2af..efcafc607b2a 100644
> > --- a/drivers/net/ethernet/google/gve/gve_ethtool.c
> > +++ b/drivers/net/ethernet/google/gve/gve_ethtool.c
> > @@ -482,6 +482,7 @@ static int gve_set_channels(struct net_device *netd=
ev,
> >       struct ethtool_channels old_settings;
> >       int new_tx =3D cmd->tx_count;
> >       int new_rx =3D cmd->rx_count;
> > +     bool reset_rss;
> >
> >       gve_get_channels(netdev, &old_settings);
> >
> > @@ -498,16 +499,14 @@ static int gve_set_channels(struct net_device *ne=
tdev,
> >               return -EINVAL;
> >       }
> >
> > -     if (!netif_running(netdev)) {
> > -             priv->tx_cfg.num_queues =3D new_tx;
> > -             priv->rx_cfg.num_queues =3D new_rx;
> > -             return 0;
> > -     }
> > +     if (new_rx !=3D priv->rx_cfg.num_queues &&
> > +         priv->cache_rss_config && !netif_is_rxfh_configured(netdev))
> > +             reset_rss =3D true;
>
> Hi Jerome,
>
> This is not a full review (which I was working on but ran out of time for=
 now).
> But, if the condition above is not met then reset_rss will be used
> uninitialised below.
>
> Flagged by W=3D1 build with clang-19.
>
Thank you for pointing that out. Will fix it on the V3 patch.
> >
> >       new_tx_cfg.num_queues =3D new_tx;
> >       new_rx_cfg.num_queues =3D new_rx;
> >
> > -     return gve_adjust_queues(priv, new_rx_cfg, new_tx_cfg);
> > +     return gve_adjust_queues(priv, new_rx_cfg, new_tx_cfg, reset_rss)=
;
> >  }
> >
> >  static void gve_get_ringparam(struct net_device *netdev,
>
> ...
>
> --
> pw-bot: cr
