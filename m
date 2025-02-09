Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch [185.70.40.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8276D154425
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 09:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739095034; cv=none; b=bZfjUTUDiIUtsWYtMta07YjYfkUVwoov+fhdkJ/NvAU/dDwgMPqntKkn+VGr1PnVecWQ7qdhAH9yA/mSiz5SPH2fGD9jmK4F6oequXaNk7cbrTjLLzRsHorjJ04aMsB6p4oqpbSFdVU112uAZWjRS4SkjtASGxzqtILfDHSSok4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739095034; c=relaxed/simple;
	bh=zPoObnim7HgiPy8SS/51PIffqcR01bI6J3I/mK4Qf1g=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lc3IOTpdarxB+Mrr2hfyP3Ao/wKom1T+lk2MiWVHXpdteFa+i9j6AcZdvU0izJaQudwTAL7rhvGov1Xbvw4v8+yffooFRmoLI3731wWD7BPBZxJSE+QPgaemuTTSHh439Gqd9np647SZhijneCPU+YqrioUMVrdaW9p5cf4dNBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=meikJP4h; arc=none smtp.client-ip=185.70.40.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="meikJP4h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=sltkamyzmjbstes7q75stjntru.protonmail; t=1739095024; x=1739354224;
	bh=bbpvbJLf+duYY3YlKIVsXk4UUKx1qfrSIzIDxcUTFa4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=meikJP4hWQTBUrV43jkKGl+xo6Ga3s+qH7elFiTEkw72fk3UlBHPcrdBMtA4Arbmu
	 iRMWCjnR0ViPJgQDJu5JuEQ4s+g+TvloueJWn2R0KioAxOe5o7AYGBscQzBQSYqZ3y
	 YWUPigsL+RMlOea0rR0iUsmLUn+EtfaRd/RvG2FTfnZY0rMFimxUBRhhsgOe0iy5YW
	 Kt8avj3cvZWQZIgoQXMssR2jSzDTNjH+SS1R9FSP6zQ6NhWyY7v0MuSv/E0lY6njgg
	 mN3RCPIlyzBm2Vc0wU0OCpC644/G9fwyedbWBifB9botmvUROsVaa42Z2okHVNjtBa
	 FoWXpLRj1LUfQ==
Date: Sun, 09 Feb 2025 09:57:00 +0000
To: Mitchell Levy <levymitchell0@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Wedson Almeida Filho <walmeida@microsoft.com>, Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] rust: lockdep: Use Pin for all LockClassKey usages
Message-ID: <fd129e8e-cd2c-4ff9-b3b4-9bdb28582e52@proton.me>
In-Reply-To: <20250207-rust-lockdep-v4-2-7a50a7e88656@gmail.com>
References: <20250207-rust-lockdep-v4-0-7a50a7e88656@gmail.com> <20250207-rust-lockdep-v4-2-7a50a7e88656@gmail.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: ca87baa241cb55602dcd4bcd9b3c0110d1eae35a
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 08.02.25 01:39, Mitchell Levy wrote:
> Reintroduce dynamically-allocated LockClassKeys such that they are
> automatically (de)registered. Require that all usages of LockClassKeys
> ensure that they are Pin'd.
>=20
> Currently, only `'static` LockClassKeys are supported, so Pin is
> redundant. However, it is intended that dynamically-allocated
> LockClassKeys will eventually be supported, so using Pin from the outset
> will make that change simpler.
>=20
> Closes: https://github.com/Rust-for-Linux/linux/issues/1102
> Suggested-by: Benno Lossin <benno.lossin@proton.me>
> Suggested-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Mitchell Levy <levymitchell0@gmail.com>

One nit below, but it's fine.

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

> ---
>  rust/helpers/helpers.c          |  1 +
>  rust/helpers/sync.c             | 13 ++++++++++
>  rust/kernel/sync.rs             | 57 +++++++++++++++++++++++++++++++++++=
+++---
>  rust/kernel/sync/condvar.rs     |  5 ++--
>  rust/kernel/sync/lock.rs        |  9 +++----
>  rust/kernel/sync/lock/global.rs |  5 ++--
>  rust/kernel/sync/poll.rs        |  2 +-
>  rust/kernel/workqueue.rs        |  2 +-
>  8 files changed, 78 insertions(+), 16 deletions(-)

[...]

> diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
> index eb80048e0110..6dafe338bbc7 100644
> --- a/rust/kernel/sync/lock.rs
> +++ b/rust/kernel/sync/lock.rs
> @@ -7,12 +7,9 @@
>=20
>  use super::LockClassKey;
>  use crate::{
> -    init::PinInit,
> -    pin_init,
> -    str::CStr,
> -    types::{NotThreadSafe, Opaque, ScopeGuard},
> +    init::PinInit, pin_init, str::CStr, types::NotThreadSafe, types::Opa=
que, types::ScopeGuard,

Why does this change exist? I prefer imports to be merged.

---
Cheers,
Benno

>  };
> -use core::{cell::UnsafeCell, marker::PhantomPinned};
> +use core::{cell::UnsafeCell, marker::PhantomPinned, pin::Pin};
>  use macros::pin_data;
>=20
>  pub mod mutex;
> @@ -129,7 +126,7 @@ unsafe impl<T: ?Sized + Send, B: Backend> Sync for Lo=
ck<T, B> {}
>=20
>  impl<T, B: Backend> Lock<T, B> {
>      /// Constructs a new lock initialiser.
> -    pub fn new(t: T, name: &'static CStr, key: &'static LockClassKey) ->=
 impl PinInit<Self> {
> +    pub fn new(t: T, name: &'static CStr, key: Pin<&'static LockClassKey=
>) -> impl PinInit<Self> {
>          pin_init!(Self {
>              data: UnsafeCell::new(t),
>              _pin: PhantomPinned,

