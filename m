Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49EC91BC4E;
	Sun, 22 Jun 2025 07:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750578927; cv=none; b=JevTEZ0SwVBK22CWR/54qUtPsIbh4IQk4upqOAg7A6CcDNgfKviz3GSj7tw391Yq8n3N1qXD+GUlpwo5BxHjsMfeg7YXJSIxtvAbIg/xwAYXJKGJEU1603DdFuFfftaQG4/bfXEzygri+Ky4WTa29yC215fIymJZd4xk52y6YYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750578927; c=relaxed/simple;
	bh=AadL+OIcSNlzqYxlZODabKBrojBYlaOaFNc2cb3or2Y=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=TeaMjOVjHcIS+mSa9dJTeD63dlsPJt6PEc/n6n8L1pHXE2weD3cnyEfaBFVtRHL/kgL2TVn2ucU0dn8BAjnY1sCABpG3d7OlsI4VPsDbrUEtL/qBvArlJY3DIw7sk2ECBEMu56lBKc+O9mrf5mF9DrGtz5HQ/bYBlJ+o0Kxt8mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AdaDiqh8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AdaDiqh8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7345CC4CEE3;
	Sun, 22 Jun 2025 07:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750578926;
	bh=AadL+OIcSNlzqYxlZODabKBrojBYlaOaFNc2cb3or2Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AdaDiqh8xL2zuNluDxJtLIhShUj/7TQg/GfP7ubkie25wEhnD5S21RjgOu1tAEWCH
	 nkgy61FWr1V6ph4Exu9qFu29lUcy+wVWu05k2Z4Z9oBMHkxnwzkFH8qSr2IkYlbyJ7
	 krqCUsMb8daPF6DLFZ9pJRCv40fribwlecP7XZeGGgoOZo2WjQ/H2T2SOMX5dwsfqw
	 NcA+bIznkaT7MpjJhvDMTuvs3+VTxyF24pe/shqkuIVt3A57uTLD1XnZduRDCCrrgM
	 5NeVstUIIiqXdnpqeu9qiEoOCJdo/R+YbiD20/jRLXP7dqo3hq9et0tboNKRlHIYjC
	 06f2xfw0Q4A2g==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 22 Jun 2025 09:55:22 +0200
Message-Id: <DASWFQXR9V54.18EU85NWBUC97@kernel.org>
From: "Benno Lossin" <lossin@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>, "Alexander Viro"
 <viro@zeniv.linux.org.uk>, "Jan Kara" <jack@suse.cz>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Christian Brauner" <brauner@kernel.org>
Cc: "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] poll: rust: allow poll_table ptrs to be null
X-Mailer: aerc 0.20.1
References: <20250620-poll-table-null-v1-1-b3fe92a4fd0d@google.com>
In-Reply-To: <20250620-poll-table-null-v1-1-b3fe92a4fd0d@google.com>

On Fri Jun 20, 2025 at 1:49 PM CEST, Alice Ryhl wrote:
> It's possible for a poll_table to be null. This can happen if an
> end-user just wants to know if a resource has events right now without
> registering a waiter for when events become available. Furthermore,
> these null pointers should be handled transparently by the API, so we
> should not change `from_ptr` to return an `Option`. Thus, change
> `PollTable` to wrap a raw pointer rather than use a reference so that
> you can pass null.
>
> Comments mentioning `struct poll_table` are changed to just `poll_table`
> since `poll_table` is a typedef. (It's a typedef because it's supposed
> to be opaque.)
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> This issue was discovered from a syzkaller report on Rust Binder.
>
> Intended for Christian Brauner's tree.
> ---
>  rust/helpers/helpers.c   |  1 +
>  rust/helpers/poll.c      | 10 ++++++++
>  rust/kernel/sync/poll.rs | 65 +++++++++++++++++-------------------------=
------
>  3 files changed, 34 insertions(+), 42 deletions(-)

Looks good, one safety comment concern below, with that fixed:

Reviewed-by: Benno Lossin <lossin@kernel.org>

>      /// Register this [`PollTable`] with the provided [`PollCondVar`], s=
o that it can be notified
>      /// using the condition variable.
> -    pub fn register_wait(&mut self, file: &File, cv: &PollCondVar) {
> -        if let Some(qproc) =3D self.get_qproc() {
> -            // SAFETY: The pointers to `file` and `self` need to be vali=
d for the duration of this
> -            // call to `qproc`, which they are because they are referenc=
es.
> -            //
> -            // The `cv.wait_queue_head` pointer must be valid until an r=
cu grace period after the
> -            // waiter is removed. The `PollCondVar` is pinned, so before=
 `cv.wait_queue_head` can
> -            // be destroyed, the destructor must run. That destructor fi=
rst removes all waiters,
> -            // and then waits for an rcu grace period. Therefore, `cv.wa=
it_queue_head` is valid for
> -            // long enough.
> -            unsafe { qproc(file.as_ptr() as _, cv.wait_queue_head.get(),=
 self.0.get()) };
> -        }
> +    pub fn register_wait(&self, file: &File, cv: &PollCondVar) {
> +        // SAFETY: The pointers `self.table` and `file` are valid for th=
e duration of this call.

`self.table` might be null, which I think we agreed to is not "valid".

> +        // The `cv.wait_queue_head` pointer must be valid until an rcu g=
race period after the
> +        // waiter is removed. The `PollCondVar` is pinned, so before `cv=
.wait_queue_head` can be
> +        // destroyed, the destructor must run. That destructor first rem=
oves all waiters, and then
> +        // waits for an rcu grace period. Therefore, `cv.wait_queue_head=
` is valid for long enough.

Could you use bullet points for the different requirements?

---
Cheers,
Benno

> +        unsafe { bindings::poll_wait(file.as_ptr(), cv.wait_queue_head.g=
et(), self.table) }
>      }
>  }
> =20
>
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250620-poll-table-null-bf9a6a6c569e
>
> Best regards,

