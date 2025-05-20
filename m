Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819F23B280
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 01:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747703057; cv=none; b=PffT7arupiRafln1x0GW9BhzvfjWb4jsM/4qrc/xZn+lp73hnGaapzi6zQY52wR8czjaoM3Pcs9TYt9YUYNT0+Gx4YIS5KOjK8X8FCkM+huRi+bs64pB6vpBPj8P3a3Lg2dSBlyN67g4izJn0qXBcGalpCKk4gd2BpZcbwOUk+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747703057; c=relaxed/simple;
	bh=UIfoHPCdN4Kv8Cpq1eAuwa2uwqz+lUiXRtbxD76cja0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qXk1Wxuqkm2REm//GVSbe2HnNQ0feOHPovB3ogpuQF6RY0oQjlKCH6nwd5GRSSpXfwkoBaad+7Z2rI5AxiHZhoTh8aDW4/uNAyJ4iD5butPxsRm86atsx2wzda7zTrnM5COVO1mKh/1x1+0uLuSGPzlHDUOv403iuBeinJ5kE0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=shelob.surriel.com; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shelob.surriel.com
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@shelob.surriel.com>)
	id 1uHBOc-000000000aB-3VuI;
	Mon, 19 May 2025 21:03:54 -0400
From: Rik van Riel <riel@surriel.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	x86@kernel.org,
	kernel-team@meta.com,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	hpa@zytor.com,
	nadav.amit@gmail.com
Subject: [RFC v2 PATCH 0/9] Intel RAR TLB invalidation
Date: Mon, 19 May 2025 21:02:25 -0400
Message-ID: <20250520010350.1740223-1-riel@surriel.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: riel@surriel.com

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

RFC v2:
- Cleanups suggested by Ingo and Nadav (thank you)
- Basic RAR code seems to actually work now
- Kernel TLB flushes with RAR seem to work correctly
- User TLB flushes with RAR are still broken, with two symptoms:
  - The !is_lazy WARN_ON in leave_mm() is tripped
  - Random segfaults

