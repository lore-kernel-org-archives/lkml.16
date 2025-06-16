Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120131E25EB
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 08:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750062662; cv=none; b=nYU3rm7qRsXV9e5cBJEFmqGnhMLQXyX4KLP7/97IUN/r7A/A68kqb7urKIgh5LSTJ9vQfJkEyNDSVdP+sA1BjXMfFUaHJ+/eP2JbOXYaJp6c9RggpGRit1KAd2Kc1ssBqoCCN82pTLkggu3pD/cWrIpHAxCgaJGPyPzlgK4Q6To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750062662; c=relaxed/simple;
	bh=2/Z4r18vsY0SX4W4/zyu97SlBTjtJ9U8SMkKx61jbSM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QfuIa+sBJOVYK8Wv6lnel/Ep3tj7iQIMMICUbFP/OKsSCwFUtZKcPR5q2xW4qOvg1Y7WWRO7NpwnNza+Jt/pkfc5OJSl+f+jL60vmBAD2NVOTOZACo1v+Z4oIX52MsrQEbC7raKs8Bo9jz+BIESmLPSWfUSvhjT4CbZsjtFYnL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ddBkUSnc; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ddBkUSnc"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-450cf0120cdso35050015e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 01:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750062659; x=1750667459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CjVy9U5cCHfPCLkIztlHvZcD6jwKLBifr0CRV+MLuWg=;
        b=ddBkUSnc8e5vMtxJvxBVk3aURwNsygEbWYhbLWMLy0v0M4H5lmJBXnjeZsl8QSrjxv
         DYKe4f47zfTl6KRdGkkSkHUzVEDyOQ2WRF32C2+iaqgLi/Qt+REjzHnU/2dYavWuOI88
         K9Gz1/vdOlu5XNU9+5TYH3jMin5OxwCCuf3EgqP+nYNV3+Xxk9QIu3BYvWF13hCz/mno
         zzzHQyJX5/1K3lc0YKHfZsBATjTRsPgfttWYIpZkX/PDDIcIOwnxz/RJ3FHy/qYbb3Sm
         NYk/ydQzjKUrgGfKKGVnlpwXJoUXX3OzvhY0IDQXJJ9kWu7Ih7wxM0A8qkiHv9QgjqvU
         Nhig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750062659; x=1750667459;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CjVy9U5cCHfPCLkIztlHvZcD6jwKLBifr0CRV+MLuWg=;
        b=m6pUhXNjlL/TEwxAEEPkS8plEPH6B4FV/nanJ45YTFX2kwb25tQM7BlqwA8Nm/6eXU
         S68SjyiZmOELYytcW6ZYvf1OInhv1YS0H7kF6sJGVmIveBoCRyEYDnkUsqyyd7Fz4Xvk
         5BebSz9o2Ab8MvvyYDQ6spL+5jX9nC/D9udBQ8EJg/T28Db7ZzFWD8qZYq45CzKVN+82
         T95S0CwfwZkUsQEsMPhsGneSA3KqLXGw3bRXOT3EgnVHPwUHfxIR8eCLmXeeYOAa4EIJ
         axMpiz/2SSpSshWRMWW1j5W9OOJ5zO5qhtdIEqNzhlwR9BNNUHxi7vcXXfIeBPLq+gnA
         d46w==
X-Forwarded-Encrypted: i=1; AJvYcCVsmRXkZiKNKJWPfOJZ804u1Z3pSAMNhZq1qEVjFJcWSq37kapUy7YDjgQreo1+5hgkeyS12gSQsKfnaMU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhkp+fNeLggvl0HlYiJZxmoBbgb/dY45yEA3nfg78Y3e289G4S
	hIlldWgXk478yQOBtuS5qOvS7LApHLrcqlGacMA4bC/0cCZ5yGhSKMks
X-Gm-Gg: ASbGncu5beAEWKWVRGIG7+QHdEFsv/tOlDoWyehj0zUyF8YRFH/4QfYXUPfA9it0x02
	4ENMtyyx2lNTV9FW7eAqAXesprEeBnxespss9QYBhwVlzSNbo8Wpz9OMIROwe3BJWJIg3CfX07T
	Poly5hYbEl0FACT7aOlq0WXyMu9Dc09RpcSDNviW/f1XVxpQdRXsZ+TYxDVeIR/fRisCkfdQG26
	86rdDd5dQsHyhoeu6SIiaJS1gT7649aksY290g9zxSpRpt1e7N3vOyCF3Uu7szLT7HJUa5nfu77
	cC+gX3UZmLUEbeZQCZ/7NC1h2PrITwrcIxgIOmBySV0CJxXStX7PbQ==
X-Google-Smtp-Source: AGHT+IFhoddjnbRB+Yj//UnTop550KeuR1B2yCI8OKQE7qzsxeHpqo1UpQ670wVoWROSY/sPoY36BA==
X-Received: by 2002:a05:6000:4028:b0:3a4:f379:65b6 with SMTP id ffacd0b85a97d-3a5723af4e8mr7039560f8f.46.1750062659214;
        Mon, 16 Jun 2025 01:30:59 -0700 (PDT)
Received: from fedora.. ([193.77.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a633ddsm10329580f8f.26.2025.06.16.01.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 01:30:58 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.ort,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH] x86/idle: Use MONITORX and MWAITX mnemonics in <asm/mwait.h>
Date: Mon, 16 Jun 2025 10:30:41 +0200
Message-ID: <20250616083056.157460-1-ubizjak@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current minimum required version of binutils is 2.30,
which supports MONITORX and MWAITX instruction mnemonics.

Replace the byte-wise specification of MONITORX and
MWAITX with these proper mnemonics.

No functional change intended.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
---
 arch/x86/include/asm/mwait.h | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/mwait.h b/arch/x86/include/asm/mwait.h
index dd2b129b0418..d4bcbe59626d 100644
--- a/arch/x86/include/asm/mwait.h
+++ b/arch/x86/include/asm/mwait.h
@@ -36,9 +36,7 @@ static __always_inline void __monitor(const void *eax, u32 ecx, u32 edx)
 
 static __always_inline void __monitorx(const void *eax, u32 ecx, u32 edx)
 {
-	/* "monitorx %eax, %ecx, %edx" */
-	asm volatile(".byte 0x0f, 0x01, 0xfa"
-		     :: "a" (eax), "c" (ecx), "d"(edx));
+	asm volatile("monitorx" :: "a" (eax), "c" (ecx), "d"(edx));
 }
 
 static __always_inline void __mwait(u32 eax, u32 ecx)
@@ -82,9 +80,7 @@ static __always_inline void __mwaitx(u32 eax, u32 ebx, u32 ecx)
 {
 	/* No MDS buffer clear as this is AMD/HYGON only */
 
-	/* "mwaitx %eax, %ebx, %ecx" */
-	asm volatile(".byte 0x0f, 0x01, 0xfb"
-		     :: "a" (eax), "b" (ebx), "c" (ecx));
+	asm volatile("mwaitx" :: "a" (eax), "b" (ebx), "c" (ecx));
 }
 
 /*
-- 
2.49.0

