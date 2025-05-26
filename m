Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1FE13AD38
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 18:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748282892; cv=none; b=WSCk+DFzvDxAh+BTcC7ZA4bWD9NMTKXYaImIXIz1NORq6Ki3gNAUbVFCLsSUiBsEBY6ubfLJcgKZbDJEnmKZyVEqlbqtrNC/sy6jc7wabcS9AMadhfaFRDIoLOERZTIAddBL5EbZRH50xdQhRq+hJqhEu8wl+LZ9fjbJS5a44IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748282892; c=relaxed/simple;
	bh=ruTIXrJuXPdcQ72euwOwB5e7GpxI8QL9tRPb5OcYWxg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TsDNqPe0YXzn8bDD+U6lrLYWzzyHlA5xqdRaRviIyqcu8y4vCscuIe4KLKyAnp7+GsPa2DWrbdaYdOnZZtPXBjcD5O0JYRUQjE754FsVNln5LFmMRpm3XbPxU0QfTELqZFnDBm1UDBtr1prxV9cgNoTwOFGF9WM3X2RZ9dwv3v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=SXdMay26; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="SXdMay26"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id EB91640E01A8;
	Mon, 26 May 2025 18:08:04 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id yxre9b4h2KhH; Mon, 26 May 2025 18:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1748282880; bh=zMDvF6FT8nB/j32gjHgWkMs25pga76AbDtk8lhjE7f0=;
	h=Date:From:To:Cc:Subject:From;
	b=SXdMay26QwPnQi9TXN0OeapyMNKxBCR0JGc5FziTvCJMoOAdyE3Kynw67ijj9TCBI
	 zVbSl5+oNKAkyxX4qU1ELMqFJuo1S7kkIL+TqzYo6o2Tkvlb1K7BE+SqBvkplRoJZK
	 llFne01XjWJgGSac3FgvKsNm6Gjl0oT8LRCZDXikbyf7YPEfmY0cTvq/prFw4g5QvY
	 hv/dz9v9vjUsTOWMbWxxF4QNKoLZgFeRwfluRc4NJllll6FTLCjqVH1/BN/kusQcqH
	 V0DqKEXoPfqOzM2VpSVZvOpG2lc32oNZgQy3WNKi4hD43UDq2z1dGSXnzMmkrFDZd0
	 xp3sJ4JUCBcvrrJIx2mjy6lb+dwro36pCsxwMf1zyZbirZ85Wus0+GRNA1fmvyNaJd
	 Aa5qJd/3LnM05JPeJETYljXaiWoFZtkEt08sGKvk9rqltW4/+WZLYnoxYPGj9RoGx/
	 h5nOq/4vU3Ez0LXE2x8PcoT56BbMCJhfrrI4zO/JtVrfLBDoGnOv9d/d2WQHJtlp4o
	 vsusW5D362uXi7mzPwriDDtao0GABUKUogcyDdIvMPWN1shUd4L97zVIdwyFT/PCuy
	 hBQuspv9Dfp8iAGBvi70iVNSDS90fucXYZ9ryO0qIqmytxYsnvCSSrwzPmcWEm+uHI
	 oaE0EvE7aNfOrIzyO04/a82Y=
Received: from zn.tnic (p57969c58.dip0.t-ipconnect.de [87.150.156.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 78F7F40E0163;
	Mon, 26 May 2025 18:07:57 +0000 (UTC)
Date: Mon, 26 May 2025 20:07:50 +0200
From: Borislav Petkov <bp@alien8.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: x86-ml <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] x86/mtrr for v6.16-rc1
Message-ID: <20250526180750.GAaDSt9noFCkmXjlGt@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Linus,

please pull a single x86/mtrr change for v6.16-rc1.

Thx.

---

The following changes since commit 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3:

  Linux 6.15-rc6 (2025-05-11 14:54:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip tags/x86_mtrr_for_v6.16_rc1

for you to fetch changes up to 824c6384e8d9275d4ec7204f3f79a4ac6bc10379:

  x86/mtrr: Check if fixed-range MTRRs exist in mtrr_save_fixed_ranges() (2025-05-12 13:04:40 +0200)

----------------------------------------------------------------
A single change to verify the presence of fixed MTRR ranges before
accessing the respective MSRs.

----------------------------------------------------------------
Jiaqing Zhao (1):
      x86/mtrr: Check if fixed-range MTRRs exist in mtrr_save_fixed_ranges()

 arch/x86/kernel/cpu/mtrr/generic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
