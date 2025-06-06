Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF14C1C1F0D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 07:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749194208; cv=none; b=Wz2KuHCLmdZo86LyKRywOBe09Qyce2TXz4ehVk4iia4y1T0C2874qm4GOXo/BSywZ2uFuiwam2JYywiQCSQxiF6FeHqPkcOAiLLTuxB7y0UNJVBnPevWDSwJ8DrV/DZhE+bB/lttNtCtJpsnKQYq+nUr+EpParRX9LEUqZtDhdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749194208; c=relaxed/simple;
	bh=cAJrkKXG09xOhd2Hzr+C5E4wIGGeJl26deIYWukEoLc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f/RWt6nha/b+RCxtNLxLHqowwn3Gqns3r0Bu6kq/s65Sec0kuErUbU28O6BYFOgmCYc4eSOjUO5hcTO3YXcGjekIaB8l2PIigTgPGpR2oc8mHD4c97/wsS/vBc/JcBnNraI3yu7K6iQ8MYFZsx5qQuGjGCUUihpdiDquBJnVqG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmo-cybersecurity.com; spf=pass smtp.mailfrom=gmo-cybersecurity.com; dkim=pass (2048-bit key) header.d=gmo-cybersecurity.com header.i=@gmo-cybersecurity.com header.b=UXBatLuy; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmo-cybersecurity.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmo-cybersecurity.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmo-cybersecurity.com header.i=@gmo-cybersecurity.com header.b="UXBatLuy"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-451e2f0d9c2so14415865e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 00:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmo-cybersecurity.com; s=google; t=1749194203; x=1749799003; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/XMi5+8eZH1IMFT7aIIxuzqoktYcarPLjPOsXqsdoW0=;
        b=UXBatLuy9FR+dbtuBtJlT2cpTWlw9nh0lfnPueOdY586OZlNETOlN3JLHU/qXWm9ub
         BVXcS0MC4rfWfWcn1TwcCmRjg7s/kKeuveT2vtTmkSI/cF/Wl7coxXv8yWHCzfz38sgm
         MI+h+qU9XsktNbRu+iehVVvoy9/zk/ZclP2fweNa1GLVw9Do+vcwMJjj1vP+2MTrBgE5
         SyXnwS/aiwOowu6zoxwzyFOYnNqjc9168UYW6l4pudCTZHEtq2bDgPWaYSoEPhb4jAvd
         npNyQQEUw6JWfVIHijWVpldBwT47I/bghBMY++9WnJvCbNwfDhexzTEkvqhk3arOCbeE
         EJfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749194203; x=1749799003;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/XMi5+8eZH1IMFT7aIIxuzqoktYcarPLjPOsXqsdoW0=;
        b=lIdvFcJuW46KpdI9AK/aI5z8VDXp4/Dt7wWUSCaQkty4PZCPss3l9I6N6xd87fKXn0
         ixXoO/9H5wrKW+ipsChcr5aw/+/VFyFydN8JucfCLBb72NOiRrzsbXDXPTccGyzRm6d5
         9tDVC+D7wySVbLqDlsEh4xtG8SGp+NEnCF+s2NIXuaNi8ciyHv08l4J1kKC+1REK5kvh
         Gr/kUMegWplVG338uPFxYokHHSBfuw93djC1cxpTzYH7zAd190Cp8SJwpGuLAaCLnPq1
         FqRhi+3ed64XRtbz2jJOE49LnYnmkZShtVeP3XE6wA2Lt2GmCeBiR2a7gJdmFw/R6bwu
         6Zcg==
X-Forwarded-Encrypted: i=1; AJvYcCWwRM8Ea/w2VtMWfGevASz/AN/jTbnILkRE0+GUOQcI5yvenZih4GOLGw3V9g4Q9WUBKqGHWQKyi1jCKmA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzlyCSQ7HyUjZYIx7gWvE4rYy8Mxg2ZfMTU0QN8JbYMjWPSup0
	KziE6d2L4YwuEYynL60y59i4DZc1SE/RNLvyejIjc6TMLAanF+rLYKQ35Hxn53GoGSbfaKZvy2R
	o0odpLYtDOkS4gKIgY0C4Sq9ACrDr0DryFJJbhZ8Vtw==
X-Gm-Gg: ASbGncu6qz0csd9qABVHCAE05fRvPE4fQO55+JInpHEFpU8RCAUuU2tEscmKbN6WqST
	XkhnzRuDsih4fVqooL0yXQYMxaTVkzFxaFeYdovXONh/IjT7scRtwuTSmF3yLaCQCe2aLghB3MV
	DmcX+JXyl3PBIS9raoCiduokhPzhwTmma5iA0=
