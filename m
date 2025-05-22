Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D45D189F57
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 17:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747935649; cv=none; b=c97qjdAKc7d/VQDDO/JCF4w5mYGL4N78rtOTfpWiobyQcX6OOVnF38g/lEd4m9bSs3H2jRm+o3ZR22eFvfaCaf+KBSYCbf8rNrriFkZnJnZFn1a76qIJgXz9J/CSksCDi7xEwi9V9zssm7HNyRrlMUGvs8YESNXORXuk8tL7Rok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747935649; c=relaxed/simple;
	bh=2q+nvK98glNS1OrImQ40LpGSURdNbFHXEYA7zULYzG4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uo5AB/KqNmIPoiW/WNap5q3w68bDBvIfZdrcxl2Ku+l5hRtkThK9u5n3uRjQp2QYC8hQunjbG9KqjJ1Vb6rUkyfSVI/a+QOFuohQwQSGEj7WqhKiInWh+TMGr6RlnIUgF9R7uT/8VY11iRxuVELESLbN1ajZzpU5nRyM3nDYNFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YbkBSbb1; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YbkBSbb1"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43cf172ffe1so61804135e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 10:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747935645; x=1748540445; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RztcMjTLHfY23vLuGORKKnjudgJGslj+PjsonErxbkQ=;
        b=YbkBSbb1mEzi6aqU6gllICn+Fyw9MC9XtTaannSOalUilo+1B3IppTq4AsXtAN5BrP
         bL5aaJJn1eWVQA/cRTBq2FQ5ngJ82ySUyrd/2QsR0Ubs7dEl3drmsdcy7evEK4ojMr1N
         LPCu5B9Gj0DlW4hCXRv1a0QDurNAWnD6sk9NTSNQTMEFAkJ+rFkASow85obMwoQgvINS
         sKgwpzLfoMroztM5h0bCiFzzlMY4TyDGKJGAv+33UlRwNUz3xQcBen1w7bfXPici2exb
         SsNaAIZXS71cyJ/uALvODrgkr+wwFDM18MHe19dVxM1zckcNPuyeq66QtXrd1vo3viA2
         bTWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747935645; x=1748540445;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RztcMjTLHfY23vLuGORKKnjudgJGslj+PjsonErxbkQ=;
        b=GRpp06WiKsE3xpsUt3oJSBokeSbohjAgtIrTbIXRodXWnGZ4mz9x6FqyWNqggYkjGE
         GDXe3SBSNBjzJ1L/z2t8VVBYlJo4SunwZXq99zWXJzDSRsmjf7oxvLrb1d6kwtVdE9r2
         RTA3nPuiYMPSkvgqtvt4k+hP4sB3GEES5d/rMXbfm2BPT5zVogQp47DuEznKRn3CIQO9
         MP1jaGKfd1eK+1NuaFoVyJpnRQsEYK+/u/R13ieiSbc6ppvTc/7jYy3XWRUlj0pBQ+PM
         /y/QnqEb870CyCADB/9eXtdvhIxa3Akk/yKFh+fDAauqkcoTDgKz7LaZG9lk8Zb5h2eZ
         6TQw==
X-Forwarded-Encrypted: i=1; AJvYcCU/3knXWBKeJciulVhxf+z0s6moclVcdGd7FgXFDpXWAVP9BJinY9sYWIXLeyj+ChmwXrZlQpe3APO6gu8=@vger.kernel.org
X-Gm-Message-State: AOJu0YycY8hJqjPcQxwLuuXYWbChpTxR/cSuNXaDKHlZpr9+zWfJo9L8
	pSNJ24X60kOpl51GP8TIAuWfeI/szeMTLI4FpyV6/RCwAtXUs+OIW/9xMhB4zXbwSW5aFtbkGKc
	aBI8cGo+o7taxsIdfYA==
X-Google-Smtp-Source: AGHT+IF9OwV6oxhkvb6hFcvf8W+yXowqsFL3Y+t3gINXRCXBioOEg1RYheJvI1SMPeCdKIHlD7kguFPVoKDHOUE=
X-Received: from wmbhj14.prod.google.com ([2002:a05:600c:528e:b0:442:f9ef:e460])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:37cf:b0:442:f485:6fa4 with SMTP id 5b1f17b1804b1-442ff03c45amr286843375e9.31.1747935645775;
 Thu, 22 May 2025 10:40:45 -0700 (PDT)
Date: Thu, 22 May 2025 17:40:43 +0000
In-Reply-To: <2025052201-return-reprogram-add9@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <aCRdNJ2oq-REBotd@pollux> <CAGSQo0204_Dz65G33pAN3_iY=ejPXJRdAiB4ioM-nvMkAh0YXQ@mail.gmail.com>
 <D9WM0BP5446N.1NVNDCZ4Y2QN1@kernel.org> <2025051524-festival-afterglow-8483@gregkh>
 <aCzzBT96ktapP03e@google.com> <aC2HacSU7j5d9bzu@pollux> <aC5XDi7SaDJeUaAC@google.com>
 <aC7DVewqqWIKetmk@pollux> <aC8uNmrLUSS8sxHU@google.com> <2025052201-return-reprogram-add9@gregkh>
Message-ID: <aC9hm9D458C6LsRW@google.com>
Subject: Re: [PATCH v5 4/4] rust: samples: Add debugfs sample
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Matthew Maurer <mmaurer@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, May 22, 2025 at 04:15:46PM +0200, Greg Kroah-Hartman wrote:
> > > Well, take the case I described above, where the debugfs "root" is created in
> > > the module scope, but subsequent entries are created by driver instances. If a
> > > driver would use keep() in such a case, we'd effectively the file / directory
> > > (and subsequently also the corresponding memory) everytime a device is unplugged
> > > (or unbound in general)."
> > > 
> > > If the module is built-in the directory from the module scope is *never*
> > > removed, but the entries the driver e.g. creates in probe() for a particular
> > > device with keep() will pile up endlessly, especially for hot-pluggable devices.
> > > 
> > > (It's getting even worse when there's data bound to such a leaked file, that
> > > might even contain a vtable that is entered from any of the fops of the file.)
> > > 
> > > That'd be clearly a bug, but for the driver author calling keep() seems like a
> > > valid thing to do -- to me that's clearly a built-in footgun.
> > 
> > I mean, for cases such as this, I could imagine that you use `keep()` on
> > the files stored inside of the driver directory, but don't use it on the
> > directory. That way, you only have to keep a single reference to an
> > entire directory around, which may be more convenient.
> 
> No, sorry, but debugfs files are "create and forget" type of things.
> The caller has NO reference back to the file at all in the C version,
> let's not add that functionality back to the rust side after I spent a
> long time removing it from the C code :)
> 
> If you really want to delete a debugfs file that you have created in the
> past, then look it up and delete it with the call that is present for
> that.
> 
> The only thing I think that might be worth "keeping" in some form, as an
> object reference as discussed, is a debugfs directory.

That could work if we don't have any Rust value for files at all. The
problem is that if we do have such values, then code like this:

let my_file = dir.create_file("my_file_name");
dir.delete_file("my_file_name");
my_file.do_something();

would be a UAF on the last line. We have to design the Rust API to avoid
such UAF, which is why I suggested the ghost objects; the delete_file()
call leaves my_file in a valid but useless state. And as a ghost object,
the .do_something() call becomes a no-op since the file is now missing
from the filesystem.

Alice
