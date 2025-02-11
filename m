Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2651F9F7A
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 11:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739272252; cv=none; b=NYvPz5TooEffMkugwxBGdh4hrZyHznaYSWaYfKOtfbnM5Ta1R5LFDAQTVcD6WETQN+axPjXHcj6R7sdmnlB4wtL5HUaL3a4ZZQIE5/RcotRmJcV/bm5D4nlZBkISKLF+bmLqR+I7oWs0aigoTlNnmL8NFNF4I5XAFQjseQI/y9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739272252; c=relaxed/simple;
	bh=WPb2ORZc/9ZZ6+gHNdJlvp8bilbLUMvl7JnfNtvGfEQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G1xvD29p26DcE0j/hG54lggr9tmuW/AHk5BlugpUulhtd4LJXzF5XEp7ShmU3WIWH4w3dlxvrzOOYPa+jWXGpevVKhVSoVlRY6twJrXtA0NWj5SPj2+jIEl24JNJH70YYD5L0gcMkNC0CeMGmA/ZIahbBK/6JnbwNzO+KYx/ybE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=I47V+x4+; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="I47V+x4+"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e549b0f8d57so4654403276.3
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 03:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1739272249; x=1739877049; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fPNCIgpBAFQQZU10UukFXE6nijs336odSMhelfSJ0j4=;
        b=I47V+x4+oJekKAnoV39TFWOLke41Iij7hbPNnF6m1ImZmHZQpjfTfTdUiKccLXdO4r
         HKBTmy/gKEJdXY8PmjMFvMIh3hUANv16jj3PeEPiLek2mYRBlwVoVet9w7AKXPANGdT0
         1HqFt52fDYGoKvr1Ne7FqMQ0e/YhWOaYiVZu/40T9iQHkdJXhQduxY0ZcPbSdRxDxt2h
         T1IEairzYZDfLzFvIpOktsrYM0vMxp5B6Uzl5qh71InvAcbeCfC0/uPnMta2aDZ2ikDN
         6sh/fgPieq50tIF0pbslmOJ8fEfIZe9QuqXA/FmkVf712Wk9g7C6xQnwOApsKGtIOCnw
         Qhvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739272249; x=1739877049;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fPNCIgpBAFQQZU10UukFXE6nijs336odSMhelfSJ0j4=;
        b=ro/biju/sbBtcX3g9DaAW+GQZL64YbwoSgE4wGX3T/aUoWVluz5WCfLcL4rIaTM097
         PZ56ZGAzp9iRavrWyy/BjXT1AWBJ2eGlPeV0zW6Jt6pP5mRlwTlrVHraRs4/mr9TPXDh
         p3e2Mg0H7DrcsYslq09Yi5ZkxvOewxm7xqLNoXf1enSodhyCVzynecGiSvzR4plW0n/7
         VR+6oqHW8Yi/PhsICJEm8Emf5aHjlacjDc6zZWysRNAHEjxnEt/NOSfoX66yKrcBTbYY
         j6zkH79uFy/m4Gb7r9SAH+hApzb1sKaq9+zzevL5eup6aOI5oILl99hW3zUgW5mP6rSa
         q7RQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+UEIewXXCzAyzGRu1j4ehPcqHqid6VaNyc2fs06UxeSijIxfmEXIONNQAFQGe8ulD4Zt2fHW2HJ/1VbA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+U2q1ZEmly/p0VmaMGGOI+NipGR8Mn3oMjhIwrfPKPkMm42yk
	g4KeSEwwD9TiXfpRo42Spc6O7w9XfVmhfY+IDOEf/8KiyixeH5wrMgvKueuxO/kku+F3O06uCYm
	29x+LiZOh7iCRpaY8hngT5HRzsv1ZWGI4rlzL8Q==
X-Gm-Gg: ASbGncuOwboRoIxSvE9hRacJivjsnpIdi+FOrRZaIbL49RO6fy8hj2Cg0pGSvyhpl2U
	sjfbRvDZqoAOkFxc/5iDU/pF7iA5mX0o1P30DGX3UEUhCh/eAhbcdj9KlOF7NpAa2qtaPgGQ/
X-Google-Smtp-Source: AGHT+IGwcyBsYc46RWArEeADU77H8bXfVzk3irEgxqL38ZDIwj53ttNaZ+UD3iPTNd+DjLbLMEDFzT6kErsvcr/dhMw=
X-Received: by 2002:a05:6902:27c8:b0:e58:7aa:7de4 with SMTP id
 3f1490d57ef6-e5b462c2b38mr14587566276.45.1739272249457; Tue, 11 Feb 2025
 03:10:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250210163732.281786-1-ojeda@kernel.org>
In-Reply-To: <20250210163732.281786-1-ojeda@kernel.org>
From: Trevor Gross <tmgross@umich.edu>
Date: Tue, 11 Feb 2025 05:10:38 -0600
X-Gm-Features: AWEUYZn351_k4v10MDh5azMViiAdx98NkshCWwsinZSeHh9hCB6x5oVItn12a_Q
Message-ID: <CALNs47uBcyTmBdTBAPXiBcAkE0-4tih9j=VAv1rRcTcf_c2yTg@mail.gmail.com>
Subject: Re: [PATCH] arm64: rust: clean Rust 1.85.0 warning using softfloat target
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, 
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, stable@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>, Ralf Jung <post@ralfj.de>, 
	Jubilee Young <workingjubilee@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 10:38=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wr=
ote:
>
> Starting with Rust 1.85.0 (to be released 2025-02-20), `rustc` warns
> [1] about disabling neon in the aarch64 hardfloat target:
>
>     warning: target feature `neon` cannot be toggled with
>              `-Ctarget-feature`: unsound on hard-float targets
>              because it changes float ABI
>       |
>       =3D note: this was previously accepted by the compiler but
>               is being phased out; it will become a hard error
>               in a future release!
>       =3D note: for more information, see issue #116344
>               <https://github.com/rust-lang/rust/issues/116344>
>
> Thus, instead, use the softfloat target instead.
>
> While trying it out, I found that the kernel sanitizers were not enabled
> for that built-in target [2]. Upstream Rust agreed to backport
> the enablement for the current beta so that it is ready for
> the 1.85.0 release [3] -- thanks!
>
> However, that still means that before Rust 1.85.0, we cannot switch
> since sanitizers could be in use. Thus conditionally do so.
>
> Cc: <stable@vger.kernel.org> # Needed in 6.12.y and 6.13.y only (Rust is =
pinned in older LTSs).
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Matthew Maurer <mmaurer@google.com>
> Cc: Alice Ryhl <aliceryhl@google.com>
> Cc: Ralf Jung <post@ralfj.de>
> Cc: Jubilee Young <workingjubilee@gmail.com>
> Link: https://github.com/rust-lang/rust/pull/133417 [1]
> Link: https://rust-lang.zulipchat.com/#narrow/channel/131828-t-compiler/t=
opic/arm64.20neon.20.60-Ctarget-feature.60.20warning/near/495358442 [2]
> Link: https://github.com/rust-lang/rust/pull/135905 [3]
> Link: https://github.com/rust-lang/rust/issues/116344
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

This is consistent with what has been discussed for a while on the Rust sid=
e.

Reviewed-by: Trevor Gross <tmgross@umich.edu>
