Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDF82D323F;
	Thu, 12 Jun 2025 15:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749743321; cv=none; b=uhBHWQ/UdRvKYahrHs1tfVuTBiHzKoiXhb6kHdmmORc/1MTPe3x3k0jhuz1ndCS8ggUKx8bves99+kbPIhEUviyuMu/ew0cfoLUz7hU+2z+0SZA99BJa0b3dVg2PgKpoqhmY41g9VTCn0Govxe3vx4IO7l3upQ6CEifuJb08aYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749743321; c=relaxed/simple;
	bh=jR3gCYviUJHKQQ6qqTXpbjXk13OFLF4CsXl0t34Ug0g=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=dzNjL0hmS71u+XCoGI9MOwJswLLE5cvMJObTSb2L6yDTCad1irLz4Ic2mnCYDjgeiVQ+A5CIKbAotSCcjpITSw10g7giOWvKyVcjIuXxEvWDlC0/BqFLkPo1vlMaDPwf+BJcuxggOANyro2PIxvxstylIp//6dLmCh/Q62UV7Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TgZnnWOE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TgZnnWOE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E0F0C4CEEB;
	Thu, 12 Jun 2025 15:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749743321;
	bh=jR3gCYviUJHKQQ6qqTXpbjXk13OFLF4CsXl0t34Ug0g=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=TgZnnWOE4qlxq70LVm13VYF+nnq3ddOvXZ3sdaq4KNbOEBZPpzw9NX51LYzv2Xv4G
	 wefm3fd20Qgh0PAHMQo1O6RixyzZYEuCMXUuPdEoA7G1y2lHBEH+FijVLKMNU/2ZBy
	 xzcOydwWVIatVxln44ROe+lfzg4jR2Z9zWK5tLqINAv7xTZvMuHSKqvEcsgCdARpAn
	 +oF0lna+QCPDJhAIgzFepDlARgy53U0qb6+3+55XPVB5vm1A/Lxyb+TEkB9fekBzWq
	 uSqP6ytQKgwOpJndf1uot2RVtTZ77lOQHn9mVlA2kLuqVlfm4Nfs2PN8EdHtF/CNqr
	 SlgNseM1K4T1w==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Jun 2025 17:48:36 +0200
Message-Id: <DAKO8MMSCUE4.1WVR6SBADGP8W@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/4] rust: revocable: support fallible PinInit types
From: "Benno Lossin" <lossin@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>, <gregkh@linuxfoundation.org>,
 <rafael@kernel.org>, <ojeda@kernel.org>, <alex.gaynor@gmail.com>,
 <boqun.feng@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <benno.lossin@proton.me>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <tmgross@umich.edu>
X-Mailer: aerc 0.20.1
References: <20250612145145.12143-1-dakr@kernel.org>
 <20250612145145.12143-2-dakr@kernel.org>
In-Reply-To: <20250612145145.12143-2-dakr@kernel.org>

On Thu Jun 12, 2025 at 4:51 PM CEST, Danilo Krummrich wrote:
> Currently, Revocable::new() only supports infallible PinInit
> implementations, i.e. impl PinInit<T, Infallible>.
>
> This has been sufficient so far, since users such as Devres do not
> support fallibility.
>
> Since this is about to change, make Revocable::new() generic over the
> error type E.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  rust/kernel/devres.rs    | 2 +-
>  rust/kernel/revocable.rs | 7 +++++--
>  2 files changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
> index d8bdf2bdb879..a7df9fbd724f 100644
> --- a/rust/kernel/devres.rs
> +++ b/rust/kernel/devres.rs
> @@ -98,7 +98,7 @@ struct DevresInner<T> {
>  impl<T> DevresInner<T> {
>      fn new(dev: &Device<Bound>, data: T, flags: Flags) -> Result<Arc<Dev=
resInner<T>>> {
>          let inner =3D Arc::pin_init(
> -            pin_init!( DevresInner {
> +            try_pin_init!( DevresInner {
>                  dev: dev.into(),
>                  callback: Self::devres_callback,
>                  data <- Revocable::new(data),
> diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
> index fa1fd70efa27..41b8fe374af6 100644
> --- a/rust/kernel/revocable.rs
> +++ b/rust/kernel/revocable.rs
> @@ -82,8 +82,11 @@ unsafe impl<T: Sync + Send> Sync for Revocable<T> {}
> =20
>  impl<T> Revocable<T> {
>      /// Creates a new revocable instance of the given data.
> -    pub fn new(data: impl PinInit<T>) -> impl PinInit<Self> {
> -        pin_init!(Self {
> +    pub fn new<E>(data: impl PinInit<T, E>) -> impl PinInit<Self, Error>
> +    where
> +        Error: From<E>,

I don't think we need this bound as you don't use it in the function
body.

---
Cheers,
Benno

> +    {
> +        try_pin_init!(Self {
>              is_available: AtomicBool::new(true),
>              data <- Opaque::pin_init(data),
>          })

