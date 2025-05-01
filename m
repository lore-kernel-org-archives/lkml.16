Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBF321CC5C;
	Thu,  1 May 2025 10:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746094545; cv=none; b=NXlgt6buTYd2DI49jNF+22eJDqoXu8eiatQ3k4oAaCdpdSM1lZmXHyv/aY6/6evvuorQ7Zu2pZpe/xHPLoU6y3SYSaPPTwrK07HZal7EnU4BEAwGyf0UvWswo3jkh86dwrHXUe0+K4PS4iiPBB9NCRAzuWBoPc84RHBsiqOosNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746094545; c=relaxed/simple;
	bh=cf6QspFmOctcp+BrktXEQumQ3+aTNgSSmZSekp5ctBY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CdToP6avbvQ4pDgt+5eC1lPM7zFs/yOEDR4G9gzDdDSFdDgnFFCOWrWapCFuSAkWP/4T+iEgodV1VijyVBaqLXd/k3sdNEHD0DDynk4ugL2gHdTPTT00qXvlUpMYvNI7r8jCpZVPkCAHlXiXw7VBL8IubuPJVF/4nYuDt577Ing=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HEvvUauj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HEvvUauj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E872EC4CEE3;
	Thu,  1 May 2025 10:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746094544;
	bh=cf6QspFmOctcp+BrktXEQumQ3+aTNgSSmZSekp5ctBY=;
	h=From:Subject:Date:To:Cc:From;
	b=HEvvUauj80EWXyNqDrDsJLeLaOkedro3AKA9TTHL3FMZyK5uxwrVbMz2jkTxY3dfj
	 N5nh8C+LqehpLV4PlwXB7fx0DNH+ceK09faU86D/txv5zXEqdIONKwhaxy0y3TmnPm
	 hegSm7EA8KgCGB+fGWZphwl4TlRYdNoRgmxjvuLdr7pnjoR5u6rmG6p/AMI3ejLX2A
	 PX/BKQanRalVQ0pCTBEL27l8emAc26PSnFxchm96kxQQruCvSkfkru1/ufEVG2/g10
	 QXLV2FcubEkrNvIf1kQ5vT3m1ga0FVXWAXx0n5+oLFw5NSTCMQTrGDhrD+fJSfl3rm
	 WPyXaGrUGfpUQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Subject: [PATCH v6 0/3] rust: configfs abstractions
Date: Thu, 01 May 2025 12:14:35 +0200
Message-Id: <20250501-configfs-v6-0-66c61eb76368@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAItJE2gC/23OwW7DIAwG4FepOI/KgBOcnvYe0w4JmBRtSlroo
 k1V3r20O5QpO/6Wv9++iswpchaH3VUkXmKO81RC+7IT7thPI8voSxYadAPKKOnmKcQxZDkQkfO
 kPWEvyvopcYjfj6q399+c+PxVGi/P4THmy5x+HucWdZ/+07woCZJsh7ZVCkG51w9OE3/u5zSKe
 8uin1KDraQuMti+hUGjN8QbaSqpqJKmSGAEB9aSIruRWEmNlcQiuz50Q8Pl39BuZFPL+tumSIf
 A5J0ZOuf/yHVdb3/BUrKeAQAA
X-Change-ID: 20250131-configfs-b888cd82d84a
To: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Joel Becker <jlbec@evilplan.org>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
 Fiona Behrens <me@kloenk.dev>, 
 Charalampos Mitrodimas <charmitro@posteo.net>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Breno Leitao <leitao@debian.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4628; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=cf6QspFmOctcp+BrktXEQumQ3+aTNgSSmZSekp5ctBY=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBoE0mjddjbIx+Z2ILzJsTvlFU1a3yzSygXj0WzK
 NtuT8Gx/OWJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaBNJowAKCRDhuBo+eShj
 d040D/4k4OUPCa1eWNnlEOfaz17k/jJyzIIuVUDMIYGMckxdtwA94WXTfSDwPpsgWoaGKNiuP6+
 MF7hPpiI+lEoWpmEaFOSJoAJIat9cTinEpW21DHYqSvANHJgVGxmKB1pZNlOhY1UuhPm94reDCt
 hsUHfBWqkuQvl36zdlkSI3xjR27QzHsbNHEWwUODjhieoN/GDL0zjenREVFsD0A90Z8HN5K/xbD
 UxaSGCFTRdgEEZ94/2/b7Kt06iwaomNJLNENiwxhCe2eGJ6WYu7M9SgFsMs5NbYqxVcm++NeG4R
 lQj2Qb3n260sMZHEHUAKPIvk+rnWccpjJsaFSJ0pd7PYVZckvyg3Nahoc8pP9mXt2RfPCy4M1kz
 HR4ME+6VcIIFv8pacSNvbLsIN5jH0gBzhfxlJ5XZl3GP+Qu81v9WIkMtXw56ugVjBRrRKgbFfKJ
 cE3Lyy2oxXcp7qqUQ62wvgcIcQ+NdZJQ6Zpj7H2wjvxXSU3bDR0wSrlZr/2FNbcKv6kGX/N9ERg
 jsI6NivwKsTjcehRZ4OagqFGaZcQ5/6j4ORMUrsq49bu5kDpYdiWhms+rks+5Kf1s3hJVxJrzPs
 9sBU7ANPzLhM4/5X8pSyxkQ4Z514rm4PWOxhw/7hG55iXNF7r0fh3O+hSQTxSCVxtsdcrusvZYz
 TkOQe4PAbO8BKDA==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add a safe Rust API that allows Rust modules to interface the `configfs`
