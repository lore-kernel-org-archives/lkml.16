Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0D421766F
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 18:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738692815; cv=none; b=nW26i1Q13Cp7GoKdOAoHncr3OQ0iKLv+pKU/ilQICCB7tP7t7skjdUeyL24wr0WZsC2jwXhxgT1Gpp2v2mpC3MgRftIb0ERZ6KnLGyDOaspSYyGBTd9bHRIH643MPbaPiniHQZrgLhwJe+QUiaNPYsZ5Ryf//fXsqiZ/9aUz/Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738692815; c=relaxed/simple;
	bh=ABeCt5RQl/OtYqxEp27acHnOBV6LCKQEjwGGJd4EmN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q1wTbMZ8KRmvfAzNa+amCl7BDMP8R8KQ5YPjeSDQJ45Ab3Upx82o8cKyXcoaXocUQW9GcPYTlGpwvC1jd0lp3pxXN63yqmmD41cHEHvYKnKYzOlNFeEs5zB/Cydm1UxHdEftMtGqrzxI2WD9UUFyEbeU1TkJLEVAu2GYUN90HpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=DN1Y8Q+O; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="DN1Y8Q+O"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2efe25558ddso7606914a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 10:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1738692812; x=1739297612; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+jOlwUXhleVpVW96ZqZRH18mvt7irgV17WG7W+qTWSs=;
        b=DN1Y8Q+O1fBxmpn2nOOamIDNIcD6G+DsWo5nA+DbgO4KnE2LvOLLZ3Fa1374qdc7re
         /3e92a1lkjqwbN0wFCribyEIGO8AgcXLJHmwY+SVVZoh3iePV7xWtl5TvvL32q4e9aJE
         s/Xsm427ly0+CjokCSAfSqA/Qdy7F/K+Txomc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738692812; x=1739297612;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+jOlwUXhleVpVW96ZqZRH18mvt7irgV17WG7W+qTWSs=;
        b=lpS43O6Ulv0y2x8VFKAKreZvRw2dnXX6GtQldnzT1/q9zBRSkzgZGFQ0Uys9ffRbu6
         vY1EbDjpUjjs/YWrxKMuZlKpN+n2h/jofI8dQsNqfmSIlcaSZH773OFpdo95HkXY1nmN
         c4j8w0BXIzeMX+Ww3U035wEz8DFRAQNUG6caCTg7tXtE+eOHvp71GJ+aDulb8HrCh+uZ
         Qx637yA2u2iXHsq09zodPcXR65KrZItNHhpDB37s2QqNRUrw/dnC5qOUZicZ5CBSex33
         8RdORgCuwYb0+LEV76CiuJd4xZQXxiCbIp20PPA/ZpoHsQM1Z38mfq/NN7cIPgtiqutt
         yG9A==
X-Forwarded-Encrypted: i=1; AJvYcCWXPb8IAmXNFO1nYyJbDqnYUcNhVosIeyTxTEepXK9t6I9roiKWwvbRBgWdG2/2HBTBSnNLo57Xg3lCTnw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkLIWNtuehlWACMR3zArXlzFmRAKBC6A8fl9rZjay78fqH8B41
	iS7UMy5VebFRvN5LhnPmFIyGHf8Io8kWzPR754XgS9qS6PQIdrF+c0KW+AGcByw=
X-Gm-Gg: ASbGncvlG5zuAUQINcKModL6Rf5Ls2IesV1khAmNuyNmqdlJ4WtuMGiIign0CjkT8tq
	2dZ8cuVnaoLNvFJ10C/r6skAfai3WuGglX5/yc/03khqZyN1fcWRQCg/H8sJPgrysdBBfR8pv+L
	dhp0DRpGBi/jh+bBI+gqaI4s6xLh4zsqa+S+P9hTwuZS8v2991cscs7bdG6BEFta/ROE0CiZCgV
	1JrL7njvLkZtF3cxZg1cTkcS3ECjoq3KuF1UNLFOdk7q040k2HyRelWuKIQDOTf01fOmUCcQs9V
	TRBQyaz8OSwmu8FAeB5FdroLf1OK6c4bwHzsrjHsIM7BGRWZR0CTqtUVCg==
X-Google-Smtp-Source: AGHT+IFtjkOAfwfYO8hVjlh+QcCog+25LHHkluPpKbr5sJcAhRMEZztXzq6nUMVz1VaTaoEequ5dZw==
X-Received: by 2002:a17:90b:2c84:b0:2ee:b2e6:4275 with SMTP id 98e67ed59e1d1-2f83ac65958mr33338939a91.26.1738692812469;
        Tue, 04 Feb 2025 10:13:32 -0800 (PST)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bc97d25sm13987346a91.5.2025.02.04.10.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 10:13:32 -0800 (PST)
