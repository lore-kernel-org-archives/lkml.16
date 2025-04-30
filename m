Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925E619922D;
	Wed, 30 Apr 2025 09:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746006396; cv=none; b=JzbS56Phxq8CXyhRz46uXg20WJeNzAY5Z2542hQDGe67ythXLLBN9v3lrWduCr69/hFSi47wsICWBpcQQa9eWS9EFiYxHP9ncW+lCBA0MSJv2D0X9tRGnImBhGUZIQJjUJZp9K8/lSlsixnv5uT3knpVFnsJTqdB9+3Y+0toM2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746006396; c=relaxed/simple;
	bh=vfj8dmGymxMr5n0rbXOEyFWN4xzpZmgFzCSqrtj2cCk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=C8ObI7WPh84nk6enFEpM68JYb4LYDZBiNLyrpEPLXlzEVnTn0yp9iSCJsIMJW5aMVdZxPsO3f49ANHBXNKhWsXMPZni1SaUEhuRL4guUsCbQrTYrYGM/BVDIOeyKghyPUxjTK8YSVL9yrKRVQaUdCkS8r0Gi9N2JV59cJO5T+DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u4TtDnZT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u4TtDnZT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38ABCC4CEE9;
	Wed, 30 Apr 2025 09:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746006396;
	bh=vfj8dmGymxMr5n0rbXOEyFWN4xzpZmgFzCSqrtj2cCk=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=u4TtDnZT4f1GWPEHWOU6TzPXNLrqZIAqcq0XHb06m3S1HYIfRScaMja+NNHaaMWus
	 RTSi82dUnRyJ9tLuE30bH7PxDzWhPLL29Pb/TDPkjq/kbIqzCjwT65+b0DB+6zcHDg
	 oBBxTLeRNzPwWakbq57OBaWInqNbFxYHprvzCYB1ZZB40rxpHFtxM6EaB9/yRKgs5j
	 5L3Dr+yfCCCuCS40O2f1xe/a8MTbLqskgYbsciOWw+0wBHAsVCXS+el8K0Sa7rttzl
	 twUDQg5pBKDDVkpt7WtYnAt0A6o6mzjplURkNuNjvMxGV6ygd5ZC7430MS0+/PXXjl
	 tXNMBiz6MjpQA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 30 Apr 2025 11:46:31 +0200
Message-Id: <D9JVLYZLBG75.2RG8ZG8Q48HNB@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] rust: add `UnsafePinned` type
From: "Benno Lossin" <lossin@kernel.org>
To: "Christian Schrefl" <chrisi.schrefl@gmail.com>, "Sky" <sky@sky9.dev>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, =?utf-8?q?Gerald_Wisb=C3=B6ck?=
 <gerald.wisboeck@feather.ink>
X-Mailer: aerc 0.20.1
References: <20250430-rust_unsafe_pinned-v2-0-fc8617a74024@gmail.com>
In-Reply-To: <20250430-rust_unsafe_pinned-v2-0-fc8617a74024@gmail.com>

On Wed Apr 30, 2025 at 10:36 AM CEST, Christian Schrefl wrote:
> This version now only has the kernel implementation without the
> config flag for using the upstream version. Additionally now
> commits for using `UnsafePinned` in `Opaque` were added.
>
> Checkpatch warns about `rust/kernel/types/unsafe_pinned.rs`
> missing a MAINTAINERS entry, I don't think that is necessary since it
> will be part of the `RUST` entry anyways (from what I understand).

That is correct, it will be part of RUST. AFAIK checkpatch always warns
when a new file is added, but I could be wrong.

---
Cheers,
Benno

> Once this has had some time to review I'll rebase my `miscdevice`
> patches [0] on top of this.
>
> This patchset depends on the `pin-init` sync for v6.16 [1].
>
> Link: https://lore.kernel.org/rust-for-linux/20250131-b4-rust_miscdevice_=
registrationdata-v2-0-588f1e6cfabe@gmail.com/ [0]
> Link: https://lore.kernel.org/rust-for-linux/20250421221728.528089-1-benn=
o.lossin@proton.me [1]
>
> Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
> ---
> Changes in v2:
> - Expanded `UnsafePinned` documentation to describe differences
>     with upstream rust implementation.
> - Removed config flag for using upstream `UnsafePinned` type.
> - Add patch implementing `Wrapper` for `Opaque`
> - Add patch for using `UnsafePinned` internally in `Opaque`
> - Link to v1: https://lore.kernel.org/r/20250418-rust_unsafe_pinned-v1-1-=
c4c7558399f8@gmail.com
>
> ---
> Christian Schrefl (3):
>       rust: add UnsafePinned type
>       rust: implement `Wrapper<T>` for `Opaque<T>`
>       rust: use `UnsafePinned` in the implementation of `Opaque`
>
>  init/Kconfig                       |   3 +
>  rust/kernel/lib.rs                 |   1 +
>  rust/kernel/revocable.rs           |   2 +
>  rust/kernel/types.rs               |  42 +++++++-------
>  rust/kernel/types/unsafe_pinned.rs | 115 +++++++++++++++++++++++++++++++=
++++++
>  5 files changed, 143 insertions(+), 20 deletions(-)
> ---
> base-commit: 39051adb070432b283e6c11b2b24937281b9f97f
> change-id: 20250418-rust_unsafe_pinned-891dce27418d
> prerequisite-message-id: <20250421221728.528089-1-benno.lossin@proton.me>
> prerequisite-patch-id: dcf79c049766e66eda0377b225bb441edefcdfe4
> prerequisite-patch-id: 0a078ba4989327e90317f882fa42a387bb7594a0
> prerequisite-patch-id: d5182c6fc3e3b2f255001334b5da9d5c5b7b29ed
> prerequisite-patch-id: 016806607094f0f403000ec455db9ea79e538bf6
> prerequisite-patch-id: 368bea523f3b3e14f1dd599343475e0b166fad37
> prerequisite-patch-id: 526054a8a8871d1dd5f376b7ab6aa5542b481b70
> prerequisite-patch-id: a691b331bc3200287413e6423b8cc3e9cbb177e0
> prerequisite-patch-id: 5afb38f41b18408fef4d3abc5750c09a67b2d34e
>
> Best regards,