X-Google-Smtp-Source: AGHT+IFbp+79x8nHQ+OULHJyBDfxZG/qTcxnaYx6r++2repCfOCP6My7PuJtJ4f7O4onCD/EyLM6Nt3of8iU/1n4iUE=
X-Received: by 2002:a05:600c:8b8b:b0:451:df07:d8e0 with SMTP id
 5b1f17b1804b1-452015832f0mr22700445e9.11.1749194202956; Fri, 06 Jun 2025
 00:16:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAA3_Gnogt7GR0gZVZwQ4vXXav6TpXMK6t=QTLsqKOaX3Bo_tNA@mail.gmail.com>
 <CANn89iLVq=3d7Ra7gKmTpLcMzuWv+KamYs=KjUHH2z3cPpDBDA@mail.gmail.com>
 <CAA3_GnrVyeXtLjhZ_d9=0x58YmK+a9yADfp+LRCBHQo_TEDyvw@mail.gmail.com> <CANn89iJN-fcx-szsR3Azp8wQ0zhXp0XiYJofQU1zqqtdj7SWTA@mail.gmail.com>
In-Reply-To: <CANn89iJN-fcx-szsR3Azp8wQ0zhXp0XiYJofQU1zqqtdj7SWTA@mail.gmail.com>
From: =?UTF-8?B?5oi455Sw5pmD5aSq?= <kota.toda@gmo-cybersecurity.com>
Date: Fri, 6 Jun 2025 16:16:31 +0900
X-Gm-Features: AX0GCFt4wB4HZLPyKUDTkRdMREAP3Zt6ZcM3tUJZen_xiATXlJ5q5OVPx5uS9_Y
Message-ID: <CAA3_GnqOnsOXHk-x4gKKe7MFmS0WQsXmMp6XoQc+fR3gmZVQEQ@mail.gmail.com>
Subject: Re: [PATCH net] bonding: Fix header_ops type confusion
To: Eric Dumazet <edumazet@google.com>
Cc: netdev@vger.kernel.org, pabeni@redhat.com, 
	=?UTF-8?B?5bCP5rGg5oKg55Sf?= <yuki.koike@gmo-cybersecurity.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2025=E5=B9=B45=E6=9C=8829=E6=97=A5(=E6=9C=A8) 0:10 Eric Dumazet <edumazet@g=
oogle.com>:

>
> On Wed, May 28, 2025 at 7:36=E2=80=AFAM =E6=88=B8=E7=94=B0=E6=99=83=E5=A4=
=AA <kota.toda@gmo-cybersecurity.com> wrote:
> >
> > Thank you for your review.
> >
> > 2025=E5=B9=B45=E6=9C=8826=E6=97=A5(=E6=9C=88) 17:23 Eric Dumazet <eduma=
zet@google.com>:
> > >
> > > On Sun, May 25, 2025 at 10:08=E2=80=AFPM =E6=88=B8=E7=94=B0=E6=99=83=
=E5=A4=AA <kota.toda@gmo-cybersecurity.com> wrote:
> > > >
> > > > In bond_setup_by_slave(), the slave=E2=80=99s header_ops are uncond=
itionally
> > > > copied into the bonding device. As a result, the bonding device may=
 invoke
