Received: from sonic315-20.consmr.mail.ne1.yahoo.com (sonic315-20.consmr.mail.ne1.yahoo.com [66.163.190.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4961ACEAD
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 18:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.190.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743185047; cv=none; b=WD5tSeS27Bn7ydfeeOP+V9+PM5Y9zmyIjaL99FdqfRKOd7kD5DfyLzVRIFSf0Vog/zzkHLvzd3Jmfbx6XBze43I9rLj4em27YnODM5IGAHy7H7aYfy2n9+tsEOopUQHeb9PMd2A1gpH24KlcnAXuMrf0jUAqUd/95G+xWPwJ9uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743185047; c=relaxed/simple;
	bh=nlCUIx44KF+GxeZyIe7akNIigE88CAzW6BBWroie/4w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j0McJbHe372nk3p5WnGVX1UK4/k0m5zTqLq6uUQfTCvAKJDj63w5+MziBURy1ucIyhgHz8A9lXa8XI8DB5NVqQMfp/8OACIPRnaXLI9YCRf0rLt+xZcUlbsom8wTqhO5JSkj0sIzOcqNY78IFTX+Ri+8Jw0ogfE2Q50GZn9KrW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=Zo8fsDjR; arc=none smtp.client-ip=66.163.190.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="Zo8fsDjR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1743185043; bh=ECtK13jpKQaKG473YT8SJ1hzG929E2lOvC06lN5og2U=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=Zo8fsDjR+kAKqWQN5AGI2C7Eg9Xp+/TCAxZ2Le9pxNI+lJ16C4fAf6nR2evjaW7vq4Hr7oLUjgpeNsNRrtFVT2JZH+mVUr53VICZ0XlRZXrKcJPOv+E/N+Jc9kdq+L3Deoq694vHvEaICGUsY5N0vSVTsbJECE4hea7t+TfGTaKCSC7hP4nzOWKU2HzbMNuCf68iXvJxkamTiDsDQDed6kyF+zN1J/wk6njq9NLNu5378bz7ljZu9G+t7k9VtmoUwPbpPMjHlIZHJCpdsfVFNLOikjiaaOy3R5sWxYFNnkAw/0vCYlVVBwVAQPUMjx2kYtyJ4Q/e3+hDGhETfeAj+w==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1743185043; bh=fMWcWojDG5kXpyVXFtOonF3AJY87xMbVR2Z1PCM9HE4=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=dpTWYNWAvBFkeYx0IMm807OJkXJhk3JQc2qh+9yBjw5rSK3YFtqIBiOpOhlu8eQMT1ZjU8EKSrqJIROF1y3ez93S7poq1C5P4JCZdS9q4sc9qCRA8D5RzEGCvx27RUc2BSa5eM6bc2SOjUuWFKrRKHTieOrn6zT8V8OKaIQK6ajhkAxvOA4BerWj3QgIFch9f5vRWMzrjT3eCAqFgAFfzk8Ct/l+Fna4pUb49E/8+HUMx4gOpvp52gGO36ehmucnxysmDhPXyOmj8fcyAKWnrszN/n0GHv91XfJL0NszSh3IygBbXlcvbL3F3L/3iss5rbQkeoxxRxZOLP3AYleftw==
X-YMail-OSG: 4bHaV_cVM1lHRlj8PGjrxH.v42qMjx2QQE8Ynbd.7ZsCwl4tl.vy3oredXlx.YN
 GQKdAzdFglYSpfaiVjDQJCgIpjY1sNqXDrPGJGdaPyJlnIU4RR5J7GpDx6jB0POi54HanWl18ClW
 A.DmPtI6fwInhRb9zOSVuCwaVryh3psj1YouRr5PCyffkEFOJ.5W56kbqvzCr8P4vv0DwIAjsud1
 8Mpf0CKX3uGmHN8RLZwo1EdMUkhZ4mDQMmRIQvbV2wJWEo13aW1SBFmEAu8rch5V0ml5nvaJiczX
 vtEDGIbTBA7zqqQrHF2Mv5cweuVNJT_wJ282lIyopmVKb5YdXFHFvZWQNWoPpEfdrK3gyL5Rwpa9
 uy1svi4nSObCXUduxuMDLXt7LRz0wst9V.T6N91FPJAGIsFf7hrn8UFGaXh7OqFNSYR_lITnzdIg
 7rNNhaq1kpSUzBHm42.5z5NyuINa8B4mVjobMOTxfdLboBXkk92mn19Zyry2EQJU0XJLNlnYKuSG
 oKR2H5cEWuWpPNnp8sExkSbz_gIu9gqbNEXvLDj0dT3eBaH5up.kQiyhtebBklMZpRaS0iQskekL
 c7EPQOQIWXqrEQ_SzKyvyFKZOqbaXe4o.xYKnwsRnt2NQty8yizYMpzKSx8flga0ZPX8rPuuSQAu
 OZ27hzskAyIKps6Wu4DcNqpEIMwFolEYilqU_i7F6wR14ICYTJFmkgX2BmZaHq0yrZvqE5hp9nxd
 dOfdlSsWRFRb0hzjz241i2ihpMG3Fkoxcsr9F_HFRsr6FSlSoUEPHBXD.uFZfUpX.u7kxF9wEgTX
 eAMk0VSoxS640O82ZT6wM1sKd16Uar7VYy7dmVHGsEp3M8bh_grsTRsWBx0TS6Xr4CNcLPClaySB
 l.YpgQoZ.rvcMXwKIxoLsI72Xc1K7X6rzo2t3ZoPqjI3F4W7jdmejJqsNr9_PsaPlPJ_StUbScQC
 OOmITu863od7QZZtniXbF8N4vYiSIaS2l8U5y11l3jk.3Ry4VqYEFzvGk_1QscOaNmfAsOL5UUSv
 oJjh26OZLkHCznBQkXLAggBNNqy2yKjxAMJNio4ApQEjtfUWPvrNZVTRLGfZ.7mo.JFdAdIUW68D
 lUHy9tFOwGN73VXd0bG33E7Sk1qF87uqEyh8DpBiHHR3JgTv0HwJLWSuMb4uAr3SZMQmaScrtlpK
 UwD1q8zAr5ZF_l2j21maMtbbJZjmZN6sZAgVZNudpuzJeUemUr3bR17uu5Jr2q5bvjld8AW.2WU5
 WP7LD_3qKkeZw0MEgTdIFmsp4ntLwynQAvz9j6z2jbIVDoFeeQ5nH8ALdplORzDkslshpFSzwQDx
 o2ZKsIME1OpEpwkX27sB.nuZOmC.dHjyfThdxFXXwc8F7Q3w5KblNL85W0x0O87hq3TU49EMUjG8
 J0Zo4LQmx8YU6qBxGMoOp0_rZMNUEqEo_C62JK1StEuTlLyFjqqE4XhW7dKYTOBLmxziS7BO.UKU
 sfDZIY9iqKNeYyLoBh8WcvT.AFosJPm8R4WbB7M0aTrk6C_izH_S2Ye9ZTkFow7lxFvSkqxDTWrR
 h5ufz8Xt045ij7SKkht.3g9csdd8HBZ7jwB4Q0KWhRX8MuCqcgYXbOEC0AZYPQnT1DOqS0.pVmK_
 NGYcVgtST53UeMqzEducvhnGlTaF.eBbc54p.0ymNu_AlWJkzvnp3Lj5.QEFpf2HhfLLr9HI3AGT
 B4G90jmxlPjG1h.YBeifsxCWGaIbT2S6UTWLM4vO6g9j2KXWegPVwK7Qik6Xqym9aSe1mOi_eZ39
 PFc.hIWqCnm1BrnCcpPNutKUVQrt7myWcoB_vtQUUdJOUNEhH2Yl1w1xudyvNQCals3ac66SxtAO
 S4qNUsoa0rcZJtfN2zfI5ackgrkx1QygX2UA36XdLIBrdlTn4Nhjdb_YE72ZYGoV07vR9PvMIvhI
 3X6c0gTsy_QzrnCkMqb8j5K6qhYLyYE96gjn7QzO9S__D6Agw3vLGgrrmJ5GKC9j2nf1xcqB70wj
 Ap9o5i_T3V0_yyaJJxn8pvf6qnJ84YpTCrOcGkFdou3xkc3JMUdnDDe75KZLk7jcThBqCBugrpd5
 gNKyQOQyL3ujCCFAHof7QmRaAWErk1mzQkpOC_ivPBBV2Gl3A7N4mvfJYO8qg1QkHaai3F7SQvos
 zer1Otz2Qk4G5WOjKqs_Zhk17TqRhOvao4UPei_g8YsEaEIRwYyj2an0euFEp2O8XLMtYb_dBOCi
 Yb8gspRDFvpU83AvCmuoV_Rnmho25ZfcZm5i654_nJcdwI8XLphMJ9s_cC5hGDJCAQm0wDH4gQes
 -
X-Sonic-MF: <igor.korotin@yahoo.com>
X-Sonic-ID: b51509a4-2dd0-499c-afa3-861129489411
Received: from sonic.gate.mail.ne1.yahoo.com by sonic315.consmr.mail.ne1.yahoo.com with HTTP; Fri, 28 Mar 2025 18:04:03 +0000
Received: by hermes--production-ir2-54ff696c44-sqp8l (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 9492d6006d749a300ac3f1ee8e308470;
          Fri, 28 Mar 2025 18:03:59 +0000 (UTC)
From: Igor Korotin <igor.korotin@yahoo.com>
To: benno.lossin@proton.me
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Igor Korotin <igor.korotin@yahoo.com>
Subject: [PATCH v2 1/1] rust: macros: Fix macro referencing core and kernel crates v2
Date: Fri, 28 Mar 2025 18:03:12 +0000
Message-ID: <20250328180312.2025317-2-igor.korotin@yahoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250328180312.2025317-1-igor.korotin@yahoo.com>
References: <D8RHIOTYBFI5.3ETKTDNGZW3FH@proton.me>
 <20250328180312.2025317-1-igor.korotin@yahoo.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update macros to always use absolute paths for crates `core` and `kernel`.
This guarantees that macros will not pick up user-defined crates `core`
or `kernel` by accident.

Changes since v1:
- Fixed paths in auto-generated code.

Suggested-by: Benno Lossin <benno.lossin@proton.me>
Closes: https://github.com/Rust-for-Linux/linux/issues/1150
Signed-off-by: Igor Korotin <igor.korotin@yahoo.com>
---
 rust/ffi.rs                     |  2 +-
 rust/kernel/device.rs           |  2 +-
 rust/kernel/device_id.rs        |  4 ++--
 rust/kernel/kunit.rs            |  8 ++++----
 rust/kernel/static_assert.rs    |  4 ++--
 rust/kernel/str.rs              |  4 ++--
 rust/macros/kunit.rs            | 22 +++++++++++-----------
 rust/macros/lib.rs              |  6 +++---
 rust/macros/module.rs           | 31 ++++++++++++++++---------------
 scripts/rustdoc_test_builder.rs |  6 +++---
 scripts/rustdoc_test_gen.rs     | 16 ++++++++++------
 11 files changed, 55 insertions(+), 50 deletions(-)

diff --git a/rust/ffi.rs b/rust/ffi.rs
index 584f75b49862..d60aad792af4 100644
--- a/rust/ffi.rs
+++ b/rust/ffi.rs
@@ -17,7 +17,7 @@ macro_rules! alias {
 
         // Check size compatibility with `core`.
         const _: () = assert!(
-            core::mem::size_of::<$name>() == core::mem::size_of::<core::ffi::$name>()
+            ::core::mem::size_of::<$name>() == ::core::mem::size_of::<::core::ffi::$name>()
         );
     )*}
 }
diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index db2d9658ba47..2b19a8597158 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -214,7 +214,7 @@ unsafe impl Sync for Device {}
 macro_rules! dev_printk {
     ($method:ident, $dev:expr, $($f:tt)*) => {
         {
-            ($dev).$method(core::format_args!($($f)*));
+            ($dev).$method(::core::format_args!($($f)*));
         }
     }
 }
diff --git a/rust/kernel/device_id.rs b/rust/kernel/device_id.rs
index e5859217a579..0a4eb56d98f2 100644
--- a/rust/kernel/device_id.rs
+++ b/rust/kernel/device_id.rs
@@ -159,7 +159,7 @@ macro_rules! module_device_table {
                     "_", line!(),
                     "_", stringify!($table_name))
         ]
