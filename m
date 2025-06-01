Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5893F4F1;
	Sun,  1 Jun 2025 16:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748794630; cv=none; b=feq+yjGcQTff1IUxq6tES3v8R1NkrVye1cfNdT/sKXM6lXtanK2yKOLTIuzUGUPfZ07/cBboGsg3FbchHegvLW4S9nvWyE9OdD6pEV0OkCWXHBkeF7ay9dZSKEQqXLwGvEfmDEHkMdp/NB8ZXBi57ASyZ+sB6wK2J/XdwxogDQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748794630; c=relaxed/simple;
	bh=OT9Aeb2zGcb+W4cAlHss0YZpWf6/DCJ/xREoRP1znf4=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=YZvjE0eJOYiL/hE31X1TVETHajDtU3dIQs+bfvuJFcc0NVWEWUpSruF1GN9rdm+Gnc6ejOqpsY4yKOU8B/Q277NLuvZOPcmz202um6//EkcvVQGKpTb/oBkco53uIQeAI0hT9QoIhaps5GlhaV5Ck+4FIL1tvJB2HsH4jatrIY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sHTB2Txj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sHTB2Txj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDCD8C4CEE7;
	Sun,  1 Jun 2025 16:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748794630;
	bh=OT9Aeb2zGcb+W4cAlHss0YZpWf6/DCJ/xREoRP1znf4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sHTB2Txj08pyNFo0rz0Ea7mA+ykxcBZWxOiEA6Yk/y1zoYtlWZ74smOfsfe9PJz9W
	 CdJ4yIN7KIJVdfWxtIijfAfqmCBAGz/dSJJSXl3AQMTVVKE9NJImwOKb/8JG+Y8SoA
	 W5trsTZQc16o19WPxPFKTUsNbX8ET8/k/hCzTbeK/+cZJBtaYRPTdArUVYBppSmmbf
	 Bic4tkvKdTrgZw38dkkjG2kxiKIAo06goAadgoRjWdPqVs+g2lCj3pD5VpX+pbCEvQ
	 xHJcqXaWCKCO1EAkMd03D3qMu0JBMW4wAg1r0RmZ7QxD5C7xLD4xK5BvW4rtl1L+4T
	 E5/Va4M5nj4wg==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 01 Jun 2025 18:17:05 +0200
Message-Id: <DABBYG8W5F5U.1MXKCC6LSHBPV@kernel.org>
From: "Benno Lossin" <lossin@kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/4] rust: alloc: implement `Borrow` and `BorrowMut` for
 `Arc` types
X-Mailer: aerc 0.20.1
References: <20250601-borrow_impls-v1-0-e1caeb428db4@nvidia.com>
 <20250601-borrow_impls-v1-2-e1caeb428db4@nvidia.com>
In-Reply-To: <20250601-borrow_impls-v1-2-e1caeb428db4@nvidia.com>

On Sun Jun 1, 2025 at 5:00 AM CEST, Alexandre Courbot wrote:
> Implement these two common traits, which allow generic types to store
> either an owned value or a reference to it, leveraging the `Deref`
> implementation.

Same here.

---
Cheers,
Benno

>
> `Arc` can only implement `Borrow`, but `UniqueArc` is able to support
> both.
>
> `ForeignOwnable` makes a call to its own `borrow` method which must be
> disambiguated.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  rust/kernel/sync/arc.rs | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
