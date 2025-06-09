Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4006E1FFC48;
	Mon,  9 Jun 2025 10:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749464705; cv=none; b=ESeCm/GypmpqNbzxybRx0ySIcEo0P6QYIR6KRgcRU0AUhYgQ5j0V/SZHkgxn21oJH5hODghPniOI4ltWq5bfEzV1uBzKbiRHMWLIgEQgA/6b1RlhovL57jfj1ffp8KgwihZSDo4ehXgV9sHAAEVkEgiZ/v0itBkFoT9iK2Qq03E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749464705; c=relaxed/simple;
	bh=BXVOF53rfGbeKgkxrTB8eFkwPU1bWLfrQsXH4CKgfAs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JSYwCdxyZesINZRJQGl9eLT75X3o0f+tdfiekJsBgUO99AsFXiXUcUSjrVhbnLCeIGbyuh4x1pLjTV3Uk2zXFuBcrlegtpwOs9j1Zt4GUVRZmmAgkTM8DRFtWhJLTo0Ursz9/hqK8FStrS38IUB7OJNCHPU7pvVgUpAPa1jI6JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XjlRaNF0; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XjlRaNF0"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-747fc7506d4so3909431b3a.0;
        Mon, 09 Jun 2025 03:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749464702; x=1750069502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ib7y6fFjEDkST/54mDXTljTaQEeHtKDA1Ev78ub8luM=;
        b=XjlRaNF0dAS6e+wKS018hgSZS+6ZqlxqlWqpgrGiK7xbcJE27bVFoeR6r96ezeK7Un
         fywGz/PBP1jf0Om6ADLngO2DEoqslqli95+MtXQ5cOCPR/kA6mPHYDOTLHPgzDZgmxOv
         waQ5h+nabWebuTu0fFGQ76e7GHMjWaW6zxnSwWWqYuXID8Aha+QXNn6oUx4//fgbzPFD
         +vRI1yNkXjkT1wj3KsO4koYSkg8rY5mjmZQ7v0I8yAh7k7cH9U5BfbyN4ZYJCyOoDBLP
         ijryIJgzejlA1X1psXhV5/i5/A3maBtPtAdQQpCOZmp/Y1F7asuxhvVVOfREVuE5MycI
         TPSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749464702; x=1750069502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ib7y6fFjEDkST/54mDXTljTaQEeHtKDA1Ev78ub8luM=;
        b=I4XPdiF2sDPNaP2aMosIYhrAxR8MjvsKbveWFvoSmR2RitndozjfwsTAcr7UNts8dc
         KK8s+AnLF1VDhMmI1N3n+IMxRSo6F1Mj9emNMyERd+7GRLPUvp8lOB0HGgwTOGSKd6go
         8D2IMN2wbuMGbzzZfnOrGAxZhWur9Grp3TX3BB1SCOia13ejGuopwi3ncYdp/pAtOsdm
         z13aztR6f6U9A1OhLwV3gv+wc4Ne0ngUp+KS0+RoPwZ9qNo+r7v8S114L9d9PY26FV6f
         5ufWmjS+d5hbVD7av9CrIlo+ckdp3LLPuFAHeZUMDljj7QNFo6EyeNzjfU9zJ2AnSrg2
         iKQA==
X-Forwarded-Encrypted: i=1; AJvYcCUfA/zu1eCwdmhvV1YLyihxbrT15B5zmKvWUcICFDkOhO7/dtyAjZwDhX+afvyMvUd1XRWs1s3f0+fFBCFlWhQ=@vger.kernel.org, AJvYcCXjRDyGrJ6x5WUvq13skkSwXjUGlixmCgOdHmdhpF6e9lEq4FhfwwV79C9QAkYeAhEDXP25KREDz9ELlSM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIH+1n9OPmd5SYK0n7BYOz358HApjy9URFf0yMwG2RoqRCjdE8
	GAlTyuNi8lF9evbLUO3kGgWryciS9BzTPmt/NyZttBm2pWsfBrijR2Zz
