Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC9520ED
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 08:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751789912; cv=none; b=LcJG4c48kYf/PNDrrs1LX3POXRvKyT4dL+JHqffmHgRNYVcqbuWuKdYG3W/LdPJ10HYpOCuUMKMpQK4lO1C7EmXTaa87GFwuhdiEXzPpFx8MZbHrTyfIL+p0obnCCgME954d/Zsd6Obs12LxWthMkXHGStB72YvuBG3Q12/ABYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751789912; c=relaxed/simple;
	bh=97kMaCzBe0CeCwFxYnp95R1UmXR+JWbYuSIez0FG5us=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SfurMvwqil2a00oMmWm6fmjSmsx4jZ1Ouqts+FxaqdxPw98x7SUNb0LCdyrcyFzjJrKmMrs1GV+P0NVsaoLDc3eOqCTfWV9KvEFM/SuN6zRyXTPStqVvatevPRCNfzQDyl1mQXMRNfOyQuDvA/IHhrurfyNbSAAZEJOZFLBAXHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Wv3Vpj89; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Wv3Vpj89"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 327E540E01CF;
	Sun,  6 Jul 2025 08:18:20 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id MC9maNMYNKEs; Sun,  6 Jul 2025 08:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1751789896; bh=AroMKOvKihzwr8qSUClqbpyTaX59MKXqlfADkiP6cK0=;
	h=Date:From:To:Cc:Subject:From;
	b=Wv3Vpj89pfwYAY468skojHzZjMkrXiGdNBnbKyzz3AprCqtK3hKdPKZ+2F9o87Vju
	 bUW3mKyrjmQK2BkMPVFGHJlG8xjGKhv6/wxs6IayKA7KOXAI4vyyQyhxtp+V8k4Srd
	 vbqNPTB9FOew9aRWovWQax6CGO2uII2+QFMQElZM7LQrQV6szjxpb9QAgHO0kTvqSH
	 L4aKTQkJMhiqbh0C83RWQQa8yqumzGdrKxzQnxxMvKZTJc6cNDMMA6vMelZf5+Z3b8
	 LtbL7OnM2NxY7geTGIkOtpvNmyeAGKH7GBFPzOHWy3NIkAflDl4sQp1NPsC5Q2zH3W
	 4MP/59eSsfyPYGqyoc1aK2eqEv0y1qRbcgKOv+KERQ5EtLGA263s8NP0jLRXfcHU71
	 So3QANt7QoLnAO6CFmj+l2wxjES2L68erMDWu+dWNl/AkKbEkLXiHlCepC0vvW+8ah
	 d0OqLOgENl1KdKMlGeBpB5U2sR+HMBThBsHKoHqbFNyv6ll2ZN+6+Na4a0tc6JQKcM
	 HJBorodPJ+8NDv+BUL0ZFfDcQnOtpT0F3gzz/5PoyXLoWv5GTR9YhdQBbrXFgW2yKz
	 T+dd4rlfc6ktDzY0LxGcg/9HrObpOZ8dnlRROXo2gOyyLKqJ6NiRt/M9eFM9ezpnuT
	 wtynv8Hb6v1n0LpwjY0SNsMo=
Received: from zn.tnic (p57969c58.dip0.t-ipconnect.de [87.150.156.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id B13E440E0184;
	Sun,  6 Jul 2025 08:18:13 +0000 (UTC)
Date: Sun, 6 Jul 2025 10:18:12 +0200
From: Borislav Petkov <bp@alien8.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: x86-ml <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] locking/urgent for v6.16-rc5
Message-ID: <20250706081812.GAaGoxRMTfEshzatY7@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Linus,

please pull the locking/urgent lineup for v6.16-rc5.

Thx.

---

The following changes since commit d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af:

  Linux 6.16-rc4 (2025-06-29 13:09:04 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/tip/tip tags/locking_urgent_for_v6.16_rc5

for you to fetch changes up to 46b0a67e8f22d2dbc679b37b26c5ff0f50424847:

  selftests/futex: Add futex_numa to .gitignore (2025-07-06 09:39:01 +0200)

----------------------------------------------------------------
- Disable FUTEX_PRIVATE_HASH for this cycle due to a performance regression

- Add a selftests compilation product to the corresponding .gitignore file

----------------------------------------------------------------
Sebastian Andrzej Siewior (1):
      futex: Temporary disable FUTEX_PRIVATE_HASH

Terry Tritton (1):
      selftests/futex: Add futex_numa to .gitignore

 init/Kconfig                                        | 4 ++++
 tools/testing/selftests/futex/functional/.gitignore | 1 +
 2 files changed, 5 insertions(+)


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
