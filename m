Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A131E9B32;
	Thu, 24 Apr 2025 10:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745491291; cv=none; b=ikaLszrJrMGyaVE9mMiUEQhjWAoZCU8O8+rtIlxnbBS245ThK5wRx5CYDF1mYAXlOfEDW+gYKiTjXPXNx6UiRyB/tfq7MxLgB/1G3ynqC2NXNt/90v3vgUBiGptbelT6EmLI7rf+oG0aDrrqLoyxLzBGW/gcRHpPWalkVLtGhHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745491291; c=relaxed/simple;
	bh=N8UDuFHOEh0XzlBT1eZgpa0OPW9H6oATlwJO+txihuI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DWDhnnwfghCXWjqm0sCWD+smuEp4m1DJvxUo9EviY8ibdq4XZFNRR8xsSWAYV2Uv0i7rmawWnnH9BQWlfEjCCh/N/x20zPKSq+wBHSNYWipMFu0sGHXP9AsHG9P0Hp4aw5fy0xBhmAh82+ztXCAcQrReSNqC8LGRirp4gFrbjDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H1oARq36; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H1oARq36"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30db3f3c907so9147101fa.1;
        Thu, 24 Apr 2025 03:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745491288; x=1746096088; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N8UDuFHOEh0XzlBT1eZgpa0OPW9H6oATlwJO+txihuI=;
        b=H1oARq36SUS1+ow2BoYitBNZ67Ih3gxOC06HQ8euHkCeyDE+eLD/Tq3AotbpL/a7Xg
         thbAbtwZ6fShaxUyUpLyaCv6Y/w4sgwZS3waS/sjff+wV/3G4/9mpv3U6qO7zVAVd9mr
         6FEW9NW37wq65lUatWZ6eIP0qb8TKCMDxC2mNrLG0NZdJPwUpLLS75nzaslIeYsR+VwU
         dp3ZyjlXg1KgKMvdKzmgRciJAsS/8nmTb7zmPV9AaKmwQ8Bx2bzdav49sKfTlJ01/1BL
         T58eAKB1eVbudBf0LlLs1fyf4R2FC/nXU2jfpcAs7O5NOZuet+PhMGEy1H5a9QFpGNaB
         wtqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745491288; x=1746096088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N8UDuFHOEh0XzlBT1eZgpa0OPW9H6oATlwJO+txihuI=;
        b=VtrHRt5Tw4AhRrnEeQk2NqsW4QgejcfoBuYtfarrfA6CjuMNRCn0IWyD60hoZ9/nmy
         vgcQTTIRkeVokDjYAi568RfmZZMSJ7m1aq7mCkX8AvimcDLBcsyjQK026BIAbYd/uTwS
         ude5kKm8jvOAqmeiXh1K2YvTLlqkrffCGrqx/RsW3PmMDQSAm2yg0YZZ1xDe113kDqUz
         N1NmPG8BBUrgaZreCP9+OlSz9l5CNunlkrR7bQo6nNutly7Ui2KyGYFgfcujaZmKWTzy
         Fo2bNz4oNMwWuhuy6+l+rN9TafgZsk64hOtbUfT4S8jii2Pcg0IAWrli5gJgQl/gIeFP
         KoxA==
X-Forwarded-Encrypted: i=1; AJvYcCWw4PCqN9W/2v5capM6GmfD4u5LyvkZkzOyuBm66CTEX+2/jGtS92Bv3PMKMpEmtUAPeUkMJwahJm3hpy8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsDyi+s795+BnbHiePywVlTZyVit1wKTsRN9cEQFnAql2Zl1ou
	pwHNmgGMp/R5Fp19pJjNT5SZQKV5OzSISzCHaPSZPm0174QkT0ZnDbTVWsUFnyVjGULEHTpi9tZ
	q4uw+cFE7RI5DccUha9woMgOWnAs=
X-Gm-Gg: ASbGncsydYW0kqj9T4GFZJK4tcBIlZh4eRMkBJVl9CxJITmeRtiILxDohBJCRNPzfo0
	VZWLEEEzzwjJSY5mgRs0y9g+eeHIB3Yeuqd5kw3OV6dj5IJGTQUOy9L949WGRTCSJ6jSLyNJ4kZ
	sEAvPUHzqM189Fdz3MUPJ/mCrPAhgNBBU9aL7AzTYBW7hFln56NUWQsINW1Nt4FyEiK7M=
X-Google-Smtp-Source: AGHT+IHCQm69ACOCi6XQWBLDmVIq0B3Y7P+pOzf0ce1qFtYSxrOjbr6mMggv0a9jwDNVzblaaX5akoJowTeUEt3dkYQ=
X-Received: by 2002:a2e:bd16:0:b0:30b:cceb:1e71 with SMTP id
 38308e7fff4ca-3179e5e7e78mr7250851fa.9.1745491287881; Thu, 24 Apr 2025
 03:41:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408-rust-remove-compiler-builtins-deps-v1-1-4fda4f187190@gmail.com>
In-Reply-To: <20250408-rust-remove-compiler-builtins-deps-v1-1-4fda4f187190@gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 24 Apr 2025 06:40:52 -0400
X-Gm-Features: ATxdqUF6Dpx4LSF9v5DB4Ydr_rK2CEFA3gkF09xNTMeSeySgU5slu4-4LmC4ci0
Message-ID: <CAJ-ks9m+5WSCbe=Lt=HXYeuV9pWtRx-rOhi8V57=A7Y-4U7LZA@mail.gmail.com>
Subject: Re: [PATCH] rust: remove spurious compiler_builtins dependents
To: Miguel Ojeda <ojeda@kernel.org>, Lukas Fischer <kernel@o1oo11oo.de>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 2:52=E2=80=AFPM Tamir Duberstein <tamird@gmail.com> =
wrote:
>
> The dependency on `compiler_builtins.o` was first added in commit
> 2f7ab1267dc9 ("Kbuild: add Rust support") to `alloc` which matches the
> standard library[0] but was copied to other targets in:
> - commit ecaa6ddff2fd ("rust: add `build_error` crate")
> - commit d072acda4862 ("rust: use custom FFI integer types")
> - commit 4e1746656839 ("rust: uapi: Add UAPI crate")
> - commit d7659acca7a3 ("rust: add pin-init crate build infrastructure")
>
> The alloc crate was removed in commit 392e34b6bc22 ("kbuild: rust:
> remove the `alloc` crate and `GlobalAlloc`"). As fas as I can tell none
> of the other dependencies are required; it is only required that
> compiler_builtins be linked into the rust-enabled kernel. In the
> standard library, compiler_builtins is a dependency of std[1].
>
> Remove these dependency edges. Add a dependency edge from
> `compiler_builtins` to `core` to `scripts/generate_rust_analyzer.py` to
> match `rust/Makefile`. This has been incorrect since commit 8c4555ccc55c
> ("scripts: add `generate_rust_analyzer.py`")
>
> Link: https://github.com/rust-lang/rust/blob/f820b75feef00654924c9351a2fa=
ca8d34818339/library/alloc/Cargo.toml#L19 [0]
> Link: https://github.com/rust-lang/rust/blob/f820b75feef00654924c9351a2fa=
ca8d34818339/library/std/Cargo.toml#L21 [1]
> Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General=
/topic/rust-analyzer.20improvements/near/510200959
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

@Miguel do you have opinions on this?
