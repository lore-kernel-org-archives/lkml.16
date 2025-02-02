Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0958535DC;
	Sun,  2 Feb 2025 11:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738495645; cv=none; b=l6jOnIr8FbdB7K9WglwAjx0QHmmM0H7kKi0Fg2nrF4nTZWbjdtgXyQg9ZeN9wUVXR2Y7Ww9IkLaylID3ndQRKgHEm8RoFt7kjLZHCGYCrz6m1904/kf2IbGMiNl69fUmkFut7eV9f5NvgLNo571lQcZJ4f3ZMidBB/IJlVVzazc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738495645; c=relaxed/simple;
	bh=hf+IdUFrZOQeQVFus+InFVRfeR5NNqXLK663w0T7MYw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=sau1sond/StN8nikK6M7O4/BXnHiKX6RufNKoe8KxLtyyI4Ns46rtMdyrLkLpXEbA/wWp7SXLGg+27XCo1Mm1+ODGX9HMPtS7Czr8rnAGhVGEURt6JrbnQNaG2J3BNAv4ZayPAdhyR908H2ur4nmYdGpTppHc914lfGUlUSgH+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cw9aeaKD; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cw9aeaKD"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6dd0d09215aso26087056d6.2;
        Sun, 02 Feb 2025 03:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738495642; x=1739100442; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0/6zeTYuhLFER6O/8ziKsJwSTb7O7aOJg9sZH7UL3Kk=;
        b=cw9aeaKDwGxydpmacy+oguDsSTosDEDM6l62jzjrzpWm9dbudHncwIFgY9nEERPIEW
         zK1yaNnYD2PtFEn0AlCwr0qkZ6ybldpT9Wla37hRI94vYQ4qbyxlCres6/ivaz0lZLOp
         U9YrscaKx7oSJ420mebN3irLR4sn1BURavsB9C61gjXN/aiKzbEUyMooiBe8UOPgPnXM
         y40rqGGyxDUt6xwVdMIOe5o85xsuiibeW2D6Ns5IxLDXe+AmMVfdqX+eYT6IfF6BI1+J
         XWLuaXP4ltZ21NBa38zTK61oc1jO4v+QLsNS3wTg1L896r2fXpbvWpp6IrSmFVs977Hy
         hCKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738495642; x=1739100442;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0/6zeTYuhLFER6O/8ziKsJwSTb7O7aOJg9sZH7UL3Kk=;
        b=guqOy/gTlQLLtMcNqnXQTGDYaK9c3ktNJtS0MNe07qwtbJF73pTcLmbsHc7ntaAdBY
         nq8MwH3hH51auysKmzc5yPwNFvRAqqv+A1YTqTOyTXD0cEhpb4R+sVJ6OduvI0SOFPqe
         Mrtu16lEy8YFJEYGN2a8mIrgu3EX6CIhxxiWFdmnXE4jtY6SN2bDKEZYlXHbG5DdRhGh
         luvrb5QNGTAe4SJD3u6WDwluN+a+duxCi+Wc1XJ7VWnc881fDfiTTZkpx43ovHCFWV/+
         E/WRBZm4Qob5A06dQrMNsJLhT3NDN55MJQgrvdaMBpYEKf/mQ2lpUsio5Vf3fGkwR6UR
         s+Tg==
X-Forwarded-Encrypted: i=1; AJvYcCXaW6CKy7yimXwHq0XX1h6jcU5EE988RuGGJ8SrUOiQ3P8u1gj9bGEldxflEZ3LKtaa3TEQoo7dsjHPrTE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+HibhTz0TlokO/PgJrXMCfgghYfQ5E0L3pWBdx5YpOSTVjb0A
	mtBvUtv8Owk0uPiGDgCXRMVoF68KWEGPdEXkRxWBd1cHFIi6ZNsL
