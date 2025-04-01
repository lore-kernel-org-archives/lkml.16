Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C121F03E0
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 23:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743551601; cv=none; b=TNgTrcE83IazGrMeHt3zUsfP1g+UBKd0KRGC2WXoMIgfsQmPRPR4i26tZ9oNQqnwEgwPwtj/IqDztS7OesJ1NgRe81CxEtSi5yZZhJCDE8NCeNPjlB+WqQFsfT+p0NxoqSA5kWSLrMzpYTc5CNPnlLG6kztLi6ddZKF68WeGem4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743551601; c=relaxed/simple;
	bh=lMqJA5YO4EpuXajO/VUaIW9ecys+h1Mr7kvLiUfEwcI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JqZ6n3ogcXnJ8ggOgYzJPE+z/V5AUhTNglj+U/d6i08wtYpjhDfc+oEyEU+kZvTK4Z5pvqBnRILMlbL+StSshlkHKIo8a7u2aVqO3otLxtqrSGg1MgWhji5p6slSlmIAcllh6dLDiL032IOsNVF1gwihMg9Ln0jNGUnVskJ/c9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=gVoh8Mom; arc=none smtp.client-ip=109.224.244.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="gVoh8Mom"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1743551588; x=1743810788;
	bh=h0L6GsC79ouPc4RnXP7HsbTQ5eC7lCgOZCF9zKBs/N4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=gVoh8MomFoEwFWNT3aW3yg0vBbg+CuX0QZGsJnFgOJ6Mcj7VQm8tjEDDy7ahvcojs
	 5wywmsXVJ8CeoE7IcXWjRauqrb4ew8Rny2rBcU9P/2Hr6lgtHBtlZHD/enqT/ykdBB
	 Hz/Fy06Z/mLR/b+5OstaQZT8f2OuJ5NPF1S3d4mlVyT5iX1sGqtesHrC9RLYov089g
	 XzrXAPliIFMjXCp475INC1sJa0yQemjThpyvWl8klT3i6ZzHz8hesyrpT8jFJEZYpn
	 LIRs7XisAUMfunHTt17Mc8G2qExKUe1vfSKLLybsZYBrRj7OmzAf0vPHxqmj5dk7Rp
	 m89kxvDQcvMTA==
Date: Tue, 01 Apr 2025 23:53:05 +0000
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH] rust: clean Rust 1.86.0 new `clippy::needless_continue` cases
Message-ID: <D8VPGBN60E61.1Z48FQW6TL3A@proton.me>
In-Reply-To: <20250401221205.52381-1-ojeda@kernel.org>
References: <20250401221205.52381-1-ojeda@kernel.org>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 46df26921875262ddb18c57a7d2b1ba67cd0b710
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed Apr 2, 2025 at 12:12 AM CEST, Miguel Ojeda wrote:
> Starting with the upcoming Rust 1.86.0, Clippy's `needless_continue` lint
> complains about the last statement of a loop [1], including cases like:
>
>     while ... {
>         match ... {
>             ... if ... =3D> {
>                 ...
>                 return ...;
>             }
>             _ =3D> continue,
>         }
>     }
>
> as well as nested `match`es in a loop.
>
> Thus clean them up.
>
> Link: https://github.com/rust-lang/rust-clippy/pull/13891 [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
> To be honest, I am not sure we want this.
>
> The lint can find cases that should be simplified, and it has been a nice=
 lint
> so far, but somehow I feel that using `continue` shows the intent better =
when
> it is alone in an arm like that, and I am not sure we want to force peopl=
e to
> try to find other ways to write the code either, in cases when that appli=
es.
>
> If others feel this reads worse, then I would be happy to disable the lin=
t and
> open an issue upstream to keep the cases that are more clear cut.

I'm not too sure about this change, if the loop is longer than one
screen, it makes a lot of sense to have a `continue` instead of `()`,
since one might not see that there is nothing after the `match`.

I also think that an explicit `continue` is nicer from a expressability
standpoint. So I think we should keep them.

---
Cheers,
Benno

>  rust/macros/helpers.rs | 2 +-
>  rust/macros/kunit.rs   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