X-Gm-Gg: ASbGncu+TxhXPwTz9AHntzRz7mGBt6F9FHgLY+ChjhMtgc8QxJ31/nbJ7IvCidG5EC3
	Zr6Dc5Z6wUU1wKrU3DwvrPUheaOKeNdcW7p5YFoXbT8yGN0NJFVSmyKv+KyuAT517TMExmt6vhk
	gLJU/PpROlCvc/ML5R/+I3wFzrypW6BSYWQ4WUioDJpvj66R3A15mRcYkoZIe4lLZ/WAjBavlrm
	f8bs7r7KTwVqVOrN6ORM1H6PA/lAujSDyIORyZahFQ6mVQ4MFtEqro9Zutw4YTwK4Ic7jEhDuJ/
	urZxH0Q9yU9nl6W9QZSrNY1Vu8HSCdIJJsnmMUTIfoFrHFuo5Q5HaPn578R/KvvzVGD2HEzW75q
	urENz71JGXhv5oDQqFakBS4Nk7sIxVI3rhPRD/cA=
X-Google-Smtp-Source: AGHT+IGwWdjU6SCuj75jpQEYtVXugUp2J9ofxE+gUjDSNx5QuGsnplyztEG08/AiTNjBup26xY3NHA==
X-Received: by 2002:a05:6a00:188e:b0:742:da7c:3f28 with SMTP id d2e1a72fcca58-74827f37c17mr17182651b3a.21.1749464702469;
        Mon, 09 Jun 2025 03:25:02 -0700 (PDT)
Received: from bee.. (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0c082csm5403262b3a.121.2025.06.09.03.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 03:25:02 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: a.hindborg@kernel.org,
	alex.gaynor@gmail.com,
	ojeda@kernel.org
Cc: aliceryhl@google.com,
	anna-maria@linutronix.de,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	dakr@kernel.org,
	frederic@kernel.org,
	gary@garyguo.net,
	jstultz@google.com,
	linux-kernel@vger.kernel.org,
	lossin@kernel.org,
	lyude@redhat.com,
	rust-for-linux@vger.kernel.org,
	sboyd@kernel.org,
	tglx@linutronix.de,
	tmgross@umich.edu
Subject: [PATCH v2 1/5] rust: time: Rename Delta's methods from as_* to into_*
Date: Mon,  9 Jun 2025 19:24:14 +0900
Message-ID: <20250609102418.3345792-2-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250609102418.3345792-1-fujita.tomonori@gmail.com>
References: <20250609102418.3345792-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename Delta's methods that take self from as_* to into_* to align
with Rust naming conventions.

Using `self` is more common Rust practice for small values that can be
freely copied [1].

Clippy warns against using as_* names for trait methods that take self
as follows:

warning: methods called as_* usually take self by reference or self by mutable reference
--> ~/linux/rust/kernel/time/hrtimer.rs:421:17
|
421 |     fn as_nanos(self) -> i64;

Rename the `Delta` struct's methods from as_nanos(), as_micros_ceil(),
and as_millis() to into_nanos(), into_micros_ceil(), and
into_millis(), respectively to maintain consistency with the other
function names.

Link: https://lore.kernel.org/lkml/aD1fgizC4FPT07vt@google.com/ [1]
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/time.rs | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 9fd487276457..2a231c321afa 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -261,31 +261,31 @@ pub const fn from_secs(secs: i64) -> Self {
     /// Return `true` if the [`Delta`] spans no time.
     #[inline]
     pub fn is_zero(self) -> bool {
-        self.as_nanos() == 0
+        self.into_nanos() == 0
     }
 
     /// Return `true` if the [`Delta`] spans a negative amount of time.
     #[inline]
     pub fn is_negative(self) -> bool {
-        self.as_nanos() < 0
+        self.into_nanos() < 0
     }
 
     /// Return the number of nanoseconds in the [`Delta`].
     #[inline]
-    pub const fn as_nanos(self) -> i64 {
+    pub const fn into_nanos(self) -> i64 {
         self.nanos
     }
 
     /// Return the smallest number of microseconds greater than or equal
     /// to the value in the [`Delta`].
     #[inline]
-    pub const fn as_micros_ceil(self) -> i64 {
-        self.as_nanos().saturating_add(NSEC_PER_USEC - 1) / NSEC_PER_USEC
+    pub const fn into_micros_ceil(self) -> i64 {
+        self.into_nanos().saturating_add(NSEC_PER_USEC - 1) / NSEC_PER_USEC
     }
 
     /// Return the number of milliseconds in the [`Delta`].
     #[inline]
-    pub const fn as_millis(self) -> i64 {
-        self.as_nanos() / NSEC_PER_MSEC
+    pub const fn into_millis(self) -> i64 {
+        self.into_nanos() / NSEC_PER_MSEC
     }
 }
-- 
2.43.0

