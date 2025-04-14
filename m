Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D652E2E338C;
	Mon, 14 Apr 2025 13:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744636797; cv=none; b=CcTjSxQ0EWdJZ5E8SlnBTeAK6e3plMMa40MbGTOUFz1vynH+l2wFw4COAgHdhtyhuUaPZDGK2oNWmDyHUbahV9YVsNaTB+IsnQ+SaXYeXJBz7S3BNXf/QXrV5Gs93nmba0bCGfs0OGpHSUFfbxuYeMUx0Cn0esdNYXv3WtseJ0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744636797; c=relaxed/simple;
	bh=eudGftji2a38VjloW6y+9kohBtajszdwKNZYkxBDrpo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RieE09rAnq+yT6O4LjBiy+QDBq7igCPPJEVXvZ4Q94oNdbp/vqCfSMG2lzXG0uLlMYIKCCDeo9upQ/HCwFuDdSnBMrIFl/PWD69nJH0po+OwXF3veVXbkwXq0tnKo4a3V/I7i4KPRxwGNwr3TPabvRLh8qKuDpmq7rYYhy/mhwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tn4kh1M7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tn4kh1M7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D930C4CEEE;
	Mon, 14 Apr 2025 13:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744636797;
	bh=eudGftji2a38VjloW6y+9kohBtajszdwKNZYkxBDrpo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Tn4kh1M7GkFkLB82iwGyhY091SBT8wobdjZlHQF4s12ERyjHL+2p9tt/O/rRRn207
	 jKqIeOTdnuge4X1EwHSh+TDXhg5hQv1t5KAiIB4mRsAh6/cSZ/bU5aubNV+c61X/qC
	 SPZilLtVJW4kDPZ4A/px1ja3GV/XESip68sk5pQk0OxHze11cEDzWzLwNGvooxCS5n
	 SYE+T1MqRtpjVHiSYGUJPV6ojWdDBRyVO0jctJvFjxSTuU5QiqB8eqnuteIlFbetO/
	 sGcK5RUVD86+YayrRXQ/kxD8aYWAcft/xRbCULIc+/LZdXtp4ajKMfRKc7LyS81K5h
	 flnWRR6p6HQOw==
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	david.m.ertman@intel.com,
	ira.weiny@intel.com,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	airlied@gmail.com,
	acourbot@nvidia.com,
	jhubbard@nvidia.com
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v4 4/5] rust: auxiliary: add auxiliary registration
Date: Mon, 14 Apr 2025 15:18:07 +0200
Message-ID: <20250414131934.28418-5-dakr@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250414131934.28418-1-dakr@kernel.org>
References: <20250414131934.28418-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement the `auxiliary::Registration` type, which provides an API to
create and register new auxiliary devices in the system.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/auxiliary.rs | 88 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 87 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/auxiliary.rs b/rust/kernel/auxiliary.rs
index 75423737032a..b40d663b42eb 100644
--- a/rust/kernel/auxiliary.rs
+++ b/rust/kernel/auxiliary.rs
@@ -5,7 +5,7 @@
 //! C header: [`include/linux/auxiliary_bus.h`](srctree/include/linux/auxiliary_bus.h)
 
 use crate::{
-    bindings, device,
+    bindings, container_of, device,
     device_id::RawDeviceId,
     driver,
     error::{to_result, Result},
@@ -230,6 +230,18 @@ pub fn parent(&self) -> Option<&device::Device> {
     }
 }
 
+impl Device {
+    extern "C" fn release(dev: *mut bindings::device) {
+        // SAFETY: By the type invariant `self.0.as_raw` is a pointer to the `struct device`
+        // embedded in `struct auxiliary_device`.
+        let adev = unsafe { container_of!(dev, bindings::auxiliary_device, dev) }.cast_mut();
+
+        // SAFETY: `adev` points to the memory that has been allocated in `Registration::new`, via
+        // `KBox::new(Opaque::<bindings::auxiliary_device>::zeroed(), GFP_KERNEL)`.
+        let _ = unsafe { KBox::<Opaque<bindings::auxiliary_device>>::from_raw(adev.cast()) };
+    }
+}
+
 // SAFETY: `Device` is a transparent wrapper of a type that doesn't depend on `Device`'s generic
 // argument.
 kernel::impl_device_context_deref!(unsafe { Device });
