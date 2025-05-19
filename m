Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989EC21D595
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 23:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747696371; cv=none; b=YAD4A6rGV4irG2d9ESCyyvPWl5K/6dI/lxYFbAasIYQfaqyPAITkV2xstfNxsGRj+o26ErFJfem4mjaFymYnxdTXwFGgW7H3ELCMMeVnmiUyCIleBRJ/nRY3RWjoA5Y4+xjajf1uto0mT7btCzVSY9jSlE+7mJFBM5tfa0jzjX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747696371; c=relaxed/simple;
	bh=87hIp6c78DiL87agGJnXiJJQtjvJP3j41yfq86lXmds=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NidGiTXwPLguMtHX2HgIkGEHyjI7MtsT80oV8k1Y18xuOjyTSEnR+e7qWWXfD8xNFxKXooh+yaq30FrqkqdhgwIdhkibZKeX0pt/yJ961W0iDjb0CuUdKgsn2MRf8m3Ijii6X2TCp7Mwdp5KrbN483Wlq/5xYytQlWNjsqtfSd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PTFT408Z; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PTFT408Z"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3280b1a25b1so29323821fa.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747696368; x=1748301168; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=87hIp6c78DiL87agGJnXiJJQtjvJP3j41yfq86lXmds=;
        b=PTFT408ZRSKWpUJ368sG1SDa1gADZNp3TAosbCGQEA9nnyA31kXfZfP+U0URl73oKu
         L1NMdGr1MRKQ6NisYXLjDVUTa/8bOBlnU7MYReQ5OjrWiPXXkPIDck/o6O/Ac7BfSwMR
         TLGQsgfCu8ajZh56FP/jPy6j/WERhe3Ar9FPDn5PWrTAbXUvYZVhERMgI0+9U2kLcCwm
         1RKFS5/gQAeq+ANsYm+2e3Q0UYyVWVZ7Ig38Pnm0sJshRgH0JwMcC7RatMiH7lmYWrsI
         oNEOyVtKQVXQytSLwrDf6ubg+CEL/uT82t8eO/TIHY1xrnqlSFqZ28c4ejvVeH9eYP4q
         zMbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747696368; x=1748301168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=87hIp6c78DiL87agGJnXiJJQtjvJP3j41yfq86lXmds=;
        b=X7zhoff8ANyl0U7csTmeLmrSMENdrftH9tKGOgTY5Wm+J3dtszIIN9JiBT330MT3zT
         VoCwk52WwZMGMapAz36f1kf947BSihYrxKyzy27ZjEJNiRdMb1g/S7laDODl2crErlHz
         Ua3/SlqVduFvbYmpz6TmEgHcYsYRLJOOK4noaXHApW6cKadrZ2kWg2AoTQnpBfSfunF3
         mLI3+5ZxOmdygczrz+fzvko6D9dxq11riBrjZl7eJAaa0MdWRD485UQxgs7Wq/e8kOzd
         IL6HsNl57PW/s8dCW/tSx/s77gQaxRE02aPOfz8J+HM+uDd3abQIDen/km0tmvyGH71u
         V23Q==
X-Forwarded-Encrypted: i=1; AJvYcCW1nY3JVm0APuRx1SdrG9L/7ILdvzgHwT3grAYpTaDRW+OjltFQsK95KAoLJDEMpynmnlVSaeHAz2eCN5M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeGoaI2Gb7gCQgHCslhtZs/xGQ0turIHCi+n4NCiEabIT13k4O
	ajB7ttxgekYPmgAvMPeRCTZ34GK5Znk+3naDx/MIEGF0Dmbb3UyUNwPJnil/VBBQ0LysTU4R5ba
	CKyDYxmVS9oRHAnSiviGVCfd5T7uy05lNu/p07rFvlDzEFCzZhk0lemc7EsM=
X-Gm-Gg: ASbGncu19cZ2/KIvxPqWf5KIpAj7ixqjrq4Cz9q1Ityaw5u7oVWBoTMzN9ioO5HUg8z
	9Rg8ujcSDUZ4uwN7MZqkkpmW+Ac8YGJ9ZMTOHzTpxAIKwT0vZS3lqbPLeRh/HScWQ07+cJWywKE
	moYP5IRM1e88aU6GNJ/7Z+9f8XOLaeoCldXyusISdw1Llq+psTB+LPBYX5BdVsH+w1QDNQ37z4t
	A==
X-Google-Smtp-Source: AGHT+IFxjVvyKOGmjWHJznPp7p3rSwibUJdBaOZqXxE8AhRSbnaIU7l2iziSz1RfAcS4JYwrPiMZ+cyz28rt7IFl+Y0=
X-Received: by 2002:a05:6000:2311:b0:3a3:6715:afba with SMTP id
 ffacd0b85a97d-3a36715b0dcmr8982767f8f.44.1747696357043; Mon, 19 May 2025
 16:12:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519161712.2609395-1-bqe@google.com> <20250519161712.2609395-6-bqe@google.com>
 <CAG48ez2WdxXVCzVsAPeQWgso3ZBQS_Xm+9D1FLBx6UHFV1bGHQ@mail.gmail.com>
In-Reply-To: <CAG48ez2WdxXVCzVsAPeQWgso3ZBQS_Xm+9D1FLBx6UHFV1bGHQ@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 19 May 2025 16:12:25 -0700
X-Gm-Features: AX0GCFtuAkg0Wlc1J3hEEvQ6t_eM5QI8HhiIJsVxpbsn_aW9f8RIs4Pivn9RMpY
Message-ID: <CAH5fLgiK3T24gf6tjXGGMsjqj17dh0PFbRZboE5oXXp16yOLTg@mail.gmail.com>
Subject: Re: [PATCH v8 5/5] rust: add dynamic ID pool abstraction for bitmap
To: Jann Horn <jannh@google.com>
Cc: Burak Emir <bqe@google.com>, Yury Norov <yury.norov@gmail.com>, Kees Cook <kees@kernel.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, "Gustavo A . R . Silva" <gustavoars@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 3:51=E2=80=AFPM Jann Horn <jannh@google.com> wrote:
>
> On Mon, May 19, 2025 at 6:20=E2=80=AFPM Burak Emir <bqe@google.com> wrote=
:
> > This is a port of the Binder data structure introduced in commit
> > 15d9da3f818c ("binder: use bitmap for faster descriptor lookup") to
> > Rust.
>
> Stupid high-level side comment:
>
> That commit looks like it changed a simple linear rbtree scan (which
> is O(n) with slow steps) into a bitmap thing. A more elegant option
> might have been to use an augmented rbtree, reducing the O(n) rbtree
> scan to an O(log n) rbtree lookup, just like how finding a free area
> used to work in MM code... That would let you drop that ID pool bitmap
> entirely. But I guess actually wiring up an augmented rbtree into Rust
> would be very annoying too.

If we're talking approaches to avoid the bitmap entirely, it would
probably be easier to replace the rb tree with xarray than to use an
augmented one.

Alice
