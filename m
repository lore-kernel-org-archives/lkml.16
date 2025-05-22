Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6F812E7E
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 14:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747922491; cv=none; b=TXpjuftIZLJjY17FU4tfsQ/rMTsR1JMU+545rq1ODF18vn4gW50xLi4lbtd/kIX3ELoupkzd8oqQf48npneOvxC5KCcDXpB6yyuBxiag0XW1U6paCyPHcSa2NqS0g/dU7GfDwV2YW7FWWqhlOa6CPQwDv0901PjZy7+z9qo9vwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747922491; c=relaxed/simple;
	bh=cCWawGlAi5EtcYvzNkZAwjsiQ+dNfkFRLkupLUUHfQg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Fgt1hNNFQt7xGIqYznbbZXYAXmziyLTuJYXz3Gp8BjQX3r63Qna/K7UOhz/PHFeWig1j7CxkyJBkAHNUbmBlLXuBddaHRwOuRXlBAYV2CAg0R4fPk1kcwHjg51FX40fUp2UjTcgYCq2VxfoGEd1BfayI/lt3p82N+xylH2rYAfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i3tXZ2R4; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i3tXZ2R4"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43d007b2c79so60781695e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 07:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747922488; x=1748527288; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=B5cC6E2WomPxiNcD5teHZW1dRsw1h86IYWuFIwHpyWc=;
        b=i3tXZ2R4xmbogWhaST2zyvHAQAgtdkej1wQlqH4Z92RhnG/Km+kgMPq3riXPDLbkOs
         tI+MdYoFL1Zl5UONiJqcqc9lI52/wFqLD2lUWDoC01HaLIxfkaGIOXDriYZzvc3h1JPl
         vKwsBpfDijLj5gqfMHaeXh+Ep5BSVJNuT6a4bRer2+IpTT5TV1u0ciDsZobLTm2UmQl6
         Bb3CJwKqqi/yHBboGiUtgPC9HJDDQKcP79ojSW9+EoGrE2h1WgPn/9BTZE/b+G0oDMsK
         SkTrha/xGlVpduweJqlbf5gn8NbP3X2Xl8S3DT8dmKFmspS9/Yh9RQrKh5cduBhE0X7J
         08Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747922488; x=1748527288;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B5cC6E2WomPxiNcD5teHZW1dRsw1h86IYWuFIwHpyWc=;
        b=GWJSEIh9gvH5gJyZb0VJbfkvcIds7h1qBxBo5arlpdgil6/x2u+0aCwJb5SxfEST6W
         j4yGjown66X7KmMUI1rircRG8B2qhrshk6s/FVngrDGToa6MDscuXbMiSpVw2dTcfLRs
         IMY6XVMbwdpXDPnVkLuykzTCq1uDmCkfTFBnSG1+6OK5ZrWnhPnQDMb9mvrynUJKMNyy
         sDcBCgaWZGkna7m9sMZrMju+VED5BFKG5S6LnJwasevWzq1nyTEziRvy/5/m6YwH82GQ
         u2+pCnjNNQeJBr6XIQEvhJIIuhW4zXxGKeQ2uXwlmOli531vQDa9xlufKuyYDX+JlxCE
         cEnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlXtW9SNh8X915tRFg76wv+aCZPn6RnvqvuqgAS9etCfdeebC3br6G/QIBtZPrDmwxvHKzZ4ObV40p5zs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4sDxGAIq5WKLWcPsDAyebx9dqR4d1V3v6lAG5OzkB3kZ3tIIt
	6TnOhgzHM6+p8ZFoFxrHGsvW88XPck6hOGKnUu/NL631P+x1EdO01oxhO6cRJGEt+nObGEbNqPc
	vEiHjGeg9R1E63Vr4Lg==
