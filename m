Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB6E1F8745;
	Mon,  7 Apr 2025 14:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744037559; cv=none; b=NC95IBrst7QpEEtRcSlpoua8NmcgC6gCGwp29uSicWpnkBfrN42hrBSGxD5x7CjQye2QZXoVn77li4ZbSSo5HJWN3zpIhR3Vo151BlphjZR5ZQcwKcSO8if2gf5a/A1lwwY+rucEnibJ45hfIsU9wSEJxsihlld1xRspV/w8TIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744037559; c=relaxed/simple;
	bh=pP/vLwj1914GL9XTfvcpv/G1iSUzs4bBTRxc+t/uqv4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rhpVPYrsHA1Y6MQrpX1IeLfsLO6ytzk2z9RjU5T6Fi4cLKQ0mmB6f8/AzhCzeFO7oT5301r5JWONEdJMF4EX8rhcRelBfuyYiyhi7Rgzmb2OOpdgBYz14ALNSzkvcgzObkOgwc0LfPuYp6l3C10bT7+jCZzWzKt5SWj0nbCSyPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lGnVxPSH; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lGnVxPSH"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-47691d82bfbso91948851cf.0;
        Mon, 07 Apr 2025 07:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744037556; x=1744642356; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=npHOa95vpIqO5FBiS+oki9p8r42Ah9xfbMYb5nq+smE=;
        b=lGnVxPSHQesPMIR7f1y9eULMvHnyM1TRHTmIwTCHgmZya5aB3G8d9h79yKTq1bTMFp
         9SBPuTi0gnw9UnKPrIgiXcMbivrFcTnKmZo4pbZlQhCtY4gXUbP8V+4Y0eI8g94PPGOv
         8DuPiwVTdg+0G8mXMTQAZ+S1y4LC9r6ruhquupBVAQ1zp6bn7PpJHK9NyELvCtPRP75+
         e8V9G5vmqQCUfKN1I9zdretMoLo8l+RA4f6Z9FrQ9x2xKkkDmbnlf25K+K6iSVTDQigL
         AWo+ACTQxjYnVfKYgbZBnkU0VNx51DCK4rkiwEU2owL3VBpZo8xpJh976+scHT/GAHda
         2n6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744037556; x=1744642356;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=npHOa95vpIqO5FBiS+oki9p8r42Ah9xfbMYb5nq+smE=;
        b=GNAqRfs+Rm3bsoalDQWcCT5LRyDX/5Y10tFLT7h/oN/aoeUh/e23UaqkdZRns2A/6c
         2STvuAKi6bsIAi3FXXtKB/zQM1lc+O5qecW3c39HaeAqG6k7VUddiq0MDBshYy+afFwO
         hIwS29LmmNjZSY0ptcNr7wc/mTB9LoUxNlJ79caIsoEb+zj/gKud8PpwNscCcdrJrzg7
         +Z81iRoJhkgJ5X9KRl7ZUafQB4GcriXQPxwlbINuNkgHwtXfA53Llri10Wd5XjByJtEv
         IENpSkehVuBbglWJvLF4im6/Jx0ALEjRCvvPloe6dKnArNqCfPhl7xyBB04kp2aCCaJy
         zIZQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0Qy5TiAv/u8v5BtZQyag2gDud6vJiiP1VPC4NoSeHii34ZfCCXY0i0B0WCDBFcwM27Fj6huRqKCSCoaY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAfVYzJoTpcGN+rDmic0gvdHKrOofvBfaZ5zvSjYkAoMeeHwRH
	18fOMaLCnH0co3S2ftksOtWnnFkIBox+qYqJ6+ne+Tpq7iZzp0Fu
X-Gm-Gg: ASbGncuG/ZT7AubjLT3/CGMKMdea11T3kuhAQVybN5RUappXQdhyaU9J1PquSmIcZ4Z
	nlfr3XLPGIc/F7wIY/Rx9A7UqjyDq2KJSaIYJpvw90SuoluTHAlh1dpSeHW6T5uifyL9EcYOf9B
	+X47zg2e1To8xFr5sV1ORgIXAuZ5E3LgGduQutVTME+b2BiaKmiEpGeInGdg8Ur3agZIrHNngYq
	z3QAXxUy3/P1GcWoIWIa3Ol5WwwIggy23NIaOiZD6IhnJOwvV4Ib9HK8t3ZLDE/Vuuyrnll6toG
	9fa22yWcnTw+2CuvZPO5IiWby4fVeJILmNSsFVz+Q3h5ibEDeAy8MbnIdK45zxWR5wq3Z1elEW7
	eRXhheTXH0q/HBr39wchKvgAlNouftBfgYjqLYU7xmjDRDCXnFIpuT3tG34VQwAFZ
X-Google-Smtp-Source: AGHT+IHzq7r3nFIpr5rp2jmfyHRa+T8oEFiFcMfEAD9KtU9Mmk7FCWPdy36Pnu2LTtiHZo1VVdUlvw==
X-Received: by 2002:a05:622a:1a1d:b0:476:7e72:3538 with SMTP id d75a77b69052e-479249c23afmr214725511cf.50.1744037556582;
        Mon, 07 Apr 2025 07:52:36 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2620:10d:c091:600::1:d8ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-479364eaa28sm33065601cf.28.2025.04.07.07.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 07:52:36 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 07 Apr 2025 10:52:32 -0400
Subject: [PATCH v3 2/4] rust: alloc: add `Vec::dec_len`
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-vec-set-len-v3-2-c5da0d03216e@gmail.com>
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

Add `Vec::dec_len` that reduces the length of the receiver. This method
is intended to be used from methods that remove elements from `Vec` such
as `truncate`, `pop`, `remove`, and others. This method is intentionally
not `pub`.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/alloc/kvec.rs | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index f8045b6c8976..844154d310f0 100644
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

