Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2427B2F5E;
	Sun, 25 May 2025 17:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748194749; cv=none; b=Be+PJScLgOsY3KqDa3C4UXCyDGZd6gvyD+Y0DL/eaV6WTYhEd8sQ8O8FTL7uZ+aoNwNt0ft7OPJ1d7z0yOliRjLIppEe9L8hajzma01ewsdF2zGioL9hvrUjY1TdOEVnbe6ELGuHTeW5JEkkUgRMgJWCcmH8/a25lpJ9zzgdzKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748194749; c=relaxed/simple;
	bh=ULH+67z18Q0hTfGo9mqfRlFZjKx2S+upOmGnLanF5/s=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=T3yN8P785PQM8eZa0WY6bqAnTgouaDXuFOe/eBCFmopHz/6ge3+AuvbvKhxWxnRhaKhCB7Pxxcl5Eq2BFd4Zhlkx6I2SaiuBth3NgOaZYSSnrrersshgFoaNAY6Cbuzo6vOGCGTQ/4MUhmZHsfMH9B/JlGWK512PVqQNZrWF2FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Py7cu9in; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Py7cu9in"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B45F9C4CEEA;
	Sun, 25 May 2025 17:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748194748;
	bh=ULH+67z18Q0hTfGo9mqfRlFZjKx2S+upOmGnLanF5/s=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=Py7cu9inPMlueQ31z8v+xd5wQYgAxpsHk21DAdm+WRcZvGb/KugUZpYkr1aCOhcWc
	 tHyxqfmXmdcUEMuZAxI3QHqaqSMXzwMQoJT/ylp8rU/GLBqVWhvZpKERBltgO8VIZF
	 8BgkuDRf8e1WVOgbmjYJHWNuYfdNvlEJlXXoGH4BJKCRwHobWgJEYc3ThkETaSDPws
	 OcOkgmCgK/5jRiS6vlmtrg0qxlCynTGBZ4o3Oa7JEmExR5wNdpSvh1fCODJ88YmXJM
	 J8hIcMb1689QMdgpZ2jsEp9ULOPZMlj0lv6LSWTGlN/x1ZhweOGEVobPccVVFBr1GK
	 ZA82Wy/S9AuKQ==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 25 May 2025 19:39:04 +0200
Message-Id: <DA5FBED7E1NX.W675V3MKQSMD@kernel.org>
To: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Fiona Behrens" <me@kloenk.dev>, "Xiangfei Ding"
 <dingxiangfei2009@gmail.com>
Cc: <stable@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: list: fix path of `assert_pinned!`
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250525173450.853413-1-lossin@kernel.org>
In-Reply-To: <20250525173450.853413-1-lossin@kernel.org>

On Sun May 25, 2025 at 7:34 PM CEST, Benno Lossin wrote:
> Commit dbd5058ba60c ("rust: make pin-init its own crate") moved all
> items from pin-init into the pin-init crate, including the
> `assert_pinned!` macro.
>
> Thus fix the path.
>
> This occurrence was missed in that commit, since it has no current
> users, although binder does.

Aw damn, I edited the message, but forgot to regenerate the .patch
file... here is the edited version:

    Commit dbd5058ba60c ("rust: make pin-init its own crate") moved all
    items from pin-init into the pin-init crate, including the
    `assert_pinned!` macro.
   =20
    Thus fix the path of the sole user of the `assert_pinned!` macro.
   =20
    This occurrence was missed in the commit above, since it is in a macro
    has no current users (although binder is a future user).

---
Cheers,
Benno

> Cc: stable@kernel.org # I haven't found the commit in stable yet, but jus=
t to be sure.
> Fixes: dbd5058ba60c ("rust: make pin-init its own crate")
> Signed-off-by: Benno Lossin <lossin@kernel.org>
> ---
>  rust/kernel/list/arc.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/rust/kernel/list/arc.rs b/rust/kernel/list/arc.rs
> index 13c50df37b89..a88a2dc65aa7 100644
> --- a/rust/kernel/list/arc.rs
> +++ b/rust/kernel/list/arc.rs
> @@ -96,7 +96,7 @@ unsafe fn on_drop_list_arc(&self) {}
>      } $($rest:tt)*) =3D> {
>          impl$(<$($generics)*>)? $crate::list::ListArcSafe<$num> for $t {
>              unsafe fn on_create_list_arc_from_unique(self: ::core::pin::=
Pin<&mut Self>) {
> -                $crate::assert_pinned!($t, $field, $fty, inline);
> +                ::pin_init::assert_pinned!($t, $field, $fty, inline);
> =20
>                  // SAFETY: This field is structurally pinned as per the =
above assertion.
>                  let field =3D unsafe {
>
> base-commit: f26449565019315650c9fe87743b10103910ca6b

