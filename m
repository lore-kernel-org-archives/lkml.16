Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A211DA5F;
	Wed, 18 Jun 2025 12:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750249669; cv=none; b=Dpyv2P3qR179GmGhILZkQxPsFgUYFtUQX2PXWdcxyBHtBUb0MEldjKB1nFbO2FG/G0Y9usO9E3cEqB4Ra48jQDZUnSNNNWb8ajfhS0Amtt1PsZqm9vkhW5ki4YcoThLOK/zrBMuyA1I4yG2HsoD/5yAlpp9fHttgEkwXS69RUFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750249669; c=relaxed/simple;
	bh=bG1IsS6hMOeZLmXSaRSFPWeiiJE2wDS2Me7R6e5Xbsg=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BXugzgbhjDgjv7ktYsil0qGniAsHM/M5CUA2GH0TaTfBNsvEWCZLv3DB7EXhJmtl2CtmIejaSH6NLUcL3UGEsjOSD3FvSR3WyKEYx2Qf44lbxhImKuKFGXCdCJtWRKxUFc5hhe8KM40B9PEGzD+5gNYaPiVE0xT/qRiitGKNLaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=gSfgqVKq; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="gSfgqVKq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1750249658; x=1750508858;
	bh=j+X3ySHMY7CDB2I3Akroj+bloW3A9Lb14cdZC0C3wDE=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=gSfgqVKqoJPCZumVgMdPg7bpSzC4eQkRHENw2Z2klOelhylmjCtUY3sPV8fp8OaB2
	 NxRg0zWgQrufjp12x64f6wWhyZYIB4oAIP4X2x1rytwlcjWINpLdIADIZrwQ1nrsni
	 lK9qwYnSSArcp6uFWxGcLwlb7KXTsoig93nIEK7wS88FB+SdYcJQLkIHSqLX1xLtHt
	 HMYHha0ptT581ckS00fY53zlIL5dEb30ag0adFEkcOfvuWJq8RQIApFpKKQUVTS+1j
	 E+ara4ZyYkIdIceTQxlbwLeijuVJslTEjQA6rTnt5QhyDKwTE/zKTONFDEKo2wZAx7
	 i3wM5WF+O7WRw==
Date: Wed, 18 Jun 2025 12:27:33 +0000
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>, Asahi Lina <lina+kernel@asahilina.net>
From: Oliver Mangold <oliver.mangold@pm.me>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, Oliver Mangold <oliver.mangold@pm.me>
Subject: [PATCH v11 0/4] New trait OwnableRefCounted for ARef<->Owned conversion.
Message-ID: <20250618-unique-ref-v11-0-49eadcdc0aa6@pm.me>
Feedback-ID: 31808448:user:proton
X-Pm-Message-ID: 589d1348d116c1a40231fbf6c34596ed6e757e98
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This allows to convert between ARef<T> and Owned<T> by
implementing the new trait OwnedRefCounted.

This way we will have a shared/unique reference counting scheme
for types with built-in refcounts in analogy to Arc/UniqueArc.

Signed-off-by: Oliver Mangold <oliver.mangold@pm.me>
---
Changes in v11:
- Rework of documentation. I tried to honor all requests for changes "in
  spirit" plus some clearifications and corrections of my own.
- Dropping `SimpleOwnedRefCounted` by request from Alice, as it creates a
  potentially problematic blanket implementation (which a derive macro that
  could be created later would not have).
- Dropping Miguel's "kbuild: provide `RUSTC_HAS_DO_NOT_RECOMMEND` symbol"
  patch, as it is not needed anymore after dropping `SimpleOwnedRefCounted`=
.
  (I can add it again, if it is considered useful anyway).
- Link to v10: https://lore.kernel.org/r/20250502-unique-ref-v10-0-25de64c0=
307f@pm.me

Changes in v10:
- Moved kernel/ownable.rs to kernel/types/ownable.rs
- Fixes in documentation / comments as suggested by Andreas Hindborg
- Added Reviewed-by comment for Andreas Hindborg
- Fix rustfmt of pid_namespace.rs
- Link to v9: https://lore.kernel.org/r/20250325-unique-ref-v9-0-e91618c1de=
26@pm.me

