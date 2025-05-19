Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88CF126F0A
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 23:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747698254; cv=none; b=Js+1z67hvHPv9/M107a1F1FjpMH5qE3HiKgqjtOyOugmjLE2dRQE7GTqUeg7tKU8ZIZUS1G8YjPrwdkCMLcbYHaM8LqraA2U4hPFpuyjr/jGvQMzp7joPqR7TVEWl0Fl+i8p+l0fwuK1lsgcG5Rn415X+XclXRn8YeYlhYmseYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747698254; c=relaxed/simple;
	bh=XjDLoT2QHXCTqz8BCXPXR1Qng/tmWuoD+g1I8LQifj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JLNlHjhi6FXYlZiqVho5kelwSnuIDCLvea2Ms0xkYx+/JZWcpFirG9o4mwz1QjRUedcJyzIZBrrXQaKLAwmLbp3iTlXnSWgKLLgFKiIINs/AQ/a3OJuesIKkrvLPTyuBqrAskhAqogGE11R5jzYFPw1zsNj9dNupxbAdMb6HGKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eilY/GR9; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eilY/GR9"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-231f6c0b692so451225ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747698252; x=1748303052; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XjDLoT2QHXCTqz8BCXPXR1Qng/tmWuoD+g1I8LQifj8=;
        b=eilY/GR9kmizYIT8INKIn9VPWosDwcFG0tRilYWZUlOatghqDuv/XCGYIdtUFSIbcu
         5S9fqKmN6yi55oa97OheNv8XLfhLZr6KfYgumMwDGR1Kb6CptyQ6UGaWjX3dm5g3trSF
         bBz/kiWnMZUiNbEEF/8UVdJuVVxmzZJ4xUELf+gNQ1ne6Jvw4aYro+RGNOwKf4ZBinqO
         DKmSfO6NSI5vlzj6kYox4V7lNMM/KloXAjGAgUXpPB1b2L5mxDr+F9Rt1UF2l5RyIcF/
         FYWmsh26wfm0h9v7DoRtvFnxopgyysfHLnWbyC1Cf+uh4efNFcpbbB6bGxyqnh9s/jJJ
         CFcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747698252; x=1748303052;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XjDLoT2QHXCTqz8BCXPXR1Qng/tmWuoD+g1I8LQifj8=;
        b=ntkpvcA6S5TyokJF987hcd25jahETtgdJ4z2zD9/HcpSKuIS0XRtUpRlOWUfMeWQOb
         4oq0SZyq/HN83krPcnwPyBC5rq4C3WudJDQjAu0KAzJ0UDJ2b7BlESOB5G/qXkjTLnfD
         uPFhHMnIxZKd1yRley/dejICE2KGbbcebLdTHf86AWIJHGQJV/5Q/e2iCb5tFBBUHn4N
         7ln0MEJP7TGWARnKKfsP20Q3zzV2wnMpGzvc87gp/gPzE2vG6v95yALVm+SPcauL+dXj
         6JxIR6r5Pv9Flw91WSr6P6BB5HXnXCHoPcXtbttU4MBGrN0PpL5Wn7E+ZoQbGWhScstj
         u+BA==
X-Forwarded-Encrypted: i=1; AJvYcCXx3U1N0lEovOwi2gi1qcKL9ZTgJ9+HkWq1GcztVWDcdLfxJQspInqKZFCY+Pcqk+asLoBMsUforAFkGvk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwY/2qD3mZRa3FsuC8+Sx0ouWzuywRSfxIJ4D2OkuazARhJiv9d
	hovEYjdX/Tf1SFyjwD84vPl9AOB7c3Im0y/YL8HGcl3as4o6KX3o16z4rqKXQP6mUnz/YDruO7O
	RBi6fZr4+Hr9QBF2S+8r6m8uayCtDDSJ9oEqH3fDU
X-Gm-Gg: ASbGnct/KZsIC3x5F1ufTRRYY6NfWaCpJ+r+aqfmmkRe/YM3H0GCwarSectsyqnvbLU
	31AsDaspBqEa9Laq+ji+LcuVDIJd9ICXTBorDByHwpZQgJWOvB0MLLWpT3UdGHl2r8M/2iJHg2d
	D3CNDxLbgid2b3wV0JaAcqkgxLtF700GoURtJF6UMHdJEaDIIPXk0lmYitNtg2XOrf1Uc0nw==
X-Google-Smtp-Source: AGHT+IE7AXqNSM168pnSSbm7/Qdp/rsZ5MJVswN9Uamoq5240bQF4qJjFwhtWVm+iT8b7LVuXFvADMYtnY0OTDWxPkg=
X-Received: by 2002:a17:902:d4d0:b0:223:2630:6b86 with SMTP id
 d9443c01a7336-23204043e30mr5347595ad.7.1747698251850; Mon, 19 May 2025
 16:44:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519161712.2609395-1-bqe@google.com> <20250519161712.2609395-6-bqe@google.com>
 <CAG48ez2WdxXVCzVsAPeQWgso3ZBQS_Xm+9D1FLBx6UHFV1bGHQ@mail.gmail.com> <CAH5fLgiK3T24gf6tjXGGMsjqj17dh0PFbRZboE5oXXp16yOLTg@mail.gmail.com>
In-Reply-To: <CAH5fLgiK3T24gf6tjXGGMsjqj17dh0PFbRZboE5oXXp16yOLTg@mail.gmail.com>
From: Jann Horn <jannh@google.com>
Date: Tue, 20 May 2025 01:43:34 +0200
X-Gm-Features: AX0GCFs2kKKvW7hzRLpDUAMJo7MeTUCLcCF-zBATZLkYTjuyGIG9AgDMXpbovfk
Message-ID: <CAG48ez0cspY1x1oaVs=Jz_9UN3YuFzWb-w=Q5iNfE0cmRek77g@mail.gmail.com>
Subject: Re: [PATCH v8 5/5] rust: add dynamic ID pool abstraction for bitmap
To: Alice Ryhl <aliceryhl@google.com>
Cc: Burak Emir <bqe@google.com>, Yury Norov <yury.norov@gmail.com>, Kees Cook <kees@kernel.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, "Gustavo A . R . Silva" <gustavoars@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 1:12=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
> On Mon, May 19, 2025 at 3:51=E2=80=AFPM Jann Horn <jannh@google.com> wrot=
e:
> > On Mon, May 19, 2025 at 6:20=E2=80=AFPM Burak Emir <bqe@google.com> wro=
te:
> > > This is a port of the Binder data structure introduced in commit
> > > 15d9da3f818c ("binder: use bitmap for faster descriptor lookup") to
> > > Rust.
> >
> > Stupid high-level side comment:
> >
> > That commit looks like it changed a simple linear rbtree scan (which
> > is O(n) with slow steps) into a bitmap thing. A more elegant option
> > might have been to use an augmented rbtree, reducing the O(n) rbtree
> > scan to an O(log n) rbtree lookup, just like how finding a free area
> > used to work in MM code... That would let you drop that ID pool bitmap
> > entirely. But I guess actually wiring up an augmented rbtree into Rust
> > would be very annoying too.
>
> If we're talking approaches to avoid the bitmap entirely, it would
> probably be easier to replace the rb tree with xarray than to use an
> augmented one.

Ah, yeah, maybe. I'm not familiar enough with xarray to know how
annoying it would be to insert stuff in an xarray that you reach
through a spinlock, which seems to be the requirement that made the
API for the bitmap interface so complicated if I understand
correctly...
