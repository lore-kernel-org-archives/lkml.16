Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A800137E;
	Sun,  4 May 2025 19:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746387711; cv=none; b=GgFCFnwsvfBJjcURnArQ64B8O1igCz8F8Nf2O3ic+mFf2mULdk0geDaZyNZu7sIy9d8XgfcmOnajNyjRGMJGU+xr4gI8pSL3gT/9ndoiTFo7O4yWv6UWASbOzjBM7oqMaqG3XXFJVKDVWNo/9cyjAF+QsI+vOMg8TyLVvLYkBYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746387711; c=relaxed/simple;
	bh=K3F5/KIWAaKbb2R/xf5gjoXGRiWhe+uHcyjSlqkLfLU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iZVPdCgG8qXzVRbecn9s10cveJANcH1+yOsQAMU0VsQ+7yHMlAH6LcThPiko0OV5OHqfjrJ6XVg7GBb7nPFPxvpovQr7A9JXdH0SSq09utJ5iIvUIzJvoyxQZ3pdX/plt+ktJF7UNBdvwUVPtrbqWkZKzbKAOVvFiAmSMUZ2Dt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HgEln8NV; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HgEln8NV"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-309f26c68b8so378095a91.2;
        Sun, 04 May 2025 12:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746387709; x=1746992509; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o12aVVyH9kV52ftq4bnSHwH56vkgugSHnAWeFrIO11c=;
        b=HgEln8NVDEBXsa7EydEPsttJmMKOG84W022SyMqjJxGt9oqtJKohVD5+CLHudv7VY1
         8kbjXfXCd5DcfYoOFEPDk7h6SfLWJCedK+EZR58X5toIqmImeY0+SeUGfRR6LC9aeGVE
         gwHJkijO+Q7/NLSBZMLpb7gppRLP5rs3oEW6J7pfE6SIewaplMWnhDi+Gna56w4kIQWo
         gujiZAKaY8sVXi41YdzU82IV+mRQRy+Mx27UKOwcHqUTCA+lA8Gks1xHvW+YUJ7wMuV8
         CQhwtUMyDq1HI0/AOqlMSpwYFGr+1WVqvGImBRmH/KH0HwDx7eC2Cn/6EzhnbasIBMEA
         uJZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746387709; x=1746992509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o12aVVyH9kV52ftq4bnSHwH56vkgugSHnAWeFrIO11c=;
        b=jg2nG9vBZOmZlZzJhwcoEyjCScfqlCY0RL/YyMEfJdzc7c+/WcD+cVsQqQtC5bN3GO
         pN+3oRLoWQvthGFHfcUFbJKoN95cWiWMewuNpiWgVNSKVOiYAcfjBG03mnaP67DCiHlg
         AmGZW9zrQsqFuO+6hrBMof3u/r1ArjxdRpRRfl3gLZLWc/YpPxtSmcQDOT4LamAWwq16
         usSBCyk6kO7R+4Sxx8ubFUzHN/k5ES5v350KFysPDTtpK9zZBEUJR7MLMYnzkDfUmDZa
         qSDbEWayDoX35ijEMEFhf8hSB/EV7O+TcQ/TTtvtC4Pfek1PrPqs/zAZHUT/8miw8iea
         F4hA==
X-Forwarded-Encrypted: i=1; AJvYcCXAW4ADfR+bniOcUHaFtSa9TLmPdzAFh5xKGN8ZXGiR5Konumz58C77eaCi//AFuNaoyJ5X87NsPSDBlEJcVn8=@vger.kernel.org, AJvYcCXw25y6fGqHieqSGURg26z9cwqKltVo/a8OXxCT2Vsaef8hpzxJceog63uQqHV72dn5bcO506qZbZ42mp4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzllbV0myDRHs61gJrGgiaRx9vK9uEw/ft75P/A57DmEGJ2Im1o
	NXZStxO0CXg/GS19NHUcvRLce1dxdo1us43mtlCGnJ+XdaBNXzXiBez9lRuC5Kmv5bfW7/zm4P6
	Evak+IzeRJ6IX3LwOqdJK+p4g7mU=
X-Gm-Gg: ASbGncvrTZnn7FNCkLRE7hLOP3FatwWjqmlFzCQJf85ER/2AmLAfZK5AXniCqm2x11J
	ZK+pnUQtMZA1ffXg/6ljDky/KkivgnXYlTPfVvCOym2R+doRqdGSHmQm1xEjtum2+PtvBDC+2+C
	MkdfC2r1DNJXJuw/cMNatWE3E028jGjNci
X-Google-Smtp-Source: AGHT+IFqnhPLc7BpuUyxCTgZ6K4J4HM1398y0FUsixh0asR5rKXBVFePHUSy8tVngDrGd69+yBMwNbumyyFje7gECu8=
X-Received: by 2002:a17:90b:1652:b0:2fe:b972:a2c3 with SMTP id
 98e67ed59e1d1-30a4e42fabdmr5782880a91.0.1746387709543; Sun, 04 May 2025
 12:41:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250504165612.86459-1-contact@antoniohickey.com> <20250504165612.86459-2-contact@antoniohickey.com>
In-Reply-To: <20250504165612.86459-2-contact@antoniohickey.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 4 May 2025 21:41:36 +0200
X-Gm-Features: ATxdqUGqZfuaKFhtmR3Uuslno3VkapNdyHJ-MZ3SAnQPBK-5NKEE2Cs0yd4AaZc
Message-ID: <CANiq72mvu54B=U+YCUmbFctj_wXgF5zjeE-BB-vHVnAP+3mPcQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] rust: kernel: create `overflow_assert!`
To: Antonio Hickey <contact@antoniohickey.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 4, 2025 at 6:56=E2=80=AFPM Antonio Hickey <contact@antoniohicke=
y.com> wrote:
>
> +/// Overflow assert (i.e. runtime bound check).

Probably this paragraph can be removed, since we have the explanation
below, i.e. the first line/title is enough.

> +        core::assert!($x <=3D $y, "overflow assertion failed: {} > {}", =
$x, $y);

Interesting!

I was thinking of just allowing any expression here. I can see the
value in printing the values, but it makes it a bit harder to remember
the comparison and is less flexible -- I can imagine we will have
other operators being used, or even things that are not tested via an
operator.

Perhaps we could have two macros, one for the "any expression" and
another for the `_le` case, like the normal assert has the `_eq`
version. Though we probably want to see the use cases first before
deciding on particular variants, so I would just go for the general
one first only.

Speaking of use cases -- could you please add a sample second patch
with this macro being used somewhere? e.g. see the linked email in the
issue (it does not necessarily need to be a "real patch" that applies
to existing code, although that would be nice).

Also, please fully qualify the path (`::core`) since we are in a macro.

> +macro_rules! assert_no_overflow {

Shouldn't this be the same name? Does it work?

By the way, would it be possible to have the `cfg` attribute inside
the macro, so that we share the docs and so on? i.e. to make the
conditional compilation as local as possible even here :)

i.e. as it is currently done, we can have mistake like not sharing the
"signature", and the generated docs will not have the actual docs of
the macro if it is disabled.

We could also consider using the `cfg!` macro to force it to be always
valid code -- not sure about whether we want that in all cases though.
The standard library does that, though, so perhaps we should do the
same for consistency. If someone really wants to skip it, they can
always do it on the caller side.

Thanks for the patch!

Cheers,
Miguel
