Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE54C4A0C;
	Thu,  5 Jun 2025 02:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749092061; cv=none; b=hONwwxC+eOZQ/tvufycziuVXRYr7BtrsmOUp7R0sMitixh2LjrQvAPIkofI5BKoACVmEWhw5Zvsw2NAiX9BzZFNmCZ9jK58poLzCUCw+3Mv3Wp8A7pmf28abEWaVCYZyeiuzAYG/1VR9HukdaEGyPOb3AFqw1xnxNNCtnmKyMJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749092061; c=relaxed/simple;
	bh=PJJgebzDlpuLcMgzkRI9FGQWrwH4gFo+M+CSWvTJy8U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gC1QJnr5NZaT76ct36E/5Z6FMm89UgxzPBlqKeBQ2WWhEfVPAHJt7F23qOXCEyOLB/FvAN9JxaR/rO/blqpXMhUQgKbrMcJD6U2QJD4/jOc3pOxJbbqNN2/PnYx+cIVEWoT+06LpNu/TwJCsKY0H1CmDtR6Mei/AKXxWeGyx/fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=azzJhR+M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="azzJhR+M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07B1BC4CEE4;
	Thu,  5 Jun 2025 02:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749092060;
	bh=PJJgebzDlpuLcMgzkRI9FGQWrwH4gFo+M+CSWvTJy8U=;
	h=From:To:Cc:Subject:Date:From;
	b=azzJhR+MFHcz6L75s26/nG2H6XHHnh2vOIv/zD79mZ+PpDB1sN6bVyqxwA086MNiL
	 A+SLiTMSm5mSznZmtoU5K8zw9tVyr/Wod64X+bkUszkczM2KgRG6dCz/SOzbRutYxo
	 En7Hz8RynbJJnUFDG1gTBn6mC/ADRFK3IZxJWxIJ345/GliZCEEBLTbyz4x9KokDQ3
	 f9epdmctGarh4t00y2hBTUJNk+FnM2FIHow5bgL4WL5WHk+n8uCinMs6MA6fUZgSo2
	 sfu0yRDVO7jn1x8RMyR1QpVRB9zoc4cOkyk9DzzkgWZ7kW67yt/zt1lxNhLmNOdq8N
	 OMnKomfHhPFHg==
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
Subject: [GIT PULL] Rust for 6.16
Date: Thu,  5 Jun 2025 04:54:00 +0200
Message-ID: <20250605025400.244965-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

This is the next round of the Rust support.

We continue to expand our use of sub-trees -- this time around I am
carrying four merges.

There are a few conflicts, including semantic ones, but they are all
easy to apply. The resolutions in the latest linux-next are fine; I also
did a test merge -- please check either to catch the semantic ones:

    https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git rust-6.16-test-merge

All commits have been in linux-next since at least last week. If you use
linux-next as a reference, please look at next-20250604 or later, since
previous ones were missing a needed change.

Please pull for v6.16 -- thanks!

Cheers,
Miguel

