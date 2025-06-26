Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018861DE4CE;
	Thu, 26 Jun 2025 14:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750947795; cv=none; b=c7pwshreYRlY15iHUwmACW+55WkJtpWHLqsg5ccDm5XMisLc8E1gMKLpT1aycAUiRc7uhNr1wHwjD9lA94nroJ3RemY+NeYzZqpEg1SOUyPF5/ijlQox0OIrby5zaFaanXGcbqACRS8ZO5GpojcgBaOiT5JRnAq0PxAbFeLeWGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750947795; c=relaxed/simple;
	bh=3PmJhzf1sJs2FN8a0RHNKuha/3rAM6VtFHnWa30sHCs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u+ikNFcCblfIn/2osd1fcZKRkg40Vn8H5uPhnIuHAC1fnmgtT/SNoItZ5EWGrnrNRlyNUwFwRf8oe/36aumao0LzoHbGvrOjGuoL1phyvBXApm3bsG5UbS6DDI+OH44FyJWoo31Khqxx3b8Ozn4bj3mpRHz4dcbaj69Yy86CG3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gquLyRvd; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gquLyRvd"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3de252f75d7so10760215ab.3;
        Thu, 26 Jun 2025 07:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750947793; x=1751552593; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3PmJhzf1sJs2FN8a0RHNKuha/3rAM6VtFHnWa30sHCs=;
        b=gquLyRvdTDE+fLFEPlGJVrAffLxcaHk5QYiRy9+lSmqhoDF3TUhR1X5kwsKy7K6PmS
         7IjdJA7JxpH5lEG/q2uQj7U1y0YRld8NE/dwR6twrYsmF6wtG17ZNtIuEozFqi3GSKRp
         U7h+NoSmCw7mLNICgPSbUu4uNCs07cxYQyLqYSYFeq3DlEOTr8rYvhAkwH/dDDqbGuVi
         zp6fok8632tGvd0matk7LSwYrv9kZQtFsjSo5R8Ht0caYZgYmQCAf4DfXqTjTohM+Xvs
         H7/CFj52Oy6Zgc7t1NBOnluPUzpuFzfWLDEA/Owuh4i0WSB4YX19a0+hq3kl3pfvE30k
         4vDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750947793; x=1751552593;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3PmJhzf1sJs2FN8a0RHNKuha/3rAM6VtFHnWa30sHCs=;
        b=eCSOp1SbmHnJunhL/VDU0lfLKq/uDpC+lyJjn7/gBTUbk5EKLmOKjznZxqsVfnDKIx
         5Zfdy1HVsDw/CZGwpVqkUieYR5ArY4MxY7nZ+dUGO5O0mFGxId4Qbfs1GtQ3P6QcxBGC
         3ax0aKXa26DkhO1Is55XFjJqI5grqEGFXypqecFjsg5upqWVdsJiGXSxFknzoL+aQxg0
         8PJ7pzAfsLkQhI2nkDC5DoN104yKWQLfxc9i6PhGxj3HI2mCftHy/pDWSUkPNQ1bwZyW
         iS6Ll6DCRGloYlsWSweRDphnNeRP48KklFJikX2XSnbSS30BV5/CRQRIFAxZoHR5BlSI
         JvjA==
X-Forwarded-Encrypted: i=1; AJvYcCUjQjCwPS3sN4zRNw5j2DXcdq7EfrORF0/QpIRoL60ERaAvc/xns73FWuiAaxXGCnEU05aVEq6A++Yuqci5MQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0RGl803hTJKKbYLAQoGBs31ymwQ5klyJeI5UXVcKD+zGKR0qW
	719jqlDWmZPuZeon3oNWW7ksUn7pUxcZgNM29XWKos2dVkMIm9/fc/4hD6rbUaFRdQs2BrRxCPQ
	JrXDlYs2C4h4VW6XePInlShJEwQbDuJY=
X-Gm-Gg: ASbGnctUz8KtD/VE5whEmi7SVoyAnxne5T1ERwXoOCBWzV75Z7Ji1WAQIV660yDhYBn
	h1WXZKFTp8mFPaRSphGpuQx252WaK3VPfa90fGnScUWDPTbHE7bfoQk5qxNyKK13qHtJuPP3e48
	p4UHYSM3KlJELCMW7f1WKZ7lntw9ME7Fc3QPEWuXJtnUM=
X-Google-Smtp-Source: AGHT+IF3rE0mC2CPX+Ugvjxi6nBUgivlndxS0obHPchi2LG/zWvKMmmAwuBdqywvKq+VzZiCw1orp74px1+xkgYq9ik=
X-Received: by 2002:a05:6e02:378c:b0:3dc:8b2c:4bc7 with SMTP id
 e9e14a558f8ab-3df32852952mr95072965ab.1.1750947792809; Thu, 26 Jun 2025
 07:23:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1750689857.git.y.j3ms.n@gmail.com> <DAVO878E49AN.1L5TPHANBBHE6@nvidia.com>
In-Reply-To: <DAVO878E49AN.1L5TPHANBBHE6@nvidia.com>
From: Jesung Yang <y.j3ms.n@gmail.com>
Date: Thu, 26 Jun 2025 23:23:01 +0900
X-Gm-Features: Ac12FXzfN9fk03al47GYWZapf9guorVxLElMTuSPKfESyeSLvx8gJf-MiJnO3vM
Message-ID: <CA+tqQ4Ji486i=Gzy5oEsdZLOFDmGHpxT=Wkng2cyZpJ=u14FPA@mail.gmail.com>
Subject: Re: [PATCH 0/4] rust: add `FromPrimitive` support
To: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 11:07=E2=80=AFPM Alexandre Courbot <acourbot@nvidia=
.com> wrote:
>
> If you add an associated type, I guess this means the derive macro
> should have a helper attribute to specify it?

The current implementation tries to detect the enum's representation
(e.g., `#[repr(u8)]`) and falls back to `isize` if nothing is provided,
since it's the default [1]. However, when `#[repr(C)]` is used, the
internal representation is not controlled on the Rust side. To quote
the reference [2]:

For field-less enums, the C representation has the size and
alignment of the default enum size and alignment for the target
platform's C ABI.

Given this, it would definitely help with determinism if users provided
an explicit attribute. Being explicit also often improves clarity and
makes the intent more obvious.

[1]: https://doc.rust-lang.org/reference/items/enumerations.html#r-items.en=
um.discriminant.repr-rust
[2]: https://doc.rust-lang.org/reference/type-layout.html?highlight=3Drepr#=
r-layout.repr.c.enum

Best regards,
Jesung
