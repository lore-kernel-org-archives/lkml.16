Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A066B267395
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 11:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744629747; cv=none; b=VT3Lf6NBjdVKfVDt7+mgm0WnmWq1b8MJJvMAJY8QBlxCND/iF/AWxNVLqDcV2mHoBtbqn5mZojFi6uSVyX9sRwPk9krMSEdyqqgxa9ZLdJar5iT0M+OFS9qFoGGhuh4hA5jLFgW+GH1l9/yHF+i4YdDv8lWvaYvS6Ilcr8s+YXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744629747; c=relaxed/simple;
	bh=5Fvjkjfat+nJk7Vy80tDWnDp5NpzHStADTmDQuN5aCE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aecDDjqIH/C/kPeY/rUzTdLRwwFd27NHR02Lsgu9VzCS+/O8lQdYyGLoLo/hvD6FxqPNs0oUKHcbwUUqfNnh6o8TJKhxO3UtVmaIWSMmNaHRTjKdSNKDZ6EVEUGWkkBF9lFgx4KnFjcKDQ3ryGluVMqQAgx98WDjLL+/zCrfDdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y2HKJHlj; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y2HKJHlj"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso2309928f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 04:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744629743; x=1745234543; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rft3EAUTLyhnp7+tWC0d5mWYcohYnVvJHm8W23d6BUU=;
        b=Y2HKJHljzyuuReTwKUy2YuPklO26NnXFOTtF9/+RRuF97SdY6XPya+/i57cfiMk5bu
         +O3d203lG9935JLqdiDpLarbsbUPK5VCk+wTXmCu6XinJY68OaAPkn/0Xb8OdSGzbuwi
         seE6p0hsuampbw/LRr2aTeiZ3ecG4M2lfxlW6ojWtU/ZBVvcPBVH5SrlRVqDHG0s3Z9K
         MxS87kQLv5O+LqEI+SeRoRvk6yhNp/FamMuONeqTdAs6Y8FjVsUr2GeMmvLPfB9OmYXn
         8qUwi6giR72ciKOWdnl2KqFCSuPow5oZ94Yma74GJwNcnslz57b71O70M03/uvQs6VMh
         FE/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744629743; x=1745234543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rft3EAUTLyhnp7+tWC0d5mWYcohYnVvJHm8W23d6BUU=;
        b=jRoa55t/AZ028oZQk8a3+vCW+KmLV1hY0qrIQ1U1lr1xnVfyT+D1VHKoJNPlpiIWkf
         WrhsEYvMwuBlPypl/WaMbtfeTWizRMgBX4m6o5OYQM0nOFqFJzOEETloRLcTc76+3tC/
         E56xx2R16ICjsgHfgrRiztWfMdJWQ+BzKEFYulxo074pLO+d7hzLKWC3OJWEskGSsRey
         TXwZs+3SAzVXgUvggFHXy1gWAtSEeye5pCQFND+YxX0bw45UXwz/FDp46J9AuMiq/U3x
         kGf5tirt5/hG9eXu9UWDdZrvUVkyEOSDZsz8nIF5sLkCmNWWfZqI4JY2fM4yCJxGpU+v
         KJCg==
X-Forwarded-Encrypted: i=1; AJvYcCW1B/AAr1HBxUCfHute9RvMOEowd0J89HAkrEFI03yvfJOD6gpT1/AnpvwEzBgbo3qIZZfldhoNwZZuEUo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1lYqIQsHT15eaMLNOfQ+emh2+eC8IuJoMDynYRBgoWX0fK0TQ
	WR6J4vIoM5L1H5bSvOVkCMBAF+mmL4KJe+3XiAqeNqaulwzr4mWVDLs2zDjakFSvjoSoYZYAnls
	6WYh+DZ0LMNGdBzc58axlWwOKu6VSIWhtTiq9
X-Gm-Gg: ASbGncvCSPlTNPQWnOIu1nR3gBJhjszCpi0F2M0n2t+Enynbqe3g/B98I5MzaZ1VEwL
	PE9di/xB2GViwkY1TCKjJ1mQUKcWdyId9wT29Wki8vmXxSBh9+UmzCzi1EXIJKtMC0AlXGMcOgO
	4pdd0PDxpVx6yxrvyolvaAccN8u5rObDFwLucc9IUzX+smekhSF1I=