The following changes since commit 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3:

  Linux 6.15-rc6 (2025-05-11 14:54:11 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-6.16

for you to fetch changes up to 7a17bbc1d952057898cb0739e60665908fbb8c72:

  rust: list: Fix typo `much` in arc.rs (2025-05-29 23:35:44 +0200)

----------------------------------------------------------------
Rust changes for v6.16

Toolchain and infrastructure:

 - KUnit '#[test]'s:

   - Support KUnit-mapped 'assert!' macros.

     The support that landed last cycle was very basic, and the
     'assert!' macros panicked since they were the standard library
     ones. Now, they are mapped to the KUnit ones in a similar way to
     how is done for doctests, reusing the infrastructure there.

     With this, a failing test like:

         #[test]
         fn my_first_test() {
             assert_eq!(42, 43);
         }

     will report:

         # my_first_test: ASSERTION FAILED at rust/kernel/lib.rs:251
         Expected 42 == 43 to be true, but is false
         # my_first_test.speed: normal
         not ok 1 my_first_test

   - Support tests with checked 'Result' return types.

     The return value of test functions that return a 'Result' will be
     checked, thus one can now easily catch errors when e.g. using the
     '?' operator in tests.

     With this, a failing test like:

         #[test]
         fn my_test() -> Result {
             f()?;
             Ok(())
         }

     will report:

         # my_test: ASSERTION FAILED at rust/kernel/lib.rs:321
         Expected is_test_result_ok(my_test()) to be true, but is false
         # my_test.speed: normal
         not ok 1 my_test

   - Add 'kunit_tests' to the prelude.

 - Clarify the remaining language unstable features in use.

 - Compile 'core' with edition 2024 for Rust >= 1.87.

 - Workaround 'bindgen' issue with forward references to 'enum' types.

 - objtool: relax slice condition to cover more 'noreturn' functions.

 - Use absolute paths in macros referencing 'core' and 'kernel' crates.

 - Skip '-mno-fdpic' flag for bindgen in GCC 32-bit arm builds.

 - Clean some 'doc_markdown' lint hits -- we may enable it later on.

'kernel' crate:

 - 'alloc' module:

   - 'Box': support for type coercion, e.g. 'Box<T>' to 'Box<dyn U>' if
     'T' implements 'U'.

   - 'Vec': implement new methods (prerequisites for nova-core and
     binder): 'truncate', 'resize', 'clear', 'pop',
     'push_within_capacity' (with new error type 'PushError'),
     'drain_all', 'retain', 'remove' (with new error type
     'RemoveError'), insert_within_capacity' (with new error type
     'InsertError').

     In addition, simplify 'push' using 'spare_capacity_mut', split
     'set_len' into 'inc_len' and 'dec_len', add type invariant
     'len <= capacity' and simplify 'truncate' using 'dec_len'.

 - 'time' module:

   - Morph the Rust hrtimer subsystem into the Rust timekeeping
     subsystem, covering delay, sleep, timekeeping, timers. This new
     subsystem has all the relevant timekeeping C maintainers listed in
     the entry.

   - Replace 'Ktime' with 'Delta' and 'Instant' types to represent a
     duration of time and a point in time.

   - Temporarily add 'Ktime' to 'hrtimer' module to allow 'hrtimer' to
     delay converting to 'Instant' and 'Delta'.

 - 'xarray' module:

   - Add a Rust abstraction for the 'xarray' data structure. This
     abstraction allows Rust code to leverage the 'xarray' to store
     types that implement 'ForeignOwnable'. This support is a dependency
     for memory backing feature of the Rust null block driver, which is
     waiting to be merged.

   - Set up an entry in 'MAINTAINERS' for the XArray Rust support.
     Patches will go to the new Rust XArray tree and then via the Rust
     subsystem tree for now.

   - Allow 'ForeignOwnable' to carry information about the pointed-to
     type. This helps asserting alignment requirements for the pointer
     passed to the foreign language.

 - 'container_of!': retain pointer mut-ness and add a compile-time check
   of the type of the first parameter ('$field_ptr').

 - Support optional message in 'static_assert!'.

 - Add C FFI types (e.g. 'c_int') to the prelude.

 - 'str' module: simplify KUnit tests 'format!' macro, convert
   'rusttest' tests into KUnit, take advantage of the '-> Result'
   support in KUnit '#[test]'s.

 - 'list' module: add examples for 'List', fix path of 'assert_pinned!'
   (so far unused macro rule).

 - 'workqueue' module: remove 'HasWork::OFFSET'.

 - 'page' module: add 'inline' attribute.

'macros' crate:

 - 'module' macro: place 'cleanup_module()' in '.exit.text' section.

'pin-init' crate:

 - Add 'Wrapper<T>' trait for creating pin-initializers for wrapper
   structs with a structurally pinned value such as 'UnsafeCell<T>' or
   'MaybeUninit<T>'.

 - Add 'MaybeZeroable' derive macro to try to derive 'Zeroable', but
   not error if not all fields implement it. This is needed to derive
   'Zeroable' for all bindgen-generated structs.

 - Add 'unsafe fn cast_[pin_]init()' functions to unsafely change the
   initialized type of an initializer. These are utilized by the
   'Wrapper<T>' implementations.

 - Add support for visibility in 'Zeroable' derive macro.

 - Add support for 'union's in 'Zeroable' derive macro.

 - Upstream dev news: streamline CI, fix some bugs. Add new workflows
   to check if the user-space version and the one in the kernel tree
   have diverged. Use the issues tab [1] to track them, which should
   help folks report and diagnose issues w.r.t. 'pin-init' better.

     [1] https://github.com/rust-for-linux/pin-init/issues

Documentation:

 - Testing: add docs on the new KUnit '#[test]' tests.

 - Coding guidelines: explain that '///' vs. '//' applies to private
   items too. Add section on C FFI types.

 - Quick Start guide: update Ubuntu instructions and split them into
   "25.04" and "24.04 LTS and older".

And a few other cleanups and improvements.

----------------------------------------------------------------
Alexandre Courbot (1):
      rust: alloc: allow coercion from `Box<T>` to `Box<dyn U>` if T implements U

