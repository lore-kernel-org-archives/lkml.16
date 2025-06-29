Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D5D33985;
	Sun, 29 Jun 2025 19:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751225525; cv=none; b=hdZI6q98IdClRB5jkf2g6WHPkR5PkYPpDix+bfHwVAM+IZ9JGlVL/DO8GbsRXfbP6kf4+F+uNsp+mmgDLX66jzZXHG2DRiRq5Sdapb/u2Pv5pjSVhSJqlqscGKQFq11Ko4nRLOF/PSEMWniT0v2MYpB/1zaCrucvHaDptCFThOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751225525; c=relaxed/simple;
	bh=y5dO8G1ADyUmkZBcfMVX/2ZIDMYldZ3bd0cHOroTZ7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EYk+Cy6pX1WFsbU/hZJX8pHV/2Kq/tgw71kI5ys/6ZrvJ576ahUDJq2afYjcLrKlJtSog3ODQyUf3KEchWpl1Rb+GxqPG3qlkQIhAYFQV1P28dM+38AaEzmlIpkKCA4qlguGKRMk3XxWWEBeDahSErFM9vIV9A8ExF5EAi7Q6pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IBea8Gak; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IBea8Gak"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-31305ee3281so536479a91.0;
        Sun, 29 Jun 2025 12:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751225524; x=1751830324; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y5dO8G1ADyUmkZBcfMVX/2ZIDMYldZ3bd0cHOroTZ7Q=;
        b=IBea8GakiGw8Pd+d5wioi9cL8bu1F0cxA74jrcNXXypF20NkFgGkWVy4ssCnwU9GZn
         ovDCG7o6KbZKpDFtHF/gelklj95rBw9WZXHKDNuHqQSYGFIWTHSEw27lrvmlLbIzv/aF
         P4NH0aXJn9fO9iQi0ar1PprtwxU71H/xs0CfYDa2NrsuLVHg2bJGVkhlZzSmrJ7gXRVX
         lsmKVFKXDwY0XVGvJZxA8V9lW+C8Y15YqZOKxudMUZgD7WFtxq7n5p1sRa9Mofe69UpN
         rckBrlx4xKrQUxNCtjA6T4Az+NOJvtJwIQtocKfrPIY5KFxWwbaKS/06JCt6D5y9NzCF
         /Zmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751225524; x=1751830324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y5dO8G1ADyUmkZBcfMVX/2ZIDMYldZ3bd0cHOroTZ7Q=;
        b=vwF53ZFKlf8TDlRCbb0Jq7mIf1KX7fSy+2VbWlP7hh3pz1woz7sZ7mbIDw6PewMJox
         M0rKRu5WBg5hcfPU1s1RDBI9ouXguini8WkZVfuc1SvJJoXkCr8f+tnSaJ+rqpcWC+wX
         jH98hSlnAn6x1K554J2sQ7QIaXoa4zj75Cr8w5FwUoDbFgYJw0TULr1LQV7v1REGfAre
         mBL93YYaFf6QoUwMBoiKL7wYySbL8yFjTtdq6qYi++6O1mk6gaxI1WlUcpWkAuBvsdHD
         Db7YxAhip4/UqbM5dm3pGpUcGuCaEMEAXnghcrcXFY444upgb5i/kIR36PZ6SRX5pO5f
         aV8A==
X-Forwarded-Encrypted: i=1; AJvYcCU8n9o8gi+DZmRnhr9jP2dGYniEwIKv8n8/wxkkttfNw2CX1gfwsmWIbooEOQZRTu9aAZt3+SoeGiEMO64=@vger.kernel.org, AJvYcCWXZxyfIn0uyL2Yp+5KgWdsJGeacne/VSiImYWA0loY9Pxz2LXu+bYfnUA/mkgPXT/cUhMTOUX9GZcG9iT+C68=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaZJKebthzmbXsnOKTkrjHrmU6RmAnP81AWhHLhFZQl+F1xFaj
	fUogrsQGsn7XKoLSVysJ7jJR6tKS2VzEGHBGb5MybtC3Vjo3lKLinKTZnad3M3JiD5eREOrzHil
	6JDRBL7hn+2BOWM6OiUoYX29miYxvkS4=
X-Gm-Gg: ASbGncsMK9NHUeXePjCTfvJjmxqLvGMhSqrsgBvXqSFvC4KX5kD7805QFfasK9cjulK
	7PdETZUgUf/fbjEmVQGYNAivu0++/eI8JUJJ2bpM3426djmjALmnJCpSUgrNRHvg5xSAoHGcBlq
	3OQEHTi+KjWquLkMY7emguoY0/KO4pgzrkdgoCj5SskFk=
X-Google-Smtp-Source: AGHT+IGmljKvwi0L1VuzXXIJbcHVDwk8pWEQrQQ6R7YtbTBOO+4b7KMey7Fx4tFYyE4rTrRaIuTegcUxcLvefvJZEsg=
X-Received: by 2002:a17:90b:3944:b0:312:ec:411a with SMTP id
 98e67ed59e1d1-318ec41cd30mr3752122a91.3.1751225523850; Sun, 29 Jun 2025
 12:32:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616-borrow_impls-v4-0-36f9beb3fe6a@nvidia.com> <20250616-borrow_impls-v4-2-36f9beb3fe6a@nvidia.com>
In-Reply-To: <20250616-borrow_impls-v4-2-36f9beb3fe6a@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 29 Jun 2025 21:31:50 +0200
X-Gm-Features: Ac12FXwidDzkDY1EQVX-OftX7JUYxjSXrUn6oS96z-bmORFELR9oGpUXYRQp4YU
Message-ID: <CANiq72nPHxExJ=_XxKKcAPO034dif+OVOeiFv33UDAQ4nBeHwg@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] rust: sync: implement `Borrow` and `BorrowMut` for
 `Arc` types
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 5:34=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> Implement `Borrow<T>` and `BorrowMut<T>` for `UniqueArc<T>`, and
> `Borrow<T>` for `Arc<T>`. This allows these containers to be used in
> generic APIs asking for types implementing those traits. `T` and `&mut
> T` also implement those traits allowing users to use either owned,
> shared or borrowed values.
>
> `ForeignOwnable` makes a call to its own `borrow` method which must be
> disambiguated.
>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Benno Lossin <lossin@kernel.org>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Applied to `rust-next` -- thanks everyone!

Cheers,
Miguel
