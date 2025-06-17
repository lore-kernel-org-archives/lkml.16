Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BD328BAB1
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 13:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750167427; cv=none; b=SiX7N3vE1A/wI0GFyEt5FNd1sjU0Z7Gc15TAc8c/XoBI5YsCzZbHhglxNbCSJglRbTWK/3WjCMFe41v8U3rGMTrIdCr+3M+fIpwhodpi1vvpim3BgmvuKq+05yT2X8ODuCTtc2R6zCCEgUHYKhdup+Qsy+Y4OthrmHCiOwBCIOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750167427; c=relaxed/simple;
	bh=M3gQu6VPxrPFYf8hu7y10DRHvlJJ2ovwL/u8xE0ildM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=I/AQzpUR+m5WxLHtItucFn/hUL0TAKrQzlvgw2ZZezN6rhdnUTd/c6V3RhwGZSDL2NsfJVTKEUWTeCwS0U68aycOisgyIbhVtlblmbMvxObY5gXs8/u2YoCosc+ipGCGRi2xvCKIWz3FZAR9+h5XrmACDvGIRzVMorFlQCsqzaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HWr342PH; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HWr342PH"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3a50816cc58so1946636f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 06:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750167423; x=1750772223; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WdkCvOjgjBWvaH3RbGAWvWYYMnuHBQbG69wwVzqGWxM=;
        b=HWr342PHWNw07/Qi5cdpGqCXGEviuWsmloLJqsbdrN2jE2DKlbr9izd0dLX8tgWS0i
         Jpr4ySbwj+3NR6ALtpMlSOxwwXI8anPcIF2OZ+Gi2aqyl+2XueX7ltxREVVZoek1+TQ6
         CCH2gW52Wak6GaF/alw0AZtEpd/YUL5J3L+RcA0OGjyEix99qo8yI2KRblWKifuEs2gM
         ZEkstK3y4e4VcbHe0KERyfnhhxEWgljETjOBurKFrNmbbP5+aszCkSCkCPXGnLNmsadD
         Ql4TM3anAjmViO8OqFhwIqaNhTPy7PjG2tw/U6DBiXoHCLy8OmqrfWWlRm9cjM9P1yHy
         dZbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750167423; x=1750772223;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WdkCvOjgjBWvaH3RbGAWvWYYMnuHBQbG69wwVzqGWxM=;
        b=gYb8pCFoIhWRTpNhZspxCbedqOeJ+fGNw1Tv0eQ5Z5xov87DylWVQl+8J1cLTO/ADB
         c4PolInTVr58/dcs2KwcnpnLS4Synsz2PL+95qeDSc9ux21YyZgT3bio2SwIAZy0kagP
         6hQBP0mKCM+8AO+xh/AXpqD9G1mbzBluB+8nlHf+OkI5MdXrmFkeic3TEXJEB7iJdxkr
         RCE/Q7bDk94DXM+zdkxhm2+Jj9hKO6INbUl5RnHurnPht/2EXpahWhMcFuKJYcCjwkLv
         aIxXjbtl3XW1CVCPO9bJaXOtz6ZhVgtWc4dsPlgqXu0IVfSjeuKHIo9HSDYhr8KhMbfe
         NlsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwTuriyqI+ax6WtRwXCmFnLYqLDB3ywWJs8rOf22BPpJnuAfUnwAErb6R0So6vhTOIgblyJwXLDvfE/44=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0ABy5gjW1oHBzOeFzyYwWSSsZ/ox/lsfPmpaqv9KiONwHvkbV
	X8fkeZo9gt/uUsgc0ojt/tEdSABWa4NqSAdTdgQDvUFUOOBFk1Dk/w3rO3j4rloiOJ8XG5NhZHK
	ZCaVeYxQ8SkshOo+XRg==
X-Google-Smtp-Source: AGHT+IEMDhH4okw8GTdgXodniHiT1koUzx1rDCj34eR+Q+7V5b9vWvUIpnrHd+p/WctosGmoTJbrw24dGRNMPG4=
X-Received: from wro29.prod.google.com ([2002:a05:6000:41dd:b0:3a4:f715:9b07])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2308:b0:3a4:f939:b53 with SMTP id ffacd0b85a97d-3a5723a3ae0mr10356845f8f.38.1750167423450;
 Tue, 17 Jun 2025 06:37:03 -0700 (PDT)
Date: Tue, 17 Jun 2025 13:36:47 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAG5vUWgC/x3MSQqAMAxA0atI1ga04IBXERexppqFVlMcQHp3i
 8u3+P+FwCocoMteUL4kiN8SyjwDu9A2M8qUDKYwVVGXDfqdjpPRqV9R6Uay1diyqx2RgVTtyk6 e/9gPMX7i1WcCYQAAAA==
