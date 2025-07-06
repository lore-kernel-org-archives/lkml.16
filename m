Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87FC6259C
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 08:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751789750; cv=none; b=d3TMNVfdDbg+VRyg7f27CJm+GCbZN2EkPumnlu5FnpUN+CfHxp+S0PP0YKu5vAJU+Bpl+a1M4h0qaO+pAd1kOWKmVo2dmTxZWJc/DnuDrzYVZrrPlKljUx/YGiLeqEsO+usTtZIA7DC/OiVr3OEoGr/Pc5JmXXbPcdWcfRDE3aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751789750; c=relaxed/simple;
	bh=N6uuPra0kQn89R6aUEtQAmM6jEoPcVbvO5JMCNr90LI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OOesuBKXU+aHObAAyUJqlSIjowpoR7IzHOKBBsATsln2czJ0kbc4k2v5xal+H8p/ExQ2mvcApHwSTymwrWPnXssbNl0mb8J9JjhrRCWWqE6yA/RQN3f4xWfq2/nLYZau29Jk0x3+s3o6fUiBp0nx3LARKd4Ets2zLt2IimJizWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=BCz1z9Nb; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="BCz1z9Nb"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 8B97C40E0198;
	Sun,  6 Jul 2025 08:15:39 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id o4oKQgzkE9Md; Sun,  6 Jul 2025 08:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1751789736; bh=mf/vHVfbOlqdc37gWRzTJNTrF4aNdCbCgsN1Y4aB/g4=;
	h=Date:From:To:Cc:Subject:From;
	b=BCz1z9NbOX7vWXdHEtGFZYYDhRFMSnuir75lbdUOiYUw54gaTWLxV3eSZlTaHeTUj
	 QyRrMZ905c5RK+unR/OIQ/b8TcRH0UHGB/fow0bn6E7Iol08lYL9Pob5OGEbzTW6pC
	 YpIHXz0bAPM4UrTvut9OSwmDM1pXuGnybwxEX9X6abfZsYOoD386qNX57RHnHuDcRi
	 AN5eg9KGMCYpLPs7jjdfQY0NeeSD6dyAiGG25G5mUFjoLyYvbOs6GKym3oOLuq+/K5
	 z41lYbL+ePtba014egixWMbINTyk0wSDG7cdcXCLp9d9wrHOsegfPm6ltryfrllxi6
	 T5vB/QGtT2hzBBzBN/wsFg9eFJuXPDA/aw/A2fApqBY+ycWUgMJdmPXLY7LUVrXGfF
	 yNnqBvM19RjuLg2PGjvMUeaFii+CUE73vDUryTzzGPUIqOCAu67+7Zf3eEg6G9EsR6
	 tfe76OxKJxzy0CUowT60gzgINLBhGnWkHWXnEpPIFZKTGt9R7M95O79VyQlIrpzqUW
	 VwTWAC5lO2Ejh+TjbzDrMoxBrgO9wKsxpUrNBRdX4k0gz2nyLxDZd/OfoxY2Y31+UV
	 nW3T6GPPrK/zdZHo5XcAXEAEnrD2JfrC4t0Tz477r0vDmKhHyoA5nf8cyc+S+h2aQH
	 tsRfsVxB+u1xMKlTeA/W5yF0=
Received: from zn.tnic (p57969c58.dip0.t-ipconnect.de [87.150.156.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E9C6140E0184;
	Sun,  6 Jul 2025 08:15:32 +0000 (UTC)
Date: Sun, 6 Jul 2025 10:15:31 +0200
From: Borislav Petkov <bp@alien8.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: x86-ml <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] objtool/urgent for v6.16-rc5
Message-ID: <20250706081531.GAaGowowWdZ55HmbWt@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Linus,

please pull a objtool/urgent fix for v6.16-rc5.

Thx.

---

The following changes since commit d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af:

  Linux 6.16-rc4 (2025-06-29 13:09:04 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/tip/tip tags/objtool_urgent_for_v6.16_rc5

for you to fetch changes up to ccdd09e0fc0d5ce6dfc8360f0c88da9a5045b6ea:

  objtool: Add missing endian conversion to read_annotate() (2025-07-01 15:02:04 +0200)

----------------------------------------------------------------
- Fix the compilation of an x86 kernel on a big engian machine due to
  a missed endianness conversion

----------------------------------------------------------------
Heiko Carstens (1):
      objtool: Add missing endian conversion to read_annotate()

 tools/objtool/check.c | 1 +
 1 file changed, 1 insertion(+)


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
