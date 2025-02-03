Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86757208995;
	Mon,  3 Feb 2025 15:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738595409; cv=none; b=OL3aN7IxSeGeY3zWfZBZ0QZad5IhkxyqkeRyDEXWgKg+th+9AoGLfiXPo5BZPFo1XTqVJsWMtQ9phIh7V5+GI+eyCUnO4sRAmSIVr4yJSY0ZyM7ML1As8TmifmSVM+CTLHGltg838vT3tZyHh5YsO24iRhHq7fdjrjG2UtsiDnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738595409; c=relaxed/simple;
	bh=hr93k45ApK65duFLDXn4mylMXN6TkJzuhULGCURn7bA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BTxwlcF57LmW+h16Hk5HnNTlLkULdX+KdyFEn6tv5tv7chApHJjJfXCBG9Ue4SVLBD/Gbp3z3DTsgLDwHaVuKXku6958Fkf5NRduGTXGaddIdItmoNyslHPuVUEJpcafy7t9OntREi3pgKXhmwvnPXlBYZjaUWOEREPqdb3qmS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DvL5F9vr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DvL5F9vr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5131C4CEE6;
	Mon,  3 Feb 2025 15:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738595408;
	bh=hr93k45ApK65duFLDXn4mylMXN6TkJzuhULGCURn7bA=;
	h=From:Subject:Date:To:Cc:From;
	b=DvL5F9vrAaYoTb75zLulBJkJimkdOw5qwXPWrBxKb6m6YcGcBHSeRPZqXYPaWwZf9
	 kePqnNahK4O6P3+t5IilQAxtv3AeRB5kms9x8M7AfXem+aiDxCdiMrCsD1n08T3oC3
	 VyYOEscNTWrcVEPTBFtOyH6Qc9K23Uk50EyC54PDWC/zsKNJlhNotQEgItOxW1ppGO
	 fxJ3lmwSErlXPkR8aN1G+sCXbeoGsiieyuSBFfdFyeQgWtnxGWG1nI2O/Txx9tHijP
	 d7mOoADDD+GDQZemRgsR9r9Rsm9OCAJV3Vf/nvEHSS1CuJMkup9bm3gEganodEVoP+
	 92aPj7IU7JFPw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Subject: [PATCH v7 00/14] hrtimer Rust API
Date: Mon, 03 Feb 2025 16:07:46 +0100
Message-Id: <20250203-hrtimer-v3-v6-12-rc2-v7-0-189144725399@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMLboGcC/3XRQW7DIBAF0KtErIsFAwwmq9yj6gLwOEap7QS7V
 qsody9J1KZq5B0f6b8Zac5sopxoYtvNmWVa0pTGoQT7smGx88OeeGpKZiBASyEt7/Kcesp8UXx
 BLoHnCBykaSIGiS60rFSPmdr0eWNf30ru0jSP+es2ZZHX3xsoNBjhNCpdAQJazSUf+rTrafbT0
 UeqmgO79hd4dJy0AGCVqyS4GqwpJV91aWjCmPe7A+WB3qvyvDfVb3N9/RIEN85bE0PQuvFPin4
 oIHBF0UXBGOqo0Cqs4Ukxf5TVXUxRgtIRhI8Qg31S8EcxQkqxomBRWisbI1qJ+t8ul/uJMp0+y
 sHn+51Y8BPxOPZ9mrcbEFJHZ3xLkUiRxei1N+gMeqeQQEGtWmFCwS7fAFeiE0UCAAA=
