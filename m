Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F1222EE5;
	Sat,  5 Apr 2025 19:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743882274; cv=none; b=XSij+olu3lHVsVnNUJNbsP27RX8f+g2fViUHN3v9Kpv9xofxJg3DDyxnVcYCWD8LnVXfpMcMxt69R2+fLyD07OqaFJt0en/6PMxLINFJOTSRcTuLInRr7wujFhk+02QMQQp1vozLvWlc3K9u5nNClMNFIIjjZYmVwRzJKM0QzKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743882274; c=relaxed/simple;
	bh=bzP3k5AacEGTx5WxdA78qc51Qn7ADrLkcq/tTD05EFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pn++0RrDZI6+JfwWIkmDasMZzCAhpoIbWSpRMM0QHzhRCDRuflRKF5EKwVw6QXYKaDmboxkmCBWtPHcphJ4rXfnPxyRMVibv+FYgGf895Wbjcuf8GoShZbvOZ/s1xr76Fa+/cEVtV3kV0ECX4Ileq5dzr7VDUWU7voYHcrP6CwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DnE5uPWG; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DnE5uPWG"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6e8f254b875so31473066d6.1;
        Sat, 05 Apr 2025 12:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743882271; x=1744487071; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rx5zILChtOMmy0WZ58xwLPc6ZOa7iYCxHlVSkPvgXD8=;
        b=DnE5uPWGrAoHnMfyD2CgffVuPoTZ49o5DmyNTbSAiEWh/6YxWQfaQ8ZOhi1+00RKcj
         Ig1saWtRpp66j4Nij+y8gjDQ5mJKRshdMNL+NyC5071/OmnmNc5ez9Paydl8c0J2oacy
         4jkXu1cDYDYrXWIvCojCsQ/b+CR17ObU3dzOzMPmoFHQD12VskuxW0IS9nOIfwy9zXAY
         61S3wmNEfcHk5ANh++9GP/m73C/4IINF0Q6m01CpN+CRKdIC8KpEPVswCsyjLCJdOIek
         zezWO2fOCXCoazXRcYNxvj7kGAePGBQKxZvqQaf3piW6jcjqMSeA9ul8Le+BFFrda05d
         3OUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743882271; x=1744487071;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rx5zILChtOMmy0WZ58xwLPc6ZOa7iYCxHlVSkPvgXD8=;
        b=aJ/SUUh89W237hR+jZCFRI5sXKAl5pur9kWw2BgYwFTBjVpMIW8IZ6+eUYge6HMhdd
         arSecj5gwGLhvkiB+2H07N+tPuxYNFM5DCcRNGme3/6QO3GRL0b5lpOfhv0dDkW+Y7ej
         7s3DG/YGOdlpTZcxXAb/w5ZDyPNBA/Rly+IceHAHG+yp05UBNcE9n97Mmx7+1ZZmijit
         1oHLhAWhiJU2xn6R4oLYdHp35eJpzDfKWRz+Mi9paZouQnuL/zYd1JOuRzwHtJEzcO4e
         Rt8jEijPLh9VHbyeDpgYt1l73ewfAlKDdNtRovbV1G81YdV99e+CklZklywx5QKynksp
         BgwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUV6jAJgtTamweJD0hTOWBziYNzNEJHVIqvadP7dFbqd7F6TBeuVEGhsqwcmewPBZIleGH7lba9dntgA1U=@vger.kernel.org, AJvYcCW3VjdxfTRYxttNCy5XnzaUq3wQDnu2wzbQJtbwozdCX4A/ik6ymym3SC87HDlIS87+Rd+13od+NunqP+sx9aQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwF7YbQHuIHpCH15lR27244s59BRBIjcVaUEeUFwf32ND01Fphk
	IAjagVOS7YZXa1M5fzUfVREel3VVKH5cW44Z3m0FHgForrVzHbBV
X-Gm-Gg: ASbGncunSncbUT0QIWUICqBg7olIDkxrKFchG7h45WWWPh9esuVb5TjlQorNKLStJX6
	+NL7WPzYdWezUz1tdbOCqJGyhhLBwEJL3DBhDVdF7cDDv5EAqlOXxjR7A4Z2phychJ8Qe0Mx3hf
	0yik3nvEWRBO3q+FKooxEasAKZCj/76S+QHMmmX+FBRxt32b+bgLCh1Nwh8pCbhm1z6V8ZUI2d9
	RQXNtdSq9zCDizWYkU/pfwptMQCyq4TCGTPIyN7hFMRLnLvf65ZhVTaPPHf+b8dgEUu0althGB1
	NbFXDErLHQ22hrYVYGhyESxnix8qceq7TYz+RdtuhIiNnhpvkXtKsO7VnSRPtbELPBRbv9wCMPu
	Ecpu5dAx//xqTijwtMIKv3FCecVKtjkXqpxE=
