Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE3235973;
	Sun, 30 Mar 2025 17:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743354458; cv=none; b=O4lovNVPoop4Es+HaHWIDw0YeR+05/d+NLNE6LhvckCwhBD/OEXAJHr/QwL0zFt7XlDR1RjLH1BQc9wn4kTHlovhj7P1xo4zLMVnijqPs3Es3yLURE0XfMFxy3M5ZAuKss0NQw2gdjTChqdEulqh4q59G9JzlOECvRKjSIappXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743354458; c=relaxed/simple;
	bh=mKly5oKaxS0kW5BaWYg85pisIDCtmkDXkzuYHChnth4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OZcHQnX3SXf526es6Ac+wToYixx0fhvNktVArWAks2sfcrdWE+X1yZlPYWiie80AKPMdDgRPe+7emxqBnwUHs0wyD/2RwOn5xBOxw6ofSTgRkxU6WjQnUyVt2n3F0ONsQibUCERS1d/2Ioq5EEQsEISa9Ymx9h9JvPUewsQqcns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dd8ghf7L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dd8ghf7L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D52D4C4CEDD;
	Sun, 30 Mar 2025 17:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743354458;
	bh=mKly5oKaxS0kW5BaWYg85pisIDCtmkDXkzuYHChnth4=;
	h=From:To:Cc:Subject:Date:From;
	b=dd8ghf7L8tqcW1dMt+ItEWVGBozNTbTv0XNoGR11aJqMl46lZRLW2sXgnRDevBTgV
	 OlcPVF3Ub3EHuoEc0bSeDLRm0dUHJxdvBmgGuemXOuork0ynMPajGhvp/MK2Qljij+
	 CsoHKh+ajmohv9DvX5GuCtrdjjoee19flIdtfb2RNIBoo1YSqhkh2KZD815Bt5Scn/
	 a+Ke7kDmRumOmGzW+vzPmg44bzJBovJI64wXJBTH3cEkk/tUbnPg9pycTMy3/ETn5q
	 sI61ATQwkHkWQRFHf7dYfYZ4X+bicmAO0dWOHmbzF4WSyx1WQB34hZxMiGYZCCo4dR
	 HPL2UT5Oi0POQ==
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
Subject: [GIT PULL] Rust for 6.15
Date: Sun, 30 Mar 2025 19:05:34 +0200
Message-ID: <20250330170535.546869-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Linus,

This is the next round of the Rust support.

This time around, there are a couple of "major" things you should look
out for.

The first one is that this contains my first pull from someone else --
we are starting to use sub-trees in the Rust "subsystem". Please let me
know if I messed up (since these will be trees that you don't pull,
there should still be a single merge base). I did the merge as the last
thing, so that it can be easily redone if needed, just in case.

The second is that there are non-trivial conflicts, in particular a
semantic conflict. It is not complex to fix, but it requires changes in
different files. The resolutions in -next are fine -- I also did a test
merge too:

    https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git rust-6.15-test-merge

Finally, there will be another semantic conflict with driver-core, but
you did not get that PR yet (Dave mentioned it in the DRM one too, since
it conflicts with them too). The result is fine in linux-next though,
so please use that when you get it. Greg will likely mention it too.

All commits have been in linux-next for at least three rounds, including
the merge, and most for more than a week. After this, we will try to
get back to earlier pulls.

Please pull for v6.15 -- thanks!

Cheers,
Miguel

