Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4A545BE3
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 01:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738285646; cv=none; b=DmsgtacbYVVA853EgJa6LAQuXVQQbFZrAPMc7Qu1bEkdVs6aJiohMB+ezBzBKW+wkxhnZKiaLQUhIxbGBcmMPzK8GmTkUWIyQe1yBCZzWaISmR+altKlsvWt7eZFfhTw8zDhsmZCINfVcJ09Rl8xMfVd63U/utjD27zadw7k/JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738285646; c=relaxed/simple;
	bh=+7IdRtAgvETSYKgiufYxprCEuNa1bqjk/oCFp9BzVJc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=AP31p47928pb8/aa4ZLmFYhlvk0TRWaEMoSwhn4KJ2190rDb+nTv5hreE6RO7OwQzm3ZMADTvb/hOySy/uxbBDw7A59uIm7IVfcluBb7mlLi6ztRVpgx15cEx6lCjvQqHJKkmAs+++yi8YrDzmyvT3CSSBY+0S2eg1tAX5XbXFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kR5py71y; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kR5py71y"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ef6ef9ba3fso2843838a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 17:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738285645; x=1738890445; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fy7bg8EETE392HuVNTlpZ3+nQUkioeYxYXPabwBQMYo=;
        b=kR5py71y8IJijHLh1FnbeF80JGdz0s/J3cq+foE0+p3cXQ76bkRV/NzSo/Xt99ZkLt
         GXMLbpfxDvkzLAJ7WvoLgeZ1tMkRvz80qwFMwv9IgykgCLqrzojVYMR6u7eXr725BmSH
         MZV75Tp+wcAw+ze/9rbyqAJVihz4UKn10CiXBwhVurcd+X9D30R3u9AM9WGqCnufAyO4
         ZFlBTblvRmIHcb5+NiSUawezzYXG690Ce5HEa3gXGoGcPWJF8HK9QQdMvocqoPRNN6LU
         1XbUS1nD+P0ER1hNhulGmmTATZsh/cQNIBuGIvI5MSbXwx1QS2KS3AeiI+yhFZn6Ci3V
         juGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738285645; x=1738890445;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fy7bg8EETE392HuVNTlpZ3+nQUkioeYxYXPabwBQMYo=;
        b=rcNVZfQryH5bvQ84JS9zQh57dk3Tr9GBnRHwDHe+ITRu7HlABPg3uKFfpNDkfcJpzO
         h00FUzo7uk4reUFfNDJFF1hBr+lL14F3rFSQJ/bRybsD6RRfX5/UErqncnYxeL0ZP43J
         c8vPhu1EysBM6gGHqgMrW18s/8D2NV7HdGe/O0Y8GIy6+EsPxQDzW77PErvGtVleHCiN
         ZMv8WJrFMV26zpH6cc+PEbAoped/3Mz/M0CrhwR8oUzcK4xn+ykU5dungbpwR9zTzyNn
         YgbBmRQkw2+5TyvLxQI1JPLCRMI+TS5+W/ImUqtuATXilTM0Fz0cqv1cCiSGJqoI3Cw1
         IngA==
X-Forwarded-Encrypted: i=1; AJvYcCWYSZPKAk7xuRjJpuqw0N1DlWRygwhShJu42I7uZY9cAgURJoXSsXGeb4j4vrn1H9HiAwldgIuNDXIx5uY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEitp1c4VptNf3X7aCn3bG1eFTjc6a1pBgDf6r510kkbGk59Ao
	fFgTXxyb5fHx6cHDMu+dys9DGVv8QCJq3BuN5+zgHk9E7jDiJQ9us+FgSHf7x2/ZflwKH8zbyoY
	ijQ==
X-Google-Smtp-Source: AGHT+IF1BNjYxjRBdic3EsMUw3LnVZh5PgBgpydEPWZ4u388Z/jGMXftglmcQ1LhMQO6p4J62ZYaHJzh7no=
X-Received: from pfam19.prod.google.com ([2002:aa7:8a13:0:b0:72f:cbb1:275d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4f8c:b0:728:927b:7de2
 with SMTP id d2e1a72fcca58-72fd0be829amr15451790b3a.8.1738285644816; Thu, 30
 Jan 2025 17:07:24 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 30 Jan 2025 17:07:21 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250131010721.470503-1-seanjc@google.com>
Subject: [PATCH] perf/x86/intel: Ensure LBRs are disabled when a CPU is starting
From: Sean Christopherson <seanjc@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Maxim Levitsky <mlevitsk@redhat.com>, Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"

Explicitly clear DEBUGCTL.LBR when a CPU is starting, prior to purging the
LBR MSRs themselves, as at least one system has been found to transfer
control to the kernel with LBRs enabled (it's unclear whether it's a BIOS
flaw or a CPU goof).  Because the kernel preserves the original DEBUGCTL,
even when toggling LBRs, leaving DEBUGCTL.LBR as is results in running
with LBRs enabled at all times.

Reported-by: Maxim Levitsky <mlevitsk@redhat.com>
Closes: https://lore.kernel.org/all/c9d8269bff69f6359731d758e3b1135dedd7cc61.camel@redhat.com
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
Cc: stable@vger.kernel.org
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/events/intel/core.c     | 5 ++++-
 arch/x86/include/asm/msr-index.h | 3 ++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
index e76e892f44cd..efd069bc9c28 100644
--- a/arch/x86/events/intel/core.c
+++ b/arch/x86/events/intel/core.c
@@ -5038,8 +5038,11 @@ static void intel_pmu_cpu_starting(int cpu)
 
 	init_debug_store_on_cpu(cpu);
 	/*
-	 * Deal with CPUs that don't clear their LBRs on power-up.
+	 * Deal with CPUs that don't clear their LBRs on power-up, and that may
+	 * even boot with LBRs enabled.
 	 */
+	if (!static_cpu_has(X86_FEATURE_ARCH_LBR) && x86_pmu.lbr_nr)
+		msr_clear_bit(MSR_IA32_DEBUGCTLMSR, DEBUGCTLMSR_LBR_BIT);
 	intel_pmu_lbr_reset();
 
 	cpuc->lbr_sel = NULL;
diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
index 3ae84c3b8e6d..61e991507353 100644
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@ -395,7 +395,8 @@
 #define MSR_IA32_PASID_VALID		BIT_ULL(31)
 
 /* DEBUGCTLMSR bits (others vary by model): */
-#define DEBUGCTLMSR_LBR			(1UL <<  0) /* last branch recording */
+#define DEBUGCTLMSR_LBR_BIT		0	     /* last branch recording */
+#define DEBUGCTLMSR_LBR			(1UL <<  DEBUGCTLMSR_LBR_BIT)
 #define DEBUGCTLMSR_BTF_SHIFT		1
 #define DEBUGCTLMSR_BTF			(1UL <<  1) /* single-step on branches */
 #define DEBUGCTLMSR_BUS_LOCK_DETECT	(1UL <<  2)

base-commit: b709eb872e19a19607bbb6d2975bc264d59735cf
-- 
2.48.1.362.g079036d154-goog

