Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3FA231856;
	Wed, 30 Apr 2025 09:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746005578; cv=none; b=nUzd+NiN02lXHll0z13BWoPTY5Xc34pZWbUPzQgwTYDiuHf/lQfC1PFPNBqORWOsdZWOZdrQVSgARX3ZCgbyCsZqCO+cL4/u9TLITqadRXynkXZvQBwlMFV9yYh6hH+VDzPVzKjaSDUUYpvDIAAjWkGcPI8qHGUQDv5VxbgX8ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746005578; c=relaxed/simple;
	bh=rAJtEV8XNhHDLkmxcy3W+Ng4pKD/f66UzwwLY2Pf8nw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=CkrLw/NWXaJ3hLhTFCmEZlk6SQh3MtK3QSgUuIkkteJGikkNUzw3LyolX6P4J9+B3AIVvIwb2XuEkguZxJ9YToEYyVOxtQVtpfR148u2m3IJDRGfzP1rZqCr2KSDlUM88UrkDaesxeVYmFFOgo+t0sFK3j1K5DPv0TrHA/IG4Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aNUM8oOq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aNUM8oOq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E30EC4CEE9;
	Wed, 30 Apr 2025 09:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746005578;
	bh=rAJtEV8XNhHDLkmxcy3W+Ng4pKD/f66UzwwLY2Pf8nw=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=aNUM8oOqgMjwJCjvIjG4hLIcwTp3UNLPfvDg3UhQleXEiP0WbitlRJbGTXgYRH6Sb
	 cW1vK5Z6wscBDlPh7k0gV/1kJv+xF6e+QBmFpizgcQvCL32wH2w8ZZThR/4U6L2JAH
	 wSv8Fk4LQZSOCeZPes0It9ZE1DBhke5ltMiwLpCcuxpWM92q7cne5pc575FZvjBX6i
	 NIWDt1tdjyIkiteailksmuVcY45G1hjsK6UyRBxfSX7V5nEpaHoENamna/z4Cuf6LM
	 Cv1NEyIAEmJtzgurPbudHQ9TC3Dh5QW+BH79Zabnob02kBvuKOEbatXlm9mnAGkCys
	 cg5WFlCmrHrKg==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 30 Apr 2025 11:32:53 +0200
Message-Id: <D9JVBJ7NUE2G.3AFGELETSX50N@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] rust: implement `Wrapper<T>` for `Opaque<T>`
From: "Benno Lossin" <lossin@kernel.org>
To: "Christian Schrefl" <chrisi.schrefl@gmail.com>, "Sky" <sky@sky9.dev>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, =?utf-8?q?Gerald_Wisb=C3=B6ck?=
 <gerald.wisboeck@feather.ink>
X-Mailer: aerc 0.20.1
References: <20250430-rust_unsafe_pinned-v2-0-fc8617a74024@gmail.com>
 <20250430-rust_unsafe_pinned-v2-2-fc8617a74024@gmail.com>
In-Reply-To: <20250430-rust_unsafe_pinned-v2-2-fc8617a74024@gmail.com>

On Wed Apr 30, 2025 at 10:36 AM CEST, Christian Schrefl wrote:
> Moves the implementation for `pin-init` from an associated function
> to the trait function of the `Wrapper` trait and extends the
> implementation to support pin-initializers with error types.
>
> This allows to declare functions that are generic over `Wrapper`
> types.
>
> Adds a use for the `Wrapper` trait in `revocable.rs`, to use the new
> `pin-init` function. This is currently the only usage in the kernel.
>
> Reviewed-by: Gerald Wisb=C3=B6ck <gerald.wisboeck@feather.ink>
> Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>

Reviewed-by: Benno Lossin <lossin@kernel.org>

---
Cheers,
Benno

> ---
>  rust/kernel/revocable.rs |  2 ++
>  rust/kernel/types.rs     | 25 +++++++++++++------------
>  2 files changed, 15 insertions(+), 12 deletions(-)