Changes in v9:
- Rebase onto v6.14-rc7
- Move Ownable/OwnedRefCounted/Ownable, etc., into separate module
- Documentation fixes to Ownable/OwnableMut/OwnableRefCounted
- Add missing SAFETY documentation to ARef example
- Link to v8: https://lore.kernel.org/r/20250313-unique-ref-v8-0-3082ffc67a=
31@pm.me

Changes in v8:
- Fix Co-developed-by and Suggested-by tags as suggested by Miguel and Boqu=
n
- Some small documentation fixes in Owned/Ownable patch
- removing redundant trait constraint on DerefMut for Owned as suggested by=
 Boqun Feng
- make SimpleOwnedRefCounted no longer implement RefCounted as suggested by=
 Boqun Feng
- documentation for RefCounted as suggested by Boqun Feng
- Link to v7: https://lore.kernel.org/r/20250310-unique-ref-v7-0-4caddb78aa=
05@pm.me

Changes in v7:
- Squash patch to make Owned::from_raw/into_raw public into parent
- Added Signed-off-by to other people's commits
- Link to v6: https://lore.kernel.org/r/20250310-unique-ref-v6-0-1ff5355861=
7e@pm.me

Changes in v6:
- Changed comments/formatting as suggested by Miguel Ojeda
- Included and used new config flag RUSTC_HAS_DO_NOT_RECOMMEND,
  thus no changes to types.rs will be needed when the attribute
  becomes available.
- Fixed commit message for Owned patch.
- Link to v5: https://lore.kernel.org/r/20250307-unique-ref-v5-0-bffeb63327=
7e@pm.me

Changes in v5:
- Rebase the whole thing on top of the Ownable/Owned traits by Asahi Lina.
- Rename AlwaysRefCounted to RefCounted and make AlwaysRefCounted a
  marker trait instead to allow to obtain an ARef<T> from an &T,
  which (as Alice pointed out) is unsound when combined with UniqueRef/Owne=
d.
- Change the Trait design and naming to implement this feature,
  UniqueRef/UniqueRefCounted is dropped in favor of Ownable/Owned and
  OwnableRefCounted is used to provide the functions to convert
  between Owned and ARef.
- Link to v4: https://lore.kernel.org/r/20250305-unique-ref-v4-1-a8fdef7b1c=
2c@pm.me

Changes in v4:
- Just a minor change in naming by request from Andreas Hindborg,
  try_shared_to_unique() -> try_from_shared(),
  unique_to_shared() -> into_shared(),
  which is more in line with standard Rust naming conventions.
- Link to v3: https://lore.kernel.org/r/Z8Wuud2UQX6Yukyr@mango

---
Asahi Lina (1):
      rust: types: Add Ownable/Owned types

Oliver Mangold (3):
      rust: Split `AlwaysRefCounted` into two traits
      rust: Add missing SAFETY documentation for `ARef` example
      rust: Add `OwnableRefCounted`

 rust/kernel/block/mq/request.rs |  15 ++-
 rust/kernel/cred.rs             |   8 +-
 rust/kernel/device.rs           |   8 +-
 rust/kernel/fs/file.rs          |  10 +-
 rust/kernel/mm.rs               |  13 +-
 rust/kernel/mm/mmput_async.rs   |   9 +-
 rust/kernel/opp.rs              |   8 +-
 rust/kernel/pci.rs              |   6 +-
 rust/kernel/pid_namespace.rs    |   8 +-
 rust/kernel/platform.rs         |   6 +-
 rust/kernel/task.rs             |   6 +-
 rust/kernel/types.rs            |  62 +++++++---
 rust/kernel/types/ownable.rs    | 257 ++++++++++++++++++++++++++++++++++++=
++++
 13 files changed, 372 insertions(+), 44 deletions(-)
---
base-commit: e04c78d86a9699d136910cfc0bdcf01087e3267e
change-id: 20250305-unique-ref-29fcd675f9e9

Best regards,
--=20
Oliver Mangold <oliver.mangold@pm.me>


