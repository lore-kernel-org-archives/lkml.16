Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DEB226D13
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 01:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744767573; cv=none; b=J5nDudapcSNNZjHWfy1YWT/IzkFNJ5ay2mHZfWbcBcwksrHKfsBHaUyTdfsNZcAOqHsZrNj6eiDWyW8I7atBuaTmAZ6c/tUWsLRmjkWXIE1Ea/iyBmptWZti8gv8y+bMAcrQz8tdm8JyVG+zX+6NJsk7flFeU3IgHxD9QhIDwas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744767573; c=relaxed/simple;
	bh=dTnq697UHqs4Zk+ACZjnV/VcHC+rw4zE0mnepumyuk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AR6WEylruhAVjQBU22cdKPWF9PG0FHYQr17J/vR3tN0Qj8LAP9BK9rH/HxV8Ddp5L19fOSM238GpYM3iCk2dqytgsLq8qQGI8wl5gbdTsjwDIM2e9RHKcAdI19xwXCIuyPHBMbrUB8i6wD89FuD+xbV6cq2VP4SWiSQtvKrQ6rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=Rd3j35hj; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="Rd3j35hj"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22928d629faso60846665ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 18:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1744767571; x=1745372371; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RJHYVgEVoY4PsMLuoYWXVUdOXZM3Dp29HRy62pgdjTw=;
        b=Rd3j35hj2xWKtfhMqhHMNAyTmBxwCMjG38v86slF2193sI6XYQ3R7BZzGIkyyrrXvw
         KjPujaFoaPJTfcIaC3qSvqccdLRhnVOTT42VgJIzOiAsY2n0CX07lkUG4OIOSiDZBPYi
         kkPXVxdfAOOWh1OCAi9L0DdNGQvztq6IDnciM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744767571; x=1745372371;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RJHYVgEVoY4PsMLuoYWXVUdOXZM3Dp29HRy62pgdjTw=;
        b=nKRr0BWAa/icbKthEICkLb86JUJEhK9DlpVOt4ikUQsXWPZuNRGty3odLB4kSmAW2m
         mtoDyLvaaMETn0ukoTDqtGrnnzgsBuP1996CcvjLSbOJ6ChG6Qfbr3eOEiM6y1HCE3pd
         97O/fUfMaJqLhAevamtKqB0mdSQ/AOX/1QADB72BcKvWORjOsE4BGtmB66+shHn6O2oX
         jTVHEEI/GFRG5xZ+xWLvR5SCrCeqw0kJbntOszPHlXAzSpFa55PpEXc7oq2LaFUIWW2q
         98BuaV6IY5/NWac7qPGTfqawppKWnwnP7X6MxrrlPAft0t7gAFSRaCc2Em0tYTbC361F
         A8fw==
X-Forwarded-Encrypted: i=1; AJvYcCXYxueZErX4qpXrwwLXA/fbIrgyChq0RZ+6nxUwDXNZzxqkG8ogjrtuq+aTD5+IracL6xmvtPkgx5WAZA0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt/PdD9EgkoGyEOQh0lwMsrSll7+rQOPAForJRm2IC7hRx/Psh
	ydtkr8lmKOSRm6C/p9clcLhaqymu7p+XXL56lie3v5KXHnsa/xYmr3Nh136tOE0=
X-Gm-Gg: ASbGncsvp6MGpVXvsws06Xs3BOfdaqrBpCE2b4w4akc2/O77tjWvnzsQWKT/JQA4r/5
	Opkoj6DxD05oNeGbyZ3I28/llwAwxBWeoIiTGOy8r4sMZC5Go6UGLXtZhKlXS/SZO21VYx5O7PN
	dd2vUUkymmU/2Ty5cjJ8Co8RJqq2ea1TnLK6VC8nJohNRwZDu1ue7DzZYQzMN9U+k+6YWndRUrY
	bxkidNGXUBG+BQGXPjw6BGrOryQJCSRXwwzxyLEvJjXVf42UM6Z1TI10tsWGMbhDW9I86TofVot
	fcw2acHQc1XXwrBMNZ7o0HESinz10a790aFTxFwaRGLztbov2buJcmcPS5x2swh6AsgWWbnS4VV
	v/WUg1KxgVAU/
