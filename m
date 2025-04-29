Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBC818F2FC;
	Tue, 29 Apr 2025 19:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745956438; cv=none; b=rOJdMcW5OCET+nvOOVnGlIcs76jLwQ2snBaOTR0ODYS1mV46OVjx1oG6oacPCpEBimknaMBOrzq7PAj70+IbyxebCcPOKhQzGL06PkdY6UWHB7sEY7Qfcght0Wt7Qq6RTujfurUuXdQpbaqoj3Xfox7B6VOUXtRHAf4zsgal18A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745956438; c=relaxed/simple;
	bh=sXd94ZXT02XcyYRptVNqGNx0uocfUYWXEHMcLuQLVBo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BjepMhJp+UQSDxPuI/7Z1M7Lo7bYSAIM6er7bnIXQQK9qUxTdt5GwrhLrlmKhINcLbALL+5Fhp89R0a7dAiQfFb5Os/AVsfPYO3L9/FCeiXqqHLPfwswKRemgpGAszHqUczGKtiS25REfTPzNKolGCh1wiAgGycOjq0n9o0I6lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SmINFDSh; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SmINFDSh"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b143ad615f2so504227a12.1;
        Tue, 29 Apr 2025 12:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745956436; x=1746561236; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VlRwZdi76z/rRqlmd11C03wdLmw6zAlbaL2CI1dINvQ=;
        b=SmINFDSh1ODOuVt4gZ8x0e94JJu0eWfQuHVO2inMywl0X+sBHIQlPFBH+WTbWGlI9w
         7NvSEW2VLEiID4qrf+uM6wT9UWw7nS4aBjpcgX5GYaoJkAYkjYnqd6tRJoB6Flg10bl6
         UEY1/7rU/wmpn2cOpv27x9y5LgvzAjtKOFa6+B/S2gMgfEOo/IfDZaSSodMTyC7iBojo
         n7+xmm5HmGweKoUnvzlmsWRZ15I9BFqSEnr/FMe+Xj+jmlU1XLKNLzrzt73hLueQt/J1
         pXa3w1KC2Hp/7C6ZRuRnhaxVNEAI+mIMGeveMdIchaOfCybGc+AOAKIU1SLSni4HicJT
         xH+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745956436; x=1746561236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VlRwZdi76z/rRqlmd11C03wdLmw6zAlbaL2CI1dINvQ=;
        b=EUJ2yp7OAwRHtFUNgl6aVHL+VV9I4Q6hllcrXO3HwJ3y9e4ZkI7jKaOmgrjFtogxwW
         Dx3Rmd4enoPIuIjnYfB5j1tUWzmZkoURgKQmbumsD8iv7zm/Il7G73+k9bJF7yqAPArF
         uKlq6A98VFmb0aB93BXpK+Jy/MxbGr7Wf0QvkhVPVW80VFJX6AtossAy08vW6z5/vKDw
         DLHYKNFhNjLcKxuRUY3ua+mi9b++8ci9EKEDUBgKnpPS0726dOa7RrOlpApCPdGhypTP
         D92umr9HHIbrUYcs8yBtFys6gntlB/hcIwWhQAAYueD4lJ+3hFALlUmBq3uuCkg910gz
         KP3A==
X-Forwarded-Encrypted: i=1; AJvYcCVeoBdJoJzzJsNvF8g9cDOlOQJhrr3+YfIYArjLaPDz4JK+cRqxMUk7PWDFHKVoLxHtqj9zn669fyGK3AsveSE=@vger.kernel.org, AJvYcCXDg5AB1+7Htuam4qbyohdSQ+EIyKf5DIUOGjzp6OgtFe3cqShTpyQFzTXqM9IcAwFX6s5XtbjFcx/149o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyT0CHvL03zDsu6FxPqOKY389wsoa1INbZx1U3MlWono3cyKv6z
	Da00EQgzk3KdRYpmrw6L250ZBp5GyEb8A80GO/3vLZGP9/zqLS2EV8Aaay2ojYYmQh4yJj2Z3u/
	l88kNkAvzispfk71/b6bzSym5VRM=
X-Gm-Gg: ASbGncts1T5Xq2yAIEPbSQOAGB/5rAmgR3S7h5NpYEtwgFd7bO5n6LXPpbOZxX5ltfG
	36eHa33PNZePk0IBYweEY8pezgUkjBpxCr0eX70JpsAvEn5nPz7skmmhckeBau9fA/OTjUPbDGK
	RI1jA+gPctQ+g4Qfwz1Y4CFQ==
X-Google-Smtp-Source: AGHT+IGuqcEJeHitET0cziXeNfp/BbiIS6OhMGd6ZqLTHyVhvspmNWeCeuMYv/ZLE6pWZg9jm4xoW5RWXyo8vNKJWtQ=
X-Received: by 2002:a17:90b:3844:b0:2ff:7970:d2b6 with SMTP id
 98e67ed59e1d1-30a3336f32cmr174002a91.5.1745956435663; Tue, 29 Apr 2025
 12:53:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415195020.413478-1-lyude@redhat.com> <20250415195020.413478-6-lyude@redhat.com>
 <87o6wnkqn1.fsf@kernel.org> <e43294f91b622bb9782df6d0193daa22c29f47f4.camel@redhat.com>
In-Reply-To: <e43294f91b622bb9782df6d0193daa22c29f47f4.camel@redhat.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 29 Apr 2025 21:53:43 +0200
X-Gm-Features: ATxdqUHP_NAK4lc0ihdRoiaLdSBjRPjtNTfybr3WVdZy3229lCH-wJqiQ_U3Uq0
Message-ID: <CANiq72mi47p0jVoXXq1d1G+7PnHi7ngs6zTS084igfZZzzNGBw@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] rust: time: Add Instant::from_nanos()
To: Lyude Paul <lyude@redhat.com>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 6:01=E2=80=AFPM Lyude Paul <lyude@redhat.com> wrote=
:
>
> Possibly - somehow I completely missed the invariant of 0-KTIME_MAX thoug=
h.
> Seeing it know, I think that this function probably should just be unsafe=
. I
> can add a debug_assert!() additionally though if you think we should stil=
l
> have one

It never hurts to have the assert, even if a function is unsafe.

In fact, it would be nice to have an `unsafe_precondition_assert!` for
this, though, even if it just maps to `debug_assert!` for the moment,
similar to what `core` does. We may want eventually to differentiate
the cases at config time.

Filled:

    https://github.com/Rust-for-Linux/linux/issues/1162

Cheers,
Miguel
