Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A4226C384;
	Thu, 12 Jun 2025 15:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749740856; cv=none; b=GRYB+ntnilkCgBM8Zqjjgu5QRJqasvJDq1EoxYxoxQjXIVXWAMnQHGrvwKWtYJ3RBEhf8XNxqVngniatbb6t3pn+48oScls/mU9gdrhikBglyVPFnAkPpHxJoanipZ+T/+kNjU2xd8BWvjDSdjFIlU9ppPfJELbZMVASS9cJdaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749740856; c=relaxed/simple;
	bh=BVuC3mymEtzbIUWUMz53Sp+ev75716vh8tVokNmdTBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BARcZRa5zYBSKvYJeuLgUDWd74Hvy3ohtTWXLO5My7g6ZwFgm/fYp4cIW+uSQQW6IFFxZgsoJRsbiwF2NPnf5VgegmiqD8xIx2LMpfGTxSlek4l6E81uBMWobAoXGD8Evyy12pG2ne1dxFH9SxfR82RbSmriE/YHWqcQZvi7IXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AVJxt+6r; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AVJxt+6r"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7d098f7bd77so116898285a.0;
        Thu, 12 Jun 2025 08:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749740850; x=1750345650; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ak1LLtwfOBZwskRiUyNHNLlsyugdrztZNAWM/dn6MRU=;
        b=AVJxt+6rZw1Ep6SFLAOVAlbWi9KOSCELSaYpHYM/h0QENjU7BUOsxcjU5e8YpVEQ8P
         mXFUSo4m+fzXC31VUVBQPGfLV65tq0mSP2wcx6vH7PsaNyHa81ks3qIchlYZjCTcdHfu
         eKYNHLqbT6Kvyn1bEo3il2bq4bOfLFvwIohhTfBU/WAVP563NhEa/9j2e06fmykWKGPM
         zcXTrW2cvJbJ1SmJI8Tzq8dqYeAKWJeM/4XuKRGc+vwrEWTdogkIkfNIA5JOrF82UM95
         JN/JB70vfQQLQn2IJLI2nE3y5xtTezFOYvZTO2f3BQji8ESpWFMwYEJ1RJjhptW+d0A8
         ds7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749740850; x=1750345650;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ak1LLtwfOBZwskRiUyNHNLlsyugdrztZNAWM/dn6MRU=;
        b=FvH/B5zUdQDac9WE9S7+dpopuOefiZPhQ1h8k7k1q8ygRopPFqbhWu/J+q/skiM6qm
         MdQkTun24wRX8h1HJ17j9yAYGVPvULUdzsTxLRwiX8btUcnlu1IEvKhdZW4mu6Tluc4y
         I6V/EJCPUEoUoSA+oRkTTDWGq6xKKhgGcgY7fEx2vgMJ3pu1cGfZfqaUuZlIr3pSncRQ
         yV7Qb6BjGZDccBy7F4zdMnGYXYBZIbJLgxbx+ZFBVb4E2+31/+c5Z3vsBJSszUaiKZrb
         PzumfKFGdQhQ3VCG+w/ToO/xHFlmtd51VESjRTQS3f7MWXYCIffR7gl8mzqPTNypvyXF
         CzHA==
X-Forwarded-Encrypted: i=1; AJvYcCUBvLPlBWKf/DLNrvW5gqbowwYMOzfQ1WcgnezJjdaCsbfNvW1f0ZibJgMR83NGnyjJxgVnyRFb7TUlK5EGPPw=@vger.kernel.org, AJvYcCXSy4vN+pVKwr+S4+JD/bE7KLrewF2d/blCf4nxERHm2eJWD6O7hwKCsuNFsNTgleEZhiQaW5Ouf9nrV3k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6yY+9X1If5I0QmTkxMXOqV6V5e5yrluC7vop8+0kLgkMkw4L9
	z8VWraKqWnykQGtcz+dz2CEfalHCHMq/qpoc3XM0vAXcSS28HqRGIC5Vix4Azw==
