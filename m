Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch [79.135.106.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E479266588
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 13:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745243419; cv=none; b=higVhx9PaznQwfTC/gNSkszbtO+JIaweGcSDm5C7zsrWuKNvR1q5DqjTg2Aj11BHdEUQNVK2aMNC7xPT4Ra3fTyv0GDY9BFL0RmVXTNR80mCzWQDWKp3+DwhlVcqGoJ7TBX6N7lvu9MWo5SOm+FF7/3sKZE+rMBBiIZNxube+tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745243419; c=relaxed/simple;
	bh=c6sh4ezT4TDV2xAhu4/v/ArKEm6H26SJ4UdWkW4UGck=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S8xlk+5hwAjFmTTbmKpS+0f4yH24jQIriI5NukuqWoIH+SukPowGN8mevcYDUX0oUQgnsPJF53NmVpplaqY/Rv4C8HWLyHP790MrpiGak2uJG9UwIMJiCYDfy7i9XUmArnnukrlX10H60eT8s1hc/iBWwXFZrW5WajNcSgwj2VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=kat/51Tu; arc=none smtp.client-ip=79.135.106.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="kat/51Tu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1745243408; x=1745502608;
	bh=CM3QQtWXQAA1jGNPFfjR0jWA67cFy7MIqL2uQdyCaLo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=kat/51Tut7GRaMjN89cW4THVIp9AtWaS2pCY2ZPdAWA5ptKFNRuC8iJXu6ccsrf3O
	 vzaVRWS9JdCZJdRQjBuj7hbaXmjqvUoLWDRg1C6OFxL+RqFY/oq3Q4DOYWd96GMkIx
	 YDSOUcv6gGrNHqU3PcxJ7RvM8OGkE5qwV8s5SkeHQLsfSB8DqeA/RHS/hm3GwAV07y
	 EkLD8QxrOniG8XJCtGTSf6vOO0zQHgIvbUBYOsTpy17dHmoccEE7u/gt8eFzUXTzGY
	 umu/sCKt09RxHZYX04FHoZ9hNld7J5LH4hefsgVlviI7iShMtMrmSvxzDbFa6hjdB7
	 CJiTQvUrIl/GQ==
Date: Mon, 21 Apr 2025 13:50:01 +0000
To: Simona Vetter <simona.vetter@ffwll.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Arnd Bergmann <arnd@arndb.de>
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] rust: iov: use untrusted data API
Message-ID: <20250421134909.464405-5-benno.lossin@proton.me>
In-Reply-To: <20250421134909.464405-1-benno.lossin@proton.me>
References: <20250421134909.464405-1-benno.lossin@proton.me>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: c9daac3b236de754d6820c10f767570fd6b31729
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Benno Lossin <benno.lossin@proton.me>
---

This patch depends on Alice's `struct iov_iter` patch series:

    https://lore.kernel.org/all/20250311-iov-iter-v1-0-f6c9134ea824@google.=
com

---
 rust/kernel/iov.rs               | 25 +++++++++++++++++--------
 samples/rust/rust_misc_device.rs |  5 +++--
 2 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/rust/kernel/iov.rs b/rust/kernel/iov.rs
index dc32c27c5c76..840c2aa82e41 100644
--- a/rust/kernel/iov.rs
+++ b/rust/kernel/iov.rs
@@ -11,7 +11,9 @@
     alloc::{Allocator, Flags},
     bindings,
     prelude::*,
+    transmute::cast_slice_mut,
     types::Opaque,
+    validate::Untrusted,
 };
 use core::{marker::PhantomData, mem::MaybeUninit, slice};