Alice Ryhl (7):
      rust: alloc: add Vec::clear
      rust: alloc: add Vec::pop
      rust: alloc: add Vec::push_within_capacity
      rust: alloc: add Vec::drain_all
      rust: alloc: add Vec::retain
      rust: alloc: add Vec::remove
      rust: alloc: add Vec::insert_within_capacity

Altan Ozlu (1):
      rust: static_assert: add optional message

Andrew Ballance (3):
      rust: alloc: add Vec::truncate method
      rust: alloc: add Vec::resize method
      rust: replace rustdoc references to alloc::format

Benno Lossin (12):
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
      MAINTAINERS: mailmap: update Benno Lossin's email address
      rust: list: fix path of `assert_pinned!`

Christian Schrefl (4):
      rust: pin-init: Add the `Wrapper` trait.
      rust: pin-init: Implement `Wrapper` for `UnsafePinned` behind feature flag.
      rust: pin-init: Update Changelog and Readme
      rust: pin-init: Update the structural pinning link in readme.

Danilo Krummrich (1):
      rust: alloc: add missing invariant in Vec::set_len()

FUJITA Tomonori (6):
      rust: hrtimer: Add Ktime temporarily
      rust: time: Add PartialEq/Eq/PartialOrd/Ord trait to Ktime
      rust: time: Introduce Delta type
      rust: time: Introduce Instant type
      MAINTAINERS: rust: Add a new section for all of the time stuff
      rust: module: place cleanup_module() in .exit.text section

Gary Guo (1):
      rust: compile libcore with edition 2024 for 1.87+

I Hsin Cheng (2):
      rust: list: Use "List::is_empty()" to perform checking when possible
      rust: list: Add examples for linked list

Igor Korotin (2):
      rust: use absolute paths in macros referencing core and kernel
      docs: rust: quick-start: update Ubuntu instructions

Jihed Chaibi (1):
      rust: str: fix typo in comment

Kunwu Chan (1):
      rust: page: optimize rust symbol generation for Page

Miguel Ojeda (25):
      docs: rust: explain that `///` vs. `//` applies to private items too
      rust: uaccess: take advantage of the prelude and `Result`'s defaults
      rust: clarify the language unstable features in use
      Merge tag 'rust-timekeeping-for-v6.16-v2' of https://github.com/Rust-for-Linux/linux into rust-next
      Merge tag 'rust-xarray-for-v6.16' of https://github.com/Rust-for-Linux/linux into rust-next
      Merge tag 'pin-init-v6.16' of https://github.com/Rust-for-Linux/linux into rust-next
      Merge tag 'alloc-next-v6.16-2025-05-13' of https://github.com/Rust-for-Linux/linux into rust-next
      rust: remove unneeded Rust 1.87.0 `allow(clippy::ptr_eq)`
      objtool/rust: relax slice condition to cover more `noreturn` Rust functions
      rust: workaround `bindgen` issue with forward references to `enum` types
      rust: add C FFI types to the prelude
      rust: platform: fix docs related to missing Markdown code spans
      rust: alloc: add missing Markdown code spans
      rust: alloc: add missing Markdown code span
      rust: pci: fix docs related to missing Markdown code spans
      rust: task: add missing Markdown code spans and intra-doc links
      rust: dma: add missing Markdown code span
      rust: kunit: support KUnit-mapped `assert!` macros in `#[test]`s
      rust: kunit: support checked `-> Result`s in KUnit `#[test]`s
      rust: add `kunit_tests` to the prelude
      rust: str: convert `rusttest` tests into KUnit
      rust: str: simplify KUnit tests `format!` macro
      rust: str: take advantage of the `-> Result` support in KUnit `#[test]`'s
      Documentation: rust: rename `#[test]`s to "`rusttest` host tests"
      Documentation: rust: testing: add docs on the new KUnit `#[test]` tests

Patrick Miller (1):
      rust: make section names plural

Rudraksha Gupta (1):
      rust: arm: fix unknown (to Clang) argument '-mno-fdpic'

Sylvan Smit (1):
      rust: list: Fix typo `much` in arc.rs

Tamir Duberstein (11):
      rust: alloc: use `spare_capacity_mut` to reduce unsafe
      rust: alloc: add Vec::len() <= Vec::capacity invariant
      rust: alloc: add `Vec::dec_len`
      rust: alloc: refactor `Vec::truncate` using `dec_len`
      rust: alloc: replace `Vec::set_len` with `inc_len`
      rust: types: add `ForeignOwnable::PointedTo`
      rust: xarray: Add an abstraction for XArray
      MAINTAINERS: add entry for Rust XArray API
      rust: retain pointer mut-ness in `container_of!`
      rust: workqueue: remove HasWork::OFFSET
      rust: check type of `$ptr` in `container_of!`