X-Gm-Gg: ASbGncsD33DafiajOFJ9ircuoGPg5TuopsjEvZwLUvSUI7dfH+lXACnLKrgC7KDR0D8
	f/MtCmasR+EEXXgsBhdoCwVUcAFPgfech/dVQCh0Y36GXQWsmEGG9Kew69DcCr5lBoC4LHx6KYN
	yyw2p8wZz5aPN5UzL9DtzyAc7PrUwdgc4dVJQZIcZLcyLGH216aFqy+/vI7zp+HSYl3TdvV6S+1
	bXdY5RZ/2rRWd/3bfJhfjXKQCLQEMncpVsmPZ/edXUL2GFOXnypaF3B79gS4oK4AEfSyhhWIIRr
	BVPYAakX1g/tIoB9l7MsWvC+XwJGYM/PgXQmMrwBonQ0PlyvbDbS6+R0Qqssp7Ax1l3z613TyCV
	NOetDUz1fuJHv7fwORo6ZhSbrEVJzfB33XxUW1LLLYd6OPL1bqxpH
X-Google-Smtp-Source: AGHT+IEWKSZx6VTctdm5flg6YAMB36hqq32ZNEDxmUm3MgkF6Ea8BVoTaEKdXSFIYzRhM3toOK+vxg==
X-Received: by 2002:a05:620a:9518:b0:7d2:26b4:9a91 with SMTP id af79cd13be357-7d3b2d767demr440353885a.2.1749740850284;
        Thu, 12 Jun 2025 08:07:30 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8eaccc4sm50231485a.74.2025.06.12.08.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 08:07:29 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 181D01200068;
	Thu, 12 Jun 2025 11:07:29 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Thu, 12 Jun 2025 11:07:29 -0400
X-ME-Sender: <xms:MO1KaDgHMEhzVqJlxjRbGTXEXxba_2qIWf9aziNlqYslBuHKbBIICQ>
    <xme:MO1KaAB_hWLwQ_KumJ9goIyJTHl87nDGHJeoV1QZvQQbv-hbn9Cjd73UXTi7KVseK
    j8DwPJNENniuMWQgQ>
X-ME-Received: <xmr:MO1KaDFrUe4Ns8hrcz79ANJs6xQ4RjzbYopnsXhnYAPv_Iqbn3chdQh1LIM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduheefkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhephedugfduffffteeutddvheeuveelvdfhleel
    ieevtdeguefhgeeuveeiudffiedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghl
    ihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepgh
    hmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedvhedpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtoheprggtohhurhgsohhtsehnvhhiughirgdrtg
    homhdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegr
    lhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepghgrrhihsehgrg
    hrhihguhhordhnvghtpdhrtghpthhtohepsghjohhrnhefpghghhesphhrohhtohhnmhgr
    ihhlrdgtohhmpdhrtghpthhtoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthho
    pehtmhhgrhhoshhssehumhhitghhrdgvughupdhrtghpthhtohepuggrkhhrsehkvghrnh
    gvlhdrohhrgh
X-ME-Proxy: <xmx:Me1KaAQWCDPz59Di9vz5U0N7B10kWFcUgfBUHSaSuaYRWrDPAGDxhg>
    <xmx:Me1KaAy8LP5ECCWuA5HrBXqqBuQqGMr4JwYSc-CpMHn3FCregyUwBA>
    <xmx:Me1KaG519a0LAZhG7fNKhrZEThmGhIkE5KsbPgZMF2oy0NiZe-j-Gg>
    <xmx:Me1KaFxlCbEIwqzjbg901zjDvebFIzJjneViKSvTbXkr3wyENdQ0tw>
    <xmx:Me1KaAidkRMYTHUUSt0MLjkxQgk755O_1_iwQspLEApSUd7t61Y08YXn>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Jun 2025 11:07:28 -0400 (EDT)
Date: Thu, 12 Jun 2025 08:07:27 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Benno Lossin <lossin@kernel.org>,
	John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 04/23] rust: add new `num` module with `PowerOfTwo`
 type