> > > > the slave-specific header operations on itself, causing
> > > > netdev_priv(bond_dev) (a struct bonding) to be incorrectly interpre=
ted
> > > > as the slave's private-data type.
> > > >
> > > > This type-confusion bug can lead to out-of-bounds writes into the s=
kb,
> > > > resulting in memory corruption.
> > > >
> > > > This patch adds two members to struct bonding, bond_header_ops and
> > > > header_slave_dev, to avoid type-confusion while keeping track of th=
e
> > > > slave's header_ops.
> > > >
> > > > Fixes: 1284cd3a2b740 (bonding: two small fixes for IPoIB support)
> > > > Signed-off-by: Kota Toda <kota.toda@gmo-cybersecurity.com>
> > > > Signed-off-by: Yuki Koike <yuki.koike@gmo-cybersecurity.com>
> > > > Co-Developed-by: Yuki Koike <yuki.koike@gmo-cybersecurity.com>
> > > > Reviewed-by: Paolo Abeni <pabeni@redhat.com>
> > > > Reported-by: Kota Toda <kota.toda@gmo-cybersecurity.com>
> > > > ---
> > > >  drivers/net/bonding/bond_main.c | 61
> > > > ++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
> > > >  include/net/bonding.h           |  5 +++++
> > > >  2 files changed, 65 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/=
bond_main.c
> > > > index 8ea183da8d53..690f3e0971d0 100644
> > > > --- a/drivers/net/bonding/bond_main.c
> > > > +++ b/drivers/net/bonding/bond_main.c
> > > > @@ -1619,14 +1619,65 @@ static void bond_compute_features(struct bo=
nding *bond)
> > > >      netdev_change_features(bond_dev);
> > > >  }
> > > >
> > > > +static int bond_hard_header(struct sk_buff *skb, struct net_device=
 *dev,
> > > > +        unsigned short type, const void *daddr,
> > > > +        const void *saddr, unsigned int len)
> > > > +{
> > > > +    struct bonding *bond =3D netdev_priv(dev);
> > > > +    struct net_device *slave_dev;
> > > > +
> > > > +    slave_dev =3D bond->header_slave_dev;
> > > > +
> > > > +    return dev_hard_header(skb, slave_dev, type, daddr, saddr, len=
);
> > > > +}
> > > > +
> > > > +static void bond_header_cache_update(struct hh_cache *hh, const
> > > > struct net_device *dev,
> > > > +        const unsigned char *haddr)
> > > > +{
> > > > +    const struct bonding *bond =3D netdev_priv(dev);
> > > > +    struct net_device *slave_dev;
> > > > +
> > > > +    slave_dev =3D bond->header_slave_dev;
> > >
> > > I do not see any barrier ?
> > >
> > > > +
> > > > +    if (!slave_dev->header_ops || !slave_dev->header_ops->cache_up=
date)
> > > > +        return;
> > > > +
> > > > +    slave_dev->header_ops->cache_update(hh, slave_dev, haddr);
> > > > +}
> > > > +
> > > >  static void bond_setup_by_slave(struct net_device *bond_dev,
> > > >                  struct net_device *slave_dev)
> > > >  {
> > > > +    struct bonding *bond =3D netdev_priv(bond_dev);
> > > >      bool was_up =3D !!(bond_dev->flags & IFF_UP);
> > > >
> > > >      dev_close(bond_dev);
> > > >
> > > > -    bond_dev->header_ops        =3D slave_dev->header_ops;
> > > > +    /* Some functions are given dev as an argument
> > > > +     * while others not. When dev is not given, we cannot
> > > > +     * find out what is the slave device through struct bonding
> > > > +     * (the private data of bond_dev). Therefore, we need a raw
> > > > +     * header_ops variable instead of its pointer to const header_=
ops
> > > > +     * and assign slave's functions directly.
> > > > +     * For the other case, we set the wrapper functions that pass
> > > > +     * slave_dev to the wrapped functions.
> > > > +     */
> > > > +    bond->bond_header_ops.create =3D bond_hard_header;
> > > > +    bond->bond_header_ops.cache_update =3D bond_header_cache_updat=
e;
> > > > +    if (slave_dev->header_ops) {
> > > > +        bond->bond_header_ops.parse =3D slave_dev->header_ops->par=
se;
> > > > +        bond->bond_header_ops.cache =3D slave_dev->header_ops->cac=
he;
> > > > +        bond->bond_header_ops.validate =3D slave_dev->header_ops->=
validate;
> > > > +        bond->bond_header_ops.parse_protocol =3D
> > > > slave_dev->header_ops->parse_protocol;
> > >
> > > All these updates probably need WRITE_ONCE(), and corresponding
> > > READ_ONCE() on reader sides, at a very minimum ...
> > >
> > > RCU would even be better later.
> > >
> > I believe that locking is not necessary in this patch. The update of
> > `header_ops` only happens when a slave is newly enslaved to a bond.
> > Under such circumstances, members of `header_ops` are not called in
> > parallel with updating. Therefore, there is no possibility of race
> > conditions occurring.
>
> bond_dev can certainly be live, and packets can flow.
>
> I have seen enough syzbot reports hinting at this precise issue.

Hi Eric, Thank you for reviewing the patch.

At the beginning of `bond_setup_by_slave`, `dev_close(bond_dev)` is called,
meaning bond_dev is down and no packets can flow during the update of
`bond_header_ops`.

The syzbot report (you mentioned in the conversation in security@) indicati=
ng
`dev->header_ops` becoming NULL should be resolved by this patch.
I couldn't find any other related syzbot reports.
