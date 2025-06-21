Received: from mail-10627.protonmail.ch (mail-10627.protonmail.ch [79.135.106.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2720E19AD8B;
	Sat, 21 Jun 2025 23:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750547023; cv=none; b=ahpCpVWr3gKhCzBEoi4mZ5+T80D7AB340OTvOUuMzTpbi/ZP9rDcupHC+0JBOZVWfycj7oNlk2L7fF5bgrA/XdzepECVg6pFE7xd6AkssdchgpvOY7FkCa/fR8//M5f57watBi9fC5fz4Nc23/S6VxXTA8xRE6wXYCPgxyJOOfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750547023; c=relaxed/simple;
	bh=KFn5kz9r6a980s6tzScKfirj26z1CXIlIKdS+rQBNHI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t1uuktWeZ/cxHxnBbivrd1m2fO9Pscc3nG9Y4MynBZeEqYugVSF3mSFML4sJOYkzzbvkaRRCq5Q3EJ41oR1+7qWF2e6wXhBbaZZAvD1ge6PoxYwvtSVYOUZzC/i1M46u08n0tdCInWE+4ZJmDi39qmKgu84Vx9MVqRX42rLiaE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=antoniohickey.com; arc=none smtp.client-ip=79.135.106.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antoniohickey.com
Date: Sat, 21 Jun 2025 23:03:27 +0000
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
From: Antonio Hickey <contact@antoniohickey.com>
Cc: Antonio Hickey <contact@antoniohickey.com>, Daniel Cote <danielstonecote@gmail.com>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] rust: uaccess: refactor to use `overflow_assert!`
Message-ID: <20250621230231.100181-3-contact@antoniohickey.com>
In-Reply-To: <20250621230231.100181-1-contact@antoniohickey.com>
References: <20250621230231.100181-1-contact@antoniohickey.com>
Feedback-ID: 144211621:user:proton
X-Pm-Message-ID: e473f53b959bbd1444c7425768c8c66d5554284a
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


