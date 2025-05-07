Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7BD1553AA;
	Wed,  7 May 2025 11:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746617750; cv=none; b=H3pvZokaCJc1zdEJpqFReepeiut9aENp8wKY8L2INjHqRW89umBI2Rjf/K1OaAFt+3UuinCSzXOVyQq5hqHX8HueILK81yvM7+yDZCp1apNzVkf8W/hWp4G8rwH4HykMCAkhurVD2ajq06B0PtiTdTY3zZJ1zGmJZYJQCa/IJnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746617750; c=relaxed/simple;
	bh=Vbmo9rJYXSxU4WKj0+cuP9qxT3anE73Uwwtl6Hx+hqs=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=i7HjzFt4su6ULDO47AyUos4f7ytWvikmbNHAXuoOfUBhIVOH3fwtxfQSO/9x02ABcwgZTTOUEIOwBVoA7UVaVRaxDis7HI4et1bXCZ2esDXzV+bqkOVk//qlsmUK+ai5ULwi9PTmDs3BPq0ZYBcZhBMf6M7K3brd4/NZZ1Imqiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZonX/odS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZonX/odS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 598EFC4CEE7;
	Wed,  7 May 2025 11:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746617749;
	bh=Vbmo9rJYXSxU4WKj0+cuP9qxT3anE73Uwwtl6Hx+hqs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZonX/odS33vfyIFQxXFAzIg7kOpbkTJPeUqpm/PLyaOJ9gi7D8ScT/CyGuiW/JJC1
	 rT6Sjj/erQ+kYrAwKeHG5GEp6xvm9uNQBYEcSqHeZTllRmaP847SIGJSjWsMFURjbI
	 3JeELcaD7i7Q+HzfGrDbEwmc5Qjnrm9pO/YcboZSeS2QpY47xIuYnK4QUL0vtisbQ4
	 MqzK+QsEPc/BcqHSol3Xv/QRrAFgTe4clXR6dnrmRtDYcr4MjbX1ELkyRdkLJZO9ia
	 vehNnO+n3ZUNVVOu50QKFD1E5Co9mn9wQjFdlsu07tcewoZoA0zq8pkt9t7v8FjfMh
	 xdAFQzA368UBw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 May 2025 13:35:46 +0200
Message-Id: <D9PWBFMQRL0P.1UGCE5V5SSBLZ@kernel.org>
From: "Benno Lossin" <lossin@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>, "Danilo Krummrich"
 <dakr@kernel.org>
Cc: "Matthew Maurer" <mmaurer@google.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 3/7] rust: alloc: add Vec::push_within_capacity
X-Mailer: aerc 0.20.1
References: <20250502-vec-methods-v5-0-06d20ad9366f@google.com>
 <20250502-vec-methods-v5-3-06d20ad9366f@google.com>
In-Reply-To: <20250502-vec-methods-v5-3-06d20ad9366f@google.com>

On Fri May 2, 2025 at 3:19 PM CEST, Alice Ryhl wrote:
> This introduces a new method called `push_within_capacity` for appending
> to a vector without attempting to allocate if the capacity is full. Rust
> Binder will use this in various places to safely push to a vector while
> holding a spinlock.
>
> The implementation is moved to a push_within_capacity_unchecked method.
> This is preferred over having push() call push_within_capacity()
> followed by an unwrap_unchecked() for simpler unsafe.
>
> Panics in the kernel are best avoided when possible, so an error is
> returned if the vector does not have sufficient capacity. An error type
> is used rather than just returning Result<(),T> to make it more
> convenient for callers (i.e. they can use ? or unwrap).
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

One small nit below, with or without:

Reviewed-by: Benno Lossin <lossin@kernel.org>

[...]

> +    /// Appends an element to the back of the [`Vec`] instance without r=
eallocating.
> +    ///
> +    /// # Safety
> +    ///
> +    /// The length must be less than the capacity.

I would have written:

    - `self.len() < self.capacity()`

---
Cheers,
Benno

> +    pub unsafe fn push_within_capacity_unchecked(&mut self, v: T) {
>          let spare =3D self.spare_capacity_mut();
> =20
> -        // SAFETY: The call to `reserve` was successful so the spare cap=
acity is at least 1.
> +        // SAFETY: By the safety requirements, `spare` is non-empty.
>          unsafe { spare.get_unchecked_mut(0) }.write(v);
> =20
>          // SAFETY: We just initialised the first spare entry, so it is s=
afe to increase the length
> -        // by 1. We also know that the new length is <=3D capacity becau=
se of the previous call to
> -        // `reserve` above.
> +        // by 1. We also know that the new length is <=3D capacity becau=
se the caller guarantees that
> +        // the length is less than the capacity at the beginning of this=
 function.
>          unsafe { self.inc_len(1) };
> -        Ok(())
>      }
> =20
>      /// Removes the last element from a vector and returns it, or `None`=
 if it is empty.
