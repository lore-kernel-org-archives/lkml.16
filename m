Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFCC121D5BE
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 01:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744768608; cv=none; b=iu9J7pws82zK2jGr/RWj6QS5qOhYCyeV6+icMr6FvJTUZf4m+yTgRYnd/OtC43z5Ks632IFomo5yaNm2KbNaWz+naqopv64UE0R7nVR+LZo62lEYF5skMCf57U+8qrc5QfrM43ha9VFpjPW2JQgD0Xhop9scXC5T6WSlk3qw5V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744768608; c=relaxed/simple;
	bh=OlQksBI9N8C4io9PPEeKnK0eRnXxJawMD1xEMjk5isY=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OIzzwsfvw1NKKOCg4TgTICpA5nQEDTiiyzKZkKv3eubdHgNcTaSzw8Qfte/zNQ5XYTmCZxAmBYtG2FsL4+d82NCdA/B05rgumqRBzDDr+xU8iAVB0MIO2p6iD1QXF1uU8UHn3CYdI4yjk28wQlWstXoPeazwKfAaLVz/Wom56iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=Z0WbJ8qt; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="Z0WbJ8qt"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7376dd56f8fso7735407b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 18:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1744768606; x=1745373406; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zH6Lo7K1OSFKp6QNppXRFBk1j0NkAPFfDo3Y+3OHuq8=;
        b=Z0WbJ8qtEHFtZbdbMWMmwVkhyuCmuG5IWRQVqhHNY8OYbFCQoPgyyD1GutQScXTv6x
         ccwu0ZXxJIF9PrnAMIaQ/3NTji0dE+FKiRJmWHdH8rRRUDj25YkWbRxXAplVgGFRQ7hI
         1u+ERAU1wRZbsBAy4j8qSMlibC44oYw3Jg55s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744768606; x=1745373406;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zH6Lo7K1OSFKp6QNppXRFBk1j0NkAPFfDo3Y+3OHuq8=;
        b=EEi4rXDq+h4vwbqJe+pkPlERLNM7h9LYDVe3iYlASzdEOo22xbXXvy5ilKV+CCb/tl
         noySWGwZaamugvhl5E/+qgIeyEThVgItwuWhoZlet7y+ThaVAKzeiGqdafDFV5ucviKE
         ytOuXRnZ30bwmHGG11myybIhzowNgsOXMLQIf5gI1jJWr5djT1HrbNTF/dqB3ig0avBz
         XZzUijC/B5VY5TdxbfjZXq5nAObFkN9vgUV3NKsgyEfT0LAgVokQGwjdvRWyL7ynl6fw
         e94ID65Hqg4KmvkabefVW3JQy2RtF8yCAkKH65e99b7xCxDlXsQXrydFBQEGteEN7+oI
         A8dA==
X-Forwarded-Encrypted: i=1; AJvYcCWsdEPjGMuvn8Tid1vIcArJkIelhCNafZdiOQy7TDf+AKQP32+zTDXitLDOJH5haM5w9fgTDT1tENumv5U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXbTqP5SxrknIxWKMuDHUXY5SqFULfsW1bz4lpjd/TD/UD8WQt
	KMk6MKHrSthOJVwTKYD8rFNdrX9T43FxTJnflfen2pqcPmhTS1/aN+pKx4oNQJg=
X-Gm-Gg: ASbGnctYJCkneFSECrjyRL0a+ZJENun73N5YwVX3OXHpPhjfWc1YZVpXc4P65vqoUuC
	jGM+a0so3Mka1BB5wdds6X1smoOIn4/kBrkIyPwUB8uKqu3t0qo68O5X6GgEHnfx5pnKzqv4a+L
	J/pS/nlEOpIwqUpvqHT3lvZyeR4phhT8azCcQbQoNId3FvirOk2MJIxS+U2RyM7+XNImlzzvkHf
	4LyWHI/k+HF10qImdRtqP1lbDJn6ADXW+2qauTvrzWnTaO8WPyr/h1ZdJf8tbVwy9h3UBoP4Ir2
	mWYdKGEipsABE+4Ky4v2jAs9NL86J0iVsrzYhS5p0DFg/XG8n7ZZcW05kWrhL2pvKiHC5sXwaem
	U7HXht5y6gTQP
