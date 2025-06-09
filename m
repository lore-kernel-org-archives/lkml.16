Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82D01DB12E;
	Mon,  9 Jun 2025 19:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749498924; cv=none; b=naKr04UxG6mY59BpQOkt8UUnYaMvCPJYuKsNabOqRq/Hwgy2DWgFqpD52DC+zorPx7A8KCO3Z1p3Jm+durASJrV4ZuZHCWXlf9K4Miiv6KStvmVWSWu8KhMbK6p3SELJrrnwM2F8AAkdq8AeprQZsUgl9c0YFTOoYNZXi9kGcL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749498924; c=relaxed/simple;
	bh=wzEumQKvSXdmy/0l77+/vrhQKTutBnn4rFlITTAYicc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=RDPIyU9GclQE/VvfJ223nfHcQjfeORpebEoyYhy8caksohfZGkyCGw6edVF5nOmJpCu4BJ/sqbi9gJdPWLN8qyBypHIsis1k7ZxIf4wJV4i28DV66evxDjTQGyIHL0cgCwhmXv17/FvSFSjzRGE46ehvkl1+flO/hf/6/jeq800=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hhavMQol; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hhavMQol"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7E33C4CEEB;
	Mon,  9 Jun 2025 19:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749498924;
	bh=wzEumQKvSXdmy/0l77+/vrhQKTutBnn4rFlITTAYicc=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=hhavMQolpJgKj69PMWcjn1ba6mU8e3DV1IUAqnkNkfjr0IrMP+SY9CWfCuwTXa8zc
	 5/VPDuevgvILxwyz8alEGFtBcOg1QfbwTS6bf9/L2FFmylrJ+oRwoae+afRoUVJdOW
	 NWMyxqYvyrwWhWdXBCEacU7cakr1P1rcGzY0BRsiaNyWQm0ie0shkpWujMvzjqI0Q5
	 f3FQot+T8hWUBiihpxlepcR6wC3lvVp5OShjGjZlLj3upGhaTvurS8n0a2fQcwfISX
	 MGEnESyBCTlVM8eD0koyfwz5xWAJ0/AelI+XvnATQEYURRwwUMi5yK9mXYlCiN/Dq7
	 1fKiZs23jhIiQ==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Jun 2025 21:55:20 +0200
Message-Id: <DAI9LWNA85HO.1FBVASCIN8W9U@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] rust: pin-init: improve safety documentation for
 `impl<T> [Pin]Init<T> for T`
From: "Benno Lossin" <lossin@kernel.org>
To: "Benno Lossin" <lossin@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Fiona Behrens" <me@kloenk.dev>,
 "Christian Schrefl" <chrisi.schrefl@gmail.com>
X-Mailer: aerc 0.20.1
References: <20250529081027.297648-1-lossin@kernel.org>
In-Reply-To: <20250529081027.297648-1-lossin@kernel.org>

On Thu May 29, 2025 at 10:10 AM CEST, Benno Lossin wrote:
> The inner SAFETY comments were missing since commit 5cfe7bef6751 ("rust:
> enable `clippy::undocumented_unsafe_blocks` lint").
>
> Also rework the implementation of `__pinned_init` to better justify the
> SAFETY comment.
>
> Link: https://github.com/Rust-for-Linux/pin-init/pull/62/commits/df925b2e=
27d499b7144df7e62b01acb00d4b94b8
> Signed-off-by: Benno Lossin <lossin@kernel.org>
> ---
>  rust/pin-init/src/lib.rs | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)

Applied both to pin-init-next -- thanks everyone!

    [ add title prefix `rust: pin-init` - Benno ]

---
Cheers,
Benno
