Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE9C18E750
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 03:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750218319; cv=none; b=WWYQgz6D67qVdyWTQ+lBy2mQiGbk6gBxux/eWeWuT2ma0CAtMo+dMucmUzw0wT1tqrspbVWHfkv4cMvzyitzvuVnvznnqG4795vgDAZMIBm0XsaV/Uxb+5RKoQ3EXTPUWAcLKj6VaKurtjg8Ev224j12lpFvgyfvW6wf2M54Fj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750218319; c=relaxed/simple;
	bh=aPg0EOi2wT/pNZEkViBNqGcjkH5qXe7EpXYJf/CrbjA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=h32WPNSjU6Dmh9q9MWR3dVyGz0w9RQYkuk5wqhfKfEKLbRSORd8ANm8TuGVWl+tWlDcfcq+ofy5qyxxkfj7ik0rARIQdWjlSw7DxRhfmplltJY3I14nao1CnPV5GqXxxnaVdUkVyzhN3vxJCChwdDVHHNz7B2cbjHPz5J6bGdww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Gu1chLuI; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Gu1chLuI"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2350b1b9129so46029515ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 20:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1750218317; x=1750823117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0fLkDwiiUZSss6sfPf8N7ZCd7V1JUEtWvKlq+l/gMKQ=;
        b=Gu1chLuIZaQSN3epA+C+6Kn8ehxK80cCbAzxgzvV+YfMfTFHWZUCAh/rqPzHv9aQ1A
         pv5BgNklD8uzA6ljBkTEUHIHKd8V3E/WfOZFT/7EHqztt6uE4wkV9ApiJF9VjL7frrtq
         WaO61IQo89zf7EEBM/zLDf/tFTQakJWRTlSOL2cks8Ag/TmY7yvduO0y9wWZ0hyOjE9C
         nZ+L8H43ZlrXUEQx3RAlB2UbkhpVl64aDm5I5zNHFBodQxQNY/8qtwETiNbTJisVFv3x
         LWafX7B0loyRwNaromGvC7AwSEfXv+386H3wJbj5semRDOGcq5taVSiv1wdmbPxAXKe4
         YP6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750218317; x=1750823117;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0fLkDwiiUZSss6sfPf8N7ZCd7V1JUEtWvKlq+l/gMKQ=;
        b=FDMZhfLpKA8tccOlQhAiWjszO2mVtnPW6AKZWeA7Eu1KeJiuQfqTeE/cB4Tk0fPQ6k
         rfx4wAOujh6GJTFyhsEAbpm8/ra3FoM+56netu7Zond+AztN6n6dQngaKdko/xP6DZNw
         fbkghD5tT0zAAWQjGH6RDWQ06IWz/HDiNNsmRHYn0wybRh6m23HdGIuLCSg02koukIFg
         Ad/Cl5cSKHTWNDiScERhIrEU4Aq/Vhk2QtBMeCNIwr6/QI0AdYwuGZmMm0vnx/F/7hKF
         NB/NhA85hf3YihGAUhwv54rCe36mBck9bjUbiTzZi1oyZt/W0nSENu3SJotK6lwQx3BJ
         cgbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXk1MlC0Dr7/dHTwU8e4LFKYUVGeX3fnDXPepxYRoCQTGoWDtofb27Fs4VF/1Sh3X4ami0AX4INeny7HUc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2hZdo4GtBEhzUq4GqtEcys015w86v/h90JX7A9KB5rpWbiqy6
	g7UTUw3DEYFmEdemwkHlKke4Gt9g0fgJRAGQUt6KmLEBYd87sDwtq7wN81VaR7vNqjQ=
X-Gm-Gg: ASbGncuo5KeuFq+tJ99Qf5QXJb1wWRYhF7VNKZPKVT1aaYr5BaUy7fgIPvRDFmCmzpj
	bVT8ddO/sQS+bzMK4M7OcrAns13eKYn0dEl/6XB6D/8nVbkOU8lQFxKLCl+ESp8dJFFayjo/Z4+
	54+/z7dAhYGc0DIuamFX1QzdYjgvEbNL+RtAVeZvaLmj/wUH+W5eP3O0GqjULp5iKeB/DuE+/Im
	mAKNhPZD0i0QTejg4gqds5iJ+iSa3MOVCLr07dLI7gY0qPhAaM3kqHaVK1gn+kJpS8EhwGvdtF/
	xTFOIfmMyrWoNuZS4HWOX3iWjXcBzZY5pOSgim4Z4nLtvwNUwKITN8QyMspuyrt7hQQqya418xz
	JgjCY8UqV42QkvDr2lP60
X-Google-Smtp-Source: AGHT+IE7APHlRGasYy3yQ78VvuLvAp4la4XPZdrCuapexPi4U7QqDMCjcD3jPQHCJAuIypThc8r5lw==
X-Received: by 2002:a17:902:d489:b0:234:c2e7:a0e4 with SMTP id d9443c01a7336-2366b32e46bmr212010545ad.3.1750218316850;
        Tue, 17 Jun 2025 20:45:16 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d8a1ab8sm89333465ad.84.2025.06.17.20.45.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Jun 2025 20:45:16 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: yury.norov@gmail.com,
	linux@rasmusvillemoes.dk,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	dennis@kernel.org,
	tj@kernel.org,
	cl@gentwo.org,
	linux-mm@kvack.org
Cc: Yunhui Cui <cuiyunhui@bytedance.com>
Subject: [PATCH RFC 1/2] riscv: remove irqflags.h inclusion in asm/bitops.h
Date: Wed, 18 Jun 2025 11:43:27 +0800
Message-Id: <20250618034328.21904-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The arch/riscv/include/asm/bitops.h does not functionally require
including /linux/irqflags.h. Additionally, adding
arch/riscv/include/asm/percpu.h causes a circular inclusion:
kernel/bounds.c
->include/linux/log2.h
->include/linux/bitops.h
->arch/riscv/include/asm/bitops.h
->include/linux/irqflags.h
->include/linux/find.h
->return val ? __ffs(val) : size;
->arch/riscv/include/asm/bitops.h

The compilation log is as follows:
CC      kernel/bounds.s
In file included from ./include/linux/bitmap.h:11,
               from ./include/linux/cpumask.h:12,
               from ./arch/riscv/include/asm/processor.h:55,
               from ./arch/riscv/include/asm/thread_info.h:42,
               from ./include/linux/thread_info.h:60,
               from ./include/asm-generic/preempt.h:5,
               from ./arch/riscv/include/generated/asm/preempt.h:1,
               from ./include/linux/preempt.h:79,
               from ./arch/riscv/include/asm/percpu.h:8,
               from ./include/linux/irqflags.h:19,
               from ./arch/riscv/include/asm/bitops.h:14,
               from ./include/linux/bitops.h:68,
               from ./include/linux/log2.h:12,
               from kernel/bounds.c:13:
./include/linux/find.h: In function 'find_next_bit':
./include/linux/find.h:66:30: error: implicit declaration of function '__ffs' [-Wimplicit-function-declaration]
   66 |                 return val ? __ffs(val) : size;
      |                              ^~~~~

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/bitops.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/bitops.h
index d59310f74c2ba..d9837b3cf05fe 100644
--- a/arch/riscv/include/asm/bitops.h
+++ b/arch/riscv/include/asm/bitops.h
@@ -11,7 +11,6 @@
 #endif /* _LINUX_BITOPS_H */
 
 #include <linux/compiler.h>
-#include <linux/irqflags.h>
 #include <asm/barrier.h>
 #include <asm/bitsperlong.h>
 
-- 
2.39.5

