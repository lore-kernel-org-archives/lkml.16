Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1265924C07D;
	Mon, 23 Jun 2025 13:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750683889; cv=none; b=IsJz6/ExOudZtYwdzddqFoAhuGHE/XE0/A57i95KePKGmrcE/aczuQnnTR7hHqsBVkPOGt03WPcKjqLyMLyJ0Hn8V+iJhobxxwnVVzJHSkjvGMeGs/jibsNBxd6l7auEjCfFd9W2Gq6BelsgvEPJKH9lPmjobYTWSDNbMzROugE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750683889; c=relaxed/simple;
	bh=k0Uuy0YGJg8Ax59xbM0ZKI3ySFoJ5uPrZT763I885l4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cNhDhTnq7hN6V8um9rXWWfga7sW9m9ByD3duZp2yBHreXI0ki0xDYlCFHN81I1Xs3hMEuQXP0C2mHmJ2jRlVM8ixGmJcpQTs5xJgQ0jxPsZ0fxeaCXgc51EYlvvhDNMqtfZdd8uB9vcg7Pa5bFb2f2UEjZ3Pvvj276LH040jK+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T94X3XxF; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T94X3XxF"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6fadb9a0325so35306366d6.2;
        Mon, 23 Jun 2025 06:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750683887; x=1751288687; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VXQciic3+3SLIiOMjXFgcdCYBgLFPgdbELXQs89c0e4=;
        b=T94X3XxFpemsRQeBm1Oy96A7qLnp41xSd2/x3NanmvS/UVI3f6wt+wq+jMAqJd5rIp
         qKQQeu1pZufxLEI8ML42hjJpq9nr7wOOm1t9cPxX/qYucne7fWMbLFcE1eAg0yWJF94M
         UI2Qsh5bq9tcv1vWlHV7e18nXNUP+A8nc5myNa4AoiAIWF7AFgHDbrt+AbDMcea1Xij8
         A4sNuQ8MWyWUMF6WYvfO6WhAPl9QEzQaPBDfxMBObIJJVotmPZpBdaOscO1wIfpJtrHO
         WFsbIzzV3ODD/m+iqLvhAXIVh/0Nm2ej/H0n49vKriuO0D8A8MZX/3jNgbxxGsCjdZOA
         vLyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750683887; x=1751288687;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VXQciic3+3SLIiOMjXFgcdCYBgLFPgdbELXQs89c0e4=;
        b=Qa5c6BRO/zey/uPtQirHi2bmwWigheibZOes3f/jomO2k5pr30n4wLQiKTjfnJXpY0
         BjboNlBUQ1vOTxJZW7YJO0wCFhUHdTk4Akq7TBNbR0p9k5V7Yw3r69P9hORDZExwxzDl
         iuVTu1yefdkKBT5jPRftj5RRv4FidqFdrdXjf2dZnbWVBHYjQ5cJANw0VL4N6zsD6oYh
         mQQ6b89GoA+nwHIjWR0VwCWdwNRbcRqwULFC5sFje4hJXucxeuoED/4J15UF0QoXqhx4
         fcKBdVAECKzL/AG3gGNlKEvxj5hdbnSHE+/IUVel7/oxdZnPssp4S7RGrw1yJBCOx99W
         coTA==
X-Forwarded-Encrypted: i=1; AJvYcCWxV+eS/CY2O9nGWfb4u/KSRNlOFPPw2g73F8mprsYi+5SscijCnovW5Y1kmUGKjXDypPWdqBRfZUHspBQ=@vger.kernel.org, AJvYcCXES1C6qbCgqh5I0ghK7BYCpP1BJtxoLOAu+GgwmOwWilKrvX1npEqo3YScR9XV3J+jN96tkOwLgTLcaoFaHtU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0xh260lC0FKRJugOdAngvpJTtqc58ixHm4UrbX6X04qyLUE1R
	EozIT0s+399+Or0txit/71CHVNJAZZCCZL0/hZtAuCzQxqccgqLMrA3F
X-Gm-Gg: ASbGncuCi5hnBMeBSSCV4ss6EnNR8/2IuIBK8B03synzOjxt4G5H8tlTnifFsh5c8OA
	KGjGZ3ce+YekHRSDErOHDUiN3UdVuTu1RWBJGwqQDJ9G/RFKOAZREFXZ/nIezr8zcFWMqj++ZKx
	d6plHX8ALL3ol80zc2GLgrO1o0+uc6hh3gNqdfMrKD5+4zM7aPItOneIyvmOekOJNuqkxf965Yr
	DD87dXTYkc6g7A+RDvzxXsklErdJ02Zn8kf8O6VEPKv3NyscJzD9Fw/LRMwNUIDXk5+RmRb7P9k
	lXC1AHlRxjmMTfgmBWp4b54RcmnQALgoLx7bWeLVMO+P0pxQxv+kpO6qR6IRjF816z72b2O+BXR
	Y+21FGNwcC+Q2Bu9YgS+qZOeYAPU1WO2x+6cPk8EaBDr0njidkhP6
