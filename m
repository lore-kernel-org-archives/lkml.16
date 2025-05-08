Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4B5263C72;
	Thu,  8 May 2025 08:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746694382; cv=none; b=YKlCKMTjb1iGLMVQjGvJGd/7MGYhAeGOWqrxr6YDZ6kh8a6h2sdYoa6cGcPWhkqIB6xkJWc8fIICXVUtOsX2QAW51sVtZYjS5LnsvC5Fy0FWV1rTsqHZwNUvD9+YObBx1s1a1c7WwZamCsTfhau6On2uVdQWhOF0Qo3Jlnkk9+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746694382; c=relaxed/simple;
	bh=q9Mm+osJkSfYf2fN2TN4hTa8oit4e/8HvBZMv7k+Wl4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aX8fRDZZTJwsvFHKQrQgqXzPPrxAzscxuAy9Pim7Vf+da3QUTlxdvNbmEefu3aIYgLjH3W8XPk7lALG8crJhLpH/eYnE5Gmb231o36ybPoIMI+Wf+7DWuNL+0elvrss4iqvF9kndFWqztWJ+LX9zWB9X3T5dAJgFAkiWa6C6L98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eyte0FPz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eyte0FPz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93F2DC4CEE7;
	Thu,  8 May 2025 08:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746694382;
	bh=q9Mm+osJkSfYf2fN2TN4hTa8oit4e/8HvBZMv7k+Wl4=;
	h=From:Subject:Date:To:Cc:From;
	b=Eyte0FPzU7OaH53dPD0yz3Q/4o2wbrU2dgkmn0hOXmZAGW0yleRM+Ii6JXRvww6gt
	 j7uGDeQu3VY0bP8nwS0qY6ifZE4rM6VkA1PWfxttimUTKGJVOZf/Rd8aItG29OyPkY
	 eFRKqZNIZdbDfoASUXOC29+PcEuAoi79XtWFIElULNnYo0PlhtijPa2ANVDfrtzdLl
	 wPxhqg5lQWOjpjQljPcjGU1MRXwBvyCem0vxryorhvUpHPV7R/AbodI9fgJYxF4zFR
	 kRSVYnQMsXKz7ohMGZ8rJ1x00W85kemgn7XXVikMZvDZcCiqDebMKlK9gKW66Ky/cI
	 Vrg51u8Pk15QA==
From: Andreas Hindborg <a.hindborg@kernel.org>
Subject: [PATCH v8 0/3] rust: configfs abstractions
Date: Thu, 08 May 2025 10:52:08 +0200
Message-Id: <20250508-configfs-v8-0-8ebde6180edc@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALhwHGgC/23RwU7EIBAG4FfZcLaGAQpTT76H8VBg6BJNu9K10
 Wz67k7XQzH1OBO+n8nMTcxUMs3i6XQThZY852nkAh9OIpz7caAmR66FkqqVoKEJ05jykObGI2K
 IqCKaXvDzS6GUv+5RL6+/daGPT0687s1znq9T+b5/t8DW/Sd5gUY26DrjLICREJ7fqIz0/jiVQ
 Wwpi9qlkq6SimVyvZVemaiRDlJXErCSmqUkI4N0DgHdQZpKKlNJw7LrU+db4nmTPci2lvW0Lct
 gJGEM2nchHqTdJe+okpaltcECeWe1xYN0tWwr6bbd+pCMC5D4hn/kuq4/uHj86hICAAA=
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5089; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=q9Mm+osJkSfYf2fN2TN4hTa8oit4e/8HvBZMv7k+Wl4=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBoHHDG6s84g9ZXORtcGgqGKyenqZu9xxpDI8CZk
 oJDDPX666eJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaBxwxgAKCRDhuBo+eShj
 d7EBEACnxvACDIdkdYwxOum+b7DAwSCn1Ls983Cfp7WMmS9Gq3ErxYk4b32BCQXfoHi4yr5NEwA
 kixfkTOTYQToZCB6lDq0FnbHeNc/TW+4Fjir338dxibOTn+T+o2AIFGbXifkts0Rq9YTEKboYGs
 OAT46GJLVGtm4K3lKxf85RyvW87GcMjFOdwuq5HhYUE06Bg29MtCmoOZQdqyrAybx6uPwk6M20N
 TwwcJgrJfM2vcNrn7PwzTTTg2fiGn2ObHMK0yH5fUYdACpRH0ypYvPQbj3VNG/o5wfzhr3va0t2
 3lNV8c/goMKXkrMgXYE7HQ6FXxW+rWgeIaDS4lTWspY8bqtmhH0QQ5d8Ss+I3QG968TJ/SW7spe
 DIk8vx/djo+3CXdYO2B6sWZlyZD/0jBH99xxxq6Yv0tkCYYOlNqmbxUUbYmgtwlLivHvZUCUa7i
 uJEXDZhAVdq5WGoJc/i/+k5Ne/9OkaKZoAoYhDLYVKu1VzC4zgxYJfTxF/e+eQlSJBfl/sCtk9o
 dt3uCfSYPIfv7phUQ24L7m656+1tefmtfPWUfh1Mo+puEUsb+0A7oqOxEXisfqwUtPCCnMSfNMa
 FS7WTd8sIx/PGNNRhdebxtKK8cw8EvwnhbvpYsGeBakCYk+U5/GSuDgKT76RxpiuTfdv81R/7Es
 RcX19G1lbxE83/g==
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
Changes in v8:
- Fix a reasoning error in the safety comment framework for
  `AttributeList::add`.
- Link to v7: https://lore.kernel.org/r/20250505-configfs-v7-0-8bcf47c1fb88@kernel.org

Changes in v7:
- Update documentation: Consistently apply code spans, add inter-doc
  links, fix typos and improve indentation.
- Use a const block to verify attribute index.
- Link to v6: https://lore.kernel.org/r/20250501-configfs-v6-0-66c61eb76368@kernel.org

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
 rust/kernel/configfs.rs         | 1049 +++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |    2 +
 samples/rust/Kconfig            |   11 +
 samples/rust/Makefile           |    1 +
 samples/rust/rust_configfs.rs   |  192 +++++++
 8 files changed, 1263 insertions(+)
---
base-commit: b4432656b36e5cc1d50a1f2dc15357543add530e
change-id: 20250131-configfs-b888cd82d84a

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


