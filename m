Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3861F3B98
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 18:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745261620; cv=none; b=FDabyhwKJLpVPzqnSzgbVF9SlZdf2C2vq4kHpJJFxdWl9/k3iLkJcpulHMaLG1bohgxxmkrDS3MCSw/XCMoBXVcWaorHgdtp8OL4wQuQQ4WBppzGTUdYUnNMTPGj5hyVe1oi7/Fy7xl1Hy7PN1Fcfv5KQb/ABHn5kwxFplruMGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745261620; c=relaxed/simple;
	bh=Byaj85c16GdgkFY1HUTUudSVyNy63/4LKMI9cvomcnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PHr7P4HcDyi/lCMQsiIVOSZOC9gZ1ZhkMbivGFxqNkjCINo68J1xrgJDuu1iFvb1DfSPLGBgQfbCxlgeTinWky0jhLPiPMU+fUczRCLBU0sluRiZdIRNYxT+vMh9GtjKAvUcJazy07phWwrQ5WcbWsN7fjh4tEAw+KKjCn1I1Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HLyV6/Sh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HLyV6/Sh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6C11C4CEEF;
	Mon, 21 Apr 2025 18:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745261620;
	bh=Byaj85c16GdgkFY1HUTUudSVyNy63/4LKMI9cvomcnQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HLyV6/Shd3wIFtWqpxV2JSSeLwSdKCYXg29bpmWuHdMEm1hjVOhveF/1kT3J7ORHE
	 IZ5qB12WyuF2bDeKlpejxhmnl4tbXJzbLemz7ef1CihQbeO774N108IgjW2JhdEfyl
	 +dxGQhcDaK4RS8WAveavA54GAmLMA6OUzJVotvK3NHrcfVvZAfMVFFj63CkCaC0N1l
	 5hGPmvPBEh8Ad8bIr4a6hQn9xzHyWpLVhlAGBfnQQ61Mc+zo06ADnlFw2Ho59DBqO/
	 Km4JfLo2qQrBbFZM6MeLSq2dqGT4R3zkJLXJJJtkxwItsRp1PmNtfy1BMYHkHrcXxV
	 bHF/ZSdJZnqYA==
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
Subject: [PATCH 18/29] x86/boot/e820: Change struct e820_table::nr_entries type from __u32 to u32
Date: Mon, 21 Apr 2025 20:51:58 +0200
Message-ID: <20250421185210.3372306-19-mingo@kernel.org>
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

__u32 is for UAPI headers, and this definition is the only place
in the kernel-internal E820 code that uses __u32. Change it to u32.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/include/asm/e820/types.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/e820/types.h b/arch/x86/include/asm/e820/types.h
index 80c4a7266629..df12f7ee75d3 100644
--- a/arch/x86/include/asm/e820/types.h
+++ b/arch/x86/include/asm/e820/types.h
@@ -83,7 +83,7 @@ struct e820_entry {
  * The whole array of E820 entries:
  */
 struct e820_table {
-	__u32 nr_entries;
+	u32 nr_entries;
 	struct e820_entry entries[E820_MAX_ENTRIES];
 };
 
-- 
2.45.2

