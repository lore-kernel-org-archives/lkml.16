Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0681FFC55
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 08:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751186705; cv=none; b=Kpeq0d4TNJgzefmEzJlXLWZwiHw8Vxu7gt+YvGWIlc7R7gJK2aVyrgFTKhkVfKrZHq9/dqfrUIxlXi1ao/q1HG9eyIMv04/NCpAybKEpTMWWZKY6H75wTgBdui23a7ITsy/aTyAC3XxOFhT9tb8XbdZJTPh4Sr5nboHTJZKcL+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751186705; c=relaxed/simple;
	bh=kdy0oYsOSXpUOy7uZtl0zRPtQ0HLxgC681wwzh+ybWw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PkAwsNhzhEkp3YVk6eRB/qQn5mdDLMi0hUfvhXud9j768PrM4P2oG6N/Asp7qkDoP8vNBCMnbFRvSuibo+D4YymqpKH8hyk23bVOFpaxwZUiwLFWT+G5SGjmS8UlLkCLRoEWnzAgmOm4WYGK0nPHJsxL7AXb8ac70slhjZ5w55I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=I3Q2bvP8; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="I3Q2bvP8"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id AC54F40E0198;
	Sun, 29 Jun 2025 08:45:00 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id T5Pupkrhnynq; Sun, 29 Jun 2025 08:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1751186697; bh=Z/NuCyTyHhDG6uk+ZPFCD/53h3aH+PR0vEJvVL8KOfs=;
	h=Date:From:To:Cc:Subject:From;
	b=I3Q2bvP83TUZs81uTxkAZpHC6UIGFG9IjirPFH+RZY/tDuAU6l79SqhEfi82zS3Z5
	 HbSftI9Nu6+C5O3BWS2RK0C8TKZ9eEHGLEngahwb1d2ndQu9DKn7c0QIg/VXjQokgZ
	 h2L3UBW9ed7eeRvCAHREll2zoFBQMXIcQ3DIg0fI/T29+44cYomRzxW1vCBn1GYiNf
	 AIygaXTmXT/cWmfKBi34kGNUBZ31L+vJ9im8F4GNfMLNdYEmkh/ex7fBbW9NSGZfqP
	 B5W0vYibmLqfNtgi6T3glkz/L5qlYD7z/BL+Hl/TzP3K77s+T0W65fyYyuJHB7YVJ3
	 MH1f+dFV3U4kKwIcxCoxy6JOwMZrM0csHy2KQfhJA/tnC5ZvaLukDfUd+BHzmUyHsx
	 gfKVlO/q34zrN8gEqBGusMWD8Y+HkB3QuDBnJ6BWuCnMUSha+frFYEsuyXof1XzUZ9
	 UbZ7JtTvyIzKlUrLrhZf9TXySSb7SM/hy1o9LCBPgugpplXGdt26r6WIM49Qv2EqGR
	 SeFe1LFd7fBkIR8EtCZmAO/EP5NfLvE98Q0UT06ZCO2jq0GQ82peWGE1ule9gyJqjJ
	 noXx5A1vXVb5JpTdDOi94N8MEhsxpw/v4zA7i9rUlYonrwp6GKO/d6/zf2Hdxvr6q/
	 ylHELTusJ+Au4ovZvhrVrPNM=
Received: from zn.tnic (p57969c58.dip0.t-ipconnect.de [87.150.156.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 47AF340E00DC;
	Sun, 29 Jun 2025 08:44:54 +0000 (UTC)
Date: Sun, 29 Jun 2025 10:44:53 +0200
From: Borislav Petkov <bp@alien8.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: x86-ml <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] locking/urgent for v6.16-rc4
Message-ID: <20250629084453.GAaGD9BXtjCpASAyfJ@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Linus,

please pull a locking/urgent fix for v6.16-rc4.

Thx.

---

The following changes since commit 86731a2a651e58953fc949573895f2fa6d456841:

  Linux 6.16-rc3 (2025-06-22 13:30:08 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/tip/tip tags/locking_urgent_for_v6.16_rc4

for you to fetch changes up to a24cc6ce1933eade12aa2b9859de0fcd2dac2c06:

  futex: Initialize futex_phash_new during fork(). (2025-06-23 14:50:37 +0200)

----------------------------------------------------------------
- Make sure the new futex phash is not copied during fork in order to
  avoid a double-free

----------------------------------------------------------------
Sebastian Andrzej Siewior (1):
      futex: Initialize futex_phash_new during fork().

 include/linux/futex.h | 1 +
 1 file changed, 1 insertion(+)


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