-        static $module_table_name: [core::mem::MaybeUninit<u8>; $table_name.raw_ids().size()] =
-            unsafe { core::mem::transmute_copy($table_name.raw_ids()) };
+        static $module_table_name: [::core::mem::MaybeUninit<u8>; $table_name.raw_ids().size()] =
+            unsafe { ::core::mem::transmute_copy($table_name.raw_ids()) };
     };
 }
diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
index 1604fb6a5b1b..81833a687b75 100644
--- a/rust/kernel/kunit.rs
+++ b/rust/kernel/kunit.rs
@@ -59,7 +59,7 @@ macro_rules! kunit_assert {
             }
 
             static FILE: &'static $crate::str::CStr = $crate::c_str!($file);
-            static LINE: i32 = core::line!() as i32 - $diff;
+            static LINE: i32 = ::core::line!() as i32 - $diff;
             static CONDITION: &'static $crate::str::CStr = $crate::c_str!(stringify!($condition));
 
             // SAFETY: FFI call without safety requirements.
@@ -130,11 +130,11 @@ unsafe impl Sync for UnaryAssert {}
             unsafe {
                 $crate::bindings::__kunit_do_failed_assertion(
                     kunit_test,
-                    core::ptr::addr_of!(LOCATION.0),
+                    ::core::ptr::addr_of!(LOCATION.0),
                     $crate::bindings::kunit_assert_type_KUNIT_ASSERTION,
-                    core::ptr::addr_of!(ASSERTION.0.assert),
+                    ::core::ptr::addr_of!(ASSERTION.0.assert),
                     Some($crate::bindings::kunit_unary_assert_format),
-                    core::ptr::null(),
+                    ::core::ptr::null(),
                 );
             }
 
