Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0914E3AE02A
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 00:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746492487; cv=none; b=TL6rU2Cm294ewIy1UcmTTpw07No0V4xiggcm7zVg1rI5Lv2I5RokVP2SsnhyXRnrU8QoQDAnUjCNzaVdd05BLvmGRv3YzHldLlHuSrUhKzBcQtLEV1jMA3s/us3zCuIp/ejWV+xmvba5vyfFhxMNxt65i/EcWidSbF9NrpcFCZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746492487; c=relaxed/simple;
	bh=I6AHPVPJ770usgMpjdF5XaUduLmPorK9XNl7ZIB872s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q+ogozNvrz/s5tOHqObHAovXLZPhZY2dXQQeVzt/Nn6fJg91xlr4s2FlaIJBUGqWpiYspZyU/LeWtjWUuAAfI/NmG1SV6XXexraxGO2SXB6a31usp3fU+ofjxu0AuUIjysnJuKfjX4tBpPm49lDuyA8JqlxFIHf55rY66NwDb+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=shelob.surriel.com; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shelob.surriel.com
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@shelob.surriel.com>)
	id 1uC6K6-000000000IF-32G6;
	Mon, 05 May 2025 20:38:14 -0400
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
	hpa@zytor.com
Subject: [RFC PATCH 0/9] Intel RAR TLB invalidation
Date: Mon,  5 May 2025 20:37:38 -0400
Message-ID: <20250506003811.92405-1-riel@surriel.com>
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

This first version of the code still has issues with segfaults
and kernel oopses. Clearly something is still wrong with how or
when flushes are done, but the code could use more eyeballs.

I have some idas for additional code cleanups as well, but would
like to get the last bugs sorted out first...

