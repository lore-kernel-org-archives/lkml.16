Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD62261362;
	Wed, 30 Apr 2025 16:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746030369; cv=none; b=ctY9AT4ocUg7RtunVYxvV5o2F9qOqbWPiH07P6+M/wuYrWY/D+aDw3OS/Ikj8D2iQYlx8W9fNmiOVWXksdrHL+xiyqk55BbIqI4f9CXeDK+xTsMlewmBOG+/ZiNlm0yteWBurBzRtGZGOfhmYq9cHMc/JFlvBoJjSQPqoYEuU9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746030369; c=relaxed/simple;
	bh=hDWjvaRuOUyneWLyZQ5qYzQIZME0G84HNq7ZxRdl/VI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BCBXla68iriJeMsAQVfRX/hKE4CIT3hZzcoLg6jv7qIPE5EtP7X0/66BTTzPfvQw3s48tmXkEqQDB6Fm5WixSFT4Hh6kdB/xhPgGXc6cFs0SLzTVLmCzRiOn5cGfZYOt8uEDNiiVrCPzO1PJDOV3B6y/CeJKJ3sLUeGE+UNi2Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KD4Y2I0U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KD4Y2I0U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBB40C4CEE7;
	Wed, 30 Apr 2025 16:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746030369;
	bh=hDWjvaRuOUyneWLyZQ5qYzQIZME0G84HNq7ZxRdl/VI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KD4Y2I0UN/RvRqMxBNGk7d059X1HxBqxD7LhRB1W4WtwOEH5fJNZ55V/GReyXpVIa
	 +gqvXyKjDeKQpH4C8CMsUrZC3LGWNl5bh9jzP1rL0ByjJeV7MhifKNbezrprLbASB7
	 VuELCmdDeFrwbtJ6w88n4Xa+fKYVEW4QwHtaHgJqIQep2fOMlvuTyGyiAnNCfRRGit
	 ycKogItCp8hUCcM61mzFZZaTaMKNAN4EIeCQSmEuJsojzovyEh1oaBzaAhYHBKz6ZU
	 CsvOMYUe57cG/njsHKzpol6OOzguE/RBhjy37dkqy/2vLJT6JqI0f3Awl7Vn7cvLAh
	 NEZH46yKCfNWw==
Date: Wed, 30 Apr 2025 18:26:05 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 5/7] rust: alloc: add Vec::retain
Message-ID: <aBJPHUDYBGyAgUNf@pollux>
References: <20250429-vec-methods-v4-0-dad4436ff82d@google.com>
 <20250429-vec-methods-v4-5-dad4436ff82d@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429-vec-methods-v4-5-dad4436ff82d@google.com>

On Tue, Apr 29, 2025 at 02:44:25PM +0000, Alice Ryhl wrote:
> This adds a common Vec method called `retain` that removes all elements
> that don't match a certain condition. Rust Binder uses it to find all
> processes that match a given pid.
> 
> The stdlib retain method takes &T rather than &mut T and has a separate
> retain_mut for the &mut T case. However, this is considered an API
> mistake that can't be fixed now due to backwards compatibility. There's
> no reason for us to repeat that mistake.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/kernel/alloc/kvec.rs | 72 +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
> 
> diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> index 72bc743ec88bf7b91a0a1ffd9f830cfe4f983ffd..357f5a37c7b1d15b709a10c162292841eed0e376 100644
> --- a/rust/kernel/alloc/kvec.rs
> +++ b/rust/kernel/alloc/kvec.rs
> @@ -608,6 +608,29 @@ pub fn drain_all(&mut self) -> DrainAll<'_, T> {
>              elements: elems.iter_mut(),
>          }
>      }
> +
> +    /// Removes all elements that don't match the provided closure.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// let mut v = kernel::kvec![1, 2, 3, 4]?;
> +    /// v.retain(|i| *i % 2 == 0);

NIT: What about making this `v.retain(|&mut i| i % 2 == 0)`?

> +    /// assert_eq!(v, [2, 4]);
> +    /// # Ok::<(), Error>(())
> +    /// ```
> +    pub fn retain(&mut self, mut f: impl FnMut(&mut T) -> bool) {
> +        let mut num_kept = 0;
> +        let mut next_to_check = 0;
> +        while let Some(to_check) = self.get_mut(next_to_check) {
> +            if f(to_check) {
> +                self.swap(num_kept, next_to_check);
> +                num_kept += 1;
> +            }
> +            next_to_check += 1;
> +        }
> +        self.truncate(num_kept);
> +    }
>  }
>  
>  impl<T: Clone, A: Allocator> Vec<T, A> {
> @@ -1130,3 +1153,52 @@ fn drop(&mut self) {
>          }
>      }
>  }
> +
> +#[macros::kunit_tests(rust_kvec_kunit)]
> +mod tests {
> +    use super::*;
> +    use crate::prelude::*;
> +
> +    #[test]
> +    fn test_kvec_retain() {

Can we have this return a Result, like doctests can do?

> +        /// Verify correctness for one specific function.
> +        #[expect(clippy::needless_range_loop)]
> +        fn verify(c: &[bool]) {
> +            let mut vec1: KVec<usize> = KVec::with_capacity(c.len(), GFP_KERNEL).unwrap();
> +            let mut vec2: KVec<usize> = KVec::with_capacity(c.len(), GFP_KERNEL).unwrap();
> +
> +            for i in 0..c.len() {
> +                vec1.push_within_capacity(i).unwrap();
> +                if c[i] {
> +                    vec2.push_within_capacity(i).unwrap();
> +                }
> +            }
> +
> +            vec1.retain(|i| c[*i]);
> +
> +            assert_eq!(vec1, vec2);

Don't we have macros around kunit_assert!() and kunit_assert_eq() outside of
doctests (i.e. dedicated kunit tests)?

I much prefer their output over the kernel panic we get with the "normal"
asserts, unwraps, etc.

Consistently sticking to the same output on failure makes it easier to catch and
easier to setup CI environments.

> +        }
> +
> +        /// Add one to a binary integer represented as a boolean array.
> +        fn add(value: &mut [bool]) {
> +            let mut carry = true;
> +            for v in value {
> +                let new_v = carry != *v;
> +                carry = carry && *v;
> +                *v = new_v;
> +            }
> +        }
> +
> +        // This boolean array represents a function from index to boolean. We check that `retain`
> +        // behaves correctly for all possible boolean arrays of every possible length less than
> +        // ten.
> +        let mut func = KVec::with_capacity(10, GFP_KERNEL).unwrap();
> +        for len in 0..10 {
> +            for _ in 0u32..1u32 << len {
> +                verify(&func);
> +                add(&mut func);
> +            }
> +            func.push_within_capacity(false).unwrap();
> +        }
> +    }
> +}
> 
> -- 
> 2.49.0.901.g37484f566f-goog
> 
