Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE78A81ACA;
	Thu,  1 May 2025 11:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746099026; cv=none; b=q/phHaoLVi+ArPW73KBj2hlFHfkB8It3P+9+Y9q+UK3VaLZBdRlqu7ECrFEav6SeT5Y8guc6hrrwFb4k4yivjKqobBXzRiGUT+UXgfhOBa2F5Rh04bgxB7md+Df22Nprq50nEDiXzp90W0PxhkXz/yILhe3pJVnwzURXNYQ2uhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746099026; c=relaxed/simple;
	bh=4Ds19eHlJOGqn/h+KCCqyUDgAqgoR57GRgX2HX9SGBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PA3mqfPUc7sDWo/QSyNzxsW91w17N8X4SGsdviosY+d4LRjpm0DMoIQiuadamuzX1H7cyxyzeCoEG9SLkpt48jaK6pZWRVQiemAQrgQ30YyDAsZywenLaNVqMIyDH88x5ULYwW5S0+28OfyzE5HxWzcIB6e2tPslSdkqCYAY1+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qCiLuN/X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qCiLuN/X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57C89C4CEE3;
	Thu,  1 May 2025 11:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746099024;
	bh=4Ds19eHlJOGqn/h+KCCqyUDgAqgoR57GRgX2HX9SGBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qCiLuN/X5b/t9vQjE+BPMTfWeVTVNWppPRGWMXGz1QYWfVei4ruxhBCKgxlkEsIXH
	 WeuV0UIwCoYczwrt4ff3Ot2ahwCB+WNP4hqa8HKv1jJt/3SckhuXAaoCkOZA0zUdVO
	 /JvHpUij4J8XG1bJOzMYQlKCdzk+ZRXD1ugP5SQSfyZ5zl5vL/MD3nCsTZeq8dIgp6
	 EuReO/HKqSxD2WNjwrD3ycryCDXdPbBxJO0t95NJr/AFGC8d9ZN9wYTkTBCUwD1qOy
	 Y56psZYV18q9z7h/X/f0EXgHZmM2f6rXfTblPz6mXFDNw2Pl549HbFTmQM6TkzJaM/
	 seYzFMlq0dqOQ==
Date: Thu, 1 May 2025 13:30:20 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 5/7] rust: alloc: add Vec::retain
Message-ID: <aBNbTL2dIOFQq8yG@pollux>
References: <20250429-vec-methods-v4-0-dad4436ff82d@google.com>
 <20250429-vec-methods-v4-5-dad4436ff82d@google.com>
 <aBJPHUDYBGyAgUNf@pollux>
 <aBNWlC6uSOiFrQDL@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBNWlC6uSOiFrQDL@google.com>