=20
@@ -124,10 +126,10 @@ pub unsafe fn revert(&mut self, bytes: usize) {
     ///
     /// Returns the number of bytes that have been copied.
     #[inline]
-    pub fn copy_from_iter(&mut self, out: &mut [u8]) -> usize {
-        // SAFETY: We will not write uninitialized bytes to `out`.
-        let out =3D unsafe { &mut *(out as *mut [u8] as *mut [MaybeUninit<=
u8>]) };
-
+    pub fn copy_from_iter(&mut self, out: &mut [Untrusted<u8>]) -> usize {
+        // CAST: The call to `copy_from_iter_raw` below only writes initia=
lized values.
+        // SAFETY: `Untrusted<T>` and `MaybeUninit<T>` transparently wrap =
a `T`.
+        let out: &mut [MaybeUninit<Untrusted<u8>>] =3D unsafe { cast_slice=
_mut(out) };
         self.copy_from_iter_raw(out).len()
     }
=20
@@ -137,7 +139,7 @@ pub fn copy_from_iter(&mut self, out: &mut [u8]) -> usi=
ze {
     #[inline]
     pub fn copy_from_iter_vec<A: Allocator>(
         &mut self,
-        out: &mut Vec<u8, A>,
+        out: &mut Vec<Untrusted<u8>, A>,
         flags: Flags,
     ) -> Result<usize> {
         out.reserve(self.len(), flags)?;
@@ -152,7 +154,10 @@ pub fn copy_from_iter_vec<A: Allocator>(
     /// Returns the sub-slice of the output that has been initialized. If =
the returned slice is
     /// shorter than the input buffer, then the entire IO vector has been =
read.
     #[inline]
-    pub fn copy_from_iter_raw(&mut self, out: &mut [MaybeUninit<u8>]) -> &=
mut [u8] {
+    pub fn copy_from_iter_raw(
+        &mut self,
+        out: &mut [MaybeUninit<Untrusted<u8>>],
+    ) -> &mut [Untrusted<u8>] {
         // SAFETY: `out` is valid for `out.len()` bytes.
         let len =3D
             unsafe { bindings::_copy_from_iter(out.as_mut_ptr().cast(), ou=
t.len(), self.as_raw()) };
@@ -274,7 +279,7 @@ pub unsafe fn revert(&mut self, bytes: usize) {
     /// Returns the number of bytes that were written. If this is shorter =
than the provided slice,
     /// then no more bytes can be written.
     #[inline]
-    pub fn copy_to_iter(&mut self, input: &[u8]) -> usize {
+    pub fn copy_to_iter(&mut self, input: &[Untrusted<u8>]) -> usize {
         // SAFETY: `input` is valid for `input.len()` bytes.
         unsafe { bindings::_copy_to_iter(input.as_ptr().cast(), input.len(=
), self.as_raw()) }
     }
@@ -286,7 +291,11 @@ pub fn copy_to_iter(&mut self, input: &[u8]) -> usize =
{
     /// that the file will appear to contain `contents` even if takes mult=
iple reads to read the
     /// entire file.
     #[inline]
-    pub fn simple_read_from_buffer(&mut self, ppos: &mut i64, contents: &[=
u8]) -> Result<usize> {
+    pub fn simple_read_from_buffer(
+        &mut self,
+        ppos: &mut i64,
+        contents: &[Untrusted<u8>],
+    ) -> Result<usize> {
         if *ppos < 0 {
             return Err(EINVAL);
         }
diff --git a/samples/rust/rust_misc_device.rs b/samples/rust/rust_misc_devi=
ce.rs
index 6405713fc8ff..bd2ac2e8f13d 100644
--- a/samples/rust/rust_misc_device.rs
+++ b/samples/rust/rust_misc_device.rs
@@ -109,6 +109,7 @@
     sync::Mutex,
     types::ARef,
     uaccess::{UserSlice, UserSliceReader, UserSliceWriter},
+    validate::Untrusted,
 };
=20
 const RUST_MISC_DEV_HELLO: u32 =3D _IO('|' as u32, 0x80);
@@ -145,7 +146,7 @@ fn init(_module: &'static ThisModule) -> impl PinInit<S=
elf, Error> {
=20
 struct Inner {
     value: i32,
-    buffer: KVec<u8>,
+    buffer: Untrusted<KVec<u8>>,
 }
=20
 #[pin_data(PinnedDrop)]
@@ -169,7 +170,7 @@ fn open(_file: &File, misc: &MiscDeviceRegistration<Sel=
f>) -> Result<Pin<KBox<Se
                 RustMiscDevice {
                     inner <- new_mutex!(Inner {
                         value: 0_i32,
-                        buffer: kvec![],
+                        buffer: Untrusted::new(kvec![]),
                     }),
                     dev: dev,
                 }
--=20
2.48.1


