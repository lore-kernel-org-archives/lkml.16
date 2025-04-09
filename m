Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CEA2144B6
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 20:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744230568; cv=none; b=GGUUofvq0pDL9eze6nGNdM6ffOc+V+bub4ATGRtGx5zgG8gnu8QvZM28elaKq6gqAHqXztmyi4dJ5hQVKn++HZK8Awq3sLEWp5pNeTD4I3a+xmygi1sdENrpFKA0fjldD+EgIqBmejGj8SgmUH7f+fMH10ssLuoqH+MOnRgaNGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744230568; c=relaxed/simple;
	bh=yipjOyzmBSZ7V2iWhmnuivyq5uPoOKOJUFIKj9yOP/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rPiscb2+lurgPYY3EHQoZvWl1Nx6RZt+I+D5RP66hmExETWpc/2T9jS8GsrKpMncoVPkUCUPyroqupPbUqCsAU0inFh23fvlQ2h9ghDESm/PGGPA6ccQcpD0FwwcHqN8KThsdKT/6psM49S7yHDhAhPyw0ZnKa21gQrq9RrRRag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tpKZSXmZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tpKZSXmZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 996C9C4CEE8;
	Wed,  9 Apr 2025 20:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744230567;
	bh=yipjOyzmBSZ7V2iWhmnuivyq5uPoOKOJUFIKj9yOP/s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tpKZSXmZBjJ4wkcS6G9nXzfgfc8q0EeKC8mII1dvFBQAW5QzzHJFhDmE/gdcsnLBO
	 GA2WqYdwTiAvZ9ztRpmelVio4bpVoB2TIISuqmnqC2zeEnWtxBRcS6SKYVNsZiCAOi
	 ntfivOQyb7ZjzmMOBinpNIoesjT+pA+xWgJj5tl0enmwQQmRGYCqmeYsEFHXlvHJbF
	 j0zGmFsfCzdpHEtjFp8kHkxUu2EaGQr6Em9lliBHNFhQWynbCj5onGbrPNIv0BgQ/6
	 64uq0UNgeRc4PFnCvBV3TRA55K+w/KNfCX5zhzG91hWuPsvT+avhZlehcIF/N3nZta
	 g89OekGXzTNbw==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Dave Hansen <dave.hansen@intel.com>,
	Xin Li <xin@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 04/20] x86/msr: Use u64 in rdmsrl_safe() and paravirt_read_pmc()
Date: Wed,  9 Apr 2025 22:28:51 +0200
Message-ID: <20250409202907.3419480-5-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250409202907.3419480-1-mingo@kernel.org>
References: <20250409202907.3419480-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The paravirt_read_pmc() result is in fact only loaded into an u64 variable.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Juergen Gross <jgross@suse.com>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Dave Hansen <dave.hansen@intel.com>
Cc: Xin Li <xin@zytor.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
---
 arch/x86/include/asm/paravirt.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
index c4c23190925c..c270ca050781 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -231,7 +231,7 @@ static inline void wrmsrl(unsigned msr, u64 val)
 	_err;						\
 })
 
-static inline int rdmsrl_safe(unsigned msr, unsigned long long *p)
+static inline int rdmsrl_safe(unsigned msr, u64 *p)
 {
 	int err;
 
@@ -239,7 +239,7 @@ static inline int rdmsrl_safe(unsigned msr, unsigned long long *p)
 	return err;
 }
 
-static inline unsigned long long paravirt_read_pmc(int counter)
+static inline u64 paravirt_read_pmc(int counter)
 {
 	return PVOP_CALL1(u64, cpu.read_pmc, counter);
 }
-- 
2.45.2

