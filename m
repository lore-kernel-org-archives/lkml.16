Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34D81F8F01;
	Sun,  2 Feb 2025 14:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738505974; cv=none; b=NSTS7a0hI0ldc+Fy0zhikPKr7KlLiXsNNKBZ7F1w+LnwyjTIW4aDud96ePzInXX9cUfxynltF2zEwG6MctiAEWNAtjIT4M3qd9K/tW4R5/D3S9rtqFZLMB52H6eK/g1BV81AzpjtUmf85I4p6irY1wjbi9IkZ8QqxaGAQ3xL06g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738505974; c=relaxed/simple;
	bh=uL7NzAbejFmkhNx3EspNPXg3LKNvUhtWyK2MXcpF/Tk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hMTr2dWw30lMxGdjwBRdcPylTWwlg6Na+C4SI0z2HgysasOnmGmmVMeWTbiiGC25j/s+hZamCNXBjaRCtvxzsv/VhvugFa8jblPMYiifeCCaTAM04MOdEzlCjS9O8cSR/6JoY2a6ibPgDU7ILGkCE1tCN5k9PZOgambcBE3K5ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SlTTW+OR; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SlTTW+OR"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30225b2586cso43165621fa.0;
        Sun, 02 Feb 2025 06:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738505971; x=1739110771; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nEb04JZ2Khs3MvlufQafhJfgSaiQiQ3sCMUN+Hr7DYo=;
        b=SlTTW+ORZwm8RsBSVvTOGmlHDz1pwfUmRE1Q5hbZiEZ3X9Ci/jT0O2UVZAB8fpL5Cg
         O1h98NmimHSt9aYYJHWZTSJKqvzTFfIqfBHq9mDvGftZai/mcjID7liNAbuG/MjrURk0
         RMNm1GKQZkjbZ2muu1yAG1EfzamF2LJbK9UPyfHnSJNZiEZvnkKystRj7zDFnDS4yA7T
         hiUccTamfjC17owhNyyhgduZ9L20+19tlQfn9oCCrOQ5dThIH4cI8Y2DbXs6AZ3SGQ+m
         t253GGtyx44PhdYeGitfDK95QdLQq+BBP7+Jmv5mqmFMYq4cbY6J8F2KLajBq9hMptUm
         5lJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738505971; x=1739110771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nEb04JZ2Khs3MvlufQafhJfgSaiQiQ3sCMUN+Hr7DYo=;
        b=QzUhcDhqyM72YLmNmooz6GqMh2Z9ugddKPe3AnIUmHE6s3piiFft0pS7GmcWD9tPGn
         RdCtK+K0hlwnAIIclHLvdIk5ljO6PWBT4OkCTwLXYAe0kJcz/uUV+KDizNqS+1lfO3EW
         Zjzn227slgjMerOYgqCnFJErkjve/ok4+UUjALMjkGxPHw+yZgBkvDa5kXzwKSkDztlm
         8CBFvjElfZk+UBpC11t4qGiZ88DHcOwPI29mIOxbUHZJYTXFB/l8dBQN1Sgkw96cf2WT
         uVQ6ZfCyE9cLqyy7qKJIqlCUh+uD/CiU8qKcM7mk8vgrYZgtq6pBlstbCMQii7GZnCLE
         Evvg==
X-Forwarded-Encrypted: i=1; AJvYcCUUrUgsVYhUfdbUF72PqdZm/5w1NS+vxkt1zhrXhljygh7VMqzNMQ5rQkdnj8tENUJNwrkdLqg9jVu1dwQ=@vger.kernel.org, AJvYcCW4dT8x2qwHLS43r1hrx4zGcc8F0Po5JSOKKk0icioyNEaju/oPnN01GDvbe/rYKTXvHQQ7LxhWku7AYS7rlu0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz012WJO67SvPc/OPY2jfPOdYJzL7W7Yg5IzUbDuAttIB7gg+aK
	mjvNjZlDcKZTV7w0bglRFRLge5aIdVTjw+TF727jdw6Lbod3lBFnCmRaKydta8o+tz7trVUBFk4
	X+9t840iqji2WTumkkCUtTuckJ58=
X-Gm-Gg: ASbGncuTK2YMQ/mNdt8bkqL8yImrAoihJGqBj8UJLu9sb1nB4J0FSbXS9kIpw0F9TTI
	c/t+VzTofEuhgF1A1hImTlZk+/ORRK638YfseKVJpQXlvGMCSmNmMsAMIRYdXKl9N1onqb+Dqu7
	H3HKxItYzErxfBQx9itouxoq+Vz9mSKZs=
X-Google-Smtp-Source: AGHT+IGKtI/HquBTzMvBPkPXd8BCwfuT4RH52VxQGZeqejUeajJPxFp6I8+M+JccQwC6RY+MwuhR5j9kHppHl6hTeZw=
X-Received: by 2002:a2e:8749:0:b0:302:23a7:1ee8 with SMTP id
 38308e7fff4ca-307aa37d218mr27857701fa.3.1738505970419; Sun, 02 Feb 2025
 06:19:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250202-cstr-core-v6-0-8469cd6d29fd@gmail.com>
 <20250202-cstr-core-v6-3-8469cd6d29fd@gmail.com> <3e2cb277-a896-4575-b23b-8d9b42c87173@gmail.com>
In-Reply-To: <3e2cb277-a896-4575-b23b-8d9b42c87173@gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sun, 2 Feb 2025 09:18:54 -0500
X-Gm-Features: AWEUYZkQyf7vq2XiRnN9gCJAXSPy1JtYm332MaKtik5uOndhVeFTy-yzbvTlKAI
Message-ID: <CAJ-ks9n4XmKB+xKctMtzZSS8SXjaypSGfU3THdmSBHM9AP=-OA@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] rust: replace `kernel::c_str!` with C-Strings
To: Dirk Behme <dirk.behme@gmail.com>
Cc: Michal Rostecki <vadorovsky@protonmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 2, 2025 at 8:10=E2=80=AFAM Dirk Behme <dirk.behme@gmail.com> wr=
ote:
>
> Hi Tamir,
>
> On 02.02.25 13:20, Tamir Duberstein wrote:
> > C-String literals were added in Rust 1.77. Replace instances of
> > `kernel::c_str!` with C-String literals where possible and rename
> > `kernel::c_str!` to `c_str_avoid_literals` to clarify its intended use.
> >
> > Closes: https://github.com/Rust-for-Linux/linux/issues/1075
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> > ---
> >  drivers/net/phy/ax88796b_rust.rs |  7 +++----
> >  drivers/net/phy/qt2025.rs        |  5 ++---
> >  rust/kernel/firmware.rs          |  4 ++--
> >  rust/kernel/kunit.rs             |  7 ++++---
> >  rust/kernel/net/phy.rs           |  6 ++----
> >  rust/kernel/str.rs               | 37 ++++++++++++++++++++++++--------=
-----
> >  rust/kernel/sync.rs              |  4 ++--
> >  rust/kernel/sync/lock/global.rs  |  3 ++-
> >  8 files changed, 41 insertions(+), 32 deletions(-)
>
>
> Have you checked samples/rust/ [1] as well?
>
> Best regards
>
> Dirk

Hi Dirk, I had, but I was working on rust-next rather than on
torvalds/master. I'll update the other samples in v7.
