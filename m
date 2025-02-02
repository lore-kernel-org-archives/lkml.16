Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061A31D798E;
	Sun,  2 Feb 2025 12:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738498858; cv=none; b=ZF3AtkMJD7G4bZaDhj5no/1ZBoYSJ1EWYq7fCKTt6kk9hKNG1H7Yis4ejtt8WLPTrRiSyb3KCnH/+0Hgb/oBYkLx+dF5E27xDFQ2mpDmM3vrBbqfF8AKNgUaSbqROKrCQmJhZT9xB4x4HSy/36YH39mJ3mv/nQ8NrFcENjTIMy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738498858; c=relaxed/simple;
	bh=cEcJMB3RH+hwgPUqVVtE4kSla9Rnc/uiWqwGre9/JgE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YYr2ZmgDHw6rxmEDVtDB2Gt9XuopN9c+4480M0UZHyDqJSJBKCXlJfGnhoDqjF7hG6Dzd23hwtuNLtiPyFtepSlhqg+A2UI4lKy3alenyofWtsLQ7vdgUwztZpdhty1eHlFGMK0Sabzt/TwYxthZOTGGWjTBfaMvQ1nhpuHmrSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aO18up+I; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aO18up+I"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-46fa7678ef3so34105751cf.1;
        Sun, 02 Feb 2025 04:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738498856; x=1739103656; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A4uuv0EGtSl3hUZmiuiEbo55gg9kPQ0rvaLmjMl5yVk=;
        b=aO18up+IpCoyrmnQCx0lxY2uR0nUn5s32tWytHAb4WUxRdPcmphq87z2sR7xA/fJo+
         +XZjuS6OL098pi4wqhcxBOm6jR6Tu0OLa0Ar09lohT36h3TnqinQj3d313FDBFJV/GBs
         5qN7EkdZSymw4FxYgc24Ij/z+FCmh5XACGoaDwy9bJezbvsZa0Y6TeaRZvV4f85tCD+O
         G6vkSn+qvoW0v7Ih0l84z8m3p2S7eKyB0bKFHfdeLfxOaf/p6TlJpQqjpoCdIB5W5vim
         k223BcKVnUA2RTmP/xf9AXtW3L8xf3FFwaJK6/82Jm/l30+XGOjPFYg5td9igZTsiMHx
         T/3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738498856; x=1739103656;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A4uuv0EGtSl3hUZmiuiEbo55gg9kPQ0rvaLmjMl5yVk=;
        b=WxD5Yk30nms9LFor+XnnO8VsKd9NJMexwGriFiO/5gzJU9m+RXalp84OF6eK33pdnA
         G2fz92FLoGYRMaBQ4Kfdv3twXLMNCAckHIIiQl43L5/TIZFtRxOPg7i4bI1ydCWgnvyf
         nngeAjM55Nm15zz3lAgwD2Go9T4wgIHF/37DRBsmx7RwCOmNXj8J/zlx4m8ozkc8+4ti
         9e2KSCwtHp399Pg8ejK8Hce0XC2zuxH1dl6achqoEU37XO+n/jWuUmeMC3o3r2X4gr30
         94HZffp5qvwqt5d3RkLzCLYWMlUhy+WPB1gVAWY7P0w75UREwwye6wbIs7FYPH+aiAI9
         lLOA==
X-Forwarded-Encrypted: i=1; AJvYcCWBiy0lXLPOKyM1nH/aj+HYr4rMaI4oGiHWcAiVpaZAN7mnPBXCCfz01/qBoNfv9aAx11m7NqTaUJKhm5M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAEhCc1I+VUAHP6c3V3Vp8BbRDqTx96JIo3Ud0oTU8LlNnXKM/
	0AiBxrWDZFFPXUh8LlZAO7rKEcmK+sDPE/862Wnf4yCw8JS68GvG
X-Gm-Gg: ASbGncsXCdXYACLzwiujTmjF6leGJsZHiwnWrBp1aete6A47FiMtMM/3vGqrvV/lZ6m
	LNTwoyxXEhxoNP4xyGvh4PFTYmYN8mOVa7LhXtYDxsz17FsFvgDTpBbEj73Gvf6AKejYOd4cKpq
	AeM5CA0xNXQwFDrjxSWVE2jW3d3LoVV9K/KOKBTIZtrfdpU72Zhsh2YHM3NM/THlet99jTq4t2h
	yrGUamXLlnjiQy9Be/73WhquKlMVSy4rz6Tz2jbbTi8mbotYpxj9rLM06iKjR1nr32c1PVFLA8F
	zLjHZoojqznPjoSNuM10inIcibiiLSOe9o/0774=
X-Google-Smtp-Source: AGHT+IFCxX/g2A/7UErR1Ctfp4+n1YO9mdfo2ye+OgWrutkfud6PysFrWTAAq7t7HDR0wSd84uEjqQ==
X-Received: by 2002:a05:622a:1e8a:b0:46d:faa2:b6d1 with SMTP id d75a77b69052e-46fd0a9dc93mr322592151cf.16.1738498855753;
        Sun, 02 Feb 2025 04:20:55 -0800 (PST)
Received: from tamird-mac.local ([2600:4041:5be7:7c00:f07f:fb14:288d:6f1e])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf1728efsm37700331cf.62.2025.02.02.04.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 04:20:54 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sun, 02 Feb 2025 07:20:46 -0500
Subject: [PATCH v6 1/4] rust: move BStr,CStr Display impls behind method
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250202-cstr-core-v6-1-8469cd6d29fd@gmail.com>
References: <20250202-cstr-core-v6-0-8469cd6d29fd@gmail.com>
In-Reply-To: <20250202-cstr-core-v6-0-8469cd6d29fd@gmail.com>
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
 rust/kernel/str.rs   | 120 +++++++++++++++++++++++++++++++++++----------------
 2 files changed, 89 insertions(+), 40 deletions(-)

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
index 28e2201604d6..53450c956a6a 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -31,29 +31,76 @@ pub const fn from_bytes(bytes: &[u8]) -> &Self {
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
@@ -68,7 +115,7 @@ impl fmt::Debug for BStr {
     /// escaping the rest.
     ///
     /// ```
-    /// # use kernel::{fmt, b_str, str::{BStr, CString}};
+    /// # use kernel::{fmt, b_str, str::CString};
     /// // Embedded double quotes are escaped.
     /// let ascii = b_str!("Hello, \"BStr\"!");
     /// let s = CString::try_from_fmt(fmt!("{:?}", ascii))?;
@@ -376,35 +423,35 @@ pub fn to_ascii_uppercase(&self) -> Result<CString, AllocError> {
 
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
 
@@ -414,7 +461,6 @@ impl fmt::Debug for CStr {
     /// ```
     /// # use kernel::c_str;
     /// # use kernel::fmt;
-    /// # use kernel::str::CStr;
     /// # use kernel::str::CString;
     /// let penguin = c_str!("🐧");
     /// let s = CString::try_from_fmt(fmt!("{:?}", penguin))?;
@@ -595,13 +641,13 @@ fn test_cstr_as_str_unchecked() {
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
@@ -612,7 +658,7 @@ fn test_cstr_display_all_bytes() {
             bytes[i as usize] = i.wrapping_add(1);
         }
         let cstr = CStr::from_bytes_with_nul(&bytes).unwrap();
-        assert_eq!(format!("{}", cstr), ALL_ASCII_CHARS);
+        assert_eq!(format!("{}", cstr.display()), ALL_ASCII_CHARS);
     }
 
     #[test]
@@ -630,15 +676,15 @@ fn test_cstr_debug() {
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

