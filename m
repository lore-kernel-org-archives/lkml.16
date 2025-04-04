Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4FF167DB7;
	Fri,  4 Apr 2025 22:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743804617; cv=none; b=d7BMEUng/LqQ5MovDxRmQM5gyAhrcdeTjUYgTiaj1/363TpxrHHFRh6RabQRIC8BQa+xhoAV4ecONMibuXcJaBkQSzDEugV7P5deoeikTr+UJwd80jcxlb8EyhniIV+jAwYU14Fn6sUMksxnyYMTFXxeIod2+zDasVDKMF+889g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743804617; c=relaxed/simple;
	bh=sb6FxWBGU3RdEvUJ1cGzxgOFNXn01qGvBKJW47wWL8Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=k4+VVAmcJHrNk+t5O68pMos29kgGthCMc0eXMF6UohCkq27Ghddb+Aeduhz1ZWO+gg7BcxO1q53CSn9BItrq5g6+fXQx3DWkYtPb0olV403gJ8NMxxEw9VU53thAY3xZG4PtnhFz7T8akvmHjK0ELKq5Wx8FY0QDOCiZMlJLOmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dVNJT60u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dVNJT60u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66B47C4CEDD;
	Fri,  4 Apr 2025 22:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743804617;
	bh=sb6FxWBGU3RdEvUJ1cGzxgOFNXn01qGvBKJW47wWL8Q=;
	h=From:Subject:Date:To:Cc:From;
	b=dVNJT60u5gqvsglEppLuA1OuoJCcOE/ZySMGdld/i3alTDxM2bIf4s9TIPRuUbiKl
	 WaAy80HVx9zKJrL7ZyScEQyA95Xgdx1J3IB1dzT2K3BA1uH+nEYVjmNpUsqgeNIeKj
	 4zVgAIV+hTPhbK5ZVMVc3WJZpSM8HxUIPYSCExtAgcUZ4dJwNtjE5RV1pqVfjhr0er
	 qdoWFhtC2dBif5AKW/eXgr9gfUDTbYP/fBhDAtDweizFJkmHtGJd7LUIWaYabj6AXR
	 NhjE+Q1L1Bm4ZCK5qUVc6td4sLM9hvx4S61sQM1mHIlAbB9c8grJlExu5LNsC+n58o
	 oRSFQ0rTQAunQ==
From: Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 0/2] vsprintf: Use __diag macros to disable
 '-Wsuggest-attribute=format'
Date: Fri, 04 Apr 2025 15:10:01 -0700
Message-Id: <20250404-vsprintf-convert-pragmas-to-__diag-v1-0-5d6c5c55b2bd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALlY8GcC/x3NQQrDIBBA0auEWXfAJEqlVyklSBztLKoyigRC7
 h7p8m3+P6GSMFV4TScIda6c08D8mGD/uhQJ2Q/DohajtNLYaxFOLeCeUydpWMTFn6vYMm6bZxf
 Rh6ez2prZmhVGqAgFPv6T9+e6bkFrnkV0AAAA
X-Change-ID: 20250404-vsprintf-convert-pragmas-to-__diag-df7a84851853
To: Linus Torvalds <torvalds@linux-foundation.org>, 
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1000; i=nathan@kernel.org;
 h=from:subject:message-id; bh=sb6FxWBGU3RdEvUJ1cGzxgOFNXn01qGvBKJW47wWL8Q=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDOkfIo7Nq/EvDTlytOn5/W+Rh8V4mVZeUm9S51xpsPEOU
 3h3+ZwzHaUsDGJcDLJiiizVj1WPGxrOOct449QkmDmsTCBDGLg4BWAi318w/K8NXrRchsNFUH7r
 qUtSx4Ke937T6HB+oZN7Q8NwxfW1S7oY/nsa130oMrnD/kpt58njSj1dUz+9CWktK/0r2/f+y+y
 nz9gA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

Hi all,

This is a follow up to the complaint that Linus made at [1] about how
the #pragma and #ifdef to disable -Wsuggest-attribute=format is
currently ugly. Convert the #pragma and #ifdef to the existing __diag()
infrastructure in the kernel to hide some of the ugliness.

I am sending it to both the vsprintf maintainers/reviewers and Linus, in
case he wants to apply it himself (since it is pretty simple).

[1]: https://lore.kernel.org/CAHk-=wgfX9nBGE0Ap9GjhOy7Mn=RSy=rx0MvqfYFFDx31KJXqQ@mail.gmail.com/

---
Nathan Chancellor (2):
      compiler-gcc.h: Introduce __diag_GCC_all
      vsprintf: Use __diag macros to disable '-Wsuggest-attribute=format'

 include/linux/compiler-gcc.h | 2 ++
 lib/vsprintf.c               | 9 ++++-----
 2 files changed, 6 insertions(+), 5 deletions(-)
---
base-commit: 9554264e302cccf4c2a1e9972f2e707b09ef74fd
change-id: 20250404-vsprintf-convert-pragmas-to-__diag-df7a84851853

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

