Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B11217679
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 18:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738693708; cv=none; b=rjwaE1O3uQ+zF0aJ/03aaPUauqTg/QF51oIHU1dZtah4lLAZT3Khps3NrDdJqGIObacgE2bnvwHJr63nsbOUvfjDCbhu0EZhL8PWVDIn09IOLwLVLMa3cs0lG24cv3R1VljfmxzWB/L89db+GdNrDbK6TvvyfFEaVOhoCjdq5yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738693708; c=relaxed/simple;
	bh=AQhmKbtg1pduwiPcBd8kSw2dcbXPSj8PxbDEVcvjfIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NrOxo6HVdIMyYT/6NYp8wiIYjYaFZZ/rvXt62OtULktwU9sVXiKVesQw+Pbp8MgaxpVrZ8/GqV1Jm/B52j5iACdX4J3pv0LhW5BrdNyaiSxINMHxIL9SVi3swUsgKLL8ToN898B5YmL/xMv+a8RVvyCvaPAocCmT8KfJ/QCMYLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=XRh0CJtc; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="XRh0CJtc"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-21f05693a27so13500595ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 10:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1738693706; x=1739298506; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HpwkLu/KM6vrkAOkPfjjRePz2x6DxSmgv6WMUQgxnP0=;
        b=XRh0CJtcxsv6NruBgHfePiw7Dj/MzgvthbbJfnfvIY/5ps1/62OGyf3fYDXQiQ5E1s
         qDXMMAdiJEnBGQ0lXCuyp2qnSQIMs2yRzBVpHCeLV/2iZeS/V0SBYFXSoDHKqlYJ0J4C
         rQmfLZ5no5CG5mxt+95JdqUvMW3vjIvSz9L9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738693706; x=1739298506;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HpwkLu/KM6vrkAOkPfjjRePz2x6DxSmgv6WMUQgxnP0=;
        b=EzncHUoKDGmaP16RBUGp7q0WM6j5phvlJFahfseMnuNulkIvOsW3gQyC6vyMoHnkEd
         2T3AbiYt5rEesnFAl9ZzEYQKBia+us9+e3gN3oOPzLKYZjVRLPl7SVR5aBE29/kami70
         s3bGQQRJrdleCDL41YkWTTOhA9ybFUIfRFMWgHMGdGrq34MytF9jekKNpdAslQMXQoBz
         ksBQ0R8dk0KUBtdo+5dzgwJ7vMfz5Z9w/cxs5DF160vsFZbipB+lozAyL76U50oarMMN
         R/u+PAY5323IBgD2X6vWJ4nWz4x46M322m9cOlq/Om42wyiAM3KJIEGDhb2KIIr97EKU
         dZdw==
X-Forwarded-Encrypted: i=1; AJvYcCXWarH5lAE/UXtypaQybb/MY84uyOKXsyTcjzjBAZ4UY25OeDI2jgFPZfXfRSwD03FdDmtLT5sf6N3G2m4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmvXy8GObY/TJqYy0GxDAAlSq2qBeaANTaDFZMIohAZiS0mpZc
	mpUqenITNkbF/4yB6QuibCRkJz/AR85XZpipbGNQMr2KKNXIoC3U3fypYri38+k=
X-Gm-Gg: ASbGncvU8nLes43XGUW75GzKON+peVoaPdHY7zG5xsetWluP0T0/TmnHAf3uo0KjvJh
	neYqp1KivWq+3DZALo0cNhKC2/lJMhQy0waaZfkRBkluTXm3RHHnjp4tlyBxPmtugVJHTb6lm0f
	3OVqDlKCjdwmuWZNRNBpI41BwluzTnJ3b9H4mCWI3E0T8XirzW9DYrkyfRWUO+tzG/pp3caoojZ
	sFp48Ih2ICe7jA1/3yO86w3Q3tyfI3WmUTlG48sSABEyeSnRRQSGHftQh9w9IZbZ25de1oFuKeu
	vDWjYccygru8Slty/90JVTnHclaZPWEbKSD3pKkNyiYfXYHE9mEaKhRPag==
X-Google-Smtp-Source: AGHT+IESH7rvOjvQqQpDRnYB7plwMyi+XGz1EDdB2sknGAaIrG0ap9pCxfWdg/DN6W8STdFM5HdFAg==
X-Received: by 2002:a17:902:ea0a:b0:21f:a02:2c17 with SMTP id d9443c01a7336-21f0a022cb7mr37866645ad.45.1738693706150;
        Tue, 04 Feb 2025 10:28:26 -0800 (PST)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f165298e8sm840215ad.216.2025.02.04.10.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 10:28:25 -0800 (PST)
Date: Tue, 4 Feb 2025 10:28:23 -0800
From: Joe Damato <jdamato@fastly.com>
To: Eric Dumazet <edumazet@google.com>
Cc: netdev@vger.kernel.org, kuba@kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
	Amritha Nambiar <amritha.nambiar@intel.com>,
	Mina Almasry <almasrymina@google.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next v2] netdev-genl: Elide napi_id when not present
Message-ID: <Z6JcR5IH8WzH1lP9@LQ3V64L9R2>
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

I'm not sure what the right etiquette is; I was thinking of just
taking the patch you proposed below and submitting it with you as
the author with my Reviewed-by.

Is that OK and if so, are you OK with the commit message?
