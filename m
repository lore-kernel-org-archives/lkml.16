Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch [79.135.106.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563CA8F5B
	for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 08:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745136939; cv=none; b=qWSal9mKrt06cJAOvED0gh06dJL9mL6zczm/qHcoqmXIs0mzCKEdx/mcqgeukP0BxW417GF/ZGYzQ52sVK1s1B9vQBb7Z4PV0K2rxP7Z5laQb03IZNzqJnZNND8v1osVemhZPHzfsnuoqMFduwsNjokqCnKy3gdPX0iJBIKpa8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745136939; c=relaxed/simple;
	bh=7oZCZFPgnkmbLM+UwKc6puSWb2SOp93xNw0n/m51OGc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P/bPuFC8EpsjjJiI500bTqBGEe+YVPrd1BAYDL6NknqRaKhvwtksOzd/FkUUwl4eeNlpj0MFNCXvwYiIe3JBdxx+hUnOzMr4ZqD0JqpUN36vN/mi6hXrgPmqKw0KAPPZ0wRoceK0tGTm5hSuURKLEUF4LMpWM8My+YIqMrlsM5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=Upeo8NcY; arc=none smtp.client-ip=79.135.106.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="Upeo8NcY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1745136930; x=1745396130;
	bh=zAitec6g+cOTnqIdNSXls6ROPThY9gs+6SPRpTmcZ1Q=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=Upeo8NcYBHbBNv+dUL4H5s8Gfkpu+lYh7AdTu8DLmvfzZyybYjgXG/plYRg5uCsTc
	 8QORktvhHnXa9qzL4jSnQXYkSLA9r2NnImHZKV/Pe0BZa3jE7+2BsRMCthpKg90r9j
	 bVoBK8ayfqfYEzV95bzrxDkfbwfcd6vUUy8D0DwCclsiUBcCD0rr1aYz6iyTaiuNFd
	 SPn6k7SCEKr0nbIwe1t1U1pZ+9JRD3TWJs+VbRsX96e6FHjyZfc9QBnzgBtfqjL6sG
	 Z6M21ElonsWUKyFgzT07pRtNSoQ6fr2u91sybtp3XXvK50RciG359iYlL/vEfhn+7S
	 SVE4l5nC40oNQ==
Date: Sun, 20 Apr 2025 08:15:24 +0000
To: Arnaud Lecomte <contact@arnaud-lcm.com>, Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, skhan@linuxfoundation.org
Subject: Re: [PATCH 0/2] checkpatch.pl: add warning for // comments on private Rust items
Message-ID: <D9BBEQHO1XMG.2C5Q7FF02BDLJ@proton.me>
In-Reply-To: <20250419-checkpatch-rust-private-item-comment-v1-0-0f8bc109bd5a@arnaud-lcm.com>
References: <20250419-checkpatch-rust-private-item-comment-v1-0-0f8bc109bd5a@arnaud-lcm.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: dcf11221a03cf98624dae71607d8ac877e96f30b
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sat Apr 19, 2025 at 10:24 PM CEST, Arnaud Lecomte wrote:
> Hi,
>
> Background
> ----------
>
> The Rust-for-Linux project currently lacks enforcement of documentation f=
or private Rust items,
> as highlighted in https://github.com/Rust-for-Linux/linux/issues/1157.
> While rustc already lints missing documentation for public items, private=
 items remain unchecked.
> This patch series aims to close that gap by ensuring proper documentation=
 practices
> for private Rust items in the kernel.
> As underlined in this issue:
> https://github.com/Rust-for-Linux/linux/issues/1157, the purposes of
> this patch serie is to ensure the proper documentation of private rust
> items. Public items missing documentation are already linted by rustc.
>
> The actual solution comes in several parts
> ------------------------------------------
>
>  1) Patch 1 : Implements detection logic to emit warnings for improperly
>  documented private Rust items (e.g., // comments instead of ///).
>  2) Patch 2 : Adds an auto-fix mechanism via the --fix option to help
>  developers correct documentation issues.
>
> Results
> --------------------

Thanks for this helpful example, I'd recommend you to run your modified
version on real patches from the list and/or on already existing commits
in the kernel.

>
> The following implementation has been tested against this input file:
> // SPDX-License-Identifier: GPL-2.0

[...]

> pub struct Point2D {
>   pub x: f32,
>   pub y: f32
> }
>
> mod test_module {
>     // Module inner comment - should not trigger
> }
>
> // Comment before macro - should not trigger
> macro_rules! my_macro {

I think we should also trigger this for macros. All macros are private
by default and only made public with the `#[macro_export]` annotation.

>     // Comment inside macro - should not trigger
>     () =3D> {};
> }
>
> // Comment before unsafe block - should not trigger
> unsafe {
>     // Comment inside unsafe block - should not trigger
>     let x =3D 5;
> }
>
> // Comment with unsafe word - should trigger
> fn with_unsafe_keyword() {
>     println!("test");
> }
>
> // Comment with code example: - should trigger
> // let x =3D 5; - should trigger

Code examples are usually wrapped in '```', so they are another
indicator that it probably should be a doc-comment.

> fn with_code_example() {
>     println!("test");
> }
>
> // NOTE: important consideration - should not trigger
> fn note_marker() -> bool {
>     true
> }
>
> // Comment with code example: - should trigger

I'm not 100% convinced that this should trigger. We have several cases
of the following (in some cases the function is public, I don't
remember if we have a private case):

    /// Normal function docs...
    // We probably should refactor XYZ.
    fn foo() {}

There it should not trigger.

---
Cheers,
Benno

> /// let x =3D 5; - should not trigger
> fn with_mixed_comments() {
>     println!("test");
> }

