Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E652286D7F;
	Mon, 23 Jun 2025 15:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750691687; cv=none; b=NxgmKJ/iBCyawx2Egb7vG3vDwSmjLOOaQXOLpircDCjln2l19InfGvljXFcTmCtdCh9DJocy3GPHWABUq0rFtn7+H5yAlBr1VNMlACyZElcpsXKdUUh6haBQ9K55gXMDP1XTCWyLhKYtFRe1yo/W/6AaiIWUnwqbxepT0KbUlIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750691687; c=relaxed/simple;
	bh=XATRCyZN9h3h1eCMdiJkmGZxqm8MxTsDWzC41eiSOpw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LsAUZlYcAPWHRCLTVacmdHN8+EbHIzaUeQfs6+eMKWLxc3oKqKgcCR8ynH4qPlG/IaAWkgcmAFeXE3qRnXAzSpcO3TxoR5eGNmZvRUTIbB9LsuIG3QEtdTXcXfg9IDukLDbTxnbytW6/n+G6KCbkds4MxNrzTOhZrSBIUiPdZrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LzP6RUw8; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LzP6RUw8"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b31d592bbe8so2946027a12.2;
        Mon, 23 Jun 2025 08:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750691685; x=1751296485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4L+SLp5sEjKp/3F3270exGqS9NQW7oUMk/S+cCYt5Es=;
        b=LzP6RUw8xN8lM8RLg/PWNKgpv1DGYSTcpItELeEQhssAKGXL4uiuSoWrKGVHHTgi06
         H2lbuc9vJBFCjVYkSpkG5stgTocsh1FoQ77GIwUJfyjioZfvqyG76Sxu1ORoGwV8sKDd
         VEzOwr6ZIxeax9eOQDN6J92oj/T70s0Vd0J9nqihsyRdUm95b45C0L/2/YL37O+MNT8p
         gis+Iq1efdSeJicNo8vgIbya+3kIej9o1QkkqsHIi9nf3IBC2xWB4+nAnA8VNrFIVRyc
         XAXk2JsYYuJQYd6WI2ga789jTIK0zi82G5G0fjKo2PsEF/0kCNNfmhDUYI+HOX6z9f0g
         KIDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750691685; x=1751296485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4L+SLp5sEjKp/3F3270exGqS9NQW7oUMk/S+cCYt5Es=;
        b=K990LMcRgs2YXvTSVRe5RSeh4Udp8thfu66yXcLJj4A4eWiPaWYJfpGr9V1lutK8x9
         jgTtLM4BG+7VcOw6mcNsEYh9f3VXDnCCyFZQfngmgrkY6fssJ/rBcaRELC4qBsrkdjzI
         ZXwGHG7J/ArLGG/be2G9Xhxu1qS3UEaVtu4jsRchzZCFhmClBoOWdZZHBdXIQmGRk2of
         gYK+UXX30AKZGSsu7d3S0k/1U/93rrCbnnekLZoi+xkwFMJMtOgH7cd8EyFvC1Q6Ki5t
         BEZq8eAujQ0l2w/UyJYXHBeq8TydukKh9waM11eq4n+3CYx9JANRcYOM9gPv9Dwf2i51
         gMYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfASESmFssd/2p2heclco8OIQ5z7lj+yivlr6ydVgbSspC3ckDju3vQlrxu8OUnE1lkD34neysxyhDTR09oQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8nxNrteKe1HZOisAHNaC/oetiug2X6Kl9uecPx80JDPdeRB10
	RaaEMgsCgnUOxjzjLN4UDJG7p5YGNJkGrFpSYPH7Oh+g5s9GVm44i5mX
X-Gm-Gg: ASbGncvPRrOhdo+Pbo4wLr4NYb9b219J/w5/rTJU56vOj1eWToXjbHKB4x7RAWgSrOy
	PHtwXOhpj0+Y6qJmzYPc6RPQ2Hp+t3CxB1PaiQ5M4ukY+haUQ1u/Onf0GWtpK96+UXcvQ3zocWx
	AbAZd4BFPkK4Ni5wIltPkJkUOJvSziaOyuYqHM92tQxFwRCIEv0b9pHKLSxwvQyEKu+x2PkP6qO
	+QjUsOmjExJUJ6+0Tbgyce3qsY/1h7HYHgaBj/EPL2QrGXV48KiUCrIHaAhUSKeiz4r1hWLEr0N
	QiBJMkfzfrj71/mm1Y9FpUtbk3YAW1+M+k8CrKyYK06nzixzFutGbY9+hWabrzeAZAcFohb1eo5
	iHYaTdN0=
