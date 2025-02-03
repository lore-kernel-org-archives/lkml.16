Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28AA320370D;
	Mon,  3 Feb 2025 11:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738583441; cv=none; b=uhODdYBjnKXI1YdmDt4ccOxQ8F8HTDzE6K49yBrWiTYbq9yQHqXA7kXXNIxqsdWU0BxoTfwVdhlZ5lC6hIr3Zks+XT5ATsTCU11RiKqAetmw+AiwNFXYgu6RgoXPz7W/hKYp3NGVe+gCqijArU58i3iHFAJVhbuDFcKlUTJXbFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738583441; c=relaxed/simple;
	bh=eORAKQVLowETgizLa4/np6sYZbSCzYW5ILAB+ErjH1o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=InSnOsSxBZkVjUYAzBfiDf5nEOSQLwVIgHYTc8fAUIiH21sOh2hJsdCiKIXFLkG0a80TGY/V3zexsBjR6WuwAaZNHUKIRKgyCOlnrcs84B6ruXxGUVkURlge2wZug/ErJfL77CPGtAHnluZhpaIpr6F7+AOTqYJ86QpioM0Z06E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hX7ijgmV; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hX7ijgmV"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6d888fc8300so19450566d6.3;
        Mon, 03 Feb 2025 03:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738583438; x=1739188238; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NNPwVnOFpCLxp1yviLIHuAXCLL7HWNGaSzEhnwzmXGQ=;
        b=hX7ijgmVXNJH3gBb1wptCpvEpXZ/+w7FAcPyTBk6D1Yw07BsfPTrGoyZtdj1A0rIzf
         I0tQr8T4y3OpLDvAA6G2DF9gvctsczxkuKVxGJ42xmfOa+Otuv5eoL4df5nCUwAuQkC5
         7BwDRnu8MiXlu2cs/MBT/ptC2sPTD8wgagFHLQSC2a+tm/53STlgZIeb3Rg/ieUzeGm/
         iIcdkttcIlHcwZU2ZvXCp0KxBgX2iMOSJe3+Z44+M30PqdOk6feUpN2EBv1ZTrMd2vHo
         855miGesVBKvEwjOTlOdLqMR5z66vCh0TN3qs+C/yqx74g3/ulMUYbU415hYChvWTp0Z
         1oCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583438; x=1739188238;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NNPwVnOFpCLxp1yviLIHuAXCLL7HWNGaSzEhnwzmXGQ=;
        b=JwSYANm3AoUzWvTPIfYUd8MK3BnKdKyT2QP8EXsbT7xwmQWFEYIsyuI3e8HlQh6JaQ
         FqGidDm9GC18bxcb02OtMnM0Pfl1AfCxa+87lo7TbOHBbU8kqj1Ihe/GMFLTvjG3orQp
         cwL2kJJ/2n+i3Lc8LldkkamBTH9qq8ajBgjVP5CvxYiIUtwyehj0xu3OixiayrLrdQFI
         6OlkxmPdcd9ImfbySHK8+Zu0KxR4PvtcD9PIMXy7xsd/kh+0YolDJ7gwjoHzG2NUdr1n
         nifmMus/0iw9jsXp9vIGBRQUkIkWjsrJLmPx1Xfg3Eg0lMNCxnDkOosEjdsQ2W0P1jLF
         tlEw==
X-Forwarded-Encrypted: i=1; AJvYcCXNzSbmT0RNBJO65WEExxk4V3aK5uDIKuwROmhzTVWEguRZzFYQKy3ZXALfAnlaHeGo7a5fo6/s6UJ4ZSw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyahtDgSjeyrmLg5L7cokWFOZKZ4T0FKs19iUhQa6MwbvlJZQah
	foDVLOipldnu1+h0V5S20o+KxkVNzLzA5HO1PyI+sAq06bWW5Ots
X-Gm-Gg: ASbGncvERDXpFFOr1ilLIv3yRuLlgX5a9AmVEUvjX2nGnVRdDLWHpB45gLfrEXrhuw/
	e2LL/u++CP6AbwABac69qahws6DZ1VM0T1BEXTF1GBl+FiXLcnmv64CBz5SM85g2SOz3WtKhwiX
	7OCRh2DOwOifazEmafavtGKJpbizI5XWcIAg0TGYGL6mFUyk3K8uKEfFiYQhWrZ9S4fBRFc3DoH
	vwDzPGw5Qsi5hqPgOMNqJvlOdd1vY70jzci2TyuXkty1XiYpC1iqG8t4P2FtNYkie166R4uDAqz
	mpjyeWNDcNIFWmATLHiWNa4UHcs92BLRpqxtuHQ=
