Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6035613B2BB;
	Sun,  9 Feb 2025 16:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739118572; cv=none; b=SVEbdzQ/gLAHiocqSZKl5PF8qqpd7EMoyQCtUH+28X7j10VDRtf7+T7mgr4WgpiXoUPk1jYX8qpvW4b3paKTW+T+xqiqAWFzAJBAQGGL/JwV6uU6vNKq328RgTRUGhDpscjIuUpawd6vODh4Z4YphRQxhRHLZVW+W/QWisyn2TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739118572; c=relaxed/simple;
	bh=V/Izm0Vklu1n3y7lRqgq5V3DCUs3yZvHN2Ducf5PqJk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lvT8RVW0sZLFa8jcX3dSIDaDSc4epZhrkFvtswjCMspjspFG/SXwpJTatq87jikLlv1w1ag5PwPnGofRP0usP49Ucf/mtOVnYDQ31fzd71GDxtUh0RB1JS7DKU5Te3XNd7A0EcwelN86ezVEVXpMcjHi9dd/QTKXCaqElrNul7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fzkCvMzM; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fzkCvMzM"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2fa200c3d16so709187a91.2;
        Sun, 09 Feb 2025 08:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739118570; x=1739723370; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V/Izm0Vklu1n3y7lRqgq5V3DCUs3yZvHN2Ducf5PqJk=;
        b=fzkCvMzMhSQKnsI+fgif1bd4+5fMy/VjthXq7cSuNj7VC6/lmK2+gprpQ6EWH10qWP
         bZlIncL8bOJxoa1pOIqMNykwZmw/1qeweVFXlRsePTJehxeb9M/K6i+aOfCx3QnuOKXt
         1lrPfSnNFyzlbbxkhz8Vm/FQadaAh4XxSSA3mYyoVeuiEBaAT43pHMo4riPYTHIi/B/K
         smej4IdyO+jSnu6tR96Rvx3oud4h7thFS0LGavt6ItKURjRFLrfqyDpNeItTeAVDgC76
         RYRC+qpu/5tIqBgQlab99C0WnflFnJqLyt5qJLzlyGAHody8tKnh6Lo2m1kcetbrzg7t
         Sxyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739118570; x=1739723370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V/Izm0Vklu1n3y7lRqgq5V3DCUs3yZvHN2Ducf5PqJk=;
        b=cYZ10fFDNlun415Lx8GOjxJikFh4M8mjmfYua3Z5zp8Tf1pV/3/0iouY/nATJ5OfaM
         P0d73il5gajXrG7Ov1P/AfcodHxBUOgZPefRuH9xwUWE7TO5as46t3JdJtcQd4GCkfo2
         Ooeug6o/CtVO6QbfR8UTTbFN/InCefRBsJFm98dZjm0/4VX1R1zZnqLMLfQHckfF0VdW
         soeIOn5+bLmGLOVTgpqVI4SP9ZRVgSiS+YKPmCidEmVSRK8TLP2LVDa1aqCFmGA8VMLS
         oBLPIH0u/PYOM8jzxvIHUH8XjkEDKA+CN3JMbWnjIXRdaUSYIymkag8+NIbpB4N7vG8T
         +osQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYcYdYzeHtH26TZ/ArAkon1H1neivTgIk5oUb4PqScOaDQAeBVFFyGznQNYtwyU7OfT3AG1ai23wNww7k=@vger.kernel.org, AJvYcCXiab+ieXUrFsbg5vz7OLBFS+eqRpw4qyz/cqwDKhMClYPjiPIk4j3mOCalLo649+abijGL6jafJl6mF/JejKM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYQ229mhQDB2isHTF9pJOhXwUK5gDWj4ANOT3AhcIHX/Tcr4My
	tVHjXHQmsM4m0+Lg3OWIx6RCLxGEcVkoGfB9dcGTVFeJxUEIKFDo2ioQ+gBG9qdLBrv8zvuRjQ5
	lUobnlebX/4LBzebb7ETTXlh73Jk=
X-Gm-Gg: ASbGncuKw1KIdkeJ7SHwuGWsQgeGKAJasb5Xz3gYabSjZw19vj/QtQgflR+fSx5kcET
	9HIAMjdWZel2ANJzRcCR41WUB5c0RTCCeMgcxlFcfTF5SB9Qy50DLuoMm4b4UM9lq6k0ZdfNS
X-Google-Smtp-Source: AGHT+IFFSJe2fVyly1/Khkxn8UlEA0WEOLzeJb69Mo75vrKqYW8qxHPYQ/ty/UY4owPvoTZyNTCtcRQs4PN0iJg/aIw=
X-Received: by 2002:a17:90b:2f8b:b0:2fa:6055:17e7 with SMTP id
 98e67ed59e1d1-2fa605519b6mr1998093a91.8.1739118570498; Sun, 09 Feb 2025
 08:29:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250209-rust-analyzer-macros-core-dep-v1-1-5ebeb3eb60a9@gmail.com>
In-Reply-To: <20250209-rust-analyzer-macros-core-dep-v1-1-5ebeb3eb60a9@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 9 Feb 2025 17:29:18 +0100
X-Gm-Features: AWEUYZlO7HJcjNtv8vwzwRlePKcHvsS6f75U4V7whsgBMkdxnwq26fSBqI_l-9k
Message-ID: <CANiq72mw83RmLYeFFoJW6mUUygoyiA_f1ievSC2pmBESsQew+w@mail.gmail.com>
Subject: Re: [PATCH] scripts: generate_rust_analyzer.py: add missing macros ->
 core dep
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Boris-Chengbiao Zhou <bobo1239@web.de>, Fiona Behrens <me@kloenk.dev>, Kees Cook <kees@kernel.org>, 
	Wedson Almeida Filho <wedsonaf@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Chayim Refael Friedman <chayimfr@gmail.com>, 
	Lukas Wirth <lukas.wirth@ferrous-systems.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tamir,

Thanks for looking into rust-analyzer, it is great to get improvements
in this area.

On Sun, Feb 9, 2025 at 4:29=E2=80=AFPM Tamir Duberstein <tamird@gmail.com> =
wrote:
>
> The macros crate has depended on core since its introduction in commit

To be clear, `macros` does not depend on the (kernel) `core`. But it
depends on host crates: not just `core`, but `proc_macro`, `std` etc.,
which is why we can use things like e.g. `std::fmt::Write`, right? I
don't know if the distinction matters for rust-analyzer, though, but
things like their `cfg`s may differ.

I also wonder if we should also be passing `std` etc. given it seems
we need to pass `core`. Does it handle correctly that `Write`, for
instance? Perhaps rust-analyzer allows to pass different sets of
crates for this, even if they share the same display name -- then we
could pass the right `cfg`s and so on.

Cc'ing Lukas and Danilo who have been looking into rust-analyzer
support recently (Fiona is already there).

One more quick comment: since this would apply to all proc macros,
should we do it for all proc macros? i.e. instead of hardcoding it
here, using instead the `is_proc_macro` tag we already have.

Cheers,
Miguel
