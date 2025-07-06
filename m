Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D689F9C0
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 08:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751789316; cv=none; b=PkIz7XMn/34tfwUZcUDovHUJxLSLuVi2dQUvgGg44BTMdUnFXF3VewHte+4d7kMxcmdsf37fnxRB7MX7g9wNT70ggwZfJdglCtBiRgDg4I6/IznbgjO/1pFE/WH+g5UydSX09T68sXmNIaW7vGGYBdwEGunCOXH02haOq9tuMDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751789316; c=relaxed/simple;
	bh=TC9xGZ9FIpdxUBANzBmRl2dVl9xGLHp3DC/B8KzpSgU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aSO6TUaIQT0ER/20336ELHr6URy7L7haEVhe7zk8e8na6XmyQO2NKt8HAo0RV+JI9qraKTXeVg9sA/ChtP+VYuL6vsQ08a5bAtAlAN/5fIvA1MQUk8c+mu3z4XUP2pJGkcntDyUE3y6bqgkffTjbt611GCvOca58Gmek93vRkok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=N9UpEvdG; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="N9UpEvdG"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 979F440E019D;
	Sun,  6 Jul 2025 08:08:17 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id lRcd81egTHY9; Sun,  6 Jul 2025 08:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1751789294; bh=nl7/IoiT+Xa+ZKuwKP3IxsBEV95ZOdBMXypz5ftlTT4=;
	h=Date:From:To:Cc:Subject:From;
	b=N9UpEvdGZBSY0DMcwNMnhxjDWWjEtwjgGS6opb1j8yOr2EKtRtkcGRiG29f+HhVkQ
	 rFz4yLQr9ZqNpNI5NYGpqTzzr5imCBQyXy8NqlQBwsImRQvmel5andYOaI7tQqWbeb
	 ijdToQOEeGC7opV5mDQVHcuLUh1cTtnQvJa0YfBdekA85YQTFIDsefRRw7nGcmwdgk
	 0aHNyMBdj1eW4dQAG8Qp0kHTcTWPtRKV1yP2lYqh/iC6/yHVZUpzLGxMZ+CBH/7iEW
	 lfGfYcnQHqyU0tepcxUKthpzzDEIdLLfW2On2a1fMDky8smWzfww8EaPTAdeIuqPXu
	 q6jGVMEi+Zu47ZcjzgJIHe2u9cXlnwN6tALDKPyZ2TGI33DVfTHitl+wyR+sk4klOD
	 g0Kb+IwtL8Pvw5P+BcVZIrdjL5/Vr4pnLVLedMpaQM851Ft8V3AtPpgS9j+U9rV34L
	 kpDDH/+ip5pIVOHZajT2zOre6G/v5VdBPDPs+tdQ6gqVfQDsYbwAueJVImh4Uj4ouR
	 2AMLv8cUR6V76jAGG01Ju7kruE6ny9iZkzkdIPlPq3VQksVAf+fPQM6D+F/o9PSb/A
	 EeMd8HriVKnvNZaRT0eDG9BxwaW2wPGYESyfACdyYfAvrHgH9DpAfS1Y21Q74bh4dj
	 94/hUaHVOVXPbDbST6wdRoew=
Received: from zn.tnic (p57969c58.dip0.t-ipconnect.de [87.150.156.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 461F040E00CE;
	Sun,  6 Jul 2025 08:08:11 +0000 (UTC)
Date: Sun, 6 Jul 2025 10:08:09 +0200
From: Borislav Petkov <bp@alien8.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: x86-ml <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] ras/urgent for v6.16-rc5
Message-ID: <20250706080809.GAaGou6V4B7ke5415r@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Linus,

please pull the ras/urgent lineup for v6.16-rc5.

Thx.

---

The following changes since commit 86731a2a651e58953fc949573895f2fa6d456841:

  Linux 6.16-rc3 (2025-06-22 13:30:08 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/tip/tip tags/ras_urgent_for_v6.16_rc5

for you to fetch changes up to 30ad231a5029bfa16e46ce868497b1a5cdd3c24d:

  x86/mce: Make sure CMCI banks are cleared during shutdown on Intel (2025-06-28 12:45:48 +0200)

----------------------------------------------------------------
- Do not remove the MCE sysfs hierarchy if thresholding sysfs nodes init
  fails due to new/unknown banks present, which in itself is not fatal
  anyway; add default names for new banks

- Make sure MCE polling settings are honored after CMCI storms

- Make sure MCE threshold limit is reset after the thresholding interrupt has
  been serviced

- Clean up properly and disable CMCI banks on shutdown so that
  a second/kexec-ed kernel can rediscover those banks again

----------------------------------------------------------------
JP Kobryn (1):
      x86/mce: Make sure CMCI banks are cleared during shutdown on Intel

Yazen Ghannam (4):
      x86/mce: Don't remove sysfs if thresholding sysfs init fails
      x86/mce: Ensure user polling settings are honored when restarting timer
      x86/mce/amd: Add default names for MCA banks and blocks
      x86/mce/amd: Fix threshold limit reset

 arch/x86/kernel/cpu/mce/amd.c   | 28 +++++++++++++++++-----------
 arch/x86/kernel/cpu/mce/core.c  | 24 +++++++++++-------------
 arch/x86/kernel/cpu/mce/intel.c |  1 +
 3 files changed, 29 insertions(+), 24 deletions(-)


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
