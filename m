Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0AB27701;
	Sat,  7 Jun 2025 17:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749317414; cv=none; b=ZHcQ5NT0/6SPZ4KakbM5wTUE5vDU4gGt4BOwhWtvf3EMwtmoD9NKDtK3M6U0d6YoGoeiAfU2tMYF2Ls3VR+F9lBZaswyfQNu9M+t7MXqHbxEAU4DAftfTWp1ZGcq7yZ1lsLvT5e8Mf+peYxqucVubQiHDYgHPC4p1t1XLbVENyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749317414; c=relaxed/simple;
	bh=MQOU7l2cx3SHiuDw8nyBBHo3E+QNy4slI3HRd/JtkqA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZX51IZecqCzjJ1ZAcxXkrBOVgRvHjSWzsS67DlbvkBx/9R6xiBOq3hSTFxI2CkzjKW1C4kVmpzzcKbfjMQ+LQGOND/3axjxj5Km/2cY4sqlSArYwyh7LDTJz2K1SxVdG8mn46chu4iRFG70t+vLhtUSFHdIE79BUI+oyaGhBlOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IGpqQwPL; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IGpqQwPL"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-234eaea2e4eso6100065ad.0;
        Sat, 07 Jun 2025 10:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749317412; x=1749922212; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SgTgHY18dt2liLRFlknBAGqvHYk7BlhIxqapQNOn4CU=;
        b=IGpqQwPLEUY6Jr7KPnsqmIDaJdYU+ezB7DdBioQ3q/8Cyvkp+iNt1lsv/ZPIYExXb6
         ALwHU98SQDb2uq4/zmJ//lCzlUZMh2QYmLSK9LCQhwtXQWIuJgruvIGtgpERK5VlorWw
         D7n+fALbAqyD8qMkwbNo/Nfb84BLydWX6wZBvr/Z3QeqywCo4QgSeUaLSsssUvXNS5qu
         2EzPuwFBY/b6RYp7WqwRvei68gbam+Ojs2s6u7P6M0K+msq6oLmc9zNj0v6C3qwFqdSK
         X6kKcwElFU7lEoBvnui/rd3BEQ5ENENtqGchinTTIN18lhiS+w9cWpBE05mRK62ddIeg
         KJ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749317412; x=1749922212;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SgTgHY18dt2liLRFlknBAGqvHYk7BlhIxqapQNOn4CU=;
        b=GnQ5f97wqxDmMeoKtLMnxS5gmoNxSdqLnCe/2/ZgA21Udh8OtAzL8q6UlX6cBQlBrJ
         VZ1ifyUiuP2WufLfw08czvpwW+pnWLfQxr5AxIvLRwuO/kpU5sSaBdW0QIjTPxcizCAG
         RWguOJeHoPNmd+wwYmT6HqtTDS4Ktg4soVyUJy9qtS4C+6WM9wtr3RYveF2OA+ic4RYa
         LY9BckK6YPD3LGbWEIUasAV4BneBJPUVoFZzB3+wroq708XQ/RiyU1Nc11yQoybnw80Z
         TaHW06viBaERempRoQPsKpUiIjzmd++nv2WEGl+LvnMjc0dZEkqxCsFYv9MFlNA/Q9ol
         mTZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVieo86q2x8sCJyttHWbmP0j45mDPz+jpIMBSqwUpd3DNeQ5HkcWolagOrVwLhYLlauuafcduDrhPNwA8rCigg=@vger.kernel.org, AJvYcCWONg7g9r4q02ZDkgUu81kPGY92+Gcxf/7TKkvnKvukl18mzccqQPoZLPAgpvUJBOam+iK93DCL9VHc9FM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw35yiIjd5nnFZsdJR4lv8x27eAoGq4Qp8QpBis+zgxqxM7iC6k
	b22bU8H4vUYNS6hJCb6/u+6tPsdl3Y7tx9EbvlxNZzz+blvWMNi5v66hn1l4RuKJ4wgzfFfl1JA
	UJIt6N1G8Kq2DSu5unAi7C+T7By7qAsg=
X-Gm-Gg: ASbGncuAT2WnNzOdPCfq3/i1PRuEg9+DhsMRnKDctIwkLRL0T+JH5VvPT0yKy5naR/F
	bGSxjeaG4eK81o1nlUOU+c7uMqX8CCgcL9zWKE6wV6AMWAeKFvpR5iAAZSETsocgJEIP+xQK9+Y
	KehQ/ESGeiRl7NoAHpwpbv9D1FRS9w8gddK15DEi+37nQ=
X-Google-Smtp-Source: AGHT+IEm0yjXOJDa5eds6aHFGoFFhtV8DN3HhMHPIAbaFWcGyt7Ue2lJywv7MwY1ywZwG2NwQ7hR/vhaTveZOBbXRlo=
X-Received: by 2002:a17:902:e747:b0:235:e8da:8f4 with SMTP id
 d9443c01a7336-23603f3e0cbmr36151335ad.0.1749317412118; Sat, 07 Jun 2025
 10:30:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250607-assert_sync-v1-1-b18261da83e2@gmail.com>
In-Reply-To: <20250607-assert_sync-v1-1-b18261da83e2@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 7 Jun 2025 19:29:58 +0200
X-Gm-Features: AX0GCFux5E5KubM3i4RINJNlkco19Iy6NpGai6Hl9hPEKLbH0NYwFiBQiJKBB3Q
Message-ID: <CANiq72m04yAwxtMbctCpiDpYzoMHpiDagEJsvHHJCZNJXyJ5KQ@mail.gmail.com>
Subject: Re: [PATCH] rust: add `assert_sync` function
To: Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 7, 2025 at 3:02=E2=80=AFPM Christian Schrefl
<chrisi.schrefl@gmail.com> wrote:
>
> +/// Asserts that the given type is [`Sync`]. This check is done at compi=
le time and does nothing
> +/// at runtime.

I would split the second sentence into its own paragraph, so that the
"short description" isn't long.

> +/// Note that this is only intended to avoid regressions and for sanity =
checks.

Hmm... I am not sure about this sentence. A macro may want to call
this to ensure something that is required for safety, for instance. Is
that the "sanity check" part? In any case, it sounds like the sentence
could be read as "this is not reliable for "other" things apart from
just sanity checks", which may be confusing.

Could we perhaps clarify?

> +/// # Examples
> +/// ```

Please add a newline between these.

> +///
> +///

These newlines should be removed, otherwise they will be rendered.

> +/// // Do the assertion in a const block to make sure it won't be execut=
ed at runtime.
> +/// const _:() =3D {
> +///     assert_sync::<i32>(); // Succeeds because `i32` is Sync

`Sync` and please use a period at the end. Also, I would suggest
following our usual style and putting it at the top, i.e.

    // Succeeds because `i32` is `Sync`.
    assert_sync::<i32>();

> +///
> +/// ```

This one can be removed too.

Cheers,
Miguel
