Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D860F2054E4
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 10:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748861808; cv=none; b=GVwKCdzdmxROAeb6ozN/MvleOuSBiqEqDK3+yxfjXM3jouvIkhakUprF+5Y8CjTCa3M3NfEgOXTH0XuhPUVQooQzCiXnCarTK6XivFaL34Evqiht3i1nYZvpUc073BqmfYLMFvdILuak3Iq6UxyrZ+o/CWHODEpDoxiu/Mk89bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748861808; c=relaxed/simple;
	bh=Bo1Dn3w37seMAP+bw5pDOhXBdEtsC55jIbo6qBxZVSk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HOX3nj2CDiva4FyyBVytyqkfGb2dzLlIpCLGCXaTvZ2WewXQA8hbp0SLFeyx9R7HM9RwUk5mmaLAE0BCizOZXW487EotrzrKmw8rT03qPsnQRtzXPzvFsKPel7hKTlkdxiWp+EmFcrtPdxP+Q7vCs8Jw8uKh6JmboYCYvyh2lkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R4Oqv6GL; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R4Oqv6GL"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-407a3c10d03so1438948b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 03:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748861805; x=1749466605; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bo1Dn3w37seMAP+bw5pDOhXBdEtsC55jIbo6qBxZVSk=;
        b=R4Oqv6GLLaD6df16lbj1nmmT+HNq/u21bPhjUNsupTvST40J6CW+5zKSaPSzeyC2Yu
         ZsdR2J9lij8N8wkho0QRoRq3VB4GC4YfOuuoYeL6O9lA4oEWp1CVxuGWL4TpjBNoymTj
         MU/KwmeLTNVxMXcnjecAqlthiNOZGUh8RDX4ijL2FMLCHQZ9RaTibdElardGyIY7ljcC
         7xiG9kujalVxaMwMtNNC/LrGzOXcUZZgsTUtr4Ituce2hqnlSR4DZb2DpIntaL0QK7pJ
         8Ysum07gZdD3rDvjkDfBc600ymfBF0pfCgveOmy3khWy2eNL6BJO99Wms8XjvdyJHxl/
         gUBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748861805; x=1749466605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bo1Dn3w37seMAP+bw5pDOhXBdEtsC55jIbo6qBxZVSk=;
        b=n/teMmVkqiKr5OdaOmnIH8NqVWUQvOCxx+IX57Oi2DNSBeYmxTEQBJ1L3lh1ENkyD2
         Ui0jp4rFGIgZIhq1u/1MArVReW6Dc/d9G0dosX7+h4Lr7Ke6TGuXTTRgHu9EyRyzx037
         6tmlIi4vco80nJQhDxIrvAP0MahIrB+jqU/p23BW87jQRuLPohkP7MNXKIZoXJkgbqxC
         ylQiS4aoISmiwbVYIzcjqWmuVsmVOv5BCMtqyaKEs4mBCaw7ThSdGBXWVKJC9WV4wly0
         dciFu4ucRzyI7RUHqvmnP3GNAfMczF+odcq5UcGyQslMVrp6k4dITzr0O7NsrbJqi6Ad
         aOhg==
X-Forwarded-Encrypted: i=1; AJvYcCX8oCPsX+qbkJwDIO5rDFIoaHUCO3GOIoD7TWVFSRbdxPm0eVkStK+2HTrBeQO7O58nrLuv2JRQJCyeTgo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVyWXuXf5r5KJYiPuPscAAwFntCocj2FSxIaxpbfiYTxDPpT14
	NPZhNFbTMN6Kxq4AvT07H+F+XXVflK4d+iUKqnd2YQvB5JSv77p8JUFoxeu7uO+EBd3psAFX0DK
	s1rXCrXpeXJEy6JabtSOBk3jaKjbpdduSu4367l4o
X-Gm-Gg: ASbGncvG3NQWWNBPheSzPi+SxBk5A+vaOrOkrwurGYi9TqqIKcsH1DSKs5Kc2riRxW3
	DFcf5ELMchac097xIoZwKqyPfRA5AaUHleoUwtCdmrGD+Ll2gsYE2CY7wArS+L+hRabMk7bX0oT
	26QcCISeFzes5hIZRN8iDhrCXYLYif5N2NJNHmrkU2qeeFYUgqnJH2ciDAIfzMBSNRbQzB1eHZI
	Q==
X-Google-Smtp-Source: AGHT+IGCwnRveAFrn3m1cHd75Jseg91XQxQvUPPL0lIKIgwRZ6smz4rU2A5lacSedSenmk+Jlg2FWjdBjazxr2GujXg=
X-Received: by 2002:a05:6870:818e:b0:2c1:6948:d57c with SMTP id
 586e51a60fabf-2e948cb5422mr4678788fac.28.1748861805503; Mon, 02 Jun 2025
 03:56:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250526150141.3407433-1-bqe@google.com> <aDXPhs79tQGTNU9b@yury>
In-Reply-To: <aDXPhs79tQGTNU9b@yury>
From: Burak Emir <bqe@google.com>
Date: Mon, 2 Jun 2025 12:56:33 +0200
X-Gm-Features: AX0GCFsptb4AjM3AXX__0mElF1fRr3ofVuwEuTFh0eet1zbR-ixQIe0moGlg4S0
Message-ID: <CACQBu=Wtd=b+BwCGqXgw=pJdFexDH8GfVXHdnGVcOKD9seeo0A@mail.gmail.com>
Subject: Re: [PATCH v9 0/5] rust: adds Bitmap API, ID pool and bindings
To: Yury Norov <yury.norov@gmail.com>
Cc: Kees Cook <kees@kernel.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Carlos Llamas <cmllamas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+Carlos

On Tue, May 27, 2025 at 4:43=E2=80=AFPM Yury Norov <yury.norov@gmail.com> w=
rote:
>
> On Mon, May 26, 2025 at 03:01:29PM +0000, Burak Emir wrote:
> > We include set_bit_atomic and clear_bit_atomic operations. One has
> > to avoid races with non-atomic operations, which is ensure by the
> > Rust type system: either callers have shared references &bitmap in
> > which case the mutations are atomic operations. Or there is a
> > exclusive reference &mut bitmap, in which case there is no concurrent
> > access.
>
> Here I'm lost. In the other email you say:
>
> > You also commented on the API. The weirdness of the API is all due to
> > the separating "request to shrink/grow" from allocation.
> > Since allocation can happen while other threads may mess with the id
> > pool, one has to double check that the request to shrink/grow still
> > makes sense.
>
> And here you say:
>
> > there is a
> > exclusive reference &mut bitmap, in which case there is no concurrent
> > access
>
> So to me it sounds like if I want to resize, I just allocate a new bitmap=
,
> take this exclusive reference, copy IDs, swap the pointers in
> corresponding class, and that's it. What did I miss?

The two emails are about two related but different things:
1. the bitmap API which uses kmalloc with GFP_KERNEL, and what you
suggest could be done with &mut references
2. the id_pool and its fine-grained API that permits controlling the
time of allocation, which is used in binder which relies on a
spinlock.

My limited understanding is that calling kmalloc w/ GFP_KERNEL while
holding a spinlock is not good, since the kmalloc may sleep.
You can see this "first unlock, then alloc, then lock again" pattern
in binder code here:
https://github.com/torvalds/linux/blob/15d9da3f818cae676f822a04407d3c17b533=
57d2/drivers/android/binder.c#L1099

cheers,
- Burak
