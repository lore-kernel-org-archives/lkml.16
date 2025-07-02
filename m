Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B15111BF;
	Wed,  2 Jul 2025 08:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751445388; cv=none; b=iH+TTN3SYC3LxCRJ0E0Vgpe0K5pHYD83xJzfVmFnHm/HK9wKKbgIorp9BctO7LQziLaolzrawm3lXoxZYPrvqy0pSanBpUIKrXhOp7NXAaYr/5vRNznyUrqL5VU8/awtUnGlhjFWAsR5OfTq0YkFjSXBRIOmqo22N8tFDptCuxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751445388; c=relaxed/simple;
	bh=+CYTl1MpgsGBLiGzN2Y+Vs0Uknx1XmI4W5UXVIwJUMw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=q5k1jMP2UTuhRixP10IFFANn0vTtt59Hmp+XpJNcRFJ3hCPlfqhXiafqmRu0fRmZkwi5KPc55jNSXsstPD3brQYgHGCTi9ZM4rrZDDnTqHc5JKzuC0wEcQ6Eg/QS8l8da/bE4pPIUUynCbXV5zOmOEYe+9yu1QKQTtgsV5Kq1Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nVFHXjRm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nVFHXjRm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17E00C4CEED;
	Wed,  2 Jul 2025 08:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751445387;
	bh=+CYTl1MpgsGBLiGzN2Y+Vs0Uknx1XmI4W5UXVIwJUMw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=nVFHXjRm6VMXMD3JTx7IVmrPLBSCJbHYgZKE845WcS/cHQuxjErC7qloEpSm6/E89
	 3GmnKv98LtQG9k0d4caa9upPKPfUkvL/6OnyKjJvDyOsARACtpvMTjGD9rjgigMx0q
	 rxqsqdEWkdHyGDPK2jXg6fNEQ/xs2Byr3XcNRlFXqb6iUyEx6AMkX9l4cFKsNsi7SP
	 LM85vGA77IWiHZTh2LloH2mnQGz1QgpwhAwEsH0H1+rjoVio97icM9fOBNJ1wqUgmQ
	 vsCqRWbeJKZ1+CkGxTt3iZDOEe3mVEJ9xBPQk0KdwrpbZKdGPyKmKPVUJlW2hqPZtv
	 j9TTU1+G/TO2Q==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "FUJITA Tomonori" <fujita.tomonori@gmail.com>
Cc: <alex.gaynor@gmail.com>,  <ojeda@kernel.org>,  <aliceryhl@google.com>,
  <anna-maria@linutronix.de>,  <bjorn3_gh@protonmail.com>,
  <boqun.feng@gmail.com>,  <dakr@kernel.org>,  <frederic@kernel.org>,
  <gary@garyguo.net>,  <jstultz@google.com>,
  <linux-kernel@vger.kernel.org>,  <lossin@kernel.org>,
  <lyude@redhat.com>,  <rust-for-linux@vger.kernel.org>,
  <sboyd@kernel.org>,  <tglx@linutronix.de>,  <tmgross@umich.edu>
Subject: Re: [PATCH v1] rust: time: Add examples with doctest for Delta
In-Reply-To: <20250701001809.496389-1-fujita.tomonori@gmail.com> (FUJITA
	Tomonori's message of "Tue, 01 Jul 2025 09:18:09 +0900")
References: <kyrCsGDYN5QdXPkUe4OxMxU2UzHfJ-vH5z643gA-_KFJIaew0duyMXU0yfTrGN5ZCNaecP8Yu2kIXKXMoWS2lA==@protonmail.internalid>
	<20250701001809.496389-1-fujita.tomonori@gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 02 Jul 2025 10:36:19 +0200
Message-ID: <874ivvvvjw.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:

> Add examples with doctest for Delta methods and associated
> functions. These examples explicitly test overflow and saturation
> behavior.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/kernel/time.rs | 67 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
>
> diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
> index 64c8dcf548d6..c6322275115a 100644
> --- a/rust/kernel/time.rs
> +++ b/rust/kernel/time.rs
> @@ -228,11 +228,34 @@ impl Delta {
>      /// A span of time equal to zero.
>      pub const ZERO: Self = Self { nanos: 0 };
>
> +    /// Create a new [`Delta`] from a number of nanoseconds.
> +    ///
> +    /// The `nanos` can range from [`i64::MIN`] to [`i64::MAX`].
> +    #[inline]
> +    pub const fn from_nanos(nanos: i64) -> Self {
> +        Self { nanos }
> +    }
> +
>      /// Create a new [`Delta`] from a number of microseconds.
>      ///
>      /// The `micros` can range from -9_223_372_036_854_775 to 9_223_372_036_854_775.
>      /// If `micros` is outside this range, `i64::MIN` is used for negative values,
>      /// and `i64::MAX` is used for positive values due to saturation.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// let delta = kernel::time::Delta::from_micros(5);
> +    /// assert_eq!(delta.as_nanos(), 5_000);
> +    /// let delta = kernel::time::Delta::from_micros(9_223_372_036_854_775);
> +    /// assert_eq!(delta.as_nanos(), 9_223_372_036_854_775_000);
> +    /// let delta = kernel::time::Delta::from_micros(9_223_372_036_854_776);
> +    /// assert_eq!(delta.as_nanos(), i64::MAX);
> +    /// let delta = kernel::time::Delta::from_micros(-9_223_372_036_854_775);
> +    /// assert_eq!(delta.as_nanos(), -9_223_372_036_854_775_000);
> +    /// let delta = kernel::time::Delta::from_micros(-9_223_372_036_854_776);
> +    /// assert_eq!(delta.as_nanos(), i64::MIN);
> +    /// ```


I think this kind of test would be better suited for the new `#[test]`
macro. Would you agree?


Best regards,
Andreas Hindborg