X-Google-Smtp-Source: AGHT+IHjXjnNaJs4mpv+QbUUX8obW8sAmU/EZar1U85z03oyOBaK0Zh98OMIpjOXdxPItTkxI0ZxFA==
X-Received: by 2002:a17:90b:4f46:b0:312:e49b:c972 with SMTP id 98e67ed59e1d1-3159d68a9cbmr18302917a91.15.1750691685273;
        Mon, 23 Jun 2025 08:14:45 -0700 (PDT)
Received: from localhost.localdomain ([112.149.32.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3159df71cd6sm8338512a91.4.2025.06.23.08.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 08:14:44 -0700 (PDT)
From: Jesung Yang <y.j3ms.n@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org,
	Jesung Yang <y.j3ms.n@gmail.com>
Subject: [PATCH 1/4] rust: introduce `FromPrimitive` trait
Date: Mon, 23 Jun 2025 15:14:27 +0000
Message-Id: <702d21d34368b1dcd896343771b00a2303e9a312.1750689857.git.y.j3ms.n@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1750689857.git.y.j3ms.n@gmail.com>
References: <cover.1750689857.git.y.j3ms.n@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a new `FromPrimitive` trait under `kernel::convert` that
enables fallible conversion from primitive types to user-defined
types.

This is useful when numeric values need to be interpreted as structured
representations such as enums. These situations often arise when
working with low-level data sources, for example when reading values
from hardware registers.

Signed-off-by: Jesung Yang <y.j3ms.n@gmail.com>
---
 rust/kernel/convert.rs | 154 +++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs     |   1 +
 2 files changed, 155 insertions(+)
 create mode 100644 rust/kernel/convert.rs

diff --git a/rust/kernel/convert.rs b/rust/kernel/convert.rs
new file mode 100644
index 000000000000..fb01a0e1507a
--- /dev/null
+++ b/rust/kernel/convert.rs
@@ -0,0 +1,154 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Traits for type conversion.
+
+/// A trait for fallible conversions from primitive types.
+///
+/// [`FromPrimitive`] allows converting from various built-in primitive types
+/// (such as integers and `bool`) into a user-defined type, typically an `enum`.
+///
+/// At least [`from_i64`] and [`from_u64`] should be implemented. All other methods
+/// have default implementations that convert to `i64` or `u64` using fallible casts and
+/// delegate to those two core methods.
+///
+/// Enums with wide representations such as `#[repr(i128)]` or `#[repr(u128)]` may lose
+/// information through narrowing in the default implementations. In such cases, override
+/// [`from_i128`] and [`from_u128`] explicitly.
+///
+/// This trait can be used with `#[derive]`.
+/// See [`FromPrimitive`](../../macros/derive.FromPrimitive.html) derive macro for more
+/// information.
+///
+/// [`from_i64`]: FromPrimitive::from_i64
+/// [`from_i128`]: FromPrimitive::from_i128
+/// [`from_u64`]: FromPrimitive::from_u64
+/// [`from_u128`]: FromPrimitive::from_u128
+///
+/// # Examples
+///
+/// ```rust
+/// use kernel::convert::FromPrimitive;
+///
+/// #[derive(PartialEq)]
+/// enum Foo {
+///     A,
+///     B = 0x17,
+///     C = -2,
+/// }
+///
+/// impl FromPrimitive for Foo {
+///     fn from_i64(n: i64) -> Option<Self> {
+///         match n {
+///             0 => Some(Self::A),
+///             0x17 => Some(Self::B),
+///             -2 => Some(Self::C),
+///             _ => None,
+///         }
+///     }
+///
+///     fn from_u64(n: u64) -> Option<Self> {
+///         i64::try_from(n).ok().and_then(Self::from_i64)
+///     }
+/// }
+///
+/// assert_eq!(Foo::from_u64(0), Some(Foo::A));
+/// assert_eq!(Foo::from_u64(0x17), Some(Foo::B));
+/// assert_eq!(Foo::from_i64(-2), Some(Foo::C));
+/// assert_eq!(Foo::from_i64(-3), None);
+/// ```
+pub trait FromPrimitive: Sized {
+    /// Attempts to convert a `bool` to `Self`. Returns `Some(Self)` if the input
+    /// corresponds to a known value; otherwise, `None`.
+    #[inline]
+    fn from_bool(b: bool) -> Option<Self> {
+        Self::from_u64(u64::from(b))
+    }
+
+    /// Attempts to convert an `isize` to `Self`. Returns `Some(Self)` if the input
+    /// corresponds to a known value; otherwise, `None`.
+    #[inline]
+    fn from_isize(n: isize) -> Option<Self> {
+        i64::try_from(n).ok().and_then(Self::from_i64)
+    }
+
+    /// Attempts to convert an `i8` to `Self`. Returns `Some(Self)` if the input
+    /// corresponds to a known value; otherwise, `None`.
+    #[inline]
+    fn from_i8(n: i8) -> Option<Self> {
+        Self::from_i64(i64::from(n))
+    }
+
+    /// Attempts to convert an `i16` to `Self`. Returns `Some(Self)` if the input
+    /// corresponds to a known value; otherwise, `None`.
+    #[inline]
+    fn from_i16(n: i16) -> Option<Self> {
+        Self::from_i64(i64::from(n))
+    }
+
+    /// Attempts to convert an `i32` to `Self`. Returns `Some(Self)` if the input
+    /// corresponds to a known value; otherwise, `None`.
+    #[inline]
+    fn from_i32(n: i32) -> Option<Self> {
+        Self::from_i64(i64::from(n))
+    }
+
+    /// Attempts to convert an `i64` to `Self`. Returns `Some(Self)` if the input
+    /// corresponds to a known value; otherwise, `None`.
+    fn from_i64(n: i64) -> Option<Self>;
+
+    /// Attempts to convert an `i128` to `Self`. Returns `Some(Self)` if the input
+    /// corresponds to a known value; otherwise, `None`.
+    ///
+    /// The default implementation delegates to [`from_i64`](FromPrimitive::from_i64)
+    /// by downcasting from `i128` to `i64`, which may result in information loss.
+    /// Consider overriding this method if `Self` can represent values outside the
+    /// `i64` range.
+    #[inline]
+    fn from_i128(n: i128) -> Option<Self> {
+        i64::try_from(n).ok().and_then(Self::from_i64)
+    }
+
+    /// Attempts to convert a `usize` to `Self`. Returns `Some(Self)` if the input
+    /// corresponds to a known value; otherwise, `None`.
+    #[inline]
+    fn from_usize(n: usize) -> Option<Self> {
+        u64::try_from(n).ok().and_then(Self::from_u64)
+    }
+
+    /// Attempts to convert a `u8` to `Self`. Returns `Some(Self)` if the input
+    /// corresponds to a known value; otherwise, `None`.
+    #[inline]
+    fn from_u8(n: u8) -> Option<Self> {
+        Self::from_u64(u64::from(n))
+    }
+
+    /// Attempts to convert a `u16` to `Self`. Returns `Some(Self)` if the input
+    /// corresponds to a known value; otherwise, `None`.
+    #[inline]
+    fn from_u16(n: u16) -> Option<Self> {
+        Self::from_u64(u64::from(n))
+    }
+
+    /// Attempts to convert a `u32` to `Self`. Returns `Some(Self)` if the input
+    /// corresponds to a known value; otherwise, `None`.
+    #[inline]
+    fn from_u32(n: u32) -> Option<Self> {
+        Self::from_u64(u64::from(n))
+    }
+
+    /// Attempts to convert a `u64` to `Self`. Returns `Some(Self)` if the input
+    /// corresponds to a known value; otherwise, `None`.
+    fn from_u64(n: u64) -> Option<Self>;
+
+    /// Attempts to convert a `u128` to `Self`. Returns `Some(Self)` if the input
+    /// corresponds to a known value; otherwise, `None`.
+    ///
+    /// The default implementation delegates to [`from_u64`](FromPrimitive::from_u64)
+    /// by downcasting from `u128` to `u64`, which may result in information loss.
+    /// Consider overriding this method if `Self` can represent values outside the
+    /// `u64` range.
+    #[inline]
+    fn from_u128(n: u128) -> Option<Self> {
+        u64::try_from(n).ok().and_then(Self::from_u64)
+    }
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 6b4774b2b1c3..861c9340d9c2 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -61,6 +61,7 @@
 pub mod clk;
 #[cfg(CONFIG_CONFIGFS_FS)]
 pub mod configfs;
+pub mod convert;
 pub mod cpu;
 #[cfg(CONFIG_CPU_FREQ)]
 pub mod cpufreq;
-- 
2.39.5

