Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE261C5D73;
	Sat,  1 Feb 2025 18:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738436299; cv=none; b=W7sJniM3fiYjA2uC3BM23cBu2wYE4cxLDbs6w5YkSzxsodeTYUoPZ0Jdt8/iN5qB65joLXU75Tgu7NOsnVlFn67olWKHNbpaGprwlc2OF3m8z1c5SiPMQBGWijPSmYAh1lByudcoeV2IhZJvdeHTZuRSAB3xPlOuhKqS4CiCAgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738436299; c=relaxed/simple;
	bh=C55WBS7Kee2awZ8qltzC/EsTgLDQMBTKdm8b0uTOwMo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=j3scSYQcRy5jsY4j+GMbMZWnmQpf02knKGhmWtOuhWF454WjCzKssk9HSwCc9eylYtDuA+pOTN5wfRAOXPQgajBSTMPnYQOPsftho91xaGDcLRivFs711ZhFIc346SJL4fLCV/HqsZddjtzQxcYLzUri4Z4Qq/AobVc6bTA4l8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A1vznoFp; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A1vznoFp"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7b6f1be1daeso297250285a.0;
        Sat, 01 Feb 2025 10:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738436296; x=1739041096; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8YaP/wkas3zsv6gy4efd2RXf7wQ7Ky6kvXyn8lqH9lw=;
        b=A1vznoFp1xV+yYKgjl/WFLdggYLM4fAzDPrUnnfySmwjM+6emeM6EzDRsYXaZTziBE
         AGA2d9gd6HoixFNnU6WSW4MKnt1wKl/VNtKzxI1LTxg7lDrfOW33v2k1JCaOo0rrtnZA
         m4sbTvnI1hLv6RGfE5AAvdrlx6qnCiGD9fb52XJ5tPzrb5p99sMNclcoHa7PyeWu9ZVg
         ivt+WXjeDc21bIjEgRtLIOGaYCQ95OjNZd3/RqWC6m93xaRnvkh3TXHi39gXVxfd2JRh
         Hi9IH4lUfHaPrL0Qo/AOfgh/dkEVRRALrIW9qsrhhKa4Q5c77UH8PV8jp3UfoM0aBHNZ
         3GIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738436296; x=1739041096;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8YaP/wkas3zsv6gy4efd2RXf7wQ7Ky6kvXyn8lqH9lw=;
        b=u8c82ZFiwJtMrZ8ZESMvxitZUlmZN8Q045YOfZD9ZqJ0uMv0s7XdIHzvgnsTlAUiPi
         Tv7auZykSGu15sNUjbk/48PZTWtIIFDZVgB/vzTwImezTJX9/aBw/TrGfDk+sD+jmiWg
         6ut8dJ8YHIP7+dEnSTwxW1MMXv3mPMzmuEH0c/38D2zaldqLFlGIRYKq6FblJcnrt4Uu
         3sahuf8qvbWbw3cfcwFCYahPYwDOABLtqdJX3cQtBeqZ7PdaeuVZ5kEKda+U1mYsYMxJ
         k9yb7OYf9JzsH+6mNV1lJoZL+whUd0WxjM+qR2tjyMFMqOVXAwnJ702OEQcnMlL6TNA5
         sWTg==
X-Forwarded-Encrypted: i=1; AJvYcCXNAoTsHNYJZnJpELnSkrD5SShNfcKqSSNfwSGKaUOQKqhosPj9jEQszu4S2gN/ToE/orXTb2rSHV0Ya1Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVwsVOwwRjue8oEHr/tcNbbUyzcncJpkfIe0QKIckPScmCNduJ
	xabS6dKCszzpKRCF1b+GQHO9hBZbMCTvjiuI1YiRWy0EuGkTbyGC
