Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101B32DCC00;
	Sun,  1 Jun 2025 16:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748796726; cv=none; b=sja6l/aOsmjqADcewC6tf4W0ck/p9XsW6PorRb97fi9JeIv1t+wmyctfrKimhgQUfur5EvL+TK0Rg6lg6Nse6IjklpQmOgGYFJBWZxijidRxdWw96g7VLwwjMjnE9KXWApH/PlJGggLD924v+J0Z7pIV7CHTFof4KaMlLbE9CMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748796726; c=relaxed/simple;
	bh=UbnRKOIb8R4X34xidCbuV+vQdzZLrArWOaKM9rS04wg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P2zjg7PJRncxwGyOFbg/ymmmtD/CUJ4x806+7G9YMerxOeGlT364d6JsVmDHCMfErH3a4uX5FCSbh/1yUDdVnonE/5SmXwM1/mzC/EK5opCodPnYgAfsACfhXEAXkiWGMCZZzpSFOapXzKcKREjBvB6rAJMnxS9RQqc4OAQ62eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lddbf6S/; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lddbf6S/"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22e331215dbso32853235ad.1;
        Sun, 01 Jun 2025 09:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748796724; x=1749401524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wbak7H6pr/6hIm/LiGFHyNHZ2+qK0IK8bgGbAXQNjAg=;
        b=Lddbf6S/rftdxN2gMKP0SSeldZMBQwz0v5uTXL6VujaYdKccWN803zvWMlGGpwzB63
         wEjrqxvejgvha9msj7NlGKj14AkKKvwpkYNfMb7SZfasb3meMbKdtU4QD7xk+ldInvxc
         31JsoAjD4J8UDWroNC6lCy2acMdCUjIiMHrzbh0CQnH7O1JWIir8kJC6CZSAGPKwmbVF
         VSkYdMi68uvdzeLFglvejI8aGSW+yHRpsca/dfqxMFeRwpqsn+uX9ifAT7Tvz/SUz1Fl
         glTvaIti3XP2pJTjcf1X41oQfkfITJtaUfmzDKDs6AKk4K1AGQjvgvEH1SAMVCBQqIfj
         YRcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748796724; x=1749401524;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wbak7H6pr/6hIm/LiGFHyNHZ2+qK0IK8bgGbAXQNjAg=;
        b=i9onbAjyVSCYpJWIze4/Da/ab8OkYLxGBOyeTY2IrgKrQwtMqjx+TEUJ2rSU6X/JES
         kqeoP3WRa6qhsxn/IqaK9jSI7fpZ+eolgU0JQ2AHqXjAZcVYVYGLXEJ9AA5k55VM7pgK
         0mR3J5IuSX3FhgqUUUajtmZOjNwwFeFwws1odHNj2/chcQRmuANdxE21ZNDgBf8Vq8j8
         FA7BU4Fa2YSfLWWQccELfl/XQ0w8riTrkXoNfzFeWiiCvfq6mHpBPJfhjPl6pQzFks50
         1bqO0vzLDhj/52R8DuEBgjSS16HHQix1c79Bkq7fUyW8mr29yuIW30YEP9O7S1/PKbid
         64VQ==
X-Gm-Message-State: AOJu0Yx2lS+r7DGYRo2FboEm2Y6rsSWmciAYp6MiCrxNnHLVmRSyq3zS
	AVG1c8U5Wrti7QJ3aUiyPKhRi4ANvuMbXCIO0f8h5G80GKy2jDcrcHjLPjuULKjy5AzmV/7A
X-Gm-Gg: ASbGncvj3q3JFkm0OeM4frYkKugbsHGiN/we4xWNybLhXQGTp3rzrhRtgJPTIjx4Dwe
	IQnoQNgHWuARYUWmv7rs865iXEIgEWjt1O4LLSVRJ5rLItzuEok40mv8hxRgjNIIeJnr+M5I6gP
	8CL+1wZXdzjyLBNe/zW84y1nHoR5NufgIBi9KpqmxFuBMTFR5ncc1xT5WimrEzyP5prh+SZ28D7
	vtvFjel/5xItF9hNlCTZmW+6PTMqGriADcg+AUlsDH1SwpLRqMxI9sjNohaGYzBG90Lif3A/D0m
	THVZKP46v1XhqKn5vCwbvUd1kjFpO7ET3gNOLKecb+t+JfI345A29Q+xdWNPWAlP4jUv3Ps=
X-Google-Smtp-Source: AGHT+IGeDJjrbwzyS1Wg772RHmi9rPI6nbhOAVh2yaUOVAlwrPukrsS4oGt1w0FBAXCeHYoCM5v5CA==
X-Received: by 2002:a17:902:f650:b0:215:a303:24e9 with SMTP id d9443c01a7336-2352af0b242mr166372125ad.3.1748796724045;
        Sun, 01 Jun 2025 09:52:04 -0700 (PDT)
Received: from localhost.localdomain ([2409:40f2:11ab:2cf2:10cd:85bd:e95:5230])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bd92f8sm57211115ad.88.2025.06.01.09.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 09:52:03 -0700 (PDT)
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
Subject: [PATCH v2] rust: doc: Clean up formatting in io.rs
Date: Sun,  1 Jun 2025 22:19:40 +0530
Message-ID: <20250601164939.5306-2-saivishnu725@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sai Vishnu M <saivishnu725@gmail.com>

Reported-by: Miguel Ojeda <ojeda@kernel.org>
Closes: https://github.com/Rust-for-Linux/linux/issues/1167
Signed-off-by: Sai Vishnu M <saivishnu725@gmail.com>
---
 rust/kernel/io.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index 92bc4e3cd8ec..41404c1e17b3 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -43,7 +43,7 @@ pub fn maxsize(&self) -> usize {
     }
 }
 
-/// IO-mapped memory, starting at the base address `addr` and spanning `maxlen` bytes.
+/// IO-mapped memory region.
 ///
 /// The creator (usually a subsystem / bus such as PCI) is responsible for creating the
 /// mapping, performing an additional region request etc.
-- 

v1: Edit the doc comment for `IoMem` to remove the usage of
`@` for parameters and replace them with backticks.
Link to v1: https://lkml.org/lkml/2025/5/30/550
v2: Removed reference to internal variables altogether.

Thanks!

2.49.0

