Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5C01509BD
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 18:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738695246; cv=none; b=WSj9xEdYq3GP5wMb/mLv4vjdTGGVs4Ha5FsnvGV3mr4nNht+XvUSLaDjBMGRSIgxwPcmSrLpwIdAQ4uXWKHxPlGgyfYVJIv8WO2//1ymT4PYmx96Y53Ryscopd2CfBoPs4L2WyV87UVcJc0iN5pbuS5mntrlXZWt6lrX65qVICs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738695246; c=relaxed/simple;
	bh=jwhuV4VujjeHaEU10MpN8I73flvGkYDTvOrAWozkCbI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=YurSwQC7SHQzv5gtDOhFqASWj9MHeC1o4WwSIA9mEC05Ai3FKvwBbAazWk451MBeL1+yf3q93bX42xpJDUzDvlFucAY87ZZVQW3K96Ud/WhGXd0Cu3VvJJ3ycfID9bzACTZhuu1RaX5kLD+136L+w6Ptm8ificn281W8Eu2VRKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Uuk3vdhJ; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Uuk3vdhJ"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5d3dce16a3dso142395a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 10:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738695243; x=1739300043; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NnZr0TzU6EBAKAi2OeYRTWSvDyVVdEmro7wQjoBWxCc=;
        b=Uuk3vdhJHLnIFdAQUzCIqIJjawI8A8rYdgLrk0rrM1MsPRwdCntAA0umnnNvl4kaUW
         yFLlyodEgN8zEcjb6g+RtQ604uWv3sdblCRaUSnTrqWIpoT9jObGm7nChbEooOvDE0e3
         9zByP+I+qzpJ8zSMQwmqxW2e8WtULUsJFMJ26EHxazdrNInTxQrt8J0NGe4ruQGxlkvV
         frgOlLcN4oWFzV8ydGOU2fVsAwPK3fqqh4XtEEYRYUM/usqjBX6C2O4PtMLWKZmZlq9q
         3CPOY7zjRislWV+UWY3Jmq6M6REZMVePvRVQ4BqHgm9hoR0dZlIL5P7s0vS2WQsDxYVf
         VSHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738695243; x=1739300043;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NnZr0TzU6EBAKAi2OeYRTWSvDyVVdEmro7wQjoBWxCc=;
        b=w8QTSVixQyZvij1yApf5dzHK13EshA6ddcc/jsdI4Al+qUb2STKq8UdUYUxzZ+zBHJ
         TdycHD9dCcaoJZHESEDs3+imEDPTbQ8l5+YwjndNWRnWs/KfNsb5toZSeJE1EjWLxbZX
         US/j1gPy+xWYvDmYh7fUi/DVcUJUA1hjHCJ3C+mJ4fiyAlwJvoCROBnl1ClllG1cZ0M3
         gj3ZlCKPy/j/jTkL0UVd+IKpyo+WWlb1kbq44RTFjNvEqrY69bzcnyqHeNpIGmmTU1xY
         FekOLwCQnXbo9oyCrakrEGO/lXdzXlA0Ki8wlBZpprGDzD6Xis3bHTbA9TkYjhzoKFTX
         eOmg==
X-Forwarded-Encrypted: i=1; AJvYcCVZouIDOVuKI+i7GVq4aJx7NwZTiVIZMjLDOQCKSOxYcefy5q2OVMnG6o8G/T6NUILn4AZRe/3fpF9M3mk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwW1sGBYpBpmkh3pO3ILQzUpF1VortNPqGg4trcOEx2j54ODolz
	nfOoDIhAaqPi3CVpab8axcESV9xThKn5yGVl+LsNzBzhfJ5MthvFJxf3n3njg939BZeNFOTJCZB
	ClPmCcvxEjwtk3d6hWQKQSy3t4jufqlAL9LSl
X-Gm-Gg: ASbGncsM55dLCemR9M/jO8ftlFhOP//yS88eJBR/DoIkGiwoTcav/sZmb3JAyMJUKxN
	H04Oqp+Gc5nLUSEPKkR7qPyPkiPZU7r8Ku0FJA1hgkn/2mSov7ST0qfJDT2v3k4R69wyqNwU=
X-Google-Smtp-Source: AGHT+IHUpYduRAW29pLm2cXnvQ7KYNVfpBYDv5RSd4yHMpeKVIVeQaC83fH3Rm3ysM7sUjvOcuSGPBYKlpMK7JSYogQ=
X-Received: by 2002:a05:6402:34c4:b0:5dc:80ba:ddb1 with SMTP id
 4fb4d7f45d1cf-5dcdc0b91d5mr17440a12.14.1738695243076; Tue, 04 Feb 2025
 10:54:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203191714.155526-1-jdamato@fastly.com> <CANn89i+vf5=6f8kuZKCmP66P1LWGmAj06i+NhgqpFLVR8K5bEA@mail.gmail.com>
 <Z6JcR5IH8WzH1lP9@LQ3V64L9R2>