The following changes since commit 7eb172143d5508b4da468ed59ee857c6e5e01da6:

  Linux 6.14-rc5 (2025-03-02 11:48:20 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-6.15

for you to fetch changes up to e6ea10d5dbe082c54add289b44f08c9fcfe658af:

  Merge tag 'rust-hrtimer-for-v6.15-v3' of https://github.com/Rust-for-Linux/linux into rust-next (2025-03-25 23:41:14 +0100)

----------------------------------------------------------------
Rust changes for v6.15

Toolchain and infrastructure:

 - Extract the 'pin-init' API from the 'kernel' crate and make it into
   a standalone crate.

   In order to do this, the contents are rearranged so that they can
   easily be kept in sync with the version maintained out-of-tree that
   other projects have started to use too (or plan to, like QEMU).

   This will reduce the maintenance burden for Benno, who will now have
   his own sub-tree, and will simplify future expected changes like the
   move to use 'syn' to simplify the implementation.

 - Add '#[test]'-like support based on KUnit.

   We already had doctests support based on KUnit, which takes the
   examples in our Rust documentation and runs them under KUnit.

   Now, we are adding the beginning of the support for "normal" tests,
   similar to those the '#[test]' tests in userspace Rust. For instance:

       #[kunit_tests(my_suite)]
       mod tests {
           #[test]
           fn my_test() {
               assert_eq!(1 + 1, 2);
           }
       }

   Unlike with doctests, the 'assert*!'s do not map to the KUnit
   assertion APIs yet.

 - Check Rust signatures at compile time for functions called from C by
   name.

   In particular, introduce a new '#[export]' macro that can be placed
   in the Rust function definition. It will ensure that the function
   declaration on the C side matches the signature on the Rust function:

       #[export]
       pub unsafe extern "C" fn my_function(a: u8, b: i32) -> usize {
           // ...
       }

   The macro essentially forces the compiler to compare the types of
   the actual Rust function and the 'bindgen'-processed C signature.

   These cases are rare so far. In the future, we may consider
   introducing another tool, 'cbindgen', to generate C headers
   automatically. Even then, having these functions explicitly marked
   may be a good idea anyway.

 - Enable the 'raw_ref_op' Rust feature: it is already stable, and
   allows us to use the new '&raw' syntax, avoiding a couple macros.
   After everyone has migrated, we will disallow the macros.

 - Pass the correct target to 'bindgen' on Usermode Linux.

 - Fix 'rusttest' build in macOS.

'kernel' crate:

 - New 'hrtimer' module: add support for setting up intrusive timers
   without allocating when starting the timer. Add support for
   'Pin<Box<_>>', 'Arc<_>', 'Pin<&_>' and 'Pin<&mut _>' as pointer types
   for use with timer callbacks. Add support for setting clock source
   and timer mode.

 - New 'dma' module: add a simple DMA coherent allocator abstraction and
   a test sample driver.

 - 'list' module: make the linked list 'Cursor' point between elements,
   rather than at an element, which is more convenient to us and allows
   for cursors to empty lists; and document it with examples of how to
   perform common operations with the provided methods.

 - 'str' module: implement a few traits for 'BStr' as well as the
   'strip_prefix()' method.

 - 'sync' module: add 'Arc::as_ptr'.

 - 'alloc' module: add 'Box::into_pin'.

 - 'error' module: extend the 'Result' documentation, including a few
   examples on different ways of handling errors, a warning about using
   methods that may panic, and links to external documentation.

'macros' crate:

  - 'module' macro: add the 'authors' key to support multiple authors.
    The original key will be kept until everyone has migrated.

Documentation:

 - Add error handling sections.

MAINTAINERS:

 - Add Danilo Krummrich as reviewer of the Rust "subsystem".

 - Add 'RUST [PIN-INIT]' entry with Benno Lossin as maintainer. It has
   its own sub-tree.

 - Add sub-tree for 'RUST [ALLOC]'.

 - Add 'DMA MAPPING HELPERS DEVICE DRIVER API [RUST]' entry with Abdiel
   Janulgue as primary maintainer. It will go through the sub-tree of
   the 'RUST [ALLOC]' entry.

 - Add 'HIGH-RESOLUTION TIMERS [RUST]' entry with Andreas Hindborg as
   maintainer. It has its own sub-tree.

And a few other cleanups and improvements.

----------------------------------------------------------------
Abdiel Janulgue (4):
      rust: error: Add EOVERFLOW
      rust: add dma coherent allocator abstraction
      samples: rust: add Rust dma test sample driver
      MAINTAINERS: add entry for Rust dma mapping helpers device driver API

Alice Ryhl (8):
      rust: task: make Pid type alias public
      rust: list: extract common code for insertion
      rust: list: make the cursor point between elements
      rust: fix signature of rust_fmt_argument
      rust: macros: support additional tokens in quote!
      rust: add #[export] macro
      print: use new #[export] macro for rust_fmt_argument
      panic_qr: use new #[export] macro

Andreas Hindborg (17):
      rust: hrtimer: introduce hrtimer support
      rust: sync: add `Arc::as_ptr`
      rust: hrtimer: implement `HrTimerPointer` for `Arc`
      rust: str: implement `PartialEq` for `BStr`
      rust: str: implement `Index` for `BStr`
      rust: str: implement `AsRef<BStr>` for `[u8]` and `BStr`
      rust: str: implement `strip_prefix` for `BStr`
      rust: hrtimer: allow timer restart from timer handler
      rust: hrtimer: add `UnsafeHrTimerPointer`
      rust: hrtimer: add `hrtimer::ScopedHrTimerPointer`
      rust: hrtimer: implement `UnsafeHrTimerPointer` for `Pin<&T>`
      rust: hrtimer: implement `UnsafeHrTimerPointer` for `Pin<&mut T>`
      rust: alloc: add `Box::into_pin`
      rust: hrtimer: implement `HrTimerPointer` for `Pin<Box<T>>`
      rust: hrtimer: add `HrTimerMode`
      rust: hrtimer: add clocksource selection through `ClockId`
      rust: hrtimer: add maintainer entry

Antonio Hickey (2):
      rust: enable `raw_ref_op` feature
      rust: block: refactor to use `&raw mut`

Benno Lossin (21):
      rust: init: disable doctests
      rust: move pin-init API into its own directory
      rust: add extensions to the pin-init crate and move relevant documentation there
      rust: pin-init: move proc-macro documentation into pin-init crate
      rust: pin-init: change examples to the user-space version
      rust: pin-init: call `try_[pin_]init!` from `[pin_]init!` instead of `__init_internal!`
      rust: pin-init: move the default error behavior of `try_[pin_]init`
      rust: pin-init: move `InPlaceInit` and impls of `InPlaceWrite` into the kernel crate
      rust: pin-init: move impl `Zeroable` for `Opaque` and `Option<KBox<T>>` into the kernel crate
      rust: add `ZeroableOption` and implement it instead of `Zeroable` for `Option<Box<T, A>>`
      rust: pin-init: fix documentation links
      rust: pin-init: remove kernel-crate dependency
      rust: pin-init: change the way the `paste!` macro is called
      rust: make pin-init its own crate
      rust: pin-init: add `std` and `alloc` support from the user-space version
      rust: pin-init: synchronize documentation with the user-space version
      rust: pin-init: internal: synchronize with user-space version
      rust: pin-init: miscellaneous synchronization with the user-space version
      rust: pin-init: add miscellaneous files from the user-space version
      rust: pin-init: re-enable doctests
      MAINTAINERS: add entry for the `pin-init` crate

Borys Tyran (1):
      rust: improve lifetimes markup

Charalampos Mitrodimas (1):
      rust: rbtree: fix comments referring to Box instead of KBox

Danilo Krummrich (1):
      rust: dma: add `Send` implementation for `CoherentAllocation`

Dirk Behme (3):
      docs: rust: Add error handling sections
      rust: types: add intra-doc links for `Opaque<T>`
      rust: error: extend the Result documentation

Gary Guo (1):
      rust: alloc: make `ReallocFunc::call` inline

Guilherme Giacomo Simoes (1):
      rust: module: introduce `authors` key

Guillaume Gomez (1):
      scripts: rust: mention file name in error messages

José Expósito (3):
      rust: kunit: add KUnit case and suite macros
      rust: macros: add macro to easily run KUnit tests
      rust: kunit: allow to know if we are in a test

Miguel Ojeda (4):
      MAINTAINERS: add Danilo Krummrich as Rust reviewer
      MAINTAINERS: rust: add tree field for RUST [ALLOC]
      rust: add pin-init crate build infrastructure
      Merge tag 'rust-hrtimer-for-v6.15-v3' of https://github.com/Rust-for-Linux/linux into rust-next

Tamir Duberstein (2):
      rust: uaccess: name the correct function
      rust: macros: fix `make rusttest` build on macOS

Thomas Weißschuh (2):
      rust: pass correct target to bindgen on Usermode Linux
      rust: add kunitconfig

 Documentation/rust/coding-guidelines.rst           |    8 +
 Documentation/rust/testing.rst                     |    7 +
 MAINTAINERS                                        |   44 +
 drivers/block/rnull.rs                             |    2 +-
 drivers/gpu/drm/drm_panic.c                        |    5 -
 drivers/gpu/drm/drm_panic_qr.rs                    |   13 +-
 drivers/net/phy/ax88796b_rust.rs                   |    2 +-
 drivers/net/phy/qt2025.rs                          |    2 +-
 include/drm/drm_panic.h                            |    7 +
 include/linux/sprintf.h                            |    3 +
 lib/vsprintf.c                                     |    3 -
 rust/.kunitconfig                                  |    3 +
 rust/Makefile                                      |   76 +-
 rust/bindings/bindings_helper.h                    |    6 +
 rust/kernel/alloc/allocator.rs                     |    1 +
 rust/kernel/alloc/kbox.rs                          |   15 +-
 rust/kernel/block/mq/request.rs                    |    4 +-
 rust/kernel/block/mq/tag_set.rs                    |    5 +-
 rust/kernel/dma.rs                                 |  391 +++++
 rust/kernel/driver.rs                              |    6 +-
 rust/kernel/error.rs                               |  124 +-
 rust/kernel/fs/file.rs                             |    4 +-
 rust/kernel/init.rs                                | 1450 ++-----------------
 rust/kernel/kunit.rs                               |  171 +++
 rust/kernel/lib.rs                                 |    9 +-
 rust/kernel/list.rs                                |  473 +++++--
 rust/kernel/net/phy.rs                             |    4 +-
 rust/kernel/pci.rs                                 |    2 +-
 rust/kernel/platform.rs                            |    2 +-
 rust/kernel/prelude.rs                             |    8 +-
 rust/kernel/print.rs                               |   10 +-
 rust/kernel/rbtree.rs                              |   12 +-
 rust/kernel/seq_file.rs                            |    2 +-
 rust/kernel/str.rs                                 |   46 +
 rust/kernel/sync/arc.rs                            |   81 +-
 rust/kernel/sync/condvar.rs                        |    6 +-
 rust/kernel/sync/lock.rs                           |    4 +-
 rust/kernel/sync/lock/mutex.rs                     |    2 +-
 rust/kernel/sync/lock/spinlock.rs                  |    2 +-
 rust/kernel/sync/poll.rs                           |    4 +-
 rust/kernel/task.rs                                |    2 +-
 rust/kernel/time.rs                                |   68 +
 rust/kernel/time/hrtimer.rs                        |  520 +++++++
 rust/kernel/time/hrtimer/arc.rs                    |  100 ++
 rust/kernel/time/hrtimer/pin.rs                    |  104 ++
 rust/kernel/time/hrtimer/pin_mut.rs                |  108 ++
 rust/kernel/time/hrtimer/tbox.rs                   |  120 ++
 rust/kernel/types.rs                               |   23 +-
 rust/kernel/uaccess.rs                             |    3 +-
 rust/macros/export.rs                              |   29 +
 rust/macros/helpers.rs                             |  153 +-
 rust/macros/kunit.rs                               |  161 +++
 rust/macros/lib.rs                                 |  164 +--
 rust/macros/module.rs                              |   12 +-
 rust/macros/quote.rs                               |   28 +-
 rust/pin-init/CONTRIBUTING.md                      |   72 +
 rust/pin-init/README.md                            |  228 +++
 rust/pin-init/examples/big_struct_in_place.rs      |   39 +
 rust/pin-init/examples/error.rs                    |   27 +
 rust/pin-init/examples/linked_list.rs              |  161 +++
 rust/pin-init/examples/mutex.rs                    |  209 +++
 rust/pin-init/examples/pthread_mutex.rs            |  178 +++
 rust/pin-init/examples/static_init.rs              |  122 ++
 rust/pin-init/internal/src/helpers.rs              |  152 ++
 rust/pin-init/internal/src/lib.rs                  |   48 +
 rust/{macros => pin-init/internal/src}/pin_data.rs |    7 +-
 .../internal/src}/pinned_drop.rs                   |    7 +-
 rust/{macros => pin-init/internal/src}/zeroable.rs |   11 +-
 rust/{kernel/init => pin-init/src}/__internal.rs   |   46 +-
 rust/pin-init/src/alloc.rs                         |  158 +++
 rust/pin-init/src/lib.rs                           | 1486 ++++++++++++++++++++
 rust/{kernel/init => pin-init/src}/macros.rs       |  129 +-
 samples/rust/Kconfig                               |   11 +
 samples/rust/Makefile                              |    1 +
 samples/rust/rust_dma.rs                           |   97 ++
 samples/rust/rust_driver_faux.rs                   |    2 +-
 samples/rust/rust_driver_pci.rs                    |    2 +-
 samples/rust/rust_driver_platform.rs               |    2 +-
 samples/rust/rust_minimal.rs                       |    2 +-
 samples/rust/rust_misc_device.rs                   |    2 +-
 samples/rust/rust_print_main.rs                    |    2 +-
 scripts/Makefile.build                             |    4 +-
 scripts/generate_rust_analyzer.py                  |   17 +-
 scripts/rustdoc_test_gen.rs                        |    8 +-
 84 files changed, 5999 insertions(+), 1845 deletions(-)
 create mode 100644 rust/.kunitconfig
 create mode 100644 rust/kernel/dma.rs
 create mode 100644 rust/kernel/time/hrtimer.rs
 create mode 100644 rust/kernel/time/hrtimer/arc.rs
 create mode 100644 rust/kernel/time/hrtimer/pin.rs
 create mode 100644 rust/kernel/time/hrtimer/pin_mut.rs
 create mode 100644 rust/kernel/time/hrtimer/tbox.rs
 create mode 100644 rust/macros/export.rs
 create mode 100644 rust/macros/kunit.rs
 create mode 100644 rust/pin-init/CONTRIBUTING.md
 create mode 100644 rust/pin-init/README.md
 create mode 100644 rust/pin-init/examples/big_struct_in_place.rs
 create mode 100644 rust/pin-init/examples/error.rs
 create mode 100644 rust/pin-init/examples/linked_list.rs
 create mode 100644 rust/pin-init/examples/mutex.rs
 create mode 100644 rust/pin-init/examples/pthread_mutex.rs
 create mode 100644 rust/pin-init/examples/static_init.rs
 create mode 100644 rust/pin-init/internal/src/helpers.rs
 create mode 100644 rust/pin-init/internal/src/lib.rs
 rename rust/{macros => pin-init/internal/src}/pin_data.rs (97%)
 rename rust/{macros => pin-init/internal/src}/pinned_drop.rs (92%)
 rename rust/{macros => pin-init/internal/src}/zeroable.rs (88%)
 rename rust/{kernel/init => pin-init/src}/__internal.rs (84%)
 create mode 100644 rust/pin-init/src/alloc.rs
 create mode 100644 rust/pin-init/src/lib.rs
 rename rust/{kernel/init => pin-init/src}/macros.rs (92%)
 create mode 100644 samples/rust/rust_dma.rs
