Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412721AC44D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 17:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749229891; cv=none; b=VCfdPQBFyirTewy98+opF8MTVbZdXNt7AgXpP+tGxVSfBDjBpmkrhEs8T8PRLzAjQ56ulKBCbdkBNu2766fCngCnOzsObnPFqj82ju2w2FXQYzgTmoCZgR9pq5e4VFA3KHhyiXanxcF3n6TJgYSxGdo2prnp1LqfRC8FuIJbxbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749229891; c=relaxed/simple;
	bh=I8tmsVTo0MQcJjiMlM942Vive3o2UFjS72ccCIhVkks=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SwOyx91zOydAyryAwJ/2UqoP0K0h2savd6cLRjdcEtKoR4PUMv5PEB9sT7ZDjaOWzE2FGWyK4Id5ZUWZ4tLGZRhPnivzX5J50/iX4KTVjl3w1pXfSvdOfJQNkodeErKwnQ/dPzzSiVsO86lb0DsopqbdSvutXc2tzlxVJDiUxQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=FUi9HQ5z; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="FUi9HQ5z"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ZwYBv8sNTbOxmlxA4VDVgq6hefWE68MVO+zvxO/w0ms=; b=FUi9HQ5z/zez9imie9XR5M/FG8
	avA39tFHpDmMhHdWmDpPhm73KMxhyL8EfYwh96AZJcgZYtQrk6SC7RmNXKdiFdn5OAXttzbYfBq5N
	mqt5iIIVMeN2eT9AmVGbCv8botRwKlwm5Exn6mNfDepk98p8o8Xmzjnv7x05dGzVDcKJLXa3pqjhN
	SKbSNE47yQs/CpAnTpc2JelIZpgeHeXt8lQZReyK4XoQqbuhbAdbmW3ff7+O/zsRzngv/guL7B36p
	MaGcnBRO2ufLSYIj5Itiiu5NfvuQj3LKKzqw8u3JlrA7XDuSwgwUjkWhA9Co3YD1e9cWnjdUVSZMa
	l4nvKy9A==;
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@surriel.com>)
	id 1uNab3-000000006Se-1izx;
	Fri, 06 Jun 2025 13:11:13 -0400
From: Rik van Riel <riel@surriel.com>
To: linux-kernel@vger.kernel.org
Cc: kernel-team@meta.com,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	bp@alien8.de,
	x86@kernel.org,
	nadav.amit@gmail.com,
	seanjc@google.com,
	tglx@linutronix.de,
	mingo@kernel.org,
	Rik van Riel <riel@surriel.com>,
	stable@kernel.org
Subject: [PATCH v2 2/3] x86/mm: Fix early boot use of INVPLGB
Date: Fri,  6 Jun 2025 13:10:34 -0400
Message-ID: <20250606171112.4013261-3-riel@surriel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250606171112.4013261-1-riel@surriel.com>
References: <20250606171112.4013261-1-riel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The INVLPGB instruction has limits on how many pages it can invalidate
at once. That limit is enumerated in CPUID, read by the kernel, and
stored in 'invpgb_count_max'. Ranged invalidation, like
invlpgb_kernel_range_flush() break up their invalidations so
that they do not exceed the limit.

However, early boot code currently attempts to do ranged
invalidation before populating 'invlpgb_count_max'. There is a
for loop which is basically:

	for (...; addr < end; addr += invlpgb_count_max*PAGE_SIZE)

If invlpgb_kernel_range_flush is called before the kernel has read
the value of invlpgb_count_max from the hardware, the normally
bounded loop can become an infinite loop if invlpgb_count_max is
initialized to zero.

Fix that issue by initializing invlpgb_count_max to 1.

This way INVPLGB at early boot time will be a little bit slower
than normal (with initialized invplgb_count_max), and not an
instant hang at bootup time.

Signed-off-by: Rik van Riel <riel@surriel.com>
Fixes: b7aa05cbdc52 ("x86/mm: Add INVLPGB support code")
Cc: stable@kernel.org
---
 arch/x86/kernel/cpu/amd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
index 93da466dfe2c..b2ad8d13211a 100644
--- a/arch/x86/kernel/cpu/amd.c
+++ b/arch/x86/kernel/cpu/amd.c
@@ -31,7 +31,7 @@
 
 #include "cpu.h"
 
-u16 invlpgb_count_max __ro_after_init;
+u16 invlpgb_count_max __ro_after_init = 1;
 
 static inline int rdmsrq_amd_safe(unsigned msr, u64 *p)
 {
-- 
2.49.0

