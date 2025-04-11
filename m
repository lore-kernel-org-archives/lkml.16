Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE257290BCF
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 12:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744375402; cv=none; b=g6kB0cxJUUKAtPHcvDgI6Bz1BoUVwsEOlqmSsve0ubCCFC1V59vw8fKLaNMzRne7FWF9Q7MHodMqRji+1i6PL+0tiAbFdMMBo7eVWFRao9+4/eGlcf4wBZY5MIyNdfelcioqqUmKWyFZEW1NyFjP4zXy5Sx6nQMZfeBJ+q45NfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744375402; c=relaxed/simple;
	bh=P1zQf8kAKobzVBeJEcS0MCw8raw2jLMB9XWrZOaVBi4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OSotddyU+VD+eXZb6uGw2wZIfsXE45MlYQXJWI6KKzOTHaQ7rRZj1mh7bdZIuzOyhHw5UbsHP6kn2+3YlgfjrPhuMFaAWtRnCFHKJaD3Iu26KXQRyZ3Flnx7Bmkc1eZcjPQnhc/OS/egwonrxfilk1lCG8tMSYAtdDElmX7fsSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=FxlUfy/2; arc=none smtp.client-ip=109.224.244.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="FxlUfy/2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=etr4v4u6ufcdhk2pjn7vwmgjpi.protonmail; t=1744375397; x=1744634597;
	bh=KeHFjHClHGzraiUMbSQaXzvSScQGZcUsAN1CBTNnBdA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=FxlUfy/2nPfpf6Y4zF2GtsmWY0wtobZnfgGhh8/U18Zltf1/JvZrjiYa/Qd/nOsrX
	 qBEZTPqJnA4sKAZTLNX3gF//e8pGbhDdZaHniWGCLt+svmaBYjMsSuIsQ8ehYQgaaO
	 7RBPVxrTPaPy2SnTCp2HM/eHICUyLL0lvcDJtwfCZtpM5X/Dn/5Bf/6yW6fJ9iv5js
	 lX9yRs5MUtLh/f10o874iTso3Q+/VumzqXaW+rlhQOmmHphRlk+PaXQIweVnOUDV5j
	 k+osjz3KrhWI7M2tYKj6uTMxkX5JyC3d/Sqjfo54fp2TKOZWEU6U6QIt3YJhlgRJHc
	 Ajx1aLvNj1oJQ==
Date: Fri, 11 Apr 2025 12:43:11 +0000
To: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust: alloc: allow coercion from `Box<T>` to `Box<dyn U>` if T implements U
Message-ID: <D93TGVDQS6B6.1V6CKR5QSEWF6@proton.me>
In-Reply-To: <20250411-box_trait_objs-v2-1-c5f31b8db847@nvidia.com>
References: <20250411-box_trait_objs-v2-1-c5f31b8db847@nvidia.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 01337d7214de44fd2dce290a24dcd8de785da503
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri Apr 11, 2025 at 2:07 PM CEST, Alexandre Courbot wrote:
> This enables the creation of trait objects backed by a Box, similarly to
> what can be done with the standard library.
>
> Suggested-by: Benno Lossin <benno.lossin@proton.me>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

> ---
> From this discussion on Zulip [1].
>
> Heavily inspired from the similar feature on `Arc`.
>
> [1] https://rust-for-linux.zulipchat.com/#narrow/channel/291565-Help/topi=
c/Trait.20objects.3F/with/510689662
> ---
> Changes in v2:
> - Use where clauses to improve readability.
> - Fix build with rustc 1.78.
> - Link to v1: https://lore.kernel.org/r/20250408-box_trait_objs-v1-1-58d8=
e78b0fb2@nvidia.com
> ---
>  rust/kernel/alloc/kbox.rs | 30 +++++++++++++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)
>
> diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
> index b77d32f3a58bab5ec73c612bdaaba0d79bfdff65..b9a905cd4bd285782b0db284b=
6771aec03e0c10b 100644
> --- a/rust/kernel/alloc/kbox.rs
> +++ b/rust/kernel/alloc/kbox.rs
> @@ -32,6 +32,8 @@
>  ///
>  /// When dropping a [`Box`], the value is also dropped and the heap memo=
ry is automatically freed.
>  ///
> +/// [`Box`]es can also be used to store trait objects by coercing their =
type.
> +///
>  /// # Examples

I agree with Miguel, you could move the added line above down here and
also provide a simple example.

---
Cheers,
Benno

>  ///
>  /// ```

