Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1493770B
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 11:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744890480; cv=none; b=iOHERy5Z1j4Bs5jHNahNdomJyI8ptLFW/t+WAA8JaihME57CIb0z2MgKt6oG6ak63Y6ojjAVkRW7JyNXZSh7dgR1t4Etc5kA/FXY9cc3ReST3VGsHotZC+QsnhToRq7/CvnRgMB9EruhwhHN1tXFys3RHOn6mBlvSpJTM6fdpkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744890480; c=relaxed/simple;
	bh=IVSEZHCR3YCCMEj6l/Y6XHlxfk8ScsTvVa4v7eQ6RUM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=J3Y70gQJbE0cRPsDDBK+6YnPHrm6DUH4zV8oWr8+LccIIIVdzKlpt7gWIvOGVzSz5wp0FX1Qfo/n2ttL7iEaMojJijibb/q8JYoGj3E3aHjMsgss1qcK+W/Dg0XKiWMiCY9fVdTMv72++tZW/46rIqhNCw5QpkZca14pbwrYQ2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--korneld.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nj1CCw8m; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--korneld.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nj1CCw8m"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43f405810b4so3559225e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 04:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744890477; x=1745495277; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jBLAAxkl3M2aD0Ln4e9Wk86NcYIdK4eZVXhB9EcxpTc=;
        b=nj1CCw8mTmZYux0eZPQ8T6lTPE2J0//iK23TpSxqj0InbPf0Dl2v0PWw2+KamBbU8W
         LPMwkrmLBKG4j2GGvL15fXrQM3hirpVf4qo6JkmU63QVDlBLHdO1msPHvokrAMGT+Orc
         tvc1b+TSeta431OnKWvT6ZWS1gNkt53VjlZbM6WTkYSdZCf00LK2Ede55ByLOsQHGeeU
         CUBBU2iF4/ivY0cVKduDEvpXs7vMA0F6lviS0yaA28dImaLWCO0iGqPJm3EhpWp3xI/P
         ZVVapmDSXONvnqD8GfuFEO+bjM5fet7pE/Kix7p8hgurNlMeh4cT4dMWlP+82wXiC2Bg
         2OgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744890477; x=1745495277;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jBLAAxkl3M2aD0Ln4e9Wk86NcYIdK4eZVXhB9EcxpTc=;
        b=GAs07oHasZx3J/uX1hLgHdQCyfGVKHTzV2P/GIZHXiXOx6iO/W8fGoRWWSwVHctWac
         OR3q65FVYRmGA2gKCN9MxFIDcpKuU51iNljxJvav7isWX6jk/0GePQP5wFVf6xTfToFL
         H00b5bGz1uel+mJiiXEMybdZljfa2F3VajlyyBptcPN1h47TQQ3QyxWiT5ph+f1Ix7YX
         WItfAw+BjgjkITCvG2OQUA9sRKyBGjEjxHtzMV35Wu1UNPsRVb9sGTKKrs9oxMI60J+x
         F1VB5qeaBwMYSkKZYofvlsGuw2G+IdAXdDanCHjQPvCPZCREMVmwEXek1LAORz92s1hJ
         kZkw==
X-Forwarded-Encrypted: i=1; AJvYcCWfNNr1mwRMbZsttnEbB14Kr2W7ZSILfxNH2Pqy9xRdQLvvdBiMp2rPCnWiD62d9YlBMFrDncafWWut2qE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLcOqMKD4OnsAiUK5A1KVYCm27I/TY4v0FaafBLnxwecjHXsD3
	zQpxGo06JgjyloJ4kDwdmt2scUQZCTOiHFwd8RD0t4HJ1FeIkbJ+Cg5yonhQJNS6WoHoGRzcsXb
	3P8ghOA==
X-Google-Smtp-Source: AGHT+IFZGyRsQ1aryQORA6PQNqcCYWM5zes7gMTdLse4vLdGH5dbRsoTTB772/BYDikDEgjkczNaL1s7l2UQ
X-Received: from wmsp25.prod.google.com ([2002:a05:600c:1d99:b0:43d:41bf:5b62])
 (user=korneld job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:c0e:b0:440:54ef:dfdc
 with SMTP id 5b1f17b1804b1-4405d616849mr57468115e9.8.1744890477189; Thu, 17
 Apr 2025 04:47:57 -0700 (PDT)
Date: Thu, 17 Apr 2025 11:47:54 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.777.g153de2bbd5-goog
Message-ID: <20250417114754.3238273-1-korneld@google.com>
Subject: [PATCH v2] arm64: Support ARM64_VA_BITS=52 when setting ARCH_MMAP_RND_BITS_MAX
From: "=?UTF-8?q?Kornel=20Dul=C4=99ba?=" <korneld@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Steve Capper <steve.capper@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, ssradjacoumar@google.com, 
	chromeos-krk-upstreaming@google.com, 
	"=?UTF-8?q?Kornel=20Dul=C4=99ba?=" <korneld@google.com>, Anshuman Khandual <anshuman.khandual@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

When the 52-bit virtual addressing was introduced the select like
ARCH_MMAP_RND_BITS_MAX logic was never updated to account for it.
Because of that the rnd max bits knob is set to the default value of 18
when ARM64_VA_BITS=3D52.
Fix this by setting ARCH_MMAP_RND_BITS_MAX to the same value that would
be used if 48-bit addressing was used. Higher values can't used here
because 52-bit addressing is used only if the caller provides a hint to
mmap, with a fallback to 48-bit. The knob in question is an upper bound
for what the user can set in /proc/sys/vm/mmap_rnd_bits, which in turn
is used to determine how many random bits can be inserted into the base
address used for mmap allocations. Since 48-bit allocations are legal
with ARM64_VA_BITS=3D52, we need to make sure that the base address is
small enough to facilitate this.

Fixes: b6d00d47e81a ("arm64: mm: Introduce 52-bit Kernel VAs")
Signed-off-by: Kornel Dul=C4=99ba <korneld@google.com>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
---

v2:
- Update commit message to explain why we need to set the same value as
  in the 48-bit case.

 arch/arm64/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index a182295e6f08..6527d0d5656a 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -333,9 +333,9 @@ config ARCH_MMAP_RND_BITS_MAX
 	default 24 if ARM64_VA_BITS=3D39
 	default 27 if ARM64_VA_BITS=3D42
 	default 30 if ARM64_VA_BITS=3D47
-	default 29 if ARM64_VA_BITS=3D48 && ARM64_64K_PAGES
-	default 31 if ARM64_VA_BITS=3D48 && ARM64_16K_PAGES
-	default 33 if ARM64_VA_BITS=3D48
+	default 29 if (ARM64_VA_BITS=3D48 || ARM64_VA_BITS=3D52) && ARM64_64K_PAG=
ES
+	default 31 if (ARM64_VA_BITS=3D48 || ARM64_VA_BITS=3D52) && ARM64_16K_PAG=
ES
+	default 33 if (ARM64_VA_BITS=3D48 || ARM64_VA_BITS=3D52)
 	default 14 if ARM64_64K_PAGES
 	default 16 if ARM64_16K_PAGES
 	default 18
--=20
2.49.0.777.g153de2bbd5-goog

