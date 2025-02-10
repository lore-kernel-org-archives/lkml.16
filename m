Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EC525B672
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 18:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739210605; cv=none; b=o9Ivswl22mgCgncArxUrq1Z1VENqNu5phBIhYyTXko/mnDZQ6NjTAlfLBmNpfXZCpf22Mi5CCX+SHb/IKsQGrEl9npnlFBRjdUCIk+Sb8cfvLXW8GJZ4ak/8nXilDV+Z4RzX3NeqDrGpnl+YRQUe91jwv2ah9UQIOXK4cv5MpCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739210605; c=relaxed/simple;
	bh=p6KSjYsGfmpN4uaNswBoAqfX2n84u2MhXIvKb0re0U8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vD5xVz6PLCg4V9fjkiONAJGsfRf17zFZ5CfwVjEO0OIHZ1g8Ed7eH0MOPeY6AlOuZndF7wWsinHGu9ZKtVJ/B8gcLM6vRNccnHtUIbz5HcJKf9MDh9LcBrH2dJIKz8qwR+pThDCHWaJ0zBKe+EptPasKxvzfCKtIrSeifGfrd2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=qHmr8G/C; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="qHmr8G/C"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21f4af4f9ddso52713725ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 10:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1739210603; x=1739815403; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q0ColAFAZi4Tngf2Yhd/Mj5SSDQPz6saNuJ+0XCUfiw=;
        b=qHmr8G/CJw7j9WoZexAb75s0tE67BWWnf+n53G2j1ng29BSiBVBZMhMgg35HD+UO0v
         kuenZDluhGlFnXnw7CvAgsTeV3IkWhPmEC8jeyPasOw8rtQ/8dhN6PFoHwWxL+m6r27H
         2QknvMcjwMvT9/CfOHH76SxqSHwStrB8VRym4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739210603; x=1739815403;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q0ColAFAZi4Tngf2Yhd/Mj5SSDQPz6saNuJ+0XCUfiw=;
        b=EI2FvRfOIyPVgbG5czVtXfbEf06So8pSZU+ojfwX+f9rgcFryOCQUnWGhKSwMZxOc2
         WFTQt4JcRTDhYcRFMaPgOk0woEGEV7ugyFmXrjq8b9S9heSBeRR/DdQoHhQbFwFnUos5
         WTYuOdeKoO9PW24tcjV2fGro0b4gJdgUarzUt3d1nuyTRNOo/7QaLwYYjzcGuW4jviyi
         +2VeHpCzjKw8/oBxwaoR7ADFycM6ZKrBn2YZcSfWjwiyl1/+H12mSB6188g5iK4vw3rT
         4JIH4VQACMNb3DtHde+fX8cOB4RZOS8xaAhuT7QVd3iaF1Rw2s9qadRqiVWAeIxHG9oc
         uVsg==
X-Forwarded-Encrypted: i=1; AJvYcCWmZp+vh/GtzydRYwryU09lRyamwKZvtkmU1DjmFqXQqYVmvJVpCJXPYtHya1zVE/bey3xy3lK4FY4ii0A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXnvBU0wc+si2Z/w78EQYqgOuxrc+PpC2xFSWSGgmTqzkiEktO
	FuVmXGRKZcbtlmMwfk1kwrMd8IOuZi2esF5b7JJoo/PfdGxrnR7pQHqBQ4BWfQI=
X-Gm-Gg: ASbGncsqifWle707AE3spPb2PNKJjgWu7f9E+p2YaJla6PyBWCnLqK3ur3XdmY49M04
	Mr4/HFIiWHTsBLd3gT+zfWY2uL5bs0IulTHODOE8HvN3qzJF5r/kKtl9QvImhwZDVUU/IkNnxhp
	AK+fZvSsZemgBbHGMFylnAjVZ4UMd+k5Z/HFqL7XYhjMLYGkqB6BLPJ6ugkleuL34ambkG5bHKj
	Y3CrF0Y+Wc+AdbZco+em/TYS6w6xiuTaetH92KfNtMBeiAy3wVcceotflVYuD8XDbDots+LevcI
	Rzo4YfA+0AtZ+zCSDC7xA8et6nWMlaH+0cynf0LxEjzihfvOqLJUCznMUQ==
