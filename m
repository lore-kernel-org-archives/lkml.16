Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F050C233156
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 09:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746176558; cv=none; b=uGPQUuDf6Si2XiSihjZvXSL/mH5v/sEfJAY3Qb9FFsN2+XmZ0D2CzS8eS1HF+B7u623JPHwg2drBAV42ja0nawgjIyiY6z8Wd++xQm6zlP3LYbrskZ6di+kxrCFE2RCbrbtu2g0wydYfunULcayEgIMV5e5tHztSC9UZEyfR10E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746176558; c=relaxed/simple;
	bh=blBc9EYP00Ui1QT4J1mKGkD50fFJw2g0/khThw8sp+s=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GBizi95i4qcHFtR7Kfys1wtXDSF6vuzZGb9MuDgNVg5eh9hIeCPPOxkgYz0KolLqEjiv0/iVnVLKfqCqGNGrqV1U7AZ6xY8xpx/T6oVxC1HESpeM9stBcWGHyWOxbvhMXTjKn8leRNiIXTsoaITwIb1HGjksKTXtcBm5+rOkef4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=gIcTn+a4; arc=none smtp.client-ip=109.224.244.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="gIcTn+a4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1746176546; x=1746435746;
	bh=gMBL1NtQLjZkB9sTrHWY5Q0XkiPGHGGIkQam4pGYf3g=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=gIcTn+a4I25NuN1Le0QsLNbHvl6i8s/LwyiksWhVHTKkzPLeBbVU8nuF7MYUrTTel
	 axME7rjca+P7JRdzikSDSlHOCqJh/SbVcYdH9IUnoSVgNxqmxkQd6l80nby9SIvXlT
	 yeEFucL0B8WW0i35bg1aY5i7ZquTyKBufhjAnlf6Zin4vMRzDWcQhnD4R2NPyjSZpA
	 G7Ru8XazvH2hrQSg3XcFbDoNWsH9E60TkEsSHt96Ri2Dkb2V8DBbCWxEw3vduhVCmG
	 O6fUnMUoeWEbD/zVJ9RmpmxheUX3tgvxv9GucnHZNClzZcXJTy/ujID2t0fPhowhgI
	 6MOFvLke7WN+g==
Date: Fri, 02 May 2025 09:02:22 +0000
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Asahi Lina <lina@asahilina.net>
From: Oliver Mangold <oliver.mangold@pm.me>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, Oliver Mangold <oliver.mangold@pm.me>
Subject: [PATCH v10 0/5] New trait OwnableRefCounted for ARef<->Owned conversion.
Message-ID: <20250502-unique-ref-v10-0-25de64c0307f@pm.me>
Feedback-ID: 31808448:user:proton
X-Pm-Message-ID: c33716caed18d34aaf4b84873147158f75e27933
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

Miguel Ojeda (1):
      rust: kbuild: provide `RUSTC_HAS_DO_NOT_RECOMMEND` symbol

Oliver Mangold (3):
      rust: Rename AlwaysRefCounted to RefCounted
      rust: Add missing SAFETY documentation for ARef example
      rust: Add OwnableRefCounted and SimpleOwnableRefCounted

 init/Kconfig                    |   3 +
 rust/kernel/block/mq/request.rs |  10 +-
 rust/kernel/cred.rs             |   8 +-
 rust/kernel/device.rs           |   8 +-
 rust/kernel/fs/file.rs          |  10 +-
 rust/kernel/pci.rs              |   6 +-
 rust/kernel/pid_namespace.rs    |   8 +-
 rust/kernel/platform.rs         |   6 +-
 rust/kernel/task.rs             |   6 +-
 rust/kernel/types.rs            |  56 ++++---
 rust/kernel/types/ownable.rs    | 361 ++++++++++++++++++++++++++++++++++++=
++++
 11 files changed, 448 insertions(+), 34 deletions(-)
---
base-commit: 8ffd015db85fea3e15a77027fda6c02ced4d2444
change-id: 20250305-unique-ref-29fcd675f9e9

Best regards,
--=20
Oliver Mangold <oliver.mangold@pm.me>