X-Change-Id: 20250617-opaque-from-raw-ac5b8ef6faa2
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=4237; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=M3gQu6VPxrPFYf8hu7y10DRHvlJJ2ovwL/u8xE0ildM=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoUW94PXoLr5TGi3Dy4xbq6vyhDItPxc58t6abl
 RFPIjla48yJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaFFveAAKCRAEWL7uWMY5
 RgkBD/9dtOU3K/e3NpjSkdYgne2dJ5ngj094WXloMO7B+XZLRGjdpTmKKGAgSfpFfiG/YL89edV
 59g5YxUGu8fApwVw5qTDBE8tGxaxWsAgOwLmN/amy4f8E45bVtXZ/uj77RzSzdvUAx5lFiSjQQr
 v4tlYPjS7nAnBCcNxJyMxKnTHhDzyq0KfQ/S/L82lBxtfCWiWvcmIIeGfRdf1ZU3x81lNaNZc6E
 Bx1dD3v8wdtFyxuP7cuXrjwSH4UOGqDAf0BEABjtk7+jSWi4xMoME6lncXyT0P7w1RDn/NinMRE
 H0NCpX9yDIKwcrXPqTZp8n34n54IAKvilLvaY9xymUqaInHKY7o2A1lCZN+IgiiCzspKLp8i06U
 DkhN23Y8yb7HxEMLiErq+Hx0FUpeJkGpgRgSF7xztEKONVgJnXyOjVBbUnsorfG7oU14O1W1zZA
 OBCTzDXDYItGjj3Ubnlo8JI74S6riRjzX7CYTlqlEK+TbRSRxleNscIySYDAOmOYOTdg7UkYTcN
 bqYekjnuB0ebsMw7huMgOI1SB40/y52VstObeaNtzMVSGE9bolmgbzcWyw1tG/+qOUUhAXsZW+9
 d3uDLoV1/kC/C50jbD7sm2UUoSpB3VmXecpL6kRdWvvt8R3ug01X9E+MZK3e9KMTiT8qFBl6rJ0 I2x0aVTi8mZ4Y/g==
X-Mailer: b4 0.14.2
Message-ID: <20250617-opaque-from-raw-v1-1-a2e99efa3ba2@google.com>
Subject: [PATCH] rust: types: add Opaque::from_raw
From: Alice Ryhl <aliceryhl@google.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Since commit b20fbbc08a36 ("rust: check type of `$ptr` in
`container_of!`") we have enforced that the field pointer passed to
container_of! must match the declared field. This caused mismatches when
using a pointer to bindings::x for fields of type Opaque<bindings::x>.

This situation encourages the user to simply pass field.cast() to the
container_of! macro, but this is not great because you might
accidentally pass a *mut bindings::y when the field type is
Opaque<bindings::x>, which would be wrong.

To help catch this kind of mistake, add a new Opaque::from_raw that
wraps a raw pointer in Opaque without changing the inner type.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/drm/device.rs  | 4 +---
 rust/kernel/drm/gem/mod.rs | 4 +---
 rust/kernel/lib.rs         | 7 +++++++
 rust/kernel/types.rs       | 5 +++++
 4 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index 624d7a4c83ead64b93325189f481d9b37c3c6eae..763c825d53aaba4f874361b785587b2c5129d49a 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -135,11 +135,9 @@ pub(crate) fn as_raw(&self) -> *mut bindings::drm_device {
     ///
     /// `ptr` must be a valid pointer to a `struct device` embedded in `Self`.
     unsafe fn from_drm_device(ptr: *const bindings::drm_device) -> *mut Self {
-        let ptr: *const Opaque<bindings::drm_device> = ptr.cast();
-
         // SAFETY: By the safety requirements of this function `ptr` is a valid pointer to a
         // `struct drm_device` embedded in `Self`.
-        unsafe { crate::container_of!(ptr, Self, dev) }.cast_mut()
+        unsafe { crate::container_of!(Opaque::from_raw(ptr), Self, dev) }.cast_mut()
     }
 
     /// Not intended to be called externally, except via declare_drm_ioctls!()
diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index 4cd69fa84318c3ff2cec57949e9bab05559a3c2f..5b80c248761bb39914a63ad7947aa8d3779054ef 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -125,11 +125,9 @@ fn as_raw(&self) -> *mut bindings::drm_gem_object {
     }
 
     unsafe fn as_ref<'a>(self_ptr: *mut bindings::drm_gem_object) -> &'a Self {
-        let self_ptr: *mut Opaque<bindings::drm_gem_object> = self_ptr.cast();
-
         // SAFETY: `obj` is guaranteed to be in an `Object<T>` via the safety contract of this
         // function
-        unsafe { &*crate::container_of!(self_ptr, Object<T>, obj) }
+        unsafe { &*crate::container_of!(Opaque::from_raw(self_ptr), Object<T>, obj) }
     }
 }
 
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 6b4774b2b1c37f4da1866e993be6230bc6715841..d2402d42b8776c9399a7dfdbe7bd61de7ef8dba3 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -204,6 +204,13 @@ fn panic(info: &core::panic::PanicInfo<'_>) -> ! {
 
 /// Produces a pointer to an object from a pointer to one of its fields.
 ///
+/// If you encounter a type mismatch due to the [`Opaque`] type, then use [`Opaque::raw_get`] or
+/// [`Opaque::from_raw`] to resolve the mismatch.
+///
+/// [`Opaque`]: crate::types::Opaque
+/// [`Opaque::raw_get`]: crate::types::Opaque::raw_get
+/// [`Opaque::from_raw`]: crate::types::Opaque::from_raw
+///
 /// # Safety
 ///
 /// The pointer passed to this macro, and the pointer returned by this macro, must both be in
diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
index 22985b6f69820d6df8ff3aae0bf815fad36a9d92..a79295500b3c812326cea8a9d339a8545a7f457d 100644
--- a/rust/kernel/types.rs
+++ b/rust/kernel/types.rs
@@ -413,6 +413,11 @@ pub const fn get(&self) -> *mut T {
     pub const fn raw_get(this: *const Self) -> *mut T {
         UnsafeCell::raw_get(this.cast::<UnsafeCell<MaybeUninit<T>>>()).cast::<T>()
     }
+
+    /// The opposite operation of [`Opaque::raw_get`].
+    pub const fn from_raw(this: *const T) -> *const Self {
+        this.cast()
+    }
 }
 
 /// Types that are _always_ reference counted.

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250617-opaque-from-raw-ac5b8ef6faa2

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

