Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB6E43ABC
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 11:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748171248; cv=none; b=VtVsLv+FvXCLimhwVWTTDmNoIJTX6T92L9jkuBOTvasn0dtUC+H1OzxQjObIjWbwRdSpNQVCCeeUBbsVhDET1JTS/dj+RqyjvNiT7zY8WioBtTSUPa11RQUQJVurKb0jJU7rIZsOk27xOyj+4UHwfADnN8xFQKsJ9wssAe0rnSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748171248; c=relaxed/simple;
	bh=92FgH8ZmocNqywkWRvXnrHWx/XTba1yOFA7ogDkkYac=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lpoyvSE7er0Bxm8uakgUiMf+Ta+cgTn5dImjQBTx1TBQiVilVYjM33leMNwgNE62J7e007+xayx+y7fVzjJcULPb6IotAnXX8R33JZOur+s95niVhZQbvkJWDTzuHTGMbZESxiGzwLJ6H++tEHxjfra37HcOKxbAFSb660MyT+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mgvV2R0A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mgvV2R0A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F965C4CEEA;
	Sun, 25 May 2025 11:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748171247;
	bh=92FgH8ZmocNqywkWRvXnrHWx/XTba1yOFA7ogDkkYac=;
	h=Date:From:To:Cc:Subject:From;
	b=mgvV2R0AHE8/sKKrpaPe/h4Wmz4G9Eb8asYzQP+ACEvosqJZRI0dxCDBUIKy1pwt+
	 mTIc5TYwm80A7TL6AIZClLDMwNCuscuhHhecDyxTcaGrJn6rHYnfu7yQ9XZyagRGYc
	 P2skHEKdh777ss0IDne1vCk/fpm6aqMBehvhAIsfXM+yQo62rl55HEtY2ZzUcLvkIK
	 /6sTQ5RK8IHx2F8ZSf8kVc5AFpCJjcF1sPZvw3YbFUS49KX9XIZpscuOUFYLFqaCSJ
	 Ngi1bxtmcDaRhELTpeNFa2ZXQRznA7T4XNF0V+1yNFoRIBXitVEJB11Seri+P9SLE7
	 8JCGbrDMlLW+w==
Date: Sun, 25 May 2025 13:07:23 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, the arch/x86 maintainers <x86@kernel.org>
Subject: [GIT PULL] x86/entry changes for v6.16
Message-ID: <aDL567pdokwxyYlm@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Linus,

Please pull the latest x86/entry Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-entry-2025-05-25

   # HEAD: bdb30d565f4b53e91abaccf83ecd718e5ba0f7c1 x86/vdso: Remove redundant #ifdeffery around in_ia32_syscall()

Two changes to simplify the x86 vDSO code a bit.

 Thanks,

	Ingo

------------------>
Thomas Weiﬂschuh (2):
      x86/vdso: Remove #ifdeffery around page setup variants
      x86/vdso: Remove redundant #ifdeffery around in_ia32_syscall()


 arch/x86/entry/vdso/vma.c   | 35 ++++++++++++-----------------------
 arch/x86/include/asm/elf.h  |  4 ----
 arch/x86/include/asm/vdso.h |  8 --------
 3 files changed, 12 insertions(+), 35 deletions(-)
