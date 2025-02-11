Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2118254B11
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 16:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739291812; cv=none; b=qSxkclsx+yM6QTHvD18BVtvclOvcvAvNiFM46TQDRxRhxYxLaRO0+e7vKnfDx1p0HTdSsF3hOhD9vBkC/p0PtSBPVeAMfrB5NKvE+0812BwEL9FGtOAB7DjA6oxOH9P3WYR0GuGdnwkg6WYaPKgJw6t7NXMS2Gtn/B00n01h3ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739291812; c=relaxed/simple;
	bh=Y3m7kjbGn+n0+xQhDFNYR71j5F/g8n8H15Hz9mUg/qE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MtcvD3XdkXY8babNVtHfm8Gl5MbozrPcWLULntWiuhREn5Mv06OyaVKBFVzJItQiWpUpnuZBTryL0gvJBffIwDVMrETjzwMcCOuJo19Dz12/oxRuPIgb4Bx0O+tS5AFuuEd4O+BErrTEScULt3Rq5Xlt8NTE+k+H/R4k84VJp0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dQ8mJz2/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dQ8mJz2/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22748C4CEDD;
	Tue, 11 Feb 2025 16:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739291812;
	bh=Y3m7kjbGn+n0+xQhDFNYR71j5F/g8n8H15Hz9mUg/qE=;
	h=From:To:Cc:Subject:Date:From;
	b=dQ8mJz2/QnLfGU0xwRjZHEpBJIhn20fZ1wCR1Vi2dAP7TZGdvW5PZdGY/rbmDvDAj
	 dfTm5jKHSu5VXJqY/CfoZmqskuKbfBl6h52H+0yO0k2lUHiziYkpbNMDKbfcbNv8Dh
	 7qKx6ebDPUmCWET/rLg4UHGzoYiPOUorLm7l2K040wKqqoKnT7kCTfxZ8E9Ha830zD
	 bCyTtGMCztZ6VEvepirvItuaRhRPpYUsrPke0DKmrPPGzSvWi+MaxTPgQZ+KAX0xZW
	 aGMoV/0etECQLhg4MaX5wbhIRi3XqNRXY5mi17k5tHN4chHqLhw/A5VXlW3Ed0DUXW
	 C8y3KeY1Vp/Pw==
From: Borislav Petkov <bp@kernel.org>
To: X86 ML <x86@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	"Borislav Petkov (AMD)" <bp@alien8.de>
Subject: [PATCH 0/5] x86/microcode/AMD: Some small cleanups
Date: Tue, 11 Feb 2025 17:36:43 +0100
Message-ID: <20250211163648.30531-1-bp@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Borislav Petkov (AMD)" <bp@alien8.de>

A bunch of small and trivial cleanups which sprang up from recent staring at
the loader.

No functional changes.

Thx.

Borislav Petkov (AMD) (5):
  x86/microcode/AMD: Remove ugly linebreak in __verify_patch_section()
    signature
  x86/microcode/AMD: Remove unused save_microcode_in_initrd_amd()
    declarations
  x86/microcode/AMD: Merge early_apply_microcode() into its single
    callsite
  x86/microcode/AMD: Get rid of the _load_microcode_amd() forward
    declaration
  x86/microcode/AMD: Add get_patch_level()

 arch/x86/kernel/cpu/microcode/amd.c      | 155 +++++++++++------------
 arch/x86/kernel/cpu/microcode/internal.h |   2 -
 2 files changed, 73 insertions(+), 84 deletions(-)

-- 
2.43.0

