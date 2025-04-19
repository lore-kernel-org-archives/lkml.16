Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDB140BF5;
	Sat, 19 Apr 2025 10:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745059028; cv=none; b=szj8xwuwBbRrHVTLhR/+5py4GuJmFXEkYHWj7tRgEjMp+NHnva0uMB+MqcFHJyRJUr9QaHPjOWPNUmzYhWvUkHElyRSBtmgv2iVM3/ZBPjTX4V3kDEZQQ7qf1l6GyPVyaHiopeHK3HMOt9n20GGQxmp5U6BHstwI8Kgq790nehY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745059028; c=relaxed/simple;
	bh=JD+/ymt53uTkEVpXnVszNqoGaMRYWSjRvBxfKU4YHcI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OzqozAf7Pw8ATsTNjMqi8+tZ3dQ5QJOaxY4+9dGBOLv8uBHm/VcZ0Svn5OOXfo2YQDygtsR3325y//WcaKj+tIcSvHGfmvRaqKB30MVhokHSc8IO7KzKuYb+D1fLg6OYENlkc3Ds0T2FoMNPi5tpczLKbGGQJM0j13xpPDpGvkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hg89vis/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hg89vis/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95F11C4CEE7;
	Sat, 19 Apr 2025 10:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745059027;
	bh=JD+/ymt53uTkEVpXnVszNqoGaMRYWSjRvBxfKU4YHcI=;
	h=From:To:Cc:Subject:Date:From;
	b=Hg89vis/xPwjzvJ4PdM+y6CTAwELcguXxHvwsdYmjVNWoTRdMDxHNpCGNRZDDd0K4
	 508cLumOtoG+k3MXhZG3G1HbhZDPreGQhs8aw2XWoD/HIXaD2aMoSbkVsvwSAM1/RH
	 MnMbb6bZqy06yq6jdublpW+ugmzqZ93DufIv+HxEOupYIyi6JUr3CN5k3MWNR/55tH
	 UnvAMw2DY0BV2DMMslmEdHIOeOhLmQOtz6cUc0m5klfJotoT8rVr9Wau7hmVbFri9R
	 iwZUsRr95umRJGzYWnG5LH4Mq19//SLTD/2cH5Ar2ZWp+vfFF5fC6TnArOVErRbIy+
	 tocXtdUydQZng==
From: Miguel Ojeda <ojeda@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] Rust fixes for 6.15
Date: Sat, 19 Apr 2025 12:34:43 +0200
Message-ID: <20250419103443.3004008-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull these fixes for Rust.

They have all been in linux-next for at least a couple rounds.

No conflicts expected.

Thanks!

Cheers,
Miguel

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-fixes-6.15

for you to fetch changes up to c1b4071ec3a6a594df6c49bf8f04a60a88072525:

  rust: helpers: Add dma_alloc_attrs() and dma_free_attrs() (2025-04-15 23:06:03 +0200)

----------------------------------------------------------------
Rust fixes for v6.15

Toolchain and infrastructure:

 - Fix missing KASAN LLVM flags on first build (and fix spurious
   rebuilds) by skipping '--target'.

 - Fix Make < 4.3 build error by using '$(pound)'.

 - Fix UML build error by removing 'volatile' qualifier from io helpers.

 - Fix UML build error by adding 'dma_{alloc,free}_attrs()'  helpers.

 - Clean gendwarfksyms warnings by avoiding to export '__pfx' symbols.

 - Clean objtool warning by adding a new 'noreturn' function for 1.86.0.

 - Disable 'needless_continue' Clippy lint due to new 1.86.0 warnings.

 - Add missing 'ffi' crate to 'generate_rust_analyzer.py'.

'pin-init' crate:

 - Import a couple fixes from upstream.

----------------------------------------------------------------
FUJITA Tomonori (2):
      rust: helpers: Remove volatile qualifier from io helpers
      rust: helpers: Add dma_alloc_attrs() and dma_free_attrs()

Lukas Fischer (1):
      scripts: generate_rust_analyzer: Add ffi crate

Miguel Ojeda (6):
      rust: pin-init: alloc: restrict `impl ZeroableOption` for `Box` to `T: Sized`
      rust: pin-init: use Markdown autolinks in Rust comments
      rust: disable `clippy::needless_continue`
      rust: kasan/kbuild: fix missing flags on first build
      objtool/rust: add one more `noreturn` Rust function for Rust 1.86.0
      rust: kbuild: use `pound` to support GNU Make < 4.3

Sami Tolvanen (1):
      rust: kbuild: Don't export __pfx symbols

 MAINTAINERS                             |  1 +
 Makefile                                |  1 -
 rust/Makefile                           |  2 +-
 rust/helpers/dma.c                      | 16 ++++++++++++++++
 rust/helpers/helpers.c                  |  1 +
 rust/helpers/io.c                       | 34 ++++++++++++++++-----------------
 rust/pin-init/examples/pthread_mutex.rs |  2 +-
 rust/pin-init/src/alloc.rs              |  8 +++-----
 rust/pin-init/src/lib.rs                |  2 +-
 scripts/Makefile.compiler               |  4 ++--
 scripts/generate_rust_analyzer.py       | 12 +++++++++---
 tools/objtool/check.c                   |  1 +
 12 files changed, 53 insertions(+), 31 deletions(-)
 create mode 100644 rust/helpers/dma.c
