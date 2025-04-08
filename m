Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716C725FA0D
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 07:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744095746; cv=none; b=rop3V/n6ZpbqIusp/8paRSkcwlHBU9zkzO9h4Uh/Y/SVG4JY3J19cMkxOzYwngc8z2z5Elbu7RoVdYH4uDUderPspCeJF4jYwgz1gSJag4BkbxbbGWkTFCot+npn6xzLg7Wq9d0Zs0OSNl5rCXTFcyxryn38/RsXBY2cr7fMmiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744095746; c=relaxed/simple;
	bh=8Bs2exazEOSYlhHnMS9ABkVQB539MAMkQeivRftqwEk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DeU8h0bEM5Ji/eu463O/1bOqq5GOHibhin34ekUFpbELDBXgHMAsDYMFjwWX2y7OPWItxFHOqKn455tCf4+RM2nAmE7Qm+xk0f++p8QhpTuhsucZ1OXR5NXrFd52dLA7sTd0Ug3bSAeKOcPN0H3c4MIMRWZOVFDwJCnOtvX+s2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=idibb8rz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="idibb8rz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEBE6C4CEE5;
	Tue,  8 Apr 2025 07:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744095745;
	bh=8Bs2exazEOSYlhHnMS9ABkVQB539MAMkQeivRftqwEk=;
	h=From:To:Cc:Subject:Date:From;
	b=idibb8rzK8OryoRxuO5Zsc5I/g7csmTzdAahRluI+Nxolx7shqUvmufgumHTosC2i
	 d2t+hIvm6C0j5tC7tcWEDCLEfKkeHIvexynN4+eLovuYVfBHojN36XHIG23aAD+1sZ
	 X9EocWrCp5p/67eb0e14cvHrrBNu3q6siamKIl3YHZSomi8lYg9PmJiTCJ4qtbBH7S
	 cJhd7aRYzg8sjxEPA/Rkapw3L+O4D5OJ4/8kEnmvGn7dyE94jOvoaME07jZjZ248N/
	 nHvstUuXdHVtMTWsbzHAVkSsHsZ09BsPd/vVKif4cnzLy7plH4KCwdkyeEIL1c5fLp
	 KSfeSARaLDOMg==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v4 0/4] objtool: Fix INSN_CONTEXT_SWITCH
Date: Tue,  8 Apr 2025 00:02:12 -0700
Message-ID: <cover.1744095216.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I decided to keep the "unsupported instruction in callable function"
warning, it's not hurting anything.  As a result we now have
INSN_SYSCALL and INSN_SYSRET.

v4:
- split up patches
- don't get rid of "unsupported instruction in callable function" warning
- split INSN_CONTEXT_SWITCH -> INSN_SYSCALL / INSN_SYSRET

v3: https://lore.kernel.org/9b23e4413873bee38961e628b0c73f6d3a26d494.1743799705.git.jpoimboe@kernel.org

Josh Poimboeuf (4):
  objtool: Fix INSN_CONTEXT_SWITCH handling in validate_unret()
  objtool: Split INSN_CONTEXT_SWITCH into INSN_SYSCALL and INSN_SYSRET
  objtool: Stop UNRET validation on UD2
  objtool, xen: Fix INSN_SYSCALL / INSN_SYSRET semantics

 arch/x86/xen/xen-asm.S               |  4 +---
 tools/objtool/arch/x86/decode.c      | 18 ++++++++++-------
 tools/objtool/check.c                | 29 +++++++++++++++++++++-------
 tools/objtool/include/objtool/arch.h |  3 ++-
 4 files changed, 36 insertions(+), 18 deletions(-)

-- 
2.49.0

