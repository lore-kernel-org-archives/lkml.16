Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E4119B3CB
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 14:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748442975; cv=none; b=tezY5ShMb4D+yupKQ1439i816dRCyEg1OZS5wDYk40ML5kT0dz9FxYy/mjlEjUbWX6y81u6ulsOs1sh/XakA3KHjCzMVutoEKdZ3cJe+qhfhdBWzw6sWVRJ0uVLFUxYeF7EiuH2i0tltgj3NQsahlUuKtWbU8aYGUoAAZy7e3gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748442975; c=relaxed/simple;
	bh=kZdtPLtiwt1WDJ8IbtVBanoaZhX6emGAKLby7L4oq3Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R0+BW9sEoTk+j/pcqGP4wigUX0Sxo8mbz0RHUNG3wLk77u7SV5x2gSpORPDyX7HOZ1qDZiIZgEOClavr3xka0iVCN0nQ34/iCyrQwjZNdRc8AVJhZt5Q4S79Pj8j8Yvs31Q0eA54K5xPnxMAIhW1oEeozS8kC22dpkeNhxr5b4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmo-cybersecurity.com; spf=pass smtp.mailfrom=gmo-cybersecurity.com; dkim=pass (2048-bit key) header.d=gmo-cybersecurity.com header.i=@gmo-cybersecurity.com header.b=Iyn9wVTe; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmo-cybersecurity.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmo-cybersecurity.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmo-cybersecurity.com header.i=@gmo-cybersecurity.com header.b="Iyn9wVTe"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a4bdee0bf7so3084384f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 07:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmo-cybersecurity.com; s=google; t=1748442972; x=1749047772; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i3u1tiLuHtSwquV3XWda37V0Wy2peP3hAf6J/XwOj40=;
        b=Iyn9wVTe/uux7zmHD7vNNJmrk5KOZM2Z98BfCWPUCWbI1+T1mAsGArG0KL3WWtayQC
         SxiPAh2Pz/4+OsG5Eees+zu71BrWCsRyV21YQZfjwMUzTin/Zt7ixd50mbAHzanxHxG+
         D5E8olt00yq+6v+55Jv2Lfaea3CNujEXVZixyp95+2Kz/u3k8Nvs0x98A5MvF8Wl9Dgb
         oOenxmwxaSQmLnt+TdSST2/3AyifKxwor8cPGUEW23LhYLlk0yf1o35TyAW5pS7EvgJK
         vSWIgQxeN0x4xGiBPCgFreu+GOHxm1mJ09uVvYufa83sCF1BcmZuI6PgBuqEwGbqpWqb
         QC5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748442972; x=1749047772;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i3u1tiLuHtSwquV3XWda37V0Wy2peP3hAf6J/XwOj40=;
        b=acBYhpBdzCpYIE+ptVA5bs+XB6fNmNOouEbAhOCOtt3NrfTeFPWWmKyW+duMHza17W
         ZCV5lkebq2FzCq9w4pZgvK6aZkS5SJSdV5NvRkrb5T1PWhlCm7wfK9fn0Gbc1Ta9l+yi
         R5/P1pdrXhzlF9EcJvsWRGVKOQmu593MrgXTwfNxMFQJUO4Uj2Wn8qi42DZzqh1UNyWG
         +f/NDfyI+4cySu7LIoIFFCKl9h6YtdWlbNRWNAKWHt744Hk+QtSxm1pce7zmfbG3loir
         3EYR/E3NZaigmvNvxsCN+WhoFQPjnx3qbd/UQY98Qa0jk3kFDIIYhMvDxXP+6MpvG9wp
         i8QQ==
X-Forwarded-Encrypted: i=1; AJvYcCUseyZF21YgM+8N9m7ObSTeaZAATcMdBxzYzD+TKAN6nEuKkFG4rG+yOCq+jrwFwcoyebPpyrbl3tRv+ZA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFiVrWsMvTcQL3ifa7UNP9Sd8HELRCfZUcOpWCmVPr7NU4o5Cc
	vaYNz6qtNi6qewQfpXCY6R+vtO+g5b5046QPX1cMHQiAEP6NT6vsZBbAxKqPJ7w542IlV/kq9GR
	TVV49Qoc/80E9bKxRlA6YwXcKO76oI0+vtgr3Zw41Sg==
X-Gm-Gg: ASbGncupSqjVggxnm4e3X3Wncy6e3Ev1OfBNIJtFigH/Y4/0sKToNvx3IpjX+JdXS11
	vhIjgI6sMTf+RGadOK7MkMQEhW0791fEZDFD9s++8wl0v6TeLhZ6UxXeaNRo7sLCySk4sAiQMP4
	a4EuI9N08jQU7CS7LnA47KcE6vHGrlkIKezmQ=
