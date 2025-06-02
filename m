Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6192C3240
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 08:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748852972; cv=none; b=ZL8bpI2WNYtdqpVwpSReG3m74bZMutk9YoAM5xXZMyRqlNMQUQJejcfqIhCF6HNcGC7lP9J5bLxtizx2kA9py9+QAD0exDij3N/WdCqPSpw+Uc9Vs58JFhwDo46Q56Y9vIWxhDSxovvsyv1r2ltz8RJDw2LzU6y76jgSSuGLZkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748852972; c=relaxed/simple;
	bh=tfq+oFb0HlgMyr/raKYVwTlerX3E5/qx2jk3UWH/zxw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=M1GgxdyYQphHjxiQPoWXesAl3sYVZAnKXP+VPHzz06ZbzpFwHtn70l2zeYoIwa6vtODFW2SsNNba0006dskLe51g+2DPm6fWorstTs35MFh+lgYyo0QHo+bR3ut+djQ9Pli7tWXVPDUpoGxfCn3qNfeTPW3xdCZDHA/B3B9dlc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mhHBmA3i; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mhHBmA3i"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-450dada0f83so18373805e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 01:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748852968; x=1749457768; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZbpJCV8zQjR5DojHMaY/jEI40JXedsZY/k7Ga4GE9fA=;
        b=mhHBmA3ijD+Lj8bV+GihwOUhiyrmnydLgVn+apeqK732gYaJlabIgUxDoG5uhGmxN1
         d1jn1C4nNpQNR6cvt4FJwoW/6H2APdEpqDDmfYd6PkSvXzLB84WRHqm7F+FFgy8hNDZe
         Pe91SpmJ+9pgKFEaph282tlhPHa+OEQbNFEHTWPpohiTAsy7piAm3/gw17Zrt9t5tA9Z
         lV2B+L7QGBc2hNmN0oU+tIknwohCAsRoroyy+JDrSz1wA4aSKiasOGs/cfveW1UT9sf0
         o/5RdZURLslmvphsWkkxlwxf/haIRWaMR7TqRK04qmhIO3hcXFIFxVOQe072qwmXkgZv
         Moug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748852968; x=1749457768;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZbpJCV8zQjR5DojHMaY/jEI40JXedsZY/k7Ga4GE9fA=;
        b=pE5NFXBGoAjSNXIcGxs1OyHsibpniBpCBgUekaLFd/dhWoouDQgSKfDxkPsyxlpzZG
         i2nECD9fQ5RfX7qaIzD/i57QyaxiOmg43ZFafE1fwbIQ7JUJbP6G0LrrJp6S3HvGmR75
         C/2nC7LMgvQCJ62tBNKb7Ou1ihXWLeV3CuJNqRdv4nAtD3FZgzhmxFWAyvSrcVTaAFav
         sVlVSjUVZBUU9NFc2+gIWhmQ4mBAffV9YKMsN7P5c9RFlkzIXbxHkKGMA9/TroEW/QIp
         dDFSDW557rizXqI2foIkOfBgxYP2sH5PXQyhFBaM/7X9/XoUr89J7x8ESVXWTPzW7Aei
         mrgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWRS7DDl4S/Ut09w1i45dQ5JLbUiUft4/rWiqX3t1pCChY5F6xXbYBaprzj+cbZjd6xqCtQEIbizqnsQY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+xdY5hY7xxz8z0ozO9Isc3AeM2YLdubkq35vPzkb/h7TXHysR
	dCQz1xS4kHeILCGgjr9//XxbiDpx1/omsJyvEaahOmpaqkg5CcdGpjmi/mTgykYAJcB39rNEz7P
	5lM1kpsgXa/ZVdQ/R0A==
X-Google-Smtp-Source: AGHT+IEYL7osQ39DZQWSxjkteIgaxCeOKxb7imH7KmQjn71xdjWPClNvGxRadK2XafQ3SYOwC0XxYFDSYVTD7Rw=
X-Received: from wmbfp6.prod.google.com ([2002:a05:600c:6986:b0:450:ce9d:a742])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6219:b0:43c:ec97:75db with SMTP id 5b1f17b1804b1-4511ecc3e06mr62032565e9.11.1748852968229;
 Mon, 02 Jun 2025 01:29:28 -0700 (PDT)
Date: Mon, 2 Jun 2025 08:29:26 +0000
In-Reply-To: <DA9GNN7GH1VE.2NDPJZLNHAUP4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250527-strncpy-from-user-v4-0-82168470d472@google.com>
 <20250527-strncpy-from-user-v4-1-82168470d472@google.com> <DA9GNN7GH1VE.2NDPJZLNHAUP4@kernel.org>
Message-ID: <aD1g5jFOrMUXeHhM@google.com>
Subject: Re: [PATCH v4 1/2] uaccess: rust: add strncpy_from_user
From: Alice Ryhl <aliceryhl@google.com>
To: Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, May 30, 2025 at 01:32:44PM +0200, Benno Lossin wrote:
> On Tue May 27, 2025 at 2:34 PM CEST, Alice Ryhl wrote:
> > This patch adds a direct wrapper around the C function of the same name.
> > It's not really intended for direct use by Rust code since
> > strncpy_from_user has a somewhat unfortunate API where it only
> > nul-terminates the buffer if there's space for the nul-terminator. This
> > means that a direct Rust wrapper around it could not return a &CStr
> > since the buffer may not be a cstring. However, we still add the method
> > to build more convenient APIs on top of it, which will happen in
> > subsequent patches.
> >
> > Reviewed-by: Danilo Krummrich <dakr@kernel.org>
> > Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> 
> Reviewed-by: Benno Lossin <lossin@kernel.org>

Thanks!

> > +/// Reads a nul-terminated string into `dst` and returns the length.
> > +///
> > +/// This reads from userspace until a NUL byte is encountered, or until `dst.len()` bytes have been
> > +/// read. Fails with [`EFAULT`] if a read happens on a bad address (some data may have been
> > +/// copied). When the end of the buffer is encountered, no NUL byte is added, so the string is
> > +/// *not* guaranteed to be NUL-terminated when `Ok(dst.len())` is returned.
> > +///
> > +/// # Guarantees
> > +///
> > +/// When this function returns `Ok(len)`, it is guaranteed that the first `len` bytes of `dst` are
> > +/// initialized and non-zero. Furthermore, if `len < dst.len()`, then `dst[len]` is a NUL byte.
> > +/// Unsafe code may rely on these guarantees.
> > +#[inline]
> > +#[expect(dead_code)]
> > +fn raw_strncpy_from_user(dst: &mut [MaybeUninit<u8>], src: UserPtr) -> Result<usize> {
> 
> We could also return `&[u8]` here instead of the size. Would that
> improve the users of this API?

Beyond what Greg says, convenience of use is not a goal *at all* of this
function. It's purpose is to faithfully wrap the C function and match
its semantics exactly. Ease of use is taken care of by patch 2 of this
series.

Alice
