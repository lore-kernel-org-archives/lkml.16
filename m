Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA6B1D8E10;
	Sat, 28 Jun 2025 09:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751103096; cv=none; b=TTRgLaqaCj3wP2x1JWP1v13MfdZFR1ssbAPiVr+jD0hjRnXiRCYd8vXj2QWFSzmyg7ZOU7sHHqrsCCtmJCpiYvVz0d96NXAk/Txb3yM6ATfeS3IBKM/mu+3hjXMk+bL+8pWbHjv8zJDPj0zhd2WvIU010HGkDGxLwNrap3yAMKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751103096; c=relaxed/simple;
	bh=E5iCuFAULJLPrvVBqO60KGLnFgeUgbEq0Y2AL6LtYPM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=erZWZZDNLgnteTL8gKM26WQTssHjm31XdiwiLpKFvqVFX8BL/JPVRruzaVYi5mhd3I65wW751IOQWa9gf35FyE+pe5TufUgGH0Lq9QYas4P0oOwfdVNavhZIYoG4I6kZRKm4kWy5SplEstqZElsVglG+z73gfYg3V3hCs9WglVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DzlnGq3L; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DzlnGq3L"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-235ef29524fso4360675ad.1;
        Sat, 28 Jun 2025 02:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751103094; x=1751707894; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ONfV0fUcGhjneIypDLDcXnbButNtqOzxMv+hhdKx7Ks=;
        b=DzlnGq3LORhLA4fYeI1W9Cqa47bvAbgNajdAHVRLUYzsSeyuwKiPYgnzUTxWejbzGW
         kfYwQ5Td5wdAkU1eXvNMa8Q6M4Yz+SZBMSBH52NHTBocS//MeZkKPGHwekDHpA7aZ/z8
         Ydpw+bR7j6NYmZpl2WN9NiYKTp6i+Qqegg17RpR67H+++dlLsTYy6ETdXkmzhq1YjXvj
         GavjEbNvFDFitKwUaSxTk7Dc4uGyevK5e+XaIwW6+m32fpbKytOzIpgvDINn0kvQ2UfI
         dflwh09MC74vNUoRjXWCnLQwfljDTiuY8B5pR2eVwgR967c/NSV/QTF+JGr36rsEhQ/O
         5FLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751103094; x=1751707894;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ONfV0fUcGhjneIypDLDcXnbButNtqOzxMv+hhdKx7Ks=;
        b=IY66XJngUYGELFYQCJv4T8xxu1oJ3W3+yH6P2ehLyQX7SuXTZHwFU3vzojMYBWYIgH
         a8hTxaWzADfz/NITk2dttbEq2BGF4f2xfUje1aIlxBLXYR4KYFcKWp1DplyOsZCOhKMj
         V0Va6CX1fFXwq5deTZna944BEoOIkP6fj0EyI0b1x7KzSBQSsDcMzuevz/iThFBN1eC1
         rQtf7Rq/ZaWMQNq6pw+qwPakB6wttCVqzZfkv6ZsRl6hlZnw+C18jy8SxZYzXXqKie0V
         3vEub12j1Jx546KvFEsj8HFRL/KSYVY/R2V/MiNoRbAJO3lJRcmQWRrnSYWiVS3VWnkQ
         lRtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEmj2PugbLiKDh6Pozwu0DXkp55dEFfAabtr/P/SP6zUoItIVpIzDuKJNsN1YJlJTqfBk2Zg0mHTWJJm4AP98=@vger.kernel.org, AJvYcCVL8SNKxZZj3quPuIUbuBW1DaxVM2JwBjrZSymvkG96muIY4KuBxgjUT+YE16byiMqPTGl+CCmv8+FnzDI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2Z0mGqUsgowzIgr+HIAznW/R94zGmGin7GrT8LgUocl9PeeVL
	l0qaqYDmiKH6BbpCUtoIgOHjCrSZoRB949uzDhEWdNqkd05TKeLvjdrl553HeqwE1XmKnWnX+Bk
	1aP25Aw7gne/dc4Tn0nlouGMmL5xR/pw=
X-Gm-Gg: ASbGncvhoaC60jOxLGAVcCWKB2ZRhqMS1cq1AU6Zr4cXLy3MOXj9JcoloCwIhPiAkJa
	RD713zNzUgiKU5JWOtXJLa1lrEXIxnSS4xyooYoi6EUSvAl47fzCwcgjblGjhkGpni+qOWMEUmu
	GoMmsXo5t2w3l2UpTwPPv9/+uAVflgXRgESdgDPVY5240=
X-Google-Smtp-Source: AGHT+IGCL1ZwnkZbeKMkXvofitTo9uX9H0CCoXKQQY5hQuH7wk1pXGIhr5xcDOJ2eKhuRox+kb1wdEabGvobYiOsvpE=
X-Received: by 2002:a17:902:e744:b0:235:f1e4:3381 with SMTP id
 d9443c01a7336-23ae898f701mr13555125ad.8.1751103094322; Sat, 28 Jun 2025
 02:31:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627-tyr-v1-1-cb5f4c6ced46@collabora.com> <aF8lYpK_l2I-ts1k@pollux>
 <9D9AFE08-2CBB-4A89-866D-512D9080754C@collabora.com>
In-Reply-To: <9D9AFE08-2CBB-4A89-866D-512D9080754C@collabora.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 28 Jun 2025 11:31:21 +0200
X-Gm-Features: Ac12FXxAXZ-frqKyQFue1u4JXDf34d02QnAAv4yImOCi7FZMfCJpz2L7ro96pf4
Message-ID: <CANiq72mgt4ZD43Tm2bFr-gpicXMhFbC2DLqA6F0rN_J4rAe_CQ@mail.gmail.com>
Subject: Re: [PATCH] Introduce Tyr
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Stone <daniels@collabora.com>, Rob Herring <robh@kernel.org>, 
	Alice Ryhl <alice.ryhl@google.com>, Beata Michalska <beata.michalska@arm.com>, 
	Carsten Haitzler <carsten.haitzler@foss.arm.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Ashley Smith <ashley.smith@collabora.com>, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 28, 2025 at 2:13=E2=80=AFAM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> Also, for some reason the Clippy lint did not save me this time.

Hmm... it should -- I tried to build it and Clippy reports it. There
is also another warning too [1].

I see the compiler reporting [2] too.

By the way, do you need to depend on `CONFIG_REGULATOR`?

Thanks!

Cheers,
Miguel

[1]

error: this operation has no effect
   --> drivers/gpu/drm/tyr/regs.rs:221:16
    |
221 |     (3 << 2) | ((w as u32) << 0) | ((r as u32) << 1)
    |                ^^^^^^^^^^^^^^^^^ help: consider reducing it to:
`((w as u32))`

[2]

error: variable does not need to be mutable
   --> rust/kernel/regulator.rs:295:29
    |
295 |     pub fn try_into_enabled(mut self) ->
Result<Regulator<Enabled>, Error<Disabled>> {
    |                             ----^^^^

error: variable does not need to be mutable
   --> rust/kernel/regulator.rs:324:30
    |
324 |     pub fn try_into_disabled(mut self) ->
Result<Regulator<Disabled>, Error<Enabled>> {
    |                              ----^^^^
