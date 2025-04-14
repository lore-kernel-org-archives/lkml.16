Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80271253944;
	Mon, 14 Apr 2025 13:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744639050; cv=none; b=IykhfkeVQgETmsFPPy4NkQUuQ2nfZ78++RKJX/B/smdGysrPstGA5d+t00TM5zVNpbYRgBzpVvSqVekk2EBOqD0qnMMZP3PRjOajuQBZ5IFfBtdbIVHLMg7zJrlcAX6dos1e/BLc23N8xBVoBoVyuhcmpiKBXhQIaf5tIJ9ZfDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744639050; c=relaxed/simple;
	bh=hTlTaCDBRhyHzmopgK5kw6clJ6mHQsQ12QV+6Tg8yo0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tiylCViTbi6k/YhAJNJWwjYOYeKHpmG648SYSlOYODDsc4nZwZwjNTiW03bSlMMA3HQGkjB3bcqEYMxPiIVxaiXh76b2Ltz8P0ZGPgogAw5TBaAmQHl3A97IWA4Q/aWaK9PSZFwzExzaBgtFAs/R3miZqjwBJwJCZMdFL2LxN6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kRkvUR23; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kRkvUR23"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-301b4f97cc1so831008a91.2;
        Mon, 14 Apr 2025 06:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744639048; x=1745243848; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rdp5GE+wRgIg6x0EI1T25NTSyefLWkNucm+NzZ5qOjI=;
        b=kRkvUR23m9KGLMccC/g0EpsyGx/A/y5fiIcG0pVcjjVyIJ+mCIaKuSUWVaPW6K79ky
         DJkDZSLZ9kUaXPtVKXk03Qb/Wltmzw+H4owPYFpObdb5MBM05JpFfDG790ojdmL2OHhw
         MuT6jca3T0VAdZsULrVORcP0/pJtpvDfvioB1rSKz/f/XFF/i2pRH4ibgQUxFJLbauPW
         uvo5OhlRM/Dmq2IZcQlkvlW0kIE4lFOAUtzSbhUOznt0qNwsKRAKHt6Cmyd6G968rBEn
         If4r8NUlLngg84WfKR5OvBMcLhbiID7s9Lvk2ibIwcjXSGgcD8JLGiQgHtVhesaYiwYt
         ixEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744639048; x=1745243848;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rdp5GE+wRgIg6x0EI1T25NTSyefLWkNucm+NzZ5qOjI=;
        b=fNmjz31uvNA9kj61ppnpphDQB0at4yzkaYrQOeV7A2BA499T6OjUxIlc8mVAHFu5Sn
         OIQTFrrnPFnFyvb08r5FQBPjUl4cwji3ARTY8DJM6va240y+15A7jORtNK8WM0ZMK3VP
         E+Uq6jlL/Pajh1yPM+uFpwawVYR4pkr6S/nYf0lVODDzHGGO3ETrLI0YXTCIZkxXeUWL
         naV1bPw9L3UToYx4w1Mz+wdUFb547anB/1FdeHZ9CuBdhRUAMKaHC9+z6WY5UW0nSxRV
         h8Hk6zd3JP/HZqqJ6jtwK9ysH4RAJYA71CX3E0rUXmQPkyZJj93PxaBA+ufVmmRi7fqS
         6oTg==
X-Forwarded-Encrypted: i=1; AJvYcCW94Z4LJcWbnDzRFvyhAJVqQopeUg/N5/NQea49Qu7CZSM7s/zOfetteoyzNsMsEbk9EwTSkgBHhd2ly89Ihko=@vger.kernel.org, AJvYcCXCuv0LXUh1O0aYs6xIFD9SFbhRDGVKmvwhWFrHQ66pEEfgmY5fBoK7KLrsD65zdo33Lk+4KCqcYI2M4CM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9zr4X9enwgS+GMYCIhrLC4IC49Bq5EDAVh1VGc+hww4m7RvAk
	TqtuChwbaeNnH5ldSgextipT8PD+pj89K8g3NRE3ATwLtM8ngMNSF+POLxjCad8WJ/l+yQ6JW4P
	qEpLDmKSpbmPz/ITW5UzrX4GbeGs=
X-Gm-Gg: ASbGnct63o/pZw+ZNtYY3EZDK/7BvV+BFjvhYdUoejhvEgRPMhTdioPuI2ZHhhOK29P
	0TvRNQ3sdFjAZf/Jf45o29SelpRWVH7IvctCiGgyuD7geWyBFRf1sBH7sx0p/QMqk0uVhZt+28Q
	IBcbrGbypCo3LhDi8piTGzegv6l21A2dO4
X-Google-Smtp-Source: AGHT+IEVpoU3m5TH8u0Yx+as9zfghejN+kqpF/0oNJiPS14RnhoQJbXfc1/tsIyAFRuuQGix5HLpGdabVAYveXcdUSE=
X-Received: by 2002:a17:90b:1e51:b0:2ee:acea:9ec4 with SMTP id
 98e67ed59e1d1-30823775b41mr6815248a91.3.1744639047552; Mon, 14 Apr 2025
 06:57:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250412-b4-container-of-type-check-v2-1-f3cc9934c160@gmail.com>
 <CANiq72kAYp0Z3VNS=JgApceCXx1OVXMNJJYcm8OnZdToz0zufQ@mail.gmail.com> <CAJ-ks9mrRYkEGJ38tTkDXg0RkSP7K8=wtWBa8y6S3dxDh7ei9A@mail.gmail.com>
In-Reply-To: <CAJ-ks9mrRYkEGJ38tTkDXg0RkSP7K8=wtWBa8y6S3dxDh7ei9A@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 14 Apr 2025 15:57:14 +0200
X-Gm-Features: ATxdqUGjEWmcmzAJOJBbzuklrLCZAbXoARRQjRjY57C0Mc0Tj7eW8J4SMbg0McA
Message-ID: <CANiq72mWVRoiXisOSmwb6Dj4BSe-s1s+BTpRoU7Le9DVcvmsjQ@mail.gmail.com>
Subject: Re: [PATCH v2] rust: check type of `$ptr` in `container_of!`
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 3:27=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> `b4 prep --check` complains:
>   =E2=97=8F checkpatch.pl: :207: ERROR: Avoid using diff content in the c=
ommit
> message - patch(1) might not work
>
> What do you suggest?

(It is `checkpatch.pl` the one that complains, no?)

I don't think it really matters, since `git am` is OK with it. So
unless you are sending the patch to a subsystem that still uses
`patch` or `quilt` or similar, and those are quite rare nowadays, I
wouldn't worry.

But if you care and want to be extra nice, then I would suggest doing
what others do, i.e. checking the Git log. That tells me to use `>` or
`:`, since they seem to be common. I don't see `;`.

I would also recommend patching `patch`... :)

Thanks for clarifying!

Cheers,
Miguel