X-Google-Smtp-Source: AGHT+IGBEFiE7rD3c6yv9qx9mnATnRt4uhP8Ce6xBfMK/meKycVXu5GcBUNZvg9of04s8MQAW/IL2w==
X-Received: by 2002:a05:6a00:369b:b0:736:3c2b:c38e with SMTP id d2e1a72fcca58-73c26722c8dmr21114b3a.13.1744768606005;
        Tue, 15 Apr 2025 18:56:46 -0700 (PDT)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd2198e9csm9238144b3a.28.2025.04.15.18.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 18:56:45 -0700 (PDT)
Date: Tue, 15 Apr 2025 18:56:43 -0700
From: Joe Damato <jdamato@fastly.com>
To: Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>, David Wei <dw@davidwei.uk>,
	Eric Dumazet <edumazet@google.com>,
	open list <linux-kernel@vger.kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [RFC net 0/1] Fix netdevim to correctly mark NAPI IDs
Message-ID: <Z_8OW7PoidxBOgpK@LQ3V64L9R2>
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
 <Z_8KT7LYUgyZQhI-@LQ3V64L9R2>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_8KT7LYUgyZQhI-@LQ3V64L9R2>

On Tue, Apr 15, 2025 at 06:39:27PM -0700, Joe Damato wrote:
> On Tue, Apr 15, 2025 at 05:11:54PM -0700, Jakub Kicinski wrote:
> > On Tue, 15 Apr 2025 12:39:11 -0700 Joe Damato wrote:
> > > On Mon, Mar 31, 2025 at 04:39:17PM -0700, Jakub Kicinski wrote:
> > > > Up to you. The patch make me wonder how many other corner cases / bugs
> > > > we may be missing in drivers. And therefore if we shouldn't flesh out
> > > > more device-related tests. But exercising the core code makes sense
> > > > in itself so no strong feelings.  
> > > 
> > > Sorry to revive this old thread, but I have a bit of time to get
> > > this fixed now. I have a patch for netdevsim but am trying to figure
> > > out what the best way to write a test for this is.
> > > 
> > > Locally, I've hacked up a tools/testing/selftests/drivers/net/napi_id.py
> > > 
> > > I'm using NetDrvEpEnv, but am not sure: is there an easy way in
> > > Python to run stuff in a network namespace? Is there an example I
> > > can look at?
> > > 
> > > In my Python code, I was thinking that I'd call fork and have each
> > > python process (client and server) set their network namespace
> > > according to the NetDrvEpEnv cfg... but wasn't sure if there was a
> > > better/easier way ?
> > > 
> > > It looks like tools/testing/selftests/net/rds/test.py uses
> > > LoadLibrary to call setns before creating a socket.
> > > 
> > > Should I go in that direction too?
> > 
> > Why do you need a netns? The NetDrvEpEnv will create one for you
> > automatically and put one side of the netdevsim into it.
> > Do you mean that you need to adjust that other endpoint?
> > It's done the same way as if it was a remote machine:
> > 
> > 	cmd(..., host=cfg.remote)
> 
> Maybe I'm just thinking about it wrong and/or describing it poorly.
> 
> The idea was that napi_id.py test forks. One process does a
> listen()/accept() and the other does a connect(). The accept side
> checks that the napi ID is non-zero. For that to work, both
> processes need their netdevsims to be able to talk to each other.

In retrospect, it's probably easier to just have the connect() side
be socat or something run in the background, like the ncdevmem test.

Sorry for the noise, I'll mess around a bit more.
