Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DB5433A0;
	Thu, 12 Jun 2025 12:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749730538; cv=none; b=Ofuh/m2syT8w1PeyXHv80uPrcpop3P5WmNTtbvN8Q5paX4hRMmfpNnwCKCQNZ4+4+pe6bg7XJB+PsdPaZrmmB9uMKskD3f5ROSA6qZ+08alY3WUKrqIE/Bw1cWrA3IH863TvB89UnjVX3Etux7mcPwPMZZcE9+3iItQac12MfHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749730538; c=relaxed/simple;
	bh=nw/4zNvecfZ0kMMHEAXNOD3QutS54m2/td3cUQz5cHQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=hTOeMkS4z49lahs4gXwUm8/CFgI33FY5VjC+IoAuRTtvH/9pGfdKOiCW0/b5PH6HNZCLWyCxoqo7BdUnP/m6k2taV4s0FQ2Wig12czgCo2nkMXPEJ7VNR0kMFTiHdbHS7O79khiBpvLzhuqr17FwefUd2sMUhv2yXD8kyw9kPNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LJBH5zNP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LJBH5zNP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0A1EC4CEEA;
	Thu, 12 Jun 2025 12:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749730536;
	bh=nw/4zNvecfZ0kMMHEAXNOD3QutS54m2/td3cUQz5cHQ=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=LJBH5zNPZW1XuoT4+ua7ZBsZLDTy7dWdXDkFBVHrCq7xRB+PCcJihJ130VcBIGHik
	 vr8PTW4oOZ45oEsM963lRuMFqcZN/BSLwDWFBD6yNd+L8Ww5zOC6Cgn/vfHE40OBQQ
	 UQZDqrE1cDk+hXVVBK8au4Tif0VaOmB300Hc9G8/+ISUTkvmC+JbANt8EVxN/KfF0o
	 HjDGSV7qPR1ndAcDIsm7uIIiiQCvIpxVKHJHHimEy+Mb/VRFXAAa/pMx+Dri6Jq5uW
	 TonycSA5oF2GNasFK6CLUSV6vAXUrAr27NeSNR8sIweli6ZXu2yoIR8gTUD2o+SuY0
	 FJFlMNBQwyN3Q==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Jun 2025 14:15:33 +0200
Message-Id: <DAKJPI52CL6O.5AHQSFJBEZPR@kernel.org>
Subject: Re: [PATCH] revocable: rust: document why &T is not used in
 RevocableGuard
From: "Benno Lossin" <lossin@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>, "Miguel Ojeda" <ojeda@kernel.org>
Cc: "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Marcelo Moreira"
 <marcelomoreira1905@gmail.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20250612-revocable-ptr-comment-v1-1-db36785877f6@google.com>
In-Reply-To: <20250612-revocable-ptr-comment-v1-1-db36785877f6@google.com>

On Thu Jun 12, 2025 at 1:17 PM CEST, Alice Ryhl wrote:
> When a reference appears in a function argument, the reference is
> assumed to be valid for the entire duration of that function call; this
> is called a stack protector [1]. Because of that, custom pointer types
> whose destructor may invalidate the pointee (i.e. they are more similar
> to Box<T> than &T) cannot internally use a reference, and must instead
> use a raw pointer.
>
> This issue is something that is often missed during unsafe review. For
> examples, see [2] and [3]. To ensure that people don't try to simplify
> RevocableGuard by changing the raw pointer to a reference, add a comment
> to that effect.
>
> Link: https://perso.crans.org/vanille/treebor/protectors.html [1]
> Link: https://users.rust-lang.org/t/unsafe-code-review-semi-owning-weak-r=
wlock-t-guard/95706 [2]
> Link: https://lore.kernel.org/all/aEqdur4JTFa1V20U@google.com/ [3]
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Thanks!

Reviewed-by: Benno Lossin <lossin@kernel.org>

---
Cheers,
Benno

> ---
>  rust/kernel/revocable.rs | 4 ++++
>  1 file changed, 4 insertions(+)