X-Google-Smtp-Source: AGHT+IFaHgaHKCaTJfQp7FDfckg0vFLTdqZJduxcYBx30a6MlcEiZpu8iZYpUrx21p3k6WUugtRZ3g==
X-Received: by 2002:a05:6214:1bcc:b0:6e8:f8a8:83f2 with SMTP id 6a1803df08f44-6f0b73f3587mr57851236d6.6.1743882271354;
        Sat, 05 Apr 2025 12:44:31 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ef0f047a77sm37288226d6.53.2025.04.05.12.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 12:44:30 -0700 (PDT)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 218511200066;
	Sat,  5 Apr 2025 15:44:30 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Sat, 05 Apr 2025 15:44:30 -0400
X-ME-Sender: <xms:HojxZ6lLCOYFiPxSwM4JMtyuSrfW33yfCaz1ckJWFfi9vl5LcxxIww>
    <xme:HojxZx0pRPu7a0EV6hoNT3s_2hwoG1Kn4FSxgr49OggF2bcvxH1l8Tgjj9VLiVTfe
    CBG-PUl8ff8YaJssg>
X-ME-Received: <xmr:HojxZ4rnET0lKf5LFM3H65f1R2mfR6HxU9aGtZyNx1mCZcPWGbpOwmtsrcY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduleehvdefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpeehudfgudffffetuedtvdehueevledvhfel
    leeivedtgeeuhfegueevieduffeivdenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgr
    lhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppe
    hgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepudehpdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopegrtghouhhrsghothesnhhvihguihgrrd
    gtohhmpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopeho
    jhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgidrghgrhihnohhrse
    hgmhgrihhlrdgtohhmpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhr
    tghpthhtohepsghjohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghpth
    htohepsggvnhhnohdrlhhoshhsihhnsehprhhothhonhdrmhgvpdhrtghpthhtoheprgdr
    hhhinhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhhitggvrhihhh
    hlsehgohhoghhlvgdrtghomh
X-ME-Proxy: <xmx:HojxZ-n9wHqrghfx16bEXMsrTvHXER7coaXHY0JdgCfjU4Ks-jz7AA>
    <xmx:HojxZ402WwUjFkqAQ-U9oYKjYxRi3Br_sFpEL-YNzejsjiKQiWLs5w>
    <xmx:HojxZ1uEu0tcPUXzfyk6W7aZt0JOWqTnMX-x5RIFrzd40nO-WYsgjw>
    <xmx:HojxZ0WuQhh1_chOvcHJKzfMh-5F1cn4OqbpSN4Dye6ED_dEP3PK9w>
    <xmx:HojxZz3-QsM6yWRR_4R3vsZK4QqZ7682z4sDQjA0VAFZN5HyVljGlbb9>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 5 Apr 2025 15:44:29 -0400 (EDT)
Date: Sat, 5 Apr 2025 12:44:16 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust: alloc: implement `extend` for `Vec`
Message-ID: <Z_GIELVB_HI_qeWX@boqun-archlinux>
References: <20250405-vec_extend-v2-1-e4a85af43cb3@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250405-vec_extend-v2-1-e4a85af43cb3@nvidia.com>

Hi Alexandre,

Thanks for the patch.

