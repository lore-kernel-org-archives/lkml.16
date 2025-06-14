Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E591E8320;
	Sat, 14 Jun 2025 19:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749928862; cv=none; b=CDB8TcbT+8jvbuq09Sp6Qxv3Zq2zINAO90THpxDIiHyFZE8tNsvId2dZPQrWUqadrkkJTWn1AonjK2wGmvBwiQ6Rl93EIRU5uDe1OMtJ9YGkCr39Ogz4zr/dQN4SS8L5htr90EWeLaVjsQ6q66WxUQiSb0tzNryoT+XDCzjdHh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749928862; c=relaxed/simple;
	bh=HLm7126Q2v16NMz6qG6wopdMM2nsPw5IElwnstbuLD4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=gZN9qLLl9z/yLJqm7yM+jde2mjvZ8Gp6hMRqbSe9OIKpz3SKlqtPSrEo9Im1d/PZfvMJlfYMC+UQ3QH4o7N7LSKaXZO3SpZ0G0aPgqhRDvJijN3h1Mw7VzN7ceyPTe3T3uG/EmkzzHPiW1BA9/MDhezuRyR67UjNlX1VXUxANZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JmSDanNc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JmSDanNc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 951B2C4CEEB;
	Sat, 14 Jun 2025 19:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749928861;
	bh=HLm7126Q2v16NMz6qG6wopdMM2nsPw5IElwnstbuLD4=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=JmSDanNcoBEx+9wlTBWs6S/LUJQu46YF+PGyBpcD3iMg7SwS5OLwlFlpYfU8XATuy
	 mDQnSOP8W9Jylj/W2qGAoTOfeQ/6SoOO27xf3OWSLB2uILyMAsvXWoVZWDmu6ffWcP
	 2fAiU9XNerXNfCPjUob38nD/30xy8gt8edDaPcs+uQrfPSF5AwOsyaFT2ZBqWEKncw
	 gAZ4JsraJv2rxvgkqxbFlpNlwmRPDovLYiN5hlDFzKDnLc1kntTpTt58nt0OTVLi0J
	 eCexeZPQ1aZGeNVY0GeA1HAuFRIpw4Kk9pM7D/3rWZnXV3Okp/fk0raHQoFkirXhd0
	 RF9UGf2q9er0g==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Jun 2025 21:20:58 +0200
Message-Id: <DAMI0BD66RO3.JEGKDQOVGLUP@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/4] rust: alloc: implement `Borrow` and `BorrowMut`
 for `KBox`
From: "Benno Lossin" <lossin@kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>
X-Mailer: aerc 0.20.1
References: <20250613-borrow_impls-v2-0-6120e1958199@nvidia.com>
 <20250613-borrow_impls-v2-3-6120e1958199@nvidia.com>
In-Reply-To: <20250613-borrow_impls-v2-3-6120e1958199@nvidia.com>

On Fri Jun 13, 2025 at 3:46 PM CEST, Alexandre Courbot wrote:
> Implement `Borrow<T>` and `BorrowMut<T>` for `KBox<T>`. This allows
> `KBox<T>` to be used in generic APIs asking for types implementing those
> traits. `T` and `&mut T` also implement those traits allowing users to
> use either owned, borrowed and heap-owned values.
>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

With the doc comments fixed as detailed in the other thread:

Reviewed-by: Benno Lossin <lossin@kernel.org>

---
Cheers,
Benno

> ---
>  rust/kernel/alloc/kbox.rs | 61 +++++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 61 insertions(+)
