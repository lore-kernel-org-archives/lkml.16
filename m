Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6496F21FF2B;
	Sun, 22 Jun 2025 22:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750632843; cv=none; b=VdwVkkPsSPrw1Bh9/MAoOii5rdgw3nDGkUKtlYZUNgnkmxjCDIMp/xwuJ6MPqFKzE03g5cOAokKDo6wUThkjdNPr4NhGm27q2bwPRd4paMZk4SVW16WR5DW0/Jgyi23Lg3V50Ki3nm8VMCGL6rNvfVjT77X94fkND2COv+8fT+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750632843; c=relaxed/simple;
	bh=hlLjSiaAjh4zgfYoZ9ODBnlaRlhA2rghxB6sV5obPJU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r1HzKOcoh2ELAFU7+pNqfaZoV3lIUWI2WJ4O2cvt1Kwsh0UPUKjHHqyzYTHkhsRcacoRnR6mhXpWGbWWBT2r79jmKn1IHmrf//t9LA/sJtJL0My6pn2hmCXG2I0oZZWHm9/Ptbe5oJ4YtqKWWtDwJ53g590R7bbRTscXQynT4qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QF5ERoki; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QF5ERoki"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-32b5226e6beso33529101fa.2;
        Sun, 22 Jun 2025 15:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750632839; x=1751237639; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1zioWgQ/6QqBmvlZqll7x8yhP3nFEYFEO+9Y/YkZw7g=;
        b=QF5ERoki4RrhU7+LnRkY95B9n/a822bpRmS4y2WoGo5Iht+Arp5T37yPbkqKpHFBob
         YZQ6xj02AkV/nxkh/9yGX3R/rC3xrgtkQ46mNOWNOwzqmKzQ2YR+0spzJObZs/DM/1fc
         7+rBDkBVLZSiC9KAJhA+yFTwKMhH59qaJhFpLXX82FyYp6gptEqg3IYSYOHgQmaUKmz2
         aV8AwdUAAW+cCSjATLzkChJBeYGQeY810Kx0+gtuAxi5B1MndiGlFpbiKAva9yAkks20
         ZQjzzxliZq5i6T4wLBX7V4dNXJlVgCKkMmc7Cg2ihpJLvINkOyQXP4jQCQoxbkLmEXCt
         wT+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750632839; x=1751237639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1zioWgQ/6QqBmvlZqll7x8yhP3nFEYFEO+9Y/YkZw7g=;
        b=dTdzxuC07tO0UuWZDz6WoWtwlvIRNNkt8nIf9BKAp1Txg+wncNWZBmYruI+va3pL6W
         P3OG1YjTDS6V7HwOUfiaphPnHar2BGkCbWNPePDKfOPEOGYVjflFCL+8q2ftKejjcus7
         X69qMhDsXu3YBVkU9sgjnt1K1mLoViC+isRJbOKNf2zhYsRGvymilFLxNgtCWCYBH/dU
         nrRvNJ+W9pfjCI4GiPeVjEKdZZ7srp7ySLFG7VbpBRtZGnb6xYD1KIbMt14f3l5V7Rej
         6FiZtkMXesZwyX+eFr3XOd/SKfz4Q5qYw0ATaHkmxpGHNGfdn2ys4GVYn/vXcn+E2ZnR
         kNkw==
X-Forwarded-Encrypted: i=1; AJvYcCWWOqKG8ELuYsLyDqamMtWnaDP8jWYl4sTDHpJVETYHrQtvmcpLKlI1nAnYvhFJl2K+M6O9m0EycQYZcGHZv5g=@vger.kernel.org, AJvYcCXnJtkFBf7ApIrd/leiZBvMzX7aEah8oXUJXz+ie0dJlD4YAS9EMINuKjZEwWy5m38G5nmsybwH4XnKEUU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj2VZzVCAX1tcLaBDrQC0fBhPv8FjWsnfMSiwmeG5v0kW3G4Yz
	agw4TNlv7Uvwx4v3WwrQCcQLxTCG8KlqRnxB6vDFx1RWLqSjSbcmfVKC8pj8/mEXIjnXpeshOF9
	vroCKRGdf+VJ/saC7mbPiIuQnDouA9f4=
X-Gm-Gg: ASbGnctSayCpN+DoQT5LB+8ODY/33tmly4bD9DX2NY9EV/7nzlPjwsoSXT/fX8JfPh3
	DNRrs2BZ4vRUrJM8J2AS648nQrsiN0dte/H20eOnA1u+DjCxfGgKChUsfladKIb8O9WOxjlSGq9
	9rWWvPi0WwSY2DafecbrFp098Pj/XLeKioKnTQ+m0/DXP6lmuJFUzterqN0hAxBBIKACeweRkDS
	QYqdA==