X-Google-Smtp-Source: AGHT+IH7yF1AuOcjbaAOHuQ3ZEWVAuHmuJDzgC0s0JkYyOYDFPU6CteR3EjlyEPVIQtcXYyc1ihSJZMaHl1DL1yvv50=
X-Received: by 2002:a5d:5648:0:b0:3a4:ea40:4d46 with SMTP id
 ffacd0b85a97d-3a4ea404f84mr1792896f8f.28.1748442971361; Wed, 28 May 2025
 07:36:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAA3_Gnogt7GR0gZVZwQ4vXXav6TpXMK6t=QTLsqKOaX3Bo_tNA@mail.gmail.com>
 <CANn89iLVq=3d7Ra7gKmTpLcMzuWv+KamYs=KjUHH2z3cPpDBDA@mail.gmail.com>
In-Reply-To: <CANn89iLVq=3d7Ra7gKmTpLcMzuWv+KamYs=KjUHH2z3cPpDBDA@mail.gmail.com>
From: =?UTF-8?B?5oi455Sw5pmD5aSq?= <kota.toda@gmo-cybersecurity.com>
Date: Wed, 28 May 2025 23:35:59 +0900
X-Gm-Features: AX0GCFt8IHdrgw66Ok-mDEgqM1lC1lAB5ev1oiemIeLCWaTRnSWwrFQQ1YK1Koc
Message-ID: <CAA3_GnrVyeXtLjhZ_d9=0x58YmK+a9yADfp+LRCBHQo_TEDyvw@mail.gmail.com>
Subject: Re: [PATCH net] bonding: Fix header_ops type confusion
To: Eric Dumazet <edumazet@google.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, pabeni@redhat.com, 
	=?UTF-8?B?5bCP5rGg5oKg55Sf?= <yuki.koike@gmo-cybersecurity.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for your review.

