Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBEF214818
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 20:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744230571; cv=none; b=YDPIY7lKMHgm+o3NHG33dLW59jBJ2tw+1SESt3gYEJC4a8qnqB7xOTFtAqlIr4IrCs8dBScL82A7/gfR1PJOAdv35Vpo32JdwfW/HogDwVxpF4KYxx2XgVfE/BgkgwvHNLV5AM1Ytupb2yTmkurFP2XPOTQeta6JtmMH1NvmMqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744230571; c=relaxed/simple;
	bh=pcdFfqfrcfGZJnWA/SNftQEqbPDQX9Zmdn9ZV6SxDfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jjE/R7pBkFTBimXazVmurOtCtgCbaYglWpm38D+/QGsm6GgHEbZG+QHyn6j1e7HUOncc2zUVYehK8k2Vu9fbgDGTUggREkGW7uPgiRZ1UBZNbyuKnheoTezDo9LGG+yZrDlacLOTYoxXuXNTe82UwC9OiRFYDtjsSgBwVPowLEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G5qn5T4h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G5qn5T4h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 625CFC4CEEA;
	Wed,  9 Apr 2025 20:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744230570;
	bh=pcdFfqfrcfGZJnWA/SNftQEqbPDQX9Zmdn9ZV6SxDfQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G5qn5T4hO42WFbyhj3gsJ/5y3m5dAurJHuWqR0MqdVVuC7sIgX8FnENBfiSNbFX4M
	 LoHofXoZjO5rcQxZwUBre8anvkofdmc+ku3ixn6l4ZIrDpOYBoO22QGmcFdNInbhiY
	 t/GMh9K3nIVa1sN8l/l0gu8+KPNho1vZYYnrn42RWa2qgMof7ZyIedTLgFshM57Wky
	 kmKQlLjp5cuwWcZk2GJTxdPoilBnoqaj7VzgpceRZyGKhYFj5XVYemIqNkKLOaUI53
	 a1RdVqLEtJA5jDsGpzs6nqGKyFVeMOberDQIzgEYWRLcCgQ0UIH4vvMIYv3xrQe9U6
	 usx2DHBUr4XAA==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Dave Hansen <dave.hansen@intel.com>,
	Xin Li <xin@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 05/20] x86/msr: Harmonize the prototype and definition of do_trace_rdpmc()
Date: Wed,  9 Apr 2025 22:28:52 +0200
Message-ID: <20250409202907.3419480-6-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250409202907.3419480-1-mingo@kernel.org>
References: <20250409202907.3419480-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In <asm/msr.h> the first parameter of do_trace_rdpmc() is named 'msr':

   extern void do_trace_rdpmc(unsigned int msr, u64 val, int failed);

But in the definition it's 'counter':

   void do_trace_rdpmc(unsigned counter, u64 val, int failed)

Use 'msr' in both cases, and change the type to u32.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Juergen Gross <jgross@suse.com>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Dave Hansen <dave.hansen@intel.com>
Cc: Xin Li <xin@zytor.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
---
 arch/x86/include/asm/msr.h | 4 ++--
 arch/x86/lib/msr.c         | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
index 8ee6fc633476..ec5c873a83a1 100644
--- a/arch/x86/include/asm/msr.h
+++ b/arch/x86/include/asm/msr.h
@@ -65,11 +65,11 @@ DECLARE_TRACEPOINT(write_msr);
 DECLARE_TRACEPOINT(rdpmc);
 extern void do_trace_write_msr(unsigned int msr, u64 val, int failed);
 extern void do_trace_read_msr(unsigned int msr, u64 val, int failed);
-extern void do_trace_rdpmc(unsigned int msr, u64 val, int failed);
+extern void do_trace_rdpmc(u32 msr, u64 val, int failed);
 #else
 static inline void do_trace_write_msr(unsigned int msr, u64 val, int failed) {}
 static inline void do_trace_read_msr(unsigned int msr, u64 val, int failed) {}
-static inline void do_trace_rdpmc(unsigned int msr, u64 val, int failed) {}
+static inline void do_trace_rdpmc(u32 msr, u64 val, int failed) {}
 #endif
 
 /*
diff --git a/arch/x86/lib/msr.c b/arch/x86/lib/msr.c
index 5a18ecc04a6c..20f5c36e5fde 100644
--- a/arch/x86/lib/msr.c
+++ b/arch/x86/lib/msr.c
@@ -136,9 +136,9 @@ void do_trace_read_msr(unsigned int msr, u64 val, int failed)
 EXPORT_SYMBOL(do_trace_read_msr);
 EXPORT_TRACEPOINT_SYMBOL(read_msr);
 
-void do_trace_rdpmc(unsigned counter, u64 val, int failed)
+void do_trace_rdpmc(u32 msr, u64 val, int failed)
 {
-	trace_rdpmc(counter, val, failed);
+	trace_rdpmc(msr, val, failed);
 }
 EXPORT_SYMBOL(do_trace_rdpmc);
 EXPORT_TRACEPOINT_SYMBOL(rdpmc);
-- 
2.45.2

