Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D256A28003E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 19:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749151493; cv=none; b=b7LWMzzCqloiHW+s5ieuGQ/Cpx8++2V20xF5PLb2Gn5ZuPdubB5dxjQE/idHDn1j28EX5CmSw8JueIO4+2a+QtN/pwffVdcTaU7SwuGJ0/8Dm/NHzLr54Onx6Oug6BL4P1x9rqr7yU5zEWAgfzQIt9N/nkyXrLJvoMINExfJW8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749151493; c=relaxed/simple;
	bh=/wOOh7ifW5jvQsoVt3Obs+KAAOm7odpeTZYOfRwXtrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c0ROLAbPB6YyZpiUPFG3W839PeHf68CmbrlpNu9+qVpmOl44AqzHOJFwu2CS8YgOoxeOpn3A05pSZmja/iAdBG1+Yd1HD8EO/O0K2NXD7XJbG6Son9otHoe4MiXQcLLua3kYpUC4TylOkkY4ZsM5pGujBA+PXpQmiNdGN0U5Kg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hOjE5B1c; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=FsYzTRpH; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hOjE5B1c";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="FsYzTRpH"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749151490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1S6VKHOLNXsAhJzB2QvGwtufLwN+0p9p7ZPBpXEN1Zw=;
	b=hOjE5B1clnRwsGZBA3gD3kyfYbtl6nngm0BqPMdIcTq8NquowypjxxcVWm7aU8oWG5+qPc
	VZ9unzHfDrV7zHgiulEqp3zSCv529/9IR4hkhhuof441HSsf9utebbKABeiJZd63jM6gLh
	/h4OKZP/MrRyiD3Y1YYjeVaTKdWNX6hxLQnPIoDtmD3PuEM8N2jDISjTQX3dOdwcNupunk
	yxUdOMC5+CWce2pkHblpF7XEWzQuMYBcBlQVGmV+EEyNpUekwEmep1BYgojh/OgjIRUNan
	5Lve5ydEvNybs4sRPqM8OIipEVt5xsiblAzdCwqsBLqnVB2MKLsUK4RHOcnKww==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749151490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1S6VKHOLNXsAhJzB2QvGwtufLwN+0p9p7ZPBpXEN1Zw=;
	b=FsYzTRpHqK0v3E0hX2VlOMngnXA8DQQbOLb8M8gUuKmoJkxM7OVKLouX4u/t9K+jNLmp6O
	XTYtmiTO3mHuJCDg==
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
Subject: [PATCH v2 13/27] x86/cpuid: Warn once on invalid CPUID(0x2) iteration count
Date: Thu,  5 Jun 2025 21:23:42 +0200
Message-ID: <20250605192356.82250-14-darwi@linutronix.de>
In-Reply-To: <20250605192356.82250-1-darwi@linutronix.de>
References: <20250605192356.82250-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CPUID(0x2) output includes an "query count" byte where it was
supposed to specify the number of CPUID(0x2) subleaf 0 queries needed to
extract all of the CPU's cache and TLB descriptors.

Per current Intel manuals, all CPUs supporting this leaf "will always"
return an iteration count of 1.

Since the CPUID parser ignores any CPUID(0x2) output with an invalid
iteration counts warn about this once at the kernel log.

Do not emit a warning if any of the CPUID(0x2) output registers EAX->EDX,
or even all of them, are invalid; i.e., their most significant bit is
set.  Such a case is architecturally defined and legitimate.

References: b5969494c8d8 ("x86/cpu: Remove CPUID leaf 0x2 parsing loop")
Suggested-by: Ingo Molnar <mingo@kernel.org>
Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
Link: https://lore.kernel.org/lkml/aBnmy_Bmf-H0wxqz@gmail.com
---
 arch/x86/kernel/cpu/cpuid_parser.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/cpuid_parser.c b/arch/x86/kernel/cpu/cpuid_parser.c
index ab06c68e4453..4b960b23cab4 100644
--- a/arch/x86/kernel/cpu/cpuid_parser.c
+++ b/arch/x86/kernel/cpu/cpuid_parser.c
@@ -3,6 +3,8 @@
  * Centralized CPUID parser (for populating the system's CPUID tables.)
  */
 
+#define pr_fmt(fmt) "x86/cpuid: " fmt
+
 #include <linux/init.h>
 #include <linux/kernel.h>
 
@@ -33,8 +35,11 @@ static void cpuid_read_0x2(const struct cpuid_parse_entry *e, struct cpuid_read_
 	 * bogus hardware, keep the leaf marked as invalid at the CPUID table.
 	 */
 	cpuid_read_subleaf(e->leaf, e->subleaf, l2);
-	if (l2->iteration_count != 0x01)
+	if (l2->iteration_count != 0x01) {
+		pr_warn_once("Ignoring CPUID(0x2) due to invalid iteration count = %d",
+			     l2->iteration_count);
 		return;
+	}
 
 	/*
 	 * The most significant bit (MSB) of each register must be clear.
-- 
2.49.0

