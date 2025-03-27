Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC771CAB3
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 16:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743092190; cv=none; b=Q2cmTqS2YMAGlag9ZC23AatIXqgEjSYSG4gCs/jrFZWNZt1Y9X3rpFHrSNTApHQDVc3jGkGpclG1VPqWXr2csguUgQCou31G5C9vMNmrH1pUqh+IbmR4jtfqgktp33FPNdTXsMvfPbtkoBDmx5Uojcs6JVhB+iDF0BHdBoGc+oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743092190; c=relaxed/simple;
	bh=V7bcI4G5MsKH8Y1O7Tyzqx0wDh8UYGGHvAnojwcJMXw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Uel4GHp1n3DmTNgGMIHzB/2EIMg6cWQy4vXUbC0qYyqqz94DBsG+nhvHZhxMQD4fYlnWTKEwjik3SEd35ZpxGYtdMQ/T0y32GP1Z1ftibK3x6m9cOOkT8ycs18IlBCH+msWwhkimUl/u6d1eFjgyTDYtb2ygKcdhrDrDzENsxD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--bqe.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CCvsWvss; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--bqe.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CCvsWvss"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43d22c304adso10050555e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 09:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743092186; x=1743696986; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=V2iDouyaCXenxlx7helY0tdHEWbsKkwN26upSNZJ6m8=;
        b=CCvsWvss8TeuEunAUKKZYMH8CmCksirzMPEvqeYOEy4klcWKQtaddxDtTC6Y6Dgh4f
         knZexwnE9ivNq6mk8byr28Pug02jBesilTWH4kpoMDwqzUYlufk/2++ECL4KTsDTH3L1
         310laUOmO/3hTnFy4voQRleOGYCe6AK4JePxCZ9mfGbPpJITcNw2YjnpT5PDD6sSkvq0
         IItagacKtYJarsQbUsnQ6dE5l6YmPbHopZmJfNTlkJHV+ESKXnfmtMBEIEyPdxSdGs0N
         2HYOi15RtvJCBa5C/q6sB71l9XJisR920AzGdtfIUv4wnbbcUrV5EyHs7nm9Vi6Re4Nc
         GxKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743092186; x=1743696986;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V2iDouyaCXenxlx7helY0tdHEWbsKkwN26upSNZJ6m8=;
        b=xDnGl+r4Tr1CVexjQVzhAlCPxTtCZJWAqH/Jo1aS9/KRJxEau2H9jHQ3YdxTuRMcLz
         3m7zkB9+znKJDm3lj1O4XaFYxh3Gkl9vckX+HKvo26px3Oe6AKGpK3LuNBP/kG1CY6Mq
         do9uIagXVfbxtjPqlNpXdBZHl085CxFPd02u4oYMtfB2cgbj4M8H+laeje5xoQJHLc9J
         K54+mh+SROcQwVcb4ky0mmiLd6CwT/dDj/GVGn/B1CrMDjH8k0ov+ilEiRztKNdWayHx
         bPam9xtqD3YlhuPzZo8ymQ1C0TQ+f2m9RXOlb0OqOZWONUkOIoXzzijuWoDXBGNV75gL
         D65A==
X-Forwarded-Encrypted: i=1; AJvYcCVpHaAwYeimTmmCIQv9N9WigvvzP2XcH6fbROWPScoBWas0rPNTetl9vtwZ3BzVmasgPk/eZPlN3+yNoG0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxK1SaNhsIESJ/0MGnp1lqRWkj2/vqe36fuFZ6U6fjXesKyEbgT
	zWNDwhvq6TyIoT5g1FtLcNfbsCb8nhSB28Pqk9Zi4mKmhCqzJUGDS0uYZ8azq/5fDw==
