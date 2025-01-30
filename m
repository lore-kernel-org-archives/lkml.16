Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312711E0B74
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 15:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738251817; cv=none; b=gKW9KliRONla/XG3TKfe4svo/Aus4eGzo8ge0FHWDfpRdPHG8/8al9W/ImraJ9ESpawQnG6B1cn0JB70aSH2T9gRmubC5gmj/wSW/pxEeTknsSpsvh/iH7nBB4LgUC2mGgSGS/LTAYw8l7ndY3KU2gP1XfXvgeXMVX22Od6kUK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738251817; c=relaxed/simple;
	bh=gnkuw7EAWfIkyzyYly9eVU4x+t+1CaTxemTEoAKj0aQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=omE9Kkm0z8xPxZOFZDTlfTmgIT5z5LcwjcE1T97e7l1GFRNYQosBKd6OtOwaKe3N+1ZBvRT7w/R+rPtq9bGvbqQYJNXyv447aO/eRlYmhumkzcUki3Qkw/kiXWr2hZF0AQfbJlI1s2QpmsY8m3ZHG31E3LIdk/jQ8MmOnLxslu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=joTpTYa/; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="joTpTYa/"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4361f664af5so11364725e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 07:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738251814; x=1738856614; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=azPhhQ7rfyfc+5KTeibaMiwEyxa9c6hfQ+sTaARSFUY=;
        b=joTpTYa/OgWirXLl+pf0YZNrduLOSczQVOcROH92AS8DNHkjp3bcCwnholeE7oLNAv
         EDwkYjtdw/XkeYdJAxcQVvssbIqmfPxP7NLWzXCrhLjR87DOUjJNfbr7fBVJ+dSyjkx+
         CnoCfNS77v6m0cNngyYbDFc0Su2uabwJmcZSidVsQMeQg05X1K4n8OneG9V/e6hAcRvj
         P9Amc71ueXW6O+TnnTrRXwzIDztqDYwtOeMNNw+5qEIpQ6CKKEX6PnCidwtsgZlpz1/E
         Bpc8YXnC9CJz3XyS17nUGOZlF3JjiX+zVk1l6l1jwP6INXNZ7k7b2x9PPSKszKAA5xnQ
         rmyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738251814; x=1738856614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=azPhhQ7rfyfc+5KTeibaMiwEyxa9c6hfQ+sTaARSFUY=;
        b=D2cL3TaxFuJfzSNEmC6D6Elxd+2fdwYGx1sdx68ie5ZmxSdeWaDDCOGJNDRzpFh8vT
         fCY4yNmrNwXzsSpbC9jz9dE2+p5oQ3ImRl4/+VtNMG+IuiYffGjkG6mukouy2YZaaVl4
         Z2sKTzcB3Z457fv+0yptrYeVjSdWDOxGKjN6Bqr9CNhmVGDQKLOCw6hZ3l7NqXl1SlOR
         xdgblGYhNjfyEBfbkzNUXJ3VsZ0pSeSpL2eL9EkJPuTONAyofJMWjV6IvvO7lpNZApv0
         O3Vr6Y+s/GFZn7Y7UNbGQ6ORGMSZmEkn5L36MhN7/+mlSel/4sVx52biH02TI0TxEyZ3
         EbGA==
X-Forwarded-Encrypted: i=1; AJvYcCWkMtGv2x/NDs+7RNRMrwwXxM+lG0Ue47hNO0WA0UwrjFBvQFBoCJ+IEJSsBCRIlYj/nhiQv10KMaDHxWQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ5sxN0vJ0Li89zO0C7YxGXzdSIae+K26643XHKLubVTyNXRXI
	sGhnW0PWBbHNrR7vGM8NCMM8msiXGZE1E41UXlEAJxob6/6ENhEyGHpVAsPlg3GnuVSHhSLKu5K
	fAaMgilHvEDeyqHzqViqoelyYZcvM5Tjd74QU