X-Change-ID: 20241017-hrtimer-v3-v6-12-rc2-215dc6b169bf
To: Miguel Ojeda <ojeda@kernel.org>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Danilo Krummrich <dakr@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Lyude Paul <lyude@redhat.com>, 
 Guangbo Cui <2407018371@qq.com>, Dirk Behme <dirk.behme@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5468; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=hr93k45ApK65duFLDXn4mylMXN6TkJzuhULGCURn7bA=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBnoNvKg363zc+BX3WP4m5VwShx8zn+T4uOUHWCg
 11L+PG6tzyJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ6DbygAKCRDhuBo+eShj
 d1voEACGgbqYHd3ElVGZtLx09MeIbbl3Ss83V6amWHqGhAj2zO3FvcGFZYeEKsax+vQ7+OwtShK
 kUeC/wY52EVIJFPts5V4P2O+xe8oDNtcuc/ET9ZvnlPI/Q2kbJkBYU8D3iAQP6TFCaAeTR79/4q
 XLSJ2CizEwshiUSwUMpjfLO+N5FLv6ZBd1BEICed90vmNbRsCTwyBuGDzJoahPyT9diAtzDLD7i
 WDrXLMVBbxNmfs363uhZSmqE226hC+R1znrA9K1Lj55BOc3gLKCaJ1J/5eiOqCg8jq8w4eJzkIF
 aWx9tWDSYPD2Nwc716oKoFZ7YO5YSV6CpthreyIF8eskanitsolm+HL9B1Y4NSDENbl8cJrqAYo
 q5V/iO/GR1fMzVOGnmHWa7VcXI50oe/Nwffpd7KAsO17RDBniIlzY9WrVwcrrJmTjMd2Nz3Nfh4
 HiHmYXWjNmJMoSPe9HFCQdalkSlTKsiVfAZQ1choUZnpSD0O+aUHKOJXYd/rLzoR0aCJCDavDpw
 yS6BZ+t6wmEgZ/wlFh67ElMTfVmsFLJvFT/U3QvppZQSg+x0Uq4AoBUMTUNwePHvfQxuE/zhu+b
 xNJIlBjl7MePNgWgoILZ3UqOYCHOoZYE0k9NTOU813AWswmHTObip20OsSr1pDF5qMxaF7cauDF
 eZ55/p1EC+J2riQ==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

This series adds support for using the `hrtimer` subsystem from Rust code.

The series adds support for timer mode and clock source configuration during
timer initialization. Examples and functionality to execute closures at timer
expiration has been removed, as these depend on either atomics [3] or
`SpinLockIrq` [4], which are still being worked on.

This series is a dependency for unmerged features of the Rust null block driver
[1], and for rkvms [2].

Link: https://git.kernel.org/pub/scm/linux/kernel/git/a.hindborg/linux.git/log/?h=rnull-v6.11-rc2 [1]
Link: https://gitlab.freedesktop.org/lyudess/linux/-/tree/rvkms-wip [2]
Link: https://lore.kernel.org/rust-for-linux/20240612223025.1158537-1-boqun.feng@gmail.com/ [3]
Link: https://lore.kernel.org/rust-for-linux/20240916213025.477225-1-lyude@redhat.com/ [4]
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
Changes in v7:
- fix a typo in commit message for "rust: time: Add Ktime::from_ns()"
- fix a typo in safety comment in `HrTimer::new`
- fix a typo in `HrTimer::raw_cancel`
- fix a typo in the vocabulary
- fix a typo in `HrTimerCallback` docs
- refactor module documentation
- add an ascii state diagram to module documentation
- specify reason for adding `Arc::as_ptr`'
- change `boxed` to `this` in `Box::into_pin`
- change `from_ns` to `from_nanos` to align with std
- imporove safety comment for `impl Send for HrTimer`
- remove useless paragraph in docs for `HrTimerPointer`
- rephrase docs for `HrTimerPointer::TimerHandle`
- update docs for `HrTimerCallback::CallbackTarget`
- explain how users should use safe functions for cancelling a timer
- rename generics for consistency
- remove a note about storing mode in `HrTimer` - this is still required
- rebase on v6.14-rc1
- Link to v6: https://lore.kernel.org/r/20250110-hrtimer-v3-v6-12-rc2-v6-0-f71d50f16482@kernel.org

