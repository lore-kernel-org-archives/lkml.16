Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CF22110;
	Thu, 29 May 2025 13:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748525433; cv=none; b=dByYNpou4dZOxQMn91oTPYHiWMW7hXyJy6uFOUWCbMsA4aVJ/cnlGmdaYv/AhYrDvGlIuOp+eCfueeI+bJZ4+e56AtrKeyPWMBM2LQenfnO4FCMpk9EipMlLDkaYkifKRwvrRHn4SvvrXV55xHMgaqzto2X85bn2umrVsj5gmj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748525433; c=relaxed/simple;
	bh=ZT7w7/9WqERVPhIfgjoGwgmM4JWQtA4HnTEcCDgG0RQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pIT/QqZBoy5sGES5adGRd1Q7A9AZZOCI7a4mQQXZZFSH+8kziIYr0+QoaYHDwQap7YIcCWqpaSrcf7fJpjJBYEbPHy47IihSRUBeI4G/Z6NnLRMU5o+iK29cgwNoN1QP5PpZDZTW7Fux+IadVD9GH1ZEIIUtl/xvhn/H3sx+CmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kf8M9NLI; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kf8M9NLI"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-af5499ca131so63561a12.3;
        Thu, 29 May 2025 06:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748525432; x=1749130232; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZT7w7/9WqERVPhIfgjoGwgmM4JWQtA4HnTEcCDgG0RQ=;
        b=Kf8M9NLI8wdrK27ygm84eDP++YTyyObdvcFVQSEie4DIZ1kE3nxsAg3haQsY1Rn2If
         MEB1OVlp9nGZK9WOxsZ6DQNIMrZ3K0mRBiU5rFptlksRHml3nwtGyL16DCE8B07KpbSu
         5vgZsyQIkbxZPAdqVCq01Kl2RYAb1YST/dxo/kmH6+99E7eNU8OIs4hqjv17svDUkilt
         hbKeyqoSmsDomEeMbDXdcWi/VTsxCn4AesvDeQgzbheaRaLg95JR9zkO1djWd4LPoOJl
         GIsVdzVEgBK4L2XjnXSPmetsEPjP9EKgGZ3mOIdUKqZHurIV10+vU3qJuSmbeofucR8a
         BnUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748525432; x=1749130232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZT7w7/9WqERVPhIfgjoGwgmM4JWQtA4HnTEcCDgG0RQ=;
        b=ww3My8vp3v3Pims1Wqp+zOf51NeAwchI8NrGE0MgHp6emf+Xw+lyv+pZ1gDBXohdDO
         Vahnc+B7gP7zHI11SSRjRqThBbzWPkglwZQrBsTIf3Pq+WjGiPnaW1TghjAWCYcgivgC
         lBd2t+NJyGKRY5QOtFWjZFyscMpBzsoFpc/gIxEzmB1udkqIpPOCQJO50LxNIfue9WR/
         cr6E8J1KPOi6b7u+GIHT3JtWQPL7j0VK5MoXrqvolRHpqleFtYfDsQW5qHxzsAU6eKpG
         av7MvX4g7pDpmRdb+IgoUiJy6tYdT6ywNiA9M6zOxVUoZynbyZSQ/Yp1vBTFzIiQrSlX
         V3vA==
X-Forwarded-Encrypted: i=1; AJvYcCWXwypJaLbdZ4OJUs7ne+81zfuyc+W7YlxPKg0fAexBmGMFe/q6XS+V63df3fcdnsfLkx4t1w6ys1tyxzxAZ3I=@vger.kernel.org, AJvYcCX7qgNDWPmE0kiDJGQP3BNxNLIKAWeUiAQde2qhCauIZ0DjlLwF3Pa3gfo/DF/Pl2g0+867QXj92I6n+DE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAckCdaXuYjTaAaIYq7QySJ5y93hYzDX1bZLQGKPMV0ulXTY2g
	ncYMm5zXec5Fxo1QCSDrDd3DhBc3vbkkHMToqry9ummP2MhSKC6OuVNMS2iup19wDsjFoP3Zwfo
	NjdRPj51jUG3oXPing6X1lfw+wQtiLg0=
X-Gm-Gg: ASbGncs6abziPABAJCYTCkIVYvWMXkf7adi6tqC7FQlGJxvDszC5PrPUDpxgyuMyl94
	6hZAKsmTExHe1qbnKzGyLkM1HGoz6TNkG2MC2J3eSv9OfZlrsbPHBG8bAla7gIxe+EZPAD4GVbA
	yISu2Ma0qP59kzdWRjMbwcy5w5FmLcQ+M6
X-Google-Smtp-Source: AGHT+IHfdLnUKRvfqlELJCJ0Udxc65zPlkv8UToZYSDVHu2cp1ITYBIwQYwcXEf9f+jZ3/a3jrM28T1bfpuJIrntbrQ=
X-Received: by 2002:a17:90b:48c8:b0:312:db8:dbd3 with SMTP id
 98e67ed59e1d1-3120db8dda2mr2420260a91.6.1748525431764; Thu, 29 May 2025
 06:30:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250529-b4-container-of-type-check-v4-1-bf3a7ad73cec@gmail.com>
In-Reply-To: <20250529-b4-container-of-type-check-v4-1-bf3a7ad73cec@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 29 May 2025 15:30:18 +0200
X-Gm-Features: AX0GCFu6Xl2n7m15zwWobbmy25VhW-G5CXelPx2RiN2KsUnfylzAkGkAQ7gGDQs
Message-ID: <CANiq72=B4JMK4eqK0tL5ECWFAKcBGm0O9LsZ74dd38N2GrZOMg@mail.gmail.com>
Subject: Re: [PATCH v4] rust: check type of `$ptr` in `container_of!`
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 29, 2025 at 3:11=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> Rename those placeholders for clarity.

We can also put this in a separate one if it is OK with you.

Cheers,
Miguel