In-Reply-To: <Z6JcR5IH8WzH1lP9@LQ3V64L9R2>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 4 Feb 2025 19:53:51 +0100
X-Gm-Features: AWEUYZlr2Up0uWZIpX0zIGqhtd3i2LpMYVfI_w2MPUlUydUqCVHzfWoEWw2OUCc
Message-ID: <CANn89iJ=8inHbr+qQKifcX=m5=TfN8+MELDM_Ho8-mdA156UPw@mail.gmail.com>
Subject: Re: [PATCH net-next v2] netdev-genl: Elide napi_id when not present
To: Joe Damato <jdamato@fastly.com>, Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org, 
	kuba@kernel.org, "David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Amritha Nambiar <amritha.nambiar@intel.com>, 
	Mina Almasry <almasrymina@google.com>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 4, 2025 at 7:28=E2=80=AFPM Joe Damato <jdamato@fastly.com> wrot=
e:
>
> On Tue, Feb 04, 2025 at 06:41:34AM +0100, Eric Dumazet wrote:
> > On Mon, Feb 3, 2025 at 8:17=E2=80=AFPM Joe Damato <jdamato@fastly.com> =
wrote:
> > >
> > > There are at least two cases where napi_id may not present and the
> > > napi_id should be elided:
> > >
> > > 1. Queues could be created, but napi_enable may not have been called
> > >    yet. In this case, there may be a NAPI but it may not have an ID a=
nd
> > >    output of a napi_id should be elided.
> > >
> > > 2. TX-only NAPIs currently do not have NAPI IDs. If a TX queue happen=
s
> > >    to be linked with a TX-only NAPI, elide the NAPI ID from the netli=
nk
> > >    output as a NAPI ID of 0 is not useful for users.
> > >
> > > Signed-off-by: Joe Damato <jdamato@fastly.com>
> > > ---
> > >  v2:
> > >    - Updated to elide NAPI IDs for RX queues which may have not calle=
d
> > >      napi_enable yet.
> > >
> > >  rfc: https://lore.kernel.org/lkml/20250128163038.429864-1-jdamato@fa=
stly.com/
> > >  net/core/netdev-genl.c | 14 ++++++++------
> > >  1 file changed, 8 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/net/core/netdev-genl.c b/net/core/netdev-genl.c
> > > index 715f85c6b62e..a97d3b99f6cd 100644
> > > --- a/net/core/netdev-genl.c
> > > +++ b/net/core/netdev-genl.c
> > > @@ -385,9 +385,10 @@ netdev_nl_queue_fill_one(struct sk_buff *rsp, st=
ruct net_device *netdev,
> > >         switch (q_type) {
> > >         case NETDEV_QUEUE_TYPE_RX:
> > >                 rxq =3D __netif_get_rx_queue(netdev, q_idx);
> > > -               if (rxq->napi && nla_put_u32(rsp, NETDEV_A_QUEUE_NAPI=
_ID,
> > > -                                            rxq->napi->napi_id))
> > > -                       goto nla_put_failure;
> > > +               if (rxq->napi && rxq->napi->napi_id >=3D MIN_NAPI_ID)
> > > +                       if (nla_put_u32(rsp, NETDEV_A_QUEUE_NAPI_ID,
> > > +                                       rxq->napi->napi_id))
> > > +                               goto nla_put_failure;
> > >
> > >                 binding =3D rxq->mp_params.mp_priv;
> > >                 if (binding &&
> > > @@ -397,9 +398,10 @@ netdev_nl_queue_fill_one(struct sk_buff *rsp, st=
ruct net_device *netdev,
> > >                 break;
> > >         case NETDEV_QUEUE_TYPE_TX:
> > >                 txq =3D netdev_get_tx_queue(netdev, q_idx);
> > > -               if (txq->napi && nla_put_u32(rsp, NETDEV_A_QUEUE_NAPI=
_ID,
> > > -                                            txq->napi->napi_id))
> > > -                       goto nla_put_failure;
> > > +               if (txq->napi && txq->napi->napi_id >=3D MIN_NAPI_ID)
> > > +                       if (nla_put_u32(rsp, NETDEV_A_QUEUE_NAPI_ID,
> > > +                                       txq->napi->napi_id))
> > > +                               goto nla_put_failure;
> > >         }
> >
> > Hi Joe
> >
> > This might be time to add helpers, we now have these checks about
> > MIN_NAPI_ID all around the places.
>
> I'm not sure what the right etiquette is; I was thinking of just
> taking the patch you proposed below and submitting it with you as
> the author with my Reviewed-by.
>
> Is that OK and if so, are you OK with the commit message?

Oh no worries, please grab the patch completely, I will add my usual
'Reviewed-by' tag.

Thanks
