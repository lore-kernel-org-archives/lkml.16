Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4071821325D
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 01:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744940555; cv=none; b=rpTvgxI75tAXyy2IfrTlNVn34HFci1ihDPhlXv4ckTHnu2HTXOcVKo2sthxk0n/kGyIXxwfsi0hKvwGkXConrFCXVJO6hVdt6pjLs78IvA36GdArxCzHFSyti5LMqU2ccCTNLNfwDbP9oy+0GKugbvuz9looZ3ebWVWgzF+1GO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744940555; c=relaxed/simple;
	bh=wpYtq1z+RT5TLl2nVLPE3PEreLoCtFhLIYyj7HZ0L94=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AN0jAGJu/Ajpmb509pvXnPlp/yBcDUo2TZ5Vp0H0mFDl5P4eAIOWF59MCuEhPztjW/vLhG+G2vDFtNl7XVuHHu1nhgiChkBKk1VndA/jHy543rKH/wqy9JQ4puRe7CYbrcokPxJPG/BmMixs3XS75vFEdctaFmtsJIuUavdTs3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=GC3oe/6b; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="GC3oe/6b"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7020d8b110aso12762377b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 18:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1744940553; x=1745545353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SpcLRGstQ17pweyurDBkde1oh39X2LM8n24QQtDlTk0=;
        b=GC3oe/6bFlQGD2Yvn2orB+6JYbOgKzbqs86FJ2nQfy43SeRZV02/6pYU2N8T6aA9Uo
         cMmv5x4oNPt+aKSIuvEeMoolUMeCLG/64Cks1SCHl3MI5lsVJBoV+hTKsZtu/9be575p
         qIYI28LeuBzRv0IrwY+Mqx96H22JcNZaISMMVKF7/kmpumkF30kAoHH1J8cQLsfPPNeP
         FAgdNW17hpA5AXNrYa0AE5WQ1fNsVPrzq79kWzYMpT97OGJNe8Ek+w6Iwxbsxcrc6hbO
         nuEyro9ypHR4wx1TGbkBbtP5wWLHCp4gGyxsKAx9FH+Rf+MHpxHY48hSRykbwVrveo44
         sr3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744940553; x=1745545353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SpcLRGstQ17pweyurDBkde1oh39X2LM8n24QQtDlTk0=;
        b=n9HD8zC8Th2+FsSrV/u/9fkrIZpTO0G7gqZjaPwHQY9Tg8yjZAYfP5pfKU7wwaRqKp
         29uTgih6z1CgmZ7ovZnIKrOOiUtsR6I9iXlzYnXoXvy9UqjbvpOAqvcfOy+pq3jLmrfJ
         FaRo6aVAuGVO5CwFmIcc+Z4EAYLRpazLRHnfq5ButDV/P/mv3Fi+HReNBGeURIZKypwd
         ypev5RY5se5VFouJCftZ/wy90izMytjmMWGdKPwbZIv4a+B/aUl/UNg8S8qHENDJzX+0
         UJzNQaEMBXYmcYcX+YImAU/YFrt+bipQp0ZoVJXNfzD4Z8b92lvmTiv4Fuqz+UbmoqdQ
         dYiA==
X-Forwarded-Encrypted: i=1; AJvYcCXbhVJK3b15tdScn5oqVqnIoZ7nkMfU45ue+8QKhfV7lhAC0La2MLGANdEDsieAK47JUbgRLvc1cV56e28=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw28XZGGLvgTfes/1cqgdIfEvXUNp+GSpAmaJunlYqPbPIy4jWj
	hRApdoXL6BOJmJ/7IlXCwCpbK8idsDWbRWEDcAFWdPmAnTA4gEZA9YdP9o+HCyk=
X-Gm-Gg: ASbGncvmEvxi6rM7SyP15gTRvsKCy1+U0h/0K7BaYu8LU1/LXSwgAO1gu1kQjTZTHRE
	08umDD904UmLI2AkF7sxIvYTCS/yYDvFqDizhB1V6r8RkEP1jI6/IM8ajsrvVwMB126THphhX2Z
	iRqFgDww9GPLb3LKXc5sOXJ+bGe+lAIMY2rAzEYPf8Mol47CaAsf6b4ZE3V6e2Lgvm1fdm45PGT
	k/0fFu1ZlGUQ0up9B9qIXl+uDfl3bWcnrDH1JPCPKMgyWlN5vLFwnrVkybKy9F8XTv4Z76XszLB
	XWiPp9NAjj1idEnP//vvbKyn335RAY7JYNwXq3KDLPnIQiltHzwvZEtgy8XvA7r7ZJAJXnOHh+7
	m/JtCRBUGu2H2ruA+3+9By32fVlPBEtqnHyE+
X-Google-Smtp-Source: AGHT+IFU38DAD4VmAwz9QZTIHXxHp74s2uY2I8B+jjZ/AE+BjJgAp18iDLQM+1q2YlQXNsJdM2clww==
X-Received: by 2002:a05:690c:6b83:b0:6f9:97f7:a5c4 with SMTP id 00721157ae682-706ccde345cmr14891917b3.29.1744940553169;
        Thu, 17 Apr 2025 18:42:33 -0700 (PDT)
Received: from Machine.localdomain (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-706ca44fd13sm2804597b3.20.2025.04.17.18.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 18:42:32 -0700 (PDT)
From: Antonio Hickey <contact@antoniohickey.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Antonio Hickey <contact@antoniohickey.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 12/18] rust: fs: file: refactor to use `&raw const`
Date: Thu, 17 Apr 2025 21:41:33 -0400
Message-ID: <20250418014143.888022-13-contact@antoniohickey.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250418014143.888022-1-contact@antoniohickey.com>
References: <20250418014143.888022-1-contact@antoniohickey.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replacing all occurrences of `addr_of!(place)` with
`&raw const place`.

This will allow us to reduce macro complexity, and improve consistency
with existing reference syntax as `&raw const` is similar to `&` making
it fit more naturally with other existing code.

Suggested-by: Benno Lossin <benno.lossin@proton.me>
Link: https://github.com/Rust-for-Linux/linux/issues/1148
Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
---
 rust/kernel/fs/file.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/fs/file.rs b/rust/kernel/fs/file.rs
index 13a0e44cd1aa..dc427613654e 100644
--- a/rust/kernel/fs/file.rs
+++ b/rust/kernel/fs/file.rs
@@ -331,7 +331,7 @@ pub fn flags(&self) -> u32 {
         // SAFETY: The file is valid because the shared reference guarantees a nonzero refcount.
         //
         // FIXME(read_once): Replace with `read_once` when available on the Rust side.
-        unsafe { core::ptr::addr_of!((*self.as_ptr()).f_flags).read_volatile() }
+        unsafe { (&raw const (*self.as_ptr()).f_flags).read_volatile() }
     }
 }
 
-- 
2.48.1