On Thu, May 01, 2025 at 11:10:12AM +0000, Alice Ryhl wrote:
> On Wed, Apr 30, 2025 at 06:26:05PM +0200, Danilo Krummrich wrote:
> > On Tue, Apr 29, 2025 at 02:44:25PM +0000, Alice Ryhl wrote:
> > > This adds a common Vec method called `retain` that removes all elements
> > > that don't match a certain condition. Rust Binder uses it to find all
> > > processes that match a given pid.
> > >
> > > The stdlib retain method takes &T rather than &mut T and has a separate
> > > retain_mut for the &mut T case. However, this is considered an API
> > > mistake that can't be fixed now due to backwards compatibility. There's
> > > no reason for us to repeat that mistake.
> > >
> > > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > > ---
> > >  rust/kernel/alloc/kvec.rs | 72 +++++++++++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 72 insertions(+)
> > >
> > > diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> > > index 72bc743ec88bf7b91a0a1ffd9f830cfe4f983ffd..357f5a37c7b1d15b709a10c162292841eed0e376 100644
> > > --- a/rust/kernel/alloc/kvec.rs
> > > +++ b/rust/kernel/alloc/kvec.rs
> > > @@ -608,6 +608,29 @@ pub fn drain_all(&mut self) -> DrainAll<'_, T> {
> > >              elements: elems.iter_mut(),
> > >          }
> > >      }
> > > +
> > > +    /// Removes all elements that don't match the provided closure.
> > > +    ///
> > > +    /// # Examples
> > > +    ///
> > > +    /// ```
> > > +    /// let mut v = kernel::kvec![1, 2, 3, 4]?;
> > > +    /// v.retain(|i| *i % 2 == 0);
> >
> > NIT: What about making this `v.retain(|&mut i| i % 2 == 0)`?
> >
> > > +    /// assert_eq!(v, [2, 4]);
> > > +    /// # Ok::<(), Error>(())
> > > +    /// ```
> > > +    pub fn retain(&mut self, mut f: impl FnMut(&mut T) -> bool) {
> > > +        let mut num_kept = 0;
> > > +        let mut next_to_check = 0;
> > > +        while let Some(to_check) = self.get_mut(next_to_check) {
> > > +            if f(to_check) {
> > > +                self.swap(num_kept, next_to_check);
> > > +                num_kept += 1;
> > > +            }
> > > +            next_to_check += 1;
> > > +        }
> > > +        self.truncate(num_kept);
> > > +    }
> > >  }
> > >
> > >  impl<T: Clone, A: Allocator> Vec<T, A> {
> > > @@ -1130,3 +1153,52 @@ fn drop(&mut self) {
> > >          }
> > >      }
> > >  }
> > > +
> > > +#[macros::kunit_tests(rust_kvec_kunit)]
> > > +mod tests {
> > > +    use super::*;
> > > +    use crate::prelude::*;
> > > +
> > > +    #[test]
> > > +    fn test_kvec_retain() {
> >
> > Can we have this return a Result, like doctests can do?
> 
> I get warning when I try that:
> 
> warning: unused `core::result::Result` that must be used
>     --> rust/kernel/alloc/kvec.rs:1232:1
>      |
> 1232 | #[macros::kunit_tests(rust_kvec_kunit)]
>      | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>      |
>      = note: this `Result` may be an `Err` variant, which should be handled
>      = note: `#[warn(unused_must_use)]` on by default
>      = note: this warning originates in the attribute macro `macros::kunit_tests`
>              (in Nightly builds, run with -Z macro-backtrace for more info)

Yes, I'm aware, I tried playing with that myself. I really meant the question as
I wrote, not as "Can you please change that?". :-) Sorry for the confusion.

> > > +        /// Verify correctness for one specific function.
> > > +        #[expect(clippy::needless_range_loop)]
> > > +        fn verify(c: &[bool]) {
> > > +            let mut vec1: KVec<usize> = KVec::with_capacity(c.len(), GFP_KERNEL).unwrap();
> > > +            let mut vec2: KVec<usize> = KVec::with_capacity(c.len(), GFP_KERNEL).unwrap();
> > > +
> > > +            for i in 0..c.len() {
> > > +                vec1.push_within_capacity(i).unwrap();
> > > +                if c[i] {
> > > +                    vec2.push_within_capacity(i).unwrap();
> > > +                }
> > > +            }
> > > +
> > > +            vec1.retain(|i| c[*i]);
> > > +
> > > +            assert_eq!(vec1, vec2);
> >
> > Don't we have macros around kunit_assert!() and kunit_assert_eq() outside of
> > doctests (i.e. dedicated kunit tests)?
> >
> > I much prefer their output over the kernel panic we get with the "normal"
> > asserts, unwraps, etc.
> >
> > Consistently sticking to the same output on failure makes it easier to catch and
> > easier to setup CI environments.
> 
> The documentation for those macros says "Public but hidden since it
> should only be used from generated tests." so I don't think I'm supposed
> to use them.

Same here, that's more a fundamental question, rather than something for you to
change right away.

I really like the way doctests implement the assert macros and how they appear
in the kernel log compared to panics through the "real" assert ones, unwraps,
etc.

I also think that avoiding things that directly panic in doctests (i.e. example
code) is the correct thing to do. For KUnit tests it's probably less important,
since they don't directly serve as sample code.

So, I wonder what's our take on that. Do we want to have KUnit and doctests
aligned? I think that'd be a good thing.
