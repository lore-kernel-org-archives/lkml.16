Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3182E1DF27D;
	Mon, 26 May 2025 18:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748285109; cv=none; b=gR8jsyhgsjQ9wncFLGELLXMjCv0hC6ZDf07nU3sdAr/yd4mtTMmj+Fa8MjmxLsk1R+HpeP/ZPPa/SyKaGu5rR6a8p/tNQ7m5FZbi+8jLZeGRWdX+3L03zvg0RRAJPgSEnWlp84DT6sunvDRY2KdbMQePAVaFxGzMK3C/BGoB9Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748285109; c=relaxed/simple;
	bh=Nvsng1M3VEP0/P+Y/nOKi3hfEhFVzGQcGw7mSdit6FY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DJ9JM8UQy7pL1syuaZot9JHStJs4qwJgS3icFow16U5cYsThtKTPc4vTg3sfW1+svsfl4vubXO+P1tfh79GAn+cpNIOLsmd4HVxUq79e6t9U6Y+kBUr0Zyi7mt7ZjxMk/Rrbq7kcAjS5rxF7LIkM725248pJdDbIiUcctErpacM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FfbWMpNV; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FfbWMpNV"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-30eccc61fc0so467268a91.0;
        Mon, 26 May 2025 11:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748285107; x=1748889907; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4L/7CKyfl0ysj1y3zLGYsOxDTTbgS+vRVJUMoyIlbNo=;
        b=FfbWMpNVTgDJ+8HGoMcdOGihLEauZSQGv/ppLRkBHlblej5ZgaaURKhrpNGfIbu94W
         ZDeja/ByO+5oFlPHqbomr0x1SbdCy8fJpxYC2aVxdrDJsGE0gFrKej8uR1s8XzeYwOCS
         owXRXUqQOdwHcXrBzwYc/aXCRUH/wfIwqVJwns2R8cFB1Pe742hboxZ3VzN+zdO1cU5G
         ZmOAe+g3FqSVZcyGMVWwJGnY3soYGOxQKjEfUoMQFdQF/0JzDCHWLTU0gvpipafzfqnj
         zBK/iO+V/ny20iYj5FMNh+5GLyqvFQRWoqn1KOxDOEjQvQfE7UYOYmRB4UIKtbpWIJ7H
         CDUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748285107; x=1748889907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4L/7CKyfl0ysj1y3zLGYsOxDTTbgS+vRVJUMoyIlbNo=;
        b=ROVlNh1SZLGy9G15YxKGxTJEthZPV3PF6E6hW/MBVyzRG2yhpeb+I5xJenoBcmdJEj
         qlyrL+Z7uocVNHf0hkxw8rl3t4xd9Igwk3vJAq3w99TaVxJBlCAgtP2MEnmUsbM+0EPR
         RoyOb7vF0MV/0DQBpEBAbCbwMeOyL5IgLj5l9UEdrrXqTmzLwt2urWcHZCpcr49P2KQq
         gaE/xdO1p3kovXY/5bfAulLahPdcIqudrIgEe6xf9FIWtIyJM+npLMDNJM0JhFQR+WQ6
         gftozhKe87lMdwjxK0FsyLzw1MqxZOQH6yagvNH5VFizLgeUHx5PEs7fHMrnxoqmNjmf
         WOdA==
X-Forwarded-Encrypted: i=1; AJvYcCV3BDZJIx9ecYQBPTbRMMLAO9ReeQrXIrcEVaz3xy/qWc392YMfZg8m5+iqRtHEIh5RyEzelbAz4UGpRSw=@vger.kernel.org, AJvYcCXtxvXsgSaXtPBsY1gxMUISBAxhOY+cYZNkXfoiCU+TXFzC3kTdxojZFxMIxU74/7fm/5xKP+UGUk9K+n4TN5o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPbS2YlkMTy1Qh6/F1XApHIHZpvjDojEK+v9VAny/KnSQH72NA
	6QEiP45O7mQKxjscgfd7VvgOZd5c2RTe34qZ+1wQYDskSy8eNvy3G/pD2RBrOa/Xk1JujMj8YqW
	F4dyMbks875lNThQ8MEJ+hLFa2agePA8=
X-Gm-Gg: ASbGncumCxQqCjh+oUqo0BxM1pjjXLxhVSYzpZfbb70tknAlWbDbwDeFLJDWFa2/zeo
	M5DSUaO0SOuMiGC9qkXVodvIRm6B2zoobAa5f8lrvtW9+TmTzNDIvIfQ7Fyb51cdeBlcdjJ2pn+
	8Jo3Np6XY1rYlikPAO2tRuuIhj81XqrMIC
X-Google-Smtp-Source: AGHT+IFsdQI45HGMaN7TbR/Sv2yYFsqF7rIMKdM8IGGfresEX9wYWE6zOJCWEgcwF+HhDAuUtLOa7547KGDPsscLXpY=
X-Received: by 2002:a17:90b:1b51:b0:2ff:7b41:c3cf with SMTP id
 98e67ed59e1d1-311108a4f4amr6107720a91.4.1748285107267; Mon, 26 May 2025
 11:45:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241002022749.390836-1-paddymills@proton.me>
In-Reply-To: <20241002022749.390836-1-paddymills@proton.me>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 26 May 2025 20:44:54 +0200
X-Gm-Features: AX0GCFsCgxo8_JvRsRuuodr_OGfVZfsiTqMzzl7-BHPkKy3dBMnOSoYqjHiy7hU
Message-ID: <CANiq72nwwQdzgiC4QLX6BkJ_bDUS-qTCfe0UKrPCiAF5k_P=SQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] docs: rust: make section names plural
To: Patrick Miller <paddymills@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 2, 2024 at 4:28=E2=80=AFAM Patrick Miller <paddymills@proton.me=
> wrote:
>
> Fixes existing rust documentation section headers to be use plural names.
>
> Signed-off-by: Patrick Miller <paddymills@proton.me>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1110

Applied to `rust-next` -- thanks!

    [ Removed the `init` one that doesn't apply anymore and
      reworded slightly. - Miguel ]

For context: https://lore.kernel.org/rust-for-linux/CANiq72nhNmLMdFTzpSQSxx=
MLanFA7Od6tBZ+3CrVERv9Spou5Q@mail.gmail.com/

Cheers,
Miguel