Xizhe Yin (1):
      rust: convert raw URLs to Markdown autolinks in comments

 .mailmap                                 |   1 +
 Documentation/rust/coding-guidelines.rst |  29 +++
 Documentation/rust/quick-start.rst       |  44 +++-
 Documentation/rust/testing.rst           |  80 +++++-
 MAINTAINERS                              |  26 +-
 init/Kconfig                             |   3 +
 rust/Makefile                            |  19 +-
 rust/bindings/bindings_helper.h          |  28 ++
 rust/ffi.rs                              |   2 +-
 rust/helpers/helpers.c                   |   1 +
 rust/helpers/xarray.c                    |  28 ++
 rust/kernel/alloc.rs                     |   4 +-
 rust/kernel/alloc/allocator_test.rs      |   2 +-
 rust/kernel/alloc/kbox.rs                |  80 ++++--
 rust/kernel/alloc/kvec.rs                | 433 ++++++++++++++++++++++++++++---
 rust/kernel/alloc/kvec/errors.rs         |  61 +++++
 rust/kernel/block/mq/gen_disk.rs         |   2 +-
 rust/kernel/device.rs                    |  26 +-
 rust/kernel/device_id.rs                 |   4 +-
 rust/kernel/dma.rs                       |   2 +-
 rust/kernel/kunit.rs                     |  37 ++-
 rust/kernel/lib.rs                       |  45 +++-
 rust/kernel/list.rs                      | 115 +++++++-
 rust/kernel/list/arc.rs                  |   6 +-
 rust/kernel/miscdevice.rs                |  10 +-
 rust/kernel/page.rs                      |   2 +
 rust/kernel/pci.rs                       |  17 +-
 rust/kernel/platform.rs                  |  11 +-
 rust/kernel/prelude.rs                   |   7 +-
 rust/kernel/print.rs                     |  27 +-
 rust/kernel/rbtree.rs                    |  23 +-
 rust/kernel/static_assert.rs             |   9 +-
 rust/kernel/std_vendor.rs                |   2 +-
 rust/kernel/str.rs                       |  82 +++---
 rust/kernel/sync/arc.rs                  |  25 +-
 rust/kernel/task.rs                      |   4 +-
 rust/kernel/time.rs                      | 167 +++++++++---
 rust/kernel/time/hrtimer.rs              |  24 +-
 rust/kernel/time/hrtimer/arc.rs          |   2 +-
 rust/kernel/time/hrtimer/pin.rs          |   2 +-
 rust/kernel/time/hrtimer/pin_mut.rs      |   4 +-
 rust/kernel/time/hrtimer/tbox.rs         |   2 +-
 rust/kernel/types.rs                     |  46 ++--
 rust/kernel/uaccess.rs                   |   6 +-
 rust/kernel/workqueue.rs                 |  50 ++--
 rust/kernel/xarray.rs                    | 275 ++++++++++++++++++++
 rust/macros/helpers.rs                   |  17 ++
 rust/macros/kunit.rs                     |  58 +++--
 rust/macros/lib.rs                       |  15 +-
 rust/macros/module.rs                    |  32 +--
 rust/pin-init/README.md                  |  14 +-
 rust/pin-init/examples/linked_list.rs    |   1 +
 rust/pin-init/examples/mutex.rs          |   1 +
 rust/pin-init/examples/pthread_mutex.rs  |   4 +-
 rust/pin-init/examples/static_init.rs    |   1 +
 rust/pin-init/internal/src/lib.rs        |   6 +
 rust/pin-init/internal/src/zeroable.rs   |  27 +-
 rust/pin-init/src/lib.rs                 | 144 +++++++++-
 rust/pin-init/src/macros.rs              |  91 ++++++-
 scripts/Makefile.build                   |   9 +
 scripts/generate_rust_analyzer.py        |  13 +-
 scripts/generate_rust_target.rs          |   4 +-
 scripts/rustdoc_test_builder.rs          |   8 +-
 scripts/rustdoc_test_gen.rs              |  16 +-
 tools/objtool/check.c                    |   3 +-
 65 files changed, 1959 insertions(+), 380 deletions(-)
 create mode 100644 rust/helpers/xarray.c
 create mode 100644 rust/kernel/alloc/kvec/errors.rs
 create mode 100644 rust/kernel/xarray.rs
