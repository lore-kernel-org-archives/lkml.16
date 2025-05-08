Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8EF27A11C
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 15:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746716574; cv=none; b=HDYrguXcmMvc2U6KUurPY8JayLvGEk88pEVkcqG7Nj6KWKQL/9hmnAzllxzxZSy+Rdft4NmpoUb7u7yjz9YMMoXUicpQ/TlVvhIpAdWb64+raf5QiAkIWzv9xzIXPp992H1xWwo+84YRwruKMNZiqRLv6l5kh9z9zGfirQek01w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746716574; c=relaxed/simple;
	bh=aZgW/tnKgyRU98N/yvDYngoeVYGERyea23wmk8q1bS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t4nLBgPL4i+JaOr0Qv1G6kuQ8dW69t7u7N6jLkjLUoPLQHwuxwuBS5eCq8vCJamOpvv80iD3aOexy7UhY6f5v7XmEym46Sg5vwzrefU6ttQCtq3EYZsiYwe2rFeQaS6ZRBnddtr5SINiYmD0XNJx+85xvD8vacmlH79FyZ5qXlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=S+BeESVF; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=z+cJqS/P; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="S+BeESVF";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="z+cJqS/P"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746716570;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Brs/dya36WaKp6oSWjhTQUh6KSjlDJ2bX84m4fPy6gg=;
	b=S+BeESVFhTnj1t2oxICZeXGvxL1bce9C52kC4I3PT0JxLJrdB5mYCqVF3svyyff+zCKd15
	luKcovIbCPxrqFY6KZhJI398T2Iqg2Y2RfmMM4a2scBM7iRw7SIqKet2WsqdUUPn1rIr1r
	Bq3a/cZ+CILeu1MqF9y9BKip3eg2VowjHO1rLQrFB1fyEOr2eyGVE3V1K10z6OU6tsvlQn
	HzbqB+7z8iqwoD3wXPFFCDCeJkip3mbQuQ2emBGfpjVZEhEdTuNQ4bpulLULjXs+dGQXds
	/HQS8xoONUJo7Wvis0YGDshaSfkNS+tpOj6RlpV90szlA9BoJpMHG7GYJX9Djw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746716570;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Brs/dya36WaKp6oSWjhTQUh6KSjlDJ2bX84m4fPy6gg=;
	b=z+cJqS/PoUtG9vYGBRbfpW4kcjBN1mHEyNKiE7voYgPyefJB1/53FIsKEwomeX4aaVHgZk
	Ry89Ay8jxjTpPVCA==
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
Subject: [PATCH v1 3/9] x86/cpuid: Rename have_cpuid_p() to cpuid_feature()
Date: Thu,  8 May 2025 17:02:32 +0200
Message-ID: <20250508150240.172915-4-darwi@linutronix.de>
In-Reply-To: <20250508150240.172915-1-darwi@linutronix.de>
References: <20250508150240.172915-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to let all the APIs under <cpuid/api.h> have a shared "cpuid_"
namespace, rename have_cpuid_p() to cpuid_feature().

Adjust all call-sites accordingly.

Suggested-by: Ingo Molnar <mingo@kernel.org>
Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/cpuid/api.h     |  4 ++--
 arch/x86/kernel/cpu/common.c         | 10 +++++-----
 arch/x86/kernel/cpu/microcode/core.c |  2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/x86/include/asm/cpuid/api.h b/arch/x86/include/asm/cpuid/api.h
index ff8891a0b6c8..c0211fcdc706 100644
--- a/arch/x86/include/asm/cpuid/api.h
+++ b/arch/x86/include/asm/cpuid/api.h
@@ -14,9 +14,9 @@
  */
 
 #ifdef CONFIG_X86_32
-bool have_cpuid_p(void);
+bool cpuid_feature(void);
 #else
-static inline bool have_cpuid_p(void)
+static inline bool cpuid_feature(void)
 {
 	return true;
 }
diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 9f0f6dcb2f7d..def7af1dbd55 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -321,7 +321,7 @@ static int __init cachesize_setup(char *str)
 __setup("cachesize=", cachesize_setup);
 
 /* Probe for the CPUID instruction */
-bool have_cpuid_p(void)
+bool cpuid_feature(void)
 {
 	return flag_is_changeable_p(X86_EFLAGS_ID);
 }
@@ -1626,11 +1626,11 @@ static void __init early_identify_cpu(struct cpuinfo_x86 *c)
 	memset(&c->x86_capability, 0, sizeof(c->x86_capability));
 	c->extended_cpuid_level = 0;
 
-	if (!have_cpuid_p())
+	if (!cpuid_feature())
 		identify_cpu_without_cpuid(c);
 
 	/* cyrix could have cpuid enabled via c_identify()*/
-	if (have_cpuid_p()) {
+	if (cpuid_feature()) {
 		cpu_detect(c);
 		get_cpu_vendor(c);
 		intel_unlock_cpuid_leafs(c);
@@ -1790,11 +1790,11 @@ static void generic_identify(struct cpuinfo_x86 *c)
 {
 	c->extended_cpuid_level = 0;
 
-	if (!have_cpuid_p())
+	if (!cpuid_feature())
 		identify_cpu_without_cpuid(c);
 
 	/* cyrix could have cpuid enabled via c_identify()*/
-	if (!have_cpuid_p())
+	if (!cpuid_feature())
 		return;
 
 	cpu_detect(c);
diff --git a/arch/x86/kernel/cpu/microcode/core.c b/arch/x86/kernel/cpu/microcode/core.c
index b3658d11e7b6..1395fa72960f 100644
--- a/arch/x86/kernel/cpu/microcode/core.c
+++ b/arch/x86/kernel/cpu/microcode/core.c
@@ -125,7 +125,7 @@ void __init load_ucode_bsp(void)
 	unsigned int cpuid_1_eax;
 	bool intel = true;
 
-	if (!have_cpuid_p())
+	if (!cpuid_feature())
 		return;
 
 	cpuid_1_eax = native_cpuid_eax(1);
-- 
2.49.0