machinery.

Add an example for the samples folder to demonstrate usage of the API.

Add a maintainer entry for the Rust configfs abstractions in the last patch, to
make it absolutely clear that I will commit to maintain these abstractions, if
required.

The series is a dependency of `rnull`, the Rust null block driver.
Please see [1] for initial `configfs` support in `rnull`.

[1] https://github.com/metaspace/linux/tree/9ac53130f5fb05b9b3074fa261b445b8fde547dd/drivers/block/rnull

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
Changes in v6:
- Use `&raw const` and `&raw mut` instead of `addr_of!` and
  `addr_of_mut!` macros.
- Drop use of `ForeignOwnable`.
- Link to v5: https://lore.kernel.org/r/20250227-configfs-v5-0-c40e8dc3b9cd@kernel.org

Changes in v5:
- Remove `as _` casts.
- Document `ID` type parameter of `AttributeOperations`.
- Add documentation at macro call sites in example.
- Add example expansion of `configfs_attrs!`.
- Move trait bound in `AttributeList::add`
- Improve safety requirement for `AttributeList::new`.
- Fix a copy/paste error in print in sample.
- Clarify use of `{}` for empty struct in sample.
- Improve documentation for `AttributeList`.
- Remove `kernel::` prefix from `container_of!` invocation.
- Reword safety comment in `get_group_data`.
- Correct commit message in relation to unstable feature additions.
- Use imperative language in commit messages.
- Consistently capitalize the word "Rust" in commit messages.
- Explain that "drop" in `GroupOperations::drop_item` is not related to Rust
  drop.
- Link to v4: https://lore.kernel.org/r/20250224-configfs-v4-0-9af9b5e611f6@kernel.org

Changes in v4:
- Fix a build issue by depending on v18 of "rust: types: add `ForeignOwnable::PointedTo`"
- Link to v3: https://lore.kernel.org/r/20250218-configfs-v3-0-0e40c0778187@kernel.org

Changes in v3:
- Allow trailing commas in invocation of `configfs_attrs!`.
- Use a more suitable C initialization function when initializing `Subsystem`.
- Split sample into separate patch.
- Add an inline example.

The remaining changes in this version are style fixes, documentation
improvements and typo fixes. They are enumerated below:
- Consolidate `paste` macro calls.
- Do not hard code page size in example.
- Remove prefix of `c_str!` in sample.
- Use a more descriptive variable name in `into_foreign`.
- Improve code formatting in macros invocations.
- Add comment related to null terminator in `configfs_attrs!`
- Move attributes below docstrings.
- Remove a rogue todo.
- Remove trait bound from struct definition `GroupOperationsVTable`.
- Remove `as _` casts.
- Remove `GroupOprations::Parent` associated type.
- General documentation improvements.
- Explicitly use `ArcBorrow` for `drop_item` parameter type.
- Add a comment describing expansion to a call to `Attribute::add`.
- Add a comment explaining bound check in `Attribute::add`.
- Link to v2: https://lore.kernel.org/r/20250207-configfs-v2-0-f7a60b24d38e@kernel.org

Changes in v2:
- Remove generalization over pointer type and enforce use of `Arc`.
- Use type system to enforce connection between `ItemType` and
  `Subsystem` or `Group`. Differentiate construction of vtables on this
  type difference.
- Move drop logic of child nodes from parent to child.
- Pick `ForeignOwnable::PointedTo` patch as dependency instead of
  including it here.
- Fix some rustdoc warnings.
- Use CamelCase for generic type parameter declaration.
- Destroy mutex in `Subsystem::drop`.
- Move `GroupOperationsVTable` struct definition next to implementation.
- Rebase on v6.14-rc1.
- Link to v1: https://lore.kernel.org/r/20250131-configfs-v1-0-87947611401c@kernel.org

---
Andreas Hindborg (3):
      rust: configfs: introduce rust support for configfs
      rust: configfs: add a sample demonstrating configfs usage
      MAINTAINERS: add configfs Rust abstractions

 MAINTAINERS                     |    2 +
 rust/bindings/bindings_helper.h |    1 +
 rust/helpers/mutex.c            |    5 +
 rust/kernel/configfs.rs         | 1048 +++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |    2 +
 samples/rust/Kconfig            |   11 +
 samples/rust/Makefile           |    1 +
 samples/rust/rust_configfs.rs   |  192 +++++++
 8 files changed, 1262 insertions(+)
---
base-commit: b4432656b36e5cc1d50a1f2dc15357543add530e
change-id: 20250131-configfs-b888cd82d84a

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


