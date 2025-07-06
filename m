Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19B0FBF0
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 08:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751790650; cv=none; b=AEhgGzJLXANxLgFIboFWUmAizMuen92QAdPwZe3lzXToB4IAQpmA+WSM7TZQiWzGIT2m3A4FuvBCLZb6u6xrpUxb3QBxW5sInDSUIf9p0IL7y8hctNE6srgKSENypaJgql/1tslyn/r820oRPPgD02UnQj9RV859aWF8TJyHNT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751790650; c=relaxed/simple;
	bh=ArJ7PveElx3Wr6Gl51JBH21PaM7qp5nCvfvSROX2Owg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GRstcIe2phvATBD/m573WE7SMuhBM+G1Sr4DEiBB6fo37xs5jBg2tpgQP5ieiKZKOlBu9dMtuX6VDD6WEHegf/fGo8lTzModRkjFPyxMoPGXBZjOrjDulh+ClMy5/1VIHgFtkmznEgFJfjaHXfC6nVbMRPy86tUUuuuz8osACRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=fail (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=C5BFEQeU reason="signature verification failed"; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="C5BFEQeU"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id D4B2240E019D;
	Sun,  6 Jul 2025 08:30:46 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id RyBTuq0y9EPs; Sun,  6 Jul 2025 08:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1751790642; bh=IfgpitmB0jLnCRobwzv/bHCTWf9mMvl5I41YPbGo8z0=;
	h=Date:From:To:Cc:Subject:From;
	b=C5BFEQeUAuPqw8McfAvgxa+/X/Twfg9+9f2OpKo9XogHvjOftobX5H1UDO0D2ujq9
	 g83+7TYMth7tQcuv6r9AqaGBD7RyIRImCqJXD+k7dcx39j+zX8RMD1QxLJVJngJ57O
	 ZvMZAW3YARtk5KHluwCxDNG3P8wcdI9AVs0CIYS7m9GrU4XJv1MwbP/Qlpk/lIkl9Q
	 YCzWeZ6R68qwLlRdNE76CPCPiyMw5xR/tHTQOJwRCVenHdok7IGMl6ApP2VlqXHJBS
	 REr9FCKgw3GaqhhcuTvL/nMt86o24VhtRszCqHIVDiSW2qKAXdN7VQCHZey909BbQW
	 q0RdVyU02z8BFomJYQOJhutX1Y2U13PplwUu8Bfgy9qUccbyV4o9Vgpf07D0CxU0Ia
	 c8KjA7ftepeyuWzixCV/Dea5GUZ7uINrvNVf1lCLdxddp4LIbBaVzbBfrzRid8pJhY
	 gBGlSWdNz+5Z4s5sVjgZIJhCwGpAYlrnIWzTg/qGuhT9B88LTtdnrlzvjFGyeKBrQp
	 mjPqaagJkkp+6nEHA4r/3hH2S5l7tCqfwieQjF++mqoOhtWVN4fDqGY/kC/P9q1FrA
	 xvUMPwhyLTbZmNaFMgwuVhCDqdTWXcCN4zRQX90l4F30tPeR3u6ftPMtlr2jatBVN9
	 zT2OKpBcxq88XqK6jEt8BtVM=
Received: from zn.tnic (p57969c58.dip0.t-ipconnect.de [87.150.156.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 67C9640E0184;
	Sun,  6 Jul 2025 08:30:39 +0000 (UTC)
Date: Sun, 6 Jul 2025 10:30:33 +0200
From: Borislav Petkov <bp@alien8.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: x86-ml <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sched/urgent for v6.16-rc5
Message-ID: <20250706083033.GAaGo0KbMDFzyQQLmR@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

please pull the sched/urgent lineup for v6.16-rc5.

Thx.

---

The following changes since commit d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81=
af:

  Linux 6.16-rc4 (2025-06-29 13:09:04 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/tip/tip tags/sch=
ed_urgent_for_v6.16_rc5

for you to fetch changes up to fc975cfb36393db1db517fbbe366e550bcdcff14:

  sched/deadline: Fix dl_server runtime calculation formula (2025-07-04 1=
0:35:56 +0200)

----------------------------------------------------------------
- Fix the calculation of the deadline server task's runtime as this misha=
p was
  preventing realtime tasks from running

- Avoid a race condition during migrate-swapping two tasks

- Fix the string reported for the "none" dynamic preemption option

----------------------------------------------------------------
Peter Zijlstra (1):
      sched/core: Fix migrate_swap() vs. hotplug

Thomas Wei=C3=9Fschuh (1):
      sched: Fix preemption string of preempt_dynamic_none

kuyo chang (1):
      sched/deadline: Fix dl_server runtime calculation formula

 kernel/sched/core.c     |  7 ++++++-
 kernel/sched/deadline.c | 10 +++++-----
 kernel/stop_machine.c   | 20 ++++++++++----------
 3 files changed, 21 insertions(+), 16 deletions(-)


--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