X-Google-Smtp-Source: AGHT+IHXp07QVhjl+t3lNrZ1dIZAODtIlQUgQhsn4x8db8r4PIqRl2H9njnvwDbHjr+d09nNweYztlMrIdTzR74=
X-Received: from wmbes12.prod.google.com ([2002:a05:600c:810c:b0:44a:bfe9:5b4])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8215:b0:441:b5cb:4f94 with SMTP id 5b1f17b1804b1-442fd606ba6mr236732175e9.5.1747922487933;
 Thu, 22 May 2025 07:01:27 -0700 (PDT)
Date: Thu, 22 May 2025 14:01:26 +0000
In-Reply-To: <aC7DVewqqWIKetmk@pollux>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250505-debugfs-rust-v5-4-3e93ce7bb76e@google.com>
 <D9VPA1M45WBK.1TB4KOUXD24BD@kernel.org> <aCRdNJ2oq-REBotd@pollux>
 <CAGSQo0204_Dz65G33pAN3_iY=ejPXJRdAiB4ioM-nvMkAh0YXQ@mail.gmail.com>
 <D9WM0BP5446N.1NVNDCZ4Y2QN1@kernel.org> <2025051524-festival-afterglow-8483@gregkh>
 <aCzzBT96ktapP03e@google.com> <aC2HacSU7j5d9bzu@pollux> <aC5XDi7SaDJeUaAC@google.com>
 <aC7DVewqqWIKetmk@pollux>
Message-ID: <aC8uNmrLUSS8sxHU@google.com>
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

On Thu, May 22, 2025 at 08:25:25AM +0200, Danilo Krummrich wrote:
> On Wed, May 21, 2025 at 10:43:26PM +0000, Alice Ryhl wrote:
> > > > * Possibly we have a way to drop a Rust object without removing it from
> > > >   the file system. In this case, it can never be accessed from Rust
> > > >   again, and the only way to remove it is to drop its parent directory.
> > > 
> > > I'm not sure about this one.
> > > 
> > > IIUC, this basically brings back the "keep() logic", which I still think is a
> > > footgun and should be avoided.
> > > 
> > > Also, we only needed this, since due to the borrowing design we couldn't store
> > > parent and child nodes in the same structure. With reference counting (or the
> > > logic above) this goes away.
> > > 
> > > I wrote the following in a previous conversation [1].
> > > 
> > > --
> > > 
> > > What I see more likely to happen is a situation where the "root" directory
> > > (almost) lives forever, and hence subsequent calls, such as
> > > 
> > > 	root.subdir("foo").keep()
> > > 
> > > effectively are leaks.
> > > 
> > > One specific example for that would be usb_debug_root, which is created in the
> > > module scope of usb-common and is used by USB host / gadget / phy drivers.
> > > 
> > > The same is true for other cases where the debugfs "root" is created in the
> > > module scope, but subsequent entries are created by driver instances. If a
> > > driver would use keep() in such a case, we'd effectively leak memory everytime a
> > > device is unplugged (or unbound in general).
> > 
> > Where is the leak? If the file is still visible in the file system, then
> > it's not a leak to still have the memory. If the file got removed by
> > removing its parent, then my intent is that this should free the memory
> > of the child object.
> 
> Well, take the case I described above, where the debugfs "root" is created in
> the module scope, but subsequent entries are created by driver instances. If a
> driver would use keep() in such a case, we'd effectively the file / directory
> (and subsequently also the corresponding memory) everytime a device is unplugged
> (or unbound in general)."
> 
> If the module is built-in the directory from the module scope is *never*
> removed, but the entries the driver e.g. creates in probe() for a particular
> device with keep() will pile up endlessly, especially for hot-pluggable devices.
> 
> (It's getting even worse when there's data bound to such a leaked file, that
> might even contain a vtable that is entered from any of the fops of the file.)
> 
> That'd be clearly a bug, but for the driver author calling keep() seems like a
> valid thing to do -- to me that's clearly a built-in footgun.

I mean, for cases such as this, I could imagine that you use `keep()` on
the files stored inside of the driver directory, but don't use it on the
directory. That way, you only have to keep a single reference to an
entire directory around, which may be more convenient.

But I also see your point. I don't think keep() is a critical part of
what I think the approach should be.

Alice
