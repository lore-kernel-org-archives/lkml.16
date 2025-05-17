Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9990410E0;
	Sat, 17 May 2025 00:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747441593; cv=none; b=SGKXU1A490te81LudjO3Ge7Lc8/YFt+A4Pbk4fIUh4ZlHHhYSkcUJCnEbafXAuszT084S42EluxMKtWWxne6RPAZ6FvsMPzOy5Sq/ENCReDykmY6maTvfPP0SVa8qlGN+o0Rjf5ZJBlkiVvdygeKTwVHjRAMDBZJgwqY5pepDSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747441593; c=relaxed/simple;
	bh=zlrbIwAQ5POYVrxJfi7s5KGoorg3woWKF0a4UQh93SA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GREm9z5jzBwTQBfg3nStmDTHV/pYgLQ26D/iVNNxza/xVsPSl5aY4S5WKUR5YpdCi/SwS/jq6re3xaJNeyRt4N5Bwij9ZLq3YmZjOqBgGpaZpF4+dz3HaxfE3OxCp4cehubN1N89JgE7tQzhjbptKyYWi3OfA9/siHf9+hmokM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RjKazlNM; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RjKazlNM"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6f89980f659so30174906d6.3;
        Fri, 16 May 2025 17:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747441590; x=1748046390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bkeSuzOefGtKsCiZB8NRqe5D9W7igkX7GFlxpgW3Auk=;
        b=RjKazlNM5hQE8pGTfv8zDkzfBO3vxs5b3nh/Wwi324ULDjXR9j3wVjXMVslCwjCJ0T
         apOhwVMHRPfBO0fEREamHkMbMT+TFegByaqbgQkqF7FaW4QbbGeDlYRDOi2uzg8TNKUU
         KBl2M9Gecf0yVR1hLoc3r0BD4xyrJGPWG9UIjFLm5WnaF8ZZS+nRuPx/FKioLP3q7rp3
         4nRMrTsbgNu4ivrv3Hdj//i0z9vAwdyKJ2NpfOdeorMGN3DXkX9C6T3QSp1a2ZHe7LnL
         YgKm42FwtIEU3FvzwksQ47l2/cZDe8nEdVu8jKLivbjgjyleJJmlh76Pu9kJe+S2FB5U
         L7Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747441590; x=1748046390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bkeSuzOefGtKsCiZB8NRqe5D9W7igkX7GFlxpgW3Auk=;
        b=BK8HPmKFzxIVY0ZtSM3mR2909WeGLYws4mH2/vCK6X9jgkbGqay7GWedZirMCqw6dm
         uWGczPcSoQ2XurZuuqfAcBS0fEADJ7/ZzoQD9dWLe1vi61trJKc0RSuGXE7O3zGZLAa2
         GDRZRRjDbx5jF+vNfD63T7vmfh4z0LbvJgfy1cAcpzS3N6rpZTMjSZAVUOWADa+CkVno
         KOLXaiSD6VghkOpdRDQWtoDDLLzyPmbk7mB8QhLITQi5nT7gTXSRNLc/OKs2a0HQNB7C
         u3IzAPyc7pmLGUAXnZPW42CZy7frB4g61Y5u5tiad7SX92004H607XBDM1uFwMZkm8Wl
         LYEA==
X-Forwarded-Encrypted: i=1; AJvYcCUgkAAM8OsnP5djNUJDPJitfTFhphhu3uk/jxStlhFJGhIwNd4U9nje5POrpKU0N2FVzoerJdPbvi71pZ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwN+AfWMfMfzcVovHL2gPvgZIrM+e8CIkkfsG8buUp6b/y8wuCj
	mfltocJ6/xt+jbw42+C28d/CTHVYI+I+JB6Jb110sxKUtWLBzL3Oe8U=
X-Gm-Gg: ASbGncufYiYxuXys8v/q3oby3Ns5RkU88p4f5nG+SxRhB5H5zd29BLbLuh6HplIjoD6
	wRz9dVOM85G0ikD6FchctYI8Rby27t41z5afSLLYs5jCreNc5AKnUJ+Rl7dwXjVCt0jml2WxJrL
	qWB7DCbEpHd8Sym30hIo83pUZNnKDuyP5/yfWhlRV/WxNc95duamqgrSxnFvXJLPH7MutosgbGQ
	s5nRGa7VWl7AxR6icr+jFOz6KgwcQwID47PMSnvNPHymOhMetB4B9x8UpSgJOapW8Ezjsk0kB/N
	hOIvBYwcBwNMW+ronKQylkL8onk/HOnFFNOT8auOaGemwnINgyaxNWz/0KdMRkc16q30WZaDmv5
	R
X-Google-Smtp-Source: AGHT+IFZX32EhiUVhM9GlmidKs9HUmMOL7d4GicxhiyOfX1cbT/pni4hoGzriuCztbCNheL5RyPY7w==
X-Received: by 2002:ad4:5e8f:0:b0:6d8:a8e1:b57b with SMTP id 6a1803df08f44-6f8b0873ba6mr98217166d6.36.1747441590299;
        Fri, 16 May 2025 17:26:30 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:e487:224f:4011:50ae:ea20:4b60:8f04])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b08be133sm18344776d6.53.2025.05.16.17.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 17:26:29 -0700 (PDT)
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
To: skhan@linuxfoundation.org,
	alex.gaynor@gmail.com,
	ojeda@kernel.org,
	boqun.feng@gmail.com
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	jihed.chaibi.dev@gmail.com
Subject: [PATCH] docs: fix typo in rust/kernel/str.rs
Date: Sat, 17 May 2025 02:26:04 +0200
Message-Id: <20250517002604.603223-1-jihed.chaibi.dev@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixing a minor grammar error ("then" to "than") in rust/kernel/str.rs

Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>

---
 rust/kernel/str.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index fb61ce81e..42f355f74 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -752,7 +752,7 @@ pub(crate) unsafe fn from_ptrs(pos: *mut u8, end: *mut u8) -> Self {
     /// for the lifetime of the returned [`RawFormatter`].
     pub(crate) unsafe fn from_buffer(buf: *mut u8, len: usize) -> Self {
         let pos = buf as usize;
-        // INVARIANT: We ensure that `end` is never less then `buf`, and the safety requirements
+        // INVARIANT: We ensure that `end` is never less than `buf`, and the safety requirements
         // guarantees that the memory region is valid for writes.
         Self {
             pos,
-- 
2.39.5

