Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C512820DD;
	Wed, 23 Apr 2025 15:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745423014; cv=none; b=l3xY14g4Evridt99djAhKuSQOZ2Od3LQNgIkjpVoyq46Kyh3OgfPx/hXLm9XfmqJ83rIw/RDUWdNdeceRsxQ+HPEoQp+8BgH0JfVWjsVwTUVtnLPqSwDufhcUb1SBcGLtnKPLUUSi/W7QSWv4rFVr93QCoz0aHFbEIL2T4GuX3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745423014; c=relaxed/simple;
	bh=2EiYsZO5JurbiCtP0lYeBVhCy3DTlgvwIW03EDd4pEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aKyCT0uTLrksOdDoqUIpieIvrYOrmKnuJo80n+TU1bKoZT58lU7yHiEVaBNHmCyYULIEnYC140d/uDwNe3ZEYKh5asA+Lvwvtwe+6zF1c4c9p5uptVjANOie2CnuoMJbnRmo/ikr9BNgsl4YVzZPFMe5irM2GmvEQt9PoQ9uubY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SlW66x2a; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SlW66x2a"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2279915e06eso69050545ad.1;
        Wed, 23 Apr 2025 08:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745423012; x=1746027812; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nac7ovSx3F2FbF0D/GtkGpJ1LcH8hYiIpIIN54hfpy4=;
        b=SlW66x2ar5BWsV2QqU4O+hEq6M9mWPn7YQBOny6Ng2JfKbCTNUkkPHOjwWLy1SZJjS
         aWcA9cCAiWRbj0Zbtv9rc15Lf3uKeKCQW24g5xg7MvpftD5FIz+4eWVrjyZyUoXS9Qcp
         Y/IUuAQ0l44XK3v8goI6EXEtk7xiJHrsN1tZI+ui+6pJIV6V1pAEOFlfZ6kC/siOl6T7
         nEv49iFAj9/to94j/KgZkm5UUt0gc0XbkEmsTwnZlBs1hkwXTV21+jxe+3DeNlcuGMH6
         jBX7Bm5aoo87uRnZ5s8zr3vfVQUWhRLsFr46HiHRqrhq1TMaeT6noIcUQhUtOl7Yh4Dd
         0szw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745423012; x=1746027812;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nac7ovSx3F2FbF0D/GtkGpJ1LcH8hYiIpIIN54hfpy4=;
        b=BPD3mCBmi1OBssguIAgXYAlyzBMraBeRIeU7y5H+dLsW7vl0UECW6YaJ7ga79hmG+b
         zYMiL36HPz5oI8NSWQ8IHlWpSEX+Hx8EZX0oKHKKLGmeHfXHXNTsG2G/bSF9oAcwdAZA
         N52qGzBKi+UD1hu+5EbRf+eo0Kb2oWZJv/4F5p8m6TGUuUSYS2WM2Hbnlkv+/2FjONRT
         snd2X7HBBOMa7s6J4YyfHecwm7INabECsUXcyX3hATU63/sW34Cx5fs01BqmXGPQMj1M
         5UXeov1k3LzV70wmKU/VuuHqf6lhGa7kTODSZ7WCf59AU8AoIPku3LnHXMRx6K1ViKlr
         W7ww==
X-Forwarded-Encrypted: i=1; AJvYcCVy4OFQbk9Oq4Xu1G6UBXzAoFmLEeEvvyFixI2ReB2tK0j5HyvPVZ59dNs4nnZDIRlXZGTvSVYeAUQDBCs=@vger.kernel.org, AJvYcCW4qDLtvCBCYMSpg3sOFx1Px4xE6tZAsMXq4OTTExDB1m3pUZAxVRxxfjG8yw9aAlt5P//H1Ee8pmG2FdT3J9Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAsr0cMeL08g1brEnum7FqxImKxB2ZIP1bof8aBnhjc90zNQWj
	ms0BZt2OJ9v7+qPL9yX84YHb54But6ih18gDLLSzVT3NtlZp5K3D
