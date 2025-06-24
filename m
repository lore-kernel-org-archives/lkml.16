Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020E92C3274
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 13:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750773281; cv=none; b=TpIlDvEpIwybb6YcxUDUjf0fEXzUXdYBP04zCVLUpBaTMyf6GIFGdDiK5ywbhTZANo66H2FvO1vDVsXX8MsdDF6K4iwSydhvkTFKEFF9xw71YOebEJmx6OK89O/N9eH1hNjLM6QsczdWoLwYLz9iFRdFIYiY9dKlJhrPhD7jIYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750773281; c=relaxed/simple;
	bh=qCGN185qCjx8F271RlR0vW4iPGcpJCnJd3e/5OauLFc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qT9BT2htmvo5oFUk7fs39fotqKK7IKhL9fAAlyyew//94ZmsFwknj66ewBuAsG+C9X81nL0dbypuFC7Dihy8iYMqkrrIE2lV8tpUDrHRBdDw4WK96GTn8oTYUQ89BS30rI0EJsSCMBgdmjLsfxwrRojviGCkhlU9mHftk7J6WBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=J/UpI6wF; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J/UpI6wF"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a589d99963so5252984f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750773277; x=1751378077; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ndIWN7+8y5BdWE2PTIgJRaIaFxEDuJ6LVBN5W+A3/wU=;
        b=J/UpI6wFFt9MJkzf24qTCwKcKkD6jMrbJ4stzJFbZgcVraQBjEwcNcy2Ff5vydeJfl
         gz971kySHoMCUQ5Bl6zOOwYBlagk8tXlGdVJT5gL7lSjLfmhsqHOLvColZHA+M4AIKIg
         RnZgIQJF2EqwE/P3DEEMlCVoTp7eoXpPj1TXFFWMdfnqiG0NsU9+JSbDYQlOz/Y3eqDR
         0RRjYOkZV0HQog/bdLGnA57v5+bAb9IaaMjVRqVYX2SX256LeGvbTGnCpKNM/nMSfUTE
         42TEeSxS2c4aUIhMtWm3JMr6aJQeiinpmChDldJ2v90N/58rRSUZpwQO6uSJz7o27McQ
         Gegw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750773277; x=1751378077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ndIWN7+8y5BdWE2PTIgJRaIaFxEDuJ6LVBN5W+A3/wU=;
        b=THHZOlPh+QVrnWKrsT5R2s0TEMr/olp/c6e3g96LhnONzhcQTNxJcjp41+NeB9Js4r
         BO130BDPqWM+ibBfj79a+yU8YsB4cldDAEo9wCCxpBJbyJjbcaQrkcx2n+riT16btB4h
         A9GuGij1atmZtCbC0jvAdteyKp2LZ2s6kOn6TyFPKAbXo9fEu8JoutdorNQMflFQ2dj0
         odR6uL8aOPTdxR5y0WDgfp2fffo1N0xintR6w3KkMmLiRTHKHIMJCV4esyhc4+p3WKc/
         z4Dp7vqT0LRRRTDMYCZyr0uW28OcY69NLS0EALMzGN7Wmwfk2V1hc/xMa8n0hh7LaP6d
         W3Yw==
X-Forwarded-Encrypted: i=1; AJvYcCUhy0xyqKkPBdddoOU19TG7EoSUIvo3d+JfVEWAotbZsggRsc3mB6aiECvGRnxPnsOH4GThKD8vv9jlDwE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIh9UlRAGALBu7yonsGAS32vO0LWk+wBFthKhdBdYmgS0oHauq
	QWUQJ63q/Nx/tO7ItffzPzRbR2abnLGBgMIDo/JQojt63eEYbWA9IWZLLFMU4d11PLxRAir21UO
	8I2TmpvDVNAaKwonY8RDYt799eUxQaubGwdG1xsZV
X-Gm-Gg: ASbGncsBCr/tDUXNmqYY2U1iaHKb8z6pgmZZY2yNf8Wx6QROHIyLitL63mKIeC18tRL
	8lmnHJAHxsrtV0Tgk1dal2NwOF0TksNDmrMHkpBz7bRUNePITnKocOS1OqJAUhUHfJoLZdL7Ij0
	KG+4+rsPG3BFPH2YVT68UwJiGIJ+3LsbwTOpDXOEIE5BYE