X-Gm-Gg: ASbGnctKbHLn8XvPktxuEnstavBMXkusmCR31c3gcOa67YQg1ZsB1dkzwpPBlvhUEok
	vF4dfV99BuNPPxufkYO5Q0cyAvMpxJdR9MGnT1RPZ+/4iPCCQI7QgnTihBaj536qNcj3DJf9fOq
	/9hA3L40lZtGOxfqasr0e0/0Hf8qCt8P6/buSuLRLbdVQrmCEATg/iPQpMNGO0U2lHN+S9XP1bC
	VVTT778lni5jmVXywlWrx3LL2hmF3IqFFYaTSNVGW7UWjtxsLO+dgdBxdyXsXga0t7lSLcLusI3
	8TeFT0okwuvy4iajjcjvLYSJ/YrfaR0Gw6WiSBE=
X-Google-Smtp-Source: AGHT+IH/cMUk7yjThUxYzJvcPVD3YoSYrB/lWrjtjKUxfXJX815A1NwM2k0r696Wnh/wlNERoD+j4Q==
X-Received: by 2002:a05:620a:4d90:b0:7c0:174d:e350 with SMTP id af79cd13be357-7c0174de37bmr769597285a.36.1738436296508;
        Sat, 01 Feb 2025 10:58:16 -0800 (PST)
Received: from tamird-mac.local ([2600:4041:5be7:7c00:f07f:fb14:288d:6f1e])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a8bcaf1sm326048085a.10.2025.02.01.10.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 10:58:15 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 01 Feb 2025 13:58:10 -0500
Subject: [PATCH] rust: alloc: satisfy `aligned_alloc` requirements
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250201-aligned-alloc-v1-1-c99a73f3cbd4@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMFunmcC/x2MQQqAIBAAvxJ7TrAVIfpKdEjbbEE0FCIQ/97Sa
 ZjDTINKhanCMjQo9HDlnESmcQB/7SmQ4kMcUKPVqCe1Rw6JDmHMXjmL3qGxxs8I0tyFTn7/37r
 1/gEzCYRrXwAAAA==
X-Change-ID: 20250201-aligned-alloc-b52cb2353c82
To: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

The implementation added in commit dd09538fb409 ("rust: alloc: implement
`Cmalloc` in module allocator_test") did not honor the documented
requirements of `aligned_alloc`. These requirements may not be enforced
on all system, but they are on macOS. Ensure that alignment is at least
`sizeof(void *)` and round size up to the nearest multiple of that
value.

Fixes: dd09538fb409 ("rust: alloc: implement `Cmalloc` in module allocator_test")

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/alloc/allocator_test.rs | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/alloc/allocator_test.rs b/rust/kernel/alloc/allocator_test.rs
index e3240d16040b..f360fc2e20f2 100644
--- a/rust/kernel/alloc/allocator_test.rs
+++ b/rust/kernel/alloc/allocator_test.rs
@@ -62,9 +62,22 @@ unsafe fn realloc(
             ));
         }
 
+        // According to `man aligned_alloc`:
+        //
+        // aligned_alloc() returns a NULL pointer and sets errno to EINVAL if size is not an
+        // integral multiple of alignment, or if alignment is not a power of 2 at least as large as
+        // sizeof(void *).
+        let alignment = layout.align();
+        let minimum_alignment = core::mem::size_of::<*const crate::ffi::c_void>();
+        let (alignment, size) = if alignment < minimum_alignment {
+            (minimum_alignment, layout.size().div_ceil(minimum_alignment) * minimum_alignment)
+        } else {
+            (alignment, layout.size())
+        };
+
         // SAFETY: Returns either NULL or a pointer to a memory allocation that satisfies or
         // exceeds the given size and alignment requirements.
-        let dst = unsafe { libc_aligned_alloc(layout.align(), layout.size()) } as *mut u8;
+        let dst = unsafe { libc_aligned_alloc(alignment, size) } as *mut u8;
         let dst = NonNull::new(dst).ok_or(AllocError)?;
 
         if flags.contains(__GFP_ZERO) {

---
base-commit: 89a010129b2a60185d34d7377ef8aec7fbb92e76
change-id: 20250201-aligned-alloc-b52cb2353c82

Best regards,
-- 
Tamir Duberstein <tamird@gmail.com>