X-Google-Smtp-Source: AGHT+IE1XSPaupY13kKGqETrXLaUqAXYtPoQGp1IE8gbDCr5d9sqyof9SC3wLGxN+L4/VQV18IUnP7nkHiuw5wWam10=
X-Received: by 2002:a05:651c:198a:b0:32b:4773:7aaf with SMTP id
 38308e7fff4ca-32b99060470mr28715571fa.35.1750632839209; Sun, 22 Jun 2025
 15:53:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250621230231.100181-1-contact@antoniohickey.com>
 <20250621230231.100181-2-contact@antoniohickey.com> <CAJ-ks9n1SqM_1xAstHQpp8Z7-2JSTkp9zUn8kwZA7OAAqWxQ6Q@mail.gmail.com>
 <20250622222023.29071-1-contact@antoniohickey.com>
In-Reply-To: <20250622222023.29071-1-contact@antoniohickey.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sun, 22 Jun 2025 18:53:22 -0400
X-Gm-Features: AX0GCFtshQcTqZxSJUcBd57yBLwW4feJgKhi0C4-UMJsmMD-CfHgkm54hLq-ftE
Message-ID: <CAJ-ks9kDTjw7ukrErWgS06HRQ7d-gAsqzzgAnQC92pi2xLFdBQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] rust: kernel: create `overflow_assert!` macro
To: Antonio Hickey <contact@antoniohickey.com>
Cc: a.hindborg@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com, 
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org, 
	danielstonecote@gmail.com, gary@garyguo.net, linux-kernel@vger.kernel.org, 
	lossin@kernel.org, ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 22, 2025 at 6:20=E2=80=AFPM Antonio Hickey
<contact@antoniohickey.com> wrote:
>
> On Sun 22 Jun 13:48, Tamir Duberstein wrote:
> > On Sat, Jun 21, 2025 at 7:06=E2=80=AFPM Antonio Hickey
> > <contact@antoniohickey.com> wrote:
> > > +//! Overflow assert.
> >
> > s/assert/assertion/
> >
> > AFAIK the standard library always uses assertion where a noun is
> > needed, and assert where a verb is needed.
> >
>
> Reasonable, I'll fix this verbage in my next version.
>
> > > +/// Verifies at runtime that an expression is within an expected bou=
nd.
> > > +///
> > > +/// This macro is only active when `CONFIG_RUST_OVERFLOW_CHECKS` is =
enabled.
> > > +///
> > > +/// # Examples
> > > +///
> > > +/// ```
> > > +/// overflow_assert!(3 <=3D 10);
> > > +/// overflow_assert!(5 <=3D 5);
> > > +///
> > > +/// const X: u8 =3D 5;
> > > +/// overflow_assert!(X + 3 < 10);
> > > +///
> > > +/// const fn f(x: i32) -> i32 {
> > > +///     x + 1
> > > +/// }
> > > +/// overflow_assert!(f(40) < 42);
> > > +/// ```
> > > +#[macro_export]
> > > +macro_rules! overflow_assert {
> > > +    ($cond:expr) =3D> {
> > > +        if cfg!(CONFIG_RUST_OVERFLOW_CHECKS) {
> > > +            ::core::assert!(
> > > +                $cond,
> > > +                concat!("overflow assertion failed: ", stringify!($c=
ond))
> >
> > Can we still allow the caller to pass additional arguments to the
> > macro, so that the overflowing value can be emitted? Alternatively if
> > the expectation is that this macro is always used with a comparison
> > operator perhaps we could have `overflow_assert_lt` and
> > `overflow_assert_le` which provide panic messages containing the
> > operand values?
> >
>
> Me and Miguel discussed the `overflow_assert_le` and other variants in
> my previous v2 patch set[1]. We decided it would be best to just start
> with a more flexable general expression based variant of the macro for
> now, and consider other variants later.
>
> I agree we should expand this into more specific variants, so it would
> document the intent of the assertions even more clearly.
>
> [1] Link to Miguel's comment on a `overflow_assert_le` variant:
> https://lore.kernel.org/all/CANiq72mvu54B=3DU+YCUmbFctj_wXgF5zjeE-BB-vHVn=
AP+3mPcQ@mail.gmail.com/

Ack, thanks for that. Still, I think the "any expression" version
should allow the caller to supply a custom message.
