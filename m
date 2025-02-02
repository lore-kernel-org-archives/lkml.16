Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889AA1D5ACE;
	Sun,  2 Feb 2025 13:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.63.210.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738501945; cv=none; b=HqPgNvACb9rTTat3cv+WtGoTUDs/JYK3KfWvUjRCeOZoLJop4zyyetvNdc5oy0fuYjnLAqf8IsXMOrvxqQpgxAH48zv9z8pibL75kv857XgOt25QGTFdwuRG4wvHLjF9moOt4yJUqj/OK+0MnLw0Et+PG3qaNrCnsw6N398D2Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738501945; c=relaxed/simple;
	bh=db+CTl7vXN85Dcw+hwBoMAovv2p9XLFk8QMb0+h2eUk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VrvSbsTBxpslD+0ADygqPe1CZSnn4d5DKJ1p4iTYY35hUfwVP/9rkcWVom0eSbW+hggB+tISPSLgcztq4Zs1Rroy8uXhfb8dvmKw8qH5DcZ1SXmmksHSakd2QnnzGxyg8/++OVXeW5xqGbKmllsFo5OWvSzMk96whQDUID56HMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asahilina.net; spf=pass smtp.mailfrom=asahilina.net; dkim=pass (2048-bit key) header.d=asahilina.net header.i=@asahilina.net header.b=a6FbgBjV; arc=none smtp.client-ip=212.63.210.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asahilina.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asahilina.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asahilina.net header.i=@asahilina.net header.b="a6FbgBjV"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sendonly@marcansoft.com)
	by mail.marcansoft.com (Postfix) with ESMTPSA id C261F42601;
	Sun,  2 Feb 2025 13:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
	s=default; t=1738501598;
	bh=db+CTl7vXN85Dcw+hwBoMAovv2p9XLFk8QMb0+h2eUk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=a6FbgBjVng3G981fDt43dF40MXlTw0rneaJMabBeyx+aIR56WSn59r40VougNzdn9
	 sAN00S22Hl9EimtHryyQ2WLebuOp1SFD1vHROBQQm6o5hLtff/bVxEfldzY26ZVKCs
	 90Iz6seFHpmJcG0RC9KmKpu9BAkJYuL4ZW+Ue+5w8gLxQ0berFYK9GcuremJ+f6LvT
	 q8Kf9DMk8LmruH8sMGyzTRbNisX6FmMrS7gXSJFmY9l8H3XOCDyvP7fQDgR1XFX6jr
	 Z+/7MUCQliMV8rJrfuUhi+igiiZ2uSyYJIZs8Cf6A0ZQqHkSnIj13WdS1w9EADuKLK
	 I2PobK+BvOepA==
From: Asahi Lina <lina@asahilina.net>
Date: Sun, 02 Feb 2025 22:05:43 +0900
Subject: [PATCH 1/6] rust: types: Add Ownable/Owned types
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250202-rust-page-v1-1-e3170d7fe55e@asahilina.net>
References: <20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net>
In-Reply-To: <20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>
Cc: Jann Horn <jannh@google.com>, Matthew Wilcox <willy@infradead.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
 Wedson Almeida Filho <wedsonaf@gmail.com>, 
 Valentin Obst <kernel@valentinobst.de>, 
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
 airlied@redhat.com, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, Asahi Lina <lina@asahilina.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738501594; l=5188;
 i=lina@asahilina.net; s=20240902; h=from:subject:message-id;
 bh=db+CTl7vXN85Dcw+hwBoMAovv2p9XLFk8QMb0+h2eUk=;
 b=v4PEmnpGzrguSNB9PT6BnZr6+ea6iCaG0tCqNXz3t0LXfHn0sXubw18gYdI27epEwjEXxH8Ou
 PmgIcPGn+PiB7ALp4QLTfYWJgBI28JDbm3gcQoszN3vZbwEzEW2Tw8a
X-Developer-Key: i=lina@asahilina.net; a=ed25519;
 pk=tpv7cWfUnHNw5jwf6h4t0gGgglt3/xcwlfs0+A/uUu8=

By analogy to AlwaysRefCounted and ARef, an Ownable type is a (typically
C FFI) type that *may* be owned by Rust, but need not be. Unlike
AlwaysRefCounted, this mechanism expects the reference to be unique
within Rust, and does not allow cloning.

Conceptually, this is similar to a KBox<T>, except that it delegates
resource management to the T instead of using a generic allocator.

Signed-off-by: Asahi Lina <lina@asahilina.net>
---
 rust/kernel/types.rs | 110 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
