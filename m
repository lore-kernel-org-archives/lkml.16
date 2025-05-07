Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62FF1CAA65;
	Wed,  7 May 2025 10:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746615309; cv=none; b=TwlyQQGTaavTWCsH5AybDPbsLmYslyREjA4/lkHx7uRD2cNVYkoE5e+D1uRz+lGEdlaLqYIdGn7DqlR9WU/Us3T3cKIcgjEk2HrVCGUjOL0+rvDQjvCCZhwzzKPTu20Qxut18aI0oXie4kk6WaCyozZDrPzF4NJEbiGearORThM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746615309; c=relaxed/simple;
	bh=Mjgl4GYvmrpJHPWDXrDZoRQ30ykxjTvUSF9Aqasm2ZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DznFf90V6hpX+/P8SxwgQgXUVLRVVZHQ2DKMQPWfzzHVnyS2EuwvHS9QP32Y2aSvqPwWiBgfPEiZxmdbpxyxBnDwWUjPSNWUooVYomsD8eppirR/C2dRXyw/lxF/PpxiZuqj8fQ3Vuj6SktGrXJchmWqZXLX6pmxZuKpH5HrG2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cfZHi9jf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cfZHi9jf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C88B2C4CEE7;
	Wed,  7 May 2025 10:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746615309;
	bh=Mjgl4GYvmrpJHPWDXrDZoRQ30ykxjTvUSF9Aqasm2ZQ=;
	h=From:To:Cc:Subject:Date:From;
	b=cfZHi9jfhp+8tsZewtEIcAjJqlP7coH83jzwbpxirtrRrvXwY9v/Xpkk8fHxXrhiK
	 PEUglkAx3CZLg2nmr7Br4S6HIlPfdJFhw3mqOSPKYUM6UeDw6/BxI06xGF6zlqBUBK
	 ek6gfjG9kv2d5Q3c7srcJim69qo1sbvfzcOkAdu3HfnaYE2k/qjgmZVYpD/pyITj+m
	 vsHV4xk66tfKOS43aLF/xyWnOkXsgeXdmxiyTgpSy+79lynrZA0QFPkvdd9wJrxlyv
	 Watv4hzQYbDsdfNMA7Wfxt9Nr14dsnY6nq6b5fKA5wobXbXr/H52A9YY7g8b7sAm9x
	 rAh+tQaiBBwNg==
From: Benno Lossin <lossin@kernel.org>
To: Benno Lossin <benno.lossin@proton.me>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Fiona Behrens <me@kloenk.dev>,
	Christian Schrefl <chrisi.schrefl@gmail.com>,
	Alban Kurti <kurti@invicto.ai>,
	Michael Vetter <jubalh@iodoru.org>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Benno Lossin <lossin@kernel.org>
Subject: [GIT PULL] Rust pin-init for v6.16
Date: Wed,  7 May 2025 12:54:55 +0200
Message-ID: <20250507105455.72863-1-lossin@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Miguel,

Here is the first pin-init pull request! It contains more changes than I
expected the first PR to have, but the new CI discovered a few smaller
issues and I also got a contribution.

All commits have been in linux-next for a few days. The earlier commits
have been in linux-next for a few weeks.

No conflicts expected.

Please pull for v6.16 -- thanks!

---
Cheers,
Benno

The following changes since commit 9c32cda43eb78f78c73aee4aa344b777714e259b:

  Linux 6.15-rc3 (2025-04-20 13:43:47 -0700)

are available in the Git repository at:

  https://github.com/Rust-for-Linux/linux.git tags/pin-init-v6.16

for you to fetch changes up to 9de1a293c8ece00d226b21a35751ec178be2a9fa:

  rust: pin-init: improve documentation for `Zeroable` derive macros (2025-05-01 18:16:22 +0200)

----------------------------------------------------------------
pin-init changes for v6.16

Added:

- 'Wrapper<T>' trait for creating pin-initializers for wrapper structs
  with a structurally pinned value such as 'UnsafeCell<T>' or
  'MaybeUninit<T>'.

- 'MaybeZeroable' derive macro to try to derive 'Zeroable', but not
  error if not all fields implement it. This is needed to derive
  'Zeroable' for all bindgen-generated structs.

- 'unsafe fn cast_[pin_]init()' functions to unsafely change the
  initialized type of an initializer. These are utilized by the
  'Wrapper<T>' implementations.

Changed:

- Added support for visibility in 'Zeroable' derive macro.

- Added support for 'union's in 'Zeroable' derive macro.

Upstream dev news:

- The CI has been streamlined & some bugs with it have been fixed. I
  also added new workflows to check if the user-space version and the
  one in the kernel tree have diverged.

- I also started to use the issues [1] tab to keep track of any problems
  or unexpected/unwanted things. This should help folks report and
  diagnose issues w.r.t. 'pin-init' better.

[1]: https://github.com/rust-for-linux/pin-init/issues

----------------------------------------------------------------
Benno Lossin (10):
      rust: pin-init: synchronize README.md
      rust: pin-init: internal: skip rustfmt formatting of kernel-only module
      rust: pin-init: examples: conditionally enable `feature(lint_reasons)`
      rust: pin-init: examples: use `allow` instead of `expect`
      rust: pin-init: add `cast_[pin_]init` functions to change the initialized type
      rust: pin-init: allow `pub` fields in `derive(Zeroable)`
      rust: pin-init: allow `Zeroable` derive macro to also be applied to unions
      rust: pin-init: add `MaybeZeroable` derive macro
      rust: pin-init: fix typos
      rust: pin-init: improve documentation for `Zeroable` derive macros

Christian Schrefl (4):
      rust: pin-init: Add the `Wrapper` trait.
      rust: pin-init: Implement `Wrapper` for `UnsafePinned` behind feature flag.
      rust: pin-init: Update Changelog and Readme
      rust: pin-init: Update the structural pinning link in readme.

 rust/pin-init/README.md                 |  14 +++-
 rust/pin-init/examples/linked_list.rs   |   1 +
 rust/pin-init/examples/mutex.rs         |   1 +
 rust/pin-init/examples/pthread_mutex.rs |   4 +-
 rust/pin-init/examples/static_init.rs   |   1 +
 rust/pin-init/internal/src/lib.rs       |   6 ++
 rust/pin-init/internal/src/zeroable.rs  |  27 +++++-
 rust/pin-init/src/lib.rs                | 144 +++++++++++++++++++++++++++++++-
 rust/pin-init/src/macros.rs             |  91 +++++++++++++++++++-
 9 files changed, 279 insertions(+), 10 deletions(-)
