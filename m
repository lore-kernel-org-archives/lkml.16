Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B613628312C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 19:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749151522; cv=none; b=H/xiepER+TevZ5U5jhUCt5I96bQTB8OUehvk9suIMb9UgC8KumnG6fGfp80yOPvo5DA/Kzt/XvorJIRghbrS2KNuu8L4LZN/HkRMk1DFLIi6V2sG3P4XW153J8y7B8CfdafXiOKwG261L3AbTpqNAtGOIw3q6K2n888fpqbayN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749151522; c=relaxed/simple;
	bh=STapveQm26BuKwcv5pdhoVZEubsnxFFLXX5Dy33HG/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FutyZUudYKPy7BT9oyzm5EOk5/FiVZ97fOB4URg3Rh9DGAZFML0sqFvbeNRzPA07WAHZbPACCN5k+WSSFeOORjmqdATZX70HLoSfWmOTh/8lVvzRQEUPrKhFMxigY4XAhb9KKJSsj8aFGeea4/VpGiOkRHxHCx1XmJSEqVg2/bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fYKpV+XU; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=9c57+W2t; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fYKpV+XU";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="9c57+W2t"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749151519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jDICetuUOtKlClQz0zuD5XW28Xt/po6NkLIRVVNMY4o=;
	b=fYKpV+XU7Mc3asLYtSRx8az7KhZEghUPfgBNOV/bmwzcgeCG8TrsrwqaD9n/1zlHzSnuVj
	auXNjXkESQXnUbCsvZ5BZQZYyNSBakZbpPLgD6ZkDRuUVdw6VfH0V7c3LWBeOvCpMpBV5Y
	gohomSoCrWAIps1ET2U263W2Z2X8TexQb3SZ1Ca44PlPFOxWH/vNxN6emRoqNk8rnGIVHQ
	Zyw/o6wASCkDR+aYEvmuFrjbpXSNNPSQISX3GHYDUTkArYcmSJDuo4yeySrValrPU9A+Bi
	X+H+uO+YtSy5q1a1ETIarX7h2aqJWw0WPcQJqgeuMyUaTddEa4cJgHWoCrKDxQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749151519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jDICetuUOtKlClQz0zuD5XW28Xt/po6NkLIRVVNMY4o=;
	b=9c57+W2toulGiDF2rdWj43AAZ5A1gUkQTihYU0AixJ/EARqj1M9KTrqBClgBEbV3Mn7QRm
	0E3J6IKsiVDSsnCQ==
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
Subject: [PATCH v2 22/27] x86/cpuid: Parse CPUID(0x80000005) and CPUID(0x80000006)
Date: Thu,  5 Jun 2025 21:23:51 +0200
Message-ID: <20250605192356.82250-23-darwi@linutronix.de>
In-Reply-To: <20250605192356.82250-1-darwi@linutronix.de>
References: <20250605192356.82250-1-darwi@linutronix.de>
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
index c79c77547a1d..d9bb970c308f 100644
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

