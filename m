Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch [79.135.106.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E47F1F03C9;
	Mon, 21 Apr 2025 20:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745266869; cv=none; b=S9zdC3EMtwHb+xktbtj9ihUtMnJil2CaVM6pwYU7D8HzcG/j54kmU3ZNVOzYvfZgyRMiSqY8m6WCE66D6VXQMx1xpDZSL1s5mGiQ2Y+pQpOaDNB3cw51fbf05QKing7FsvxIbGL5qEb9v/2wuWJ/hQb4SUCi09FoddJRlDMg4wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745266869; c=relaxed/simple;
	bh=SNHULQLae+29mbC8k8yPrlV20ibozoud7qObQ7s2eE0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RH+5+nCidiOfLnd6sBBuXCrf3HYfz36X1itcuB2Bkp138K2sKQZUN487XGXpp+L8Jsr8Dx+M6UsKuzwmJKyG7P00QL//fgR1F1iYkeXJdon5euL+JwUlqVianItkbODd2xmunLbgaS6M3U4bLjp9yomekMmxz8g3YhTRdpOQVB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=PsTm4ma8; arc=none smtp.client-ip=79.135.106.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="PsTm4ma8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1745266864; x=1745526064;
	bh=gL07pE/qraSPNokPc5Pnq2XUFPgy4bK2nHBg1yiWiTo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=PsTm4ma8d+DnvYnF12JkUDrdAPHlkG3MqVhR2r9fDtp9pc0gPlEuTZgUe6RyEEqmp
	 lYiJy49BrlKU3J86vmX6Fl0WLr0l26hPeDhGDLCApruRHQ7s9MnbzJCJsWNNVwsEEL
	 nyakegfIdWYcNYMgPB330L1tx2BO3tk3lx/30rl3EkTFBVoBAt9OFPkmm/oVXxB/VE
	 0n1Mt/nuRPrt5O1urDYpdVM2ezREc9gE02iveue4iGq9mcvuIXFPL8Xz6BSDPx+OIE
	 AmzBLAuXDEFvtmILSvmlXUKWEz8xw4yghIdiYLjG6LhtJs6QH+HnKzhGDqFXPpOWcP
	 YFv7ttx4ZdYPg==
Date: Mon, 21 Apr 2025 20:20:58 +0000
To: Antonio Hickey <contact@antoniohickey.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 01/18] rust: init: refactor to use `&raw mut`
Message-ID: <D9CLGS3LFWPM.XB7Y2JBEM9QE@proton.me>
In-Reply-To: <20250418014143.888022-2-contact@antoniohickey.com>
References: <20250418014143.888022-1-contact@antoniohickey.com> <20250418014143.888022-2-contact@antoniohickey.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: c0bfbb14ecc41e9346d1c2c268248bbde3f00084
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri Apr 18, 2025 at 3:41 AM CEST, Antonio Hickey wrote:
> Replacing all occurrences of `addr_of_mut!(place)`
> with `&raw mut place`.
>
> This will allow us to reduce macro complexity, and improve consistency
> with existing reference syntax as `&raw mut` is similar to `&mut`
> making it fit more naturally with other existing code.
>
> Suggested-by: Benno Lossin <benno.lossin@proton.me>
> Link: https://github.com/Rust-for-Linux/linux/issues/1148
> Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
> ---
>  rust/kernel/init.rs         |  4 ++--
>  rust/pin-init/src/macros.rs | 12 ++++++------

Can you move the changes to the files in `pin-init` into a single
commit? You have both this one and number 17.

Also, do you mind doing the pin-init changes via the upstream GitHub [1]
repository? If not, I can take the patches upstream myself, but doing it
there is easier for me & also runs the CI there. Thanks in advance!

[1]: https://github.com/Rust-for-Linux/pin-init

---
Cheers,
Benno

>  2 files changed, 8 insertions(+), 8 deletions(-)