On Sat, Apr 05, 2025 at 10:51:41PM +0900, Alexandre Courbot wrote:
> KVec currently has `extend_with` and `extend_from_slice` methods, but no
> way extend a vector from a regular iterator as provided by the `Extend`
> trait.
> 
> Due to the need to provide the GFP flags, `Extend` cannot be implemented
> directly, so simply define a homonymous method that takes an extra
> `flags` argument.
> 
> The aforementioned `extend_with` and `extend_from_slice` can then be
> reimplemented as direct invocations of this new method - maybe they can
> eventually be removed.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> I was a bit surprised to find no equivalent of the `Extend` trait for
> KVec, and while I anticipate to be told the reason for this, I also
> didn't hit any hard wall trying to come with my own implementation so
> here it is.
> 
> I expect the new `extend_with` and `extend_from_slice` to be optimized
> into something close to their previous implementations, but am not sure
> how I can simply verify that this is the case - any hint would be
> appreciated!
> ---
> Changes in v2:
> - Changed the diff algorithm to histogram for a more readable patch.
> ---
>  rust/kernel/alloc/kvec.rs | 89 +++++++++++++++++++++++++++++------------------
>  1 file changed, 56 insertions(+), 33 deletions(-)
> 
> diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> index ae9d072741cedbb34bed0be0c20cc75472aa53be..e78cb5ee575ce01e44283f8b4905689fb1e96165 100644
> --- a/rust/kernel/alloc/kvec.rs
> +++ b/rust/kernel/alloc/kvec.rs
> @@ -454,30 +454,64 @@ pub fn reserve(&mut self, additional: usize, flags: Flags) -> Result<(), AllocEr
>      }
>  }
>  
> +impl<T, A: Allocator> Vec<T, A> {
> +    /// Extends the vector by the elements of `iter`.
> +    ///
> +    /// This uses [`Iterator::size_hint`] to optimize reallocation of memory, but will work even
> +    /// with imprecise implementations - albeit with potentially more memory reallocations.
> +    ///
> +    /// In the kernel most iterators are expected to have a precise `size_hint` implementation, so
> +    /// this should nicely optimize out in most cases.
> +    pub fn extend<I>(&mut self, iter: I, flags: Flags) -> Result<(), AllocError>
> +    where
> +        I: IntoIterator<Item = T>,
> +    {
> +        let mut iter = iter.into_iter();
> +
> +        loop {
> +            let low_bound = match iter.size_hint() {
> +                // No more items expected, we can return.
> +                (0, Some(0)) => break,
> +                // Possibly more items but not certain, tentatively add one.
> +                (0, _) => 1,
> +                // More items pending, reserve space for the lower bound.
> +                (low_bound, _) => low_bound,
> +            };
> +
> +            self.reserve(low_bound, flags)?;
> +

I want to point out this might cause a behavior change, previously
extend_with() and extend_with_slice() do a "all-or-nothing" extension
depending on memory allocation, i.e. if there is enough memory for all
the new items, do the extension, otherwise do nothing. Your changes here
make it that extension can fail in-between due to AllocError, that is,
only part of the `iter` is added. Of course, in practice, both
slice::Iter and iter::Take will just return the number of all the items
as the low_bound of .size_hint(), but it's not guaranteed.

I don't see a direct correct-or-wrong answer for what behavior is
desired, but if we are moving to a new behavior, we need to make sure
updating the document of the extend*() function. Plus if failing
in-between, should we return the `iter` so that users can continue do
something about the `iter`?

> +            // Number of items we effectively added.
> +            let added_items = self
> +                .spare_capacity_mut()
> +                .into_iter()
> +                // Take a mutable reference to the iterator so we can reuse it in the next
> +                // iteration of the loop if needed.
> +                .zip(&mut iter)
> +                .fold(0, |count, (dst, src)| {
> +                    dst.write(src);
> +
> +                    count + 1
> +                });
> +
> +            // SAFETY:
> +            // - `self.len() + added_items <= self.capacity()` due to the call to `reserve` above,
> +            // - items `[self.len()..self.len() + added_items - 1]` are initialized.
> +            unsafe { self.set_len(self.len() + added_items) };
> +
> +            // `size_hint` was incorrect and our iterator ended before its advertized low bound.
> +            if added_items < low_bound {
> +                break;
> +            }
> +        }
> +
> +        Ok(())
> +    }
> +}
> +
>  impl<T: Clone, A: Allocator> Vec<T, A> {
>      /// Extend the vector by `n` clones of `value`.
>      pub fn extend_with(&mut self, n: usize, value: T, flags: Flags) -> Result<(), AllocError> {
> -        if n == 0 {
> -            return Ok(());
> -        }
> -
> -        self.reserve(n, flags)?;
> -
> -        let spare = self.spare_capacity_mut();
> -
> -        for item in spare.iter_mut().take(n - 1) {
> -            item.write(value.clone());
> -        }
> -
> -        // We can write the last element directly without cloning needlessly.
> -        spare[n - 1].write(value);
> -
> -        // SAFETY:
> -        // - `self.len() + n < self.capacity()` due to the call to reserve above,
> -        // - the loop and the line above initialized the next `n` elements.
> -        unsafe { self.set_len(self.len() + n) };
> -
> -        Ok(())
> +        self.extend(core::iter::repeat(value).take(n), flags)

Would this actually call T::clone() n times instead of n - 1 times?

Regards,
Boqun

>      }
>  
>      /// Pushes clones of the elements of slice into the [`Vec`] instance.
> @@ -496,18 +530,7 @@ pub fn extend_with(&mut self, n: usize, value: T, flags: Flags) -> Result<(), Al
>      /// # Ok::<(), Error>(())
>      /// ```
>      pub fn extend_from_slice(&mut self, other: &[T], flags: Flags) -> Result<(), AllocError> {
> -        self.reserve(other.len(), flags)?;
> -        for (slot, item) in core::iter::zip(self.spare_capacity_mut(), other) {
> -            slot.write(item.clone());
> -        }
> -
> -        // SAFETY:
> -        // - `other.len()` spare entries have just been initialized, so it is safe to increase
> -        //   the length by the same number.
> -        // - `self.len() + other.len() <= self.capacity()` is guaranteed by the preceding `reserve`
> -        //   call.
> -        unsafe { self.set_len(self.len() + other.len()) };
> -        Ok(())
> +        self.extend(other.into_iter().cloned(), flags)
>      }
>  
>      /// Create a new `Vec<T, A>` and extend it by `n` clones of `value`.
> 
> ---
> base-commit: a2cc6ff5ec8f91bc463fd3b0c26b61166a07eb11
> change-id: 20250405-vec_extend-4321251acc21
> 
> Best regards,
> -- 
> Alexandre Courbot <acourbot@nvidia.com>
> 
