Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF61C26B750
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 23:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750807535; cv=none; b=X9MGUl6HVajfwsOSrhwmtfqQnUnzMpmIAZmGf4+NAJ89giMeYPc9G57oVGcdzAE8sYaGXRlwazLWrSNhlvHZjIR+Q+nYCYxbAkfboUrpjKo7/EJ918J4ls+LW2I0ft8afZ33TgF9t4vIjgzfVi1JpTFJv7MnZ7N6tgyNr6QPisw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750807535; c=relaxed/simple;
	bh=csrmOtgDOUPu84tv7PeAGJkBv9W4D79BKUWoKWfBICc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OjtEcnZsH9EkYEQNfd8GsJF36ytZO8l3r4qY5emROkhGf3g0kETnex/o3pd5AF9SlaB9103ekQlNda5QxlH6JQqtrJQEqFQB5wp17QNtWX07pxrDZep8Z3jMKfhOpUahAIz0MLoB7WWGnJ+iFjl9hZXm804oDdo/4cXu23Jhegs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vLv50ce5; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vLv50ce5"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b3183193374so4198876a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 16:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750807533; x=1751412333; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jpHn/Mf98CTz3w1q9Q5YkPhYg7ss8fRZAZdslJSSZ2w=;
        b=vLv50ce5PqFTzHC4D1ivqemyvOFggxUl7Peb4XYNWuN+eQqeQtEbjBZ+YG7HXBE6Zl
         t1UtRXh7RjARMippVTLbcLjhWtnicsdNxI/ncTP43aEFhuOegNNVIslqxoc/XJ7fJyV7
         SKizI4GZTNcnAvu615KahBb6f983ux+hDWR8hqyIBLe9EKFYy9HADT+XJB2QMM2qXmw/
         tK14qDi2OrDc/U97H0zFBdfS2VDnm4j8/ZjjgcQ2nDTfkhoFqe9ckKKz7Krq+gbo4qV1
         QScteN9fK3aoi6lA0VxD5sRDhOeCkKxvNpNrWgc5vazaodUtPNTQlRa8Bpf46pAcr9zA
         Si7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750807533; x=1751412333;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jpHn/Mf98CTz3w1q9Q5YkPhYg7ss8fRZAZdslJSSZ2w=;
        b=wspeGCQTy2a/A/W3R1ref6HAGaGRnZo5CpF6/QiO4YYEwN1CxLPFbVKYxMk2R4XkZm
         d7piC/TGvoMwlJJYS+jkXxEoYPQ/3CZYwvdh1hmuQWC5OAN4qA8ic0NigUpUZdcFvN/c
         hRsXbF2P+9oHxkRoro6FL/EvgVddfE4bOudWUZCfp+HqW9SscT0Ni49CmHirXaCiES8r
         W40Y+CAlnTs9k94pQfp3nexLeLaxHgJ2f0Jw5Omw24mIj3RvXlwd9yoBQnxv0cMFD42v
         b0GXhfvTvAJzqjXIXSEPyB7y2C8rJuFkaims6YGnf31TMdQ7pZPvO5nQ1GmHq3ItMV6q
         G/3A==
X-Gm-Message-State: AOJu0Yz+V4xEapx6/q+9h5HBZwgLlpID+Ox3UbpYFI5HGRimfhU9vVcK
	ogmy2MngxKRCfWyr418xrS0qsPit1FUMoT8c6hFlh5qOBLmpjylxYnmiQfa/7qlJcm7SxIXfk0C
	6+PlgirAgVw==
X-Google-Smtp-Source: AGHT+IEU3WSnV/iYS+a5AiCRRNPTzXx/GpONFhMr5wKKYYchsgqip2PjcSWvWvbf8EDrhqqxX+S/mAdfK9y4
X-Received: from pgww8.prod.google.com ([2002:a05:6a02:2c88:b0:b31:c9e0:b48])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:9996:b0:21f:775d:107e
 with SMTP id adf61e73a8af0-2207f20ad9bmr1219035637.17.1750807533234; Tue, 24
 Jun 2025 16:25:33 -0700 (PDT)