X-Google-Smtp-Source: AGHT+IFqUxAC1WEwTP4E/w5Z5FP3YbWo/tiHf45pLds0UPDhlMzKavJBxzOaAwcdAo4yCOS91vjS/g==
X-Received: by 2002:a05:6214:2347:b0:6d8:99cf:d2eb with SMTP id 6a1803df08f44-6e243bf439emr290139156d6.21.1738583437854;
        Mon, 03 Feb 2025 03:50:37 -0800 (PST)
Received: from tamird-mac.local ([2600:4041:5be7:7c00:f07f:fb14:288d:6f1e])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e254835641sm49537626d6.62.2025.02.03.03.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:50:36 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 03 Feb 2025 06:50:31 -0500
Subject: [PATCH v8 1/4] rust: move BStr,CStr Display impls behind method
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250203-cstr-core-v8-1-cb3f26e78686@gmail.com>
References: <20250203-cstr-core-v8-0-cb3f26e78686@gmail.com>
In-Reply-To: <20250203-cstr-core-v8-0-cb3f26e78686@gmail.com>
To: Michal Rostecki <vadorovsky@protonmail.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

There are two reasons for doing this:
- Moving the Display impl behind a display method matches the style used
  in the standard library for printing non-Unicode data.
- The standard library's core::ffi::CStr doesn't implement Display;
  moving Display to a helper struct is a necessary step toward using it.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/kunit.rs |   9 ++--
 rust/kernel/str.rs   | 121 +++++++++++++++++++++++++++++++++++----------------
 2 files changed, 90 insertions(+), 40 deletions(-)

diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
index 824da0e9738a..630b947c708c 100644
--- a/rust/kernel/kunit.rs
+++ b/rust/kernel/kunit.rs
@@ -56,6 +56,7 @@ macro_rules! kunit_assert {
                 break 'out;
             }
 
+            static NAME: &'static $crate::str::CStr = $crate::c_str!($name);
             static FILE: &'static $crate::str::CStr = $crate::c_str!($file);
             static LINE: i32 = core::line!() as i32 - $diff;
             static CONDITION: &'static $crate::str::CStr = $crate::c_str!(stringify!($condition));
@@ -71,11 +72,13 @@ macro_rules! kunit_assert {
                 //
                 // This mimics KUnit's failed assertion format.
                 $crate::kunit::err(format_args!(
-                    "    # {}: ASSERTION FAILED at {FILE}:{LINE}\n",
-                    $name
+                    "    # {NAME}: ASSERTION FAILED at {FILE}:{LINE}\n",
+                    NAME = NAME.display(),
+                    FILE = FILE.display(),
                 ));
                 $crate::kunit::err(format_args!(
-                    "    Expected {CONDITION} to be true, but is false\n"
+                    "    Expected {CONDITION} to be true, but is false\n",
+                    CONDITION = CONDITION.display(),
                 ));
                 $crate::kunit::err(format_args!(
                     "    Failure not reported to KUnit since this is a non-KUnit task\n"
diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index 28e2201604d6..c273f1367607 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -31,29 +31,77 @@ pub const fn from_bytes(bytes: &[u8]) -> &Self {
         // SAFETY: `BStr` is transparent to `[u8]`.
         unsafe { &*(bytes as *const [u8] as *const BStr) }
     }
-}
 
-impl fmt::Display for BStr {
-    /// Formats printable ASCII characters, escaping the rest.
+    /// Returns an object that implements [`Display`] for safely printing a [`BStr`] that may
+    /// contain non-Unicode data. If you would like an implementation which escapes the [`BStr`]
+    /// please use [`Debug`] instead.
+    ///
+    /// [`Display`]: fmt::Display
+    /// [`Debug`]: fmt::Debug
+    ///
+    /// # Examples
     ///
     /// ```
-    /// # use kernel::{fmt, b_str, str::{BStr, CString}};
+    /// # use kernel::{fmt, b_str, str::CString};
     /// let ascii = b_str!("Hello, BStr!");
-    /// let s = CString::try_from_fmt(fmt!("{}", ascii))?;
+    /// let s = CString::try_from_fmt(fmt!("{}", ascii.display()))?;
     /// assert_eq!(s.as_bytes(), "Hello, BStr!".as_bytes());
     ///
     /// let non_ascii = b_str!("🦀");
-    /// let s = CString::try_from_fmt(fmt!("{}", non_ascii))?;
+    /// let s = CString::try_from_fmt(fmt!("{}", non_ascii.display()))?;
     /// assert_eq!(s.as_bytes(), "\\xf0\\x9f\\xa6\\x80".as_bytes());
     /// # Ok::<(), kernel::error::Error>(())
     /// ```
+    #[inline]
+    pub fn display(&self) -> Display<'_> {
+        Display {
+            inner: self,
+            escape_common: true,
+        }
+    }
+}
+
+/// Helper struct for safely printing a [`BStr`] with [`fmt!`] and `{}`.
+///
+/// A [`BStr`] might contain non-Unicode data. This `struct` implements the [`Display`] trait in a
+/// way that mitigates that. It is created by the [`display`](BStr::display) method on [`BStr`].
+///
+/// If you would like an implementation which escapes the string please use [`Debug`] instead.
+///
+/// # Examples
+///
+/// ```
+/// # use kernel::{fmt, b_str, str::CString};
+/// let ascii = b_str!("Hello, BStr!");
+/// let s = CString::try_from_fmt(fmt!("{}", ascii.display()))?;
+/// assert_eq!(s.as_bytes(), "Hello, BStr!".as_bytes());
+///
+/// let non_ascii = b_str!("🦀");
+/// let s = CString::try_from_fmt(fmt!("{}", non_ascii.display()))?;
+/// assert_eq!(s.as_bytes(), "\\xf0\\x9f\\xa6\\x80".as_bytes());
+/// # Ok::<(), kernel::error::Error>(())
+/// ```
+///
+/// [`fmt!`]: crate::fmt
+/// [`Debug`]: fmt::Debug
+/// [`Display`]: fmt::Display
+pub struct Display<'a> {
+    inner: &'a BStr,
+    escape_common: bool,
+}
+
+impl fmt::Display for Display<'_> {
     fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
