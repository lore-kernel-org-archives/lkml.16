Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B329185B73;
	Sun, 13 Apr 2025 22:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744583038; cv=none; b=BjJ1ZLiH7UnRAyhm/d1Q/807r85Xy6gKBo7g3LQswcW5Mc40ShnUFYWvNC1gMC1V+RR4K3aFu7wJW79r5rwfzIUcf5n30bqF4Trj+CO9UG6PzYZTrkuq7AqeerA/sqH/4ikj04vNI+ZriwJtIQ2ZJ5MGWO7lhyB0rZSsjlXuzDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744583038; c=relaxed/simple;
	bh=5FYs8INds7Ez4rx0YeDUnsyiLSwgDZ04qoFGJdZBQxo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QRvMkWoF5olVp5HfkTDf9WBK4I8wfKSON0052qRFKoC3rUVllUolmM+ImTFf+X52e3riCo8zbtBPAdYw9O5wA+donHO3XAs99navqMjBowJ0MHNk37G8837q+g7HXq0MzWFvzLu7bS5ihv5mWKZZRBoesILpGBdEHAGQTIaEdNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HZOgUXwJ; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HZOgUXwJ"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-308218fed40so547538a91.0;
        Sun, 13 Apr 2025 15:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744583036; x=1745187836; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JtKqjWftrBv3XifKdy8QoheRf97Hhhgt1ezEOn9xOFg=;
        b=HZOgUXwJbM3fhyGEBkxUPnxUnWCWH9yL6fKngwRvHV5rL0/Evgfb5ZULhHL84GUqIc
         r6ucdKsjpCn8x8p68l70q94kmXLLZIDwrFQcbY3FtEt8n63Sn1FhlmbisWfYyMokrlbf
         0li2S4U65xcETSesKyXliy3/QGxAwI0uNctOTXR/3FTwJe7jd59aWpbVYAenmXpZnwyu
         MnTO0Znbp7IfP9p4OV/LgGF2Wi54nsU33kkgdwM5HFiAuOg8lda2XKEKIMXk3Jxh9/Bj
         PZqgQ69bv46d1B3aKzj5L38JKYtMl3kt880GdDMdpGDsySsNPkdBe+g1WMmwBxtRdtF1
         D6bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744583036; x=1745187836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JtKqjWftrBv3XifKdy8QoheRf97Hhhgt1ezEOn9xOFg=;
        b=aioN82JsZkBswLGJwe+cxvPCCP8w2KgcOKsPAAT9wHuRltMWgT1KgBh1/JBQIFfiux
         S/6YmvevauEfgmz7EpxCwiZY6WA5/AoydM6j/9n/J2p4BWsvV2W8InsOBpNd/Sc0DETj
         k5/t/JWxe+dZ0TvQDjqWav9iYzrI0rxIbZ5N9vyoU8oyyA4e6qDx39loCP8KyJiOQpZ8
         fcTaThYB1SxyuW516btBFtiTuAC+AORKT0Yc+vZhvlziwFIXUcZNljG5cgPsJezSo/Tp
         ykOFmt8bMJ+hQ/gFToJt6nI7WaQ5bzUGHGCLLkfhVXA5DD1SRIVxqgTXw5Q6NqP+dO0z
         mXJw==
X-Forwarded-Encrypted: i=1; AJvYcCU+Lx8Uyn6P/LUCxGYJCHliJHgGFenTjv8R4rSHvk8rNUG7MuPlD9wJKJZx3Ei0Vjh8E783yulfIATvMNE=@vger.kernel.org, AJvYcCVg3p43jvcePP9KCSVilLEPTBCiyOuqrEafWx4uyiC4+ZDU1yjfx3L0rV3JhE8vUSbjJv42DMRbUD+vBgxFlfw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFBxQJ0vxMPgkOjJJyLXloPEOXQGhV1F4Chi06UBhCO31YKOg3
	IOTHBTQO+1OmuQrrJCPP/I2XQFRqj0ARv0Pq2vxCaiInCM1rLPef4M1VS36/HYvt16GtHRtrg+L
	hXaG9jT+CRQb4ZR3HwMu84d+HJVw=
X-Gm-Gg: ASbGnctRHV9kfZ+j5yIMvNZoZCh01P+3XjGwIPM9mII93xJ0W+/oFgFfstb4RUDpDbo
	YRpQ/lKrmBIIgAekQsm+fMPmgDZ6NUVUURbuPQQHPyUnRj+K6Skwpc1TPNjW75QgFdFp/Cu0A30
	wtTMn0Zy/6RKuQXK9s+TjXh1C0iXVPtoca
X-Google-Smtp-Source: AGHT+IFn54TeU1wvrhM+EETyqE2jfpAh99vnK/bWnAlwD8UYhKCBm3zw3fsjUt5iMwkM9AYvBYjY6Tn/XVChVgFGHIw=
X-Received: by 2002:a17:90b:4d04:b0:305:5f20:b28c with SMTP id
 98e67ed59e1d1-308237c95b7mr5577155a91.5.1744583036271; Sun, 13 Apr 2025
 15:23:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403163805.67770-1-ojeda@kernel.org>
In-Reply-To: <20250403163805.67770-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 14 Apr 2025 00:23:43 +0200
X-Gm-Features: ATxdqUFCL9YI86SaWAnwIPahf3eeE-5GZirLfIgzlqffagRKgM5I46QYtOigHMo
Message-ID: <CANiq72=SxWfcnKy+82NddPbMTEtcyED8r7aEbivBHekodnnNHg@mail.gmail.com>
Subject: Re: [PATCH] rust: disable `clippy::needless_continue`
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 3, 2025 at 6:38=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
> Thus disable the lint, at least for the time being.

Applied to `rust-fixes` -- thanks for the feedback in the other thread
everyone! Tags still welcome for a day or two.

    Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is
pinned in older LTSs).

Note that we don't have any cases before 6.15, but I added Cc: stable
since I assume we may in the future, and it is easier to just have the
same set everywhere.

Cheers,
Miguel
