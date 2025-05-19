Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B37627453;
	Mon, 19 May 2025 18:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747678138; cv=none; b=PzrBX92FVW4LCX3yEbnP9JH/1oOiUpkCD1FuobNopH7+Wn1BHtDXiAQ/UcyqoVCohoWS3gzo9fe6+Uqd/WTs/KEHGeGEeHrJr3xO7l1lg+B2pSQXy4a2ZV5pkFH9uQ7K9cBJ/eRH/K7SQrPhWXDYSkr/GKJQOsLf3Zt5vO5QmCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747678138; c=relaxed/simple;
	bh=JbE03/Q2/LmhajuKXaRvpexgYr2FUkGKuhsLPhxmzJY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EaIlzs+On2dIjJJ4ZNfcj8Lok+zvcRaNUZ9iTVTtqG+thSGkAnhcxp+T80SJxQAEcrSonCBBNsCJJ0P0M5lfQuu5GCG7sFMKvWyfW7NZRKTzMokrhG5itHX38INMbLPk8ZebcbwQ0EPqIvByWCOtm97MoQbjtRrt/K2RIdlu/WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gG1uMeiy; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gG1uMeiy"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-231f39b1b7aso1485025ad.2;
        Mon, 19 May 2025 11:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747678136; x=1748282936; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JbE03/Q2/LmhajuKXaRvpexgYr2FUkGKuhsLPhxmzJY=;
        b=gG1uMeiysx6V+FvB+urq9W6tF4HDDkLuDiupsDlyb6YHx41/iY2RGf6RoXyUzt5AoQ
         n/O0Ji4r/2JWQDdGP6ItpWQySvcTWMvQsKLhSov0tpgHRWpP2gvDHEYFP8LASknUBBDW
         gtr+Muvo8Hq634XH7yiTvD17lpynBKfIgLSC8XM0WS5O5/1xtGMETAsRHl9s1UsVHBGv
         QklLvb0F6XmYirWvr+djXGV93oJ4r7Wo8Nzvw5cCMakHngYYev74/AzCMy/A5RnScB7I
         XI5xWzfkMR+hw5KKyiExPRZS+VAHrZwwUVy4aSdlDChpekufFhJ6iZigzB5oFe8yr5td
         y+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747678136; x=1748282936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JbE03/Q2/LmhajuKXaRvpexgYr2FUkGKuhsLPhxmzJY=;
        b=iQi8ogC8asotrp0kfY612/0zOPyhYqbOT3AsnE53+YENGts6nx3uGt44PM3B5WJeN/
         AW96TwYj8pXgOpfimaOrDkCnXV54m8A/mK/AHz5rZbcpWOqqsr5RZU4SmOAEt6B5aWUT
         JlFQcjWcC1cNXTN206owYgTE81+Kv3neoFjrl8P0FMY22h8NEf4ql9Iidzx2LEy9KCS5
         0IC5ppZrW13lXcrwcKebmiZdMk8mnH2SbXWZH/LT8UNj06T3M/0VFzMSNywqvIiuCpAm
         IkmYFIXIS5YZfLN+6wwpf17tEpOE2IQCfP1dFahojrzE1cOvX5l/ZaRQKPydRtjYdeoc
         kDfA==
X-Forwarded-Encrypted: i=1; AJvYcCUHEAZDZTsNGAUfy4PW0pgpI5FsrlgPPlL+ijJERLoRbdQJPpaMrt/w3wgW/qUPcxGgQQZGeHW8oSSNtlw=@vger.kernel.org, AJvYcCXAO9X9P+hm9nIq9+Xw5d2TlsuwE9py/B7jru9sj/zZ+Tozx5aubrLufKktcJSN6abLUKfnzGrLSUIb1KNNExI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvW00fFsgcII8RAKK46svPnAoX5L92eUr4L7e/JnLfT47PmkIk
	FRGUUeAOPc/SgVnmPufZLUIWsrJrKzWawV45YmHzZWucp/ETv8hpgTFu7T0Eu3BkZ/RDuHAJ+k2
	2Sr6V6zv6Y6nPLw3VWF9OjrbEfhCRE6c=
X-Gm-Gg: ASbGncvgRV7ED2+VuiFmZJMkzi8SAJ5xT72carcPtxBNBU6A7L1IihGQ6G2GRaq5Aab
	v+imYYcb1vZ2w0Gcqg3kmcU3VcwYHc9ywmVtQvfabvmaAUnM10IrZGAWEwhwV3QE/c9T7ViHiE2
	UkL9so7XJ/fnqNsvRE322WblaH752ymDivGIdxqY2cgw4=
X-Google-Smtp-Source: AGHT+IEi4SYGBmAI9K1fWq00zmyMO1UW86bb1P7ysCjJPKIDBdiDiWw8fVFzf8Ct5gTDVJ1N00zeinsmzKy6Fw9ZOlM=
X-Received: by 2002:a17:903:2b10:b0:22e:7913:d360 with SMTP id
 d9443c01a7336-231d43d0c8amr71258905ad.7.1747678136616; Mon, 19 May 2025
 11:08:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519124304.79237-1-lossin@kernel.org> <CAH5fLgj1k6juFMoBWeeWgdkF0UDewF1=VThj-dnusXwjKGFnSg@mail.gmail.com>
In-Reply-To: <CAH5fLgj1k6juFMoBWeeWgdkF0UDewF1=VThj-dnusXwjKGFnSg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 19 May 2025 20:08:43 +0200
X-Gm-Features: AX0GCFsplH6H9wPx6R2-7TpOp7s9l34G3QDWiP2nXuAO1gYFQ8672FI2LGwZMIw
Message-ID: <CANiq72=Y6aZwZpQwKHFq2D9H9qFYH-b19SJgTRyUZA18UZvjfA@mail.gmail.com>
Subject: Re: [PATCH] rust: types: remove `Either<L, R>`
To: Alice Ryhl <aliceryhl@google.com>
Cc: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@gmail.com>, 
	Dirk Behme <dirk.behme@de.bosch.com>, Kartik Prajapati <kartikprajapati987@gmail.com>, 
	Aliet Exposito Garcia <aliet.exposito@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 7:30=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> I don't mind making a custom enum, but I do use this in Rust Binder.

Yeah, Wedson added the type back then for Binder and kasync from a
quick look -- in those times, I see it in a few places only, e.g. in
`get_work_or_register`. Do you have many nowadays?

i.e. I don't want to add extra work for upstreaming Rust Binder, so if
that would make it harder downstream, we can live with it for the
moment.

We may want to add a line in the docs to ask the potential user to
consider whether a custom enum would be better nevertheless.

Cheers,
Miguel