Message-ID: <aErtL6yxLu3Azbsm@tardis.local>
References: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
 <20250612-nova-frts-v5-4-14ba7eaf166b@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612-nova-frts-v5-4-14ba7eaf166b@nvidia.com>

On Thu, Jun 12, 2025 at 11:01:32PM +0900, Alexandre Courbot wrote:
> Introduce the `num` module, featuring the `PowerOfTwo` unsigned wrapper
> that guarantees (at build-time or runtime) that a value is a power of
> two.
> 
> Such a property is often useful to maintain. In the context of the
> kernel, powers of two are often used to align addresses or sizes up and
> down, or to create masks. These operations are provided by this type.
> 
> It is introduced to be first used by the nova-core driver.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  rust/kernel/lib.rs |   1 +
>  rust/kernel/num.rs | 173 +++++++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 174 insertions(+)
> 
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 6b4774b2b1c37f4da1866e993be6230bc6715841..2955f65da1278dd4cba1e4272ff178b8211a892c 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -89,6 +89,7 @@
>  pub mod mm;
>  #[cfg(CONFIG_NET)]
>  pub mod net;
> +pub mod num;
>  pub mod of;
>  #[cfg(CONFIG_PM_OPP)]
>  pub mod opp;
> diff --git a/rust/kernel/num.rs b/rust/kernel/num.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..ee0f67ad1a89e69f5f8d2077eba5541b472e7d8a
> --- /dev/null
> +++ b/rust/kernel/num.rs
> @@ -0,0 +1,173 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Numerical and binary utilities for primitive types.
> +
> +use crate::build_assert;
> +use core::borrow::Borrow;
> +use core::fmt::Debug;
> +use core::hash::Hash;
> +use core::ops::Deref;
> +
> +/// An unsigned integer which is guaranteed to be a power of 2.
> +#[derive(Debug, Clone, Copy)]
> +#[repr(transparent)]
> +pub struct PowerOfTwo<T>(T);
> +
> +macro_rules! power_of_two_impl {
> +    ($($t:ty),+) => {
> +        $(
> +            impl PowerOfTwo<$t> {
> +                /// Validates that `v` is a power of two at build-time, and returns it wrapped into
> +                /// `PowerOfTwo`.
> +                ///
> +                /// A build error is triggered if `v` cannot be asserted to be a power of two.
> +                ///
> +                /// # Examples
> +                ///
> +                /// ```
> +                /// use kernel::num::PowerOfTwo;
> +                ///
> +                /// let v = PowerOfTwo::<u32>::new(256);
> +                /// assert_eq!(v.value(), 256);
> +                /// ```
> +                #[inline(always)]
> +                pub const fn new(v: $t) -> Self {

Then this function should be unsafe, because an invalid `v` can create
an invalid PowerOfTwo.

> +                    build_assert!(v.count_ones() == 1);
> +                    Self(v)
> +                }
> +
> +                /// Validates that `v` is a power of two at runtime, and returns it wrapped into
> +                /// `PowerOfTwo`.
> +                ///
> +                /// `None` is returned if `v` was not a power of two.
> +                ///
> +                /// # Examples
> +                ///
> +                /// ```
> +                /// use kernel::num::PowerOfTwo;
> +                ///
> +                /// assert_eq!(PowerOfTwo::<u32>::try_new(16).unwrap().value(), 16);
> +                /// assert_eq!(PowerOfTwo::<u32>::try_new(15), None);
> +                /// ```
> +                #[inline(always)]
> +                pub const fn try_new(v: $t) -> Option<Self> {
> +                    match v.count_ones() {
> +                        1 => Some(Self(v)),
> +                        _ => None,
> +                    }
> +                }
> +
> +                /// Returns the value of this instance.
> +                ///
> +                /// It is guaranteed to be a power of two.
> +                ///
> +                /// # Examples
> +                ///
> +                /// ```
> +                /// use kernel::num::PowerOfTwo;
> +                ///
> +                /// let v = PowerOfTwo::<u32>::new(256);
> +                /// assert_eq!(v.value(), 256);
> +                /// ```
> +                #[inline(always)]
> +                pub const fn value(&self) -> $t {
> +                    self.0
> +                }
> +
> +                /// Returns the mask corresponding to `self.value() - 1`.
> +                #[inline(always)]
> +                pub const fn mask(&self) -> $t {
> +                    self.0.wrapping_sub(1)
> +                }
> +
> +                /// Aligns `self` down to `alignment`.
> +                ///
> +                /// # Examples
> +                ///
> +                /// ```
> +                /// use kernel::num::PowerOfTwo;
> +                ///
> +                /// assert_eq!(PowerOfTwo::<u32>::new(0x1000).align_down(0x4fff), 0x4000);
> +                /// ```
> +                #[inline(always)]
> +                pub const fn align_down(self, value: $t) -> $t {

I'm late to party, but could we instead implement:

    pub const fn round_down<i32>(value: i32, shift: i32) -> i32 {
        value & !((1 << shift) - 1)
    }

    pub const fn round_up<i32>(value: i32, shift: i32) -> i32 {
        let mask = (1 << shift) - 1;
        value.wrapping_add(mask) & !mask
    }

? It's much harder to pass an invalid alignment with this.

Regards,
Boqun

> +                    value & !self.mask()
> +                }
> +
> +                /// Aligns `value` up to `self`.
> +                ///
> +                /// Wraps around to `0` if the requested alignment pushes the result above the
> +                /// type's limits.
> +                ///
> +                /// # Examples
> +                ///
> +                /// ```
> +                /// use kernel::num::PowerOfTwo;
> +                ///
> +                /// assert_eq!(PowerOfTwo::<u32>::new(0x1000).align_up(0x4fff), 0x5000);
> +                /// assert_eq!(PowerOfTwo::<u32>::new(0x1000).align_up(0x4000), 0x4000);
> +                /// assert_eq!(PowerOfTwo::<u32>::new(0x1000).align_up(0x0), 0x0);
> +                /// assert_eq!(PowerOfTwo::<u16>::new(0x100).align_up(0xffff), 0x0);
> +                /// ```
> +                #[inline(always)]
> +                pub const fn align_up(self, value: $t) -> $t {
> +                    self.align_down(value.wrapping_add(self.mask()))
> +                }
> +            }
> +        )+
> +    };
> +}
> +
> +power_of_two_impl!(usize, u8, u16, u32, u64, u128);
> +
> +impl<T> Deref for PowerOfTwo<T> {
> +    type Target = T;
> +
> +    fn deref(&self) -> &Self::Target {
> +        &self.0
> +    }
> +}
> +
> +impl<T> PartialEq for PowerOfTwo<T>
> +where
> +    T: PartialEq,
> +{
> +    fn eq(&self, other: &Self) -> bool {
> +        self.0 == other.0
> +    }
> +}
> +
> +impl<T> Eq for PowerOfTwo<T> where T: Eq {}
> +
> +impl<T> PartialOrd for PowerOfTwo<T>
> +where
> +    T: PartialOrd,
> +{
> +    fn partial_cmp(&self, other: &Self) -> Option<core::cmp::Ordering> {
> +        self.0.partial_cmp(&other.0)
> +    }
> +}
> +
> +impl<T> Ord for PowerOfTwo<T>
> +where
> +    T: Ord,
> +{
> +    fn cmp(&self, other: &Self) -> core::cmp::Ordering {
> +        self.0.cmp(&other.0)
> +    }
> +}
> +
> +impl<T> Hash for PowerOfTwo<T>
> +where
> +    T: Hash,
> +{
> +    fn hash<H: core::hash::Hasher>(&self, state: &mut H) {
> +        self.0.hash(state);
> +    }
> +}
> +
> +impl<T> Borrow<T> for PowerOfTwo<T> {
> +    fn borrow(&self) -> &T {
> +        &self.0
> +    }
> +}
> 
> -- 
> 2.49.0
> 