X-Gm-Gg: ASbGncvZ+RaD2MaTdAonPHDp98PszqV4ay2+YhOK5jKPzbDfpmj+6DQY7yPoANeAlCl
	+k95QsaB27fJJFRGo/NiZuhFe77rLN+1Or4r+3TKKH4hxcIrcfdQF4PkZQFKrwIwTWOtPsl+l2g
	qsIoWXMWeO9BaEiXVda5GMe3/n+RI=
X-Google-Smtp-Source: AGHT+IE1Yi3yMptv3DDYAHG2MYfvszB3hKN7BJNtoVBKle5XEPlSkpwHhdKDdo6JiVKJ17MLIwR92OsOs1d3e6GeOqo=
X-Received: by 2002:a05:6000:4024:b0:38a:8ace:85e8 with SMTP id
 ffacd0b85a97d-38c51e8e42fmr7581190f8f.44.1738251814358; Thu, 30 Jan 2025
 07:43:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250130-guard-get-lock-v1-1-8ed87899920a@google.com> <Z5ubrUcSuaTtj_wW@tardis.local>
In-Reply-To: <Z5ubrUcSuaTtj_wW@tardis.local>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 30 Jan 2025 16:43:22 +0100
X-Gm-Features: AWEUYZlOeHhELDW2pMXb6HRxrDbsoc5f9z0QdhkMHT2sBQi04pokpKUhfBztReM
Message-ID: <CAH5fLgiTG8nNRdb2=3PdZN=2Bg=KLGy4hvrae+E0jcOeCTBpjw@mail.gmail.com>
Subject: Re: [PATCH] rust: sync: add accessor for the lock behind a given guard
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 30, 2025 at 4:33=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> Hi Alice,
>
> The patch looks reasonable to me, however...
>
> On Thu, Jan 30, 2025 at 11:39:32AM +0000, Alice Ryhl wrote:
> > Binder has some methods where the caller provides a lock guard, and
> > Binder needs to be able to assert that the guard is associated with the
> > right lock. To enable this, add an accessor to obtain a reference to th=
e
> > underlying lock that you can pass to `ptr::eq`.
> >
>
> ... could you provide more details on this usage, for example, why do
> you need the assertion, is it for debug purposes? Does the current C
> code have the same or similar logic? Besides...

I added the assertion because it makes the SAFETY comment on a call to
kernel::list::List::remove simpler. The C driver does not have the
assertion.

> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  rust/kernel/sync/lock.rs | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
> > index 41dcddac69e2..681d67275b49 100644
> > --- a/rust/kernel/sync/lock.rs
> > +++ b/rust/kernel/sync/lock.rs
> > @@ -169,7 +169,12 @@ pub struct Guard<'a, T: ?Sized, B: Backend> {
> >  // SAFETY: `Guard` is sync when the data protected by the lock is also=
 sync.
> >  unsafe impl<T: Sync + ?Sized, B: Backend> Sync for Guard<'_, T, B> {}
> >
> > -impl<T: ?Sized, B: Backend> Guard<'_, T, B> {
> > +impl<'a, T: ?Sized, B: Backend> Guard<'a, T, B> {
> > +    /// Returns the lock that this guard originates from.
> > +    pub fn lock(&self) -> &'a Lock<T, B> {
>
> How about we name this as `lock_ref()` or something else, because
> `lock()` itself is already used by `Lock` for the lock *operation*, and
> this is just an accessor, I would like we don't confuse code readers
> when they see code like "let b =3D a.lock()".

The usual name for this operation in userspace is "mutex".
https://docs.rs/lock_api/0.4.12/lock_api/struct.MutexGuard.html#method.mute=
x

But since our code is generic over many lock types, I went for "lock".
But I guess it could make sense to rename it.

> Moreover, if the only usage
> of this is for asserting the right lock, maybe we can instead add an:
>
>     pub fn assert_lock_associated(&self, lock_ptr: *const Lock<T, B>)

I guess, though there is precedent for having a method that gets the
underlying lock, so I think it makes sense. If we had an assertion, it
would probably take an &Lock<T,B>.

Alice
