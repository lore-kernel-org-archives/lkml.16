Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BCE136E37;
	Wed,  2 Apr 2025 15:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743606067; cv=none; b=BTc72Uq/yQ9yP/Ksfi6EASVpeQ1swvH3dTV+10rVGUAsdK67RpwSXjG6WGnHp+cFSWZbvxDai2YxVFdCTafzSfSfJYPPELoU+0ts4KEdqbXNQa2WLY90y/De7AcKwiE62SJGcnRRegLTntmWDbZDeznnwBxxUB8N4vvAWQX0Ci4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743606067; c=relaxed/simple;
	bh=HWaiGYuV0VEOmcJE20/AGfW9FnIR1dtXvQ2Bjv/00rk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hbmaXk631tRUs3qnaPuHwW5S6RdhN6YPAeuCJGuTUgij5jhh89eMQTa/Lm2V5wYC59uaSDfJkqnH9RvTdmlxWJXuL0L1RhFYOSRIlB5VZWP9ieQNUJU62NHL5EB3rf7b8G9WwBPX5OPfaeiNMJpwg+5JHNhXmmHGkffKIFw2aGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pbmacwc9; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pbmacwc9"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-227d6b530d8so122186145ad.3;
        Wed, 02 Apr 2025 08:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743606065; x=1744210865; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EUiH0FYCKYkr+LcT4ygOAPJY5Rbbt4eomVzmffJpVeA=;
        b=Pbmacwc9Xk+XAoIEVg3aMdLmEL5y2TfPLxfGL5BFmHV7oq3UfCLEYREj7iLW25bYYK
         EkrcK1cZAmksQHf7UGuYJWF8/qXhJUAcQsILdfcodXs9ZCRr2lQwbpWztnVzIs05ymNJ
         5VBl1Eu5M26c5FwvW1arhk4BeWm+yhSBfaY7tHdappx+XyfkCuANHJIypgRvaMWaetRb
         Qr8kGf0ImbE4MzVUMLIQYKOCqFbSefnTAmCElYofYwAGaGAzdmryPcEzxRShbIpoevVk
         VY/JFzhm0qzrk7PKrbSJwXrWhv98OFls7PlLdVGKscJe5qrWn81Bp+E7oCDTuQvRnsYt
         wEQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743606065; x=1744210865;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EUiH0FYCKYkr+LcT4ygOAPJY5Rbbt4eomVzmffJpVeA=;
        b=gkSTvECkrDbnr4ebposmIIIzY2G2ztKsjQPfMt7RejgwF5DKJvySvjALNxj9XskU9E
         M3sz5Z5WzL0eXnmxnjWBL+FVJ5ekmNR1OndkBA57/+OhrFwdoLOdA4iuqNJDT3c9R2J4
         7f6S0hcN0/YEKfQ+Sqf7lUUuDlV9NtpfuXRSsdXgeSr9XzzjxDKGcr9iAhH4h5DYSFek
         IBxX2Q2zfGu9HoZE0WvntBg5uTSMdyxVvG5v1dpDO+JU1OCyWX03r2Mbts6f5in7N+s0
         p3MqMvBQJLe7s9y8TE/k4zvz83fqNOg2XMzWQgXIUrtbK96aOnRgGegSTvxdU1gmAq3X
         9D9A==
X-Forwarded-Encrypted: i=1; AJvYcCUBzp97V12a8sF46JLZJUhwQ0kzUeZ5z9NtxI5OQk7Z+8YsZR+8GevlMGgY7AN9CPQjYGyDhsMtD1p+nS0=@vger.kernel.org, AJvYcCWjYOzG+uuBlUeqFkgVUMAr6QizR8lWPwpU+P5toTkftv5FUvw+s4f8QGiXUJC2bjK13MeAbxfYtcnFrlWOc0U=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywus9UX88ke8s9dDiHaPWiIplyBQIGL1Qx+IcOC/ThIMmCKt9Ek
	H3GpPQHj8Yt5sM1A+bJ2X6ZvoROEfLj+8ajdBaCJv2os6ynh5Z3+
X-Gm-Gg: ASbGncu9j3i00UUtpyEuQFf7ZRrbzvgXl8q/IXHHZjahQ/UisZBP8pttpQ3g44M3doS
	nDdIPpZj3yJv+MvWjqsOp90lyKnXUwEpIiVZu4+LnqkO7Xt71252Zi+p1uqnfOEbvqx1Kt760bT
	1aqFWxDDdSLoeSCYLALGwmGqvAX4TjbW0mbK1P0yyzg6LN5pSraJg6PyvBUJqPUyaTjhkYmwHwV
	zvrGC6fQbwB+YWqRqZ3J9vzbZ5iwdz6WY/KHAWN7fn5OYD9FO0H1J1NGFKu/yOZvkfXfPOwP7+e
	Mnq3YR3OTgpTDrgEHu+FT/hOQYCxu76zjijo1/W+5zdg
X-Google-Smtp-Source: AGHT+IEZvG1NHT8sw/7Vm1ozDKIXwtfdO89dYij0WaV8MAn+FqQaycdaWRy2qM91FDW7m7+MMZbGQg==
X-Received: by 2002:a17:902:cec3:b0:223:2630:6b82 with SMTP id d9443c01a7336-2295be30cd6mr113199135ad.10.1743606064603;
        Wed, 02 Apr 2025 08:01:04 -0700 (PDT)
Received: from localhost ([216.228.125.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1dece6sm109409055ad.192.2025.04.02.08.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 08:01:03 -0700 (PDT)
Date: Wed, 2 Apr 2025 11:01:01 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@redhat.com>,
	rust-for-linux@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Burak Emir <bqe@google.com>
Subject: Re: [PATCH V4 2/2] MAINTAINERS: Add entry for Rust bitmap API
Message-ID: <Z-1RLYyTE7pxAyzk@thinkpad>
References: <cover.1743572195.git.viresh.kumar@linaro.org>
 <bf2d798034e5f2c6fd5fbc561a8bd19431e6a9cb.1743572195.git.viresh.kumar@linaro.org>
 <CANiq72nzrjh6S2bh0GQOKtjFqMcDzrBbtSVhaL-i1kja1zW3HA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72nzrjh6S2bh0GQOKtjFqMcDzrBbtSVhaL-i1kja1zW3HA@mail.gmail.com>

On Wed, Apr 02, 2025 at 01:39:22PM +0200, Miguel Ojeda wrote:
> On Wed, Apr 2, 2025 at 7:38 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > Update the MAINTAINERS file to include the Rust abstractions for bitmap
> > API.
> >
> > Yury has indicated that he does not wish to maintain the Rust code but
> > would like to be listed as a reviewer.
> 
> Will patches go through the BITMAP API tree, then? i.e. you will
> maintain it by sending patches to Yury's tree, right? That is great,
> just wanted to confirm after all the discussions if I missed anything.

I didn't plan to, but I can move the bindings if you find it
reasonable.

> (By the way, the BITMAP API entry does not seem to have a `T:` field
> -- from a quick look at the latest pull, is it
> https://github.com/norov/linux?)

Yes, it is. I'll add the 'T' section. 