X-Google-Smtp-Source: AGHT+IGr4IbvyIY9PvQ93ftH1eVbdlvhdxX89cthh1tb9XDWNVG2I/4fHuNpn3n9m83cVz0aXYu5Eg==
X-Received: by 2002:a05:6214:3003:b0:6fb:1db:e9e7 with SMTP id 6a1803df08f44-6fd0a477903mr188479956d6.10.1750683886557;
        Mon, 23 Jun 2025 06:04:46 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd0943308asm44537756d6.33.2025.06.23.06.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 06:04:46 -0700 (PDT)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id 60A0B1200066;
	Mon, 23 Jun 2025 09:04:45 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Mon, 23 Jun 2025 09:04:45 -0400
X-ME-Sender: <xms:7VBZaFiv5qIdkWXIiMJI-o7kW8NIcRpD7bTawT4dhh88rRHPYwMUVA>
    <xme:7VBZaKDU19rw0-HKBuMqqTLYUYaIqYbtEIZZF4i_K07f2tVI9gPwZdkc1JLY-b5GB
    dRil3Z9b7jrS9CAhQ>
X-ME-Received: <xmr:7VBZaFGgzdFF208lv6MnzkTDR1UycrQEADNwYPeJLaUSUnJiy9hGhtX7jQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddujedtlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpedtgeehleevffdujeffgedvlefghffhleekieeifeegveetjedvgeevueffieeh
    hfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsoh
    hquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedq
    udejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmh
    gvrdhnrghmvgdpnhgspghrtghpthhtohepudelpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopehlohhsshhinheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfihorhhkse
    honhhurhhoiihkrghnrdguvghvpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehv
    ghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhushhtqdhfohhrqdhlihhnuh
    igsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurgeskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomh
    dprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopegrrdhh
    ihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlihgtvghrhihhlh
    esghhoohhglhgvrdgtohhm
X-ME-Proxy: <xmx:7VBZaKR0JWDDWbNYpQESLApZ6yCtnYoFpHU3JR8Nbl9JtvbcYBAw6w>
    <xmx:7VBZaCzGMZJvW24-yrqBAz97hnQxFNPXuZmRjE1WUCu_TRDLNsQrUw>
    <xmx:7VBZaA6Fs1DlJM6NJpPFI3Y3_eTT8FnR9l_eAFjK0VNRgDsu9dIN7g>
    <xmx:7VBZaHzMf-VinKBsgUyBajzVHWkAxxqSzCpiaiApg9zbxyiTMoaHJw>
    <xmx:7VBZaKhFIpwmHGtM2QygxKB_YbP49VETzW3ciSpOY2Lsrm7IG7N2AuDu>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Jun 2025 09:04:44 -0400 (EDT)
Date: Mon, 23 Jun 2025 06:04:44 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Benno Lossin <lossin@kernel.org>
Cc: Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	ojeda@kernel.org, alex.gaynor@gmail.com, gary@garyguo.net,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	dakr@kernel.org, peterz@infradead.org, mingo@redhat.com,
	will@kernel.org, longman@redhat.com, felipe_life@live.com,
	daniel@sedlak.dev, bjorn3_gh@protonmail.com
Subject: Re: [PATCH v5 2/3] implement ww_mutex abstraction for the Rust tree
Message-ID: <aFlQ7K_mYYbrG8Cl@Mac.home>
References: <20250621184454.8354-1-work@onurozkan.dev>
 <20250621184454.8354-3-work@onurozkan.dev>
 <DASY7BECFRCT.332X5ZHZMV2W@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DASY7BECFRCT.332X5ZHZMV2W@kernel.org>

On Sun, Jun 22, 2025 at 11:18:24AM +0200, Benno Lossin wrote:
> On Sat Jun 21, 2025 at 8:44 PM CEST, Onur Özkan wrote:
> > Adds Rust bindings for the kernel's `ww_mutex` infrastructure to enable
> > deadlock-free acquisition of multiple related locks.
> >
> > The patch abstracts `ww_mutex.h` header and wraps the existing
> > C `ww_mutex` with three main types:
> >     - `WwClass` for grouping related mutexes
> >     - `WwAcquireCtx` for tracking lock acquisition context
> >     - `WwMutex<T>` for the actual lock
> 
> Going to repeat my question from the previous version:
> 
>     I don't know the design of `struct ww_mutex`, but from the code below I
>     gathered that it has some special error return values that signify that
>     one should release other locks.
>     
>     Did anyone think about making a more Rusty API that would allow one to
>     try to lock multiple mutexes at the same time (in a specified order) and
>     if it fails, it would do the resetting automatically?

But the order may not be known ahead of time, for example say you have
a few:

    pub struct Foo {
        other: Arc<WwMutex<Foo>>,
	data: i32,
    }

you need to get the lock of the current object in order to know what's
the next object to lock.

> 
> I'm not familiar with ww_mutex, so I can't tell if there is something
> good that we could do.
> 

It's not a bad idea when it can apply, but we still need to support the
case where the order is unknown.

Regards,
Boqun
