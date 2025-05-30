Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8FB24A069;
	Fri, 30 May 2025 19:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748633599; cv=none; b=HGW/bNHh+GiopkeVEVK+u71n+XzpYjxf5E9OUYhlhdmJvaLbhuSII1droHf6cne7H/UERZBjaTvw3qGwWX2WSsgFGcjQFrfAuwcXCnoboutJnqhq4burHyFXLV+emOo2kQKdd8lBZeuC8N1HthBq/ULYIr/JS4z9abvL06o6Lng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748633599; c=relaxed/simple;
	bh=0TKhY7KzTcca56BBbXYERXmbq3/C2le8W+bR4TcGYc4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=MPyZiROD7xSCeTSQ0wsP+3MbG79IH7RqYoVVYiHGgZaN5bKzV8fmXSCa3vL5PPMGesSOBV05aLmVyQ+4RSsM2dOhNeLdqgWPkOXRxGMfkPOtpj4+LItxD9dotv5B/i7c8MoVPxxHfKpP+h0FWTas/IJ4iJQ3ypstbiYxKNAQTx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nTdevnIY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nTdevnIY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B010C4CEE9;
	Fri, 30 May 2025 19:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748633596;
	bh=0TKhY7KzTcca56BBbXYERXmbq3/C2le8W+bR4TcGYc4=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=nTdevnIYEbyNqJs5fY3vyEEiv544shVx8K2qb2mjMsYsBrPI/4WAKhQWJzuPlEf5k
	 dBMeFEzy7zmaS/8EgsCFjEd4PkwQ4+MbiZlBCaWZt50pdseirheEVY9aW8JpfBYNkx
	 1WLPHtEbXIMjnQJd3JXMkkl+/K8WOSB9oNsHPquxarKc3zTt3mbQ/m0xZYnmcb18Wk
	 IWO8GFuDH+OYSxJp84F4QEb5cWlsHanr/y4EInpRQ+euYYlvOTcD4y8+AFulf5M4sk
	 ceJoBHAtr4pn9m8TJGAx47YPzLgWVdY5VtNJ1mNpbLBwWh7Z92EFSGbowHuvE2pHOw
	 y9+OXPy0o3nDA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 May 2025 21:33:11 +0200
Message-Id: <DA9QVI519FK6.1VZGKW6HN7IDH@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/7] rust: devres: support fallible in-place init for
 data
From: "Benno Lossin" <lossin@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>, <gregkh@linuxfoundation.org>,
 <rafael@kernel.org>, <ojeda@kernel.org>, <alex.gaynor@gmail.com>,
 <boqun.feng@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <benno.lossin@proton.me>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <tmgross@umich.edu>, <chrisi.schrefl@gmail.com>
X-Mailer: aerc 0.20.1
References: <20250530142447.166524-1-dakr@kernel.org>
 <20250530142447.166524-4-dakr@kernel.org>
In-Reply-To: <20250530142447.166524-4-dakr@kernel.org>

On Fri May 30, 2025 at 4:24 PM CEST, Danilo Krummrich wrote:
> Currently, Devres only supports a data argument of type T. However,
> DevresInner already uses pin-init to initialize the Revocable. Hence,
> there is no need for this limitation and we can take a data argument of
> type impl PinInit<T, E> instead.

Missing '`'.

> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Benno Lossin <lossin@kernel.org>

> ---
>  rust/kernel/devres.rs | 27 ++++++++++++++++++++++-----
>  1 file changed, 22 insertions(+), 5 deletions(-)
>
> diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
> index 2dbe17d6ea1f..47aeb5196dd2 100644
> --- a/rust/kernel/devres.rs
> +++ b/rust/kernel/devres.rs
> @@ -96,9 +96,16 @@ struct DevresInner<T> {
>  pub struct Devres<T>(Arc<DevresInner<T>>);
> =20
>  impl<T> DevresInner<T> {
> -    fn new(dev: &Device<Bound>, data: T, flags: Flags) -> Result<Arc<Dev=
resInner<T>>> {
> -        let inner =3D Arc::pin_init(
> -            try_pin_init!( DevresInner {
> +    fn new<E>(
> +        dev: &Device<Bound>,
> +        data: impl PinInit<T, E>,
> +        flags: Flags,
> +    ) -> Result<Arc<DevresInner<T>>>
> +    where
> +        Error: From<E>,
> +    {
> +        let inner =3D Arc::pin_init::<Error>(
> +            try_pin_init!( Self {

Spurious space between `!(` and `Self {`.

---
Cheers,
Benno