Date: Tue, 24 Jun 2025 23:25:22 +0000
In-Reply-To: <20250624-debugfs-rust-v7-0-9c8835a7a20f@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250624-debugfs-rust-v7-0-9c8835a7a20f@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750807526; l=3137;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=csrmOtgDOUPu84tv7PeAGJkBv9W4D79BKUWoKWfBICc=; b=7e3OUzW7UAi5cjOdMhqW3Qbh8mz1+Pvlsdj4Lv2je6H6Mq0sUdorH00u999tBHoADar7VDMPx
 Lkgob2aCw1jAWDWOIDEaXyQhAu/KJLt9vA9hiDtrT0uCIC/9Xsq6Jge
X-Mailer: b4 0.14.2
Message-ID: <20250624-debugfs-rust-v7-3-9c8835a7a20f@google.com>
Subject: [PATCH v7 3/6] rust: types: Support &'static and &'static mut ForeignOwnable
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Timur Tabi <ttabi@nvidia.com>, Benno Lossin <lossin@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

These types live forever and do not require cleanup, so they can
serve as `ForeignOwnable`.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 rust/kernel/types.rs | 58 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
index 22985b6f69820d6df8ff3aae0bf815fad36a9d92..6f9617b5b491426b1be5f3a27dc2c48ad1854da8 100644
--- a/rust/kernel/types.rs
+++ b/rust/kernel/types.rs
@@ -142,6 +142,64 @@ unsafe fn borrow<'a>(_: *mut Self::PointedTo) -> Self::Borrowed<'a> {}
     unsafe fn borrow_mut<'a>(_: *mut Self::PointedTo) -> Self::BorrowedMut<'a> {}
 }
 
+// SAFETY: The `into_foreign` function derives its pointer from a reference, so it is correctly
+// aligned.
+unsafe impl<T: 'static> ForeignOwnable for &'static T {
+    type PointedTo = T;
+    type Borrowed<'a> = &'a T;
+    type BorrowedMut<'a> = &'a T;
+
+    fn into_foreign(self) -> *mut Self::PointedTo {
+        self as *const _ as _
+    }
+
+    unsafe fn from_foreign(foreign: *mut Self::PointedTo) -> Self {
+        // SAFETY: from_foreign has stricter restrictions than borrow
+        unsafe { Self::borrow(foreign) }
+    }
+
+    unsafe fn borrow<'a>(foreign: *mut Self::PointedTo) -> Self::Borrowed<'a> {
+        // SAFETY: We know the original reference lived forever, so we can convert it back
+        unsafe { &*foreign }
+    }
+
+    unsafe fn borrow_mut<'a>(foreign: *mut Self::PointedTo) -> Self::BorrowedMut<'a> {
+        // SAFETY: borrow_mut has stricter restrictions than borrow
+        unsafe { Self::borrow(foreign) }
+    }
+}
+
+// SAFETY: The `into_foreign` function derives its pointer from a reference, so it is correctly
+// aligned.
+unsafe impl<T: 'static> ForeignOwnable for &'static mut T {
+    type PointedTo = T;
+    type Borrowed<'a> = &'a T;
+    type BorrowedMut<'a> = &'a mut T;
+
+    fn into_foreign(self) -> *mut Self::PointedTo {
+        self as *const _ as _
+    }
+
+    unsafe fn from_foreign(foreign: *mut Self::PointedTo) -> Self {
+        // SAFETY: from_foreign has stricter restrictions than `borrow_mut`
+        unsafe { Self::borrow_mut(foreign) }
+    }
+
+    unsafe fn borrow<'a>(foreign: *mut Self::PointedTo) -> Self::Borrowed<'a> {
+        // SAFETY: We know the original reference lived forever, and the requirements on the
+        // function indicate that `from_foreign` and `borrow_mut` will not happen concurrently, so
+        // we can do a shared borrow.
+        unsafe { &*foreign }
+    }
+
+    unsafe fn borrow_mut<'a>(foreign: *mut Self::PointedTo) -> Self::BorrowedMut<'a> {
+        // SAFETY: We know the original reference lived forever, and the requirements on the
+        // function indicate that no other borrows will happen concurrently, so we can do a
+        // unique borrow.
+        unsafe { &mut *foreign }
+    }
+}
+
 /// Runs a cleanup function/closure when dropped.
 ///
 /// The [`ScopeGuard::dismiss`] function prevents the cleanup function from running.

-- 
2.50.0.714.g196bf9f422-goog

