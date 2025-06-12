Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F372EBDCB
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 23:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749771746; cv=none; b=jYqCnYzCVC0ST3+LlJGLsdcgCQ5EciyvdALjl0Lj7+70oviRQb89qdoCFpDjJybMxeez1wgYbjG7ZW94SSFDG9PtVWkuHIZYhy5Fn4cODX5VAU1XegAnrKVyf1hqpAkGQG12LTEdbXS6fYlsoFHjf1P9SRHJJoIZUuc7dsQSFyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749771746; c=relaxed/simple;
	bh=EVKH8nfEgonaFzkVahC/BRc7Qbl6kfDEPJpWVI/fQLs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BBGrPJsvqnj8NA7wVNVBtj+bGzdt36e95+760T5bkONFVHcpT5t25uofc1yZ8Frud3pcmUVdrnJykqW66WYrTsEk9ZKANBiWKSo/2oRepboJUMEgJ4WgG+wWPfcStgbJM/Gjt2NkYMNMA241UgsOyQeIq+6kH7IeiipOB4BVArg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=B+8FETRN; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=T1Yaeif0; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="B+8FETRN";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="T1Yaeif0"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749771743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CUY+X91MtS5sqFzNBN+KlUOYWoIRlN0bK845o2Ya5Zg=;
	b=B+8FETRNYWv1IQpLmERf755SmNQPg9wIgJ+0WlReh9u9qrmEf4GeaULHWaP/WGoI6NqVwg
	br/B8rhdBdNyYKips4Hqh+EDTlMmHO0Hp84LhtulyUNiWuoLLm6YDty0e8GFq9t9UP4c5T
	oFj5pv66U1pggjKT70kIyqb0rp6ck5gFl/X5uRK34jhNYSZRS1beTstPCzFTYTVyTZMrvi
	g6wykiOiMs5A50nD80ueEX1226Tdd0RgKyh1Jbjg3H0YavXnWX1R6QGD0i8olWJx4ikzzG
	GMebRwb2QV5pWHPUBVy+nvg/M/O9wClt3KdqauNV1GPPdQ9XG0X8GhKOgomNZQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749771743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CUY+X91MtS5sqFzNBN+KlUOYWoIRlN0bK845o2Ya5Zg=;
	b=T1Yaeif079k5Bz/lO8BAixhxEcf51YCNtPZMtRZEJPvnFP45K8h2tVxTfubWELWMrgtfY1
	GNzWEcHFumJDmsDw==
To: Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Sean Christopherson <seanjc@google.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	John Ogness <john.ogness@linutronix.de>,
	x86@kernel.org,
	x86-cpuid@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	"Ahmed S. Darwish" <darwi@linutronix.de>
Subject: [PATCH v3 37/44] x86/cpuid: Parse CPUID(0x80000005) and CPUID(0x80000006)
Date: Fri, 13 Jun 2025 01:40:03 +0200
Message-ID: <20250612234010.572636-38-darwi@linutronix.de>
In-Reply-To: <20250612234010.572636-1-darwi@linutronix.de>
References: <20250612234010.572636-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Parse AMD cacheinfo CPUID(0x80000005) and CPUID(0x80000006), if available,
using the generic CPUID parser read function cpuid_read_generic().

The x86/cacheinfo AMD CPUID(0x4)-emulation logic will be swithced next to
the parsed CPUID table APIs instead of invoking direct CPUID queries.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/cpuid/types.h | 2 ++
 arch/x86/kernel/cpu/cpuid_parser.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/x86/include/asm/cpuid/types.h b/arch/x86/include/asm/cpuid/types.h
index 89c399629e58..63d2569e2821 100644
--- a/arch/x86/include/asm/cpuid/types.h
+++ b/arch/x86/include/asm/cpuid/types.h
@@ -218,6 +218,8 @@ struct cpuid_leaves {
 	CPUID_LEAF(0x2,		0,		1);
 	CPUID_LEAF(0x4,		0,		8);
 	CPUID_LEAF(0x80000000,	0,		1);
+	CPUID_LEAF(0x80000005,	0,		1);
+	CPUID_LEAF(0x80000006,	0,		1);
 	CPUID_LEAF(0x8000001d,	0,		8);
 };
 
diff --git a/arch/x86/kernel/cpu/cpuid_parser.h b/arch/x86/kernel/cpu/cpuid_parser.h
index be4ef64c48b6..e4b34f0946ec 100644
--- a/arch/x86/kernel/cpu/cpuid_parser.h
+++ b/arch/x86/kernel/cpu/cpuid_parser.h
@@ -99,6 +99,8 @@ struct cpuid_parse_entry {
 	CPUID_PARSE_ENTRY(0x2,		0,		0x2),				\
 	CPUID_PARSE_ENTRY(0x4,		0,		deterministic_cache),		\
 	CPUID_PARSE_ENTRY(0x80000000,	0,		0x80000000),			\
+	CPUID_PARSE_ENTRY(0x80000005,	0,		generic),			\
+	CPUID_PARSE_ENTRY(0x80000006,	0,		generic),			\
 	CPUID_PARSE_ENTRY(0x8000001d,	0,		deterministic_cache),
 
 extern const struct cpuid_parse_entry cpuid_common_parse_entries[];
-- 
2.49.0

