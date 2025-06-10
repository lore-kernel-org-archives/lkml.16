Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B6E28DEED;
	Tue, 10 Jun 2025 11:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749553443; cv=none; b=Hu99L2Ejqb08tBLmAkOzbvmg89EGedjiR7Mww+L4n1jNvYV5zU85yNdiF50EZLVCeAhuS+GLpBB0/kYue/pnJe5faPfIvDZ9kYk2LXz2qMnjFJUm+KCw4mLdwmdRL7LCdUfx/89dcIzGxw5dUauaHuVMoaeVLNhp4w3cG3Vw1+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749553443; c=relaxed/simple;
	bh=0Rqy1xpnkACwZYHBFDRwsUm6cEC5Xgqp2lGr3KO+8Zk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=V0Djk8SH4uyROlUxZYDVWeGo/Yo0S0BGFom5O6YzQVfYFBKDU4g2BXkKh85NBrZ2WsmjdkKUOvSEF4LD5XzoolS/4OWdyAYSbYHbzlTJwSoTf5bYFtjiE7Xex1/mWlP10YIZURuF2uSi7YOkRLCxGAPOvf79Csuu93vsAQPMtZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N59KJUUH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N59KJUUH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D2F2C4CEF6;
	Tue, 10 Jun 2025 11:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749553443;
	bh=0Rqy1xpnkACwZYHBFDRwsUm6cEC5Xgqp2lGr3KO+8Zk=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=N59KJUUHLEbuMl+v83CJW+PHRqjCBPTG04EPsyu00P4lZwbniGiIIoiyIRu4jSxWT
	 d8rQ3QmXI2uHLApnryBdbALnUR0hmZ/uh4w+AFuXG8txKqNH6oiAMG5fotqhUUic+J
	 wXhVi6yLFWNnCRAugg7adl5Hvd5rj/Z2jWiXAA/qcgOwOJ4ihCLl/HbgHs5lV7lISj
	 6o/aQZZVvbkutOLYBpA0X7vn5sMPBQcVrYL+u7xIbIMNT+4HecWN28LpAs9SZCu/IQ
	 Whxx6HMK2CPZ9TCUuvx6G4HYv8E52CBaeftyjxWhMC1M10sXGGsi0izMK0zMiq9CUq
	 JyfpSM4ENAxmw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Jun 2025 13:04:00 +0200
Message-Id: <DAISXMX28GH1.28P041TUGVRSR@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: vec: impl Default for Vec with any allocator
From: "Benno Lossin" <lossin@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250610-vec-default-v1-1-7bb2c97d75a0@google.com>
In-Reply-To: <20250610-vec-default-v1-1-7bb2c97d75a0@google.com>

On Tue Jun 10, 2025 at 12:31 PM CEST, Alice Ryhl wrote:
> The implementation of Default is restricted to only work with kmalloc
> vectors for no good reason. This means I have to use
>
> 	mem::replace(&mut my_vec, KVVec::new())
>
> in Rust Binder instead of `mem::take(&mut my_vec)`. Thus, expand the
> impl of Default to work with any allocator including kvmalloc.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Benno Lossin <lossin@kernel.org>

---
Cheers,
Benno

> ---
>  rust/kernel/alloc/kvec.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
