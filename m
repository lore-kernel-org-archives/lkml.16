Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97145295DBA;
	Fri, 23 May 2025 14:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748011920; cv=none; b=a0i7l0oimTRTAz1iSOUd2qq0Q20GNf6IGIQxnqFwtojzQp78aQ85+6WFRFHHcOjCtkA2EFquW4sG/LBU2GyUeg9tuZ5dohXBy33X3AvLxzH9kJ6Usz8GUQhP3bQBojknDjcDmU1ND6p4QwToZi9BGBsl/bdn1wgHB4Lxe9Xb6uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748011920; c=relaxed/simple;
	bh=35hmwCZSPFILaYgIUCG1i2om61jYSDQK3Ta1u25w0kA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LQA6ItWi+vLx/CG51xtKV37Q7Ad58xsyz6sOFhD5jMzeyL37MlhgzWyUbDxVROnrd2iD0KkKncNcZgPJ0tNj4It57cu1AswFolPdod7lRc1hW63xq7wxi7ryUDO9IaA2BALPCWviCoWVcs87SD4k+kuOkAUBcjW6n5BPljfstRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pbYeE8vR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pbYeE8vR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E444C4CEF3;
	Fri, 23 May 2025 14:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748011920;
	bh=35hmwCZSPFILaYgIUCG1i2om61jYSDQK3Ta1u25w0kA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pbYeE8vR3FWk4ThoYE/ocnkT2LD9qBNO7UBbD5zL/stGurkcZPon4yfr4nfOCdCxr
	 ehpklZo4i5hKVj+kMbNiHREPGyxFErYPD+xZ9+AlaPMvEpaZMGcVUl1f4AUK7dd19C
	 00M4qpkOJytLhq2/8eBxZXcc+0hh07yUBYOQAGCzE5EgEvNz44pOkiGIMjUSLfpT7e
	 7mRt6ybMvJUp2EKoxP4SAb6rH9drYJXauAQ7xHk8Am6xK8IglPisBnOXt9J2Er2jJl
	 qxFq8IxAfRBz/dRFyAIJY578RC4G7mrbDdAvLvEETCp8BTL6e80O/KVlR1w7GqV2Lx
	 KRgB7PoDkYlRA==
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
Subject: [PATCH v2 04/13] rust: pin-init: implement `ZeroableOption` for `&T` and `&mut T`
Date: Fri, 23 May 2025 16:51:00 +0200
Message-ID: <20250523145125.523275-5-lossin@kernel.org>
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

`Option<&T>` and `Option<&mut T>` are documented [1] to have the `None`
variant be all zeroes.

Link: https://doc.rust-lang.org/stable/std/option/index.html#representation [1]
Link: https://github.com/Rust-for-Linux/pin-init/pull/56/commits/5ef1638c79e019d3dc0c62db5905601644c2e60a
Signed-off-by: Benno Lossin <lossin@kernel.org>
---
 rust/pin-init/src/lib.rs | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index 7535c3fcc961..bdd2a050f7c8 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -1522,6 +1522,13 @@ pub unsafe trait ZeroableOption {}
 // SAFETY: by the safety requirement of `ZeroableOption`, this is valid.
 unsafe impl<T: ZeroableOption> Zeroable for Option<T> {}
 
+// SAFETY: `Option<&T>` is part of the option layout optimization guarantee:
+// <https://doc.rust-lang.org/stable/std/option/index.html#representation>.
+unsafe impl<T> ZeroableOption for &T {}
+// SAFETY: `Option<&mut T>` is part of the option layout optimization guarantee:
+// <https://doc.rust-lang.org/stable/std/option/index.html#representation>.
+unsafe impl<T> ZeroableOption for &mut T {}
+
 /// Create an initializer for a zeroed `T`.
 ///
 /// The returned initializer will write `0x00` to every byte of the given `slot`.

base-commit: ae8b3a83fb9de394f609035041cd7a668fda2ab3
prerequisite-patch-id: https://lore.kernel.org/all/20250523125424.192843-2-lossin@kernel.org
prerequisite-patch-id: https://lore.kernel.org/all/20250523125424.192843-3-lossin@kernel.org
prerequisite-patch-id: https://lore.kernel.org/all/20250523125424.192843-4-lossin@kernel.org
-- 
2.49.0

