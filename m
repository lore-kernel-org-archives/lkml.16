Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EB533F9;
	Wed, 23 Apr 2025 13:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745413315; cv=none; b=uvm1z7y7jUHLPAGWXkAffC7OlAEhL33QetfOFpxYr48CitLw9YMrhEaPa2WN4hIfp2fILoQ3vIER7oc2ceHNhpdHaOP710B0auyBWHy/6nmv1FsCNaz7DFEUU0oCSCtB913nDrkKRqAo1Qa4n0eUvnYkrzzutEwe7w3tDoN1C4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745413315; c=relaxed/simple;
	bh=37Vr2hzCFcG72O3fhTS511KfvaT1EeLDbesvyv6i+xE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EXXS9H+RZQmKp/Gak7CZ0cuFuBRoCJblkOqB0mgme0Esvy+W3Hg/bnT48UFo9L37yFBEpktPlDKEJUFf4Fom9qE37u1VoSK1DJvfPTFS9Hv0SO3mqp5e3oTp2oqhmx/9wB5+4Dhri815g2XKeMoCedxw89fFnBwXW9J7Y+yH6d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i0boAS1p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i0boAS1p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79C9EC4CEEB;
	Wed, 23 Apr 2025 13:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745413314;
	bh=37Vr2hzCFcG72O3fhTS511KfvaT1EeLDbesvyv6i+xE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=i0boAS1pdh9r02e2RHNGJwgp7pRV1UH4GQLsvtAN+vPpkIdqGRy11ZWNKoRk7UDM1
	 PNkpZQrl7ZIehaNlqkZN7EFmCW5MIrmfcdxq56+9eKklAogSVHYrSKttKwmpdxFl/n
	 23qCqlZjGRhdCKrGmOsH8VXZvo5RD91KHoDIoaZi3Ccvgw0Wqk6x9d6yDbc1uU+YfI
	 gNgcQN0TqTod9Aol3I0eYnCtMMPJ7dJCqgF92jWyogLiVe/FdO9qP9bmASOCueYP3Y
	 Mki3zszCFLBl6IyDo3CUeQJ4Q0rEFFJyiQyideBWqIDRWPEgUiujrnBan7SGBD80MB
	 UZQXOPny327gg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Lyude Paul <lyude@redhat.com>
Cc: rust-for-linux@vger.kernel.org,  linux-kernel@vger.kernel.org,  Boqun
 Feng <boqun.feng@gmail.com>,  FUJITA Tomonori <fujita.tomonori@gmail.com>,
  Frederic Weisbecker <frederic@kernel.org>,  Thomas Gleixner
 <tglx@linutronix.de>,  Anna-Maria Behnsen <anna-maria@linutronix.de>,
  John Stultz <jstultz@google.com>,  Stephen Boyd <sboyd@kernel.org>,
  Miguel Ojeda <ojeda@kernel.org>,  Alex Gaynor <alex.gaynor@gmail.com>,
  Gary Guo <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,
  Benno Lossin <benno.lossin@proton.me>,  Alice Ryhl
 <aliceryhl@google.com>,  Trevor Gross <tmgross@umich.edu>,  Danilo
 Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v2 5/8] rust: time: Add Instant::from_nanos()
In-Reply-To: <20250415195020.413478-6-lyude@redhat.com> (Lyude Paul's message
	of "Tue, 15 Apr 2025 15:48:26 -0400")
References: <20250415195020.413478-1-lyude@redhat.com>
	<20250415195020.413478-6-lyude@redhat.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Wed, 23 Apr 2025 14:29:22 +0200
Message-ID: <87o6wnkqn1.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Lyude Paul <lyude@redhat.com> writes:

> For implementing Rust bindings which can return a point in time.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  rust/kernel/time.rs | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
> index 8d6aa88724ad8..545963140f180 100644
> --- a/rust/kernel/time.rs
> +++ b/rust/kernel/time.rs
> @@ -83,6 +83,14 @@ pub fn elapsed(&self) -> Delta {
>      pub(crate) fn as_nanos(self) -> i64 {
>          self.inner
>      }
> +
> +    #[expect(unused)]
> +    #[inline]
> +    pub(crate) fn from_nanos(nanos: i64) -> Self {

Should we `debug_assert!` a positive value here?


Best regards,
Andreas Hindborg



