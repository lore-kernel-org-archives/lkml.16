Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0229B1FDA
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 09:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750067601; cv=none; b=u1zoI32dbK854ksrmx1SFWw+HNnJVGRZU5PDOZis9n/ZTtP/T4DfPEM+Dg2cvNKBlzMI1eIrz8XLVI3Jh1x3TQCOo9ODJsSSxADR5Zp17/ezVRVLJbi2GKds2YdgJIjICjb7xPhiNxHA5buBaOS5tbwFBgyfHxH7EX4n3Fnv7CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750067601; c=relaxed/simple;
	bh=2V4h9aHUxiP/JgkmD0h3V/tVQXQbROT4jEcTXes/cOA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kMHeBd6OemTx2nsGBm2PmYl10jzvI1iFtUx35ng5mXJMJWZnjOzxx9EFnLmZF/KGNuO92zeC9DfWsK3rv9O7zWqRZPIDnsTXRnd0U/44cG3v3XKplOX9a/AVsQ9PpWS8t5yoNwYFLwcmaWgfipWfr34tw2bbxXG6HMs152xXn74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kCej33HU; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kCej33HU"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a50fc7ac4dso2479999f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 02:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750067598; x=1750672398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dQhQRM3glVKEvyolY2kzbg63jz/t5M45p5rnwrjEPRU=;
        b=kCej33HUgGAk3RMoe+fCwVXHO5GC7C8a9n6WzLZzszUBP7pEGi6KRZ3iJY9KimOOfC
         uR1ae+lXrFoqyMnkdRYFJ+4PQBkuwN3Hs2XmjSpD93rXP+VykINdihvFVWXmICiZmWrx
         GqqXh5WHA1nQ4AsjWsp5PgtfTnPlaWRfSnaW6YS+rl63Td0H0KhnnRG9yiDD1XXMlr01
         os0TgVAUo7eojNMxEZdeehevYc7WQUn3hPFuRKH3cEQwdL6pSgNB5btbC7HvBdJer5Yn
         zAyGC65mkx4x8OLaSTLNKV0QESIPZuXpxL0XqU8q9WGcdvbdRQRWfazj4L8Ese1gYJWe
         sQAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750067598; x=1750672398;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dQhQRM3glVKEvyolY2kzbg63jz/t5M45p5rnwrjEPRU=;
        b=R9UxtzIKyKSbljnHuNYx7hHqELTQ70EFtMU/xb1D0PhDrwZWw+GbDYCE84UZv8fqVo
         Kl9Uqb3tWaWuEYy4Kuh2KoKF4Vv99hh70K8YRNjdBBfjWHc8ANUh+vU09IOtRuoD6YIU
         FxQxlVBYfQRnPOdQjfwXpM7VJZez6qb/jcZ0HGcLbpAaOd1TxS6v9yxzPPGqfg74xUVI
         d2hU6GqXv3Kho/GS8kvsWM54mrqAzceSOCBmLJVxUuRIrj/j/CdyAN0pZ12QdVcbF8Cz
         1IIawskfckOoMhxygl0eXxjOUYiHGBlXNh0VJp749H3WvJFruMtZKx09bv4Ixq/YwWsb
         U13g==
X-Forwarded-Encrypted: i=1; AJvYcCXCaDsi1a4tnJDTv99/459JMXFxT77gM4D4O5uchR9wy7kojhp7vnLDUjwzRhBfh1gRyuXvzsJJZuG2jpc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNOnJZtPmrtUkVJ2z0rSogi6sGs5kSnelhWVR/wkgwBsEMefJh
	RZQ8wvW/7ef6fPOuLqXahXAMtUSokoQXd9KgvRJiWAc1nT8Beih99Tvk
X-Gm-Gg: ASbGncu26usRoEQOC054ZZ7zyE/J5rxbmxgtCmvfQYycsW5PaGf+sBeRM1Ry0k4lqAx
	k2cXJYPoWjEyTjvcoL2vSljct+AGXLNjmZ9hee4zxNLRN2tzjbAvYsCJqTM/9Zw10GGXbSvSmfh
	yN+FjIj1s2Sp6qdYzjA3Agjs3syfR2MQDZLTgyTrzaOFIhabTgef8EYntOOAWQKCo5OpQ6UwfH5
	+FuBjQCpOBggNXnDyPCNZnK5qx9G1K9FNjSk8/6/XCa5xHdr+R1TNiqVxiWQe8F/tSON3Pxwpyx
	55Eq2m7ZsKRq3maLyh6GUVHFftBs3BOD0Bdns9pS5k4XM741QUjA5A==
X-Google-Smtp-Source: AGHT+IGx5JKAydeSKhZtI1U3Z6LenBZ9xpQv3dGrMhbAWOxYgLX45RlwnJlUOF+UhAdFcJzKux0sTg==
X-Received: by 2002:a05:6000:40db:b0:3a4:ea40:4d3f with SMTP id ffacd0b85a97d-3a572e5d78emr6665497f8f.53.1750067598072;
        Mon, 16 Jun 2025 02:53:18 -0700 (PDT)
Received: from fedora.. ([193.77.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a5407csm10725072f8f.12.2025.06.16.02.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 02:53:17 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH 1/2] x86/vdso: Fix output operand size of RDPID insn
Date: Mon, 16 Jun 2025 11:52:57 +0200
Message-ID: <20250616095315.230620-1-ubizjak@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RDPID instruction outputs to a word-sized register (64-bit on
x86_64 and 32-bit on x86_32). Use unsigned long variable to use
the correct size.

LSL outputs to 32-bit register, use %k operand prefix
to always print 32-bit name of the register.

Fixes: ffebbaedc861 ("x86/vdso: Introduce helper functions for CPU and node number")
Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
---
 arch/x86/include/asm/segment.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/segment.h b/arch/x86/include/asm/segment.h
index 77d8f49b92bd..93fcf0daba01 100644
--- a/arch/x86/include/asm/segment.h
+++ b/arch/x86/include/asm/segment.h
@@ -244,7 +244,7 @@ static inline unsigned long vdso_encode_cpunode(int cpu, unsigned long node)
 
 static inline void vdso_read_cpunode(unsigned *cpu, unsigned *node)
 {
-	unsigned int p;
+	unsigned long p;
 
 	/*
 	 * Load CPU and node number from the GDT.  LSL is faster than RDTSCP
@@ -254,7 +254,7 @@ static inline void vdso_read_cpunode(unsigned *cpu, unsigned *node)
 	 *
 	 * If RDPID is available, use it.
 	 */
-	alternative_io ("lsl %[seg],%[p]",
+	alternative_io ("lsl %[seg],%k[p]",
 			".byte 0xf3,0x0f,0xc7,0xf8", /* RDPID %eax/rax */
 			X86_FEATURE_RDPID,
 			[p] "=a" (p), [seg] "r" (__CPUNODE_SEG));
-- 
2.49.0

