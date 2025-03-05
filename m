Received: from gimli.kloenk.de (gimli.kloenk.de [49.12.72.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2CF202969;
	Wed,  5 Mar 2025 09:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.72.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741166631; cv=none; b=f42uECcMoYzH6GIOGTg9muvULWyuFZ2b1bmEk2hHsVrdh9sVM9qHChAHEORSw9aRzQzcC87jw3A3IgZCaLXk3i8R2V21jbvjOFYww0iIZPWLNzoeFmKYXLUCHCKjbOQsagb5oWP3cqebrto2n8zi/kfwe4+QtJUA/deN0DpCaK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741166631; c=relaxed/simple;
	bh=x1UBzECrAxJEfZ7QP7fKlwF81bsgcJvySWzJQULIOYg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=i+ibmJZ0up52fWkmbd2Bv6+8k24+iTofzbiweZvSwyKCYcu+pewLfOnfruSHZ4zqhd5jZ67IAZbEQxEPjgJX1l45P6uNaS9qgunQHD7jX9FEW8h4h92B4v/NqbEfhc4HQSKW8wrAOz2iTcLiKFNaRseP0Qv+GekNc0khNiX2e1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev; spf=pass smtp.mailfrom=kloenk.dev; dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b=MISrFgcW; arc=none smtp.client-ip=49.12.72.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b="MISrFgcW"
From: Fiona Behrens <me@kloenk.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kloenk.dev; s=mail;
	t=1741166628; bh=x1UBzECrAxJEfZ7QP7fKlwF81bsgcJvySWzJQULIOYg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=MISrFgcWy1uu7bft5lHIeGnCZJSXDwA7KBfDO7wa6d+PTdowIFPkz7P04HYLtVqcf
	 Kt4LSfbPaxFgJQwaPXGRwLM2s7y7sRp1o76BaH2htoblD/qLZtGPOqGzHNHvhU3wZt
	 heMEeNdIlhtUijRXrcqZYk5Jk4Ne8FWMBDeGKS1w=
To: Benno Lossin <benno.lossin@proton.me>
Cc: Danilo Krummrich <dakr@kernel.org>,  Miguel Ojeda <ojeda@kernel.org>,
  Alex Gaynor <alex.gaynor@gmail.com>,  Boqun Feng <boqun.feng@gmail.com>,
  Gary Guo <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,
  Andreas Hindborg <a.hindborg@kernel.org>,  Alice Ryhl
 <aliceryhl@google.com>,  Trevor Gross <tmgross@umich.edu>,
  rust-for-linux@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/22] rust: pin-init: move `InPlaceInit` and impls of
 `InPlaceWrite` into the kernel crate
In-Reply-To: <20250304225245.2033120-9-benno.lossin@proton.me> (Benno Lossin's
	message of "Tue, 04 Mar 2025 22:54:16 +0000")
References: <20250304225245.2033120-1-benno.lossin@proton.me>
	<20250304225245.2033120-9-benno.lossin@proton.me>
Date: Wed, 05 Mar 2025 10:23:47 +0100
Message-ID: <m2ldtjhluk.fsf@kloenk.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Benno Lossin <benno.lossin@proton.me> writes:

> In order to make pin-init a standalone crate, move kernel-specific code
> directly into the kernel crate. This includes the `InPlaceInit<T>`
> trait, its implementations and the implementations of `InPlaceWrite` for
> `Arc` and `UniqueArc`. All of these use the kernel's error type which
> will become unavailable in pin-init.
>
> Signed-off-by: Benno Lossin <benno.lossin@proton.me>

Reviewed-by: Fiona Behrens <me@kloenk.dev>