2025=E5=B9=B45=E6=9C=8826=E6=97=A5(=E6=9C=88) 17:23 Eric Dumazet <edumazet@=
google.com>:
>
> On Sun, May 25, 2025 at 10:08=E2=80=AFPM =E6=88=B8=E7=94=B0=E6=99=83=E5=
=A4=AA <kota.toda@gmo-cybersecurity.com> wrote:
> >
> > In bond_setup_by_slave(), the slave=E2=80=99s header_ops are unconditio=
nally
> > copied into the bonding device. As a result, the bonding device may inv=
oke
> > the slave-specific header operations on itself, causing
> > netdev_priv(bond_dev) (a struct bonding) to be incorrectly interpreted
> > as the slave's private-data type.
> >
> > This type-confusion bug can lead to out-of-bounds writes into the skb,
> > resulting in memory corruption.
> >
> > This patch adds two members to struct bonding, bond_header_ops and
> > header_slave_dev, to avoid type-confusion while keeping track of the
> > slave's header_ops.
> >
> > Fixes: 1284cd3a2b740 (bonding: two small fixes for IPoIB support)
> > Signed-off-by: Kota Toda <kota.toda@gmo-cybersecurity.com>
> > Signed-off-by: Yuki Koike <yuki.koike@gmo-cybersecurity.com>
> > Co-Developed-by: Yuki Koike <yuki.koike@gmo-cybersecurity.com>
> > Reviewed-by: Paolo Abeni <pabeni@redhat.com>
> > Reported-by: Kota Toda <kota.toda@gmo-cybersecurity.com>
> > ---
> >  drivers/net/bonding/bond_main.c | 61
> > ++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
> >  include/net/bonding.h           |  5 +++++
> >  2 files changed, 65 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond=
_main.c
> > index 8ea183da8d53..690f3e0971d0 100644
> > --- a/drivers/net/bonding/bond_main.c
> > +++ b/drivers/net/bonding/bond_main.c
> > @@ -1619,14 +1619,65 @@ static void bond_compute_features(struct bondin=
g *bond)
> >      netdev_change_features(bond_dev);
> >  }
> >
> > +static int bond_hard_header(struct sk_buff *skb, struct net_device *de=
v,
> > +        unsigned short type, const void *daddr,
> > +        const void *saddr, unsigned int len)
> > +{
> > +    struct bonding *bond =3D netdev_priv(dev);
> > +    struct net_device *slave_dev;
> > +
> > +    slave_dev =3D bond->header_slave_dev;
> > +
> > +    return dev_hard_header(skb, slave_dev, type, daddr, saddr, len);
> > +}
> > +
> > +static void bond_header_cache_update(struct hh_cache *hh, const
> > struct net_device *dev,
> > +        const unsigned char *haddr)
> > +{
> > +    const struct bonding *bond =3D netdev_priv(dev);
> > +    struct net_device *slave_dev;
> > +
> > +    slave_dev =3D bond->header_slave_dev;
>
> I do not see any barrier ?
>
> > +
> > +    if (!slave_dev->header_ops || !slave_dev->header_ops->cache_update=
)
> > +        return;
> > +
> > +    slave_dev->header_ops->cache_update(hh, slave_dev, haddr);
> > +}
> > +
> >  static void bond_setup_by_slave(struct net_device *bond_dev,
> >                  struct net_device *slave_dev)
> >  {
> > +    struct bonding *bond =3D netdev_priv(bond_dev);
> >      bool was_up =3D !!(bond_dev->flags & IFF_UP);
> >
> >      dev_close(bond_dev);
> >
> > -    bond_dev->header_ops        =3D slave_dev->header_ops;
> > +    /* Some functions are given dev as an argument
> > +     * while others not. When dev is not given, we cannot
> > +     * find out what is the slave device through struct bonding
> > +     * (the private data of bond_dev). Therefore, we need a raw
> > +     * header_ops variable instead of its pointer to const header_ops
> > +     * and assign slave's functions directly.
> > +     * For the other case, we set the wrapper functions that pass
> > +     * slave_dev to the wrapped functions.
> > +     */
> > +    bond->bond_header_ops.create =3D bond_hard_header;
> > +    bond->bond_header_ops.cache_update =3D bond_header_cache_update;
> > +    if (slave_dev->header_ops) {
> > +        bond->bond_header_ops.parse =3D slave_dev->header_ops->parse;
> > +        bond->bond_header_ops.cache =3D slave_dev->header_ops->cache;
> > +        bond->bond_header_ops.validate =3D slave_dev->header_ops->vali=
date;
> > +        bond->bond_header_ops.parse_protocol =3D
> > slave_dev->header_ops->parse_protocol;
>
> All these updates probably need WRITE_ONCE(), and corresponding
> READ_ONCE() on reader sides, at a very minimum ...
>
> RCU would even be better later.
>
I believe that locking is not necessary in this patch. The update of
`header_ops` only happens when a slave is newly enslaved to a bond.
Under such circumstances, members of `header_ops` are not called in
parallel with updating. Therefore, there is no possibility of race
conditions occurring.
>
> > +    } else {
> > +        bond->bond_header_ops.parse =3D NULL;
> > +        bond->bond_header_ops.cache =3D NULL;
> > +        bond->bond_header_ops.validate =3D NULL;
> > +        bond->bond_header_ops.parse_protocol =3D NULL;
> > +    }
> > +
> > +    bond->header_slave_dev      =3D slave_dev;
> > +    bond_dev->header_ops        =3D &bond->bond_header_ops;
> >
> >      bond_dev->type            =3D slave_dev->type;
> >      bond_dev->hard_header_len   =3D slave_dev->hard_header_len;
> > @@ -2676,6 +2727,14 @@ static int bond_release_and_destroy(struct
> > net_device *bond_dev,
> >      struct bonding *bond =3D netdev_priv(bond_dev);
> >      int ret;
> >
> > +    /* If slave_dev is the earliest registered one, we must clear
> > +     * the variables related to header_ops to avoid dangling pointer.
> > +     */
> > +    if (bond->header_slave_dev =3D=3D slave_dev) {
> > +        bond->header_slave_dev =3D NULL;
> > +        bond_dev->header_ops =3D NULL;
> > +    }
> > +
> >      ret =3D __bond_release_one(bond_dev, slave_dev, false, true);
> >      if (ret =3D=3D 0 && !bond_has_slaves(bond) &&
> >          bond_dev->reg_state !=3D NETREG_UNREGISTERING) {
> > diff --git a/include/net/bonding.h b/include/net/bonding.h
> > index 95f67b308c19..cf8206187ce9 100644
> > --- a/include/net/bonding.h
> > +++ b/include/net/bonding.h
> > @@ -215,6 +215,11 @@ struct bond_ipsec {
> >   */
> >  struct bonding {
> >      struct   net_device *dev; /* first - useful for panic debug */
> > +    struct   net_device *header_slave_dev;  /* slave net_device for
> > header_ops */
> > +    /* maintained as a non-const variable
> > +     * because bond's header_ops should change depending on slaves.
> > +     */
> > +    struct   header_ops bond_header_ops;
> >      struct   slave __rcu *curr_active_slave;
> >      struct   slave __rcu *current_arp_slave;
> >      struct   slave __rcu *primary_slave;
