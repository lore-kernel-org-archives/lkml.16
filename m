Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F381E8320;
	Sat, 14 Jun 2025 19:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749928848; cv=none; b=ekNG+3x36lVH3dX0B9jZRmEAwaFZ1JBESLvxMsHpJUhRSkzwRaiWOGyKQzw8BxKF4HlfZyDQIp/2vu5Huj/7EA0C9M0jsTYsiyQ57Q052xq/RR5Fph5WJ63HFwD8Ro+T09ItCKN7FehmDmGYFymWXrdI9K0yJZ4yxbB9SEzPtIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749928848; c=relaxed/simple;
	bh=Ar6HEt3C+HQk0esfz9e5lnlqPKLv/84dkJ5c0Jb/17A=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=azxdTAhnlNP6HbfCEMzOOKgoN6vN4pTSjisuFQ8D9BWtmEav27YxBXhYxB8J2hZD2DUaiqG8gmO/l6uWLE4kGe2nYHRMsAV7Ht1sPhRhN5uWawScfvZfbR+FJX2Ct83hVrFefbw0lDevewxxaR8TOIU6R9axFe756ben/vbjlZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=renokmq4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="renokmq4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC490C4CEEB;
	Sat, 14 Jun 2025 19:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749928848;
	bh=Ar6HEt3C+HQk0esfz9e5lnlqPKLv/84dkJ5c0Jb/17A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=renokmq4Pjrj9p2aX/tTodguECSq4C+6mOQT5LaI2H1/D3MCGsWKHAWw2BjGmWo/n
	 qBE2iQrkx3QzXkQWOh32qaDSl12yO+ZC/cMLl3SHO3Os5H3H+m8RLvBc8N/YB0J+4d
	 uVVN8TfZYTrPocNDp9W6e2kr43zWrtVR46ZaJu3K1o44mcBCdQMpllPQwsFLrtPoyk
	 iP9Epwkw5gFpHvD8uK+aYSdwn6lnVC4ATs5aFUXBt3OTi4smNtLdAmks32NYcefEeq
	 DyvwUm5Gzk3bA0g2JMjF8b/VYVukqIw10IWdRQcQgLLv2g9wbbK7NhdB1/HhlsnuFN
	 b7UgvoLKR9URg==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Jun 2025 21:20:44 +0200
Message-Id: <DAMI04WSAC0P.3EU5B6GMY8EMQ@kernel.org>
From: "Benno Lossin" <lossin@kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/4] rust: sync: implement `Borrow` and `BorrowMut`
 for `Arc` types
X-Mailer: aerc 0.20.1
References: <20250613-borrow_impls-v2-0-6120e1958199@nvidia.com>
 <20250613-borrow_impls-v2-2-6120e1958199@nvidia.com>
In-Reply-To: <20250613-borrow_impls-v2-2-6120e1958199@nvidia.com>

On Fri Jun 13, 2025 at 3:46 PM CEST, Alexandre Courbot wrote:
> Implement `Borrow<T>` and `BorrowMut<T>` for `UniqueArc<T>`, and
> `Borrow<T>` for `Arc<T>`. This allows these containers to be used in
> generic APIs asking for types implementing those traits. `T` and `&mut
> T` also implement those traits allowing users to use either owned,
> shared or borrowed values.
>
> `ForeignOwnable` makes a call to its own `borrow` method which must be
> disambiguated.
>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

With the doc comments fixed as detailed in the other thread:

Reviewed-by: Benno Lossin <lossin@kernel.org>

---
Cheers,
Benno

> ---
>  rust/kernel/sync/arc.rs | 84 +++++++++++++++++++++++++++++++++++++++++++=
+++++-
>  1 file changed, 83 insertions(+), 1 deletion(-)
