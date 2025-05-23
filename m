Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E921D296FC2;
	Fri, 23 May 2025 14:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748011959; cv=none; b=WMfnsrJj2nqaRQqpi4lIGujRrYaos+BiX/MTMGRTRHo9URPrzJ01R1zsdaIsVM0xDZRB9UJye1FTvUoVyfmFdnYTHo1yDzWML0keruXhNEmcxiSQbCrmrlo6PIbMmZFecro9mDJOQB3Q+m0v7oBXDDvKRvAok/oC5HOhZmQYyno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748011959; c=relaxed/simple;
	bh=x0Lek28ZMNlzvwZKVUJCS7wJumpZZc8oLQJLQutlOqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fhwqN9Rqvab2dHxRsewRZvP3zEPipp7VnGf5K1BMhvkFh2Iq0OjdUJGtb9+8iAmMA68zxv+HpEVnC7yF5XR6tc3UAw/opODKVA8NumgamTuagzS2rp/XwCFIXTX8X4KIDP6MbQGvo4clFSNi+KTdJByroBV1KVLuq6dmOtBFwWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XZUej6Rv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XZUej6Rv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08996C4CEED;
	Fri, 23 May 2025 14:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748011958;
	bh=x0Lek28ZMNlzvwZKVUJCS7wJumpZZc8oLQJLQutlOqc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XZUej6RvKes+hto/R1QJOFJ2HzijXZCAEgnpnpAPZVeJtbAGf93VAuTp/j49Vmz7L
	 Dm//ZcB53cfRAw4j5z1pJYMa6gCzWJRCl3ckiyq4GtTZ2fvRJBymTztM4uNql38Qjb
	 NPVpoAMKQIPQwbZckJSfhQMs+eXRg8p+PvD/1J9sFCTmmtSf5FXkX7Zzo+IfSVaH9N
	 44XCl7DY1O6jdT9CuQIDgJVfhc+gND/kom37eTAbEjfpSJMCLk/YB2GzLl6Vxijn0d
	 FSwCvfzan1GLtxifDlcgjFb4rnrXh/FlB6hbN80hwpqdQWQprmfjQAVfVzdzHt4T6+
	 WiGkWUGn5T7fg==
From: Benno Lossin <lossin@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>,
	devicetree@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 12/13] rust: of: replace `core::mem::zeroed` with `pin_init::zeroed`
Date: Fri, 23 May 2025 16:51:08 +0200
Message-ID: <20250523145125.523275-13-lossin@kernel.org>
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

All types in `bindings` implement `Zeroable` if they can, so use
`pin_init::zeroed` instead of relying on `unsafe` code.

If this ends up not compiling in the future, something in bindgen or on
the C side changed and is most likely incorrect.

Signed-off-by: Benno Lossin <lossin@kernel.org>
---
 rust/kernel/of.rs | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/rust/kernel/of.rs b/rust/kernel/of.rs
index 04f2d8ef29cb..c9a3f0521db4 100644
--- a/rust/kernel/of.rs
+++ b/rust/kernel/of.rs
@@ -30,9 +30,7 @@ impl DeviceId {
     /// Create a new device id from an OF 'compatible' string.
     pub const fn new(compatible: &'static CStr) -> Self {
         let src = compatible.as_bytes_with_nul();
-        // Replace with `bindings::of_device_id::default()` once stabilized for `const`.
-        // SAFETY: FFI type is valid to be zero-initialized.
-        let mut of: bindings::of_device_id = unsafe { core::mem::zeroed() };
+        let mut of: bindings::of_device_id = pin_init::zeroed();
 
         // TODO: Use `clone_from_slice` once the corresponding types do match.
         let mut i = 0;
-- 
2.49.0

