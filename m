Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDA229DB7F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 17:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750700691; cv=none; b=GV/cd1ITSIM9F/RUa2eerNwnSttIt3a+INjyBDdGzmwvDmFpMVlHWnum/XNLHXXrLpCwkueDE0/bot+0UnHWxU5prux/aLICHgK0+Z1TQVwcPrNXcQniboF14yllocfvnYZ+KRGp+3r9gyaCxnK5TIlDZfFJnMiOeh7x+eyy1fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750700691; c=relaxed/simple;
	bh=DNLllyIE+e80JQxJ6El3SX56+1A+2Lfbj6TQs5k2QgU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nohWoIYN6mogfPNcNXvizSQTSavfSui/mWUIsT+UYSWErrtxln1bZ+gWQF8vuMv8NJAEAyUxO/XV+BsoONRGN4FTzwyExm7CchwHeZ+eZmLip3J2ZRMf0KA5VwJWQiMG89kWu74BeeSP+s5kM26fZy68GrdxjLUC4oOhz7UMSrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ycg+u0ZH; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ycg+u0ZH"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-adb2bd27c7bso679083466b.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750700688; x=1751305488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=luJxPA1073bgyWK98Ffrv+wfRr9Uy1zh48u5rwJzZIs=;
        b=Ycg+u0ZHPzwd/AGX1nqETVXmb5dxmQOdLrY8ECaoESZTilBl2s6eD+OlEdfXx5wo3v
         XG9uAPll50KYgHUrhdgdXNwaz2yJwBQU/vGoyYn2qmQoVHIbn/GKf98E/8VcjwzJSGbs
         ppFSXMeA7OIjxArZg6MdOYupbo2vXt0Z4Ocm64B/lotD8ZMpRFV8r0eMy/WyRvdP9L+F
         JW+HgArTk6TFN4CrPyTuAF82skZG5FyPGdMjUyCeb/V+4jCSPL/acMFJtBEH9Ozixbho
         Qee4PScLrOKJtOpag1aA3epImzVfv28PKPdaTLSYujei8KYi7IitUiwdxwsZ+seV4VMn
         k6uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750700688; x=1751305488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=luJxPA1073bgyWK98Ffrv+wfRr9Uy1zh48u5rwJzZIs=;
        b=poBl6s0C8P10Q7dgwWRY2VJkWGyV1duQ+U6rMO8idrLQHqZSjC+gI5AWm+eSUPaaPC
         rBaS77AnXd/3ILBf4AJIklNOVSJnrzTWMIhooOlv7QZXjfZPRddr6Msz/gtyjy6VcsNv
         iSQ0AOzuiR1eVYueFcnlcfsonovM4LuPhw2CBJnouIyuDPJrkiNY/tKg0pEd1T2lWFPk
         1gp2E8dqoDtUebgI038sxLW9D9VwyIQMMBTZpPRutZ5c7TlHKxmuMFdKsHVT4bFKM/xY
         BM1sw3JvtiJx1AO4CvFeSttyqWhxAbo+PsnSUiLIcRxxTI6avm0v570lIBA9gYuV8kEs
         1ufQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSROoLnfVi6IQnXCTPs447tRiA6aHVkxr2QmgtefyCwOJX4/I3munB1QjzkfdbQN569B012dfnzbzBqrg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbP55Xm6W0APRzt20T4gyRMup2pR2dZ6+35WSWwphGt6aBr2so
	I4KpFL50nRUn14lW0iVTv1K4q+mEnMxJwdMZH3G7lmXJyQiTRsglJbGK
X-Gm-Gg: ASbGncvLua7QLm12W+PTDuNwXM8p6FZ9gOhIiBzBtkJ9RoSr08XkvbXvbaZn6xcLg1b
	Y9mr1ql7WT+ZVO9QvcNiIs+Hhz6Rwp/eBvVSYaf/PYjQwVZaxH77gn95WkHNpk4RLzgtzOVuD2l
	OW85MiVhwuRHtojifWxJzsS445PEKy3LllxxxQXDg6ptib71UVgf1zBCv6EsvsrwiIx1UlRziAp
	NkTkEbwXJk5Z0YfE0RelTqGkqoK2+6GBq7zwOPr1cOKEQfLZa6WhjW77dkZxxmkT+DVE+LMCqKd
	j8eiNeosuYnsTUMnO/t0s5mAhBoJlgeLbcj3KS/LwXRdRq6Ki/6TQUxEsY4Nmz3Pjb5bWXz4XS5
	2
X-Google-Smtp-Source: AGHT+IF2Xs6Hc7KCBwr7AotG8QNRufD4JJZrPsOwMu7GOmTmVHrLXelzUtNdC3h3B+kGcyrmrO4/Mw==
X-Received: by 2002:a17:907:728a:b0:ad5:3e27:ebc with SMTP id a640c23a62f3a-ae057f3e7d8mr1382084566b.57.1750700687882;
        Mon, 23 Jun 2025 10:44:47 -0700 (PDT)
Received: from localhost.localdomain ([41.79.198.24])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae086eaec9bsm308205966b.177.2025.06.23.10.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 10:44:47 -0700 (PDT)
From: Khalid Ali <khaliidcaliy@gmail.com>
X-Google-Original-From: Khalid Ali <khaliidcaliy@gmail.com
To: dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de
Cc: x86@kernel.org,
	hpa@zytor.com,
	linux-kernel@vger.kernel.org,
	Khalid Ali <khaliidcaliy@gmail.com>
Subject: [PATCH] x86/mm: Inline mm_mangle_tif_spec_bits() and l1d_flush_evaluate()
Date: Mon, 23 Jun 2025 17:43:25 +0000
Message-ID: <20250623174355.9421-1-khaliidcaliy@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khalid Ali <khaliidcaliy@gmail.com>

These two functions are called from performance critical path like context
switch.

So make sure the compiler optimizes out by inlining. This won't result
increase of size because these functions only have one call site.

Signed-off-by: Khalid Ali <khaliidcaliy@gmail.com>
---
 arch/x86/mm/tlb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index 39f80111e6f1..657e8e254b69 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -624,7 +624,7 @@ static void l1d_flush_force_sigbus(struct callback_head *ch)
 	force_sig(SIGBUS);
 }
 
-static void l1d_flush_evaluate(unsigned long prev_mm, unsigned long next_mm,
+static __always_inline void l1d_flush_evaluate(unsigned long prev_mm, unsigned long next_mm,
 				struct task_struct *next)
 {
 	/* Flush L1D if the outgoing task requests it */
@@ -648,7 +648,7 @@ static void l1d_flush_evaluate(unsigned long prev_mm, unsigned long next_mm,
 	}
 }
 
-static unsigned long mm_mangle_tif_spec_bits(struct task_struct *next)
+static __always_inline unsigned long mm_mangle_tif_spec_bits(struct task_struct *next)
 {
 	unsigned long next_tif = read_task_thread_flags(next);
 	unsigned long spec_bits = (next_tif >> TIF_SPEC_IB) & LAST_USER_MM_SPEC_MASK;
-- 
2.49.0

