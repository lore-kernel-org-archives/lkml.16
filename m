Received: from gimli.kloenk.de (gimli.kloenk.de [49.12.72.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F9D194C86;
	Thu, 30 Jan 2025 11:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.72.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738237901; cv=none; b=NT18l9NpnaWf2Zu7Iv/bV8jNRQVOeCrpXsxp4nnjp0SIDTJXXw/NlIn2rRF3U3hVOktbSszIEBMXqBJOV3gPzJ0fkcFUnKDdBM+z1LNKfho7OEfR+2PoRYNDQBwGZfaNGWGLSAdFxYTOq0rSi+ncq6gKwNm1ow1JHITv4r9K/PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738237901; c=relaxed/simple;
	bh=qzVB5dejVD9y+s4aDA26TD4LJiAiNCcUNVrVO2lgScA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Bkav5U2x7q15lFjv9ipa5dwaqV4gJhJhiVb3GBIW45Cv4mtG7xhdG8JYNHnWHA9qrnkeEvnDemGGz26b9plql78jJCuiYzzxbHuMsOSU+jGUPLYwP/8BXzRYdsIW46TySfiLMxZ63oJCKSHyhr+JD6a3EYkZ/pcOkXFhdZiYq4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev; spf=pass smtp.mailfrom=kloenk.dev; dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b=Dm04BFHg; arc=none smtp.client-ip=49.12.72.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b="Dm04BFHg"
From: Fiona Behrens <me@kloenk.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kloenk.dev; s=mail;
	t=1738237895; bh=NQNSnl3qDG9eyTZUKTMLfYdNmi5a5JKOQOrW03s2joE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Dm04BFHg31/fkmOnLrXnmFGEcfMXRmRW+ng9nyRShhmABY9HNKSlQQaA7DdTGxVd0
	 tt8IfEaOZg4EyhlI9yHh61SRsBQbq9WZxbq7YmHC2xNFk6vMBJqnadKTX5/nKlgin3
	 UDtrrEcFZDSMPTKDjBQkMepcF23x9aFgDESYFIJY=
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>,  Boqun Feng <boqun.feng@gmail.com>,
  Gary Guo <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>,  Benno Lossin <benno.lossin@proton.me>,
  Andreas Hindborg <a.hindborg@kernel.org>,  Trevor Gross
 <tmgross@umich.edu>,  Peter Zijlstra <peterz@infradead.org>,  Ingo Molnar
 <mingo@redhat.com>,  Will Deacon <will@kernel.org>,  Waiman Long
 <longman@redhat.com>,  rust-for-linux@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: sync: add accessor for the lock behind a given guard
In-Reply-To: <20250130-guard-get-lock-v1-1-8ed87899920a@google.com> (Alice
	Ryhl's message of "Thu, 30 Jan 2025 11:39:32 +0000")
References: <20250130-guard-get-lock-v1-1-8ed87899920a@google.com>
Date: Thu, 30 Jan 2025 12:51:34 +0100
Message-ID: <87zfj8eczd.fsf@kloenk.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Alice Ryhl <aliceryhl@google.com> writes:

> Binder has some methods where the caller provides a lock guard, and
> Binder needs to be able to assert that the guard is associated with the
> right lock. To enable this, add an accessor to obtain a reference to the
> underlying lock that you can pass to `ptr::eq`.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Fiona Behrens <me@kloenk.dev>

> ---
>  rust/kernel/sync/lock.rs | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
> index 41dcddac69e2..681d67275b49 100644
> --- a/rust/kernel/sync/lock.rs
> +++ b/rust/kernel/sync/lock.rs
> @@ -169,7 +169,12 @@ pub struct Guard<'a, T: ?Sized, B: Backend> {
>  // SAFETY: `Guard` is sync when the data protected by the lock is also sync.
>  unsafe impl<T: Sync + ?Sized, B: Backend> Sync for Guard<'_, T, B> {}
>  
> -impl<T: ?Sized, B: Backend> Guard<'_, T, B> {
> +impl<'a, T: ?Sized, B: Backend> Guard<'a, T, B> {
> +    /// Returns the lock that this guard originates from.
> +    pub fn lock(&self) -> &'a Lock<T, B> {
> +        self.lock
> +    }
> +
>      pub(crate) fn do_unlocked<U>(&mut self, cb: impl FnOnce() -> U) -> U {
>          // SAFETY: The caller owns the lock, so it is safe to unlock it.
>          unsafe { B::unlock(self.lock.state.get(), &self.state) };
>
> ---
> base-commit: ceff0757f5dafb5be5205988171809c877b1d3e3
> change-id: 20250130-guard-get-lock-dd5452793d9a
>
> Best regards,