Date: Tue, 4 Feb 2025 10:13:29 -0800
From: Joe Damato <jdamato@fastly.com>
To: Eric Dumazet <edumazet@google.com>
Cc: netdev@vger.kernel.org, kuba@kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
	Amritha Nambiar <amritha.nambiar@intel.com>,
	Mina Almasry <almasrymina@google.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next v2] netdev-genl: Elide napi_id when not present
Message-ID: <Z6JYyak3nuQaJNgJ@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
	kuba@kernel.org, "David S. Miller" <davem@davemloft.net>,
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
	Amritha Nambiar <amritha.nambiar@intel.com>,
	Mina Almasry <almasrymina@google.com>,
	open list <linux-kernel@vger.kernel.org>
References: <20250203191714.155526-1-jdamato@fastly.com>
 <CANn89i+vf5=6f8kuZKCmP66P1LWGmAj06i+NhgqpFLVR8K5bEA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANn89i+vf5=6f8kuZKCmP66P1LWGmAj06i+NhgqpFLVR8K5bEA@mail.gmail.com>

On Tue, Feb 04, 2025 at 06:41:34AM +0100, Eric Dumazet wrote:
> On Mon, Feb 3, 2025 at 8:17 PM Joe Damato <jdamato@fastly.com> wrote:
> >
> > There are at least two cases where napi_id may not present and the
> > napi_id should be elided:
> >
> > 1. Queues could be created, but napi_enable may not have been called
> >    yet. In this case, there may be a NAPI but it may not have an ID and
> >    output of a napi_id should be elided.
> >
> > 2. TX-only NAPIs currently do not have NAPI IDs. If a TX queue happens
> >    to be linked with a TX-only NAPI, elide the NAPI ID from the netlink
> >    output as a NAPI ID of 0 is not useful for users.
> >
> > Signed-off-by: Joe Damato <jdamato@fastly.com>
> > ---
> >  v2:
> >    - Updated to elide NAPI IDs for RX queues which may have not called
> >      napi_enable yet.
> >
> >  rfc: https://lore.kernel.org/lkml/20250128163038.429864-1-jdamato@fastly.com/
> >  net/core/netdev-genl.c | 14 ++++++++------
> >  1 file changed, 8 insertions(+), 6 deletions(-)
> >
> > diff --git a/net/core/netdev-genl.c b/net/core/netdev-genl.c
> > index 715f85c6b62e..a97d3b99f6cd 100644
> > --- a/net/core/netdev-genl.c
> > +++ b/net/core/netdev-genl.c
> > @@ -385,9 +385,10 @@ netdev_nl_queue_fill_one(struct sk_buff *rsp, struct net_device *netdev,
> >         switch (q_type) {
> >         case NETDEV_QUEUE_TYPE_RX:
> >                 rxq = __netif_get_rx_queue(netdev, q_idx);
> > -               if (rxq->napi && nla_put_u32(rsp, NETDEV_A_QUEUE_NAPI_ID,
> > -                                            rxq->napi->napi_id))
> > -                       goto nla_put_failure;
> > +               if (rxq->napi && rxq->napi->napi_id >= MIN_NAPI_ID)
> > +                       if (nla_put_u32(rsp, NETDEV_A_QUEUE_NAPI_ID,
> > +                                       rxq->napi->napi_id))
> > +                               goto nla_put_failure;
> >
> >                 binding = rxq->mp_params.mp_priv;
> >                 if (binding &&
> > @@ -397,9 +398,10 @@ netdev_nl_queue_fill_one(struct sk_buff *rsp, struct net_device *netdev,
> >                 break;
> >         case NETDEV_QUEUE_TYPE_TX:
> >                 txq = netdev_get_tx_queue(netdev, q_idx);
> > -               if (txq->napi && nla_put_u32(rsp, NETDEV_A_QUEUE_NAPI_ID,
> > -                                            txq->napi->napi_id))
> > -                       goto nla_put_failure;
> > +               if (txq->napi && txq->napi->napi_id >= MIN_NAPI_ID)
> > +                       if (nla_put_u32(rsp, NETDEV_A_QUEUE_NAPI_ID,
> > +                                       txq->napi->napi_id))
> > +                               goto nla_put_failure;
> >         }
> 
> Hi Joe
> 
> This might be time to add helpers, we now have these checks about
> MIN_NAPI_ID all around the places.

Thanks that's a good idea. I'll add that for the v3.
