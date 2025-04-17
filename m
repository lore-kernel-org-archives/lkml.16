Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD0428EA
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744849786; cv=none; b=GhmrWL4xDpdOVD81O7EkFRwtIIzCBP+WeSHNBQG+PHhkFFYKr9/eniihAFtBGlVwaE47xoBCo4+7XxdKR52i136ZFb4PhlB0IpANOZuG+4KcNQ+mLeZ+Z/8HqihX5fa8zZPwY4uB4k7y3Lu4Y3DeGKQFrAxiPIt03QOKeM4K4l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744849786; c=relaxed/simple;
	bh=uT3QtuVQ81NZ+tecGK8Zj+xGKg5VMGuET1fgMz0B4dc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pr0wmGRfSE76yJ2Xsy65LeYKB34221QBlU45LvHf3bZTRXCt4NHIqWri0/yXqY76oivk8uja12Nd3N+mBIaJuVDiQwwNVr1RmRE43gPICMG3VODtReZx2e/qAGegNiVPRUlwD1qMQ0d9ZyOs4vK1z6cE3c0wK3SiEzgbaqL5Kqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=gDZWOrgd; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="gDZWOrgd"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2295d78b433so2438615ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 17:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1744849783; x=1745454583; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WP1oD8ojhW04PX9migqK5siQPp/YiNU70XlfdH963OI=;
        b=gDZWOrgdD9BO1bPqs3ZjUPRoU2ppl9XrobJPcNThWkkK/T7Bu1UHfKhJwhqURs28GF
         fx2Wo4Wbvq1Hzo+hJ1u3mDJcNgfFyW/PGwVDx3qlfoeshvGlKwqf0XAiNvu3f+0pMXpJ
         uZG9BTon3jv3xftC/sPfZtBdFnuDoXMwkeifCT0/Mw24Vt6gOu78quT6DCHEpZOEb3k0
         W6EVJwRS/ia+S+YlklHjQSh4rcxt9bBxXDlP7Oy2zviY++MsqBhaaCDX6VOdkjXwKYk0
         9u9l3hqAdU4+Mk85SoYWegzYwEzRhyxzUVYwN2JBS6j68JNh4SwLknUbz6J9AfjzPHEs
         Yw0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744849783; x=1745454583;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WP1oD8ojhW04PX9migqK5siQPp/YiNU70XlfdH963OI=;
        b=Nj6IlE0ncsMaolIDlgSjailxF8mHiYzVcHHz9hyideBOfLHarbEYgWFTNxQJ7ZzWYP
         Ahf5Il6dCZIUgN1kx0WV17Q1GtM+xNpMxksVgdao8l30udK/wTJcl2Khtw0UfZadTW/D
         5Feq/wv30tUhrZV+AUY+rf1X/YGZjOVodfd+8NgOn5kuR+POSY7kj86g5t0H3rVvwXEy
         8DwbtuLtPJA+sSg/08sY/PnngXf4vTijFjIVQG5jo2w4uIbpprEufcFj9gvrcc68WQrn
         bxGBim0QoKteqmshicwWG523ZWPCSTeCtqe+B6/ZNGwReuZgel5MJa0pnB2kgRNZMs01
         1mow==
X-Forwarded-Encrypted: i=1; AJvYcCWZ/JhXteqKyx+3nNJ/bDITCx7GbItA0lqbflWjYIkbJino/8vIHkfVajG91qOFAN9TQSXEUjWOZdIk1Kw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZEBUEoO4cFEgIC5Vp5HdNROo4usyRtw+JehgQs657nm4F70a0
	751TzkFiFX7G/feXoD6H/VzW1/KHsaDIEFxvdu5cQZHVNk5xtRPuGoL3bW9pbNc=
