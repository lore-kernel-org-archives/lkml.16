Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF85022D792
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745574321; cv=none; b=aqeWQl8pVLZHxZVyMlz7f7xDBUv62yIh6Ls/MiXdQFtZH2gyWb51DHQIzRVUPpYd9utP8EtW4bpiTQqY9m8xBhk4Rwp+bxPMXOeASvexEzzFHAqbdVLFY1L03kDel3jMvfnWtlEKwh4Yoqd6s57H5uI0zfUMMnMKXQlNdHGXkKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745574321; c=relaxed/simple;
	bh=CfeqZ8MwrDipgREpfJlXEptSAeeXZOgZEyR6p03f8D8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZXsH1ew32RDYRPEG4Dm+vQgpAMo82ONU8tmJ4C7OTue9o6EPEq9nG7i/OsxqYz//b/OE2yxxOIwsxl+AEJ66VfT01GJ2TLn/KNkHF1B9IvvbQ2BYMc2bBw9+eAOYE78bseeEhenhGGgS/Jm5uFHSbWYuLREjSV+ZIAc/DkeQPZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xWn3Lkvt; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xWn3Lkvt"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-39d917b1455so657522f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 02:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745574317; x=1746179117; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A7WLmckkQtxjxqHVXl/VnT/G9l186X8a1eUK/lPosYI=;
        b=xWn3LkvtaiDl9XrRvlt1k/u2Uw9hb6FuhRCkdKhPaV1zEneJx4zjeHUgYqtb2gZEs9
         KNYTbtQ8610ipeA7HxWNocRv/6ajQvWcRaFIIBLwSaErtAX//P4pRqCOIa5jxQFPtY67
         QuQ0SH+29Twd1zq0B581h2RpGtlfkTsSSM1MkuM0BA0q++HjKud1+lrAP/rXOh+643rG
         DHXkrWfkpQq5Pw4ePJtcqXhekP+Nu4SB6Bxm86VbdkSaLRYXxXwypWRNjHEw+kDmzUw6
         NCN/6nLo0QZlCT9X2YcWifrkuBStUUJm6kIPMZv85W/NcNUtBoLqHbKfaQo+tuRE39q4
         jC/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745574317; x=1746179117;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A7WLmckkQtxjxqHVXl/VnT/G9l186X8a1eUK/lPosYI=;
        b=ir6fCLzWWq+IZk6gwN10H80YPtXoJoFt6yKlWxYaKsxR1VT0VIi2/jaikdXJAH+4lM
         3qS7vOUZpQHhslOyyYVyWLytGWANAWY9S7KHrDZUA47QG/MJfFAh8dFdaWu0f/Gu+Riv
         laAtvVNoiDMb3HYBLjayQeSbj01gjj6VNtoET0d1eVcXvPh64JwJWhyvc0nJlCeLU8dJ
         Smpo2ckJoG9HAOcGAvU/VPMDmYgtT06eNKop6l6FVol59adpuC4TriuQTs9s9wI1qskK
         Hw+khK6t2Q75BnxJ8/ErU9ehBNEhs3gWXNJF9puv8gAQZpfTIzHMm99gGZtFOsS2q6+G
         6fow==
X-Forwarded-Encrypted: i=1; AJvYcCWJqv1x+1tkAzQeJEimsNDBxm9w7RcQonrLAnxDZzBdJ12Kl6zT8f1YzTwHKBXwCW0bg9mdAP7tI5pb6mQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz214bYXHgJG8NEyXL3A+Lv8CbhN4nTRny2xvWQgZ2bMx0BRKIJ
	H+h+54T90aKeLi/a2+kKeEfafJ0AsrHf69jmhrWDRiMI89erPtjcPn2n+QX5Uu5cN32veIy5p/V
	UWo1Eh6E8Lme+Hg==
X-Google-Smtp-Source: AGHT+IGIWgeTGoQ1ZzZyFX/3ZrnjpYnEBPs0yESy6MvDI6aNe6s1sTmhJeUPjquEB9zm8G32afu9p7sBWma2ZIM=
X-Received: from wmbet3.prod.google.com ([2002:a05:600c:8183:b0:43d:9035:df36])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2283:b0:391:2f71:bbb3 with SMTP id ffacd0b85a97d-3a074f3a0a3mr1294602f8f.46.1745574317256;
 Fri, 25 Apr 2025 02:45:17 -0700 (PDT)
Date: Fri, 25 Apr 2025 09:45:15 +0000
In-Reply-To: <CANiq72=VbcYroRz1EcbzHqFHwaHLewK+DvK756ropM16pDdMuw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250424-strncpy-from-user-v1-1-f983fe21685a@google.com> <CANiq72=VbcYroRz1EcbzHqFHwaHLewK+DvK756ropM16pDdMuw@mail.gmail.com>
Message-ID: <aAtZq4KX79TaKEIf@google.com>
Subject: Re: [PATCH] uaccess: rust: add strncpy_from_user
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 06:38:52PM +0200, Miguel Ojeda wrote:
> On Thu, Apr 24, 2025 at 5:18=E2=80=AFPM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > +    if res < 0 {
> > +        Err(Error::from_errno(res as i32))
> > +    } else {
> > +        #[cfg(CONFIG_RUST_OVERFLOW_CHECKS)]
> > +        assert!(res <=3D len);
> > +        Ok(res as usize)
> > +    }
>=20
> What about:
>=20
>     if res < 0 {
>         return Err(...);
>     }
>=20
>     overflow_assert!(res <=3D len);
>     Ok(res as usize)
>=20
> That follows a bit better what is usually done on the C side, in using
> early returns (especially for error paths) and in avoiding local
> `#ifdef`s.

Sure, that looks good to me.

> Of course, we can leave this `overflow_assert!` to a different patch
> later on with this code as an example use case, or a good first issue
> etc. It also allows to document it etc. Happy to send it or create the
> issue.
>=20
> (I wrote that instead of `assert_overflow!` because it follows the
> `{static,debug}_assert!` patterns, i.e. it changes more the "kind" of
> assert rather than asserting a particular thing, like `_eq!` or
> `_same_type!`).

Sounds like a good good-first-issue.

Alice