X-Google-Smtp-Source: AGHT+IE5iidFomxHkIy+VYqWBmgoUJnNmg2a1BiELKxmTrveZa2Z19C3u7qiwVfucLVEQXEENuF22w==
X-Received: by 2002:a05:6a21:202:b0:1ee:321b:313b with SMTP id adf61e73a8af0-1ee321b32f8mr8307599637.41.1739210603202;
        Mon, 10 Feb 2025 10:03:23 -0800 (PST)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-730767fe44asm4411507b3a.4.2025.02.10.10.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 10:03:22 -0800 (PST)
Date: Mon, 10 Feb 2025 10:03:20 -0800
From: Joe Damato <jdamato@fastly.com>
To: Stanislav Fomichev <stfomichev@gmail.com>
Cc: netdev@vger.kernel.org, horms@kernel.org, kuba@kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Mina Almasry <almasrymina@google.com>,
	Martin Karsten <mkarsten@uwaterloo.ca>,
	Sridhar Samudrala <sridhar.samudrala@intel.com>,
	David Wei <dw@davidwei.uk>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next v5 2/3] netdev-genl: Add an XSK attribute to
 queues
Message-ID: <Z6o_aMvoycAAJOd3@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Stanislav Fomichev <stfomichev@gmail.com>, netdev@vger.kernel.org,
	horms@kernel.org, kuba@kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Mina Almasry <almasrymina@google.com>,
	Martin Karsten <mkarsten@uwaterloo.ca>,
	Sridhar Samudrala <sridhar.samudrala@intel.com>,
	David Wei <dw@davidwei.uk>,
	open list <linux-kernel@vger.kernel.org>
References: <20250208041248.111118-1-jdamato@fastly.com>
 <20250208041248.111118-3-jdamato@fastly.com>
 <Z6gIU3bsIjsYqCN_@mini-arch>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z6gIU3bsIjsYqCN_@mini-arch>

