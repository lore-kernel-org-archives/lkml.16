Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D261A3177;
	Wed, 30 Apr 2025 15:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746027264; cv=none; b=EtTc0WW9Vf9/ZaURQCPQ2m2iU4JJ0z0+6DvGYRrE09+sz9Dq2DPChSS+viOj6ZcyHabJyH64YT/Rr7TGRarLu/Lki4Mah+30qNjtGgna9U0b+1d4qtMng0Jo65S/79TMXiN0CNDZXJPAoGKC/jfN73gzxKKPQyVphCRdr75JPXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746027264; c=relaxed/simple;
	bh=LJJMDVul+rsadwGqpqmMBm+mrExK4jHmz9gc1RiWuIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ayrAazAUjHcybuxfzsbge77yXnuSAbIEV5M5UfNrW+Pup1UKfjWPIDcfCWmNfw2KsxInK+S+SVuKIUcP4gu02DYIbA1oTJjiV9lp9ESFZfQN4D8p0+84vnV+v9eXf2gHABbOJB102QpctitRNljYjUApFJ/kj0+vKe7AwmAdnnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=udd6PWpj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="udd6PWpj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7C4FC4CEE7;
	Wed, 30 Apr 2025 15:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746027263;
	bh=LJJMDVul+rsadwGqpqmMBm+mrExK4jHmz9gc1RiWuIc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=udd6PWpjrjhAzrjOsADCjKo60NjMQNGQPURQZtLi9P5jTuMF83+bOFPL+vwchAclM
	 JKTCKkZ0sKmJEaabhI8wOz3dQQJfssM3Gkhzj9zTRYDm9VHE8/Wzpy2n2fxyPyXeDy
	 RgFSn9mKWnGMC/UVAiPTPcKkgc5qcoB3j39m13j/am7PwcFBTmnE/4dVkS2X8fUT7Y
	 20udzCi5SsJc+XGAj3yRld7n/4dx5wCxdQU0s7fvY4IppYVyBoYfm/tOGhUaavw/qq
	 RSifZitv6bBST/WVQDqF63iq27IErZ8RlgTQDgNEjmhsEB2cyxMGn3ilUuhE5roVru
	 szK49iWNybCmw==
Date: Wed, 30 Apr 2025 17:34:20 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>
Subject: Re: [PATCH v4 3/7] rust: alloc: add Vec::push_within_capacity
Message-ID: <aBJC_Ef1lKHNx4dv@pollux>
References: <20250429-vec-methods-v4-0-dad4436ff82d@google.com>
 <20250429-vec-methods-v4-3-dad4436ff82d@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429-vec-methods-v4-3-dad4436ff82d@google.com>

On Tue, Apr 29, 2025 at 02:44:23PM +0000, Alice Ryhl wrote:
> 
> +    /// Appends an element to the back of the [`Vec`] instance without reallocating.
> +    ///
> +    /// Fails if the vector does not have capacity for the new element.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// let mut v = KVec::with_capacity(10, GFP_KERNEL)?;
> +    /// for i in 0..10 {
> +    ///     v.push_within_capacity(i).unwrap();

I'd prefer to make this

	v.push_within_capacity(i).map_err(|_| ENOMEM)?;

instead.

> +    /// }
> +    ///
> +    /// assert!(v.push_within_capacity(10).is_err());
> +    /// # Ok::<(), Error>(())
> +    /// ```
> +    pub fn push_within_capacity(&mut self, v: T) -> Result<(), T> {
> +        if self.len() < self.capacity() {
> +            // SAFETY: The length is less than the capacity.
> +            unsafe { self.push_within_capacity_unchecked(v) };
> +            Ok(())
> +        } else {
> +            Err(v)
> +        }
> +    }
>  
> +    /// Appends an element to the back of the [`Vec`] instance without reallocating.
> +    ///
> +    /// # Safety
> +    ///
> +    /// The length must be less than the capacity.

NIT: Maybe be more specific and say:

"`self.len()` must be less than `self.capacity()`."