X-Google-Smtp-Source: AGHT+IGal5XUm/5ZjIJym+rt2yFc1Nr3o7jD6J3I/S17PgjABrDnWFW2YF0A1YKdPmsdX90xjsLVeQ==
X-Received: by 2002:a17:902:db05:b0:224:160d:3f54 with SMTP id d9443c01a7336-22c31a84ec4mr19284785ad.31.1744767570671;
        Tue, 15 Apr 2025 18:39:30 -0700 (PDT)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fe4de0sm2097415ad.212.2025.04.15.18.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 18:39:30 -0700 (PDT)
Date: Tue, 15 Apr 2025 18:39:27 -0700
From: Joe Damato <jdamato@fastly.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>, David Wei <dw@davidwei.uk>,
	Eric Dumazet <edumazet@google.com>,
	open list <linux-kernel@vger.kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [RFC net 0/1] Fix netdevim to correctly mark NAPI IDs
Message-ID: <Z_8KT7LYUgyZQhI-@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>, David Wei <dw@davidwei.uk>,
	Eric Dumazet <edumazet@google.com>,
	open list <linux-kernel@vger.kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
References: <20250329000030.39543-1-jdamato@fastly.com>
 <20250331133615.32bd59b8@kernel.org>
 <Z-sX6cNBb-mFMhBx@LQ3V64L9R2>
 <20250331163917.4204f85d@kernel.org>
 <Z_613wmrKRu4R-IP@LQ3V64L9R2>
 <20250415171154.0382c7f7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415171154.0382c7f7@kernel.org>

On Tue, Apr 15, 2025 at 05:11:54PM -0700, Jakub Kicinski wrote:
> On Tue, 15 Apr 2025 12:39:11 -0700 Joe Damato wrote:
> > On Mon, Mar 31, 2025 at 04:39:17PM -0700, Jakub Kicinski wrote:
> > > Up to you. The patch make me wonder how many other corner cases / bugs
> > > we may be missing in drivers. And therefore if we shouldn't flesh out
> > > more device-related tests. But exercising the core code makes sense
> > > in itself so no strong feelings.  
> > 
> > Sorry to revive this old thread, but I have a bit of time to get
> > this fixed now. I have a patch for netdevsim but am trying to figure
> > out what the best way to write a test for this is.
> > 
> > Locally, I've hacked up a tools/testing/selftests/drivers/net/napi_id.py
> > 
> > I'm using NetDrvEpEnv, but am not sure: is there an easy way in
> > Python to run stuff in a network namespace? Is there an example I
> > can look at?
> > 
> > In my Python code, I was thinking that I'd call fork and have each
> > python process (client and server) set their network namespace
> > according to the NetDrvEpEnv cfg... but wasn't sure if there was a
> > better/easier way ?
> > 
> > It looks like tools/testing/selftests/net/rds/test.py uses
> > LoadLibrary to call setns before creating a socket.
> > 
> > Should I go in that direction too?
> 
> Why do you need a netns? The NetDrvEpEnv will create one for you
> automatically and put one side of the netdevsim into it.
> Do you mean that you need to adjust that other endpoint?
> It's done the same way as if it was a remote machine:
> 
> 	cmd(..., host=cfg.remote)

Maybe I'm just thinking about it wrong and/or describing it poorly.

The idea was that napi_id.py test forks. One process does a
listen()/accept() and the other does a connect(). The accept side
checks that the napi ID is non-zero. For that to work, both
processes need their netdevsims to be able to talk to each other.

> If you really need a netnes check out
> tools/testing/selftests/net/lib/py/netns.py

I'll take a look, but I'm probably just missing something about how
to properly use NetDrvEpEnv.