On Sat, Feb 08, 2025 at 05:43:47PM -0800, Stanislav Fomichev wrote:
> On 02/08, Joe Damato wrote:
> > Expose a new per-queue nest attribute, xsk, which will be present for
> > queues that are being used for AF_XDP. If the queue is not being used for
> > AF_XDP, the nest will not be present.
> > 
> > In the future, this attribute can be extended to include more data about
> > XSK as it is needed.
> > 
> > Signed-off-by: Joe Damato <jdamato@fastly.com>
> > Suggested-by: Jakub Kicinski <kuba@kernel.org>
> > ---
> >  v5:
> >    - Removed unused variable, ret, from netdev_nl_queue_fill_one.
> > 
> >  v4:
> >    - Updated netdev_nl_queue_fill_one to use the empty nest helper added
> >      in patch 1.
> > 
> >  v2:
> >    - Patch adjusted to include an attribute, xsk, which is an empty nest
> >      and exposed for queues which have a pool.
> > 
> >  Documentation/netlink/specs/netdev.yaml | 13 ++++++++++++-
> >  include/uapi/linux/netdev.h             |  6 ++++++
> >  net/core/netdev-genl.c                  | 11 +++++++++++
> >  tools/include/uapi/linux/netdev.h       |  6 ++++++
> >  4 files changed, 35 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/netlink/specs/netdev.yaml b/Documentation/netlink/specs/netdev.yaml
> > index 288923e965ae..85402a2e289c 100644
> > --- a/Documentation/netlink/specs/netdev.yaml
> > +++ b/Documentation/netlink/specs/netdev.yaml
> > @@ -276,6 +276,9 @@ attribute-sets:
> >          doc: The timeout, in nanoseconds, of how long to suspend irq
> >               processing, if event polling finds events
> >          type: uint
> > +  -
> > +    name: xsk-info
> > +    attributes: []
> >    -
> >      name: queue
> >      attributes:
> > @@ -294,6 +297,9 @@ attribute-sets:
> >        -
> >          name: type
> >          doc: Queue type as rx, tx. Each queue type defines a separate ID space.
> > +             XDP TX queues allocated in the kernel are not linked to NAPIs and
> > +             thus not listed. AF_XDP queues will have more information set in
> > +             the xsk attribute.
> >          type: u32
> >          enum: queue-type
> >        -
> > @@ -309,7 +315,11 @@ attribute-sets:
> >          doc: io_uring memory provider information.
> >          type: nest
> >          nested-attributes: io-uring-provider-info
> > -
> > +      -
> > +        name: xsk
> > +        doc: XSK information for this queue, if any.
> > +        type: nest
> > +        nested-attributes: xsk-info
> >    -
> >      name: qstats
> >      doc: |
> > @@ -652,6 +662,7 @@ operations:
> >              - ifindex
> >              - dmabuf
> >              - io-uring
> > +            - xsk
> >        dump:
> >          request:
> >            attributes:
> > diff --git a/include/uapi/linux/netdev.h b/include/uapi/linux/netdev.h
> > index 6c6ee183802d..4e82f3871473 100644
> > --- a/include/uapi/linux/netdev.h
> > +++ b/include/uapi/linux/netdev.h
> > @@ -136,6 +136,11 @@ enum {
> >  	NETDEV_A_NAPI_MAX = (__NETDEV_A_NAPI_MAX - 1)
> >  };
> >  
> > +enum {
> > +	__NETDEV_A_XSK_INFO_MAX,
> > +	NETDEV_A_XSK_INFO_MAX = (__NETDEV_A_XSK_INFO_MAX - 1)
> > +};
> > +
> >  enum {
> >  	NETDEV_A_QUEUE_ID = 1,
> >  	NETDEV_A_QUEUE_IFINDEX,
> > @@ -143,6 +148,7 @@ enum {
> >  	NETDEV_A_QUEUE_NAPI_ID,
> >  	NETDEV_A_QUEUE_DMABUF,
> >  	NETDEV_A_QUEUE_IO_URING,
> > +	NETDEV_A_QUEUE_XSK,
> >  
> >  	__NETDEV_A_QUEUE_MAX,
> >  	NETDEV_A_QUEUE_MAX = (__NETDEV_A_QUEUE_MAX - 1)
> > diff --git a/net/core/netdev-genl.c b/net/core/netdev-genl.c
> > index 0dcd4faefd8d..b5a93a449af9 100644
> > --- a/net/core/netdev-genl.c
> > +++ b/net/core/netdev-genl.c
> > @@ -400,11 +400,22 @@ netdev_nl_queue_fill_one(struct sk_buff *rsp, struct net_device *netdev,
> >  		if (params->mp_ops &&
> >  		    params->mp_ops->nl_fill(params->mp_priv, rsp, rxq))
> >  			goto nla_put_failure;
> > +
> > +		if (rxq->pool)
> > +			if (nla_put_empty_nest(rsp, NETDEV_A_QUEUE_XSK))
> > +				goto nla_put_failure;
> 
> Needs to be guarded by ifdef CONFIG_XDP_SOCKETS?
> 
> 
> net/core/netdev-genl.c: In function `netdev_nl_queue_fill_one´:
> net/core/netdev-genl.c:404:24: error: `struct netdev_rx_queue´ has no member named `pool´
>   404 |                 if (rxq->pool)
>       |                        ^~
> net/core/netdev-genl.c:414:24: error: `struct netdev_queue´ has no member named `pool´
>   414 |                 if (txq->pool)
>       |                        ^~

Ah, thanks.

I'm trying to decide if it'll look better factored out into helpers
vs just dropping the #ifdefs in netdev_nl_queue_fill_one.

Open to opinions so that hopefully v6 will be the last one ;)
