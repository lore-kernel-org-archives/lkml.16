Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18302620CA
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 11:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749642150; cv=none; b=rrXiR879QaqDdc5Rr0N9JLekLNzD/WR5M5EpWWDQZwsfrcZXwRIjA24uowa+gpH27FjsAChmgi6jN7D8Gth31qn40mexYj7U3ItzotwNhRjmPbHP+3qP0xK3LUlNJT9+toegKcxeWj5r8Agthau/2UfvK+mGCHOHsGp+M6ql+vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749642150; c=relaxed/simple;
	bh=FUStS5c3S65wbp+fBe9+etII96TDwKJ+V/CIWybxzdg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mbioHcSl0pJ+h3S9B0zw9FLmU5jU70nGzI+HFDN1WtzVWz0++WpExXjPY7bYB4uVJEdk6diLFdigUs1pAsnAYNDrgt49ZTXFtAV8Y8itiNxJIQviK/pVxTKaG/STmFDPzl0YTIyjVIYuhIuQJ6Gx+wsQjl9PRqR1N3VvBwNkJa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1+fRgEjw; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1+fRgEjw"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a525eee2e3so4952571f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 04:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749642144; x=1750246944; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zkdBvM+Fb7Q1QR2EpzlOjG7jKFxnJ+dE1eIZu+8hsIw=;
        b=1+fRgEjwIu7wrploo/zU+xvh34Uq7pvkznfXdYPXCfhXc3ff9/X04wBCJUdLzkLpcE
         8ihcOwT/3+esM8Hm2DJxmZ0qP31oa7+tFQXBkL8Lrz4THM+7kqvlYMPrZxWxQJbaEuYI
         Esy6zjEojcPhug82yoXXeDYuSRH75YKvc70g+Yy3BMFpx7eNGbSwaiz2/4vVKZuNbWHT
         mZFsseLaIH5ek5++wZsLTCNrYeeJhH7eRfDdu60LkMitCzyTKCCez3zEECi1AtebecBp
         mN6AwC++JbZBztiNOp73RGje1MySwRusyzXfxgefOv8pJmUF6+piaBkN+9E8EYEQd2Q2
         F7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749642144; x=1750246944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zkdBvM+Fb7Q1QR2EpzlOjG7jKFxnJ+dE1eIZu+8hsIw=;
        b=L91Z8fVhBbGqlPoAyOY9aE7RsjeSzlIgeeV21NSP1n4P47PINIcnukfIa+D6rRyq6P
         ZDbGZScdFLtpwsoo5F9FBUkkvV2PxYQAtIUfXPJQTEWMABGjSuuvj4yRm8/jqMKdZS+/
         79Pwy/RGMh/+DAlomgp9pbDDoN/Ooaof12MW5Qi0bm0x9wpq8dkH6WlBcVLvYg8g9oFb
         SZLWKk//JKKvOftKVbTowKJz4STxfwdLX8VjW1T3BMs9YZ/MMNWhvNzLBWUW2ubQU9W4
         ukuaQFObj9op00XDcvPklQeqPyPUlkj51T4mkmkGhwn3Mr5sz4W4LhvpikBJiohUTCYO
         iXNg==
X-Forwarded-Encrypted: i=1; AJvYcCWc66gzFG5f8xLqRbVvBEBBM3wEt3NjhM6xHfl0O58j5Vea2QuZy4V2npQqQ4QI6dpoiRBYseXreTgrMts=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXtPCS/JOLf9zVrQn8jGdpoB0UrhzXEtG4GNra6TgxUoglSGmR
	IifDLJU5JvJ2LkF84Xn+871fqYzPyHIflO6XbIbk/dVBmuuN4mPACWbrSyXQG44R3dGgY5pmMxV
	4qwl7ANwYo1koF87xGVFDHD/bwpxtWcsOTYrmRn5h
X-Gm-Gg: ASbGncumHp/L3fOwxtTOwQQPl72xSoZDxzp9kUcxKf773vl2y9+QPMYnadQPJ1wd3p7
	eu4dcE1uWwDnc7ckLFTXcB4QUav/mcQeeEJoIZE1STqKgy89ZV/IhvgLfDSnwHXP1pc1MAQNPxA
	mmGDha0+MsfWS1KZQE2iGft+pgIitWgtEuNhHkfuFbyPFOxKfMSF2DGAL7EBkOXf5q2U1cjgjSB
	w==
X-Google-Smtp-Source: AGHT+IHWnc6SnzYf5mCJ2L3k+/PpxAJt0+Ab4vhOBcR5j5AmdvMvBATf9J2AGm9g8sffFijJPWPxsb9hnwgMMAouVKw=
X-Received: by 2002:a5d:64c3:0:b0:3a5:3b15:ef52 with SMTP id
 ffacd0b85a97d-3a558a9248emr2046677f8f.8.1749642144124; Wed, 11 Jun 2025
 04:42:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611-correct-type-cast-v1-1-06c1cf970727@gmail.com>
In-Reply-To: <20250611-correct-type-cast-v1-1-06c1cf970727@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 11 Jun 2025 13:42:10 +0200
X-Gm-Features: AX0GCFtbudxgpt1gl3GgxMZalwn9053z-4e3UEi2jcJlC65c2iByUhUylvF5NLo
Message-ID: <CAH5fLghomO3znaj14ZSR9FeJSTAtJhLjR=fNdmSQ0MJdO+NfjQ@mail.gmail.com>
Subject: Re: [PATCH] rust: cast to the proper type
To: Tamir Duberstein <tamird@gmail.com>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, Trevor Gross <tmgross@umich.edu>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, "David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>, 
	netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 12:28=E2=80=AFPM Tamir Duberstein <tamird@gmail.com=
> wrote:
>
> Use the ffi type rather than the resolved underlying type.
>
> Fixes: f20fd5449ada ("rust: core abstractions for network PHY drivers")

Does this need to be backported? If not, I wouldn't include a Fixes tag.

> +            DuplexMode::Full =3D> bindings::DUPLEX_FULL,
> +            DuplexMode::Half =3D> bindings::DUPLEX_HALF,
> +            DuplexMode::Unknown =3D> bindings::DUPLEX_UNKNOWN,
> +        } as crate::ffi::c_int;

This file imports the prelude, so this can just be c_int without the
crate::ffI:: path.

Alice
