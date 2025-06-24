Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBED525C6FB;
	Tue, 24 Jun 2025 22:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750803105; cv=none; b=lGUjxbCsIU7S644NpMwZsteaaf3qf0LOdFKfkBe3HRoslKt2VtRJQVYIbkxD5Y6O/swPDWHNp074/jkiDhTpJymFeAJGSHre8gTzKL3v+z35DqOVKqxF9OW3c5m6L/GRG3QyTuebwJlwwFfbcjI3e5SPYOHgFJ/9Y1s88T1nRjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750803105; c=relaxed/simple;
	bh=QRzQkPj6599pmKka9vlWmbAK9sk/eMeNCGV0bnKtkcg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qabGUjJxj3gyEEnBgpi1TxK3ae7z3Z/lV11pzxqWqixlLvL+nNxdsaF1670ybkB9EcydCSjZYSRBR74lsUFdUwRiSkhDyFsh9mqnXkcy7MNx1qLaMKCj2xBmTFkOdsUuKhhElkYLALQIaQpF26018H3mbNgLTyvojX7Tsfzeqb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RwRTdXCg; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RwRTdXCg"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7424ccbef4eso4529093b3a.2;
        Tue, 24 Jun 2025 15:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750803103; x=1751407903; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2zMkC9B95hVmo3huBzRRWOTMUpiB5qjyqhD5+o6Ou38=;
        b=RwRTdXCgxHVPHt9WNa9N4t7x8VQbNPsimYH24dXd43Jz7l2hta1nomBgek97tj4fiD
         vd6ow7zFUMoYlX2fqnxPKlmyV3565iCHlR8AzhcUnkD3px275SRy+e9HZNjLBQ5KTcpU
         G8pH92c+C1SC9hw7WsNxXsNuksveHQ3ZoZpQ30G4Z/ntLxQk3GIO9axjTM09z7JN8SDN
         1svq8LgZUCVxXqmX5czelnj1jfJghvGbn0N2iC9YmB5eeJC09T9bDk3tiCrHxNKvH3HW
         QdX9VJN8FKpUabL30Qz3lJcpUh/L8ajUmt6DbO7Qr3zzk9KzHONH2vaRWXrWRGjWKtsJ
         qGDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750803103; x=1751407903;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2zMkC9B95hVmo3huBzRRWOTMUpiB5qjyqhD5+o6Ou38=;
        b=NuZeumH47eOqe+yY0kT45Ii8cvrUkpY2JM/MueNtoOIV4XO65b9OPdjSox7KOLAhdh
         TmPGIjoaJ3inopj4nQVqA+l7RXR/D5qn7ivV9E+pvyHSUtqTKHO4nMr0pp1WSaAPE+Qv
         gLBumyt2JnDd/EJjC7Z9Pdi4WRx8r6DBxPK2gXcu8db6uyiKCWLdRiUsdccHDDOEGm1l
         oRcOXan7LIgFALafYGZe23XKNYQKaAt74euJk9f1VjTL2KCVK20wiVQGINUuZpmTqJow
         uQrs9PBAxl3X+/qmpcFxMrcwxlN56tAEst6ELakAtZQG6J1m1aN66Q+lRykaT6m0RIxc
         z7SQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDwsQ4CG+mMtZOHJnLMeMDplP6fiYyGmQcdKgLfdF9Zv20F9lgbO8A+nJl4Biwphme5QjxMU8nkz0rIbjoaw==@vger.kernel.org
X-Gm-Message-State: AOJu0YybS2mJQOQAfhf20qlgucVEGlXM3tjhi+Z5cHMLV0ERbCs2Lgpq
	7X1Rsp3ghpwBO8BVfB5BVdTWp6kk+YeWwW5j2Hd+QssZyyoTr9GMUr10
X-Gm-Gg: ASbGncvUegxvkfIkNoNWE0VZp4TuRFNTIYmesF47EH1kB+PPHdW718y2Tir+AIpl1aa
	ttoL8gqr9AXbi1M58xNyzLY6rs0j5SkfLAF7W4J1vuUQD6Lu80EOx63/g3LGhI9roJ1JVI7ligf
	cT4TTQKPNomfHvzzTBkJAfs00+OXn+yNbSgIy3Zili3hZIimt8/cYQOjHpVBFtMlsymMWI0bI1h
	sCb3smiE8WCO4Ptmig8B7WxAQPkdnvvUAr7ldm1ZCZE8bGrwbVFgFF8LTTUkSzpXl4tXiA1CNPz
	qzVc0Zy+/i3NNB8q3+5utgFgbE/WSZ7U/2PDvGmJSKxupNyN24+CD2FU0Bih8E/4wf8t1WTFwk5
	xhYpzHaTDP6VndRNVhR8dyTQcFHi3ZTJwj+24UppeoRra59I=
X-Google-Smtp-Source: AGHT+IEzRXvMPFk+Tkm5J6SgFMC5AkOyHL1p5cr4QMS8S07R92CmifefB13pyYomizepplhvoEK0nw==
X-Received: by 2002:a17:902:d58c:b0:234:d7b2:2ab9 with SMTP id d9443c01a7336-23823fcf358mr15808855ad.12.1750803103122;
        Tue, 24 Jun 2025 15:11:43 -0700 (PDT)
