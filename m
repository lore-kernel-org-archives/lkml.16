Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFAF1A317A
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 22:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747867411; cv=none; b=WP2RN94EV4faRenKAj1MiuNrbldXuAaZpEr0zlVSvVbdAIkc9INrBbUYd64bSHybxTXlmtZ2oWmc0h+oBaDtrlVOMySVKhcPGk6fNrcM7bNYMSdxS60FoB7fcD4zNRd4cG3Opo9uebv3l8ErehKyfeAuu5kths5ZK7qdjsEoLpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747867411; c=relaxed/simple;
	bh=M3MwW10C7iHnI0iGVJSQ9xDpsJXm4WK5YAKdXSnMYA4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TMmoF7OfsUN2f190f07crYyuV7aPtHOzQwlfDp1b80aTdz6Mm20NclYptdIlB81RnxBgDiN4eWwYXTRIRVQz4znM4VZoFzHEFgMGp/C4WOB68N74aQB1T3/ao1XLpd5NPengRXVcCs5dg3/VT3KC0PQ4sm7bikRpXcqmIZ3OIPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jxMO7Jri; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jxMO7Jri"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-442e0e6eb84so45826345e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 15:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747867408; x=1748472208; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JdvA6/iFOHXY7kTvuRXD0guNCBcjbw8VopI9P5chg0A=;
        b=jxMO7JriFLjrXYPrTnFBwG2gw7IyMkQ05JFv1PeQSVr1JH+ysDIfOBzdElAqTjE9Ca
         etaheUTMN7vlKV6CJmDVr7sdl4xVVtmmVdELCp0DFfVvAA+ysq4c268L7PrXr5zm9J8J
         C9x5vGYFZi3NCc6zWH+Cfrf4i1Cl+4Aw9Ph2NE0WLSs1LIyED/IClwVCMnlV1bEO7hDg
         7ZwkjkzFjqUwVqK+ivNgiM1hyO9QTJzLk1PkjAqW0AenIl3ETTOwdvAgCfHZ4BONWxH0
         s5gzOha/sbgwq6HGrwfiwXri90kxOc0KPuNz9C8qTvCT5NJHL+IsaWK81CWDSt/UjCZ2
         /UYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747867408; x=1748472208;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JdvA6/iFOHXY7kTvuRXD0guNCBcjbw8VopI9P5chg0A=;
        b=j1fbO3QymAEpws3NkLjN0E5+J/bAutIuSEOB0l41luOMJOc6xwqAqmsR3s01+nkw1Q
         9w5J5Rc8rJYTliP4qK0Ql8nR3uCOK8hX1GKmIvPi3QhHmB9QbUYvvCyNd4L3p0PUdKCx
         sg+J/9JZmlVTsqG0wh0S6N0+qv30DQ0IFzjwma6A6QH4mWlJ95xtHKAfNn7IfQ737L4u
         uLyMZXgREVI+nUtUlbYdICgLf+rzxPYSOwWC8PxLVYFEnvwwgG1MF1xOfpv65VH90Lqy
         DfuGCuXoQVrr9bwq+WzxwGf1QQ7vOPPTWpGlWUH7Kba43ItLIbFD2NwY9xm0V30shLd3
         OtBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxYhOAJWDu1b5IWe1FrHX9KgN2d7CilkOW0RvyxoJlSueXbnE40PdQ01AG1N6z/pFv64fbzMne2UfUvlQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs5ouzNIhS5+xA8Hn86uTglAgbKNPGhkOan14mq7m8RmgFsLrV
	8jIF6YWSwBRC+1YmgQHTnWilR7Mh2gHsiuh5ToZJiQsVwkT/iPAZlbBUT6sfCZ5VBNRW3ahBmU9
	COdqz+2ximTwcihsNyg==
X-Google-Smtp-Source: AGHT+IGJXhof4rGMtvIQ/yPAbZd1auWh7dZUvrMeDBq7Ne/qbhE9Aj5HoGt2IRQu1o4F8+X8noP5RlB1IKb47W4=
X-Received: from wmbhj10.prod.google.com ([2002:a05:600c:528a:b0:43d:5828:13ee])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4ec6:b0:442:e147:bea6 with SMTP id 5b1f17b1804b1-442fd950bd4mr218071385e9.11.1747867408117;
 Wed, 21 May 2025 15:43:28 -0700 (PDT)
