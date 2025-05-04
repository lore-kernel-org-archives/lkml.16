Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A10C2DC774
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 07:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746344171; cv=none; b=Lm5U3c5Ay7fPb2yFcW2Q9BxLdXnA3Eb0BkUDzrgdZb9X/yFzDWCAsvG7oyO6fCpwk5AgN71MIfmpjMdF18wRikb2BSl6gtXrSxlK+YYg4OQ8vCxsYKDeb0lNYPq4zYS3nyF3U705+9DUJQocZ/5lSsWr3AZRsK1JMKiJ7AEMVyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746344171; c=relaxed/simple;
	bh=2sQhelXFUCuiNQ0ZKe6j2GlMLb3aqOX1Bkcw55+ojnk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iP02KaEky54RUHWUePCqWwGJRtHGG0e5Fxr20J+dVNMpB8mO0ZQTng3iJYyvUZKbHAUOlCaw4ZegrRUBHM+vmrl3+bL24nB4/lrqG/0M++TOhj8lx33lDJmscDDHPn0xfz7u3vYMmG/x1T8hTVHWQr20qGcpowx9HfrssfG9M9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l6HFGcG9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l6HFGcG9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F689C4CEE7;
	Sun,  4 May 2025 07:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746344171;
	bh=2sQhelXFUCuiNQ0ZKe6j2GlMLb3aqOX1Bkcw55+ojnk=;
	h=Date:From:To:Cc:Subject:From;
	b=l6HFGcG9AL05LcQ194KXkfgARow3c09wYoiOsK1PaM1CK2bz1RyQ9F2rtR/l1HWPm
	 xc12ePm5yOmMYbu2WKwLAb6JgwdCLTJO3hw2+D51U8CJxd/16zYvTzSs2YSFHmp966
	 GcJjQRmTVO/7quGFtmIw4n8AspkoGEf9OBWzMvPkXsCPg9B2ec3vUlH38qeyJufHmC
	 5ejE0ku8MBKCgxJauOyaun47cCl0Pvl93y8khf4XSgwno75ND7MSeVPGsZhD/z4dtn
	 Zxz1uchtBIWD1d0Q/tmMUi+gU3Ly0O2Pc5IYGBAmhBp497UHpGI3W1wPV8CZjumoOD
	 z/g0mduQPw8yA==
Date: Sun, 4 May 2025 09:36:06 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org
Subject: [GIT PULL] x86 fix
Message-ID: <aBcY5onhP-kyuJuz@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull the latest x86/urgent Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-urgent-2025-05-04

   # HEAD: 8ed12ab1319b2d8e4a529504777aacacf71371e4 x86/boot/sev: Support memory acceptance in the EFI stub under SVSM

Fix SEV-SNP memory acceptance from the EFI stub for guests
running at VMPL >0.

 Thanks,

	Ingo

------------------>
Ard Biesheuvel (1):
      x86/boot/sev: Support memory acceptance in the EFI stub under SVSM


 arch/x86/boot/compressed/mem.c |  5 +----
 arch/x86/boot/compressed/sev.c | 40 ++++++++++++++++++++++++++++++++++++++++
 arch/x86/boot/compressed/sev.h |  2 ++
 3 files changed, 43 insertions(+), 4 deletions(-)