X-Gm-Gg: ASbGncvDiSxM2IGu9nHJkM1gN/5i69Ba4cI0W9TZhVrHyvWzdt91L9j63iCQ+RVVOaH
	SmgY6/yWcW+bCbHRLirjOBuc5Pt11K9y+XWVFXvg8TlJF/8UpHntpayQjmkuvOQpy61gQQwaht7
	/GjVLibjWWkHrvj2fh3BpEZfykk3i/+LEeD619TSs38oJHmq6aOtG8j6/GK36F0P4fCDv+I7ZCR
	VKieIzvO+ahxkHraviZRk5L0Qfp5WmJNzyTPrGkRxqioVnGQquY1oWOUMWJSGD33+zCwE1+5g8E
	D+aXvbjMsXeSaRK+c7NOwBLZCRHC8OElYlhNbvKzm+JQkPdnC9sQM6gvu6nZa6j0N6CcWM9LBA=
	=
X-Google-Smtp-Source: AGHT+IGODSmKtgQTaCQWBZvcjwnv3GsNfODWGdLR/SxS58ZY9sJsKkJKcYbaDcy5Z28dWArcAMi1lg==
X-Received: by 2002:a17:90b:518b:b0:301:1bce:c252 with SMTP id 98e67ed59e1d1-30864168021mr6126979a91.27.1744849782637;
        Wed, 16 Apr 2025 17:29:42 -0700 (PDT)
Received: from xldev1604-tmpl.dev.purestorage.com ([208.88.159.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-308611d6107sm2311116a91.1.2025.04.16.17.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:29:42 -0700 (PDT)
Date: Wed, 16 Apr 2025 18:29:36 -0600
From: Michael Liang <mliang@purestorage.com>
To: Sagi Grimberg <sagi@grimberg.me>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Mohamed Khalfella <mkhalfella@purestorage.com>,
	Randy Jennings <randyj@purestorage.com>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvme-tcp: wait socket wmem to drain in queue stop
Message-ID: <20250417002936.7ezg2dwm44l7xblm@xldev1604-tmpl.dev.purestorage.com>
References: <20250405054848.3773471-1-mliang@purestorage.com>
 <2d9257c7-de3e-42ea-a947-25e394146f57@grimberg.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2d9257c7-de3e-42ea-a947-25e394146f57@grimberg.me>

On Mon, Apr 14, 2025 at 01:25:05AM +0300, Sagi Grimberg wrote:
> 
> 
> On 05/04/2025 8:48, Michael Liang wrote:
> > This patch addresses a data corruption issue observed in nvme-tcp during
> > testing.
> > 
> > Issue description:
> > In an NVMe native multipath setup, when an I/O timeout occurs, all inflight
> > I/Os are canceled almost immediately after the kernel socket is shut down.
> > These canceled I/Os are reported as host path errors, triggering a failover
> > that succeeds on a different path.
> > 
> > However, at this point, the original I/O may still be outstanding in the
> > host's network transmission path (e.g., the NIC’s TX queue). From the
> > user-space app's perspective, the buffer associated with the I/O is considered
> > completed since they're acked on the different path and may be reused for new
> > I/O requests.
> > 
> > Because nvme-tcp enables zero-copy by default in the transmission path,
> > this can lead to corrupted data being sent to the original target, ultimately
> > causing data corruption.
> 
> This is unexpected.
> 
> 1. before retrying the command, the host shuts down the socket.
> 2. the host sets sk_lingerime to 0, which means that
> as soon as the socket is shutdown - the packet should not be able to
> transmit again
> on the socket, zero-copy or not. Perhaps there is something not handled
> correctly
> with linger=0? perhaps you should try with linger=<some-timeout> ?
I did notice that the linger time is explicitly set to 0 in nvme-tcp, but it
doesn't behave as expected in this case for two main reasons:
1. We're invoking socket shutdown, not socket close. During shutdown, tcp_shutdown()
in net/ipv4/tcp.c is called. This changes the socket state and may send a FIN
if needed, however it doesn't consider the linger setting at all;
2. Further more while tcp_close() does check the linger time, we experimented with
using socket close instead of shutdown, yet the same data corruption issue persisted.

The root cause is that once data is handed off to the lower-level device driver for
transmission, neither socket shutdown nor close can cancel it. With further tracing,
I realized that the socket could be freed a while after close when the outstanding
TX skb is released by the NIC. And sk_wmem_alloc is the one used to track the outstanding
data sent to low-level driver, so it's necessary to wait until it turns to 0 in queue
stop.