Date: Wed, 21 May 2025 22:43:26 +0000
In-Reply-To: <aC2HacSU7j5d9bzu@pollux>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250505-debugfs-rust-v5-0-3e93ce7bb76e@google.com>
 <20250505-debugfs-rust-v5-4-3e93ce7bb76e@google.com> <D9VPA1M45WBK.1TB4KOUXD24BD@kernel.org>
 <aCRdNJ2oq-REBotd@pollux> <CAGSQo0204_Dz65G33pAN3_iY=ejPXJRdAiB4ioM-nvMkAh0YXQ@mail.gmail.com>
 <D9WM0BP5446N.1NVNDCZ4Y2QN1@kernel.org> <2025051524-festival-afterglow-8483@gregkh>
 <aCzzBT96ktapP03e@google.com> <aC2HacSU7j5d9bzu@pollux>
Message-ID: <aC5XDi7SaDJeUaAC@google.com>
Subject: Re: [PATCH v5 4/4] rust: samples: Add debugfs sample
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benno Lossin <lossin@kernel.org>, 
	Matthew Maurer <mmaurer@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, May 21, 2025 at 09:57:29AM +0200, Danilo Krummrich wrote:
> On Tue, May 20, 2025 at 09:24:21PM +0000, Alice Ryhl wrote:
> > On Thu, May 15, 2025 at 01:43:09PM +0200, Greg Kroah-Hartman wrote:
> > > On Thu, May 15, 2025 at 10:59:44AM +0200, Benno Lossin wrote:
> > > > Is there no refcount that we can use instead of borrowing? I guess not,
> > > > since one can call `debugfs_remove`. What about a refcount on the rust
> > > > side? or is debugfs not used for "debugging" and needs to have the
> > > > performance of no refcount?
> > > 
> > > debugfs should never have any performance issues (i.e. you don't use it
> > > for performant things.)
> > > 
> > > So refcount away!  That should never be an issue.
> > 
> > What I imagine would be the ideal API for Rust is the following:
> > 
> > * For each file / dir you create, you get a Rust object that owns it.
> > 
> > * When you destroy one of these Rust objects, it disappears from the
> >   file system. I.e., dropping a directory removes things recursively.
> > 
> > * If you remove a directory before the removing objects inside it, then
> >   the Rust objects become "ghost" objects that are still usable, but not
> >   visible in the file system anywhere. I.e. calling methods on them
> >   succeed but are no-ops.
> 
> If we would want to keep an entry alive as long as there are more leaves, we'd
> obviously need to reference count things.
> 
> But what do we need reference counting for with this logic? Shouldn't this be
> also possible without?

Well, my understanding is that when you remove the parent directory, the
dentries for child directories and files are freed, so trying to use the
Rust objects that correspond to those child dentries would be a UAF. I
want to refcount those child entries so that they at least remain valid
memory even if they're no longer visible in the file system.

> > * Possibly we have a way to drop a Rust object without removing it from
> >   the file system. In this case, it can never be accessed from Rust
> >   again, and the only way to remove it is to drop its parent directory.
> 
> I'm not sure about this one.
> 
> IIUC, this basically brings back the "keep() logic", which I still think is a
> footgun and should be avoided.
> 
> Also, we only needed this, since due to the borrowing design we couldn't store
> parent and child nodes in the same structure. With reference counting (or the
> logic above) this goes away.
> 
> I wrote the following in a previous conversation [1].
> 
> --
> 
> What I see more likely to happen is a situation where the "root" directory
> (almost) lives forever, and hence subsequent calls, such as
> 
> 	root.subdir("foo").keep()
> 
> effectively are leaks.
> 
> One specific example for that would be usb_debug_root, which is created in the
> module scope of usb-common and is used by USB host / gadget / phy drivers.
> 
> The same is true for other cases where the debugfs "root" is created in the
> module scope, but subsequent entries are created by driver instances. If a
> driver would use keep() in such a case, we'd effectively leak memory everytime a
> device is unplugged (or unbound in general).

Where is the leak? If the file is still visible in the file system, then
it's not a leak to still have the memory. If the file got removed by
removing its parent, then my intent is that this should free the memory
of the child object.

Alice
