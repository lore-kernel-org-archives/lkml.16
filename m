Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24536248894;
	Mon,  5 May 2025 12:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746447456; cv=none; b=pAXNcidO3alhK3II1zMEGriw9iNrOSLTWLzm3TqH1Iocx3KdJg28AsTU2g6bdEY+qfGdd6mSpqdyHVgW8HVfunvohm//eMOr+T8fNGVL7ChKpKKtGvwSRX5Vfc9s2v7ss/8m5a4ecq6rPZTF+Aoqg+O/hsHgEO8i0MWeeJ8uEgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746447456; c=relaxed/simple;
	bh=lt52mTC1x8UbhROEsxMJgLLEtXUtEZeUhBBzJ+KZ3vc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=M81GOlOnmafYt1FU+KwZim/aCmDao1ib8twfnpNVHM7mQAN500NXIrU7JdyGL/byLhaY9nJRN+lXkHKMlhIagzNFLyEpBGuWR51p0yrXfltbi7sjYDVIWm05O4tCXQyQP0agA9sOyrd0ePWuPuEXRji5+vFhR4SHF+k7dD/+5xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dF1NpNpw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dF1NpNpw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F4B8C4CEE4;
	Mon,  5 May 2025 12:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746447455;
	bh=lt52mTC1x8UbhROEsxMJgLLEtXUtEZeUhBBzJ+KZ3vc=;
	h=From:Subject:Date:To:Cc:From;
	b=dF1NpNpwiYQfp/CjovcCyAiUd74beKGAk9PmRMwbACtZXHTGVmuuDTQn52Y59+Ug0
	 fZI8s4S9sc1Mb4WY85/UWV1y30QnIE4IgE7WZH70qnW8w5ajwEwDmj5SoTsfdEQVQc
	 oGOE4UEh0Hqu1jEkKr9qdvBagA3O8+56zJW4qzxHz9q3eqNjmFzQwJwE8jRVN1QJYr
	 yBK2JeK/v6qL+IQAE4qBFqyhF4jZbiXFo0niocGzzm7YQpQ5/Td+0X00Hgb8P9Szi/
	 RXvf3O+TOitJeb4/NLSQ3oQz/AR/w/5kEFvms+UFMq5aNFPYLvMt+00tOV0t46w1OL
	 3kDFD6+hswZQw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Subject: [PATCH v7 0/3] rust: configfs abstractions
Date: Mon, 05 May 2025 14:16:55 +0200
Message-Id: <20250505-configfs-v7-0-8bcf47c1fb88@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADesGGgC/23QTW7DIBAF4KtErEvFn2HcVe9RZWFgcFArO4XEa
 hX57p2kC1O5yzfie4zmxiqWjJW9HG6s4JJrnicK7unAwmmYRuQ5UmZKqE5ILXmYp5THVLkHgBB
 BRTADo+fngil/Parejr+54OeVGi/b8JTrZS7fj+8WeZ/+07xILji43jgrpREyvL5jmfDjeS4ju
 7csapNKuEYqkskNVnhlogbcSd1ICY3UJAUaEYRzIMHtpGmkMo00JPsh9b5D2jfZnexa2W7bkQx
 GIMSgfR/iTtpN0o0aaUlaG6xE76y28Eeu6/oDFiDSGtgBAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4897; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=lt52mTC1x8UbhROEsxMJgLLEtXUtEZeUhBBzJ+KZ3vc=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBoGKxAy+bk+mQXVl19Yn8gmh6GYITH5VFZV78Cc
 noiXosUsQiJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaBisQAAKCRDhuBo+eShj
 d3KtEACW/GpcEJFMFzBUvmlQLKXy/f1k9Vh2iHfsvP6/agc3kUJ5wkG2tSQMK7hpFSuHlE42Til
 RxX2HhNp19vuYuKAqxP40hgxvu461V6V3h56oJ1IDb+0qMl0T62dWXwIt5NRk8I4LxZw+TJOMyn
 VSuR2j3c0Qy5k0HPdPFBdpNaDF2FnvnLUTINzNKS3SXBBDXA/ZVAkuFnLLxF/1ZMTZXBNny9NQo
 S00xDMbHaJnqsxvXFJ0BB1lQa8PcjI4rOAIccIgiE54q0d/jz2EnevfQJXV/ispsP0bC6oIYGYe
 FaT7DoKhxuh3BIFCv/P1jU9oW0SSbfkzccYMheDcnsBO1oMZkojkvrkaTRnDHKn7+VOg4L5N/ce
 R6sGFSo57iJkkp4j0b5SdDy2/C/9Bgm54mqaFo9iDQGqmO4pds24+WETSvh6VcoUprWVq0duqmF
 LHTXJv9xX3AZop4kDiJG3iiTzLHP86Fz2frZzF+NecdevPb08ZljfHQMJx97v++9X5N2tsZMlap
 eLSAY32yg7D+jdgt2G2A3mpC3Pk+ZqrwRg4pTl+c7P919gh4HlKs5KVyWANtpbYnccft1PZjMV8
 hQ2IP4qa68NKOuYB1W2MTXkvuN1k2qk9tUPnecGZJvCB7Y9fEaJB+DanjbiGYUcPDJz6hjgtKMf
 7hzXdSWgZj6Y0hQ==
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
 rust/kernel/configfs.rs         | 1046 +++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |    2 +
 samples/rust/Kconfig            |   11 +
 samples/rust/Makefile           |    1 +
 samples/rust/rust_configfs.rs   |  192 +++++++
 8 files changed, 1260 insertions(+)
---
base-commit: b4432656b36e5cc1d50a1f2dc15357543add530e
change-id: 20250131-configfs-b888cd82d84a

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


