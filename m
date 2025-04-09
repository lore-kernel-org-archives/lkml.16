Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A62210186
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 20:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744230564; cv=none; b=VY9ksI+dxsQm2Q/TPwDalUeE6Foxw7HpaNEvYC9E/RuV1rKttDmTnytzmvsSiAPMxw2KIAAWjhdxBv/uOIhWZ15o/XQs1WTWtBkKC9foxGEKwk4CJzib0uHXF69ZV446iSQaXJAI8Q3Xu+iSKlAaJquHfU2fu/y70ySE0SknMDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744230564; c=relaxed/simple;
	bh=VOiswpS5gNRvx+yW+6ZBedkymdZDgJEgqGT4JUQQiy8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SkyWA9KJGjsm+lncy5WZRaF4XNOQ4H7bwhYMxOVgmiGBfE8GYHsAiJlrqf1CvANITVu99GSG5vpcdq/HMHOrshAjEYu/2fM6JHLjsZQhUDwBx8l0h3RkclHY5bXtLaoW/HzujQXWtgRVBcCJreHp8T0dEBW/vsY2tdIJdLl4VSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gkhPoA9+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gkhPoA9+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 187E9C4CEE8;
	Wed,  9 Apr 2025 20:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744230562;
	bh=VOiswpS5gNRvx+yW+6ZBedkymdZDgJEgqGT4JUQQiy8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gkhPoA9+xuhur2D1HAgytixqpKyGVyXBsutSNvs7E2Y6rHJStwtbgEskL9OvIfD3o
	 urrJzi4PaMMqfDwhekl78JspzMbIAJPW5e6VSk7yhw+pJsScidffCIpRkOXUIdCURL
	 DvQ5iVV9Qks71WnG07qaZq/iuhfQHOB8tutAggYwnEhs0jL/swONBFoK0V6FFm8Csu
	 aVMWFg4k11VovoOgI2I6fU6RfINRt3Xmc9RR0quCIT2OTuHUNfmmbC8yiUueCvj8Tq
	 gaEMnx0s9hLRBk2jg0gkys6K91ggH0utvae10siu+7i1fFsxpXQKW7CfIsrGJyOkHV
	 HQxQcu1HWvvvQ==
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
Subject: [PATCH 02/20] x86/msr: Standardize on u64 in <asm/msr-index.h>
Date: Wed,  9 Apr 2025 22:28:49 +0200
Message-ID: <20250409202907.3419480-3-mingo@kernel.org>
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

Also fix some nearby whitespace damage while at it.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Juergen Gross <jgross@suse.com>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Dave Hansen <dave.hansen@intel.com>
Cc: Xin Li <xin@zytor.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
---
 arch/x86/include/asm/msr-index.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
index e6134ef2263d..e0d60805b869 100644
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@ -525,7 +525,7 @@
 #define MSR_HWP_CAPABILITIES		0x00000771
 #define MSR_HWP_REQUEST_PKG		0x00000772
 #define MSR_HWP_INTERRUPT		0x00000773
-#define MSR_HWP_REQUEST 		0x00000774
+#define MSR_HWP_REQUEST			0x00000774
 #define MSR_HWP_STATUS			0x00000777
 
 /* CPUID.6.EAX */
@@ -542,16 +542,16 @@
 #define HWP_LOWEST_PERF(x)		(((x) >> 24) & 0xff)
 
 /* IA32_HWP_REQUEST */
-#define HWP_MIN_PERF(x) 		(x & 0xff)
-#define HWP_MAX_PERF(x) 		((x & 0xff) << 8)
+#define HWP_MIN_PERF(x)			(x & 0xff)
+#define HWP_MAX_PERF(x)			((x & 0xff) << 8)
 #define HWP_DESIRED_PERF(x)		((x & 0xff) << 16)
-#define HWP_ENERGY_PERF_PREFERENCE(x)	(((unsigned long long) x & 0xff) << 24)
+#define HWP_ENERGY_PERF_PREFERENCE(x)	(((u64)x & 0xff) << 24)
 #define HWP_EPP_PERFORMANCE		0x00
 #define HWP_EPP_BALANCE_PERFORMANCE	0x80
 #define HWP_EPP_BALANCE_POWERSAVE	0xC0
 #define HWP_EPP_POWERSAVE		0xFF
-#define HWP_ACTIVITY_WINDOW(x)		((unsigned long long)(x & 0xff3) << 32)
-#define HWP_PACKAGE_CONTROL(x)		((unsigned long long)(x & 0x1) << 42)
+#define HWP_ACTIVITY_WINDOW(x)		((u64)(x & 0xff3) << 32)
+#define HWP_PACKAGE_CONTROL(x)		((u64)(x & 0x1) << 42)
 
 /* IA32_HWP_STATUS */
 #define HWP_GUARANTEED_CHANGE(x)	(x & 0x1)
-- 
2.45.2

