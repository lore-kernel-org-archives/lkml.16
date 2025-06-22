Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52686BE5E
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 08:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750579729; cv=none; b=YBZxoSBT9aSfZt5awl6yGyjVaA924hYAogPccJSpr2aLHfQVtEF6VTL6Ep93UnX1+MckDJg8EPKEqhAZ+0eyKk0JiT0xF9GkQG2AvPaKXRPPmdCiVKlB2KoW7XV/v8reyiTzVCCT2ShqrPIlRkxeXvhHoLf+h5yJjXMNqmnSVOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750579729; c=relaxed/simple;
	bh=oraZKMhKFnTrByC9PEfJU+epeVCz2TWEwhi5iWC4RcY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s8fd+50f/tYZn8v9xGxu8xjOIlzMI1sD87rjiEuFr+m5De1G7CICWOGMBd6tKLovjYG/QViHg1Aa6JD2psrS8+/RT0KErirnYzruJEiuxpfCwLbCyxNcSJo/A2o3+SMifiaELA7Ffga+Xet43c4A79CgaTMzXhfDG2HSBwWl7l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=PtNDJheF; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="PtNDJheF"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 1931340E00DD;
	Sun, 22 Jun 2025 08:08:43 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id A6TzqSkVHyny; Sun, 22 Jun 2025 08:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1750579718; bh=vfx2iWOiJQF7i3Fp+4w5tdEeP8lgGoSh0qXfLPAZTZQ=;
	h=Date:From:To:Cc:Subject:From;
	b=PtNDJheF3IEGis5XUNobziUBEYXuTZ+WPQASCe0J5c3r8aj8kN7rtXnWe6xwySnmg
	 LpyxbXBu41giHsnKZs4wrS7gGgBbfMsBlyB8O6RhIqal9Tw0T1nEJUOKzJOKiKhZQT
	 r2G9hVG9j/oooMDVj/QXtqZytCGgK5FAVla6AggHWd5L/yGYlZ3/oskMRG0Gzp6wWo
	 0Kv1RX7fWyQekUqIgFge9axpYIpvC82D6kVgOc7NOmewwATJithwWC1grGdCsWm0q3
	 SHlTq5xcuzi7v4ikTNyFf2WlSBk3I/mOfrwB4XcPGtNzBX53ariLvKr6I7kGbLw0Fw
	 OhxO+e7lMUEQ5D1Yyj2hp8ZDJOMdtwgPQZ0j+ROr9Z4AX90xRgzMAS8MI9OymuoCsq
	 yoGymmb9tP8Hx62rDXapBl60LS5ZR0r1rJKMED9FBebBiLXUiw0+cpkQJd36Gj3KYd
	 iYmHIJ+NA/AlUiYCTjpWLTxcklXQ4VYIRvITAt+s+nYpxHE5shiyXrpMnyIbSILwF3
	 cB+mmPcfwCLgCImz06MChmgdC7aisJeuwjcaVHfkpIGopNXPQdoX7BkhJRAJ7pd2b9
	 REpBIVUH1JX/0m5wRbcfw7KSE0h9cbSIkPuAYapm91XZ8ZPnQXJ9ia5L5pYARXbkhN
	 9Tdcras/ahdYTHTvFcjVK6zY=
Received: from zn.tnic (p57969c58.dip0.t-ipconnect.de [87.150.156.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 817E140E0184;
	Sun, 22 Jun 2025 08:08:35 +0000 (UTC)
Date: Sun, 22 Jun 2025 10:08:28 +0200
From: Borislav Petkov <bp@alien8.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: x86-ml <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] locking/urgent for v6.16-rc3
Message-ID: <20250622080828.GAaFe5_CIOuHFwuUCF@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Linus,

please pull the locking/urgent lineup for v6.16-rc3.

Thx.

---

The following changes since commit ec7714e4947909190ffb3041a03311a975350fe0:

  Merge tag 'rust-6.16' of git://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux (2025-06-04 21:18:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip tags/locking_urgent_for_v6.16_rc3

for you to fetch changes up to 69a14d146f3b87819f3fb73ed5d1de3e1fa680c1:

  futex: Verify under the lock if hash can be replaced (2025-06-11 17:24:09 +0200)

----------------------------------------------------------------
- Make sure the switch to the global hash is requested always under a lock so
  that two threads requesting that simultaneously cannot get to inconsistent
  state

- Reject negative NUMA nodes earlier in the futex NUMA interface handling code

- Selftests fixes

----------------------------------------------------------------
Peter Zijlstra (1):
      futex: Handle invalid node numbers supplied by user

Sebastian Andrzej Siewior (3):
      selftests/futex: getopt() requires int as return value.
      selftests/futex: Set the home_node in futex_numa_mpol
      futex: Verify under the lock if hash can be replaced

 kernel/futex/core.c                                        | 14 ++++++++++++--
 tools/testing/selftests/futex/functional/futex_numa_mpol.c | 10 +++++++---
 tools/testing/selftests/futex/functional/futex_priv_hash.c |  2 +-
 3 files changed, 20 insertions(+), 6 deletions(-)


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