X-Google-Smtp-Source: AGHT+IE6qG4yT4F52V089BtqdcgW05JVoCujc2240lce+bClkgklwaKunhcojU2TzqvrWFprU2PCaZKTOAq2hBQtLY8=
X-Received: by 2002:a05:6000:4708:b0:3a4:f6ba:51c8 with SMTP id
 ffacd0b85a97d-3a6d12a3ee6mr13662866f8f.14.1750773277164; Tue, 24 Jun 2025
 06:54:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiq72mBfTr0cdj_4Cpdk62h2k+Y5K3NSs54_1-9jiszMZ6AuA@mail.gmail.com>
 <20250619.160844.1477802332578239775.fujita.tomonori@gmail.com>
 <CAH5fLgjJRbjPnN58RuaBtNrY1A-tif3ohETLxdbaE4b46Hjbqg@mail.gmail.com> <20250624.224923.1801832299260163743.fujita.tomonori@gmail.com>
In-Reply-To: <20250624.224923.1801832299260163743.fujita.tomonori@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 24 Jun 2025 14:54:24 +0100
X-Gm-Features: Ac12FXzK2-zU_qiS9xBkPbYaAbQyGj3kbgqXjtmwFWyfIVtERMkUn_W2s4_gTfo
Message-ID: <CAH5fLgjttTnev2h4J-hF-LdUTJCoryJyFm5_LqJ6_GBe+=An5Q@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] rust: time: Rename Delta's methods as_micros_ceil
 and as_millis
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: miguel.ojeda.sandonis@gmail.com, a.hindborg@kernel.org, 
	alex.gaynor@gmail.com, ojeda@kernel.org, anna-maria@linutronix.de, 
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org, 
	frederic@kernel.org, gary@garyguo.net, jstultz@google.com, 
	linux-kernel@vger.kernel.org, lossin@kernel.org, lyude@redhat.com, 
	rust-for-linux@vger.kernel.org, sboyd@kernel.org, tglx@linutronix.de, 
	tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 2:49=E2=80=AFPM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> On Tue, 24 Jun 2025 13:15:32 +0100
> Alice Ryhl <aliceryhl@google.com> wrote:
>
> >> So would the function be defined like this?
> >>
> >> fn as_nanos(self) -> i64;
> >>
> >> If that's the case, then we've come full circle back to the original
> >> problem; Clippy warns against using as_* names for trait methods that
> >> take self as follows:
> >>
> >> warning: methods called `as_*` usually take `self` by reference or `se=
lf` by mutable reference
> >>    --> /home/fujita/git/linux-rust/rust/kernel/time/hrtimer.rs:430:17
> >>     |
> >> 430 |     fn as_nanos(self) -> i64;
> >>     |                 ^^^^
> >>     |
> >>     =3D help: consider choosing a less ambiguous name
> >>     =3D help: for further information visit https://rust-lang.github.i=
o/rust-clippy/master/index.html#wrong_self_convention
> >>     =3D note: `-W clippy::wrong-self-convention` implied by `-W clippy=
::all`
> >>     =3D help: to override `-W clippy::all` add `#[allow(clippy::wrong_=
self_convention)]`
> >>
> >> https://lore.kernel.org/rust-for-linux/20250610132823.3457263-2-fujita=
.tomonori@gmail.com/
> >
> > Are we missing a derive(Copy) for this type? Clippy does not emit that
> > lint if the type is Copy:
> > https://github.com/rust-lang/rust-clippy/issues/273
>
> I think that both Delta and Instant structs implement Copy.
>
> #[repr(transparent)]
> #[derive(PartialEq, PartialOrd, Eq, Ord)]
> pub struct Instant<C: ClockSource> {
>     inner: bindings::ktime_t,
>     _c: PhantomData<C>,
> }
>
> impl<C: ClockSource> Clone for Instant<C> {
>     fn clone(&self) -> Self {
>         *self
>     }
> }
>
> impl<C: ClockSource> Copy for Instant<C> {}
>
> #[derive(Copy, Clone, PartialEq, PartialOrd, Eq, Ord, Debug)]
> pub struct Delta {
>     nanos: i64,
> }
>
> The above warning is about the trait method.

Wait, it's a trait method!?

Alice
