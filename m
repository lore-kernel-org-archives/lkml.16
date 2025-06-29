Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7348E2264AA;
	Sun, 29 Jun 2025 15:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751209981; cv=none; b=FBKgTiDJnmtYlaDXAF51x55MJZEX3gTbH/LUUkGCxu10wF5ycHyatnnMvppOB24s+SwLLFF+svQXONVmklDvc1m8iN4E7nvBKkP6DZz3D9P0xtExNDhsvBPLPt1Il+UB2+sUYqalItZW3nclW8RfmrBnL74jI0Ukm6joXfFyHEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751209981; c=relaxed/simple;
	bh=DlXZJiL6zusV16+m1Mr1rdZ84u5PnvRI+6UWRyMW240=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ScnSl/rDenbLun1eUUJjn9dARuOh1XdPyPGip8MN0WK4jj/yDEbm2FvfYxIRvMBdmeun1hs/Do4MCLbeqOACJCQDFb7z0t5/86htu/c9npi0VCnkRzB+Qpvz0Eiw8s7GHMYivia7uI0kM0gWnqfEl/02/DTXupLnwq07xMgExf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nITR9e32; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nITR9e32"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-23649faf69fso8843295ad.0;
        Sun, 29 Jun 2025 08:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751209979; x=1751814779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zkw9DYUzhRXrslTyMDKuQWc5dd1qenhTI5GZLPFDxQA=;
        b=nITR9e32beIjNcbHuI6ALpiNmDtPL+MI/q+d+jtAkk+tuPIlXYs7fqe0x/+bwqm492
         Xlyak0pbFafUi3OpqgFH/OP4dBMLqQHgbR9TllHNL271XEhFexArx/WOSQbGUvJWiakh
         U3xFSa3OiFeOH8fvafp8kdmtwE28kCyWnVo3cjof2bBhpzevVuozbOAQvKj6js8y6L4U
         AMUcGDYKCJy5zJBi78RH+4hs7EUbMc3YGzCJ8r9WzsecTiPq1W3E73c3068CtQ4VUDoz
         JzXPf9i9hkl7e3J7Z0F7dKKWg4+wGN/Jd7gy6U53j01ginKDqH3dm5PF+JbDKotAx43b
         0HRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751209979; x=1751814779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zkw9DYUzhRXrslTyMDKuQWc5dd1qenhTI5GZLPFDxQA=;
        b=L6SDaeumMwv+L8VlLrpNeU6dY/2IzqCxvtz9ZNKCR+SeT2kJtD9X1Ku9bRhzOdn2tY
         U3Od2D24Bc8NPophUskpEjnQJ8qVX/4kY3EA0+J8vAOg2OQgV22LxJBELZBrLZktK3bL
         ELyYchwO4L94PxuyUlRKR6cy0Y1lmtvO74dvP+Ra5hGWJZSwTB1d8hF2senOoyQrQtLB
         mNNk7dCAOlfFjLWMEiWANeD9D0HXUVbGhX08eQuzgiRpaL8XaVZeTftghimtLFrDTgOJ
         hTVY6yPCP03xYYO7bvBxdA7mfjBQC+b1hEs4ZAUe8tgSSldiD809pI26c5xD8XmzAE/S
         2RvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXksKw1MpPe2fUDbLyX7EW9CzTBjUwoq0oNeGb8oKS0FfTZy6WJ/cq8/dWX9KPOYWcLld0dpGzFOlfa7KU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGELoOxtvo64neya4jPfk+qtcWXTDOMLyy7xeie5MkR7SOgp3P
	at9gTxMcDLf+l67IZiqAxEthFn7JtkKrHFHryHLZBgtTft/6JhrT5ZNbmzmLm3qNEmg=
X-Gm-Gg: ASbGncvE0aml8h1m3sxo8octL09Heer8qwPMXs5EonqebULZjP5L9R7JrQgHDRri5Ba
	ylBTgTm6HXBc9X1wHHu74p1KYSW95KQ12yHXPWs/ms9sl37hntmuUSYM3GXDh5piAfBen1IrC6V
	0C0prTChEl89AB+Xo/OBeKQL7FFVRasTpYn9sraMDu2xAShfIZNEyRY/Q4n2ROLm3Nd4LyisgSN
	D6eAfAplUQiEWVes3mcKS5N0F+2nerjF8Z525Irx5YDsnQbJkTJDIaIAg9dgu2gZk4wKPNx5zC9
	JTH8eC05A31nmSz7N96M1vzP51B/19EVt9dxIT6VZiPm1pHdGKCU2R19IQJq/Lh0QMIuOapXXUC
	Oy8ajQMYAPi28
X-Google-Smtp-Source: AGHT+IF1A90KTnpYNA4i7uLkMlCS4CRj5KwfbtaFfgw+jBKmXEG450Q0SAx/BQLRuJEmt1dhQ/BnLg==
X-Received: by 2002:a17:902:d2c2:b0:237:ec18:ead7 with SMTP id d9443c01a7336-23ac4633b87mr174188385ad.24.1751209979246;
        Sun, 29 Jun 2025 08:12:59 -0700 (PDT)
Received: from localhost.localdomain ([2409:40d0:13a3:7a93:1d81:fc79:cbf8:87bb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2e1a3bsm62828065ad.30.2025.06.29.08.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 08:12:58 -0700 (PDT)
From: krikera <prafulrai522@gmail.com>
To: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	krikera <prafulrai522@gmail.com>
Subject: [PATCH] rust: helpers: sort includes alphabetically
Date: Sun, 29 Jun 2025 20:40:28 +0530
Message-ID: <20250629151028.969-1-prafulrai522@gmail.com>
X-Mailer: git-send-email 2.41.0.windows.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The helper includes should be sorted alphabetically as indicated by the
comment at the top of the file, but they were not. Sort them properly.

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Link: https://github.com/Rust-for-Linux/linux/issues/1174
Signed-off-by: krikera <prafulrai522@gmail.com>
---
 rust/helpers/helpers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index b15b3cddad4e..d3867d09e356 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -29,9 +29,9 @@
 #include "mm.c"
 #include "mutex.c"
 #include "page.c"
-#include "platform.c"
 #include "pci.c"
 #include "pid_namespace.c"
+#include "platform.c"
 #include "rbtree.c"
 #include "rcu.c"
 #include "refcount.c"
-- 
2.41.0.windows.3