-        for &b in &self.0 {
+        let Self {
+            inner: BStr(b),
+            escape_common,
+        } = self;
+        for &b in b {
             match b {
                 // Common escape codes.
-                b'\t' => f.write_str("\\t")?,
-                b'\n' => f.write_str("\\n")?,
-                b'\r' => f.write_str("\\r")?,
+                b'\t' if *escape_common => f.write_str("\\t")?,
+                b'\n' if *escape_common => f.write_str("\\n")?,
+                b'\r' if *escape_common => f.write_str("\\r")?,
                 // Printable characters.
                 0x20..=0x7e => f.write_char(b as char)?,
                 _ => write!(f, "\\x{:02x}", b)?,
@@ -68,7 +116,7 @@ impl fmt::Debug for BStr {
     /// escaping the rest.
     ///
     /// ```
-    /// # use kernel::{fmt, b_str, str::{BStr, CString}};
+    /// # use kernel::{fmt, b_str, str::CString};
     /// // Embedded double quotes are escaped.
     /// let ascii = b_str!("Hello, \"BStr\"!");
     /// let s = CString::try_from_fmt(fmt!("{:?}", ascii))?;
@@ -376,35 +424,35 @@ pub fn to_ascii_uppercase(&self) -> Result<CString, AllocError> {
 
         Ok(s)
     }
-}
 
-impl fmt::Display for CStr {
-    /// Formats printable ASCII characters, escaping the rest.
+    /// Returns an object that implements [`Display`] for safely printing a [`CStr`] that may
+    /// contain non-Unicode data. If you would like an implementation which escapes the [`CStr`]
+    /// please use [`Debug`] instead.
+    ///
+    /// [`Display`]: fmt::Display
+    /// [`Debug`]: fmt::Debug
+    ///
+    /// # Examples
     ///
     /// ```
     /// # use kernel::c_str;
     /// # use kernel::fmt;
-    /// # use kernel::str::CStr;
     /// # use kernel::str::CString;
     /// let penguin = c_str!("🐧");
-    /// let s = CString::try_from_fmt(fmt!("{}", penguin))?;
+    /// let s = CString::try_from_fmt(fmt!("{}", penguin.display()))?;
     /// assert_eq!(s.as_bytes_with_nul(), "\\xf0\\x9f\\x90\\xa7\0".as_bytes());
     ///
     /// let ascii = c_str!("so \"cool\"");
-    /// let s = CString::try_from_fmt(fmt!("{}", ascii))?;
+    /// let s = CString::try_from_fmt(fmt!("{}", ascii.display()))?;
     /// assert_eq!(s.as_bytes_with_nul(), "so \"cool\"\0".as_bytes());
     /// # Ok::<(), kernel::error::Error>(())
     /// ```
-    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
-        for &c in self.as_bytes() {
-            if (0x20..0x7f).contains(&c) {
-                // Printable character.
-                f.write_char(c as char)?;
-            } else {
-                write!(f, "\\x{:02x}", c)?;
-            }
+    #[inline]
+    pub fn display(&self) -> Display<'_> {
+        Display {
+            inner: self,
+            escape_common: false,
         }
-        Ok(())
     }
 }
 
@@ -414,7 +462,6 @@ impl fmt::Debug for CStr {
     /// ```
     /// # use kernel::c_str;
     /// # use kernel::fmt;
-    /// # use kernel::str::CStr;
     /// # use kernel::str::CString;
     /// let penguin = c_str!("🐧");
     /// let s = CString::try_from_fmt(fmt!("{:?}", penguin))?;
@@ -595,13 +642,13 @@ fn test_cstr_as_str_unchecked() {
     #[test]
     fn test_cstr_display() {
         let hello_world = CStr::from_bytes_with_nul(b"hello, world!\0").unwrap();
-        assert_eq!(format!("{}", hello_world), "hello, world!");
+        assert_eq!(format!("{}", hello_world.display()), "hello, world!");
         let non_printables = CStr::from_bytes_with_nul(b"\x01\x09\x0a\0").unwrap();
-        assert_eq!(format!("{}", non_printables), "\\x01\\x09\\x0a");
+        assert_eq!(format!("{}", non_printables.display()), "\\x01\\x09\\x0a");
         let non_ascii = CStr::from_bytes_with_nul(b"d\xe9j\xe0 vu\0").unwrap();
-        assert_eq!(format!("{}", non_ascii), "d\\xe9j\\xe0 vu");
+        assert_eq!(format!("{}", non_ascii.display()), "d\\xe9j\\xe0 vu");
         let good_bytes = CStr::from_bytes_with_nul(b"\xf0\x9f\xa6\x80\0").unwrap();
-        assert_eq!(format!("{}", good_bytes), "\\xf0\\x9f\\xa6\\x80");
+        assert_eq!(format!("{}", good_bytes.display()), "\\xf0\\x9f\\xa6\\x80");
     }
 
     #[test]
@@ -612,7 +659,7 @@ fn test_cstr_display_all_bytes() {
             bytes[i as usize] = i.wrapping_add(1);
         }
         let cstr = CStr::from_bytes_with_nul(&bytes).unwrap();
-        assert_eq!(format!("{}", cstr), ALL_ASCII_CHARS);
+        assert_eq!(format!("{}", cstr.display()), ALL_ASCII_CHARS);
     }
 
     #[test]
@@ -630,15 +677,15 @@ fn test_cstr_debug() {
     #[test]
     fn test_bstr_display() {
         let hello_world = BStr::from_bytes(b"hello, world!");
-        assert_eq!(format!("{}", hello_world), "hello, world!");
+        assert_eq!(format!("{}", hello_world.display()), "hello, world!");
         let escapes = BStr::from_bytes(b"_\t_\n_\r_\\_\'_\"_");
-        assert_eq!(format!("{}", escapes), "_\\t_\\n_\\r_\\_'_\"_");
+        assert_eq!(format!("{}", escapes.display()), "_\\t_\\n_\\r_\\_'_\"_");
         let others = BStr::from_bytes(b"\x01");
-        assert_eq!(format!("{}", others), "\\x01");
+        assert_eq!(format!("{}", others.display()), "\\x01");
         let non_ascii = BStr::from_bytes(b"d\xe9j\xe0 vu");
-        assert_eq!(format!("{}", non_ascii), "d\\xe9j\\xe0 vu");
+        assert_eq!(format!("{}", non_ascii.display()), "d\\xe9j\\xe0 vu");
         let good_bytes = BStr::from_bytes(b"\xf0\x9f\xa6\x80");
-        assert_eq!(format!("{}", good_bytes), "\\xf0\\x9f\\xa6\\x80");
+        assert_eq!(format!("{}", good_bytes.display()), "\\xf0\\x9f\\xa6\\x80");
     }
 
     #[test]

-- 
2.48.1