Received: from mitchelllevy.localdomain (82.sub-174-224-205.myvzw.com. [174.224.205.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8393741sm114580555ad.15.2025.06.24.15.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 15:11:42 -0700 (PDT)
From: Mitchell Levy <levymitchell0@gmail.com>
Date: Tue, 24 Jun 2025 15:10:43 -0700
Subject: [PATCH 5/5] rust: percpu: cache per-CPU pointers in the dynamic
 case
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-rust-percpu-v1-5-9c59b07d2a9c@gmail.com>
References: <20250624-rust-percpu-v1-0-9c59b07d2a9c@gmail.com>
In-Reply-To: <20250624-rust-percpu-v1-0-9c59b07d2a9c@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Andrew Morton <akpm@linux-foundation.org>, 
 Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
 Christoph Lameter <cl@linux.com>, Danilo Krummrich <dakr@kernel.org>, 
 Benno Lossin <lossin@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-mm@kvack.org, Mitchell Levy <levymitchell0@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750803093; l=3207;
 i=levymitchell0@gmail.com; s=20240719; h=from:subject:message-id;
 bh=QRzQkPj6599pmKka9vlWmbAK9sk/eMeNCGV0bnKtkcg=;
 b=LMg9dvl4+PiuHooJCVwGOo2w2BGxVvYS+F4oaJUyJ+uCVe74yQmmnI+pUCIZjtG8VWs3ZQejN
 T06DBkTIpSoDOc8eOfegl6Jtj0/vPEamD9figNqDWPSdrywtF1L9+og
X-Developer-Key: i=levymitchell0@gmail.com; a=ed25519;
 pk=n6kBmUnb+UNmjVkTnDwrLwTJAEKUfs2e8E+MFPZI93E=

Currently, the creation of a `PerCpuNumeric` requires a memory read via
the `Arc` managing the dynamic allocation. While the compiler might be
clever enough to consolidate these reads in some cases, the read must
happen *somewhere*, which, when we're concerning ourselves with
individual instructions, is a very high burden.

Instead, cache the `PerCpuPointer` inside the `DynamicPerCpu` structure;
then, the `Arc` is used solely to manage the allocation.

Signed-off-by: Mitchell Levy <levymitchell0@gmail.com>
---
 rust/kernel/percpu.rs         | 12 +++++++++---
 rust/kernel/percpu/numeric.rs |  2 +-
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/percpu.rs b/rust/kernel/percpu.rs
index 9659bff2d889..ffcfe02124ab 100644
--- a/rust/kernel/percpu.rs
+++ b/rust/kernel/percpu.rs
@@ -23,7 +23,10 @@
 
 /// Holds a dynamically-allocated per-CPU variable.
 pub struct DynamicPerCpu<T> {
+    // INVARIANT: `ptr` is managed by `alloc` and the value of `ptr` does not change for the
+    // lifetime of `self`.
     alloc: Arc<PerCpuAllocation<T>>,
+    ptr: PerCpuPtr<T>,
 }
 
 /// Holds a statically-allocated per-CPU variable.
@@ -199,9 +202,10 @@ impl<T> DynamicPerCpu<T> {
     pub fn new(flags: Flags) -> Option<Self> {
         let alloc: PerCpuAllocation<T> = PerCpuAllocation::new()?;
 
+        let ptr = alloc.0;
         let arc = Arc::new(alloc, flags).ok()?;
 
-        Some(Self { alloc: arc })
+        Some(Self { alloc: arc, ptr })
     }
 
     /// Wraps a `PerCpuAllocation<T>` in a `PerCpu<T>`
@@ -210,8 +214,9 @@ pub fn new(flags: Flags) -> Option<Self> {
     /// * `alloc` - The allocation to use
     /// * `flags` - The flags used to allocate an `Arc` that keeps track of the `PerCpuAllocation`.
     pub fn new_from_allocation(alloc: PerCpuAllocation<T>, flags: Flags) -> Option<Self> {
+        let ptr = alloc.0;
         let arc = Arc::new(alloc, flags).ok()?;
-        Some(Self { alloc: arc })
+        Some(Self { alloc: arc, ptr })
     }
 }
 
@@ -219,7 +224,7 @@ pub fn new_from_allocation(alloc: PerCpuAllocation<T>, flags: Flags) -> Option<S
 // don't deallocate the underlying `PerCpuAllocation` until `self` is dropped.
 unsafe impl<T> PerCpu<T> for DynamicPerCpu<T> {
     unsafe fn ptr(&mut self) -> &PerCpuPtr<T> {
-        &self.alloc.0
+        &self.ptr
     }
 }
 
@@ -227,6 +232,7 @@ impl<T> Clone for DynamicPerCpu<T> {
     fn clone(&self) -> Self {
         Self {
             alloc: self.alloc.clone(),
+            ptr: self.ptr,
         }
     }
 }
diff --git a/rust/kernel/percpu/numeric.rs b/rust/kernel/percpu/numeric.rs
index e4008f872af1..1b37cc7e5c19 100644
--- a/rust/kernel/percpu/numeric.rs
+++ b/rust/kernel/percpu/numeric.rs
@@ -62,7 +62,7 @@ impl DynamicPerCpu<$ty> {
             /// Returns a `PerCpuNumeric` that can be used to manipulate the underlying per-CPU
             /// variable.
             pub fn num(&self) -> PerCpuNumeric<'_, $ty> {
-                PerCpuNumeric { ptr: &self.alloc.0 }
+                PerCpuNumeric { ptr: &self.ptr }
             }
         }
         impl StaticPerCpu<$ty> {

-- 
2.34.1

