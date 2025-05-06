Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E77A284B3C
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 05:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746507965; cv=none; b=nmu4en6RjYtIMwTO/vC6F1F4LS6Ke18Q9hmRn1f4MrhlBw1n/KV+//iLu+tYyjlxDiUJHHzSyUlCKdupCVjMOdx+0hmMrp+JXckaN07avFcsmZ53NhuYaLUsx1hGRSvoCxap8iB8htaGZ1WoKfEfs5nWvKVgXxwR4btwJ4U9w2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746507965; c=relaxed/simple;
	bh=nvW1McxR+p74HZMya9/DRP/bGzLonc63is2DimZQt9g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ucdFFzSYiys3ueQqOIywLdiKFY/uV5TDURdISk5YaOM39KGj+NnpeASHIw0tW8SjqwxsEy8HXU8wogkMEI8Mhvyol+mhW/prYZzgTr+g3jP6AJD7oG9Tv+8IB5F+X3iOMdvVfTRqVbvW4eHqXI443vFvJ9RO0uJy2f+dqLlCzJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ZpNVn6zV; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=iRC0Rgrs; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ZpNVn6zV";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="iRC0Rgrs"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746507962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x7VTczBH7hG0g7nB7mDJ5J3x29Q37dvpEDuoaZzqTPM=;
	b=ZpNVn6zVVr5xyuEp8hSeoV9349lljAkYVW2+akiBFUQp39XSrHnmeCO+DHT59BwSKCBeP0
	0HDtq0s3MdhUimZTLCkzchqrTLFnOwQby13cQSXV2S1cLVPSOGAavt0fO4AX6hA5T5HqYM
	j6djS+A76wREixOlyqPjTsCICgFTUGmp/bRghA1phbgIUs/FspzYBRf5JjNEcKaRmj2KP7
	yuGtsYL1U9BgkwGJs6x/rWPtNeJGra+e3aoI5M0gMqmGZcaMwUV5/JMoX0to8b+Io5Pliy
	Pub7vtfxRjKeSS551YIqS4kP8hO7b7IHXSPau9Bx6jCwpKLAA4U7lwY2rwhepA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746507962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x7VTczBH7hG0g7nB7mDJ5J3x29Q37dvpEDuoaZzqTPM=;
	b=iRC0RgrsWhQUqGz9l+iR4ieChCv/wseejd+1KBxOiefoHSZ1vEOW1pPafV7G5TI2LnT/QQ
	xhyvLkEDcffV5dBw==
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
Subject: [PATCH v1 26/26] x86/cpu: Rescan CPUID table after unlocking the full CPUID range
Date: Tue,  6 May 2025 07:04:37 +0200
Message-ID: <20250506050437.10264-27-darwi@linutronix.de>
In-Reply-To: <20250506050437.10264-1-darwi@linutronix.de>
References: <20250506050437.10264-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Intel CPUs have an MSR bit to limit CPUID enumeration to leaf two, which
can be set by old BIOSen before Linux boots.

Rescan the CPU's CPUID table after unlocking its full CPUID range.  Use
scanned CPUID(0x0) access, instead of a direct CPUID query, afterwards.

References: 066941bd4eeb ("x86: unmask CPUID levels on Intel CPUs")
References: 0c2f6d04619e ("x86/topology/intel: Unlock CPUID before evaluating anything")
Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/intel.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/cpu/intel.c b/arch/x86/kernel/cpu/intel.c
index 5cefe726c18d..461d01e04fb0 100644
--- a/arch/x86/kernel/cpu/intel.c
+++ b/arch/x86/kernel/cpu/intel.c
@@ -192,11 +192,14 @@ void intel_unlock_cpuid_leafs(struct cpuinfo_x86 *c)
 		return;
 
 	/*
-	 * The BIOS can have limited CPUID to leaf 2, which breaks feature
-	 * enumeration. Unlock it and update the maximum leaf info.
+	 * Intel CPUs have an MSR bit to limit CPUID enumeration to CPUID(0x2),
+	 * which can be set by old BIOSes before Linux boots.  Unlock the CPU's
+	 * full CPUID range then rescan its CPUID table.
 	 */
-	if (msr_clear_bit(MSR_IA32_MISC_ENABLE, MSR_IA32_MISC_ENABLE_LIMIT_CPUID_BIT) > 0)
-		c->cpuid_level = cpuid_eax(0);
+	if (msr_clear_bit(MSR_IA32_MISC_ENABLE, MSR_IA32_MISC_ENABLE_LIMIT_CPUID_BIT) > 0) {
+		cpuid_rescan_cpu(c);
+		c->cpuid_level = cpudata_cpuid(c, 0x0)->max_std_leaf;
+	}
 }
 
 static void early_init_intel(struct cpuinfo_x86 *c)
-- 
2.49.0

