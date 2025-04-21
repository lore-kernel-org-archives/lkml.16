Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8FE1EDA2E
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 18:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745261578; cv=none; b=MpeU+owbh+GCEhBDtSdw2sDp+1bE4mP+j6yv4+ls6+73m5J641js4kVxFH8j7XoPyuWDs1s2nWdcGjth74W8UyXkpSVJWpkqTBW0T+D//37Qg+Z+vZv4LLQRKssKgrEuQti/TyqV035OyxuY000aIkAQ14q60XRZM4UVvjMlPL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745261578; c=relaxed/simple;
	bh=V1tQ53oGu5CeA4qMawnkPiBjIoOaEGEvKZ2zIm2OxYk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e7CCeJkttEveEHag+Fh7rS1hZXTOc2tBzOPdktumEW/b2zoPbKq1+LA4gKvWpiUUQ9pcVGFXCwVP4ABO+Z9wyT8I6pNMddkR2yzZxk+cbTCDT8zp+aNXyjvCxvgul6v8HAYu4wCKgiQGEo1sQj63F58/ZEQnNowOLdJRx/PqHoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WSAkxbjU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WSAkxbjU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 813BEC4CEE4;
	Mon, 21 Apr 2025 18:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745261577;
	bh=V1tQ53oGu5CeA4qMawnkPiBjIoOaEGEvKZ2zIm2OxYk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WSAkxbjUSDUaZB+cf5fRtZlwOcX6ZqRunt2wvmm+DZ7jMmoIR7t5eS1QdWp5pL6DT
	 GHFJ4hCYT9eC/O8AjSSSZdWlKoXyUbMgc+XlaUpystGSTgcpjhrhoTTMwxMv9143hK
	 IFwnrbWShoRDoNcNIfgxeUFTMqjl3y/FmI30bSrx55p6BsEc1xN9Olkd/2F3ErskPP
	 9ye7DyTP++xba6oeu/vTudB1jawcD6S9YOTo36xEhlrYfVTIh1GCbZ3XQM35g58nN3
	 MqwYI7Eg5chHegGbwYobWzMD62p8Gn65gvyCFCmC/VXzhnguzSRdIrJ6BfGM/8RQnc
	 09su2lKqjyP2w==
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
Subject: [PATCH 03/29] x86/boot/e820: Simplify the PPro Erratum #50 workaround
Date: Mon, 21 Apr 2025 20:51:43 +0200
Message-ID: <20250421185210.3372306-4-mingo@kernel.org>
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

No need to print out the table - users won't really be able
to tell much from it anyway and the messages around this
erratum are unnecessarily obtuse.

Instead clearly inform the user that a 256 kB hole is being
punched in their memory map at the 1.75 GB physical address.

Not that there are many PPro users left. :-)

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/kernel/setup.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index 9d2a13b37833..83cc265140c0 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -988,11 +988,9 @@ void __init setup_arch(char **cmdline_p)
 	trim_bios_range();
 #ifdef CONFIG_X86_32
 	if (ppro_with_ram_bug()) {
-		e820__range_update(0x70000000ULL, 0x40000ULL, E820_TYPE_RAM,
-				  E820_TYPE_RESERVED);
+		pr_info("Applying PPro RAM bug workaround: punching 256 kB hole at 1.75 GB physical.\n");
+		e820__range_update(0x70000000ULL, 0x40000ULL, E820_TYPE_RAM, E820_TYPE_RESERVED);
 		e820__update_table(e820_table);
-		printk(KERN_INFO "fixed physical RAM map:\n");
-		e820__print_table("bad_ppro");
 	}
 #else
 	early_gart_iommu_check();
-- 
2.45.2

