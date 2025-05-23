Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703F629116E;
	Fri, 23 May 2025 14:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748011943; cv=none; b=H20Y5LkxzlEqMiwOmg+MbBaPTr5WOPOl1V/KVJ19ljsnpcmkA2YS1FGpEYp+j49KAZ8ktZ5nHxPMruraHt0RIJGnx5GUX9zHXZ/VXY4xdsouuYjfnNg3oD9YTSYhh5Ga6BEu9tkljMKqc2cnT/2zhb0ovyYeoyyEMxdIV+oHV1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748011943; c=relaxed/simple;
	bh=p/ydUM3APd1RXytobOdOkR8mcn9np88WY5e5U8ZyN3M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qp6O42/R1HsMJ3nrsuNqFEeoEjQ9gKSo5mxHw7cewLnClHzUvAoDvSq+KWz+2j9FCMFi+KQOiRHyn4ykwIViCWALmbnD+Sz5kChk/MmnCOVKlcqqZWyi5ZSSuE75Z1GZ7NN7ozgZGtuaGzcMazgOaLWKzGfrT0wKRVHkpsPTWfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G+gOg50g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G+gOg50g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF258C4CEED;
	Fri, 23 May 2025 14:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748011943;
	bh=p/ydUM3APd1RXytobOdOkR8mcn9np88WY5e5U8ZyN3M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G+gOg50gJ2FrRigrGYSfbiEopFYd0uPIozmmMv6bcc1XBhW6OT2HDAEdGSXQC0smC
	 ZCNU+njN5Ej/9zyMlwOQs3Jnn16GW8p3VwnCZvGirhnNCmeRIhYXustm56BmU0Dadp
	 xvinUOPe4lKZFVmQ/2H8hn7P2IpsHDQXn6xINJhXU0VFMOLkKiWpZXrMx3I0Gru0Im
	 09GBqaM7jHU+nMTc7tXnAg4fStic98OJdOibnJI29LU4XnkzVbXpMRmuiK78wtvSwc
	 UjWDkaM90eEIwLYxQhnnefc5LMTMDHGrkOgOPv7HyO60xvffdG5jgnv9OatWEhNFfE
	 AcsMHfwXfevLg==
From: Benno Lossin <lossin@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lee Jones <lee@kernel.org>,
	Tamir Duberstein <tamird@gmail.com>
Cc: Lyude Paul <lyude@redhat.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/13] rust: miscdevice: replace `MaybeUninit::zeroed().assume_init` with `pin_init::zeroed`
Date: Fri, 23 May 2025 16:51:05 +0200
Message-ID: <20250523145125.523275-10-lossin@kernel.org>
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
 rust/kernel/miscdevice.rs | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
index b4c5f74de23d..d66e6d3bb4ee 100644
--- a/rust/kernel/miscdevice.rs
+++ b/rust/kernel/miscdevice.rs
@@ -19,7 +19,7 @@
     str::CStr,
     types::{ForeignOwnable, Opaque},
 };
-use core::{marker::PhantomData, mem::MaybeUninit, pin::Pin};
+use core::{marker::PhantomData, pin::Pin};
 
 /// Options for creating a misc device.
 #[derive(Copy, Clone)]
@@ -31,8 +31,7 @@ pub struct MiscDeviceOptions {
 impl MiscDeviceOptions {
     /// Create a raw `struct miscdev` ready for registration.
     pub const fn into_raw<T: MiscDevice>(self) -> bindings::miscdevice {
-        // SAFETY: All zeros is valid for this C type.
-        let mut result: bindings::miscdevice = unsafe { MaybeUninit::zeroed().assume_init() };
+        let mut result: bindings::miscdevice = pin_init::zeroed();
         result.minor = bindings::MISC_DYNAMIC_MINOR as _;
         result.name = self.name.as_char_ptr();
         result.fops = MiscdeviceVTable::<T>::build();
@@ -309,8 +308,7 @@ impl<T: MiscDevice> MiscdeviceVTable<T> {
         } else {
             None
         },
-        // SAFETY: All zeros is a valid value for `bindings::file_operations`.
-        ..unsafe { MaybeUninit::zeroed().assume_init() }
+        ..pin_init::zeroed()
     };
 
     const fn build() -> &'static bindings::file_operations {
-- 
2.49.0

