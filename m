Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CD661FFE
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745415416; cv=none; b=bTZotpKgP/8coNrZUfILbVnuheZSmx1mgwftpgihK145DTQN5q0K0U9mMR4xTXD0GDItxl6Sj3aCM8lj6reefDBlOmqgnz8WLGbZZhisKVA1J6dwRxbxFVuOYAVV6vIfcyPQzbQQ45wg4ePw54NUt4r3jIasQm2AcH6XP0aCHx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745415416; c=relaxed/simple;
	bh=koYwGuUlAjVKjJaf9kXUnq6WAIl4zO5fu+z5zGkm/Zo=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=NPy0HLarBBi27rc3TT+utoeP36jtbkiwHHk+Rb9H7WSG5xHYvgD9RWaIL5pAIry/3PanC/qJBuSJNUA4hBVHj0LCDqynv8Nxqkvd+y3ClTHkWRX1zWfXSPjWOHMWmFETmEXQvmAwm609eCZzuvXF0jrDfHyzn6OZA/wXPfdFBfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--bqe.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jQm+NWWa; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--bqe.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jQm+NWWa"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-39ee54d5a00so2254894f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 06:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745415412; x=1746020212; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IS7BQk6NlVySYfIFUz3SiBwSL24Jb0ogTAQPQZ8wPwE=;
        b=jQm+NWWaeoK6RyNj3M//h0u3i3MIQ2Og7vjBT8NCFoMN59w0wCLxOkDu8O8T4RNY7j
         QLvSUodqF4XPK0eP+npBEQn7yiulLpCXMoz5onYsR0GGzv8DQR/ARpr8EcqXSuTsxl6a
         xKQ9/P0a4IQ0ljM9PpCgzDZWgTqNLyE3GNS8ZZ2nbf0A2kvu78ml2SQrPmjWh8UfC9Gy
         DfZ3Ddhv/ST3fM7RJDwCKKptcbWdvDWA4qqR1n1EQ0TfiwdrXGqbomit669wkGAqh/Tw
         r3XgHoSZbYlpxi8QQi13AQSdUq31udTHjeT02MxSpmUO86eFO6zyFMOSASonSxU6mrNe
         xBvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745415412; x=1746020212;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IS7BQk6NlVySYfIFUz3SiBwSL24Jb0ogTAQPQZ8wPwE=;
        b=Sl51jxFoD2+3em+oKUop16a3A2FcgM4eKFude+Ti/adGDCIL1NfDpgFl3M6eKe0BHZ
         tnyQYLz2aM5vtxQod9dNERD5u70d+uobf8+kLAR8eAtBHaBYol0DdbdPr5Bc49eUwzZ8
         8EJQJCK21r+iEeLe/Gbn9Y4xBosoKyTdIBGObSj3j8WsujvVQrRfSNoWsZFVNQo8kqeh
         zZjZe5PSHGwcrF98e+eHZuEoMTlePzWocu9Yi+1rPSusPtHpSxqvgP8AKqxPIpzAWoGh
         xWpQGYBGBOEuKmRSydh8cbjgyPJBCEDICf5okISa/9OVeoeeFVDG1hkCEU+y7WPQ1zKV
         3MgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnCywsJt53SJT1nI3kgi6Hp980br1zL2TKtnN+naAHYByeYGslhxM3mB5L1qWnUVPCaAPRWZ9Y9ZeLWBA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyD+dPX0vktrYFoOZpN/Deb97cgEHnW/lJTQrj5HW3h8Nx/pEP2
	oicFtRI2BHXHUrM637B7oiwu1c8lBy3KNM+HovBbucL6yF4BBN4a39vCBrE2ItVzqQ==
X-Google-Smtp-Source: AGHT+IHqKmLIN3+QYw3HqqaxuWVgDTJEfezxeltI/pRf9y4M8BOSV9jxW6vF9qz4aD+I1hllDB4Cu58=
X-Received: from wmqa11.prod.google.com ([2002:a05:600c:348b:b0:43d:7e5:30f0])
 (user=bqe job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:5f90:0:b0:39c:dcc:6451
 with SMTP id ffacd0b85a97d-39efbace334mr15483750f8f.43.1745415412588; Wed, 23
 Apr 2025 06:36:52 -0700 (PDT)
Date: Wed, 23 Apr 2025 13:36:26 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250423133641.3885337-1-bqe@google.com>
Subject: [PATCH v7 0/5] rust: adds Bitmap API, ID pool and bindings
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

This is v7 of a patch introducing Rust bitmap API [v6]. Thanks
for all the helpful comments, this series has improved significantly
as a result of your work.

Changes v6 --> v7:
- Added separate unit tests in bitmap.rs and benchmark module,
  following the example in find_bit_benchmark.c
- Added discussion about using vendored bitset to commit message.
- Refined warning about naming convention

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
Link [v6] https://lore.kernel.org/rust-for-linux/20250327161617.117748-1-bqe@google.com/ 

Burak Emir (5):
  rust: add bindings for bitmap.h
  rust: add bindings for bitops.h
  rust: add bitmap API.
  rust: add find_bit_benchmark_rust module.
  rust: add dynamic ID pool abstraction for bitmap

 MAINTAINERS                     |  15 ++
 lib/Kconfig.debug               |  15 +-
 lib/Makefile                    |   1 +
 lib/find_bit_benchmark_rust.rs  | 102 ++++++++
 rust/bindings/bindings_helper.h |   2 +
 rust/helpers/bitmap.c           |   9 +
 rust/helpers/bitops.c           |  23 ++
 rust/helpers/helpers.c          |   2 +
 rust/kernel/bitmap.rs           | 410 ++++++++++++++++++++++++++++++++
 rust/kernel/id_pool.rs          | 201 ++++++++++++++++
 rust/kernel/lib.rs              |   2 +
 11 files changed, 781 insertions(+), 1 deletion(-)
 create mode 100644 lib/find_bit_benchmark_rust.rs
 create mode 100644 rust/helpers/bitmap.c
 create mode 100644 rust/helpers/bitops.c
 create mode 100644 rust/kernel/bitmap.rs
 create mode 100644 rust/kernel/id_pool.rs

-- 
2.49.0.805.g082f7c87e0-goog

