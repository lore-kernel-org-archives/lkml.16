Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1622B268C49;
	Thu, 12 Jun 2025 14:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749739925; cv=none; b=u+vY035+zEY+7oYfh/wl0FliSo/TXlEV9soEBt8ahWxk5PUxiHAwvvvgs4NtH7I1r0wRhGQXlRCEovx+0PKKamsSPK0qe1vRJy4IeXDUlvWbPvbTcHtQ1qaiShx4zNSgde/09cSz+pbxSms8PiUCbGvqOSeIX6n9b/XgkVAw20k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749739925; c=relaxed/simple;
	bh=xsSP2aCmuKNeUb9/6TPkcxw0m7gqqcmC2Tvep0z1Mtg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rIdQ00VSvOFxOxm90TPDFAIvUk24J8PRcr8qR/ncZDLIbqaSNEljjHB79N4gvOsa7THK6TMCt3Mdgmr24Be1t7D1nbKb/uTP/NjETu4qX++L1h8RTCPI2P8N0o7sgishPYnwGimMcljsK2mnwX966b2DtQ3xYoVgw3QK7jVSooo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a3aMkbiX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a3aMkbiX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C0DBC4CEF1;
	Thu, 12 Jun 2025 14:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749739924;
	bh=xsSP2aCmuKNeUb9/6TPkcxw0m7gqqcmC2Tvep0z1Mtg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a3aMkbiXHsxMSliOnEGuZCYFTeOmtRjxDrk84ibpasOPQF05worvc0b5FJxBhMieg
	 sUOV+syF/bNxGBEeciN74Pa8E1GLKoZhKvX3Z+cGBb4dEn9Aqi+StwGvesEYWcakmk
	 Ao2Sb3cjAjDqCu1vEy1eSJ3TQMyOy22dqqPhmlCgbpmorOF9i4CGm0ASfr/KxXeDMV
	 trA+YPdfjmrWvy2/nApcVsPQ78WO51LLd6o52Ck4+yJpL/1kVPr32usEbIIR66d8c3
	 3SBLUAZSjoB8Zwm7txIlGHinXflA9OYhCRtoRE+qZb9iLZiMbBx8JvzbvzjGsNgD++
	 3gJwFjH0/kFeQ==
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 4/4] rust: devres: implement register_foreign_release()
Date: Thu, 12 Jun 2025 16:51:41 +0200
Message-ID: <20250612145145.12143-5-dakr@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612145145.12143-1-dakr@kernel.org>
References: <20250612145145.12143-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

register_foreign_release() is useful when a device resource has
associated data, but does not require the capability of accessing it or
manually releasing it.

If we would want to be able to access the device resource and release the
device resource manually before the device is unbound, but still keep
access to the associated data, we could implement it as follows.

	struct Registration<T> {
	   inner: Devres<RegistrationInner>,
	   data: T,
	}

However, if we never need to access the resource or release it manually,
register_foreign_release() is great optimization for the above, since it
does not require the synchronization of the Devres type.

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/devres.rs | 80 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
index 4ee9037f4ad4..495dca6240fc 100644
--- a/rust/kernel/devres.rs
+++ b/rust/kernel/devres.rs
@@ -16,6 +16,7 @@
     sync::{rcu, Completion},
     types::{ARef, ForeignOwnable},
 };
+use core::ops::Deref;
 
 /// This abstraction is meant to be used by subsystems to containerize [`Device`] bound resources to
 /// manage their lifetime.
@@ -303,3 +304,82 @@ pub fn register_foreign_boxed<T, E>(
 
     register_foreign(dev, data)
 }
+
+/// To be implemented by an object passed to [`register_foreign_release`].
+pub trait Release {
+    /// Called once the [`Device`] given to [`register_foreign_release`] is unbound.
+    fn release(&self);
+}
+
+impl<T: Release> Release for crate::sync::ArcBorrow<'_, T> {
+    fn release(&self) {
+        self.deref().release();
+    }
+}
+
+impl<T: Release> Release for Pin<&'_ T> {
+    fn release(&self) {
+        self.deref().release();
+    }
+}
+
+/// Consume the `data`, [`Release::release`] and [`Drop::drop`] `data` once `dev` is unbound.
+///
+/// # Examples
+///
+/// ```no_run
+/// use kernel::{device::{Bound, Device}, devres, devres::Release, sync::Arc};
+///
+/// struct Registration<T> {
+///     data: T,
+/// }
+///
+/// impl<T> Registration<T> {
+///     fn new(data: T) -> Result<Arc<Self>> {
+///         // register (e.g. class device, IRQ, etc.)
+///
+///         Ok(Arc::new(Self { data }, GFP_KERNEL)?)
+///     }
+/// }
+///
+/// impl<T> Release for Registration<T> {
+///     fn release(&self) {
+///        // unregister
+///     }
+/// }
+///
+/// fn from_bound_context(dev: &Device<Bound>) -> Result {
+///     let reg = Registration::new(0x42)?;
+///
+///     devres::register_foreign_release(dev, reg.clone())
+/// }
+/// ```
+pub fn register_foreign_release<P>(dev: &Device<Bound>, data: P) -> Result
+where
+    P: ForeignOwnable,
+    for<'a> P::Borrowed<'a>: Release,
+{
+    let ptr = data.into_foreign();
+
+    #[allow(clippy::missing_safety_doc)]
+    unsafe extern "C" fn callback<P>(ptr: *mut kernel::ffi::c_void)
+    where
+        P: ForeignOwnable,
+        for<'a> P::Borrowed<'a>: Release,
+    {
+        // SAFETY: `ptr` is the pointer to the `ForeignOwnable` leaked above and hence valid.
+        unsafe { P::borrow(ptr.cast()) }.release();
+
+        // SAFETY: `ptr` is the pointer to the `ForeignOwnable` leaked above and hence valid.
+        let _ = unsafe { P::from_foreign(ptr.cast()) };
+    }
+
+    // SAFETY:
+    // - `dev.as_raw()` is a pointer to a valid and bound device.
+    // - `ptr` is a valid pointer the `ForeignOwnable` devres takes ownership of.
+    to_result(unsafe {
+        // `devm_add_action_or_reset()` also calls `callback` on failure, such that the
+        // `ForeignOwnable` is released eventually.
+        bindings::devm_add_action_or_reset(dev.as_raw(), Some(callback::<P>), ptr.cast())
+    })
+}
-- 
2.49.0