X-Google-Smtp-Source: AGHT+IF7YMUVie25/hquW94oz8SC6Bq6PdWTZQ4wVpWpcB8dOSG25srsxCYI7dlmMk7vHETvLAdLyqk=
X-Received: from wmco17.prod.google.com ([2002:a05:600c:a311:b0:43d:1fc3:ccd5])
 (user=bqe job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:8711:b0:439:8878:5029
 with SMTP id 5b1f17b1804b1-43d8e63436cmr8632315e9.2.1743092186679; Thu, 27
 Mar 2025 09:16:26 -0700 (PDT)
Date: Thu, 27 Mar 2025 16:16:10 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
Message-ID: <20250327161617.117748-1-bqe@google.com>
Subject: [PATCH v6 0/4] rust: adds Bitmap API, ID pool and bindings
From: Burak Emir <bqe@google.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Burak Emir <bqe@google.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This series adds a Rust bitmap API for porting the approach from
commit 15d9da3f818c ("binder: use bitmap for faster descriptor lookup")
to Rust. The functionality in dbitmap.h makes use of bitmap and bitops.

The Rust bitmap API provides a safe abstraction to underlying bitmap
and bitops operations. For now, only includes method necessary for
dbitmap.h, more can be added later. We perform bounds checks for
hardening, violations are programmer errors that result in panics.

We include set_bit_atomic and clear_bit_atomic operations. One has
to avoid races with non-atomic operations, which is ensure by the
Rust type system: either callers have shared references &bitmap in
which case the mutations are atomic operations. Or there is a
exclusive reference &mut bitmap, in which case there is no concurrent
access.

This version includes an optimization to represent the bitmap inline,
as suggested by Yury.

We introduce a Rust API that would replace (dbitmap.h) in file id_pool.rs. 
This data structure is tightly coupled to the bitmap API. Includes an example of usage
that requires releasing a spinlock, as expected in Binder driver.

This is v6 of a patch introducing Rust bitmap API [v5]. Thanks
for all the helpful comments, this series has improved significantly
as a result of your work.

Not adding separate unit tests: the Rust unit test infrastructure
is very new, and there does not seem to be benchmarking support
for Rust tests yet. Are the # Examples tests enough?
Alternatively, can we add more test cases to those until 
the unit test infrastructure is in place?

Changes v5 --> v6:
- Added SAFETY comment for atomic operations.
- Added missing volatile to bitops set_bit and clear_bit bindings.
- Fixed condition on `nbits` to be <= i32::MAX, update SAFETY comments.
- Readability improvements.
- Updated doc comments wording and indentation.

Changes v4 --> v5: (suggested by Yury and Alice)
- rebased on next-20250318
- split MAINTAINERS changes
- no dependencies on [1] and [2] anymore - Viresh,
  please do add a separate section if you want to maintain cpumask.rs
  separately.
- imports atomic and non-atomic variants, introduces a naming convention
  set_bit and set_bit_atomic on the Rust side.
- changed naming and comments. Keeping `new`.
- change dynamic_id_pool to id_pool
- represent bitmap inline when possible
- add some more tests
- add myself to M: line for the Rust abstractions

Changes v3 --> v4:
- Rebased on Viresh's v3 [2].
- split into multiple patches, separate Rust and bindings. (Yury)
- adds dynamic_id_pool.rs to show the Binder use case. (Yury)
- include example usage that requires release of spinlock (Alice)
- changed bounds checks to `assert!`, shorter (Yury)
- fix param names in binding helpers. (Miguel)
- proper rustdoc formatting, and use examples as kunit tests. (Miguel)
- reduce number of Bitmap methods, and simplify API through
  use Option<usize> to handle the "not found" case.
- make Bitmap pointer accessors private, so Rust Bitmap API
  provides an actual abstraction boundary (Tamir)
- we still return `AllocError` in `Bitmap::new` in case client code
  asks for a size that is too large. Intentionally
  different from other bounds checks because it is not about
  access but allocation, and we expect that client code need
  never handle AllocError and nbits > u32::MAX situations
  differently.

Changes v2 --> v3:
- change `bitmap_copy` to `copy_from_bitmap_and_extend` which
  zeroes out extra bits. This enables dbitmap shrink and grow use
  cases while offering a consistent and understandable Rust API for
  other uses (Alice)

Changes v1 --> v2:
- Rebased on Yury's v2 [1] and Viresh's v3 [2] changes related to
  bitmap.
- Removed import of `bindings::*`, keeping only prefix (Miguel)
- Renamed panic methods to make more explicit (Miguel)
- use markdown in doc comments and added example/kunit test (Miguel)
- Added maintainer section for BITOPS API BINDINGS [RUST] (Yury)
- Added M: entry for bitmap.rs which goes to Alice (Viresh, Alice)
- Changed calls from find_* to _find_*, removed helpers (Yury)
- Use non-atomic __set_bit and __clear_bit from Bitmap Rust API (Yury)

Link [1] https://lore.kernel.org/all/20250224233938.3158-1-yury.norov@gmail.com/
Link [2] https://lore.kernel.org/rust-for-linux/cover.1742296835.git.viresh.kumar@linaro.org/
Link [v5]: https://lore.kernel.org/lkml/20250321111535.3740332-1-bqe@google.com/


Burak Emir (4):
  rust: add bindings for bitmap.h
  rust: add bindings for bitops.h
  rust: add bitmap API.
  rust: add dynamic ID pool abstraction for bitmap

 MAINTAINERS                     |  14 ++
 rust/bindings/bindings_helper.h |   1 +
 rust/helpers/bitmap.c           |   9 +
 rust/helpers/bitops.c           |  23 +++
 rust/helpers/helpers.c          |   2 +
 rust/kernel/bitmap.rs           | 306 ++++++++++++++++++++++++++++++++
 rust/kernel/id_pool.rs          | 201 +++++++++++++++++++++
 rust/kernel/lib.rs              |   2 +
 8 files changed, 558 insertions(+)
 create mode 100644 rust/helpers/bitmap.c
 create mode 100644 rust/helpers/bitops.c
 create mode 100644 rust/kernel/bitmap.rs
 create mode 100644 rust/kernel/id_pool.rs

-- 
2.49.0.395.g12beb8f557-goog