diff --git a/rust/kernel/static_assert.rs b/rust/kernel/static_assert.rs
index 3115ee0ba8e9..f3f8c6eb7360 100644
--- a/rust/kernel/static_assert.rs
+++ b/rust/kernel/static_assert.rs
@@ -16,7 +16,7 @@
 ///
 /// ```
 /// static_assert!(42 > 24);
-/// static_assert!(core::mem::size_of::<u8>() == 1);
+/// static_assert!(::core::mem::size_of::<u8>() == 1);
 ///
 /// const X: &[u8] = b"bar";
 /// static_assert!(X[1] == b'a');
@@ -29,6 +29,6 @@
 #[macro_export]
 macro_rules! static_assert {
     ($condition:expr) => {
-        const _: () = core::assert!($condition);
+        const _: () = ::core::assert!($condition);
     };
 }
diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index 878111cb77bc..aed7b2617c32 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -595,7 +595,7 @@ fn deref(&self) -> &str {
 
     macro_rules! format {
         ($($f:tt)*) => ({
-            &*String::from_fmt(kernel::fmt!($($f)*))
+            &*String::from_fmt(::kernel::fmt!($($f)*))
         })
     }
 
@@ -944,5 +944,5 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
 /// A convenience alias for [`core::format_args`].
 #[macro_export]
 macro_rules! fmt {
-    ($($f:tt)*) => ( core::format_args!($($f)*) )
+    ($($f:tt)*) => ( ::core::format_args!($($f)*) )
 }
diff --git a/rust/macros/kunit.rs b/rust/macros/kunit.rs
index 4f553ecf40c0..61fc25228e72 100644
--- a/rust/macros/kunit.rs
+++ b/rust/macros/kunit.rs
@@ -88,29 +88,29 @@ pub(crate) fn kunit_tests(attr: TokenStream, ts: TokenStream) -> TokenStream {
     // Looks like:
     //
     // ```
-    // unsafe extern "C" fn kunit_rust_wrapper_foo(_test: *mut kernel::bindings::kunit) { foo(); }
-    // unsafe extern "C" fn kunit_rust_wrapper_bar(_test: *mut kernel::bindings::kunit) { bar(); }
+    // unsafe extern "C" fn kunit_rust_wrapper_foo(_test: *mut ::kernel::bindings::kunit) { foo(); }
+    // unsafe extern "C" fn kunit_rust_wrapper_bar(_test: *mut ::kernel::bindings::kunit) { bar(); }
     //
-    // static mut TEST_CASES: [kernel::bindings::kunit_case; 3] = [
-    //     kernel::kunit::kunit_case(kernel::c_str!("foo"), kunit_rust_wrapper_foo),
-    //     kernel::kunit::kunit_case(kernel::c_str!("bar"), kunit_rust_wrapper_bar),
-    //     kernel::kunit::kunit_case_null(),
+    // static mut TEST_CASES: [::kernel::bindings::kunit_case; 3] = [
+    //     ::kernel::kunit::kunit_case(::kernel::c_str!("foo"), kunit_rust_wrapper_foo),
+    //     ::kernel::kunit::kunit_case(::kernel::c_str!("bar"), kunit_rust_wrapper_bar),
+    //     ::kernel::kunit::kunit_case_null(),
     // ];
     //
-    // kernel::kunit_unsafe_test_suite!(kunit_test_suit_name, TEST_CASES);
+    // ::kernel::kunit_unsafe_test_suite!(kunit_test_suit_name, TEST_CASES);
     // ```
     let mut kunit_macros = "".to_owned();
     let mut test_cases = "".to_owned();
     for test in &tests {
         let kunit_wrapper_fn_name = format!("kunit_rust_wrapper_{}", test);
         let kunit_wrapper = format!(
-            "unsafe extern \"C\" fn {}(_test: *mut kernel::bindings::kunit) {{ {}(); }}",
+            "unsafe extern \"C\" fn {}(_test: *mut ::kernel::bindings::kunit) {{ {}(); }}",
             kunit_wrapper_fn_name, test
         );
         writeln!(kunit_macros, "{kunit_wrapper}").unwrap();
         writeln!(
             test_cases,
-            "    kernel::kunit::kunit_case(kernel::c_str!(\"{}\"), {}),",
+            "    ::kernel::kunit::kunit_case(::kernel::c_str!(\"{}\"), {}),",
             test, kunit_wrapper_fn_name
         )
         .unwrap();
@@ -119,14 +119,14 @@ pub(crate) fn kunit_tests(attr: TokenStream, ts: TokenStream) -> TokenStream {
     writeln!(kunit_macros).unwrap();
     writeln!(
         kunit_macros,
-        "static mut TEST_CASES: [kernel::bindings::kunit_case; {}] = [\n{test_cases}    kernel::kunit::kunit_case_null(),\n];",
+        "static mut TEST_CASES: [::kernel::bindings::kunit_case; {}] = [\n{test_cases}    ::kernel::kunit::kunit_case_null(),\n];",
         tests.len() + 1
     )
     .unwrap();
 
     writeln!(
         kunit_macros,
-        "kernel::kunit_unsafe_test_suite!({attr}, TEST_CASES);"
+        "::kernel::kunit_unsafe_test_suite!({attr}, TEST_CASES);"
     )
     .unwrap();
 
diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index 9acaa68c974e..cb429eceff71 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -283,7 +283,7 @@ pub fn concat_idents(ts: TokenStream) -> TokenStream {
 /// # const binder_driver_return_protocol_BR_FAILED_REPLY: u32 = 14;
 /// macro_rules! pub_no_prefix {
 ///     ($prefix:ident, $($newname:ident),+) => {
-///         kernel::macros::paste! {
+///         ::kernel::macros::paste! {
 ///             $(pub(crate) const $newname: u32 = [<$prefix $newname>];)+
 ///         }
 ///     };
@@ -340,7 +340,7 @@ pub fn concat_idents(ts: TokenStream) -> TokenStream {
 /// # const binder_driver_return_protocol_BR_FAILED_REPLY: u32 = 14;
 /// macro_rules! pub_no_prefix {
 ///     ($prefix:ident, $($newname:ident),+) => {
-///         kernel::macros::paste! {
+///         ::kernel::macros::paste! {
 ///             $(pub(crate) const fn [<$newname:lower:span>]() -> u32 { [<$prefix $newname:span>] })+
 ///         }
 ///     };
@@ -375,7 +375,7 @@ pub fn concat_idents(ts: TokenStream) -> TokenStream {
 /// ```
 /// macro_rules! create_numbered_fn {
 ///     ($name:literal, $val:literal) => {
-///         kernel::macros::paste! {
+///         ::kernel::macros::paste! {
 ///             fn [<some_ $name _fn $val>]() -> u32 { $val }
 ///         }
 ///     };
diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index 8ab4e1f3eb45..615cefd4160a 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -224,20 +224,20 @@ pub(crate) fn module(ts: TokenStream) -> TokenStream {
             // SAFETY: `__this_module` is constructed by the kernel at load time and will not be
             // freed until the module is unloaded.
             #[cfg(MODULE)]
-            static THIS_MODULE: kernel::ThisModule = unsafe {{
+            static THIS_MODULE: ::kernel::ThisModule = unsafe {{
                 extern \"C\" {{
-                    static __this_module: kernel::types::Opaque<kernel::bindings::module>;
+                    static __this_module: ::kernel::types::Opaque<::kernel::bindings::module>;
                 }}
 
-                kernel::ThisModule::from_ptr(__this_module.get())
+                ::kernel::ThisModule::from_ptr(__this_module.get())
             }};
             #[cfg(not(MODULE))]
-            static THIS_MODULE: kernel::ThisModule = unsafe {{
-                kernel::ThisModule::from_ptr(core::ptr::null_mut())
+            static THIS_MODULE: ::kernel::ThisModule = unsafe {{
+                ::kernel::ThisModule::from_ptr(::core::ptr::null_mut())
             }};
 
-            impl kernel::ModuleMetadata for {type_} {{
-                const NAME: &'static kernel::str::CStr = kernel::c_str!(\"{name}\");
+            impl ::kernel::ModuleMetadata for {type_} {{
+                const NAME: &'static ::kernel::str::CStr = ::kernel::c_str!(\"{name}\");
             }}
 
             // Double nested modules, since then nobody can access the public items inside.
@@ -255,8 +255,8 @@ mod __module_init {{
                     #[used]
                     static __IS_RUST_MODULE: () = ();
 
-                    static mut __MOD: core::mem::MaybeUninit<{type_}> =
-                        core::mem::MaybeUninit::uninit();
+                    static mut __MOD: ::core::mem::MaybeUninit<{type_}> =
+                        ::core::mem::MaybeUninit::uninit();
 
                     // Loadable modules need to export the `{{init,cleanup}}_module` identifiers.
                     /// # Safety
@@ -267,7 +267,7 @@ mod __module_init {{
                     #[doc(hidden)]
                     #[no_mangle]
                     #[link_section = \".init.text\"]
-                    pub unsafe extern \"C\" fn init_module() -> kernel::ffi::c_int {{
+                    pub unsafe extern \"C\" fn init_module() -> ::kernel::ffi::c_int {{
                         // SAFETY: This function is inaccessible to the outside due to the double
                         // module wrapping it. It is called exactly once by the C side via its
                         // unique name.
@@ -306,11 +306,12 @@ mod __module_init {{
                     #[doc(hidden)]
                     #[link_section = \"{initcall_section}\"]
                     #[used]
-                    pub static __{name}_initcall: extern \"C\" fn() -> kernel::ffi::c_int = __{name}_init;
+                    pub static __{name}_initcall: extern \"C\" fn() -> ::kernel::ffi::c_int =
+                        __{name}_init;
 
                     #[cfg(not(MODULE))]
                     #[cfg(CONFIG_HAVE_ARCH_PREL32_RELOCATIONS)]
-                    core::arch::global_asm!(
+                    ::core::arch::global_asm!(
                         r#\".section \"{initcall_section}\", \"a\"
                         __{name}_initcall:
                             .long   __{name}_init - .
@@ -321,7 +322,7 @@ mod __module_init {{
                     #[cfg(not(MODULE))]
                     #[doc(hidden)]
                     #[no_mangle]
-                    pub extern \"C\" fn __{name}_init() -> kernel::ffi::c_int {{
+                    pub extern \"C\" fn __{name}_init() -> ::kernel::ffi::c_int {{
                         // SAFETY: This function is inaccessible to the outside due to the double
                         // module wrapping it. It is called exactly once by the C side via its
                         // placement above in the initcall section.
@@ -344,9 +345,9 @@ mod __module_init {{
                     /// # Safety
                     ///
                     /// This function must only be called once.
-                    unsafe fn __init() -> kernel::ffi::c_int {{
+                    unsafe fn __init() -> ::kernel::ffi::c_int {{
                         let initer =
-                            <{type_} as kernel::InPlaceModule>::init(&super::super::THIS_MODULE);
+                            <{type_} as ::kernel::InPlaceModule>::init(&super::super::THIS_MODULE);
                         // SAFETY: No data race, since `__MOD` can only be accessed by this module
                         // and there only `__init` and `__exit` access it. These functions are only
                         // called once and `__exit` cannot be called before or during `__init`.
diff --git a/scripts/rustdoc_test_builder.rs b/scripts/rustdoc_test_builder.rs
index e5894652f12c..81233fb56b66 100644
--- a/scripts/rustdoc_test_builder.rs
+++ b/scripts/rustdoc_test_builder.rs
@@ -28,7 +28,7 @@ fn main() {
     //
     // ```
     // fn main() { #[allow(non_snake_case)] fn _doctest_main_rust_kernel_file_rs_28_0() {
-    // fn main() { #[allow(non_snake_case)] fn _doctest_main_rust_kernel_file_rs_37_0() -> Result<(), impl core::fmt::Debug> {
+    // fn main() { #[allow(non_snake_case)] fn _doctest_main_rust_kernel_file_rs_37_0() -> Result<(), impl ::core::fmt::Debug> {
     // ```
     //
     // It should be unlikely that doctest code matches such lines (when code is formatted properly).
@@ -49,8 +49,8 @@ fn main() {
 
     // Qualify `Result` to avoid the collision with our own `Result` coming from the prelude.
     let body = body.replace(
-        &format!("{rustdoc_function_name}() -> Result<(), impl core::fmt::Debug> {{"),
-        &format!("{rustdoc_function_name}() -> core::result::Result<(), impl core::fmt::Debug> {{"),
+        &format!("{rustdoc_function_name}() -> Result<(), impl ::core::fmt::Debug> {{"),
+        &format!("{rustdoc_function_name}() -> ::core::result::Result<(), impl ::core::fmt::Debug> {{"),
     );
 
     // For tests that get generated with `Result`, like above, `rustdoc` generates an `unwrap()` on
diff --git a/scripts/rustdoc_test_gen.rs b/scripts/rustdoc_test_gen.rs
index 036635fb1621..f8d053f75270 100644
--- a/scripts/rustdoc_test_gen.rs
+++ b/scripts/rustdoc_test_gen.rs
@@ -167,12 +167,14 @@ fn main() {
             rust_tests,
             r#"/// Generated `{name}` KUnit test case from a Rust documentation test.
 #[no_mangle]
-pub extern "C" fn {kunit_name}(__kunit_test: *mut kernel::bindings::kunit) {{
+pub extern "C" fn {kunit_name}(__kunit_test: *mut ::kernel::bindings::kunit) {{
     /// Overrides the usual [`assert!`] macro with one that calls KUnit instead.
     #[allow(unused)]
     macro_rules! assert {{
         ($cond:expr $(,)?) => {{{{
-            kernel::kunit_assert!("{kunit_name}", "{real_path}", __DOCTEST_ANCHOR - {line}, $cond);
+            ::kernel::kunit_assert!(
+                "{kunit_name}", "{real_path}", __DOCTEST_ANCHOR - {line}, $cond
+            );
         }}}}
     }}
 
@@ -180,13 +182,15 @@ macro_rules! assert {{
     #[allow(unused)]
     macro_rules! assert_eq {{
         ($left:expr, $right:expr $(,)?) => {{{{
-            kernel::kunit_assert_eq!("{kunit_name}", "{real_path}", __DOCTEST_ANCHOR - {line}, $left, $right);
+            ::kernel::kunit_assert_eq!(
+                "{kunit_name}", "{real_path}", __DOCTEST_ANCHOR - {line}, $left, $right
+            );
         }}}}
     }}
 
     // Many tests need the prelude, so provide it by default.
     #[allow(unused)]
-    use kernel::prelude::*;
+    use ::kernel::prelude::*;
 
     // Unconditionally print the location of the original doctest (i.e. rather than the location in
     // the generated file) so that developers can easily map the test back to the source code.
@@ -197,11 +201,11 @@ macro_rules! assert_eq {{
     // This follows the syntax for declaring test metadata in the proposed KTAP v2 spec, which may
     // be used for the proposed KUnit test attributes API. Thus hopefully this will make migration
     // easier later on.
-    kernel::kunit::info(format_args!("    # {kunit_name}.location: {real_path}:{line}\n"));
+    ::kernel::kunit::info(format_args!("    # {kunit_name}.location: {real_path}:{line}\n"));
 
     /// The anchor where the test code body starts.
     #[allow(unused)]
-    static __DOCTEST_ANCHOR: i32 = core::line!() as i32 + {body_offset} + 1;
+    static __DOCTEST_ANCHOR: i32 = ::core::line!() as i32 + {body_offset} + 1;
     {{
         {body}
         main();
-- 
2.43.0

