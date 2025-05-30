Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D225A221578;
	Fri, 30 May 2025 12:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748608318; cv=none; b=IqVw3023yTp7SCbYivhzDJeBWeSNtv2YAyhHPi7MkZxhfNxLcQZEl/KOArAbscOacu+u9gSKFLlviJX0ZgVtEGmT+D90vvLNWfREaXAkW5QdMd2s5FJlbvacrp5WDQO0przwzU/yx3NsVZGSCpkGwXoNquYzCtvGQbvtNwqFJwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748608318; c=relaxed/simple;
	bh=sO2wcKkTWn8Ruc6WilodzmUuspP187dLfFR4PRbI7N8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DwmUp8BXhhpKIUonrodzMs/NnnmURfAs3Kb6W2gHYhejA/HSoQpLMpoyJ8zH8BRoD0DetTH5a28M217nmrjmm9WU7zFOyjhqT/QNHxzONVtMpOCLa6j86H39XxfN667APxC0u2zF8Es/dIYDgP+H0FxKJ9PxFbnqPjZXJ5w+Nks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iHt4FG4l; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iHt4FG4l"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-234b9dfb842so18742185ad.1;
        Fri, 30 May 2025 05:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748608316; x=1749213116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=72KHt82ImNQl2pBGkQFZ11eayYSJEhzYqZXSpD4WT/4=;
        b=iHt4FG4lr02lXD4J52bEz5Pr64NrQVze6hl62bF7Tqjsub2iT12c1pw/gjazsZOzM2
         k/Myh177oLkPVgRd6VlRWoaiec/GHqfBoKbkfST1rXmA0+CJF7rpdd4JUvWnJLcvUDLh
         GjeE8bWLF31a0CuwZah8wgGr9X9nk3fqkOC6t4kXEzApPMvNnV5kXn3B093hiAaBHxkC
         SErUh/2vLhKML4OWk8k6DehsRHZeaJ17cRUO/bfdWX4ayFe85E7VjnESMuQZP65lnBTV
         JWNXTyzZXIuPCXkKYTiuzXuNrVk0KfLHe/W37Fz0Rw7fVev9ZH5oY/O2FeGUv7A5DOrl
         /KRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748608316; x=1749213116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=72KHt82ImNQl2pBGkQFZ11eayYSJEhzYqZXSpD4WT/4=;
        b=ohT4+LVPeWT2JJWDHCNtCWth1rbPapc/Oc/myam30XFNz8N+AQzIfUAHjz1dXlnLLI
         0fBov8BNXC1svx/Gm/i6cBSCmuPyLmxW/aEmgvvW8vC9p5guuYmEglI/tC6GddQmaJ0y
         MF+w2UuWdH4Jivs0I+6HYbUFN7n5rrvECnpJ2VpvuRU1G9ipWCyn1INrTGWkEuRCYDIC
         90LZP33A7XE2P5R6F2h5fXZWmqMkIRmh/S1PZ572AAdMYQjkVUd2xAodcTE+blBCukTt
         ylll6sMPN+j0h7q8VrpS2dMhAmIZkD8xdtQ9TD2XXRECoAbzlBbW6KbEnXXu+hODSGRi
         UI8w==
X-Gm-Message-State: AOJu0Ywy8kDA8j1KTKKcfeSf8TAph5BwJ8Gz4r2AN9D9qye2QpFiVXP9
	AkoObp6AQaOYeqia8luHXiAo41v1GmKTHI9Z5/L4StM2vSVwc6Of1ZJv26o67wkg1quoIQ==
X-Gm-Gg: ASbGnctYbsfrwCIx4PPkg72C5/r5AZKodz0lpc7PY2lUNYsXhsHo62CRsN6gxe4Jall
	V3vR15lNgmqPFVjSbpEuqAUCAYyVCmC2+fzELUUeJccnfsPnaTksTJaBz8T6XeXBZ3cyD4vJTyN
	FX3W4teddeer4w/wQGuPJbtVC1IGMyhoAF/VL4N0p/EsclY09JnHhYXSEQsoKPzwuOGp9pBvkP8
	jivyw1PN1qpI7PIc98rk1g5g1SJYYwaCUrgc4ezybap8jtarvKzDJYtWV0r6FaMtyA57b1R4i7Q
	qAhbj21HBIiKpnZdBoAAJUL+zrkYigjzH8VFoex9fjxD6QDMMxuWnYeXZkfNxDDGxLfaoE+a
X-Google-Smtp-Source: AGHT+IEE5bejLJGWszuWSHkoZrP0G/Du5/ykQa29oGeJG3sxkmqpBQToVj6aYENw5V1jpLJ9egj4IQ==
X-Received: by 2002:a17:902:f551:b0:235:737:7ba with SMTP id d9443c01a7336-23529a07743mr52983835ad.44.1748608315740;
        Fri, 30 May 2025 05:31:55 -0700 (PDT)
Received: from localhost.localdomain ([2409:40f2:216d:d0ee:67f1:e9e1:1106:f1b4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506d21df0sm27477595ad.229.2025.05.30.05.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 05:31:55 -0700 (PDT)
From: saivishnu725@gmail.com
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	gregkh@linuxfoundation.org,
	daniel.almeida@collabora.com,
	me@kloenk.dev,
	Sai Vishnu M <saivishnu725@gmail.com>
Subject: [PATCH] rust: doc: Clean up formatting in io.rs
Date: Fri, 30 May 2025 18:01:30 +0530
Message-ID: <20250530123129.31505-2-saivishnu725@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sai Vishnu M <saivishnu725@gmail.com>

Replace `@` with backticks in a comment of `io.rs` to follow Rust doc
convention

Reported-by: Miguel Ojeda <ojeda@kernel.org>
Closes: https://github.com/Rust-for-Linux/linux/issues/1167
Signed-off-by: Sai Vishnu M <saivishnu725@gmail.com>
---
 rust/kernel/io.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index 72d80a6f131e..92bc4e3cd8ec 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -43,7 +43,7 @@ pub fn maxsize(&self) -> usize {
     }
 }
 
-/// IO-mapped memory, starting at the base address @addr and spanning @maxlen bytes.
+/// IO-mapped memory, starting at the base address `addr` and spanning `maxlen` bytes.
 ///
 /// The creator (usually a subsystem / bus such as PCI) is responsible for creating the
 /// mapping, performing an additional region request etc.
-- 
2.49.0

