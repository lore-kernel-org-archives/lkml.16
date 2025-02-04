Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043ED20A5F1;
	Tue,  4 Feb 2025 11:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738667481; cv=none; b=r2m6HllsixbUJsPKYJGRfutJMALiM+oETwJiE8frstqPXGi4HZtV9Q8ZaVmZuL0YwUvs3o7GRea6dCo23RsTW4fqyI6NfXYyExdG+eyE5gb+bUWzFJd2JmvwTiUGnIexMxp9PKGSTYFVAltSDx7RvP+0E1aBxcdYqYLqUIBpIlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738667481; c=relaxed/simple;
	bh=XHLDsuppodMrQgvlQLOZUGGOw1L92Mch8WClq/KsVU8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=l7Rt2nf70lAAz2C+E91VuE0aTmr8V2zsu2hwDwrfJ9KngNhpRprgvDt1R6fNIaJc8zpLYviAPIkcMMw64s/tK8O2qhEW0Vn6CQwucUPyHTz1a7mK8NMYLT6EH9IJY9RmcOQ9z24JjUYUSz+i3gzdM6CUwbD7zKkebIBZD6F4Brc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZLIsUfKy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZLIsUfKy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A352AC4CEDF;
	Tue,  4 Feb 2025 11:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738667480;
	bh=XHLDsuppodMrQgvlQLOZUGGOw1L92Mch8WClq/KsVU8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ZLIsUfKyNHFmDVXpTyzhpdfQe949xYNgrhil0BlADJghGAPJ1JabA5AZdfcxLVjWY
	 JkDI1dUIrb1/le98kQHSPV92JWuR+ZPn5iJR71KpRwt/oMQz0pmWgVdyApm3x2LSwY
	 IBcG028pTfLi8RAVA0dfP2K7JMKPXhSAnWx74PP2nbe12zfBwqtz+cKgwQXEe0doRs
	 eYYHn8CnN+4iWUkn4cssl4qiiTUDbyVwt0oI+Sk5+1d8E9vOpkP6vTpJp4+IMWDc3E
	 y4CgELeNuKGHcR+S7bPDHcQDjPxn8KCMdYR++YSqWvnf6h/FqRowI7VSBjoCgmG5sO
	 CGaYcL/kF8Ntg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Jens Korinth via B4 Relay" <devnull+jens.korinth.tuta.io@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno
 Lossin" <benno.lossin@proton.me>,  "Alice Ryhl" <aliceryhl@google.com>,
  "Trevor Gross" <tmgross@umich.edu>,  <jens.korinth@tuta.io>,
  <rust-for-linux@vger.kernel.org>,  "FUJITA Tomonori"
 <fujita.tomonori@gmail.com>,  "Dirk Behme" <dirk.behme@gmail.com>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/3] rust: Add `OnceLite` for executing code once
In-Reply-To: <20241126-pr_once_macros-v4-1-410b8ca9643e@tuta.io> (Jens Korinth
	via's message of "Tue, 26 Nov 2024 17:40:57 +0100")
References: <20241126-pr_once_macros-v4-0-410b8ca9643e@tuta.io>
	<poAqTzhtd43yGVAADApFHiRjactbLh1qhuAIUpJ-jTauxXWy6eowgNJfFfAk87AtrQJqPImRPPNjTabZhtG4Xw==@protonmail.internalid>
	<20241126-pr_once_macros-v4-1-410b8ca9643e@tuta.io>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 04 Feb 2025 12:11:04 +0100
Message-ID: <87ldumj77b.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Jens Korinth via B4 Relay" <devnull+jens.korinth.tuta.io@kernel.org> writes:

> From: Jens Korinth <jens.korinth@tuta.io>
>
> Similar to `Once` in Rust's standard library, but with the same
> non-blocking behavior as the kernel's `DO_ONCE_LITE` macro. Abstraction
> allows easy replacement of the underlying sync mechanisms, see
>
> https://lore.kernel.org/rust-for-linux/20241109-pr_once_macros-v3-0-6beb24e0cac8@tuta.io/.
>
> Suggested-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Jens Korinth <jens.korinth@tuta.io>

Thanks for the patch!

I was using the series for `pr_warn_once!` elsewhere, and clippy gave me
this suggestion:

  CLIPPY L rust/kernel.o
error: you should consider adding a `Default` implementation for `OnceLite`
  --> /home/aeh/src/linux-rust/module-params/rust/kernel/once_lite.rs:52:5
   |
52 | /     pub const fn new() -> Self {
53 | |         Self(AtomicBool::new(false), AtomicBool::new(false))
54 | |     }
   | |_____^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#new_without_default
   = note: `-D clippy::new-without-default` implied by `-D warnings`
   = help: to override `-D warnings` add `#[allow(clippy::new_without_default)]`
help: try adding this
   |
49 + impl Default for OnceLite {
50 +     fn default() -> Self {
51 +         Self::new()
52 +     }
53 + }
   |



Best regards,
Andreas Hindborg



