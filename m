Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAD41EB5E4;
	Mon,  7 Apr 2025 14:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744037565; cv=none; b=ttUSQbC6zex+bEZOb7CpzvnyPd7tdvVoTG+WSINHQjUR1eMylEhIQbXPgD+9Ye4Bg5HsiRQkBAUIePQaVULFYijU8ThSfuuVmq6MHuq5krgOIoqXmhczGAMhij6oeTV8fhFVeVgl022JSbsHlGXi8lnUvj4TiE1nSQMhJKTtnMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744037565; c=relaxed/simple;
	bh=pCyiXCf1/A8xml47smeAz/I3a4filcF1iQCDtSStSK4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gl9jIBaOT7thJmhDOk8L6PzhEHjMwW8ZwCTYs/0qX+/5oCmWbOSgd1lQA9OLmnlNaVzi4fDvncFazUwpfNtsdxGfUufGTgv3Wym6s9NjSwQNp+xOs0Wnd/P8MYxspTfTfhmwkznJYeIUc8w6tg2C4Bh012gAVvkLeBRcgpMma1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a+f7Mlz+; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a+f7Mlz+"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4769b16d4fbso22303271cf.2;
        Mon, 07 Apr 2025 07:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744037559; x=1744642359; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WhKqwIIgX36Jf+RJwT/l1hiIh7wr6DbCAVI5VFkdzZs=;
        b=a+f7Mlz+XsOYrWbEMeaXRSkERHkErm7VCobX56hU1jVwh9zElbhUsv4NWFObhyovtg
         ojai0satVfMB+WNp4u9/okqOvJKlDVSTFmsYy/RuD+eDRqY7MJQpU035p3qzNp9QaITW
         eNPSc8eigCO70GKJzb1I6uQpd2BagXvWSbxTmigr/8pwMKcKUdyX54D8RWS9dTVGj7/m
         y98ZJKRzLnnOcYsn0eVv6h3EzF8CWA1SITbmfBPDJ1qQMPxEKpN5//QQTSdWhXUA1SOk
         pxpc/germw5XHlXbhz50F2/vNYrKdFoZLijLcx1LMG1DW0drk18ZjDwSibteuMSdmX10
         QaaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744037559; x=1744642359;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WhKqwIIgX36Jf+RJwT/l1hiIh7wr6DbCAVI5VFkdzZs=;
        b=rg9UKiZvqz/3qANU3IhWJtRvaC7n9Ne1kfBJTfWrugyasn8Qfl7vac62SeIxdkUCa2
         kserrTnEb1bMe+8YXHhK9tReOYCNEOc4UTqm4Pnv6MSmeEG05Gf1z2xuorAhg2Qatn4i
         MOm/T3CIiGx5UjLJ/i2kjGm1dobqxPmxzRsalwoS9SSMIIj3umU+H+lzIvKa4oi8scAB
         IaqdeCs/E3w2Ha0t4Gz3m8T2TGszx3OZoGx75kqM/QewFmDIBYEEfz/4Vy98zLCDBjtT
         jbf1rm75ihIim4uwee4x+X3PWqLBO2ncF+1IyW4janVOUdEZWE7y+sqS1wd2/E0UMp7h
         fdtg==
X-Forwarded-Encrypted: i=1; AJvYcCUQqUTkJhbQWkcqk8BQyZd3yv7u2MMJyDdVyc5dsXTTsCy/8fQtKblJD6fNh81nrtI6IMoe1uuYR/EMb4Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYwGanFRAD/+FmX+DKdkVPSCWPxyhbOh6HnJ6rMKQVHPqBWn0C
	yE4HCxI7yzdcUEosfxw3Ioydhyl3AsK84LWIhbHikaIC6SkN2Fz/
X-Gm-Gg: ASbGncu+DeF9Jfeugk4xXA/dTL7Fjliz1+9/+HsGDB33H6jlSQ5foE1VpsU6fNpUAPJ
	PNhtqgsSEOosHAY9pgdSyRPLiUmoZrIwC5aW7V/pt2otmF7yprvPAGQ+HZzoTLUg+KUKYw8cJSs
	qn2Qrt8r0bHY1OCbMhk8elFw1LQ43w+HbiAQMRMRkcDYm1iJzwNs7llzXMn3K4o5mP5zX1hu3MN
	4VNp7o0ZmmPgKb3FR9hBOiPMpVY1rTcChnXUgRDsJFGw61AflptKLMzTDt54as0Tkw4hmc65LjM
	daSqE15uQV1x/rjedXN3Vd3Gji4vZxCgbdeC1+tsuQ0OLSt8V2JBzHids1MPiMC0H68BEmlZpRX
	1Z8iGayjBF/XL1ZtquCY3TQvNu+MkEi5RoJPCGZmsDxe6iWOKWXxdpQ==
