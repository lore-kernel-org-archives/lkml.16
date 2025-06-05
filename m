Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828311448D5
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 16:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749141363; cv=none; b=ROOHMSQ73zSj/XtFmcGwRH0IU+C9Uva31pR4iqP1q5CZRUULELLLBVwMugE0JjU0YSL5gfMVRkdyoLTcBFYSNbLlefQCpvSsOwv3jwnF42GfvDFIMCwv2M/hNk+I4PIgmWQ58cVf6QJxeRtyVeBdAzIKUzg8Sx5IqFph3KSMgbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749141363; c=relaxed/simple;
	bh=srworDs3xLSJq2OsR8FYUl6mcKbTLwwBJmc38/TtyWM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B6RZnutBqBTYvMl/pKbWoawr7ewvzSYiJQSYpcsKNIpy7YvTqb8BIiUYIP5LXbW++DSN6ogY4MUeMAIWJdkgt4VZq+apZaQnYbtRp3b5vvt4dksEhGwYI2TtYq+uERxS6I6EyUJHwosl7U4Gewtzwn9jIRCSU6fXjt6mF4e+3Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=hG3Lv4T6; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="hG3Lv4T6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=pRsIvecVNM6HLoO+rYQZHx/LDWUDxlxgTSJ/nFkyh4Q=; b=hG3Lv4T6ZcUf/F1PBim6xAKRFN
	VChRas21kmsfKSiNVfdbz+KtHMk1lKUGH0OPjzBcHstrpH7vGsKYWY52xpXaWPL1/pfM53b3jFIhe
	uZZlmzt8cI1ZpFOqjPzqYKeao7yNtQ3B3bx5W0BH1RiRgkBjIDraBd63WOXc7AuuwbM0YhiI1Fzf0
	z4ES1owVGJtG43mfAh/w4Ow6GOMvXTA3CoxTJAJKRo/Pm0vsn6SLrgBkQk2sYKBYzXxQ1Z3FBrR7a
	IE2TZbnyR9lJQe6s4WX4EMQ0OvA61AyXR2iT+1jmrJ5OkR7iFnW2Sjt1H4ofg3cHBKxR74yDcpa0O
	NDKPruHA==;
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@surriel.com>)
	id 1uNDZC-000000002qg-2rlx;
	Thu, 05 Jun 2025 12:35:46 -0400
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
	tglx@linutronix.de
Subject: [RFC PATCH v3 0/7] Intel RAR TLB invalidation
Date: Thu,  5 Jun 2025 12:35:09 -0400
Message-ID: <20250605163544.3852565-1-riel@surriel.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for IPI-less TLB invalidation
using Intel RAR technology.

Intel RAR differs from AMD INVLPGB in a few ways:
- RAR goes through (emulated?) APIC writes, not instructions
- RAR flushes go through a memory table with 64 entries
- RAR flushes can be targeted to a cpumask
- The RAR functionality must be set up at boot time before it can be used

The cpumask targeting has resulted in Intel RAR and AMD INVLPGB having
slightly different rules:
- Processes with dynamic ASIDs use IPI based shootdowns
- INVLPGB: processes with a global ASID 
   - always have the TLB up to date, on every CPU
   - never need to flush the TLB at context switch time
- RAR: processes with global ASIDs
   - have the TLB up to date on CPUs in the mm_cpumask
   - can skip a TLB flush at context switch time if the CPU is in the mm_cpumask
   - need to flush the TLB when scheduled on a cpu not in the mm_cpumask,
     in case it used to run there before and the TLB has stale entries

RAR functionality is present on Sapphire Rapids and newer CPUs.

Information about Intel RAR can be found in this whitepaper.

https://www.intel.com/content/dam/develop/external/us/en/documents/341431-remote-action-request-white-paper.pdf

This patch series is based off a 2019 patch series created by
Intel, with patches later in the series modified to fit into
the TLB flush code structure we have after AMD INVLPGB functionality
was integrated.

TODO:
- when flushing multiple CPUs anyway, use RAR to invalidate our own TLB
  (needs a chicken-egg issue with early boot solved)
- some sort of optimization to avoid sending RARs to CPUs in deeper
  idle states when they have init_mm loaded (flush when switching to init_mm?)

v3:
- move cpa_flush() change out of this patch series
- use MSR_IA32_CORE_CAPS definition, merge first two patches together
- move RAR initialization to early_init_intel()
- remove single-CPU "fast path" from smp_call_rar_many
- remove smp call table RAR entries, just do a direct call
- cleanups suggested (Ingo, Nadav, Dave, Thomas, Borislav, Sean)
- fix !CONFIG_SMP compile in Kconfig
- match RAR definitions to the names & numbers in the documentation
- the code seems to work now
v2:
- Cleanups suggested by Ingo and Nadav (thank you)
- Basic RAR code seems to actually work now.
- Kernel TLB flushes with RAR seem to work correctly.
- User TLB flushes with RAR are still broken, with two symptoms:
  - The !is_lazy WARN_ON in leave_mm() is tripped
  - Random segfaults.