X-Gm-Gg: ASbGncuALMo+hxLkaOR1c/Z8XNLMAd4rzVm9hE2QIo16CbjMAhMfCUDDt/ScxSj7j2v
	qAZtViPtxuXPVelntz+TJlORddt1Uq6vcKLBvp3vLgaCcu7QhVuz6Vb5ktEJSknTCfvO7JWtNUm
	OG+u2es6SmIuEjdR6qJTHPteWHyOWGUVxFQHyc0Zw64mC+yahxIizPTobUuvE0RjQVINbBbDJUV
	Es02vD0OXsZ70PD3D8UTMw+EXUcp03JtIPdTgJdccdACc/+QiBs3fIGOrBqqMqZQz6Ey9jVwOfA
	lNghmakGJWF7pcY3FqX3RsmsY8Utu9Af4QI5LyXsUHddxyP+dAo=
X-Google-Smtp-Source: AGHT+IH3O6/YDL4ITehbK+Djr+L9sO+cAgRqQbY4Z3lzhRkNcfoRNIx+/sjWWUKnwol3wuQtpPYAlA==
X-Received: by 2002:a17:902:f611:b0:220:d909:1734 with SMTP id d9443c01a7336-22c5359c1fdmr288057675ad.14.1745423012233;
        Wed, 23 Apr 2025 08:43:32 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb48ebsm105441615ad.122.2025.04.23.08.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 08:43:31 -0700 (PDT)
Date: Wed, 23 Apr 2025 11:43:29 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Burak Emir <bqe@google.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/5] rust: adds Bitmap API, ID pool and bindings
Message-ID: <aAkKoQQH0t9KtIxD@yury>
References: <20250423134344.3888205-2-bqe@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423134344.3888205-2-bqe@google.com>

I received it twice - with timestamps 1:36 and 1:43. Assuming they are
identical, and ignoring the former.

On Wed, Apr 23, 2025 at 01:43:32PM +0000, Burak Emir wrote:
> This series adds a Rust bitmap API for porting the approach from
> commit 15d9da3f818c ("binder: use bitmap for faster descriptor lookup")
> to Rust. The functionality in dbitmap.h makes use of bitmap and bitops.
> 
> The Rust bitmap API provides a safe abstraction to underlying bitmap
> and bitops operations. For now, only includes method necessary for
> dbitmap.h, more can be added later. We perform bounds checks for
> hardening, violations are programmer errors that result in panics.
> 
> We include set_bit_atomic and clear_bit_atomic operations. One has
> to avoid races with non-atomic operations, which is ensure by the
> Rust type system: either callers have shared references &bitmap in
> which case the mutations are atomic operations. Or there is a
> exclusive reference &mut bitmap, in which case there is no concurrent
> access.

It's not about shared references only. One can take a mutable
reference, and still may have a race:

CPU1                            CPU2

take mut ref
bitmap.set() // non-atomic
put mut ref     
                                take mut ref
                                bitmap.test() // read as 0
data propagated to memory       
                                bitmap.test() // read as 1

To make this scenario impossible, either put or take mut ref
should imply global cache flush, because bitmap array is not
an internal data for the Bitmap class (only the pointer is).

I already asked you to point me to the specification that states that
taking mutable reference implies flushing all the caches to the point
of coherency, but you didn't share it. And I doubt that compiler does
it, for the performance considerations.

Thanks,
Yury

