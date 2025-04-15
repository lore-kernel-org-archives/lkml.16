Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D83250C0F
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 19:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744745961; cv=none; b=gQyKI9BAtCrD3sSgIGw9xsZninKbK4hWmq9TrBZGKZFR4wW300rprEJy7XZvjRagu29Fmo+I27p8mDvGg2WPdom4IsKwDevaJxM04/KAtLiVi8gwkTBSWptqur8OXzTxi/V/DNQynk1B3Lnfp2UxxLbIEY9lNL6h4YgP2Zt39Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744745961; c=relaxed/simple;
	bh=zsGUpj5GZ2h7Vwe6HLZ5jH16wOzMfXpoGpvHr2cGzUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aovKeoST4yMbcdNvtaaNoylU1uKfXDbvGyZV6m3ADf5LdUQHE1c2NPj7aIruK6d/C3UHIIX8tVNWtLtJZu1oS0XSmxA2WFhFZBprCv9OriDyDhs1ehXhLOsZ7vuzsn/q6/hx27Kr9fAdcQpaI5fbdCnAcAT+mVXsJYSPXmoCXkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=rjooBMZZ; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="rjooBMZZ"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-223f4c06e9fso63295ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 12:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1744745954; x=1745350754; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DgQZzwQ+VnFV+EQ4EbE4rQMrLWAC5dU5oyUSlaBvU/E=;
        b=rjooBMZZxr8ctxbFgUZ6zMte2wRpHtFKCMjMdl8aFdETZKAO47yAuHg/e8HkwktfS0
         JqVZOyhj8/PNqKb5fUR6JPIIociPJUJ2D3L9oheooceuT5rprXYlBZRbNi5avCXrIR7j
         eg4tX/QUipsQn0B9LBe8xVGTUioIeyG2M+2F8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744745954; x=1745350754;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DgQZzwQ+VnFV+EQ4EbE4rQMrLWAC5dU5oyUSlaBvU/E=;
        b=Fr5AW2B319eJRcx0mT9xOusEtuhaQ2Xf5POgE5iXkL49gmosxuAXXMjY59daTYoPO8
         FudCCOI2j9X0OwoS6gstYkFebCEErK0X+Hws8RVdPjzoUVd6y8kFkDVDaEYaNWPtdtjW
         XhH/6u9Dzg3rU+L9BRmEUwUuJRc/233QaAWQtO5SGModoaAqQZ/K4UVNV91JfKJ4unQf
         lAKl/QyxFcnkw1WmYUqH09TF54iXQXblVPKZfOJon0M9pOu6DvyilQhq3dododE/0A3j
         Yo4ZRDbPvRu7EdfeCEh8ga4MWONo5YcN+9W+5q/kT7gPxdgQoBbVpXcwF4EXlyiy7xD+
         i/8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVp+aSlampptdwprpdTFLbEoGKMxAvWQWQzeo0SyKeMcBYiUhWYcSW9ZsQVbmI2QgVTEPY95H1cxbhPdfo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwC5SOUYtyDQCe0RCF0xcBnrKKl6IpHNnxEzSGD48uhNTAS+WsB
	QGnP/zyMdPFhnGZ0rtDz/JdAeLLplYcxdTqwfC3cBwIy+2Bjt7RrLnmSHKVu2bw=
X-Gm-Gg: ASbGncs+WwjlXlBlM9aMV54q3soXGGvnJr4DymRqTQndMet8Vmv4zgzw0Vmh9uywZxq
	eKQ2FIpbB49E+NgZBiXZYJ2kpHRXgID2Q6d/GSdQZD/7dS3Yy4zD4fgBghZN0cSBo2a0HcEuOWE
	oNCVy1Q2+KJNekCflEC9MJggEv6R52Z4+LaZ9xYUAqRVUx9MjiaLQy4oep0zYW3JTBZdEHRZNnp
	n5va7Uzr57rXOeT58nbyIyDAtcWtPXGT0RHjwBMeTEs+IghJoIMdMqZZRmFSX1RwkK92bCQpBM0
	nqi/QNurjQGoMW23NvF9F5A5mUxEfJqR+u3TExXqYaq1t6q8rCx7ZypONZibEAqCePVD27yaAxU
	RO4djL/t/FcKdaPQQ4jUdFCs=
X-Google-Smtp-Source: AGHT+IEFrQQ8/YtODsnqpjV4NtRefMJrarn7BkrW5JrjlicGqatxKSAubw3f+uJGVSd2TJ0bQnqNgQ==
X-Received: by 2002:a17:903:1ce:b0:223:3eed:f680 with SMTP id d9443c01a7336-22c24a1440dmr72537785ad.18.1744745954611;
        Tue, 15 Apr 2025 12:39:14 -0700 (PDT)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cb5304sm121524045ad.189.2025.04.15.12.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 12:39:14 -0700 (PDT)
Date: Tue, 15 Apr 2025 12:39:11 -0700
From: Joe Damato <jdamato@fastly.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>, David Wei <dw@davidwei.uk>,
	Eric Dumazet <edumazet@google.com>,
	open list <linux-kernel@vger.kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [RFC net 0/1] Fix netdevim to correctly mark NAPI IDs
Message-ID: <Z_613wmrKRu4R-IP@LQ3V64L9R2>
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
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331163917.4204f85d@kernel.org>

On Mon, Mar 31, 2025 at 04:39:17PM -0700, Jakub Kicinski wrote:
> On Mon, 31 Mar 2025 15:32:09 -0700 Joe Damato wrote:
> > > Would it be possible / make sense to convert the test to Python
> > > and move it to drivers/net ?  
> > 
> > Hmm. We could; I think originally the busy_poller.c test was added
> > because it was requested by Paolo for IRQ suspension and netdevsim
> > was the only option that I could find that supported NAPI IDs at the
> > time.
> > 
> > busy_poller.c itself seems more like a selftests/net thing since
> > it's testing some functionality of the core networking code.
> 
> I guess in my mind busy polling is tied to having IRQ-capable device.
> Even if bulk of the logic resides in the core.
> 
> > Maybe mixing the napi_id != 0 test into busy_poller.c is the wrong
> > way to go at a higher level. Maybe there should be a test for
> > netdevsim itself that checks napi_id != 0 and that test would make
> > more sense under drivers/net vs mixing a check into busy_poller.c?
> 
> Up to you. The patch make me wonder how many other corner cases / bugs
> we may be missing in drivers. And therefore if we shouldn't flesh out
> more device-related tests. But exercising the core code makes sense
> in itself so no strong feelings.

Sorry to revive this old thread, but I have a bit of time to get
this fixed now. I have a patch for netdevsim but am trying to figure
out what the best way to write a test for this is.

Locally, I've hacked up a tools/testing/selftests/drivers/net/napi_id.py

I'm using NetDrvEpEnv, but am not sure: is there an easy way in
Python to run stuff in a network namespace? Is there an example I
can look at?

In my Python code, I was thinking that I'd call fork and have each
python process (client and server) set their network namespace
according to the NetDrvEpEnv cfg... but wasn't sure if there was a
better/easier way ?

It looks like tools/testing/selftests/net/rds/test.py uses
LoadLibrary to call setns before creating a socket.

Should I go in that direction too?
