Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5057518FC72
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 17:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738949104; cv=none; b=ZC4p+XUOmPJB1YeZRqkG27GZgeb7q4iMU+etv42JmNM92uJn2+wCwKZm3uSkKDC+ZLiDU/7c9p3SrOrYDbplgiHZR+sF5LmyyJ+8xweDhUQnWTjsnosjbatGcguYJFnLWyID3Xb/nqBzNqwt0lNf1JmcPfNJX2PiIH7tnVaCL3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738949104; c=relaxed/simple;
	bh=iKoA3Dq9s3tWAZm62D5N3xmXxicb6RywtNHezCBtBjk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fxGEqp4ghPtVYTJkFEYPCSEbppjeXhWaWrv1uvdWqQIPtf7H0TNiRI+yzlaSw9X1zg7jn9dH5V4BBIszEVjHdzAzQXWbs6pdToLAzq26uJNoSUIZeNEvU6botBixOY6MvuqW2TqU4t62lYLBAjUIfunZB4IaPQRp0FVra6kbFHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=bPGNccpg; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="bPGNccpg"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21f6022c2c3so7737435ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 09:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1738949102; x=1739553902; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1h8iE+x6l6fDJRgf8jTiyVWI9cwMS/v7wWiYAjXKBN4=;
        b=bPGNccpgVP8NAVw2pbgWymIAlF3oqRVcv99rNyir/1U8NVLU3BoRI+TZi6mcoGbwwN
         xrDzjKsGYWyPAsSDalVCxOx85QtuU31dNKp7C6NslBTPBh9DBsc1vFt7FDZ6Xoql6MmK
         janBPaymt43cLvhlsahwguuTakDFFMDvPvpy0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738949102; x=1739553902;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1h8iE+x6l6fDJRgf8jTiyVWI9cwMS/v7wWiYAjXKBN4=;
        b=vB6HZWaKcaFFxNGVnnypiHnGo7lmZ4461YxXmwu5/SjGyzRbLmw51qQwaSqhIZMye1
         NtQg5Ili7nTDyVrDxVRuIsilAW10+hXSeBURYc86mp+c/hDaKa4NVawrKY1NHPLfQ3k6
         /y/lnLZx3r8wUaB5TYkzvAhi333ipDdNu8FtaslveYzcMjDTYYV/DwhuZNRPEtriOfv2
         885atoB0J6EfzstZXaa9ewoAVwH5P8fcuMZsGrdm0a1Xlafuy8ikpbtxU9eU+0dnR2in
         BZTAtYeVm65DzEq36OSh4cWeahdk8mE/6A+amN9FbTqlUJCWKAbVOSjQqETGxPu06s5N
         gXDw==
X-Forwarded-Encrypted: i=1; AJvYcCXYGch/iZMjk45NdwQSb/6F/rx0iXe+dnE/Nud2sju9+5kLQ02rCRN13Crfw3mRqelhFFDiV4mGwzuqcUU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo25DjatIPKHPw0ZARmnpTA6+tTM6/ieRVs5vqiD1Fhr/qk3Lv
	OVfHyhk9T+ETXIfc6NRgCpzHGxFqsfYAHF/vcRL19oC4pUMMfYvFEO86FSJu2CQ=
X-Gm-Gg: ASbGncsOOB7m9JV4g/QyVZmmhE8YIUpQkF534T5QI8ke6DOyqRxWqbLYgjM+JxBjNEj
	KdRauu9o7rpiUX4sGYgxNcJgATFFYw6NHPixzyed5MV2ZCHjerboCaLhATCGt/yYd5oUXgQE7lV
	oMhvos1l9t5Ysk6isxl/0AZb6Y3W3Qr4mFYPZfb6NYSHCKeRBWKhdnBRPa9v/6oTd9vZRkYAI6m
	SPYyNzFC59lRT788akNMfzjdVQrhAJLvUTJwHNYJka11V+hh7Ngdz2ZUSe+tuqmjbP6HToQ1FR5
	bqoMHDqvCeQ9dB+pQs9tzYNRYp2QD4L7UXWbz8T1lHwhhuWIN8g9hhp3lg==
X-Google-Smtp-Source: AGHT+IFuPBqihb3KRgNAtHFlI8yllud1dbR8e/Jm9UPR/bBfgMm14QMh/DgJHKaG0i4Y2Ug1DdBN0Q==
X-Received: by 2002:a05:6a20:439f:b0:1ed:a4b1:9124 with SMTP id adf61e73a8af0-1ee05299d4fmr5115662637.8.1738949102366;
        Fri, 07 Feb 2025 09:25:02 -0800 (PST)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048e20bcdsm3342780b3a.178.2025.02.07.09.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 09:25:01 -0800 (PST)
Date: Fri, 7 Feb 2025 09:24:57 -0800
From: Joe Damato <jdamato@fastly.com>
To: Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, pabeni@redhat.com, edumazet@google.com,
	sridhar.samudrala@intel.com, Jakub Kicinski <kuba@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Mina Almasry <almasrymina@google.com>,
	Daniel Jurgens <danielj@nvidia.com>,
	Amritha Nambiar <amritha.nambiar@intel.com>,
	David Wei <dw@davidwei.uk>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next v4 2/3] netdev-genl: Add an XSK attribute to
 queues
Message-ID: <Z6ZB6SdcO4kBi-Au@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
	pabeni@redhat.com, edumazet@google.com, sridhar.samudrala@intel.com,
	Jakub Kicinski <kuba@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Mina Almasry <almasrymina@google.com>,
	Daniel Jurgens <danielj@nvidia.com>,
	Amritha Nambiar <amritha.nambiar@intel.com>,
	David Wei <dw@davidwei.uk>,
	open list <linux-kernel@vger.kernel.org>
References: <20250207030916.32751-1-jdamato@fastly.com>
 <20250207030916.32751-3-jdamato@fastly.com>
 <20250207133055.GU554665@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207133055.GU554665@kernel.org>

On Fri, Feb 07, 2025 at 01:30:55PM +0000, Simon Horman wrote:
> On Fri, Feb 07, 2025 at 03:08:54AM +0000, Joe Damato wrote:
> > Expose a new per-queue nest attribute, xsk, which will be present for
> > queues that are being used for AF_XDP. If the queue is not being used for
> > AF_XDP, the nest will not be present.
> > 
> > In the future, this attribute can be extended to include more data about
> > XSK as it is needed.
> > 
> > Signed-off-by: Joe Damato <jdamato@fastly.com>
> > Suggested-by: Jakub Kicinski <kuba@kernel.org>
> 
> ...
> 
> > diff --git a/net/core/netdev-genl.c b/net/core/netdev-genl.c
> > index 0dcd4faefd8d..75ca111aa591 100644
> > --- a/net/core/netdev-genl.c
> > +++ b/net/core/netdev-genl.c
> > @@ -380,6 +380,7 @@ netdev_nl_queue_fill_one(struct sk_buff *rsp, struct net_device *netdev,
> >  	struct netdev_rx_queue *rxq;
> >  	struct netdev_queue *txq;
> >  	void *hdr;
> > +	int ret;
> >  
> 
> Hi Joe,
> 
> Perhaps this got left behind after some revisions elsewhere.
> But as it stands ret is unused in this function and should be removed.
> 
> >  	hdr = genlmsg_iput(rsp, info);
> >  	if (!hdr)
> 
> ...

Yes, you are right. I originally added it for the empty nest and
then didn't use it.

Sorry that I missed that and caused unnecessary churn due to my own
negligence.

Thanks for the review / catching it.
