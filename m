Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F1142A8F;
	Mon,  2 Jun 2025 16:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748883080; cv=none; b=nkGwbLdYTeRtLcy5+l065X4aLC/kjKV2LylewCkzBSAEVLdVRh+indYxeMIxOzlaVCiCz8Z+4gwQjRLDlRLgWFTrMYszuHSaNQZzHszSLckfCCn97lZwDs3VEx05ik2LRQsxIfOs3KmZ9l4rPbSBLj8QOJHC/Y9tkb8G7iLEQaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748883080; c=relaxed/simple;
	bh=jF8MGhpz7zikQzscsV25gQYi1FEI7qgJxpnsycTcP/o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NROfQ4VrI2WRxBqoDr8Joa8vudQF8B+xqMCvfL2vksJZUmkKBA19lb9AAei/rM/e67e2ngi50uYg6GaSnDoWXQtFrDvgCgjIPC01+oHLuNpz9B5909+DwDFYGuPi2ZnK+OkSyAgbrBn0iYv6tKqmWUGwh2XwQQSruomDuoiXM+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NeMS0meT; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NeMS0meT"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-23211e62204so35819675ad.3;
        Mon, 02 Jun 2025 09:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748883076; x=1749487876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cPtKhhT5aSL0hsmEufH2lmmZQafAkmejjgAELqic0no=;
        b=NeMS0meTzcaBVx84M1BjcQM/S5b+wOI2wxmRVF0qSrII1w3K1NKw0P7iwkXM80Jo0T
         rARyo1ZzRAMN5ez4kjZ/N8vY6dxJiUkLWuq6qc/1aO5z3awgTlxBnfYS+i8eYA7Rug2K
         PqE2EQx+8pnBfhLDPw8Sq4acrJ4ZXKcPwljyZ9By8toTrNIhi53aG4mR2mJYeZcwF/Jf
         PipoUmXqBfGGGdIt1zp/jI+FHNhUTN2TXNCQfqdWysnbc6+IZGsUbT9qVfWMpJDRd+DE
         NiMkEtuaEOMmpCzFkqHed2bFG9YjvJkyvWDcuheLKNBg2g/J+5sd3PyAZ95VjlX9oQlC
         KGsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748883076; x=1749487876;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cPtKhhT5aSL0hsmEufH2lmmZQafAkmejjgAELqic0no=;
        b=bZb8sNAXN2yhdJDB7vLgIjR8GoMuOZHCa3NEVAK1TC80RipR+p6DvgIIWsLe4TKlJn
         51W5P9RBmjBoc1oXiRNh7/qAdTisl635jq1XapUqichQa1+33GygmloHv9oT1SIaOL7H
         QCQ3BwgX2O7wlmXQs/C0PEKhL7uKsy7r+pTGzog/NbKr1pDEUN4ZuX349UCsWQkmAxT1
         MdS9u2OvHVV7NAZplqXGo5IS0woKhVJz62fo6moUvXG5ii7tEQNiiVBmpFzSmhyYgEtB
         +q4IiQhGH1LmAr+vhKlwgxaoLjAh5rtkKECD4l1jzClnjN/jHEliwJKh8C9uJDbn9ELT
         8nBg==
X-Gm-Message-State: AOJu0YzJRcF9KVfcGaQkN6vAYNcMLCPaAVN1Y8hUHKgCB0l2n1xzRkNH
	0WiFGP7opbj+SbOpriUxYVfhfFStHyOWsQ5qhJJSrhuFK99ryXvIrf6bKD1wzlhr1dbH/g==
X-Gm-Gg: ASbGncuckMVBuVxi3WtRo4bqGEDUs+ayvvXf9DFQaO9PedL+NJVhJ2voaI1WHcyQEql
	Ixf4OTu+k6GFyl38C6EuBubWFWu5xMDnG3fO3DLjf+2Hm6bP9uFMfOoL/ph3L9OBTQKPaD6VLZR
	4jGcS8y250Utz91uL10am7a8wRQfJJ8pLmwXEvMcq+Xc4LTtMBjEh5RlA5ieGoUeE2SIf98usIv
	hKVV6uAl7SL2s7Tx2LqmLtyvfJ9AL8oS78LH77IGqCY3MwUwPbShn24NW+aIBg3zGMOqKOfgIlt
	sCKcB+o6b1zID+gcpkfRMCYW+/rE2mDruyPksP6HmA==
X-Google-Smtp-Source: AGHT+IHPJWk6al4M1VwNr0bYwHE2LdhMYhtJjyrU7mfnhIPB9cVAan28lH4oqZFGAT7m36MClwxGOw==
X-Received: by 2002:a17:902:f64d:b0:234:d679:72e3 with SMTP id d9443c01a7336-23529906ec0mr191058195ad.42.1748883076550;
        Mon, 02 Jun 2025 09:51:16 -0700 (PDT)
Received: from localhost.localdomain ([2409:40f2:11ab:2cf2:10cd:85bd:e95:5230])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cf5249sm72859615ad.192.2025.06.02.09.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 09:51:15 -0700 (PDT)
From: Sai Vishnu M <saivishnu725@gmail.com>
X-Google-Original-From: Sai Vishnu M
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
Subject: [PATCH v4] rust: doc: Clean up formatting in io.rs
Date: Mon,  2 Jun 2025 22:19:24 +0530
Message-ID: <20250602164923.48893-2-saivishnu725@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sai Vishnu M <saivishnu725@gmail.com>

Removed reference to internal variables in the comment of `IoMem`
This avoids using private variable names in public documentation.

Reported-by: Miguel Ojeda <ojeda@kernel.org>
Closes:  https://github.com/Rust-for-Linux/linux/issues/1167
Signed-off-by: Sai Vishnu M <saivishnu725@gmail.com>
---
v1: Used backticks instead of `@` for parameters
link: https://lore.kernel.org/rust-for-linux/20250530123129.31505-2-saivishnu725@gmail.com/
v2: removed reference to the variable entirely.
link: https://lore.kernel.org/rust-for-linux/20250601164939.5306-2-saivishnu725@gmail.com/
v3: Moved chanelog to commit message. Used the proper parent commit.
link: https://lore.kernel.org/rust-for-linux/20250602083119.17752-2-saivishnu725@gmail.com/
v4: Fixed the patch format with the same commit changes
---
 rust/kernel/io.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index 72d80a6f131e..41404c1e17b3 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -43,7 +43,7 @@ pub fn maxsize(&self) -> usize {
     }
 }
 
-/// IO-mapped memory, starting at the base address @addr and spanning @maxlen bytes.
+/// IO-mapped memory region.
 ///
 /// The creator (usually a subsystem / bus such as PCI) is responsible for creating the
 /// mapping, performing an additional region request etc.

base-commit: 7a17bbc1d952057898cb0739e60665908fbb8c72
-- 
2.49.0

