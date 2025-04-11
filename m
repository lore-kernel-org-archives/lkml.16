Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4816027E1B8
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 07:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744355060; cv=none; b=U0P0Qlfy7ZV1dFgee4vPWGwARmxsM1qHzLv4HUwVQHUAs7HEnPhP9m/C0k4TI9sT/224WrZaQH9WcJAFsVR+xd8sG0Yc0X2WU7D5FkqgZvNPZGVAH50yI/KlXCJ7z3Osay0UkwDmLhFG1OYA8FCZ5ayygzEDbwdqXn7LaNXU/D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744355060; c=relaxed/simple;
	bh=q2G+U8CaoptHtEtK3D5eWFTwp4B2DaR3+8vYx7hfQH4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gtB8Dc1xTOsUumZBWCpk3WAw2UipCt443Bo8yTInq0rRwP6u6YqF41yDOOiZN/ury8bbLqoIzipmsG9C49DlZJ5fH7CwLO4VCcFiP7MUymmEhMMNqzjHr3vQ36ECqaI9TCh12UpHbPtvdLRnHOdueirrYRYZDPsz8SwK33dQZaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xr5pAMQ+; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MsoBFBh0; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xr5pAMQ+";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MsoBFBh0"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744355057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=96NwC/14vz1WaxiPztrYCtku/XpQxqQSIQBLpHPku8c=;
	b=xr5pAMQ+Nrax1d3NltDi0V9OETjOB0MutyuYUc87lMSqUSkNJLWKRSoEYfYEe2Sdk3ejHP
	y42yTQynL6pMtZck4+yD0ttIJ7w4Vr0MMt+nkrnwzDQZQF6cE0osMsoj3mG6U84Z8lPzj5
	+UOO2n+laMTI/ASuRNQcqAugUto+4KH1rerBjkWbIk0fREjdEItWoE0VV+ryw49XIdq0Ov
	sBHR3L3txrJOrE7QpS9XJ40sw5JM8Qz2+NuiH/9chf3DEBN2PPeqggkU1TJvQx1Zxp8kWq
	uP8WYbCoi6l1Sxn5GTDIH4eD9zTtz6orUHjXZG6kR/q2CUx4BiJpTBl40BtIeg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744355057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=96NwC/14vz1WaxiPztrYCtku/XpQxqQSIQBLpHPku8c=;
	b=MsoBFBh0vu1cxAjY6/TJA2sgNLVS7E7KkTVArucqzi3tpXxhZmamd9GnIIY37ltQlgiD+W
	iwu5ChfMbpQKJJDw==
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
Subject: [PATCH v1 0/2] x86: CPUID refactorings: follow-up
Date: Fri, 11 Apr 2025 09:03:59 +0200
Message-ID: <20250411070401.1358760-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

These are minor post-mortem patches for the merged CPUID bugfixes and
refactorings at tip:x86/cpu.

The first removes a no-longer-used macro.

The second standardizes all instances of CPUID(N) to CPUID(0xN), as the
CPUID(0xN) style is now the standard in the upcoming cached CPUID model.
It is more concise than "CPUID leaf 0xN" as used in the previous patch
queues commit logs and aligns better with extended leaf references like
CPUID(0x80000005) and CPUID(0x8000001d).

Thanks,

8<-----

Ahmed S. Darwish (2):
  x86/cpuid: Remove obsolete CPUID(0x2) iteration macro
  x86/cacheinfo: Standardize header files and CPUID references

 arch/x86/include/asm/cpuid/leaf_0x2_api.h | 23 -----------------------
 arch/x86/kernel/cpu/cacheinfo.c           | 20 ++++++++++----------
 2 files changed, 10 insertions(+), 33 deletions(-)

base-commit: d02c83d75f9f76dda046edbd9f39b911427677c9
-- 
2.49.0

