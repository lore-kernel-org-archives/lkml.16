Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D8427587C;
	Mon, 19 May 2025 11:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747655973; cv=none; b=lDpIIEcg8cuY+POJKK0yAtN0FmQbyWZqZaTXZV4UFq80ynupXoMIKfZ8DGq/daD5Lxd5PcAEnZCoWvooQu8TXfQDOAPrhhlbpUra1RMD4wt7rqZC7yXM86RnzJWffjaiig1GjDIZF/h4VHpMt61F7uPwD1LVMmZiOZ4if4Ujkmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747655973; c=relaxed/simple;
	bh=aLFu7rCxixexESkd6vOg4f5nFApYBwEgOBz444CcjWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HL+R8BgQV+jo38fU5a1VHe4d4fRVhL3YhZH3tEs8ZK4ctPPw9ITfP758jkPjy+OrkQ5mZzxJDH9cmHIgIxBblKqXDn4fEITrTmHZ8pqjOizFu5RZktiBpNXoPes8LmUK2tYAe/KHb3hVYxNPsjzfCfdOcegd0y9oB5CaJ7FVvX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l/rff5/U; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l/rff5/U"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2322d8316f6so1104665ad.3;
        Mon, 19 May 2025 04:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747655971; x=1748260771; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aLFu7rCxixexESkd6vOg4f5nFApYBwEgOBz444CcjWU=;
        b=l/rff5/Um8sjLZfB5ug3ua4myK4vBnSOdPcLOg53n1HxUstupMRBJytF+W9fZIqLS5
         gG+RL+xT6KQgGYmgEl2elOZUPV49POyp24UgBdsVaK1aG6glVLwwrw6QUAjTk6eJfzq9
         sBJHlgA1yKxeAY7aRQyME9GGwAxrOcPafH8J4g078c0LuCSVeLQMUclw95CQ7UA1NtVJ
         CpQXSwnhMcKfu//UrMF8hpNgTXrEwKjoWgcMgt/rab4gJLfoMg1ODFA0pQWixDf3GHjx
         m1OYyPmCAhpTJUV55YmLdP0QDgsln3TiAsumk3tYRhbxnp2bwMhz/scnbxkX598naAp9
         59BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747655971; x=1748260771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aLFu7rCxixexESkd6vOg4f5nFApYBwEgOBz444CcjWU=;
        b=Tu7hERfrDWHVdki5lNW4cIC7/K1gw6YWWynBM0WYuGLVSMQfasxBba9nNvh5UxpT3Z
         iCutWiFvmLqC2Vh4UUKFNWQKYc0knd+I3oShORLFa3lXMa69LJyZbg8lUg/mo3mJBEX5
         iqKyL22Z/8wimxUhxv+8rDpW5a10GhvpMC3+1Bh4kC6AnP8LvSZ0kl6JM9uE+Ib5BF7/
         pPV0JIPScZ0ECvII8cPX1BzVm2Jhxj0S2dV5IioVGMFFTEdHB0xmTpajUSQWw0N2HVU4
         QUyT13WAw/9djJTRLU8SBsAopbpSHg7I0RDQH3/sDi3a0Y35YGMkL5+vxW+2Y+FiOdLY
         HeAw==
X-Forwarded-Encrypted: i=1; AJvYcCV8eiauv3Fk5HLjScdIA9RAEV0aXtLah2GunYo5MZseyNio+BgEQoG6HTUlpPI/SzZr4UAdcNPpqvY/SHeUXKQ=@vger.kernel.org, AJvYcCVcaWUmZTRmNYK3MakZDgw1MbE2AIuN6F8tLi1DX0vg7MLSV4Y3xBJrT1C2gAXyq0uxpF8tZwj9XkdVNiY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvRrZkmqmk5ZEGd7sj+Q0K0I2d8ybotxtH3WLTn/V0VIPF6Bem
	QxQjftgOp63Y/YBjtCnP0vt9VJGCjUYBTD2rMu4h096pylSfcy0LMQTETlt2JzNGvtVcNEOa3hy
	FY+abei895V3PPgvOOQ8EFrbejJkGKMU=
X-Gm-Gg: ASbGncuxYZ5qaLg/g2HM8eEqpI+nrvCLPB0HUJwdW23APVYN7zdGGuEhmsQqEb9qtG/
	B3fvXteLtHI+OqcspZPe3X+Iy5G7t75AN9sB5xu4hGDEl5hqqxyeC0qJS+zoQ6WUJubKVgrqXTq
	3LFsoHQ/c2onV2GnD1nP4RzZC8CZBVOqfE
X-Google-Smtp-Source: AGHT+IF51uVPXV6Gi29FmjmzlIjv+4odphNxo5eZdfP7Uu53LYY1UQbL5QbfxOswRUgc9Tyi72uEdWB5KuOQX67lQAg=
X-Received: by 2002:a17:903:4407:b0:223:5c33:56ae with SMTP id
 d9443c01a7336-231d450fcedmr65689685ad.11.1747655970865; Mon, 19 May 2025
 04:59:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513-topics-tyr-regulator-v3-1-4cc2704dfec6@collabora.com>
 <D9YXK1J1XO37.JVILKENRKYXD@nvidia.com> <498AB71C-58EF-487E-8D9B-C7C113862948@collabora.com>
 <D9ZQUUA4FLXD.19MJI9HD48EMZ@nvidia.com> <8517D6F0-C1A2-4E38-8E62-57DCCD5E58D4@collabora.com>
 <DA048ETXB1Q1.3KVZ2FHENWKDL@kernel.org>
In-Reply-To: <DA048ETXB1Q1.3KVZ2FHENWKDL@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 19 May 2025 13:59:17 +0200
X-Gm-Features: AX0GCFvMUIBqu11KjPn_w_bCNvva2n4Px0xh--eXOiUYoJwmDvbLFBVm1zvISnE
Message-ID: <CANiq72n-1J4kU_4QwGGpxWB0zTN8Kr9Na03nBB4XypvbsQeA7A@mail.gmail.com>
Subject: Re: [PATCH v3] rust: regulator: add a bare minimum regulator abstraction
To: Benno Lossin <lossin@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Alexandre Courbot <acourbot@nvidia.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Boris Brezillon <boris.brezillon@collabora.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 1:54=E2=80=AFPM Benno Lossin <lossin@kernel.org> wr=
ote:
>
> I think we should remove it, as it also doesn't have any users at the
> moment. Anyone that needs it should define a custom enum for their
> use-case.

Yeah, it has a similar feeling to `bool` parameters, i.e. whenever an
`Either` is needed, it is likely clearer for readers to have a custom
type instead.

Cheers,
Miguel
