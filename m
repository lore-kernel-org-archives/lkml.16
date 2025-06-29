Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CDA33985;
	Sun, 29 Jun 2025 19:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751225475; cv=none; b=SjYT+zBYLokqsBnkXvj9+IAuc6z3wiSClBU1ZTklU0rmh9C3pRxUdxAB/Lv0BXFeFZe6iwW8XOD3dOq61emECGeWL+3mk2OuKd4OUQDjxbnNrjD+bCsjR71FYRHD4INDX6pRvYdDGnFEEUSH525DaXLyDHpb2QzpSUoCDf1IvVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751225475; c=relaxed/simple;
	bh=OGp6vfw1QHdMT5fM9uLZJr8DQqgKSrwVaEvu6EHg9HM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EUU6cxZAtzNdeKcX9qGVchOS868xq4+aGFbHZU8/vgi7QxfGg5OyNWvyL8XGtqE3e8LFEWoi3eSCHu42liD8QN/Hu5fVjOwSVMgm6BQrlAp5jdkh4xRolef6S89LLtkMbJc/ILkdRKs1hkcKC6g9sxFknTId6ZzIfrXwmqXJ8co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cbw/2y+0; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cbw/2y+0"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b34b770868dso459215a12.2;
        Sun, 29 Jun 2025 12:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751225473; x=1751830273; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVp+c54/046unhQwFhUIeSno00Lzx8KKU3AbwMxIluc=;
        b=Cbw/2y+0EkE8w5y5OferT5gU3OwstCZw2UATydcinnTW/Ae/lsMZLIsX/LuBmuTalT
         Qqot4dGHenK2Xlz6+UYhOWi2YeTNh52PO5LH7d/Q+vrVsFTiqGDF2mkJwRjLgj8eCSdY
         yQNWo9PU80S2v2nMdIGjuKXdt75SUYmfEFPAFGB6mGOJoUL2KGcpJ3onBXfF1W3Ds68D
         r+Of62vZh+ABsJUBrNaeU9C1lXnD1fV/q8tYZa3lci4/DJVZBPevkIZnHim2QmUyXRSZ
         giKkCOYjIFznR03HFwe2Q2f3E3veQK8FLIQDR3xgZurtBS+hyZXWL/sIvnvvGQ7no/al
         Al8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751225473; x=1751830273;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BVp+c54/046unhQwFhUIeSno00Lzx8KKU3AbwMxIluc=;
        b=J8A3gJw+VXN1Uaf4JkGsHgcV29SbF33BOaFX7HKbBQ1FxbYrCUeOsPHG68u4ERc9L+
         Nw6dMmg67S37U6UMWe/Oz+3Ta4n81nq16rBwnbitjrUsZar+f7jdoFNZ0LVEhkd/f8ZE
         I8d7hdTk/U9uX6FdzWxzCvpNrEH55eRAwaMdJgr0KXCvDiA+bScENiXpvkjbb2yS3eGL
         ybyrxOiU1nMZ2XqWmiE8jmWrFoSRJv3gzl0ngpvx/1OVfe2mgXACICqF3dy1D+IgJNO/
         pPMTOACfdov/7dzF6WWeBRuJmQqyKL4s9I+vVWwnoYuj2CUCrgkGy0YfQMH/lYHOy+yU
         YoEg==
X-Forwarded-Encrypted: i=1; AJvYcCU6BLOD5eeD0YSxFKgkLRGFcIF9DnHa0DkkPwGlLKitxMyoJwFotfEDNf1QoKwH2LWC8/yMQZ7245qmJVE=@vger.kernel.org, AJvYcCWUeJTAnfhJKcK86ip2LMWxCuM7GFihS/MF4SXiklcDRt2DmMHokjQBs72EqwvC1wBHoK4Qx/RLujwh/6qfj/I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyocPnpwTBuXjNBBLF/5rzPtQ166Ec/e6isrfPYyyZdjjpqXA8+
	EUglsFp9jMcmkySN9qL5sCRIkqPl+vLNrHdjqdDB8X4YKIh/rUzZywFNRiXlx4d8m58KEgX+w+x
	LwTyERhDKQDwUwNKMeTB6JFYriQmjPlk=
X-Gm-Gg: ASbGncvR4RK6T5ef8JWKwNruKq3OXff5SKcdQLSE/du624VqaSCXdEFukgeQ6zzBD+N
	FBgNWR7Z0+hcjledJdB493nguFJ9QK93SdKKDuVlrXzNIAmxpjMH+lYDQhVl3D+/8n91lFRDK7q
	h+hK+FKY7QFVgfzuhm52rNHEDrYloik5enoAJChrOB0vQ=
X-Google-Smtp-Source: AGHT+IF9JltI282c3eQ3Q6Ae654ur+PoVB7wqYGQoylGYD35rwz70CBn5ZCWuQiWV33PV5fvoksZukiBOds1jW6cfgg=
X-Received: by 2002:a17:90b:3846:b0:312:e987:11b0 with SMTP id
 98e67ed59e1d1-318ec43d8bamr4107728a91.6.1751225472974; Sun, 29 Jun 2025
 12:31:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250628-rust_init_trailing_comma-v1-1-2d162ae1a757@jannau.net>
In-Reply-To: <20250628-rust_init_trailing_comma-v1-1-2d162ae1a757@jannau.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 29 Jun 2025 21:31:00 +0200
X-Gm-Features: Ac12FXyoGPPSOX_-6d0h3tX4tg3i5B41E9--4iewRQDOetQW8kV_ZCJuzQO0KHI
Message-ID: <CANiq72=o-5Gtw26X84=k0KK0sn+EyijxgYq=E2+Mw2+U+SOgaw@mail.gmail.com>
Subject: Re: [PATCH] rust: init: Fix generics in *_init! macros
To: j@jannau.net
Cc: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 28, 2025 at 1:36=E2=80=AFPM Janne Grunau via B4 Relay
<devnull+j.jannau.net@kernel.org> wrote:
>
> From: Janne Grunau <j@jannau.net>
>
> The match pattern for a optional trailing comma in the list of generics
> is erroneously repeated in the code block resulting in following error:
>
> | error: attempted to repeat an expression containing no syntax variables=
 matched as repeating at this depth
> |    --> rust/kernel/init.rs:301:73
> |     |
> | 301 |         ::pin_init::try_pin_init!($(&$this in)? $t $(::<$($generi=
cs),* $(,)?>)? {
> |     |                                                                  =
       ^^^
>
> Remove "$(,)?" from all code blocks in the try_init! and try_pin_init!
> definitions.
>
> Fixes: 578eb8b6db13 ("rust: pin-init: move the default error behavior of =
`try_[pin_]init`")
> Signed-off-by: Janne Grunau <j@jannau.net>

Applied to `rust-fixes` -- thanks everyone!

    Cc: stable@vger.kernel.org

Cheers,
Miguel
