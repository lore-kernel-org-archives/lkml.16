Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA511D934C;
	Sun,  9 Feb 2025 16:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739119427; cv=none; b=GTReYdATX8VsFlck/USfH2S/5hS12Cee96TKD/3KMBX7S3Feo2OqTZ2TFFoWrujsRFvQENtzquV4+NNKw2mk4ZWvFrliYJC+CknI6emh3WUTFEfdUoHeNcNvQzCuSoS/f10KCk9KJWnNhGO9dsMvRU9lwd5W5joqWNe4XT071m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739119427; c=relaxed/simple;
	bh=bdy73I3gklXL29pNB8DrBz2tMYS/m5tBrFRb+L4FWNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uK+e3MVqUQPOHZWqHJZixPcUaH+CkM0EKiSDSHFib3GYXT2gqOUTaI3262J6Gii9MO1haHYiVS8fZns0fhF+uhe8xeFFQ+XL2KDFFZM/w4Qt499mhmsdfMgNwZ0o2A8j5xiCuZ+H7UUQsngfLesfFdx09iGssvOscSohIt80e5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eCMqb1I/; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eCMqb1I/"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2f9b8ef4261so930133a91.1;
        Sun, 09 Feb 2025 08:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739119424; x=1739724224; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bdy73I3gklXL29pNB8DrBz2tMYS/m5tBrFRb+L4FWNk=;
        b=eCMqb1I/3pYAt8lf6GarhEu+6/arD/jw3ZKvYqdnQshhWaLba0Cgfdf9wZ8DV+J6oL
         ZI/1DgfO8UCCKXFY09eVkwBkaRk79VZr2uKi8b57tb/rLg/uh139HBXUIGGpn7AfEsD8
         ONU6u1AxRyTLzawBWfdp4+I8PijNvLD7wFuGD54eGxLsl3j8S+VFfRIdsjg3ARssZ1Sk
         +P1XVih9GqwKCOLMNKcBMJw1wS6UdtP+W/iIyxQh3o8hApM0R+jTC6hOdllNevtFGUJu
         0NZWvL5s5Evmls1Hf7hbBnQT2DipTvGcj9xMjM4zc6UzcKwiIyJpP3Z2ulalP0kg8oOq
         AyCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739119424; x=1739724224;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bdy73I3gklXL29pNB8DrBz2tMYS/m5tBrFRb+L4FWNk=;
        b=efD6A/qzx5EmeOxafB/EOh7jLCh8lG+QqC5vUunmhDJp/inCVHqISz4oThcysRyFqP
         DiCvA5uqRkNlyXwxHefzxmI8RPpiSPB7yFki1zvmAhWgGYUgJPI0T8cRUA9iWzNlcKXl
         5ry8ns2je3u/sMsrZh7RPF5AFJOf3TacqKYmep61KkluykctVvxuxeCGi1toRZ9kJP8s
         4mxrUj4a6JlBW6a+LOyHT8eb6UBxE7UkJcqozh4zdTTlkFm6H0qjP1HfTA13GHrEyyCr
         7SoHAC+V1Cv51ZT+Th6PeRzyLBT2T5bu+EdKXGgHc1nTW1LwR+K97QJ80v5V7wLfR5Jg
         m1aQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZ1k5eG0COtQSWR+fPmYwDtJKoQEP4zqBKeyeKfeP3f1fgDoQME+2mPwRpVEp/hoZ8gSEjtB8RtPn3ZBc=@vger.kernel.org, AJvYcCVJ5QPr8nt5C1vhdk9pE1OJW7ZLdSDkjwyVXq5vR+PNIX7IBE7fDEs2hRjH3958ZWfal83u7cGiZeUSILbptSU=@vger.kernel.org
X-Gm-Message-State: AOJu0YypdEAkLrClmhgGz7gSGBP/0K/ckSZp5H+iR0nCnkddbGT1cxhB
	SGC3J5oYI+ndLTvzTTtiqovWKKi2mVEwYOZNTNb0kr1Vjod79HNHpHPv8rfsGiJy/fS55JiAemV
	nveyJ7/QM7z6WwUOPcXUUY45Md8o=
X-Gm-Gg: ASbGncvjSoBSJ8BP34+ubFt4Ttf6UWXg2G1Lvt/CiLDGS3Hnd75S5ADlYKesCuetRq4
	EMafvsBft83H1kXPt7I56lxZBgnogEfydHCpJau9jLalyGajtcBMe358No6+TXvXVI+u3oTFe
X-Google-Smtp-Source: AGHT+IGtSSed25yZZOeCbrA2Ob8gBb8k0MBS5ehEGPuLRqA/dUceO1SF7wYPqbXKFkDYm6rTh68XpvHTozhtmZIHB08=
X-Received: by 2002:a17:90b:3b92:b0:2ee:a558:b6bf with SMTP id
 98e67ed59e1d1-2fa2455c118mr6641198a91.8.1739119424256; Sun, 09 Feb 2025
 08:43:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250209-rust-analyzer-macros-core-dep-v1-1-5ebeb3eb60a9@gmail.com>
 <CANiq72mw83RmLYeFFoJW6mUUygoyiA_f1ievSC2pmBESsQew+w@mail.gmail.com> <CAJ-ks9nMjPnyY_J1xH93MEepcekYWQ=Ve+Kq_TaM=MvA4B0Phw@mail.gmail.com>
In-Reply-To: <CAJ-ks9nMjPnyY_J1xH93MEepcekYWQ=Ve+Kq_TaM=MvA4B0Phw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 9 Feb 2025 17:43:32 +0100
X-Gm-Features: AWEUYZkAP-L-5-INE3rzB7TB2KtpQUXyivrODLj47_1NAUBdJA7buc8xZvEHZt8
Message-ID: <CANiq72n2WTAp28PeNVw1hOsxw5Bo1HMxtpTb7N-f7z_aGMppBg@mail.gmail.com>
Subject: Re: [PATCH] scripts: generate_rust_analyzer.py: add missing macros ->
 core dep
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Boris-Chengbiao Zhou <bobo1239@web.de>, Fiona Behrens <me@kloenk.dev>, Kees Cook <kees@kernel.org>, 
	Wedson Almeida Filho <wedsonaf@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Chayim Refael Friedman <chayimfr@gmail.com>, 
	Lukas Wirth <lukas.wirth@ferrous-systems.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 9, 2025 at 5:39=E2=80=AFPM Tamir Duberstein <tamird@gmail.com> =
wrote:
>
> I'm not exactly sure what you mean by different sets of crates here.
> What `cfg`s would you want to pass?

What I mean is that, in principle, `cfg`s can be different for the
kernel crates vs. the host crates. For instance, we use
`cfg(no_fp_fmt_parse)` for the kernel's `core`. In practice, it may
not matter. But, in theory, we should be passing different sets.

> We could, but then it's redundant with the deps section. I'll leave it
> explicit for now, since it is just one line.

I am not sure what you mean.

Cheers,
Miguel
