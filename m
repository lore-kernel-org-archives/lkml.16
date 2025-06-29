Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9460478F4A
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 08:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751187004; cv=none; b=ABGXl+zpPxG1UO/MsBb8bCKInodjXwbIIB8NzlonaAcOX2ZjnqVdgJXlgqNtJBGmsHfuDDayRalPdhjmihq18eQlMkQkWlygL2oeNvNKoBAnWob+IWY7yNHDEY/O7DOroly4F0MKZP+gCHQvYrg7fZoxdtYBXhsrbqsO+oLrqg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751187004; c=relaxed/simple;
	bh=p7ryK8qS1laqTOOKrVA8iL/QWVYbfWZmky6TsrRQslQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mihkMaOX14rf6h29e21yHtUwOo9o4p4AvLbR8ZBvoSPxXmyJo9d+rnxpzi86qTbHWkkQW0wnJun9HpZzBxD2Dca5XFfAq5JDMzn1JfdNkt6EIehiPE4xV/EPDv5Faju3Z7zobZjRGtfsW7sS6IaHGpz0oRi67GldDfpYpa+7Eio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=aoBQxmd3; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="aoBQxmd3"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 9858640E0198;
	Sun, 29 Jun 2025 08:50:00 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id lmND_zg0tCam; Sun, 29 Jun 2025 08:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1751186997; bh=F7rm92ZWerKdhUL4+Hg/qw+uorETxgmeEov2q7V5k50=;
	h=Date:From:To:Cc:Subject:From;
	b=aoBQxmd3SQwLV0Uk0SYph3M2tvOafDlWXk3imnIEtqM3gOgckL4E0/gAaP4/wTbVF
	 nwoXej/3UsjRvopCizsUuSmeXwQFQocdigycE/DXAgNcqeh18foPOC0k726EksynnP
	 re4z8CWtd1mxyssg1zwXjKfIavfXegSUIA7pDrStLiCAwwdhMdYBGr/RLXwHKNbPhu
	 uRYePY6zdLtXUxj8Jp+pPunTDQDhfBJQycdRCdAHc/hVadQPcWyYlpXG79tvxLvlTS
	 7X99KFZxBci/IrPSdLYa26Tno8G8u6UpdGQzmlaC7QBoNUWwq+gafSwSyikiYcs5nm
	 uD8IcT2r6aja+D9AILCw4v0PBcmkLNb1u3uqoGH3xhz2LaprlNM89hUM4t/Jh1r1lf
	 zNniDAV8/GIE4qo5NhwxtUbMe765v2yUGJpCseaDWcYSt/zgeYkRYJmNV9ECs5/l/o
	 yBN59MKQF05Qxwu8jT9eEomExFvIUDL25YUk4npTvzi5SP02mwnhh1dqy5SUSUeG0s
	 3JiUHxZ1gb56aRb+NIxnNPvhZo8pdh5cl56q07BryT+Aa70G9U/YsIFPhbre9cl5eJ
	 mwx9SD4jBHRpG2XGxdvuFlycAPInmVmSHEl28/QE3vuCDJvp3uM3uY+pz2LPDOMSZ+
	 okhcFgoZLJaJXbRNEmQn0K7c=
Received: from zn.tnic (p57969c58.dip0.t-ipconnect.de [87.150.156.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 4197B40E00DA;
	Sun, 29 Jun 2025 08:49:54 +0000 (UTC)
Date: Sun, 29 Jun 2025 10:49:53 +0200
From: Borislav Petkov <bp@alien8.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: x86-ml <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] perf/urgent for v6.16-rc4
Message-ID: <20250629084953.GAaGD-MUAKHnWlFNiW@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Linus,

please pull a perf/urgent fix for v6.16-rc4.

Thx.

---

The following changes since commit 86731a2a651e58953fc949573895f2fa6d456841:

  Linux 6.16-rc3 (2025-06-22 13:30:08 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/tip/tip tags/perf_urgent_for_v6.16_rc4

for you to fetch changes up to 1476b218327b89bbb64c14619a2d34f0c320f2c3:

  perf/aux: Fix pending disable flow when the AUX ring buffer overruns (2025-06-26 10:50:37 +0200)

----------------------------------------------------------------
- Make sure an AUX perf event is really disabled when it overruns

----------------------------------------------------------------
Leo Yan (1):
      perf/aux: Fix pending disable flow when the AUX ring buffer overruns

 kernel/events/core.c        | 6 +++---
 kernel/events/ring_buffer.c | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
