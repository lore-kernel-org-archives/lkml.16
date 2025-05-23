Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5272296D0A;
	Fri, 23 May 2025 14:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748011912; cv=none; b=aiF0VgAT0j0IUgg31PMRT/QB0BG6xaRYB8z05PPB1dv0IG1tKuF0TTnWsPN7RQVUmyFFQmBZExyXKyf2a8v3h2cCtWZ1qod6OzubxKyJB6u6S3WmLOUV1XjnKzn++XoQEUtY5J22WUbSEhREYRydxVJJxTNnW4L9l/CSjG+1fY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748011912; c=relaxed/simple;
	bh=SxEoH7BXSu5VOV/Iad1f6Yvh9QLBwXi3Hxeh3Gh6H3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FexwNBKCzu2JfX9usENC1PcAEGcGbBIGNX25Md8xNEKveJgSHg5P6lsg9PiDCqWGVfPdjzl7OvKqbKpmaAXy7wHAcyKVWr27TIR59l+NiTxVUkCEK9Pn0NNDItNkBYD3sNMvF2NPgDveSap5ikO/MxunQ4pk4I9QV3NLa9LNMF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lqvzhg9c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lqvzhg9c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0676C4CEEF;
	Fri, 23 May 2025 14:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748011911;
	bh=SxEoH7BXSu5VOV/Iad1f6Yvh9QLBwXi3Hxeh3Gh6H3k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Lqvzhg9cucgqq5V6Gz5qqlzPx6zscwwr/YpR7iww/a5rrESEz264zMx+rN2n0g0Zz
	 Ky74UyI8zQk+/LI15X1At4VWCGCgMTH51NRYz3ncTIpdIl7BOB2GDKGpRsnhVTMxTt
	 hQi8RiY6p/dHYN/3obwwWvtxgHtnWsR8EyJBhv1stKImQX7B3VTH++qPZDp9fO4U2h
	 ylOsyBbo1ySRr+xCvIGyUVDNinFCybw4mH7Ck1nyuEOWFzTp20Ngf6bWiuvl3Dc2B8
	 rHv/Qjs206sKw574QQFnu5MBKRC2G0ql1DxswPtdq07Sh2vkgJLbdEJNE5Q9n9k0VZ
	 FFj+QQsQzOCYw==
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
Subject: [PATCH v2 02/13] rust: pin-init: add `Zeroable::init_zeroed`
Date: Fri, 23 May 2025 16:50:58 +0200
Message-ID: <20250523145125.523275-3-lossin@kernel.org>
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

The trait function delegates to the already existing `init_zeroed`
function that returns a zeroing initializer for `Self`.

The syntax `..Zeroable::init_zeroed()` is already used by the
initialization macros to initialize all fields that are not mentioned in
the initializer with zero. Therefore it is expected that the function
also exists on the trait.

Link: https://github.com/Rust-for-Linux/pin-init/pull/56/commits/a424a6c9af5a4418a8e5e986a3db26a4432e2f1a
Signed-off-by: Benno Lossin <lossin@kernel.org>
---
 rust/pin-init/src/lib.rs | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index 3bb0700355df..436fa3bc0339 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -1471,7 +1471,18 @@ pub unsafe trait PinnedDrop: __internal::HasPinData {
 /// ```rust,ignore
 /// let val: Self = unsafe { core::mem::init_zeroed() };
 /// ```
-pub unsafe trait Zeroable {}
+pub unsafe trait Zeroable {
+    /// Create a new zeroed `Self`.
+    ///
+    /// The returned initializer will write `0x00` to every byte of the given `slot`.
+    #[inline]
+    fn init_zeroed() -> impl Init<Self>
+    where
+        Self: Sized,
+    {
+        init_zeroed()
+    }
+}
 
 /// Marker trait for types that allow `Option<Self>` to be set to all zeroes in order to write
 /// `None` to that location.

base-commit: ae8b3a83fb9de394f609035041cd7a668fda2ab3
prerequisite-patch-id: https://lore.kernel.org/all/20250523125424.192843-2-lossin@kernel.org
prerequisite-patch-id: https://lore.kernel.org/all/20250523125424.192843-3-lossin@kernel.org
prerequisite-patch-id: https://lore.kernel.org/all/20250523125424.192843-4-lossin@kernel.org
-- 
2.49.0

