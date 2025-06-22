Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCF64A28
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 08:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750580668; cv=none; b=q7kpd5t9DQoKMyouYj2VBsWliOIgI/E/2w5JToN2cQiNiroWpCsP/uITrA1Gr+gvur5RILhqRNaJF1XJF+usqHegIFTI0G2fsawHRUvE7Ph05r/hXJ1ck7lgkxXrf44DOoq5PcI61TyjSlWHMl2AtZl3rk88NTFrJ1D5EPWyd6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750580668; c=relaxed/simple;
	bh=Grt8mN1TKSzi8rAhkfnmf8xHrtUj6Y1vgyjrOSxhNSM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qcrtWJHLD1heQ82WQh4MzAXoU3PSWRBC/+Dw/OLsLtij3rlhQEVnFJAPDS7ROUeSU08kSdausBl7nGYA/hAPhD4NOvyEDpBZB+Fme3PNyWo8oy5/3Q0+BX8gBENBRNyXodtlSG0UiSoeBsEBv1TZ/01BFF7w/p+wUs90v6OhxU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=JbOZWK5W; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="JbOZWK5W"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 32D9D40E0184;
	Sun, 22 Jun 2025 08:24:23 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id txHO_ivSaDxP; Sun, 22 Jun 2025 08:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1750580660; bh=6AYERST4POFo73ix9amho6XCOJ8zdRXGxj4RZacDZ6Y=;
	h=Date:From:To:Cc:Subject:From;
	b=JbOZWK5WfPfZIPt9AC4XOhnQrw/HfuTMe/BlL7Ls/jQLfTYYh0IspR3OwFLfbSZH1
	 EMrzMSiYWWFtAfGItVnFqV/BjadVar8VDFo6FR9KfiKg4qngkBMgslueYAycbH9vAz
	 8C4B31l6Dh5nlD3gayga/mTIIJ9aae7vkRrx5D0411NyPL8rIjj8gTU4Z8sTO4JmiF
	 DbBMnMzAzzE/08O9WFM5C6GC2g4f9vOTK+fR4hyKt6kLfg5WufeG64ArO9FXvz5fxM
	 OSBCEIzuLgJtMHu6yHkeo9ZJykb4ckYkLZqD08Kv2XjGOacJ1+BOZkXBhqTEgJEM/+
	 27Coz5G7D7QVvDb3yScJnnsWm3aNKTsVo7+cRlU9iBQZ/w6zmss77R4cLVeX3aqR7M
	 GjHs9T/Ukn3geC6EnkrZ3cfEqV9Od0jzSGm2j1JHpvKcfC2x9HNyyrIhGILYgNR9fo
	 fVaCNitHtX8SipoYmsrSd6lKQhPTqeE8kq1Wz7a5ILR9huG6G7CCWoClTi/72o5vHn
	 Yp4FOj8rNHPulamNYXNZEyEDHaEN/Q/4MHVC0eNyn3fSt6YvOV/bt2W32C68Y8rs60
	 s2/vkkHHKjT6BQFTrPA31HucNSEF4PxG17zRfCy2HoqEz9bV49fCh74oSuTVb+7HYd
	 Q0qUBF+nx2mflnb5pCMWJj/A=
Received: from zn.tnic (p57969c58.dip0.t-ipconnect.de [87.150.156.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id D6B2440E015D;
	Sun, 22 Jun 2025 08:24:16 +0000 (UTC)
Date: Sun, 22 Jun 2025 10:24:10 +0200
From: Borislav Petkov <bp@alien8.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: x86-ml <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] perf/urgent for v6.16-rc3
Message-ID: <20250622082410.GAaFe9qrdzd8fnFnMg@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Linus,

please pull the perf/urgent lineup for v6.16-rc3.

Thx.

---

The following changes since commit 86aa94cd50b138be0dd872b0779fa3036e641881:

  perf/x86/intel: Fix incorrect MSR index calculations in intel_pmu_config_acr() (2025-05-31 10:05:16 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip tags/perf_urgent_for_v6.16_rc3

for you to fetch changes up to b0823d5fbacb1c551d793cbfe7af24e0d1fa45ed:

  perf/x86/intel: Fix crash in icl_update_topdown_event() (2025-06-13 09:38:06 +0200)

----------------------------------------------------------------
- Avoid a crash on a heterogeneous machine where not all cores support the
  same hw events features

- Avoid a deadlock when throttling events

- Document the perf event states more

- Make sure a number of perf paths switching off or rescheduling events call
  perf_cgroup_event_disable()

- Make sure perf does task sampling before its userspace mapping is torn down,
  and not after

----------------------------------------------------------------
Kan Liang (2):
      perf: Fix the throttle error of some clock events
      perf/x86/intel: Fix crash in icl_update_topdown_event()

Luo Gengkun (1):
      perf/core: Fix WARN in perf_cgroup_switch()

Peter Zijlstra (3):
      perf: Fix sample vs do_exit()
      perf: Fix cgroup state vs ERROR
      perf: Add comment to enum perf_event_state

Yeoreum Yun (1):
      perf: Fix dangling cgroup pointer in cpuctx

 arch/x86/events/intel/core.c |   2 +-
 include/linux/perf_event.h   |  42 +++++++++++++++-
 kernel/events/core.c         | 116 +++++++++++++++++++++++++++----------------
 kernel/exit.c                |  17 ++++---
 4 files changed, 124 insertions(+), 53 deletions(-)


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