> This version includes an optimization to represent the bitmap inline,
> as suggested by Yury.
> 
> We introduce a Rust API that would replace (dbitmap.h) in file id_pool.rs. 
> This data structure is tightly coupled to the bitmap API. Includes an example of usage
> that requires releasing a spinlock, as expected in Binder driver.
> 
> This is v7 of a patch introducing Rust bitmap API [v6]. Thanks
> for all the helpful comments, this series has improved significantly
> as a result of your work.
> 
> Changes v6 --> v7:
> - Added separate unit tests in bitmap.rs and benchmark module,
>   following the example in find_bit_benchmark.c
> - Added discussion about using vendored bitset to commit message.
> - Refined warning about naming convention
> 
> Changes v5 --> v6:
> - Added SAFETY comment for atomic operations.
> - Added missing volatile to bitops set_bit and clear_bit bindings.
> - Fixed condition on `nbits` to be <= i32::MAX, update SAFETY comments.
> - Readability improvements.
> - Updated doc comments wording and indentation.
> 
> Changes v4 --> v5: (suggested by Yury and Alice)
> - rebased on next-20250318
> - split MAINTAINERS changes
> - no dependencies on [1] and [2] anymore - Viresh,
>   please do add a separate section if you want to maintain cpumask.rs
>   separately.
> - imports atomic and non-atomic variants, introduces a naming convention
>   set_bit and set_bit_atomic on the Rust side.
> - changed naming and comments. Keeping `new`.
> - change dynamic_id_pool to id_pool
> - represent bitmap inline when possible
> - add some more tests
> - add myself to M: line for the Rust abstractions
> 
> Changes v3 --> v4:
> - Rebased on Viresh's v3 [2].
> - split into multiple patches, separate Rust and bindings. (Yury)
> - adds dynamic_id_pool.rs to show the Binder use case. (Yury)
> - include example usage that requires release of spinlock (Alice)
> - changed bounds checks to `assert!`, shorter (Yury)
> - fix param names in binding helpers. (Miguel)
> - proper rustdoc formatting, and use examples as kunit tests. (Miguel)
> - reduce number of Bitmap methods, and simplify API through
>   use Option<usize> to handle the "not found" case.
> - make Bitmap pointer accessors private, so Rust Bitmap API
>   provides an actual abstraction boundary (Tamir)
> - we still return `AllocError` in `Bitmap::new` in case client code
>   asks for a size that is too large. Intentionally
>   different from other bounds checks because it is not about
>   access but allocation, and we expect that client code need
>   never handle AllocError and nbits > u32::MAX situations
>   differently.
> 
> Changes v2 --> v3:
> - change `bitmap_copy` to `copy_from_bitmap_and_extend` which
>   zeroes out extra bits. This enables dbitmap shrink and grow use
>   cases while offering a consistent and understandable Rust API for
>   other uses (Alice)
> 
> Changes v1 --> v2:
> - Rebased on Yury's v2 [1] and Viresh's v3 [2] changes related to
>   bitmap.
> - Removed import of `bindings::*`, keeping only prefix (Miguel)
> - Renamed panic methods to make more explicit (Miguel)
> - use markdown in doc comments and added example/kunit test (Miguel)
> - Added maintainer section for BITOPS API BINDINGS [RUST] (Yury)
> - Added M: entry for bitmap.rs which goes to Alice (Viresh, Alice)
> - Changed calls from find_* to _find_*, removed helpers (Yury)
> - Use non-atomic __set_bit and __clear_bit from Bitmap Rust API (Yury)
> 
> Link [1] https://lore.kernel.org/all/20250224233938.3158-1-yury.norov@gmail.com/
> Link [2] https://lore.kernel.org/rust-for-linux/cover.1742296835.git.viresh.kumar@linaro.org/
> Link [v6] https://lore.kernel.org/rust-for-linux/20250327161617.117748-1-bqe@google.com/ 
> 
> Burak Emir (5):
>   rust: add bindings for bitmap.h
>   rust: add bindings for bitops.h
>   rust: add bitmap API.
>   rust: add find_bit_benchmark_rust module.
>   rust: add dynamic ID pool abstraction for bitmap
> 
>  MAINTAINERS                     |  15 ++
>  lib/Kconfig.debug               |  15 +-
>  lib/Makefile                    |   1 +
>  lib/find_bit_benchmark_rust.rs  | 102 ++++++++
>  rust/bindings/bindings_helper.h |   2 +
>  rust/helpers/bitmap.c           |   9 +
>  rust/helpers/bitops.c           |  23 ++
>  rust/helpers/helpers.c          |   2 +
>  rust/kernel/bitmap.rs           | 410 ++++++++++++++++++++++++++++++++
>  rust/kernel/id_pool.rs          | 201 ++++++++++++++++
>  rust/kernel/lib.rs              |   2 +
>  11 files changed, 781 insertions(+), 1 deletion(-)
>  create mode 100644 lib/find_bit_benchmark_rust.rs
>  create mode 100644 rust/helpers/bitmap.c
>  create mode 100644 rust/helpers/bitops.c
>  create mode 100644 rust/kernel/bitmap.rs
>  create mode 100644 rust/kernel/id_pool.rs
> 
> -- 
> 2.49.0.805.g082f7c87e0-goog