X-Google-Smtp-Source: AGHT+IEZZBt3UNC3+TSE5+/gmDD+2unhz/9dXO7/xHNdpPGb0TNqsh6CfuUuMhd+ZdyeJAI6BZseyvWSCutQpwcC5zk=
X-Received: by 2002:a05:6000:2405:b0:39c:1257:feb9 with SMTP id
 ffacd0b85a97d-39eaaed586amr8788733f8f.57.1744629742684; Mon, 14 Apr 2025
 04:22:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408220311.1033475-1-ojeda@kernel.org>
In-Reply-To: <20250408220311.1033475-1-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 14 Apr 2025 13:22:10 +0200
X-Gm-Features: ATxdqUF9via54VPG5nlOhtSrUPwWIS_mfTXT8g_wST2xwdZg_Zg47Lq68Zxptiw
Message-ID: <CAH5fLgjb3Wxbkzvvy9H6QUYVpxXvkse1rnDmmR3nVHjp6zEx9A@mail.gmail.com>
Subject: Re: [PATCH] rust: kasan/kbuild: fix missing flags on first build
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	kasan-dev@googlegroups.com, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
	Matthew Maurer <mmaurer@google.com>, Sami Tolvanen <samitolvanen@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 12:03=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> If KASAN is enabled, and one runs in a clean repository e.g.:
>
>     make LLVM=3D1 prepare
>     make LLVM=3D1 prepare
>
> Then the Rust code gets rebuilt, which should not happen.
>
> The reason is some of the LLVM KASAN `rustc` flags are added in the
> second run:
>
>     -Cllvm-args=3D-asan-instrumentation-with-call-threshold=3D10000
>     -Cllvm-args=3D-asan-stack=3D0
>     -Cllvm-args=3D-asan-globals=3D1
>     -Cllvm-args=3D-asan-kernel-mem-intrinsic-prefix=3D1
>
> Further runs do not rebuild Rust because the flags do not change anymore.
>
> Rebuilding like that in the second run is bad, even if this just happens
> with KASAN enabled, but missing flags in the first one is even worse.
>
> The root issue is that we pass, for some architectures and for the moment=
,
> a generated `target.json` file. That file is not ready by the time `rustc=
`
> gets called for the flag test, and thus the flag test fails just because
> the file is not available, e.g.:
>
>     $ ... --target=3D./scripts/target.json ... -Cllvm-args=3D...
>     error: target file "./scripts/target.json" does not exist
>
> There are a few approaches we could take here to solve this. For instance=
,
> we could ensure that every time that the config is rebuilt, we regenerate
> the file and recompute the flags. Or we could use the LLVM version to
> check for these flags, instead of testing the flag (which may have other
> advantages, such as allowing us to detect renames on the LLVM side).
>
> However, it may be easier than that: `rustc` is aware of the `-Cllvm-args=
`
> regardless of the `--target` (e.g. I checked that the list printed
> is the same, plus that I can check for these flags even if I pass
> a completely unrelated target), and thus we can just eliminate the
> dependency completely.
>
> Thus filter out the target.
>
> This does mean that `rustc-option` cannot be used to test a flag that
> requires the right target, but we don't have other users yet, it is a
> minimal change and we want to get rid of custom targets in the future.
>
> We could only filter in the case `target.json` is used, to make it work
> in more cases, but then it would be harder to notice that it may not
> work in a couple architectures.
>
> Cc: Matthew Maurer <mmaurer@google.com>
> Cc: Sami Tolvanen <samitolvanen@google.com>
> Cc: stable@vger.kernel.org
> Fixes: e3117404b411 ("kbuild: rust: Enable KASAN support")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

I've boot-tested Android's KASAN configuration with this patch, and it
continues to work. It also passes Android CI [1].

Tested-by: Alice Ryhl <aliceryhl@google.com>

Alice

[1]: http://r.android.com/3584874
