Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D6921D3DF;
	Mon,  9 Jun 2025 19:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749498939; cv=none; b=dS+Yuh6rv37/Z5gMJuh3tQqBT2Jqu3Tb+nLYgxjtEKxye/THUjw19dwR2f3VQL7Cjy8VEWHzQNd62tJF86Twkja573BdUwmvBSOQG8hU5WyPduvl9zhrC8fAdZM+UdGvf8IRmTIfWDQHPqK77MeQ1aJxgiLVV+0eCdSTTmA9lw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749498939; c=relaxed/simple;
	bh=Fja1OBNVBuvxKS0DeYB80jh5t24e4Ji9SmWPYh1wcCo=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=W/kG7dTcef0ylc7le3vsrmQnNQi77561J4PFJ0CY2fDNRId7Hw/rxWUUxFi2yXtCq/qcyUX3BCipin9vTGL5eFwI/PGXak2q1wrepuJRdBXOIe20VW8X0Np9/SSExrhHmOPtma5OKcuRFExjZjOgLbQx7zX/QvScvcbU//4lb/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ShQPwaPB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ShQPwaPB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB626C4CEEB;
	Mon,  9 Jun 2025 19:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749498939;
	bh=Fja1OBNVBuvxKS0DeYB80jh5t24e4Ji9SmWPYh1wcCo=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=ShQPwaPBoyGjmFpdxYyMqPI7DWlrFG3/q7cDHSWrkafVFMyfToG5B8x/jLKk+55LR
	 2LMjhIf5p//HTDxwL/TSj9XYZINsSj009SyoOTthPvUAo9v9wVzp0fNoIr9xfLD+c5
	 bUT0pTCBOopJv+LnZ91KI6/p0IGhJmLXHlVmFgg/EVB4mCmNt8r4zJlrdyx7VbkP6h
	 MVaghy4T6DJ2QNj3tZjvESyh0pdGLxv4+bH9hpBNv3v7KRgkvatb5xrDB9ozCGgGFb
	 lINDcCZ8I5gyusawKxQucG500/YDDmHiR53ZV1hHtcGz/aJq0YIVqwGgZl/EntH8Pa
	 2/ZWlt2JRQUyQ==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Jun 2025 21:55:35 +0200
Message-Id: <DAI9M3GOQI87.305YXSFANUO4G@kernel.org>
To: "Benno Lossin" <lossin@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Fiona Behrens" <me@kloenk.dev>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: pin-init: examples, tests: use `ignore` instead
 of conditionally compiling tests
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250605155258.573391-1-lossin@kernel.org>
In-Reply-To: <20250605155258.573391-1-lossin@kernel.org>

On Thu Jun 5, 2025 at 5:52 PM CEST, Benno Lossin wrote:
> Change `#[cfg(cond)]` to `#[cfg_attr(not(cond), ignore)]` on tests.
>
> Ignoring tests instead of disabling them still makes them appear in the
> test list, but with `ignored`. It also still compiles the code in those
> cases.
>
> Some tests still need to be ignore, because they use types that are not
> present when the condition is false. For example the condition is
> `feature =3D std` and then it uses `std::thread::Thread`.
>
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Link: https://lore.kernel.org/all/aDC9y829vZZBzZ2p@google.com
> Link: https://github.com/Rust-for-Linux/pin-init/pull/58/commits/b004dd8e=
64d4cbe219a4eff0d25f0a5f5bc750ca
> Signed-off-by: Benno Lossin <lossin@kernel.org>
> ---
>
> Depends on https://lore.kernel.org/all/20250523125424.192843-3-lossin@ker=
nel.org
>
> ---
>  rust/pin-init/examples/pthread_mutex.rs | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to pin-init-next -- thanks everyone!

---
Cheers,
Benno