X-Google-Smtp-Source: AGHT+IFCGkkdyhhrxU14wvgTU+kI8yw4ur3kW5NZIA570Chg+1dqT1fYQbVcQ6Ews4xW5qIvvCPoEQ==
X-Received: by 2002:ac8:7e84:0:b0:476:add4:d2c3 with SMTP id d75a77b69052e-47925a26c13mr197177391cf.38.1744037559089;
        Mon, 07 Apr 2025 07:52:39 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2620:10d:c091:600::1:d8ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-479364eaa28sm33065601cf.28.2025.04.07.07.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 07:52:38 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 07 Apr 2025 10:52:34 -0400
Subject: [PATCH v3 4/4] rust: alloc: replace `Vec::set_len` with `inc_len`
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-vec-set-len-v3-4-c5da0d03216e@gmail.com>
References: <20250407-vec-set-len-v3-0-c5da0d03216e@gmail.com>
In-Reply-To: <20250407-vec-set-len-v3-0-c5da0d03216e@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>, 
 Andrew Ballance <andrewjballance@gmail.com>, 
 Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

Rename `set_len` to `inc_len` and simplify its safety contract.

Note that the usage in `CString::try_from_fmt` remains correct as the
receiver is known to have `len == 0`.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/alloc/kvec.rs | 25 ++++++++++++-------------
 rust/kernel/str.rs        |  2 +-
 rust/kernel/uaccess.rs    |  2 +-
 3 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index d0b46aa36169..fdfdb77de7f1 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -185,20 +185,19 @@ pub fn len(&self) -> usize {
         self.len
     }
 
-    /// Forcefully sets `self.len` to `new_len`.
+    /// Increments `self.len` by `additional`.
     ///
     /// # Safety
     ///
-    /// - `new_len` must be less than or equal to [`Self::capacity`].
-    /// - If `new_len` is greater than `self.len`, all elements within the interval
-    ///   [`self.len`,`new_len`) must be initialized.
+    /// - `additional` must be less than or equal to `self.capacity - self.len`.
+    /// - All elements within the interval [`self.len`,`self.len + additional`) must be initialized.
     #[inline]
-    pub unsafe fn set_len(&mut self, new_len: usize) {
-        debug_assert!(new_len <= self.capacity());
-
-        // INVARIANT: By the safety requirements of this method `new_len` represents the exact
-        // number of elements stored within `self`.
-        self.len = new_len;
+    pub unsafe fn inc_len(&mut self, additional: usize) {
+        // Guaranteed by the type invariant to never underflow.
+        debug_assert!(additional <= self.capacity() - self.len());
+        // INVARIANT: By the safety requirements of this method this represents the exact number of
+        // elements stored within `self`.
+        self.len += additional;
     }
 
     /// Decreases `self.len` by `count`.
@@ -322,7 +321,7 @@ pub fn push(&mut self, v: T, flags: Flags) -> Result<(), AllocError> {
         // SAFETY: We just initialised the first spare entry, so it is safe to increase the length
         // by 1. We also know that the new length is <= capacity because of the previous call to
         // `reserve` above.
-        unsafe { self.set_len(self.len() + 1) };
+        unsafe { self.inc_len(1) };
         Ok(())
     }
 
@@ -526,7 +525,7 @@ pub fn extend_with(&mut self, n: usize, value: T, flags: Flags) -> Result<(), Al
         // SAFETY:
         // - `self.len() + n < self.capacity()` due to the call to reserve above,
         // - the loop and the line above initialized the next `n` elements.
-        unsafe { self.set_len(self.len() + n) };
+        unsafe { self.inc_len(n) };
 
         Ok(())
     }
@@ -557,7 +556,7 @@ pub fn extend_from_slice(&mut self, other: &[T], flags: Flags) -> Result<(), All
         //   the length by the same number.
         // - `self.len() + other.len() <= self.capacity()` is guaranteed by the preceding `reserve`
         //   call.
-        unsafe { self.set_len(self.len() + other.len()) };
+        unsafe { self.inc_len(other.len()) };
         Ok(())
     }
 
diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index 878111cb77bc..d3b0b00e05fa 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -886,7 +886,7 @@ pub fn try_from_fmt(args: fmt::Arguments<'_>) -> Result<Self, Error> {
 
         // SAFETY: The number of bytes that can be written to `f` is bounded by `size`, which is
         // `buf`'s capacity. The contents of the buffer have been initialised by writes to `f`.
-        unsafe { buf.set_len(f.bytes_written()) };
+        unsafe { buf.inc_len(f.bytes_written()) };
 
         // Check that there are no `NUL` bytes before the end.
         // SAFETY: The buffer is valid for read because `f.bytes_written()` is bounded by `size`
diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
index 80a9782b1c6e..e4882f113d79 100644
--- a/rust/kernel/uaccess.rs
+++ b/rust/kernel/uaccess.rs
@@ -290,7 +290,7 @@ pub fn read_all<A: Allocator>(mut self, buf: &mut Vec<u8, A>, flags: Flags) -> R
 
         // SAFETY: Since the call to `read_raw` was successful, so the next `len` bytes of the
         // vector have been initialized.
-        unsafe { buf.set_len(buf.len() + len) };
+        unsafe { buf.inc_len(len) };
         Ok(())
     }
 }

-- 
2.49.0

