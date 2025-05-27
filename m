Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC9A255F39
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 11:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748345888; cv=none; b=qMEcSe9g7fmX9PXHX7Y33dcEH7ksQTjPZ7xph3iXxi+47mTDDVVUtdah7beQVDXNhQF+o1aDBIMQHMwOgDNpD14HSnr/OQGzRwWJvXpS69XjW3I4xZhOL2BxNc4vSlzqi54TkSPyLZW21AmGMv6NEZrYXcb/zCPfAfwxi534Obo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748345888; c=relaxed/simple;
	bh=I3iOwzn3pRnf0t+FYscW0taXwZ88KDJXhfGZXShT2mg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=G8424gNLf8MN3CsmEo1GU/t0syg3EfSEtnAISrWiFqBnZztGWwoPx2K7RLS0rjvEaahxAH0ZCdZXpWDjQRvgsy0zuKD2jm4sdLF4y+GMuGoyM+dHVGBy4HvunNBdu/+q39cStcd5+4NZRF+VHmLPgJLtfFS98mD7QA5ZJbqmTC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eItmrW7a; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eItmrW7a"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43cec217977so18284755e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 04:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748345885; x=1748950685; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=K9ZFM1owHLSyIXqYqClroD9dE+A4zjVv7me0IORJZ8c=;
        b=eItmrW7aznVxoWYyhG7NS95z45GopOgoHWc4cGXOIcA+HNWOpZXcQhOXa87GpOhUqT
         ldMBxo/mGFYkAptgnJAbsDqM/qhIfvK2M4/0rYerSDwokLXzitV/MXEvLihGOnAOl76J
         mVmqNRuYYzqlJi4ksAupav820SRBxv7O9P0PTVcvK7IvzVBN0gDzzKcbQ7yyDVcF9Pjs
         4j+fOnluVzYUkW03G+qNZDqZvYkwnzi4PK1U7Vsx/kejLZcYHE3HZUBQ5XqX2Xr+qBLS
         mtedxWX36RGBHyJpgoAvUDmplnBDkFekN5TU9p9gsb3NsLEJti96agGeBbA1FOKtGuxM
         zh7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748345885; x=1748950685;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K9ZFM1owHLSyIXqYqClroD9dE+A4zjVv7me0IORJZ8c=;
        b=Gg+ZRLD0BEZo3+9sZGyJFsGOqP3bhmQ3PEetfYHA/P3uYCsE3gEaVbWbTMvi8HBV+l
         wVCjhDMNf1d4YdRAr0aLZzWuaZ6QdJCE4WISUGkxY29k/eNqga/v6kGNZ4+ZouoJcs8g
         C0qW+g82VrySNnEsFGlT8aNXXyE+gUlyfc9b830LTye7dv6Xmp+Ps00BYbzyv+bW9B0I
         EeYarxXke9t31UhFK3pHMpGdfI0C5X1EEeAKRONu6yqVg34S7ntonctN23tdpgihaRin
         rkxDKK09BRwTj/U72IVZkgPKoOyLzP8D+fv2Fnl5NLNCOkVXpht9M6/Nm9t/632ofRaH
         ogrw==
X-Forwarded-Encrypted: i=1; AJvYcCUO36xTJA+IlnXJe3oLix+nwUnVZHEZhQZA/z7z/Rqn9A0s/XsZg5uDZ2wVOdEMZf07w9mQ+lsp9M3E83c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzToxlEg7WyygxrMrIeCgalLF2EwlC4TSTNpysk1g/hN2MuPooC
	eLAeGJMKW5WT2DTeL4czZI9aD2DqB/uXEo0ZAzMIC27oLhuNM15gM0X6Gze1CDOpe5FVG/gnuUP
	pSlTVHMVGP+738xiWFg==
