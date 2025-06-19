Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84F91A23B0
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 17:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750355043; cv=none; b=JW4ztLMI2bkWf+RjZ+OXJ9DktG0qRp83Qxp/4e8l30gRPQOb+XmDefJFSp91YsbujfDsetKKQuyYDvofd9A1OkiNV1dQ+BiJXk581+D6CKMuX0cIJSW3cGL6+ri5NxslZ4Iw3sIPwD+Qqr8I4sDHZv/fTxLUp16wT6+kCHmkP08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750355043; c=relaxed/simple;
	bh=R+/LVzNghf7PFySJu1lR9b8foH2YBBH6ZDv7lRMtnJo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P/YgzP/oBDytgEz+X4h3Phm5lP0/Z7wCAUcHWeiBfI8s6myGdOnM8na99tFR9Ef16xXPZ1liVwd6ZU/3K7MTF0mpDdrDsNEa3uL48uxMu4e318P9mERfykJa5LMzAn+rRCaT39F7SaF3vaG0+76PbpqUbY2kFPdliZHuvokfrEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m2FM4dM7; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m2FM4dM7"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-453398e90e9so7559335e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 10:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750355040; x=1750959840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=83l/YjUPGc6M1fsqIf0lBsAtdv+jaqTOluAn8dfN8VQ=;
        b=m2FM4dM7PzriLmsNkBtd7bgeFtg+BLW+cOrOXJJzM52qiA5YTpBw7/WPpIVehk2m5p
         AhZECR9YC0MKc0b6kMy9dBYtWm/Fakb9ZvRe4DzXiH6HzMgkGJZSp7lscvkDsPoVMiFx
         Vryc+/92BoyhwVb2AEMRkLVEa1u1VcLG5/CR0e9vpRlJ3iQr2ZZtx/kwPIMulcpCFMqm
         Q8/SbPAVvmdFd3EWbGt3l0Rl1p8RqzUVveVV0AtHxOsSKsOI9tr/0S5K+X8rAZs4yayW
         6g7vRxYnc1k6L1NZn8xwJY9IunV/Ic1A6tY+03XL0GGnWwLUWi4vFZWQ/9RfU10NG5ce
         78Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750355040; x=1750959840;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=83l/YjUPGc6M1fsqIf0lBsAtdv+jaqTOluAn8dfN8VQ=;
        b=NcJou5QVM416lv+UuMUuE/vjO4Bf6e646T4WgQ0Dez8EJvzpQBk98P77T+D/B3tHNO
         N4Hhpk6va7ZBm6uVTQorsMIWRNVvTbc6gfFSFj4Uea9WGUBfqk6L3Ompt67SGftENe4j
         fbbYO9n6CN+mdMdvDSFyriJKIPc+MdUZWan2Ag1tV4qprjgDfKJ80Ngs0LeA88TPydPY
         1sFcEKMF5dKiSm0LBC9sPkmH3w+JKMEzKeFMhstNEY6BaAkYn/LPvhvJJl5puI/o8/qO
         ceo0dFx0H7fKizabe0ZzKwyYklNdVykHlwi8mLtP0kwI3ao1cYqe1AnNr6qMO0Ow1aVr
         F8yg==
X-Forwarded-Encrypted: i=1; AJvYcCUayHyBMpO8KFYxJxCCJJeCAjm4SgtBnxP13KfZpFmahzEALMUcXr8mWH52hwAJLy+37fZtp2ITs3bcIC0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgSM/iZIkk37TCcdcDGxHf8f84jfSrrlLi8/na5vfsfvGXGKid
	OG7800pa3R2DYbqokwP7Fcv5mmeLlpnIR9x+6SjY/7mn+G63IEgSQCxN
X-Gm-Gg: ASbGncv24q4Qo+oRRbfRMZdZI3JKKdkHjNmfMVvuCa03EwrkUfCkLSQNr7/nk5duOky
	CpfE3VL2tm0G6ZnXVml3R67ITnBoseTuJwwPKq8Nka7h2B20c6BsNj/JpRo/GU9J2BaIHsIifdY
	GbkalNaFHpvoUBRAn1o3wSA2KcgQOqtmT+wpzNAApDHvSpeCIUKCRpi5vlRHqunM1QjOaIs9Qta
	g3jTNCF5deGrwI8nxE5WPNTTdvTWmTUzuZ47IvUM4U6RrMIDk0AXfR8yTfIcfMY1fV5ca4HXHFA
	C/LuynDrMXJf3IV9NlpPCX4JOHPOA4Emzqi7Rt/tifsE/n6IVPoIIocOX+idJ+JJopsC8aFg/RR
	4AA==
X-Google-Smtp-Source: AGHT+IHW7BHOVWh6xy6YZq+5yjszLeOLAI+0jMS56mW0TI75HZ4YuMnvBpF23bTJX3t2GqkAYP4q5Q==
X-Received: by 2002:a05:600c:8012:b0:43b:ce36:7574 with SMTP id 5b1f17b1804b1-4533cae684fmr222211885e9.11.1750355039682;
        Thu, 19 Jun 2025 10:43:59 -0700 (PDT)
Received: from localhost.localdomain ([41.79.198.22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4536470903asm1081755e9.40.2025.06.19.10.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 10:43:59 -0700 (PDT)
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
Subject: [PATCH] x86/mm: Fix log overwrite in CPA check_conflict()
Date: Thu, 19 Jun 2025 17:42:41 +0000
Message-ID: <20250619174305.897-1-khaliidcaliy@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khalid Ali <khaliidcaliy@gmail.com>

On certain configurations (e.g. custom builds), check_conflict()
may produce a large number of warnings, flooding the kernel log
and overwriting earlier messages.

Observed warning:

  CPA  protect  Rodata RO: 0xffff888022a75000 - 0xffff888022a75fff
        PFN 22a75 req 8000000000000023 prevent 0000000000000002

Rate-limit these messages by replacing pr_warn() with
pr_warn_ratelimited().

Signed-off-by: Khalid Ali <khaliidcaliy@gmail.com>
---
 arch/x86/mm/pat/set_memory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index 8834c76f91c9..bc5b62988b40 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -608,7 +608,7 @@ static inline void check_conflict(int warnlvl, pgprot_t prot, pgprotval_t val,
 	if (warnlvl > cpa_warn_level || !conflicts(prot, val))
 		return;
 
-	pr_warn("CPA %8s %10s: 0x%016lx - 0x%016lx PFN %lx req %016llx prevent %016llx\n",
+	pr_warn_ratelimited("CPA %8s %10s: 0x%016lx - 0x%016lx PFN %lx req %016llx prevent %016llx\n",
 		lvltxt[warnlvl], txt, start, end, pfn, (unsigned long long)pgprot_val(prot),
 		(unsigned long long)val);
 }
-- 
2.49.0

