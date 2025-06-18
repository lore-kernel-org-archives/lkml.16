Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6BA21A457;
	Wed, 18 Jun 2025 21:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750281391; cv=none; b=Bu36FZdm4LPwe2EK4nM0NULUuLFlW9ado4HT7zbvhe+pWzDN+c09WCzixtlOGVtMf7ru0HfER/m3Sj1d+3X6IK0SdxWcaRkir11T+tTTQt9NaVuf/PjeYkBy2ndQQdYiBcpgmweDoLv+97H9Axj/q+nT/Lqx2Ns0S+evLtUQEjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750281391; c=relaxed/simple;
	bh=nGe6moV2R+63kTr0VyRBW+UrwG25EmyR+QJPnKclo7Q=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=i+4ojWAcVnxHukijwptIg1vDOCxrqr26mrRPKY20d+jQYS36dK40QV+QDLGudEeUALhiyo5WBHuBzAEj9YY6cuu6j6L6zK7n5HlbguDcCkL/HjoXZtTLDWQC61QY9M2Ojj/yhPRewFKErurQUH5cyLCCwD81GZOKRLLEXoG1sDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tw4vieE+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tw4vieE+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D536C4CEE7;
	Wed, 18 Jun 2025 21:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750281390;
	bh=nGe6moV2R+63kTr0VyRBW+UrwG25EmyR+QJPnKclo7Q=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=Tw4vieE+Z6HfP1PQvZEeb2oqgJaytsBcRgUuVOitTUAjWHWV1uiD97GAGJ+nHLUsU
	 Mjk8XWVZ8LqZwp5CiXASu/MoI8WizXobzZkqZIBRiQTOxJtr/E/JG4v1CMmR6DTFUy
	 /sQsBC37wBtFxUHqPPXMBkilOCDkyC76jOpeM7gR+VzvbUN8zQ63YljV2B5slXQb48
	 l1VsnE3s7R975b4cM8mR6IkMgtRWfWbJjj9bjhRSFxZL929s/SR9CH5HT10ExyqZXL
	 +pkcznf42J9EEyuisIx82DNSq+/OtLVHFJj6IUPXwlmwgh/mS6tfvgiju6W8jL1SUc
	 drFONDuh2x52Q==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Jun 2025 23:16:26 +0200
Message-Id: <DAPYYWSUVMGN.L3ICDJAIJ2PO@kernel.org>
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

Ah on second thought, this and the next two patches are a bit redundant,
since Tamir has a series [1] removing our `CStr` and using the one from
`core`.

If you need this *now* and can't wait for Tamir's series to land, then
we can do this and the other two changes, but othrwise I'd just use
`CStr` from `core`.

It does seem like you need `&mut CStr`, which the one in `core` doesn't
seem to provide... But our `CStr` also doesn't have `IndexMut`, so...
how are you using it? Giving it to a C API?

In that case I don't know what we should do about [1]... @Miguel?

[1]: https://lore.kernel.org/all/20250530-cstr-core-v11-0-cd9c0cbcb902@gmai=
l.com

---
Cheers,
Benno
