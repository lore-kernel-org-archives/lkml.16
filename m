Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0ED530E85B
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 20:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750363976; cv=none; b=dKAE3kf671UUy92xL39EfMbK+oDsiNJ6FGQ/d19pd3s8DsFHWOmEL7dhcOWBZMzwYbZXa8ZLuJcmPytiVaPlb/7t2Izn6SFtRgDGBKmxfTnmcOejBfoAGLax+g1eXG+G/59zUfP6Q+2Y2AP+P+q50LPfKuXAvHn7cWkHz95MIkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750363976; c=relaxed/simple;
	bh=vJqOpRfEFOxglXhl7tPer259M+wEhce1XwXNOEYZ3U4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TI6EelOJZL0/dXJaqdVnspqC3dLKqJxSa/gYa6F17SUq4Bg5t//ZuV1O8m2MIyyKJvwQW56PybarbeqdAE5AgMKwioXkthLJzM2d63erPJO8dCiHlB8WuXSWKhwb5DZTFlmuLI3zFg6raTEfPiUhV1DZ23PmfUTPlkA3Ee7Tt38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=h8pm/2rQ; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="h8pm/2rQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=2ghVkX+BneMVW1Xa3WPejHCVzu9VXsW60NwhuGCLsyI=; b=h8pm/2rQhh2jbnMdVJMXnLfogX
	Vf2CGUoUsQ7Iv0meW9n/QzRE2YKCVyayYWWMrlUcVR+57ootafF/48e5mtsBZ5rJImgwakajcWoaw
	H29KegVtulJNtWVrG4wZ/GmmRiIAgcDwRkw2pq2oj3tIUsWCTUR2OclFAVYmZOQHpcaiZGrTv+G/4
	D88P6BKiBTtlAkzdEbNmTpUQNW+87WB75zXlQlyo9ew8ASsTG0mexv1+Rtj6P6obpZ9Gf/YBm+qth
	+h9QswaJi708wA2VC9yD3XPN8Xa6hO9B928eebPPSnytbxwonDDAoE7QRmo6XjZu9fcRGF79kfZJG
	7cHXHTLA==;
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@surriel.com>)
	id 1uSLV6-000000000CT-1DVx;
	Thu, 19 Jun 2025 16:04:44 -0400
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
	mingo@kernel.org
Subject: [RFC PATCH v4 0/8] Intel RAR TLB invalidation
Date: Thu, 19 Jun 2025 16:03:52 -0400
Message-ID: <20250619200442.1694583-1-riel@surriel.com>
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
- some sort of optimization to avoid sending RARs to CPUs in deeper
  idle states when they have init_mm loaded (flush when switching to init_mm?)

v4:
- remove chicken/egg problem that made it impossible to use RAR early
  in bootup, now RAR can be used to flush the local TLB (but it's broken?)
- always flush other CPUs with RAR, no more periodic flush_tlb_func
- separate, simplified cpumask trimming code
- attempt to use RAR to flush the local TLB, which should work
  according to the documentation
- add a DEBUG patch to flush the local TLB with RAR and again locally,
  may need some help from Intel to figure out why this makes a difference
- memory dumps of rar_payload[] suggest we are sending valid RARs
- receiving CPUs set the status from RAR_PENDING to RAR_SUCCESS
- unclear whether the TLB is actually flushed correctly :(
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

