Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F2C219A71;
	Wed, 16 Apr 2025 17:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744823756; cv=none; b=Y5JzRCU0AkVihirhq1wgvfFM1pJSm9Wm3rd+D4tonRWsxDM/vpEhCQEsQp3XULzAKq1DsJyRDijTH9aAO8ChnWOpAfnJYxv2/PxzZHbtFw9hWBtyP5+jCkN3UWL1z5StIZSfnNB8Vqz9vJ3Jq0mXCwK7uBIkmE2LqbeRRu/4nBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744823756; c=relaxed/simple;
	bh=theyHJpujek3mRPTB1t0/HuOjXg8LCIlAN/KT8QL5Fk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ranvm93o5ZuVKv1uJJ8o+u7ccBKcLtNuOnpj7qeyvw4qLATvIxGLsZI/qOQUhYuEHk8rvHPY8+ZmTj64kgleScKCK3zBKdDCRC6x1MQ6G0vmixTo1gSaHY+XIAUj8TnGzjOJNcb2gUG1xFYdl/dzMkWLKBx/ztPMXNH32zUlqlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FCsyRROL; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FCsyRROL"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7c5c815f8efso640431385a.2;
        Wed, 16 Apr 2025 10:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744823754; x=1745428554; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZxFAp/0sVarAzZpw7nCXHm4ELNRIXpdSHCkEIQ/RdSM=;
        b=FCsyRROLCH7bVHmjyaFdFCiQw+/ZS5jwEE9ik04+MAYhbARSM+maE84B6r+vHZs8/I
         W6idt8/ekHfLg6iBQVzc+NyNt8D4HNKUtWsWTMzH4VaXLM6oPOGaHtevbmec7vr2WHle
         piThM2j3+DDtNU2I1d7QLXjfqtY3yQswEklolc/9TXL7hiDt9J8mPqQdzJwPMVolCkfn
         IMhune9DXpQIZWryoKYyO7+zri7wMVMgFDQ/zFhjvqJrJ3RfEHF19k5QU4qBgADuhtOP
         cn1Hvzj3HYnuKNsaXSevnZ8thr+KKuWkSSgfd/37j+xYw7Z+yjcyjk2Sx+gCWWjfy6cx
         jn/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744823754; x=1745428554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZxFAp/0sVarAzZpw7nCXHm4ELNRIXpdSHCkEIQ/RdSM=;
        b=f7gd9e03xdityelA04paErXDEQKYp/rqXwNzCu0aMyRkAIwo3MEWwPDdJLKs58Qyw6
         0QXtBi8ZV2ORxcwtT90qL2naKYKMPBrKY5XFRqWXV1J+e6kT6k5+NF14HI5OpmDwqEji
         e0tpWmmFZgIVErfi+7qxz2p5DpdIzi6RmSDyoopB47RoyLhh+k6x8cuzTAgZCfADKVlu
         29pXNiSPubG2AmRrPL8btjk6tDOb/CCG09rZCNP3XiHebmyeyWGs4gLimCy2dzc8WHbO
         7ttvnrcBvBujQCi0AGzUq08nCdasO0Chg4gJouexm5JTrVRU/9Er8U7eNx9BcBzesSvA
         hFKA==
X-Forwarded-Encrypted: i=1; AJvYcCW49f5Lmldg/+wwuT82DWatXpzy2JlHl62bH3tYnd9iDlrW9UpAnKkJIX/6Matzv5mv69i8A/snGEWfstI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBQTJTwvP9UF5VOax3k+k2VbSMcYACfRh+sOMf7/tTHl8VHA27
	TuRjpwEFLgM6hv+QVgVJ6NvTSzm3czewOMXQm31Qa+pKVlkdA+J3
X-Gm-Gg: ASbGnctoXzU+IIvSWDS75r/pAMMMmJvOvZzYFna5rw+EZClELS1e3lbyYsMhMJlfuxk
	4d7Rle47AiUMn8YbI32uz2bwpHt2U4XG7+I0x+LWRTp+5NRJJ/phv5AuR7KdlyKISED0hqEKwdl
	5t2hdZ5EZqpoGJlE50K+s7mqPP9ELnXMdDvIg57GosOruF3KiP036Rqo7NG6+rbDHnGCLsIqA9l
	r884cgtvfLRtisR8B8avlTzIMWJq5Vesqyq52FYqw04HIO1kE6pjeHrvxSBCYYtV9LD93BOElPE
	Gaw/KJdGksL15I3YBMF+XrWDGxQk6C1ko3IgxrC5xGtJmMvNvaLr4JJl/wsI1epJlL2v23RiMo1
	Hu6aw42/EobfM7yKa48VquO3udjlPiHO8k4dbqHODSLtZ
X-Google-Smtp-Source: AGHT+IE9/MP+dQOQ7UtGckvEBLlGrYv/kaF9xVlJ5yP6t3Gsl45SwJznT3KW4bSF9YyURkWypX7Q5A==
X-Received: by 2002:a05:620a:1a90:b0:7c3:d7ef:f7f5 with SMTP id af79cd13be357-7c918fec5b1mr335542785a.18.1744823753525;
        Wed, 16 Apr 2025 10:15:53 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2620:10d:c091:600::1:a61d])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a8943834sm1084605185a.22.2025.04.16.10.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 10:15:52 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 16 Apr 2025 13:15:42 -0400
Subject: [PATCH v4 3/4] rust: alloc: refactor `Vec::truncate` using
 `dec_len`
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-vec-set-len-v4-3-112b222604cd@gmail.com>
References: <20250416-vec-set-len-v4-0-112b222604cd@gmail.com>
In-Reply-To: <20250416-vec-set-len-v4-0-112b222604cd@gmail.com>
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

Use `checked_sub` to satisfy the safety requirements of `dec_len` and
replace nearly the whole body of `truncate` with a call to `dec_len`.

Reviewed-by: Andrew Ballance <andrewjballance@gmail.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/alloc/kvec.rs | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index a84a907acae4..87dc37ecb94d 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -488,23 +488,15 @@ pub fn reserve(&mut self, additional: usize, flags: Flags) -> Result<(), AllocEr
     /// # Ok::<(), Error>(())
     /// ```
     pub fn truncate(&mut self, len: usize) {
-        if len >= self.len() {
-            return;
+        if let Some(count) = self.len().checked_sub(len) {
+            // SAFETY: `count` is `self.len() - len` so it is guaranteed to be less than or
+            // equal to `self.len()`.
+            let ptr: *mut [T] = unsafe { self.dec_len(count) };
+
+            // SAFETY: the contract of `dec_len` guarantees that the elements in `ptr` are
+            // valid elements whose ownership has been transferred to the caller.
+            unsafe { ptr::drop_in_place(ptr) };
         }
-
-        let drop_range = len..self.len();
-
-        // SAFETY: `drop_range` is a subrange of `[0, len)` by the bounds check above.
-        let ptr: *mut [T] = unsafe { self.get_unchecked_mut(drop_range) };
-
-        // SAFETY: By the above bounds check, it is guaranteed that `len < self.capacity()`.
-        unsafe { self.set_len(len) };
-
-        // SAFETY:
-        // - the dropped values are valid `T`s by the type invariant
-        // - we are allowed to invalidate [`new_len`, `old_len`) because we just changed the
-        //   len, therefore we have exclusive access to [`new_len`, `old_len`)
-        unsafe { ptr::drop_in_place(ptr) };
     }
 }
 

-- 
2.49.0

