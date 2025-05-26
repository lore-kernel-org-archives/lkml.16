Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971A52CCDE
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 19:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748288817; cv=none; b=AUebCk9QTOMvsBRncH9q208p8TJ1BWcPP6NgkuqmQffxDfrhp/O2Pe70BJwFv6Ogte5cDWskBtxAHr2VhSUD+dUgNuxVU/ltrcyYloZtRh7pseIKbl21Shn63gBqVi6PMnuIsFhb582lGSyLk1FH9LnPkfoRqU/YyT+3U44xhKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748288817; c=relaxed/simple;
	bh=TBwXpU3yQ3TEqtnhSOdNQaUV4VZyUOf5OSjY2OJ2aXY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X9zqaObZha+r71FPwsGDmhgSQuHA5vjU4c/XoPUllztlEjcoUg4IG9y13SHkaAJxzc9/lh5MJFHNxXTvjE/vrlnx1UaA/q63/bPvVSsTFM9HVjMih11Wu2POIcqtUa4gm9fnDnWbINydox/F5t22JsfpLbekxuSE/7U+UVDy/8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=e6huNVc+; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="e6huNVc+"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id D60C740E0163;
	Mon, 26 May 2025 19:46:51 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id JZjZeFkfASNq; Mon, 26 May 2025 19:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1748288807; bh=jpyiFtYUaAgmjrEHd3/VEhPjEmFMY9BCUY9FGe8SDKY=;
	h=Date:From:To:Cc:Subject:From;
	b=e6huNVc+89N2ZAugUUnqw/k7keL3Qzx498fdDvEfoviGgMbLmg3byC55um7a8CpK1
	 alas1GSHMP7Ca3CXYRcfoOF/naBUzjFxlT7Oh8kUZ0g0Xz5KDhsFf7+RPYmXvF02Bc
	 HMgvxvsvRxdvWAiq8MEclOjH2C+ohl+/WlnJ0Kpr6MHPqOI9yS6IqWikY2IQo7OT0d
	 gmvj324H9LGuPqJplbkD6BDgvhdBMe+Pu/mWdCN6OfY0VY0dL5ynkwPbiMjC2uqB8J
	 3HTM4jXvnuZRYGCNka5MSVW4CLqmLimYWpr+kKg8IQiPAqCYdg03KqgQvDFRMKJq9O
	 Eo4SPdP0a8oK6XWBd9hQ4t5GPKs8MnbSwVYtrK6nZfkjyzI2B0YGySug6ullqa279o
	 eQYXUbGb/Rx+5cELevlzE8vewJ8zoKoKNfSmSTbvy6XhXMmwQyrrYtZHfehHCpuaUy
	 005l92O+VX3CvnKR15Q6XpBt5JjgLEqiAmABC8l/+s+q3jzx169kq/mdp2LC0Z8/7J
	 +BBfOfEE6Mpmuj5z9CDYK0Wk8OVu0JmpQy+D0A3p5YX8G44MkE9F/p9+kexY84rbRj
	 CPvJsXzPYUE1MWRtC9FRU69h3yZnxVMTLprXhAIpRf6pH1YPWen83TP62mfqvnfYob
	 jPs4DKLIIRLWQfHG2cnHwYuM=
Received: from zn.tnic (p57969c58.dip0.t-ipconnect.de [87.150.156.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 53C6B40E01AB;
	Mon, 26 May 2025 19:46:44 +0000 (UTC)
Date: Mon, 26 May 2025 21:46:34 +0200
From: Borislav Petkov <bp@alien8.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: x86-ml <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] x86/sev for v6.16-rc1
Message-ID: <20250526194634.GAaDTFGr3LAfeGdCxe@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Linus,

please pull the x86/sev lineup for v6.16-rc1.

Thx.

---

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip tags/x86_sev_for_v6.16_rc1

for you to fetch changes up to e396dd85172c6098e3b70b17e91424edc7bb2d8f:

  x86/sev: Register tpm-svsm platform device (2025-04-10 16:25:33 +0200)

----------------------------------------------------------------
Add a virtual TPM driver glue which allows a guest kernel to talk to a TPM
device emulated by a Secure VM Service Module (SVSM) - a helper module of sorts
which runs at a different privilege level in the SEV-SNP VM stack.

The intent being that a TPM device is emulated by a trusted entity and not by
the untrusted host which is the default assumption in the confidential
computing scenarios.

----------------------------------------------------------------
Stefano Garzarella (4):
      x86/sev: Add SVSM vTPM probe/send_command functions
      svsm: Add header with SVSM_VTPM_CMD helpers
      tpm: Add SNP SVSM vTPM driver
      x86/sev: Register tpm-svsm platform device

 arch/x86/coco/sev/core.c    |  69 +++++++++++++++++++-
 arch/x86/include/asm/sev.h  |   7 +++
 drivers/char/tpm/Kconfig    |  10 +++
 drivers/char/tpm/Makefile   |   1 +
 drivers/char/tpm/tpm_svsm.c | 125 +++++++++++++++++++++++++++++++++++++
 include/linux/tpm_svsm.h    | 149 ++++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 360 insertions(+), 1 deletion(-)
 create mode 100644 drivers/char/tpm/tpm_svsm.c
 create mode 100644 include/linux/tpm_svsm.h


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