X-Google-Smtp-Source: AGHT+IFpvNOJ2/KXvQ51DYsYVifopBo7XSSIRwWdPrGINFoCrwsjAPVGbc7ZNuv/iQlzTsaZGh/BpZGdQzlBGKE=
X-Received: from wmbjg20.prod.google.com ([2002:a05:600c:a014:b0:43c:ef7b:ffac])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:444f:b0:440:9b1a:cd78 with SMTP id 5b1f17b1804b1-44c935dca8emr145499115e9.10.1748345885099;
 Tue, 27 May 2025 04:38:05 -0700 (PDT)
Date: Tue, 27 May 2025 11:38:02 +0000
In-Reply-To: <aDG6t-HdZSuWyPGo@pollux.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <aC2HacSU7j5d9bzu@pollux> <aC5XDi7SaDJeUaAC@google.com>
 <aC7DVewqqWIKetmk@pollux> <aC8uNmrLUSS8sxHU@google.com> <2025052201-return-reprogram-add9@gregkh>
 <aC9krUYJmJqu0xVR@cassiopeiae> <2025052330-reverence-slideshow-d498@gregkh>
 <aDBC__rflS8625Vb@cassiopeiae> <aDCrufEjtJeGjO6z@google.com> <aDG6t-HdZSuWyPGo@pollux.localdomain>
Message-ID: <aDWkGmcUBVHl7QmM@google.com>
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

On Sat, May 24, 2025 at 02:25:27PM +0200, Danilo Krummrich wrote:
> On Fri, May 23, 2025 at 05:09:13PM +0000, Alice Ryhl wrote:
> > On Fri, May 23, 2025 at 11:42:23AM +0200, Danilo Krummrich wrote:
> > > The only thing I don't want to is to allow to leak files or directories, i.e.
> > > 
> > > 	File::new("bar_file", bar_dir).leak()
> > > 
> > > which keeps the file in the filesystem, but takes away the handle from the Rust
> > > side, such that it won't be removed from the filesystem anymore when the handle
> > > goes out of scope, which can cause nasty bugs. But I think there isn't any
> > > benefit to allow this anyways and it isn't needed with reference counting.
> > 
> > Why not have leak() for files only? That way, the files still go away
> > when you drop the directory, and you don't have to keep around a bunch
> > of File objects in your Rust structs.
> 
> In a previous mail I said that there are more reasons why we don't want to have
> files (or directories) in the filesystem without an object representation in
> Rust.
> 
> One of them is when attaching private data to a file, like we do with
> debugfs_create_file().
> 
> When we do this, in most of the cases we want to share data between a driver
> structure and the debugfs file (e.g. a GPU's VM to dump the virtual address
> space layout).
> 
> And most likely we do this by passing an Arc<T> to dir.file(), to make the file
> own a reference to the corresponding reference counted object (in C we just hope
> that no one frees the object while the debugfs file holds a pointer to it).
> 
> The question is, what happens to this reference if we would subsequently call
> file.leak()? We can't drop the Arc, because otherwise we risk a UAF in the
> filesystem callback, but we can't keep it either because otherwise we *really*
> leak this reference, even if the parent directory is removed eventually.
> 
> --
> 
> Now, one could say, what about attaching the file's private data to the directory
> instead? (And I think this has been proposed already elsewhere.)
> 
> But I really don't like this approach, because it would mean that when creating
> the directory we would necessarily need to know all the files we will ever
> create in this directory *and* have all the corresponding private data
> available at this point of time. But that would be an insane requirement.
> 
> For instance, let's assume a driver creates a directory 'clients', which for
> every connected userspace "client" wants to provide a file with some metadata
> for this client.
> 
> Sure, you can work around this somehow, e.g. by using a mutex protected Vec as
> private data or by always creating a new directory first for dynamically created
> debugfs entires. But this sounds pretty horrible to me.

I do agree that if we support file.leak(), then the private data should:

1. Be provided when creating the file, not the directory.
2. Be stored with the directory and be freed with it.
3. Not be encoded in the type of the directory.

Some sort of list with data to free when the directory is freed could
work. But it sounds like we should not consider file.leak() for the
initial API.

Alice
