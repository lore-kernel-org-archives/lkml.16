Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DF035963;
	Sun, 29 Jun 2025 02:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751165036; cv=none; b=cBVBvnMMVsndFy18dUh2A9BSJNo5X2ymkMU4cmCuveaCQm4lC2uYwxuT93B5ft+u6MuGWaP6hvwJUKdJmwidMfFjZiNDavZf/53TIpoTXejkUH+tRvo28CJOBrBPyfIdmSDgiUepmw5yeS61K9Mkmal8oXfYperqEL4U8IqbfGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751165036; c=relaxed/simple;
	bh=KFn5kz9r6a980s6tzScKfirj26z1CXIlIKdS+rQBNHI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a8aV6Il8fjskhwxfiK27s5XhDlpTpFIDaDvjugfaSOYZC0hyRUxwe9fzohE0PCyOp/XDZ7EorbwyrWoRj7XgByKV1m53buxMB9TxJtMfCzFvZMafOkHZGHLLPxdoNvsEQcMo+LJOwk8NjjbomcydcTejImSHOaAgCfBiEOYIrbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=antoniohickey.com; arc=none smtp.client-ip=185.70.43.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antoniohickey.com
Date: Sun, 29 Jun 2025 02:43:47 +0000
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
From: Antonio Hickey <contact@antoniohickey.com>
Cc: Antonio Hickey <contact@antoniohickey.com>, Daniel Cote <danielstonecote@gmail.com>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] rust: uaccess: refactor to use `overflow_assert!`
Message-ID: <20250629024310.97937-3-contact@antoniohickey.com>
In-Reply-To: <20250629024310.97937-1-contact@antoniohickey.com>
References: <20250629024310.97937-1-contact@antoniohickey.com>
Feedback-ID: 144211621:user:proton
X-Pm-Message-ID: c4dfcec9f2d8f7e7adade761741c75e5f5b29bc0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Using the `overflow_assert!` macro here adds documentation to
the intent of the assertion, and avoids local `#ifdefs`s by
encapsulating the conditional behavior to the macro itself.

Co-developed-by: Daniel Cote <danielstonecote@gmail.com>
Signed-off-by: Daniel Cote <danielstonecote@gmail.com>
Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
Link: https://github.com/Rust-for-Linux/linux/issues/1159
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/kernel/uaccess.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
index 635a03e0989f..452a5e0d76d2 100644
--- a/rust/kernel/uaccess.rs
+++ b/rust/kernel/uaccess.rs
@@ -9,6 +9,7 @@
     bindings,
     error::Result,
     ffi::{c_char, c_void},
+    overflow_assert,
     prelude::*,
     transmute::{AsBytes, FromBytes},
 };
@@ -394,8 +395,7 @@ fn raw_strncpy_from_user(dst: &mut [MaybeUninit<u8>], s=
rc: UserPtr) -> Result<us
         return Err(Error::from_errno(res as i32));
     }
=20
-    #[cfg(CONFIG_RUST_OVERFLOW_CHECKS)]
-    assert!(res <=3D len);
+    overflow_assert!(res <=3D len);
=20
     // GUARANTEES: `strncpy_from_user` was successful, so `dst` has conten=
ts in accordance with the
     // guarantees of this function.
--=20
2.50.0


