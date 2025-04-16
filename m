Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC602192FE;
	Wed, 16 Apr 2025 17:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744823755; cv=none; b=EYaR8i0KbXwKN4NCL/Mz6/wJxWAJyHszu+fovozEMG1RNNpYHs9yKwUlPr/tACy7osW2nBnn9rwdCGhOnFqDNF+HLhwryLvIH+87mMVkr5EPRSJMpGKv1+UwIe0DesQoj4anv1dDIGR3ISq6VpRDxB7hjXIVD1Suxvnj8KfaPZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744823755; c=relaxed/simple;
	bh=dGZobBVOSjNjtOuPhmAiQkQ4Q7FnLCHzvIVHNXKELAs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zx9ToZkF+ivwQS42UoJ2w5F+AZZ/kiaEKCLPBEFPn4Se4Oy94nJ0ksEWNnVJmXePY0Jst96XMDjJRQB33J+7DCKQ4Npzydv4iTPfIhQVfj4ynb614rkGC4xhNY/AAuVfYCH0fiwWxuYaV+IERQabntYVEX2VRKTIa32Pzx6ODeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ewN64Ocw; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ewN64Ocw"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7be49f6b331so755972785a.1;
        Wed, 16 Apr 2025 10:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744823752; x=1745428552; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XOOqAanHNr2fjh0vWf+LQYt1BqTrOs/5JiHUjG+RR1g=;
        b=ewN64OcwQiaLT1bFj8ZwCqAyYLQPkU7EUdzyrChwrtTETXLTCa/1/z4phGA7C9DCbD
         cuZzUqrxDBUnkdAG7NrJ6NBvN4APMwlyIcfbW/nzERSmy7SEHx62OA5kzy24/0J9io2s
         D32O5eVvW05ybTqzDibqaLLkKPn92bwYl7pdoTzQWFt7vTTsvYCkLhSTddO3+mSL6mIu
         Xw/9O7BXnhx4NFwx9lGkmEbNTZKyZW7+ur9nIXy+0PM6U1mgz59Rr9mFHU8xFb8QF+j3
         eODkQF2/uY3hSweIw3YhBvkQrN5/f5vCQWarXhcg4gKGahc08Z7x1LtjWiPpED0twq5h
         n6qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744823752; x=1745428552;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XOOqAanHNr2fjh0vWf+LQYt1BqTrOs/5JiHUjG+RR1g=;
        b=iNd/WojK5MXH+N8wdSS45jiK8i+AFm3F8NS7jUvLvBUVxD81JzuW4PwGc7ZM4k7nLM
         skt/8hgAKpuvcEDdXYnMkvUsN9r5c3LMf0ObPvuc71GPtBXIzYrTGKYAXLASRRI5Oh7T
         JMyC4kIz+tfBYUIN1uuPv5BXv7awmNxcmuG9W0LThJ3ILjtclQsHPOvEf1OI6wiMGuNO
         ++aeVFO5kdA+DWRj0uKUh+i4CcKdFsAXBeKoKO7zbQKG1v2EHxr9I8OoMdRUUyejfP0s
         ktrghJh/ZMgwavBI8P0sQLEWoxTliIprzHLpGcbDGlz8vDuxRLsOjQVIWy01a+OsYAgE
         P7XQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIM3fEN86LfQfu/TShU1hUdItNCkmHNLk08FGXoX8O0472JQZ1+4HLL3f5C1mhzDlXoaxFJeYb4Rdk0Vc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAZ8jjh6PBjOuoNmOtkZBu4jGjFxaL99Lk5gLzoEHLCGsuklX4
	RcdxoZQLguw+QDk7HkjJ/GwQEaSiZMiWFX8RSEf6N7KQNDLpXspyyEv6pvw+
X-Gm-Gg: ASbGncsMSinM8TtjoT3jPeeCgeH7/+EUwrQ36cxCZyJ0CIoynEtuj+H7I4dVx4dqw0X
	Hjz/4EvCiR8bdumT88Y/Ey99JsVzTdttMTYuj6gUH/kUrodA7X6jVz3PoAykgq2PzuQL7jNbgvc
	LTE2DS0ujQdtH+mVnJKw9aCPsL4xmRWIzCPut6vqhZGqSL+DT6tXidgrLS4cycqlq2NJrDESgh4
	zYhwdXyXnR6qCc5fh3/St/sbaiTqRnrVBNyzBmy0FSVsa9TTWj9wi1p84h2uOhVO/v2YVMbe3Vd
	pmrj3eZTZD39jQXTK6mHnryNCfrEfbeITvV7tW31t93XrYfwddanoTYFLt/dIP36u2IjaDW8483
	74pKai2r3K3MHekKGvsVN//qTD6YZ6WIEFnMe/6O43/7P3bmrhRPsy4c=
X-Google-Smtp-Source: AGHT+IEtvBnuz7fKL9252oRIPAxAg3OyfEOnVpGRTE7+OEABAPPwv1NhWIfd9QOjUC4G2mIEuCFQgg==
X-Received: by 2002:a05:620a:3191:b0:7c5:5cc4:ca5b with SMTP id af79cd13be357-7c918fcad7fmr289318085a.12.1744823752269;
        Wed, 16 Apr 2025 10:15:52 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2620:10d:c091:600::1:a61d])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a8943834sm1084605185a.22.2025.04.16.10.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 10:15:51 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 16 Apr 2025 13:15:41 -0400
Subject: [PATCH v4 2/4] rust: alloc: add `Vec::dec_len`
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-vec-set-len-v4-2-112b222604cd@gmail.com>
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

Add `Vec::dec_len` that reduces the length of the receiver. This method
is intended to be used from methods that remove elements from `Vec` such
as `truncate`, `pop`, `remove`, and others. This method is intentionally
not `pub`.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/alloc/kvec.rs | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index ca30fad90de5..a84a907acae4 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -201,6 +201,25 @@ pub unsafe fn set_len(&mut self, new_len: usize) {
         self.len = new_len;
     }
 
+    /// Decreases `self.len` by `count`.
+    ///
+    /// Returns a mutable slice to the elements forgotten by the vector. It is the caller's
+    /// responsibility to drop these elements if necessary.
+    ///
+    /// # Safety
+    ///
+    /// - `count` must be less than or equal to `self.len`.
+    unsafe fn dec_len(&mut self, count: usize) -> &mut [T] {
+        debug_assert!(count <= self.len());
+        // INVARIANT: We relinquish ownership of the elements within the range `[self.len - count,
+        // self.len)`, hence the updated value of `set.len` represents the exact number of elements
+        // stored within `self`.
+        self.len -= count;
+        // SAFETY: The memory after `self.len()` is guaranteed to contain `count` initialized
+        // elements of type `T`.
+        unsafe { slice::from_raw_parts_mut(self.as_mut_ptr().add(self.len), count) }
+    }
+
     /// Returns a slice of the entire vector.
     #[inline]
     pub fn as_slice(&self) -> &[T] {

-- 
2.49.0

