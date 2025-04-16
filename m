Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75236248875;
	Wed, 16 Apr 2025 12:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744806303; cv=none; b=StszW01FVyTLvTcvkkY3+pJql1IFQ1qMBnZoJdveoT1kOjTuqYUVsoe28GqJyj+nJE08PXETbW8R76dlr0nGx1aDSryGjEJ6zPvlXF6KgUu0HCiUftw8Dz+r24Qd7Cluy750FcaoZE0lb2VpUDU3MaruW8/PYz+IkyXrd8ff5Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744806303; c=relaxed/simple;
	bh=siPTUVsIzTBsd/qDjepG4taN8q1/zJrghO9TL+s207s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b+qz0iYkFwZZ5wj1Un/aGZMqKyX734ENYgWVkPfih1zrb5iCT59qB5U4iwFr4+hDrGfOHFQ1Oc79X3ww48V3VIQsuKbBtNCXMAxRVFIX/kolZ7yI1FtgjNJIgGfoiQJLcurRpJ9Vwgwd9+cc3iBTevPMGqDLgiAla/I2viXGH+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YmrS5rUf; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YmrS5rUf"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-308218fed40so951468a91.0;
        Wed, 16 Apr 2025 05:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744806302; x=1745411102; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=siPTUVsIzTBsd/qDjepG4taN8q1/zJrghO9TL+s207s=;
        b=YmrS5rUfVE1weMiSewMVBz2eADGuhbCQNT912OgT8aJFArh2/c2AuYIbQm88T4tl+Z
         6HLniWkLpdAsiD6EZ32VPtE2kiqFzSeIXVXOhY9YwTymmR4KOz94giyIVp9oWwA3yl24
         GFZItZn24unHGNb64e6jKMLEGS2S9x9Qy8iDskAFyVH5i46g3f95mIPIWF0e+THm27sF
         hcP+PVvPTAgSe3iNbOxHyfEQ94LxyZxhfTKUOGoeqt5Nt4VxKZO7zWEAaLQ2EzyKHIWZ
         kw9kGm6pH+3ZKmylb7WOE4B35NssiK8FgzhI859JnwqWuW7svCUv9DtjPQEoeTLeLASa
         T+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744806302; x=1745411102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=siPTUVsIzTBsd/qDjepG4taN8q1/zJrghO9TL+s207s=;
        b=m5QQDc5l8dTxzSOVERjwt6VPzCaypZ0y7dHHbBJ2Q5KcbIVlbSlQpYhP28LLoiC56u
         3ka7j+De8o3Cx/UyjmBpadxMMINCNs83NaAsdvgIfRZBDZh3LxKsf4TTZfJP3xgCMxyj
         CRFpmaEqYoNWodAluVsNe7ujG0ZD2R9MaggpLk60Oyid5uEsEipyUIZjJd2c0FTl6cny
         gcpz/rFm2DNFGzp1Oc1qR32djyeTKH+R3CFa4JpkXXuzlfubR0noNPUjjJpH9z5YIwfK
         iE02q3xjsyy1pHkI/Ebk9a75LqcmeS1LbyRh0jNcJPAKE87uOV2q+Pf4Eo6RjWa8vZFo
         oC/w==
X-Forwarded-Encrypted: i=1; AJvYcCWl3RhcCvdwGS6DCBWCyP0eCHoKVaUbr9T4dUuiD2P2IDlxidOLyXdpf5PV4NxfY6bEq+rQy9wpbStPJJJFJBI=@vger.kernel.org, AJvYcCWntpTavqH4RndN6wkTACDu+14cY2PXJgEkzfE7KtzmzMoay7x659rJl4RA0Z+eNkEfgFsDTt8SHgO9heA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKXbDhoXGqM7/X8OI8r2rG9wVtGXYHqu4keLejSkmTcM97L9Eg
	pcWoZ5wGocP94xZt+bW3w1QKnYdDr3cKOvcWJgPWQ0TctuZu2CpS1yY8vhosfN4hqhV5MMwtvQg
	yBAA+Te0DtyohKGTpH6eBC1ruF3U=
X-Gm-Gg: ASbGncvoP0szN3cJazfjPrzRj1GsPR2tsbGXsCTH/5Kj8ifX1xSy6BJ5XLdwj7MSspG
	aJZs2ecKTrze3nTiD4P+U67KD4FZBf2rL4bOLSYLRhcwPoB+5KpbAv05I7f9pIkqX59MTOLr/tp
	SQJuiA+WbxI2x64T+PT2nVmQ==
X-Google-Smtp-Source: AGHT+IEtX7+Mzcd7PaVlTQ/xw6YegGp6oJpy5FiA5NPzkNyVsvhcGyv02RO1C1uD2MXjywGXi+E2R+MmA4vLZlpoRfc=
X-Received: by 2002:a17:90b:3b84:b0:2fe:b972:a2c3 with SMTP id
 98e67ed59e1d1-30863c503bcmr961540a91.0.1744806301728; Wed, 16 Apr 2025
 05:25:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416122106.2554208-1-ojeda@kernel.org>
In-Reply-To: <20250416122106.2554208-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 16 Apr 2025 14:24:47 +0200
X-Gm-Features: ATxdqUFhmQ4ZxWk7yUIUSPcJ20pL36JoUN822yjRXlrDsVMepY9Ii9ArJvY4sQU
Message-ID: <CANiq72msZ7FUo0=KXQjMkXjfm3jVaNhhVDCu_BFXRTL_xC0vog@mail.gmail.com>
Subject: Re: [PATCH] drm/panic: use `///` for private items too
To: Miguel Ojeda <ojeda@kernel.org>, Jocelyn Falempe <jfalempe@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alex Gaynor <alex.gaynor@gmail.com>, dri-devel@lists.freedesktop.org, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 2:21=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> `///` should still be used for private items [1]. Some of the items in
> this file do so already, so do it for a few other clear candidates in
> the file.
>
> Link: https://lore.kernel.org/rust-for-linux/20250416112454.2503872-1-oje=
da@kernel.org/ [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Sorry, I forgot the Cc: Jocelyn (it could be nice to have a
`MAINTAINERS` entry for this one).

Cheers,
Miguel
