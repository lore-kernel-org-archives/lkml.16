Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4543F221F13;
	Wed, 18 Jun 2025 21:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750280897; cv=none; b=G+Ao8DMPTJHXQYjIN1SYmI7vzCRX7OxCveijUV/RGSTTtiMH9ZWP9c5fvE5q9R4S3yuP3qtN3WtT1YIJ602Abvdq4bLZ6PnwyvjCOjaxK/bDg0SQ0G5ZyBfGtELaflXMatrFqwxPQXlwbFfI+ju/X0v9YtcxJ2wynx0tX46tHhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750280897; c=relaxed/simple;
	bh=Q8YNz0u5UMmaGNWoguD3QZNfFQWgLplMWIX1k6YCLeQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=bAht9mznr4lF2cRzH87VpXmw0muiFh17TlXgXXttesTTf0RxidU78QbB8hBZka0DyiIWKR0YVVdPSRxv/o52MXwTth8boXVFDqGk2BzpwSmmauDpGoYtcxxDaodBVFh9EPVI0A2MUk6T8T56LWT9sXmkuPB4QW/3WLo0+/Zu9nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pe/UR+6Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pe/UR+6Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E3FCC4CEE7;
	Wed, 18 Jun 2025 21:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750280896;
	bh=Q8YNz0u5UMmaGNWoguD3QZNfFQWgLplMWIX1k6YCLeQ=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=pe/UR+6QLyZNNcX5/R5QKfJfftYHb7rRgVMYvoUbbntESDcoomfI6wgVi+vaIjFni
	 caFGmiAsQXpO+T7Bx48C7YNaJSGLmIyssA2/loenfDuxktnQonSi8NpgBCNySpEdmI
	 VDEp8qgY/dSpxPaziXWxn6GgvWwXzv9wKr6QDVS8JIO2ox5KgOWUm622HgG2xKcicP
	 eVDcSYWqtHoehb1Rx/HXGFHFHAMjYeZNmA93s21IsbypTLZ7aWMr7xSxEKb6/foFKm
	 qvh/BAYo9BegqDeNs2nu2I6lK4nUHFJARFB7eYyv18igyAka1ohl0zUGDe9Jgi4yVJ
	 OJhZvCSWWwa9A==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Jun 2025 23:08:12 +0200
Message-Id: <DAPYSLVCFJ81.HP8134AQOMEX@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 4/7] rust: str: make
 `from_bytes_with_nul_unchecked_mut` const
From: "Benno Lossin" <lossin@kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>
X-Mailer: aerc 0.20.1
References: <20250616-borrow_impls-v4-0-36f9beb3fe6a@nvidia.com>
 <20250616-borrow_impls-v4-4-36f9beb3fe6a@nvidia.com>
In-Reply-To: <20250616-borrow_impls-v4-4-36f9beb3fe6a@nvidia.com>

On Mon Jun 16, 2025 at 5:34 AM CEST, Alexandre Courbot wrote:
> This method was probably kept non-const due to the absence of the
> `const_mut_refs` feature, but it has been enabled since the introduction
> of this code (and stabilized with Rust 1.83). Thus, make it const to
> match its non-const counterpart.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Benno Lossin <lossin@kernel.org>

---
Cheers,
Benno

> ---
>  rust/kernel/str.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
