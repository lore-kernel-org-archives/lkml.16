Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FD627D78A
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 05:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746507937; cv=none; b=lVT0TfRaWZx+q9VHT0pqx36H4wMPWZ7MSQdpSwcIzAF09INPPRFPRhNNOFS9t4S69Jk86dsCPZmJdLdsHYaapCZDMpEWLJXwu8YGCYMudwr0b5gRn3GtTA8e29PgWmWOYtGmHdbg3zXffPH2SFw9CmdEFHxnPx0zHUTS2EyJRWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746507937; c=relaxed/simple;
	bh=d+tht4Q5poR0X5T7sV6NdB4OK51r3F+KNvQBLVdbw4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OW16nK/vIQFoKaiLddcNLFvfhrPL/o6S49wF5XSKrwbiPzpHzXcVug3152PuXu6pW1/DwjqW4rHY2DJFexF6WMkWQWMSfOkxe2Md3JaNxHvn6Sn8af6tRH4zN2Dor2ftBSfs/nqZjKoKqiQRa3NqlPeRm8c4LrNtSWsLLUnVGt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=NeRk4wq2; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=SffiNay4; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="NeRk4wq2";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="SffiNay4"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746507934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AhCbby9s39m76c8iICBtQZDrfqlIavIDxvVDqDnxoY0=;
	b=NeRk4wq23US+1ijcro6DQQZxCZOSK3MeQg8qqXPWtBDh9gpz37C7LGQ6d86xg2wXI0TuZU
	K5DR68q0++KX4gnuJGeW9O7P6tk+t2/IjhzfuqfcvJ1cD1LGFv9tF3VrElQ5zWyRWArvYr
	6V6s3JQhMb/f7Qly/5y9/4L6a3EyvcRFyquoSda34ix7/GkrjaHrhq19xnJ1UlvmfbVmN7
	7GCG1u1UsDeyoE81Yt0mno0tHOh5D6jSMO4IZfTOxzwh35s/spi/ypbxXYev488aL91OoG
	13qSQbM7WrZs6/DWP78UW36VY2tsV6sM4OFzJrf4PDJ8Ql/7FGoxL+nGnFadYQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746507934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AhCbby9s39m76c8iICBtQZDrfqlIavIDxvVDqDnxoY0=;
	b=SffiNay4ChQgtln5hGZMXHMPwOOi2PKGqDpquQZbkgWTgIfPxGtztWnPqanLZNFpKeNjIR
	i07JBsfAUyrmw/Cg==
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
Subject: [PATCH v1 16/26] x86/cacheinfo: Use scanned CPUID(0x2)
Date: Tue,  6 May 2025 07:04:27 +0200
Message-ID: <20250506050437.10264-17-darwi@linutronix.de>
In-Reply-To: <20250506050437.10264-1-darwi@linutronix.de>
References: <20250506050437.10264-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use scanned CPUID(0x2) access instead of direct CPUID queries.

Remove the max standard CPUID level check since the NULL check of
cpudata_cpuid_regs()'s result is equivalent.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/cacheinfo.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/cpu/cacheinfo.c b/arch/x86/kernel/cpu/cacheinfo.c
index f866d94352fb..696ef5e9e14b 100644
--- a/arch/x86/kernel/cpu/cacheinfo.c
+++ b/arch/x86/kernel/cpu/cacheinfo.c
@@ -382,14 +382,14 @@ static void intel_cacheinfo_0x2(struct cpuinfo_x86 *c)
 {
 	unsigned int l1i = 0, l1d = 0, l2 = 0, l3 = 0;
 	const struct leaf_0x2_table *entry;
-	union leaf_0x2_regs regs;
+	struct cpuid_regs *regs;
 	u8 *ptr;
 
-	if (c->cpuid_level < 2)
+	regs = cpudata_cpuid_regs(c, 0x2);
+	if (!regs)
 		return;
 
-	cpuid_get_leaf_0x2_regs(&regs);
-	for_each_leaf_0x2_entry(regs, ptr, entry) {
+	for_each_scanned_leaf_0x2_entry(regs, ptr, entry) {
 		switch (entry->c_type) {
 		case CACHE_L1_INST:	l1i += entry->c_size; break;
 		case CACHE_L1_DATA:	l1d += entry->c_size; break;
-- 
2.49.0