Changes in v6:
- prefix all hrtimer related type names with `Hr`
- add a few links for type names in the documentation
- Link to v5: https://lore.kernel.org/r/20241217-hrtimer-v3-v6-12-rc2-v5-0-b34c20ac2cb7@kernel.org

Changes in v5:
- Fix a typo in `impl_has_timer`
- Implement `Box::into_pin` in terms of `impl From<Box> for Pin<Box>`
- Link to v4: https://lore.kernel.org/r/20241206-hrtimer-v3-v6-12-rc2-v4-0-6cb8c3673682@kernel.org

Changes in v4:
- rebase on v6.13-rc1 and adapt to kernel `Box`
- add a missing safety comment to `hrtimer::start`
- use `hrtimer_setup`
- fix a build issue when `bindings::hrtimer_restart` is signed
- fix a memory leak where box was not destroyed
- fix a documentation typo
- remove `as` coercion at multiple locations
- use fully qualified syntax when invoking `deref`
- move `hrtimer` into `time` module
- Link to v3: https://lore.kernel.org/r/20241017-hrtimer-v3-v6-12-rc2-v3-0-59a75cbb44da@kernel.org

Changes in v3:
- support timer mode selection
- support clock source selection
- eliminate `Arc::clone_from_raw` in favor of using `ArcBorrow`
- make `Arc::as_ptr` an associated method
- update safety requirement for `ArcBorrow::from_raw`
- remove examples (pending `SpinLockIrq` and `CondVar` patches)
- remove `start_function` (v2 `schedule_function`, pending `SpinLockIrq` and `CondVar` patches)
- change function naming from schedule/armed to start/running
- add vocabulary to documentation
- update safety comment in `Arc::as_ptr`
- Link to v2: https://lore.kernel.org/r/20240917222739.1298275-1-a.hindborg@kernel.org

Changes in v2:
- use a handle to own the timer callback target
- add ability to for callback to reschedule timer
- improve `impl_has_timer` to allow generics
- add support for stack allocated timers
- add support for scheduling closures
- use `Ktime` for setting expiration
- use `CondVar` instead of `AtomicBool` in examples
- rebase on 6.11
- improve documentation
- Link to v1: https://lore.kernel.org/r/20240425094634.262674-1-nmi@metaspace.dk

---
Andreas Hindborg (13):
      rust: hrtimer: introduce hrtimer support
      rust: sync: add `Arc::as_ptr`
      rust: hrtimer: implement `HrTimerPointer` for `Arc`
      rust: hrtimer: allow timer restart from timer handler
      rust: hrtimer: add `UnsafeHrTimerPointer`
      rust: hrtimer: add `hrtimer::ScopedHrTimerPointer`
      rust: hrtimer: implement `UnsafeHrTimerPointer` for `Pin<&T>`
      rust: hrtimer: implement `UnsafeHrTimerPointer` for `Pin<&mut T>`
      rust: alloc: add `Box::into_pin`
      rust: hrtimer: implement `HrTimerPointer` for `Pin<Box<T>>`
      rust: hrtimer: add `HrTimerMode`
      rust: hrtimer: add clocksource selection through `ClockSource`
      rust: hrtimer: add maintainer entry

Lyude Paul (1):
      rust: time: Add Ktime::from_ns()

 MAINTAINERS                         |  10 +
 rust/kernel/alloc/kbox.rs           |   6 +
 rust/kernel/sync/arc.rs             |  13 +-
 rust/kernel/time.rs                 |  10 +
 rust/kernel/time/hrtimer.rs         | 535 ++++++++++++++++++++++++++++++++++++
 rust/kernel/time/hrtimer/arc.rs     |  87 ++++++
 rust/kernel/time/hrtimer/pin.rs     |  95 +++++++
 rust/kernel/time/hrtimer/pin_mut.rs |  97 +++++++
 rust/kernel/time/hrtimer/tbox.rs    | 102 +++++++
 9 files changed, 953 insertions(+), 2 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20241017-hrtimer-v3-v6-12-rc2-215dc6b169bf

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


