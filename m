Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB47D6EB79
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 21:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744319027; cv=none; b=Dtic3QEPV+FEhkL3d94vjFUVXGXNdYFrnvM4MWB61CgWEGWTNzzJ2/leCDya0VtQpfry5s8OUf1PWa96mm/S+TciokC7b+T2U0w3V/AB+zI7qTQ6X4zCcMa2s19KKawF/MX0NCjuS8YnI/r+/JV+n+z1i/WSitieMm6YRnDdQGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744319027; c=relaxed/simple;
	bh=OmAhMg7NBIYJl6kYi18TIQtV/K6LLa5OjvtDHxFuNms=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TKJsB1AiwFtKZVxggjhRckFfivLBjI7BDgqyt8p23Avcgu5eb2hcfiOMjWnkNj1+KhEJsq7G7k1VHBPC3b+S9NgDb2YUH2avPXhDzU4XAKRgBnRnDsxEtFg6LY/OXCiyxo2ueD12eoGGhKkNpAXc0DpwWtk8Ot9xi535Ll7hl8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gJYWmVRa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gJYWmVRa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63177C4CEDD;
	Thu, 10 Apr 2025 21:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744319027;
	bh=OmAhMg7NBIYJl6kYi18TIQtV/K6LLa5OjvtDHxFuNms=;
	h=Date:From:To:Cc:Subject:From;
	b=gJYWmVRarNqQF1h4zkPEwcsQ4p6g+0dgb3F81plQAoKbl/8ybLK92paED9PBtnBMD
	 OT+O3vSt4MkeQyZBTYRTScAo4PuUanejSlEnWrTviJLO2lTz4dREBEt1l0HI8kBZRH
	 fZQvp5aHcYXjFEy6T0VlR99/t/e1ZS/l0XUWTQV6AmHEnkLeZ5v+8fJzZ5xOOo3g7F
	 SXug0H9HdVyv5HnFsPVAl29vV4r9GoKp1P4415e++9hGfwBGZVbNBivZjlG6qcC0k+
	 fDtU9cHcKmCHpw7cXwfvFdHdqgV9F9lPyIYm3itDfZna1vtifZYl57TRnKa7Mk9age
	 C1QtwpcMFwyLQ==
Date: Thu, 10 Apr 2025 23:03:42 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <a.p.zijlstra@chello.nl>,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [GIT PULL] objtool fixes
Message-ID: <Z_gyLithD84kC30H@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull the latest objtool/urgent Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git objtool-urgent-2025-04-10

   # HEAD: 87cb582d2f55d379ce95b5bcc4ec596e29b0a65e objtool: Fix false-positive "ignoring unreachables" warning

Merge note: I amended the top commit (87cb582d2f) shortly before the 
pull request, to fix a changelog formatting error. Code was not 
changed.

Miscellaneous objtool fixes:

 - Remove the recently introduced ANNOTATE_IGNORE_ALTERNATIVE noise
   from clac()/stac() code to make .s files more readable.

 - Fix INSN_SYSCALL / INSN_SYSRET semantics

 - Fix various false-positive warnings

 Thanks,

	Ingo

------------------>
Josh Poimboeuf (6):
      objtool: Fix INSN_CONTEXT_SWITCH handling in validate_unret()
      objtool: Split INSN_CONTEXT_SWITCH into INSN_SYSCALL and INSN_SYSRET
      objtool: Stop UNRET validation on UD2
      objtool, xen: Fix INSN_SYSCALL / INSN_SYSRET semantics
      objtool: Remove ANNOTATE_IGNORE_ALTERNATIVE from CLAC/STAC
      objtool: Fix false-positive "ignoring unreachables" warning


 arch/x86/include/asm/smap.h          | 12 ++++----
 arch/x86/xen/xen-asm.S               |  4 +--
 tools/objtool/arch/x86/decode.c      | 18 ++++++-----
 tools/objtool/arch/x86/special.c     |  2 +-
 tools/objtool/check.c                | 59 +++++++++++++++++++++++++++++++-----
 tools/objtool/include/objtool/arch.h |  3 +-
 6 files changed, 72 insertions(+), 26 deletions(-)