index ec6457bb3084ae327c38ba4ba79b1601aef38244..0bee56153dcea47fb1321162df6b8765b5436e9f 100644
--- a/rust/kernel/types.rs
+++ b/rust/kernel/types.rs
@@ -479,6 +479,116 @@ fn drop(&mut self) {
     }
 }
 
+/// Types that may be owned by Rust code or borrowed, but have a lifetime managed by C code.
+///
+/// It allows such types to define their own custom destructor function to be called when
+/// a Rust-owned reference is dropped.
+///
+/// This is usually implemented by wrappers to existing structures on the C side of the code.
+///
+/// # Safety
+///
+/// Implementers must ensure that any objects borrowed directly as `&T` stay alive for the duration
+/// of the lifetime, and that any objects owned by Rust as `Owned<T>`) stay alive while that owned
+/// reference exists, until the [`Ownable::release()`] trait method is called.
+pub unsafe trait Ownable {
+    /// Releases the object (frees it or returns it to foreign ownership).
+    ///
+    /// # Safety
+    ///
+    /// Callers must ensure that the object is no longer referenced after this call.
+    unsafe fn release(this: NonNull<Self>);
+}
+
+/// A subtrait of Ownable that asserts that an `Owned<T>` Rust reference is not only unique
+/// within Rust and keeps the `T` alive, but also guarantees that the C code follows the
+/// usual mutable reference requirements. That is, the kernel will never mutate the
+/// `T` (excluding internal mutability that follows the usual rules) while Rust owns it.
+///
+/// When this type is implemented for an [`Ownable`] type, it allows `Owned<T>` to be
+/// dereferenced into a &mut T.
+///
+/// # Safety
+///
+/// Implementers must ensure that the kernel never mutates the underlying type while
+/// Rust owns it.
+pub unsafe trait OwnableMut: Ownable {}
+
+/// An owned reference to an ownable kernel object.
+///
+/// The object is automatically freed or released when an instance of [`Owned`] is
+/// dropped.
+///
+/// # Invariants
+///
+/// The pointer stored in `ptr` is non-null and valid for the lifetime of the [`Owned`] instance.
+pub struct Owned<T: Ownable> {
+    ptr: NonNull<T>,
+    _p: PhantomData<T>,
+}
+
+// SAFETY: It is safe to send `Owned<T>` to another thread when the underlying `T` is `Send` because
+// it effectively means sending a unique `&mut T` pointer (which is safe because `T` is `Send`).
+unsafe impl<T: Ownable + Send> Send for Owned<T> {}
+
+// SAFETY: It is safe to send `&Owned<T>` to another thread when the underlying `T` is `Sync`
+// because it effectively means sharing `&T` (which is safe because `T` is `Sync`).
+unsafe impl<T: Ownable + Sync> Sync for Owned<T> {}
+
+impl<T: Ownable> Owned<T> {
+    /// Creates a new instance of [`Owned`].
+    ///
+    /// It takes over ownership of the underlying object.
+    ///
+    /// # Safety
+    ///
+    /// Callers must ensure that the underlying object is acquired and can be considered owned by
+    /// Rust.
+    pub(crate) unsafe fn from_raw(ptr: NonNull<T>) -> Self {
+        // INVARIANT: The safety requirements guarantee that the new instance now owns the
+        // reference.
+        Self {
+            ptr,
+            _p: PhantomData,
+        }
+    }
+
+    /// Consumes the `Owned`, returning a raw pointer.
+    ///
+    /// This function does not actually relinquish ownership of the object.
+    /// After calling this function, the caller is responsible for ownership previously managed
+    /// by the `Owned`.
+    #[allow(dead_code)]
+    pub(crate) fn into_raw(me: Self) -> NonNull<T> {
+        ManuallyDrop::new(me).ptr
+    }
+}
+
+impl<T: Ownable> Deref for Owned<T> {
+    type Target = T;
+
+    fn deref(&self) -> &Self::Target {
+        // SAFETY: The type invariants guarantee that the object is valid.
+        unsafe { self.ptr.as_ref() }
+    }
+}
+
+impl<T: Ownable + OwnableMut> DerefMut for Owned<T> {
+    fn deref_mut(&mut self) -> &mut Self::Target {
+        // SAFETY: The type invariants guarantee that the object is valid,
+        // and that we can safely return a mutable reference to it.
+        unsafe { self.ptr.as_mut() }
+    }
+}
+
+impl<T: Ownable> Drop for Owned<T> {
+    fn drop(&mut self) {
+        // SAFETY: The type invariants guarantee that the `Owned` owns the object we're about to
+        // release.
+        unsafe { T::release(self.ptr) };
+    }
+}
+
 /// A sum type that always holds either a value of type `L` or `R`.
 ///
 /// # Examples

-- 
2.47.1

