Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BA21EF39E
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 18:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745261592; cv=none; b=nPCW/Hbpf4+LRyn6CGbSBrAHNKhUGEhPfdUkQJae2c7sZ5J52lO52a1J4FguPMP3ABrBm22JJdwCpB3EGrAKjpTrXoGgr1hpwXMU49FYtlhSqcq1P2X+tExAL7mtmw7tmddnLJ3IQgAWf5pLelkaWAxDNdmDYtWaKQMyBmW3gjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745261592; c=relaxed/simple;
	bh=X4GaBt+qisLszUoLlQoX6Qj0Kt8pfGVMPHII7noTzDc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K5wu5bPSmWV+j1U4V/sBi2KZ24D46a39SzrRXfiy+FgQh5dxNmWFKfZf9q1Jbt5VDHzn6I0H1fw31UA79H5XuDuLJMGPWfP9Hs+8oZRT68OEVckYysbkFOjx/7RceLfImpDFW9WeJ+STfYlnfgtA0uwfTEvIC4Mx2CX39TArt5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F7eQBCNu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F7eQBCNu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9C11C4CEEF;
	Mon, 21 Apr 2025 18:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745261592;
	bh=X4GaBt+qisLszUoLlQoX6Qj0Kt8pfGVMPHII7noTzDc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F7eQBCNuuCtELnyIeMblnZKWZc2iHEo53jdZG6af1ZOCbohEE5zZcsEegWjRbdbZ4
	 UEQbhJZkqikFFSmkqUHd0vdnnzpJzh3o70GE2NtJlwhtiNPvo7PMtclDqxLXMTtHRo
	 yiMJk7UaJcQ7G+6o+G75sqPAjpPd4pLjPMe/NRPGzRVfC3QSslbDP3wZDE/bu1Rt1y
	 5nV7RKoJ1Qsx/FsSXd0pECjXIN0pQ0IfzVrJaupEVVp4Wsf01JOujl2BPDRpBbFSay
	 bbLu0V4sYGacFamDpLna8w7RLbx+k1cZlZzcc+dWNIKkMi36NBhxy4dhwH6i4V+aLG
	 g1UIbN74X/wWQ==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andy@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Kees Cook <keescook@chromium.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH 08/29] x86/boot/e820: Print E820_TYPE_RAM entries as ... RAM entries
Date: Mon, 21 Apr 2025 20:51:48 +0200
Message-ID: <20250421185210.3372306-9-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250421185210.3372306-1-mingo@kernel.org>
References: <20250421185210.3372306-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

So it is a bit weird that the actual RAM entries of the E820 table
are not actually called RAM, but 'usable':

	BIOS-e820: [mem 0x0000000000100000-0x000000007ffdbfff]    1.9 GB usable

'usable' is pretty passive-aggressive in that context and ambiguous,
most E820 entries denote 'usable' address ranges - reserved ranges
may be used by devices, or the platform.

Clarify and disambiguate this by making the boot log entry
explicitly say 'kernel usable RAM':

	BIOS-e820: [mem 0x0000000000100000-0x000000007ffdbfff]    1.9 GB kernel usable RAM

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/kernel/e820.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
index 8ee89962fcbf..99f997ae88dc 100644
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@ -187,7 +187,7 @@ void __init e820__range_add(u64 start, u64 size, enum e820_type type)
 static void __init e820_print_type(enum e820_type type)
 {
 	switch (type) {
-	case E820_TYPE_RAM:		pr_cont(" usable");			break;
+	case E820_TYPE_RAM:		pr_cont(" kernel usable RAM");		break;
 	case E820_TYPE_RESERVED:	pr_cont(" reserved");			break;
 	case E820_TYPE_SOFT_RESERVED:	pr_cont(" soft reserved");		break;
 	case E820_TYPE_ACPI:		pr_cont(" ACPI data");			break;
-- 
2.45.2

