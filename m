Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3371828BAA1;
	Mon, 14 Apr 2025 19:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744658939; cv=none; b=EyQtvOX6N7mQG+PGOyDNTz3f0TyEetczTmIG+W+zvm92plTCtGzNRyJztI0fTs2u2lMF2Aqm89bxPwiBXKdKtyOB37YQCHaWjJNoOpcqs6h6+031gFnBqM2OprcT0y7urGgFs9dlUq9ltirf+fpBiRoEL5hKh7jlIxdCJM7lMA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744658939; c=relaxed/simple;
	bh=qMkte7lQcKY3s751CE5wL/z+0AJKVlVS07EzLc0WsFA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tS5ffIeIFp03rDP6EZc9BQdvW4TRcgvoXwR7JkZ8yQN3SL4smF6cbeHILb6eBsuy/lKLqxSFrHHX1h7CLhj81aSJ8vSaWV+dSAYuUqTIL9L6QrWxCOBxRVbqKlk9d5hQOsLQBubQLujnT1WdOvCfZQXzNWKo6I46oPDvl+Huu9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ONUOe5n6; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ONUOe5n6"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-739525d4e12so4294714b3a.3;
        Mon, 14 Apr 2025 12:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744658937; x=1745263737; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9tZ2dPLybpFH5FVRU54a2SFS8qh5x40EXdBFzij59yI=;
        b=ONUOe5n6AtmO2+xaKvvIZns5L854QPvwNRLrmbYYfKS2sOw0/3z9WUnOhNoR3VJ1s+
         VF/Hjx4BwOfSEHg2XZEkgAxhFmZKk8Du5P2WNTcLM7cRQ3w9ypguCDPrUkutm3Z6KJ9i
         b5zG92cFr/lMvC+FuA1PC4EguG9A9exr5/HU9ARp/dLwVphcFI8hYenbdnf8FDok8MvN
         h0Vkfl1gtY4P5y5eVrytDIuTGEHvJs/Sy2Q0mvQ1XQiqf2cNIkWosqVCy8kIjWXs+GFG
         JMiS4TDQsIVA0GSA8jy6AGK0UCC4LzGaD5Bvupd3g12uC9uovxTfN3MSIC2lW2cmXsNc
         d4dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744658937; x=1745263737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9tZ2dPLybpFH5FVRU54a2SFS8qh5x40EXdBFzij59yI=;
        b=heEbCCM55G2RyYH24ewlXVcmg6lV6R+eUzj5nadHnp9f2BqlxtYHrqy2/w2e6/JDY7
         ZjQGaV1I87CVvOabanRjeVSmz3Wu5damfqqcUxJqoyzPIHXInudQnJd7AA9fZ2ql8Owr
         fl9FpN+P+PJVGH0dCU3fiVT3ZLjxp0M68ve6isbGeAo+bz2OF+l2l0hAjzaqWeq8h78c
         SlKydUtwjlkFJm8zXfEF0MLufA/wveztgAQVfzTpNObbTiGfrjJ8x+n0AtXkMxC+OeVv
         kOsW3Jg0vT2MNK1fN9heA9/5vHA+tVLZ9FGmUzQ0uQv1Al4V4C8bOXtwmpDar3f4ODYy
         dE3A==
X-Forwarded-Encrypted: i=1; AJvYcCWNrNPKuP9K+jYH9j11MkTd2+1Z110jJwIY4rzRuvuziaVEhSqDGVs5dxYFH/k9Wm4oQWenUZBPjbXAty7ZnA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzV1IMzovaIvpR/uHRSKMRyXLdQvYIgG6SKHVGs9Bp09NFFiJ9T
	4HD1Y1E1zpYCcOvDC8ZmJrHn9j4YVj+jT3mDLG2xaHL3wsNt1f1f
X-Gm-Gg: ASbGncsPNigZSpZd54OxOp49jt0YmdxvrussnIyjILpIa+mSRvuy4vafPIr7jTy+gy3
	KbcPUQIwR0v6vLUmtPqew9xNu1DNJA5Fu5GnVOY6YInx2VmlQXCrTquZBlJcMPyUz5HYfYNJkH0
	R5Y9ByXxRltQxuhTqDtmCESIWF2Cqoleifk6TDdSy+fTt1o5d2wKfW/1EO/6n9LWqlETvmTeFxM
	i482E6Na6dI3oZ9F7FhUpzYltWCWD4vqr5/zWyIwr4LraBGnAGh/9a3IE2sDRBqvVU4dGlZxoPD
	C81gHy412FKpfM6EOQBTmnGZ0V04PpEzM4RCwrSCQ2w+kPrF3Leb1/qHqyo4EgaX
X-Google-Smtp-Source: AGHT+IHNsXgFEF42nADS/UEbwfqqQqsK38WQnUsa1NV3hLJUt4/dinwpHaCiM2CxnuGQt8oLrfB1Qg==
X-Received: by 2002:a05:6a00:4608:b0:736:b101:aed3 with SMTP id d2e1a72fcca58-73bd11aa506mr17054183b3a.1.1744658937299;
        Mon, 14 Apr 2025 12:28:57 -0700 (PDT)
Received: from mitchelllevy.localdomain ([131.107.174.166])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd22f0f9bsm7223159b3a.104.2025.04.14.12.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 12:28:56 -0700 (PDT)
From: Mitchell Levy <levymitchell0@gmail.com>
Date: Mon, 14 Apr 2025 12:28:28 -0700
Subject: [PATCH RFC v2 2/3] rust: rust-analyzer: add lib to dirs searched
 for crates
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250414-rust-percpu-v2-2-5ea0d0de13a5@gmail.com>
References: <20250414-rust-percpu-v2-0-5ea0d0de13a5@gmail.com>
In-Reply-To: <20250414-rust-percpu-v2-0-5ea0d0de13a5@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Andrew Morton <akpm@linux-foundation.org>, 
 Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
 Christoph Lameter <cl@linux.com>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-mm@kvack.org, Mitchell Levy <levymitchell0@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744658935; l=916;
 i=levymitchell0@gmail.com; s=20240719; h=from:subject:message-id;
 bh=qMkte7lQcKY3s751CE5wL/z+0AJKVlVS07EzLc0WsFA=;
 b=qV2E9+YzEfKW88KWUTSZdiWloPv2Cl5usdUnZpdm0I2jIxgzKhCyVQEpFKenWhASbeTtyfnQM
 kAxUKxjrDo5Ddlx6Ndjlgk1ZhpZY5SSKTQl68U8H9o3CPbUXi0Xnq7C
X-Developer-Key: i=levymitchell0@gmail.com; a=ed25519;
 pk=n6kBmUnb+UNmjVkTnDwrLwTJAEKUfs2e8E+MFPZI93E=

When generating rust-project.json, also include crates in lib/

Signed-off-by: Mitchell Levy <levymitchell0@gmail.com>
---
 scripts/generate_rust_analyzer.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index cd41bc906fbd..64c5283a509f 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -144,7 +144,7 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
     # Then, the rest outside of `rust/`.
     #
     # We explicitly mention the top-level folders we want to cover.
-    extra_dirs = map(lambda dir: srctree / dir, ("samples", "drivers"))
+    extra_dirs = map(lambda dir: srctree / dir, ("samples", "drivers", "lib"))
     if external_src is not None:
         extra_dirs = [external_src]
     for folder in extra_dirs:

-- 
2.34.1