X-Gm-Gg: ASbGncvWdl+1m84/b1/DCHzIZ1TrEqKJoHEgyR64xKCaT1jgowXZVF1aIXlr4nSgOMH
	uoX2kPodunjRbii3F0Idw8swlekZUiUgT6EwwI3py1p8ER+qEmYmzxAItSIOukOR3trlNNEq6Ia
	TIkaI6QUD9blocj+B+Qgdwf8NZkRpUw+i/In2BqYHPPJcB/KI/8OAsJH77oipQX/8JB6D0N7Jt2
	ayFB9thP0y2aFn9Oh3NiBnhp0Tioj8h/2EC7hzPsqZTmNQQXx+FpdheXFk9kqBXVvNVehYTnJd6
	R1KFGElbr7zE5hfnUxTHRIsWUjTMg8Oyeh/eyd7CUd4CzGYfdbwG
X-Google-Smtp-Source: AGHT+IHPTbUGcbI3TYP8wdW141uRzBTOQHDtibuTNsLaXahLCL3ZDpdz7xxCcTX5U1PS3xy7VE3Kgw==
X-Received: by 2002:a05:6214:765:b0:6d8:9ead:c665 with SMTP id 6a1803df08f44-6e243bfafb5mr280251686d6.27.1738495642569;
        Sun, 02 Feb 2025 03:27:22 -0800 (PST)
Received: from 159.1.168.192.in-addr.arpa ([2600:4041:5be7:7c00:f07f:fb14:288d:6f1e])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a8bbe58sm406388885a.2.2025.02.02.03.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 03:27:22 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sun, 02 Feb 2025 06:27:16 -0500
Subject: [PATCH v2] rust: alloc: satisfy `aligned_alloc` requirements
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250202-aligned-alloc-v2-1-5af0b5fdd46f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAJNWn2cC/3WMQQrCMBBFr1JmbSSZWLSuvId0kUzTdiBtSiJBK
 bm7sXtXn/fhvR2Si+wS3JsdosucOKwV8NQAzWadnOChMqDEVqJUwnieVjfU9YGEbZEs6lbTDaE
 6W3Qjv4/es688c3qF+DnyWf3ef6WshBLUdeaqR012uDymxbA/U1igL6V8Ac9u+kyqAAAA
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
on all systems, but they are on macOS. Ensure that alignment is at least
`sizeof(void *)` and round size up to the nearest multiple of that
value.

Fixes: dd09538fb409 ("rust: alloc: implement `Cmalloc` in module allocator_test")

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
Changes in v2:
- Shorten some variable names. (Danilo Krummrich)
- Replace shadowing alignment variable with a second call to
  Layout::align. (Danilo Krummrich)
- Link to v1: https://lore.kernel.org/r/20250201-aligned-alloc-v1-1-c99a73f3cbd4@gmail.com
---
 rust/kernel/alloc/allocator_test.rs | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/alloc/allocator_test.rs b/rust/kernel/alloc/allocator_test.rs
index e3240d16040b..69f79e246891 100644
--- a/rust/kernel/alloc/allocator_test.rs
+++ b/rust/kernel/alloc/allocator_test.rs
@@ -62,9 +62,21 @@ unsafe fn realloc(
             ));
         }
 
+        // According to `man aligned_alloc`:
+        //
+        // aligned_alloc() returns a NULL pointer and sets errno to EINVAL if size is not an
+        // integral multiple of alignment, or if alignment is not a power of 2 at least as large as
+        // sizeof(void *).
+        let min_align = core::mem::size_of::<*const crate::ffi::c_void>();
+        let (align, size) = if layout.align() < min_align {
+            (min_align, layout.size().div_ceil(min_align) * min_align)
+        } else {
+            (layout.align(), layout.size())
+        };
+
         // SAFETY: Returns either NULL or a pointer to a memory allocation that satisfies or
         // exceeds the given size and alignment requirements.
-        let dst = unsafe { libc_aligned_alloc(layout.align(), layout.size()) } as *mut u8;
+        let dst = unsafe { libc_aligned_alloc(align, size) } as *mut u8;
         let dst = NonNull::new(dst).ok_or(AllocError)?;
 
         if flags.contains(__GFP_ZERO) {

---
base-commit: 89a010129b2a60185d34d7377ef8aec7fbb92e76
change-id: 20250201-aligned-alloc-b52cb2353c82

Best regards,
-- 
Tamir Duberstein <tamird@gmail.com>

