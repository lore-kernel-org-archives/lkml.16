Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4130519C556;
	Wed, 30 Apr 2025 15:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746028036; cv=none; b=ig26TyDNjOkpFbHaOhIyZVE7cnCBBq4cZuufelOuNh1JmXjxIgRuPFb0YQODF3ta6wQba9f4v/WkRbH35pIww9BlZsUO2WRcUFm02MObAfyR0UYlZ1DZgyIj4vJ9q3uQki/gug5tDzLVe6JwH8KB1jLpx7x6iiTHC3D8bCS5F4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746028036; c=relaxed/simple;
	bh=RqZy/6PU4jTCi/K6S4Ve1RF8Ukphek4E1WYilXhVSTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UBDZNYZgqVjR5/s0bMHx87N/I2ptHMzoCj/NGnOnF+RiF4ZV+MgXLxf15tAbgOwePOnUdM21YerqRPjDUCpxJkJZnxN+89Yg/nDNZ+ttl7ZUWMSpKsqjkHYp3L7vKM72t/cDaEp3jU17YdAoM32NnJe2uInz1/sU2XDPawCD5LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YZBynokb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YZBynokb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5D6EC4CEE7;
	Wed, 30 Apr 2025 15:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746028035;
	bh=RqZy/6PU4jTCi/K6S4Ve1RF8Ukphek4E1WYilXhVSTs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YZBynokb7QgG7cAmgQyqkkQuUjObYPQIvFMHKClLFgxrlk0uyp85Ql8e7a+Gp3Fra
	 HytERvZ3YySdxmXj21yOjDKLvVX2y7AukSqf5nSeJlawdNtGUz1JcH/rVhWzycPseT
	 0Iqx9WE1sa/GsjwM4y/IsjYowCQU9U4z9P+fRJPzd5+0gGOmXke3ki1eNZEAcOHSnk
	 5mNi+SiLu5bLKxQrGIFtjVF9apTiod/m9l9aKIQP2fPxyXFytXJ4rBxBN0mLv/s7Vk
	 3VKgo5zkxtlB1NI7S50L9N110n337eD1OqrnjXrcJx+RGPz48J8u0gKTG5OYaA+A2U
	 itjFUz7vHkb8Q==
Date: Wed, 30 Apr 2025 17:47:11 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/7] rust: alloc: add Vec::drain_all
Message-ID: <aBJF_5_5fM5mORmd@pollux>
References: <20250429-vec-methods-v4-0-dad4436ff82d@google.com>
 <20250429-vec-methods-v4-4-dad4436ff82d@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429-vec-methods-v4-4-dad4436ff82d@google.com>

On Tue, Apr 29, 2025 at 02:44:24PM +0000, Alice Ryhl wrote:
> 
> +    /// Takes ownership of all items in this vector without consuming the allocation.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// let mut v = kernel::kvec![0, 1, 2, 3]?;
> +    ///
> +    /// for (i, j) in v.drain_all().enumerate() {
> +    ///     assert_eq!(i, j);
> +    /// }
> +    ///
> +    /// assert!(v.capacity() >= 4);
> +    /// # Ok::<(), Error>(())
> +    /// ```
> +    pub fn drain_all(&mut self) -> DrainAll<'_, T> {
> +        let len = self.len();
> +        // SAFETY: The length is not greater than the length.
> +        let elems = unsafe { self.dec_len(len) };

Maybe just pass self.len() directly and say that "`By the safety requirements of
`dec_len()`, self.len() is a valid argument".
