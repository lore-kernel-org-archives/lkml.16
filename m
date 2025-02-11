Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB951FAC5D;
	Tue, 11 Feb 2025 15:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739286300; cv=none; b=uehxBHmy+WGGSUlu9ASJc503m8HJZc9nMTSzsgj2dNaSSRQ6LbgHgEbheZ9R0Dw3HIg5dwz9KLj7ugFwN3tkmiM1GYQY0ruGEB/dpbPAqvvFbMl8jnnTq3wAQSZbQViQkfgkvYIgMDLu0r/0TFE04+bfenfyQCWlMAScLPOo1qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739286300; c=relaxed/simple;
	bh=sT9HrKaDoNTgKVs4pwxBw1GJFR1SNCo77GHp+q9E8TI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=aW9TIsIOPJZCwEuVqq5h1qV0HN7dgIYxA7yRDTqh7lzpmrptCMkBVdlETZ1WY1n3LRcZHo8SxSbSEqWQLKpVeqSwqLNPDjpz7f4vvP+zvAoFZJDmkFXw9l6AdwgZJF4SUpHJTVTTaMAiSp5zK7A7YlxR6labszt8nv4bU+v62Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aPuNo0/S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aPuNo0/S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1FD0C4CEDD;
	Tue, 11 Feb 2025 15:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739286300;
	bh=sT9HrKaDoNTgKVs4pwxBw1GJFR1SNCo77GHp+q9E8TI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=aPuNo0/S31/19sKGWSjrWMx7JRqYzYkZmi5puXB6zwjRA+vRWzpwjQ1ETuXbEofD8
	 Wlk1jXuBNygTmcuJMKs3Xbp+WmfsgOzRjeoJhTnyjcMYWgycqPind7DPLIrvTdApIL
	 Gi/ct6GcQ+ZJx2+G8JjvHNlWN8UEWeJBaBQAxBdVuR8Vunmshcq9nFuDqDX/ZvjruI
	 oLmFopFAEmjReGbbupSJCsLViT0hvebf63dagVyU8+fPsHmHoTSuDKp2qmPA2RS7IZ
	 Lb6zFJyOM9bhTH+D+0FTYt88llBWW9E79D+5aJh1pQvZ8hipylYjO9M1LatEE4XatC
	 iN295fBY04UDA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Jens Korinth via B4 Relay" <devnull+jens.korinth.tuta.io@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno
 Lossin" <benno.lossin@proton.me>,  "Alice Ryhl" <aliceryhl@google.com>,
  "Trevor Gross" <tmgross@umich.edu>,  <jens.korinth@tuta.io>,
  <rust-for-linux@vger.kernel.org>,  "FUJITA Tomonori"
 <fujita.tomonori@gmail.com>,  "Dirk Behme" <dirk.behme@gmail.com>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 0/3] rust: Add pr_*_once macros
In-Reply-To: <20241126-pr_once_macros-v4-0-410b8ca9643e@tuta.io> (Jens Korinth
	via's message of "Tue, 26 Nov 2024 17:40:56 +0100")
References: <8gSHb0iuAT_Wz0rR1-qsnFIVndSpW229fA0lq-fslngTt5k1ooiMw5eAIc82F26Mdma4nkyU4X7_1RLZcnQf-Q==@protonmail.internalid>
	<20241126-pr_once_macros-v4-0-410b8ca9643e@tuta.io>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 11 Feb 2025 16:04:44 +0100
Message-ID: <87zfish69f.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Jens,

"Jens Korinth via B4 Relay" <devnull+jens.korinth.tuta.io@kernel.org> writes:

> Add Rust version of pr_[emerg|alert|crit|err|warn|notic|info]_once
> functions, which print a message only once.
>
> Introduces a `OnceLite` abstraction similar to Rust's
> [`std::sync::Once`](https://doc.rust-lang.org/std/sync/struct.Once.html)
> but using the non-blocking mechanism from the kernel's `DO_ONCE_LITE`
> macro, which is used to define the `do_once_lite` Rust macro.
>
> First use case are an implementation of `pr_*_once` message macros to
> print a message only once.
>

Thanks for the patch! Do you plan on sending a new version? If not, do
you mind if I send v5?


Best regards,
Andreas Hindborg


