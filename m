Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1995C20D51E;
	Wed,  7 May 2025 11:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746618414; cv=none; b=VWUISVyAA6H3GB5qtVBAqFV3gaqnEsBrLo4Yfp+/V0gi5DTPmWacDiCQZqk1pInb+JClzgl05iVY93d9C8SsYmwAKcb4mOdbqtIGyI6nZ5tOozP7vgbXzh3IjHJWjNteIJWIYAc0FF1Ei7DZWLSpq2pVVSNQYSDo7UIeDayA5XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746618414; c=relaxed/simple;
	bh=d9eoay/eQSnb1NhwL/Ylx13z5/rr9edqhJMtxsP2WNg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=h1ObfzStKSeocbHKgnGXPZUKvzcJ5RouDNtNuRWqEaHU5asWeJOeiUmrTBp5Y6YpkXaOpGZTWleGAOFK7pBxoPsxNUfqBOf7mqQ5M2FUthFJrnV/OfOoTehFj6CQAMdHcEASJqx3xqbvitz20MuM91jTWS+G86BoMEYEQbexo1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fg4skWBD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fg4skWBD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 783ECC4CEE7;
	Wed,  7 May 2025 11:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746618413;
	bh=d9eoay/eQSnb1NhwL/Ylx13z5/rr9edqhJMtxsP2WNg=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=fg4skWBDnj93slBLBQBKydTNn/7jU2wzMW+tnUxL8WSiyii5tb49z39PhUeRFDg2r
	 GS10uns8DgDYmXyua8FhQVBBrzLasewfKvmK5Fvzv/MzRyw/MGTxKvp+s0Mv7aKqhH
	 3ZQva2z0gMGKUoCINJ476NUbpHynbnOaFnjM5ppz70s5/JfosZG+WFD/45tziJEw6a
	 2NlbEFESlQlIg1Js+x+YN8P6p+ZCyTWf+5HpWb5vMN5Y7botRozWlEZ2DEZtvjN+AX
	 +cgpW+eH3ndxtIwSm+rEcQEdiYSb4Av+CNnC+2B9jJKWt+aQcOGB+TS//eykk5ZMCF
	 gWwoR3XazkKXg==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 May 2025 13:46:50 +0200
Message-Id: <D9PWJWUM2NDH.37S72IOWP9QI6@kernel.org>
Cc: "Matthew Maurer" <mmaurer@google.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 7/7] rust: alloc: add Vec::insert_within_capacity
From: "Benno Lossin" <lossin@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>, "Danilo Krummrich"
 <dakr@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250502-vec-methods-v5-0-06d20ad9366f@google.com>
 <20250502-vec-methods-v5-7-06d20ad9366f@google.com>
In-Reply-To: <20250502-vec-methods-v5-7-06d20ad9366f@google.com>

On Fri May 2, 2025 at 3:19 PM CEST, Alice Ryhl wrote:
> This adds a variant of Vec::insert that does not allocate memory. This
> makes it safe to use this function while holding a spinlock. Rust Binder
> uses it for the range allocator fast path.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Benno Lossin <lossin@kernel.org>

---
Cheers,
Benno

> ---
>  rust/kernel/alloc/kvec.rs        | 51 ++++++++++++++++++++++++++++++++++=
+++++-
>  rust/kernel/alloc/kvec/errors.rs | 23 ++++++++++++++++++
>  2 files changed, 73 insertions(+), 1 deletion(-)
