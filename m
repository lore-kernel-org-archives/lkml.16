Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DD420F079
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 22:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745273916; cv=none; b=XTjW97WHmW8kHZSoyn7bnVrGF1JvyUC6FqrRzktHk6WXKrt1wBM0P1tnuf/6fKvyU/iJImdPgGdKqFTOznml9UHAljZWLr6Z8GV0ECemMv/cmEZjzBNP9AfHBuDHa3XEIV1mzMYX+JpSx373yq2Fphs9cMDRNvKnZQ6fpo3zhT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745273916; c=relaxed/simple;
	bh=5R/oBOoWSaSiOsfivYaq++8IRBo9a30lbWZgmDUFS48=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NRMv49WD26K963dC1v2Oc9w8WDX8Lyb8JF6b+nMCYDoyzCPJkYxFhqX1HGe1b4RJJm/XDOCFt9tKAt89WJlQNM4S9eFuddfniTrHMwrTPkseNsGeDSjuhYkHnLFD5oK1wtPWRZ9N6QppZ6eEPSn3S4clej5m2xK6WVbobnMVGPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=nMOtciHU; arc=none smtp.client-ip=109.224.244.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="nMOtciHU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=vx5sru3p6bhslo26a666ja2ma4.protonmail; t=1745273913; x=1745533113;
	bh=nnQKNISKhWgt+1NrdjkJr6X9JzCC/znmVW6lmjlesjU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=nMOtciHUvSkYtHliQbHxkfEIRcGC04zmrqJt1Smc5kwq4AH0zPYPffQJ0s094EkMn
	 zZlEnMqKwpjDIEhc2XKbCGgs15vNTHQvUh8M1sX31kztpCTaacavy0nM/843tx6szr
	 3PbbXxNAAmNdf35pkybzw0A70kKtDr+IcJDCTo/u/zU7P7JknzymUogVxE7z/S7Wwj
	 qXmW2iti8dss/1JukrZt8aPPZ3lL+T0FwMqUqZnN9pGWZkZudLHmkLrKdE7UxZOC9w
	 5UVDjz5Rc15MPPvvSVPbSLI6RW+jTEqz/oJZkgU74mHctptkBN/ofdxos58eWHzd8A
	 TxKkZzaVKRCQA==
Date: Mon, 21 Apr 2025 22:18:23 +0000
To: Benno Lossin <benno.lossin@proton.me>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>, Christian Schrefl <chrisi.schrefl@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/8] rust: pin-init: Update the structural pinning link in readme.
Message-ID: <20250421221728.528089-6-benno.lossin@proton.me>
In-Reply-To: <20250421221728.528089-1-benno.lossin@proton.me>
References: <20250421221728.528089-1-benno.lossin@proton.me>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 4b4bd5c528cc5cbcf03bc0053bba67dec3b06bf1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Christian Schrefl <chrisi.schrefl@gmail.com>

The previous link anchor was broken in rust 1.77, because the
documentation was refactored in upstream rust.
Change the link to refer to the new section in the rust documentation.

Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
Link: https://github.com/Rust-for-Linux/pin-init/pull/37/commits/a146142fe1=
8cafa52f8c6da306ca2729d789cfbf
[ Fixed commit authorship. - Benno ]
Signed-off-by: Benno Lossin <benno.lossin@proton.me>
---
 rust/pin-init/README.md  | 2 +-
 rust/pin-init/src/lib.rs | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/pin-init/README.md b/rust/pin-init/README.md
index 1a03b200d4ce..2d0cda961d45 100644
--- a/rust/pin-init/README.md
+++ b/rust/pin-init/README.md
@@ -222,7 +222,7 @@ the `kernel` crate. The [`sync`] module is a good start=
ing point.
=20
 [`sync`]: https://rust.docs.kernel.org/kernel/sync/index.html
 [pinning]: https://doc.rust-lang.org/std/pin/index.html
-[structurally pinned fields]: https://doc.rust-lang.org/std/pin/index.html=
#pinning-is-structural-for-field
+[structurally pinned fields]: https://doc.rust-lang.org/std/pin/index.html=
#projections-and-structural-pinning
 [stack]: https://docs.rs/pin-init/latest/pin_init/macro.stack_pin_init.htm=
l
 [`impl PinInit<Foo>`]: https://docs.rs/pin-init/latest/pin_init/trait.PinI=
nit.html
 [`impl PinInit<T, E>`]: https://docs.rs/pin-init/latest/pin_init/trait.Pin=
Init.html
diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index 1521500a46b1..774f8ca033bc 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -247,7 +247,7 @@
 //! [`sync`]: https://rust.docs.kernel.org/kernel/sync/index.html
 //! [pinning]: https://doc.rust-lang.org/std/pin/index.html
 //! [structurally pinned fields]:
-//!     https://doc.rust-lang.org/std/pin/index.html#pinning-is-structural=
-for-field
+//!     https://doc.rust-lang.org/std/pin/index.html#projections-and-struc=
tural-pinning
 //! [stack]: crate::stack_pin_init
 #![cfg_attr(
     kernel,
--=20
2.48.1


