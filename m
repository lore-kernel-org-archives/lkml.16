Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A79280030
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 05:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746507952; cv=none; b=Gb+CK4mV7dViOatBUTf7mrTzLMs4c8O1CHB9W9/2l9utg5kqlGSOTnmN355XPMbfoMQ7BbvwCuyrWjDJV9RVuygrMbYmDc3F62OO1XrJbQ2y5MFwdlJ9duvG5eHdVn4JtSdJn8GxCSiUFlH56VbNsI3ggFUHLhUNFJxFDemhivw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746507952; c=relaxed/simple;
	bh=jdJ8vYLsc8UI+uFUShPbLP9ECM8X5+0k3+nJI+Hz2K0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cPLz8ksOJ2IMiMESDiktk/5qxCQUk8abAk/Kt80DiHoiYUmZF+H6oNAmXP3Y3DAu8nTZdzQdkQdEWR9kB8DZYFazd7DE6pfMDiNKGA27YvHhgUoRU5HGt5enWolSV3hcAP4/t798kWl+blC1uTYLEovczW1cEP+i6QJ3TRcTGVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=LmqXA+ml; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MN8uynZ/; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="LmqXA+ml";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MN8uynZ/"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746507948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+4AmH9x6rWZFhrii+Ub9TUF6GGpCZzo48nk/mRhzIBs=;
	b=LmqXA+ml/mJfmOoAABrInmr7VVMsLrMFYNa22aL4U6UJBACdgVhiQLjwK4pvYEyQr38IZo
	NKUEeWZGbigZa6DenaVTJdop7IOxLpBPCzx1izKhUpuRdWuK0vxgj9zp6nWRxnAIG75eck
	uBkr0ZxW8AWWapQWRq5G6UT0z7RNtRjydy0NYYqV1RzMmBq9gqpYhCWoUY2t06dipUA0zT
	gpEQDt1yNTtQXOlJWME3EiGk5kp5kwuLXg3lhFnEC5QVq03a+4Drnqpd9xZpJwF3tEeN2C
	orNVjUQPRWCiPK1R/L+o2FgQokm72AJT53MTFq3i9VPR8Sv+yTgMlT2LJil2MA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746507948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+4AmH9x6rWZFhrii+Ub9TUF6GGpCZzo48nk/mRhzIBs=;
	b=MN8uynZ/yXMOXozGBxhxCuNoCkeBKqKI1PgocGf0FfI44lCB0A/O2NQJKfLJF1UxbFgoMJ
	4/5KQ3xRY9RnO2CQ==
To: Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>,
	x86@kernel.org,
	x86-cpuid@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	"Ahmed S. Darwish" <darwi@linutronix.de>
Subject: [PATCH v1 21/26] x86/cpuid: Scan CPUID(0x80000005) and CPUID(0x80000006)
Date: Tue,  6 May 2025 07:04:32 +0200
Message-ID: <20250506050437.10264-22-darwi@linutronix.de>
In-Reply-To: <20250506050437.10264-1-darwi@linutronix.de>
References: <20250506050437.10264-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Scan AMD cacheinfo CPUID(0x80000005) and CPUID(0x80000006), if available,
using the generic CPUID scanner read function cpuid_read_generic().

Follow-up commits will switch the x86/cacheinfo AMD CPUID(0x4)-emulation
logic to the scanned CPUID table API.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/cpuid/types.h  | 2 ++
 arch/x86/kernel/cpu/cpuid_scanner.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/x86/include/asm/cpuid/types.h b/arch/x86/include/asm/cpuid/types.h
index 2ac3d05c3fe4..50280bbc01d6 100644
--- a/arch/x86/include/asm/cpuid/types.h
+++ b/arch/x86/include/asm/cpuid/types.h
@@ -183,6 +183,8 @@ struct cpuid_leaves {
 	CPUID_LEAF(0x2,		0,		1);
 	CPUID_LEAF(0x4,		0,		8);
 	CPUID_LEAF(0x80000000,	0,		1);
+	CPUID_LEAF(0x80000005,	0,		1);
+	CPUID_LEAF(0x80000006,	0,		1);
 	CPUID_LEAF(0x8000001d,	0,		8);
 };
 
diff --git a/arch/x86/kernel/cpu/cpuid_scanner.h b/arch/x86/kernel/cpu/cpuid_scanner.h
index a09110a4c72c..42d88732b1f5 100644
--- a/arch/x86/kernel/cpu/cpuid_scanner.h
+++ b/arch/x86/kernel/cpu/cpuid_scanner.h
@@ -95,6 +95,8 @@ struct cpuid_scan_entry {
 	SCAN_ENTRY(0x2,		0,		0x2),				\
 	SCAN_ENTRY(0x4,		0,		deterministic_cache),		\
 	SCAN_ENTRY(0x80000000,  0,              0x80000000),			\
+	SCAN_ENTRY(0x80000005,  0,              generic),			\
+	SCAN_ENTRY(0x80000006,  0,              generic),			\
 	SCAN_ENTRY(0x8000001d,  0,              deterministic_cache),		\
 
 /**
-- 
2.49.0

