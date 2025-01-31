Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E544E1E9B02;
	Fri, 31 Jan 2025 15:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738339197; cv=none; b=u7gWm7dDXhRVaI/hlfRo2MCcDU0sdpxMg9bNEVRTXRMHBbz65BcJLjDtQnkDKJGsSTvuEQU/6HPgw2YUErg7NrAhqxu4DBeNSq6nJTaco+qTsmRAgm7ZY4Vr7rEgGgeCiq5YyheakweqCJ42b00XgBj85eS5H1bSDfsRaCt39xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738339197; c=relaxed/simple;
	bh=q6ujgRddaK6B601nuulg07doY+47TABI5tkVVTVc8s8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=u0OdaLEo8y9hREiw6I2sqpy2woPtCp0xJ8cO0QTY7YXYF8234vKBOw3ATEW9hJ6rsIzNDKoXlvL4RAdGBGEVBJwz5Zpsbr3l4jJ7HoYkwfKFUDM4KmGC1/2qWmN4/dChO+ZZu7MxtJZJdnt5KkyWzWPlQ0QwOOe4HwRYM8LNM0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QwSImkeE; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QwSImkeE"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21670dce0a7so45836995ad.1;
        Fri, 31 Jan 2025 07:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738339195; x=1738943995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7Bh7kvr1RjTSIiljQmEtngf78fB8HkukbiqgTZs7DKQ=;
        b=QwSImkeEdG7pJKiRkDTLDNKZlXO7bkFWXhpZw+h1GH7Aoult2nX8il12msR93l0ASc
         YwcV3jOoeIu5/6nz7+V51+nKgSnUcZsDeMVOulnm2YzGzVWeWp97UDYfZFuHFJK5ocFf
         nZ80reD3AJLvXXn8Z34ETV5hu2mRx+RNkqEvDvRBcgj8LlwTQziE6M8/4pLLRuREv8XM
         iDMCe7qn3Faamg/tinT1DOxJgXZrwYbYD3vyl6ZNWoUyzkXKPsLzw46aI0c0MlYuj96y
         PFRvSBaYWH3majR0pNbvUvFv3LpX3dppgTF7BzKhqYpgUyrrKoCEUBjy+2i1ELVCZWKh
         o5Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738339195; x=1738943995;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Bh7kvr1RjTSIiljQmEtngf78fB8HkukbiqgTZs7DKQ=;
        b=WRPkVUTC8K05npuilPn17G6BUEW+TY0eo3F/a9Ms2/K2ZwdWLFMboQK+bpXCPjR+WP
         5cCfyCg5844yd1/RbS0/NA+ZqiaXb8TCIgbD0Ok2xPXGR+rCG2gkTsCPg9g6vTH0ejPO
         VJMtmbAcZiRT9mXm9BlxoFOSZ8MyaDYe54u/2Nj5ALMgHRrGP0V6QpGZaSMI03MYhaTQ
         d0eefsJnCbiSwik/1ds0rg7Jv4W5qxxAC6ImVXZV4h3xLfsoBCGGmbu88YKWaKEhoKIJ
         YwEy5r/NAw7JQfGqoKDrDmPJWM/k09OI/hiay6kHbVYQv2gfPL4ZmO9eff0relGjOhQU
         MD+g==
X-Forwarded-Encrypted: i=1; AJvYcCUDOu2IMS9EwUFywSGL3Qd7nQEDKJVdUb+Z2KCVaxUVY8IzUXjReC4+C+SoYlBTwm3aAbOQYWiIqCeOTS4=@vger.kernel.org, AJvYcCXoYiJ7gIX3g1kbrOmmQHREQ0emHo/QVHfTamrbCnKSdOd7JkdfhjVcm5kejZHDRlDsAdr0aRNsflBcdUe4nWA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ+SLo3MvvUgejWeOoi0t8uae24JGsFrkWiTwTpPIYs98lUvFf
	v3WkWlWy1wP8nthRNuC39mGROLyAmfbrC+KU+X7ClDFWMRjv0WbW