@@ -272,3 +284,77 @@ unsafe impl Send for Device {}
 // SAFETY: `Device` can be shared among threads because all methods of `Device`
 // (i.e. `Device<Normal>) are thread safe.
 unsafe impl Sync for Device {}
+
+/// The registration of an auxiliary device.
+///
+/// This type represents the registration of a [`struct auxiliary_device`]. When an instance of this
+/// type is dropped, its respective auxiliary device will be unregistered from the system.
+///
+/// # Invariants
+///
+/// `self.0` always holds a valid pointer to an initialized and registered
+/// [`struct auxiliary_device`].
+pub struct Registration(NonNull<bindings::auxiliary_device>);
+
+impl Registration {
+    /// Create and register a new auxiliary device.
+    pub fn new(parent: &device::Device, name: &CStr, id: u32, modname: &CStr) -> Result<Self> {
+        let boxed = KBox::new(Opaque::<bindings::auxiliary_device>::zeroed(), GFP_KERNEL)?;
+        let adev = boxed.get();
+
+        // SAFETY: It's safe to set the fields of `struct auxiliary_device` on initialization.
+        unsafe {
+            (*adev).dev.parent = parent.as_raw();
+            (*adev).dev.release = Some(Device::release);
+            (*adev).name = name.as_char_ptr();
+            (*adev).id = id;
+        }
+
+        // SAFETY: `adev` is guaranteed to be a valid pointer to a `struct auxiliary_device`,
+        // which has not been initialized yet.
+        unsafe { bindings::auxiliary_device_init(adev) };
+
+        // Now that `adev` is initialized, leak the `Box`; the corresponding memory will be freed
+        // by `Device::release` when the last reference to the `struct auxiliary_device` is dropped.
+        let _ = KBox::into_raw(boxed);
+
+        // SAFETY:
+        // - `adev` is guaranteed to be a valid pointer to a `struct auxiliary_device`, which has
+        //   been initialialized,
+        // - `modname.as_char_ptr()` is a NULL terminated string.
+        let ret = unsafe { bindings::__auxiliary_device_add(adev, modname.as_char_ptr()) };
+        if ret != 0 {
+            // SAFETY: `adev` is guaranteed to be a valid pointer to a `struct auxiliary_device`,
+            // which has been initialialized.
+            unsafe { bindings::auxiliary_device_uninit(adev) };
+
+            return Err(Error::from_errno(ret));
+        }
+
+        // SAFETY: `adev` is guaranteed to be non-null, since the `KBox` was allocated successfully.
+        //
+        // INVARIANT: The device will remain registered until `auxiliary_device_delete()` is called,
+        // which happens in `Self::drop()`.
+        Ok(Self(unsafe { NonNull::new_unchecked(adev) }))
+    }
+}
+
+impl Drop for Registration {
+    fn drop(&mut self) {
+        // SAFETY: By the type invariant of `Self`, `self.0.as_ptr()` is a valid registered
+        // `struct auxiliary_device`.
+        unsafe { bindings::auxiliary_device_delete(self.0.as_ptr()) };
+
+        // This drops the reference we acquired through `auxiliary_device_init()`.
+        //
+        // SAFETY: By the type invariant of `Self`, `self.0.as_ptr()` is a valid registered
+        // `struct auxiliary_device`.
+        unsafe { bindings::auxiliary_device_uninit(self.0.as_ptr()) };
+    }
+}
+
+// SAFETY: A `Registration` of a `struct auxiliary_device` can be released from any thread.
+unsafe impl Send for Registration {}
+
+// SAFETY: `Registration` does not expose any methods or fields that need synchronization.
+unsafe impl Sync for Registration {}
-- 
2.49.0

