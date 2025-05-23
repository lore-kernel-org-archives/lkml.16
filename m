Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E033296723;
	Fri, 23 May 2025 14:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748011925; cv=none; b=aD/9eR+bGT9GJjhATXMQlyi/a6HL9EhY2/20nDOM6oMQIfR4prvNDc/ekQCdu/tlmOQQ49/cvxS5ywv+fbbywNETMARj6VEnHq9bjrlpQ3fCFkAqaKj1P+ImuXhKAmJMNVZ5ARn0La/fM5UkMQZT+gfgp32IIYWEcM2Ca7OxaIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748011925; c=relaxed/simple;
	bh=Z9Jx4p+CmBHDNdpiv8pTq2nkjvdxScH3hf9IlZY91CM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZViHkbwFAeAe/MTUEsiAIlcQ2tc+Y7y7TNAM3M9+YQ77lCuV5I+0Ig+lJgkm4tXSG2P9n7mMw47dvfWIvM/8asEa3fsjkKHu9w2MZa1bNE5ZjQkcjrirL3e4EBvnTNceNDNYK7XLihy6xSjFSDSI6ZOBOrLT/YyCZOhDG/XQg/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hcrgfRL7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hcrgfRL7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA35EC4CEED;
	Fri, 23 May 2025 14:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748011924;
	bh=Z9Jx4p+CmBHDNdpiv8pTq2nkjvdxScH3hf9IlZY91CM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hcrgfRL7J6+xiEKJzQX/bYsr4m+1biJsZSohEMmpM0+VFUOJdBZPL7fQHSTMid0Eb
	 sQI6uAJRw0jL3k8pSltawTQUl4zmpIQWjmz6jZkUNEwq1Bd062NhsPZgqW+0TjJIv7
	 BzFYWQZUXbLaU1uwZ7ktHIVv2AMmABZhLNCefXpjYi3+axu/ng+AQ0bYd/+n5yAYGX
	 dv7c0yLq9Xwny1wHToyXXWvjdmr0HKelPM5or4IJRtXfTofa6atc23jt8oVmUkCgmp
	 W7l1VYwaQKrAv220tdPElhb0XxpGKz2KJJZU8rA8OChlzyp1PMY4Guh97hkg0ycBC0
	 Z6jztplW7Vaug==
From: Benno Lossin <lossin@kernel.org>
To: Benno Lossin <lossin@kernel.org>,
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
	Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Lyude Paul <lyude@redhat.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/13] rust: pin-init: change `impl Zeroable for Option<NonNull<T>>` to `ZeroableOption for NonNull<T>`
Date: Fri, 23 May 2025 16:51:01 +0200
Message-ID: <20250523145125.523275-6-lossin@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250523145125.523275-1-lossin@kernel.org>
References: <20250523145125.523275-1-lossin@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This brings it in line with references. It too is listed in [1].

Link: https://doc.rust-lang.org/stable/std/option/index.html#representation
Link: https://github.com/Rust-for-Linux/pin-init/pull/56/commits/8e52bf56ddc2190ce901d2f7c008ab8a64f653a9
Signed-off-by: Benno Lossin <lossin@kernel.org>
---
 rust/pin-init/src/lib.rs | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index bdd2a050f7c8..e46be80bd344 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -1528,6 +1528,9 @@ unsafe impl<T> ZeroableOption for &T {}
 // SAFETY: `Option<&mut T>` is part of the option layout optimization guarantee:
 // <https://doc.rust-lang.org/stable/std/option/index.html#representation>.
 unsafe impl<T> ZeroableOption for &mut T {}
+// SAFETY: `Option<NonNull<T>>` is part of the option layout optimization guarantee:
+// <https://doc.rust-lang.org/stable/std/option/index.html#representation>.
+unsafe impl<T> ZeroableOption for NonNull<T> {}
 
 /// Create an initializer for a zeroed `T`.
 ///
@@ -1606,7 +1609,6 @@ macro_rules! impl_zeroable {
     Option<NonZeroU128>, Option<NonZeroUsize>,
     Option<NonZeroI8>, Option<NonZeroI16>, Option<NonZeroI32>, Option<NonZeroI64>,
     Option<NonZeroI128>, Option<NonZeroIsize>,
-    {<T>} Option<NonNull<T>>,
 
     // SAFETY: `null` pointer is valid.
     //

base-commit: ae8b3a83fb9de394f609035041cd7a668fda2ab3
prerequisite-patch-id: https://lore.kernel.org/all/20250523125424.192843-2-lossin@kernel.org
prerequisite-patch-id: https://lore.kernel.org/all/20250523125424.192843-3-lossin@kernel.org
prerequisite-patch-id: https://lore.kernel.org/all/20250523125424.192843-4-lossin@kernel.org
-- 
2.49.0