X-Gm-Gg: ASbGncs6mnBYXB2EzcUrLQG4voxgr1vgW9qNju+Kd76pc8yovr4+Nbm+2nYolMQ0fKB
	QGB9MrhsFBApk/3ZHlAoPcdZOZenrlwsZkCX58Cc2G2TtasS07eskSWMLsLoi3ZHwwHc14QYPjE
	pM0kScjbuuxRX1NhTxZvbYeFLxTK/yVmajjrglkGmkVLK5G5lBNZLPO8gf1PR0OnHEJe8Kdaoy/
	qrHka178bINSo5+EQSimJWCPogV71FnMFCwZTz79NEDSIGzl84/GgoX8RNTtao+u5Ln3+BvU839
	0HtIjqEQ7mDHAufB1R1CI/ya
X-Google-Smtp-Source: AGHT+IF76mWK+huaxySDy6NJ6b2xi3H2DW9Gw45M+n2RlnBbYjdCyU7mbBawxv8EiCXG6arZvdQUwg==
X-Received: by 2002:a17:902:ce89:b0:216:3bd6:fc24 with SMTP id d9443c01a7336-21dd7c62584mr175131655ad.21.1738339194692;
        Fri, 31 Jan 2025 07:59:54 -0800 (PST)
Received: from linuxsimoes.. ([187.120.154.251])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de331fb76sm31933665ad.230.2025.01.31.07.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 07:59:54 -0800 (PST)
From: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
To: peterz@infradead.org,
	mingo@redhat.com,
	will@kernel.org,
	boqun.feng@gmail.com,
	longman@redhat.com,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu
Cc: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH] rust: sync: lock: Add Lock::get_mut()
Date: Fri, 31 Jan 2025 12:59:39 -0300
Message-Id: <20250131155940.305403-1-trintaeoitogc@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

At initialization where we can guarantee that we do not have multiple
threads accessing the protected resource, blocking the resource in
addition to being redundant, can cause unnecessary overhead.
Add the Lock::get_mut() function for access the data without lock.
Receive a mutable instance of Lock, and return a mutable reference to
data because if the instance is mutable, the rust compiler guarantee the
access control.

Suggested-by: Björn Roy Baron <bjorn3_gh@protonmail.com>
Signed-off-by: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
---
 rust/kernel/sync/lock.rs | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index eb80048e0110..f1e29820ce99 100644
--- a/rust/kernel/sync/lock.rs
+++ b/rust/kernel/sync/lock.rs
@@ -140,6 +140,43 @@ pub fn new(t: T, name: &'static CStr, key: &'static LockClassKey) -> impl PinIni
             }),
         })
     }
+
+    /// Get a mutable reference to data
+    ///
+    /// ```
+    /// use kernel::sync::{new_mutex, Mutex};
+    ///
+    /// struct Inner {
+    ///     a: u32,
+    /// }
+    ///
+    /// #[pin_data]
+    /// struct Example {
+    ///     #[pin]
+    ///     d: Mutex<Inner>,
+    /// }
+    ///
+    /// impl Example {
+    ///     fn new() -> impl PinInit<Self> {
+    ///         pin_init!(Self {
+    ///             // This new_mutex! can be anothers locks like new_spinlock!()
+    ///             d <- new_mutex!(Inner { a: 20 })
+    ///         })
+    ///     }
+    /// }
+    ///
+    /// let mut pin = KBox::pin_init(Example::new(), GFP_KERNEL)?;
+    /// let mut_pin = pin.as_mut();
+    ///
+    /// let data = unsafe { Pin::get_unchecked_mut(mut_pin).d.get_mut() };
+    /// assert_eq!(data.a, 20);
+    /// ```
+    pub fn get_mut(&mut self) -> &mut T {
+        // SAFETY: the UnsafeCell guarantee that the self.data is not null.
+        // The `&mut self` guarantees the exclusive access to the underlying data, therefore it's
+        // safe to reborrow the inner data.
+        unsafe { &mut *self.data.get() }
+    }
 }
 
 impl<B: Backend> Lock<(), B> {
-- 
2.34.1

