Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84CD1AA782;
	Thu, 19 Jun 2025 14:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750344243; cv=none; b=EMR3TrEA2Ycayzv1G1Jq/MBqjQzLpiE8qg/nGh/9ZQtU3ahraSkj9e2dbdUVNVXcH+aveC9BjVPn2XGVVASy4c+gte7yULLDMkuORmBKHUq7x2HZhOyteEC2FO5WOJF3Yg/B4pIJmq2HXJhAwVQ4o/WjuTG+klfhpXs33+r1VDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750344243; c=relaxed/simple;
	bh=EU+XZK6yKZ4HAAQfL3WDI5g1SxC9aDlSQj1P0yXxHEg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=SzGAJLkqneSAVFzjmMXkt4tevLzKNn9Q7AjsZkLxQ0nKx+wZJl/YsE/qYLVMcuM03MkinOCix4BMiaema5vcs8PIVslnpUmiCOKqAFK6Y3JzHnN1wUFxtweQCzOjwi+prVUM7Tha4PbxpqADhe26K2QdPjaOGnCXHAgDGIkl6bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DC/8uKxn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DC/8uKxn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11EA3C4CEEA;
	Thu, 19 Jun 2025 14:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750344243;
	bh=EU+XZK6yKZ4HAAQfL3WDI5g1SxC9aDlSQj1P0yXxHEg=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=DC/8uKxn9E77vM4Ll9/l99dtI4pdCWQ0kvWoAT3Cc4h01/cVr0tSqAnsebmA/O5y2
	 XUXEITCJ9os4cna5QK6hfN3wkDgJmaBvHt/9oOy7nY5dNvf6R7Q+ZMLucann5D3JXn
	 oUlK2ZZIZfW49rGlWAPKstrSlU9bdINI/V0/H2eu9qc5YBDZZjmHvqKiSLxoXG7EMh
	 WwFliXme6Fp6fmOEazDCgax0AeIfrlLWsQ+zHg4esdQAaZLDQmIXiayTkCOnOrEtjx
	 PxqtU7U4E6ICvMHFsOJa7LgXoX/MEf5LFBfXf84VqZrkYHDX11du6eX88Mvxl9L3W0
	 McDXtKYhoG6tQ==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Jun 2025 16:43:58 +0200
Message-Id: <DAQL8YH3LDKW.341ZTFFLTTUA2@kernel.org>
Cc: <peterz@infradead.org>, <mingo@redhat.com>, <will@kernel.org>,
 <boqun.feng@gmail.com>, <longman@redhat.com>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <dakr@kernel.org>, <thatslyude@gmail.com>
Subject: Re: [PATCH V3] implement `ww_mutex` abstraction for the Rust tree
From: "Benno Lossin" <lossin@kernel.org>
To: =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20250619140656.498-1-work@onurozkan.dev>
In-Reply-To: <20250619140656.498-1-work@onurozkan.dev>

On Thu Jun 19, 2025 at 4:06 PM CEST, Onur =C3=96zkan wrote:
> From: onur-ozkan <work@onurozkan.dev>
>
> Adds Rust bindings for the kernel's `ww_mutex` infrastructure to enable
> deadlock-free acquisition of multiple related locks.
>
> The implementation abstracts `ww_mutex.h` header and wraps the existing
> C `ww_mutex` with three main types:
>     - `WwClass` for grouping related mutexes
>     - `WwAcquireCtx` for tracking lock acquisition context
>     - `WwMutex<T>` for the actual lock
>
> Some of the kernel's `ww_mutex` functions are implemented as `static inli=
ne`,
> so they are inaccessible from Rust as bindgen can't generate code on them=
.
> The `rust/helpers/ww_mutex.c` file provides C function wrappers around th=
ese inline
> implementations, so bindgen can see them and generate the corresponding R=
ust code.

I don't know the design of `struct ww_mutex`, but from the code below I
gathered that it has some special error return values that signify that
one should release other locks.

Did anyone think about making a more Rusty API that would allow one to
try to lock multiple mutexes at the same time (in a specified order) and
if it fails, it would do the resetting automatically?

---
Cheers,
Benno

> Link: https://rust-for-linux.zulipchat.com/#narrow/channel/291566-Library=
/topic/Writing.20up.20wrappers.20for.20ww_mutex.3F/with/524269974
> Suggested-by: thatslyude@gmail.com
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> ---
>  rust/helpers/helpers.c            |   1 +
>  rust/helpers/ww_mutex.c           |  39 +++
>  rust/kernel/error.rs              |   1 +
>  rust/kernel/sync/lock.rs          |   1 +
>  rust/kernel/sync/lock/ww_mutex.rs | 556 ++++++++++++++++++++++++++++++
>  5 files changed, 598 insertions(+)
>  create mode 100644 rust/helpers/ww_mutex.c
>  create mode 100644 rust/kernel/sync/lock/ww_mutex.rs
