Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1886F2989BD
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 12:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747310767; cv=none; b=U7qJzSN/1O75fzKEXS1qNi0MEmc1RqLLhqTP8KuV7HNOm6BU5zo/FC9XH5PCNaszaIyKv0beGvx3wM4/vS+eHrvRaCy0jJne01e+t70AslcpCgxVc0dFHwufH0E+Z31GoAfJ9jFXmpZ3nALEs5xclRCY+Cji6E+4saaxgaBP5eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747310767; c=relaxed/simple;
	bh=k4jykQV1oqIHmudTK/CHYBW3w0kECTCzyR+C3gMwcJw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IFr0mQ1CSO9QWQAV1iCdkuVxcIjJn1fT5afeB5pfTN6ljGcbgXwPGyRFvuPHtUkLe1Bm+drKAaUh+6fiYNjwdNskT6IB+7/kcW6RTciWBbNIiaaoAW/48Afk5DKcd1OLHavX317OWBxL2MXPj1KFIufnjW7PTAPD5ylK+qLQeFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RCTbsz/O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RCTbsz/O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88190C4CEE7;
	Thu, 15 May 2025 12:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747310766;
	bh=k4jykQV1oqIHmudTK/CHYBW3w0kECTCzyR+C3gMwcJw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RCTbsz/OQbDvVGciSrfokIYRilNXj6qPQTohsT4U1eaEejTMSi3P9dQfL+C/l8YrE
	 GrdzrsldglWU6yUYOdyivC0VzPJTrDY26zG4tHZACisSq6Bm40NDvxX5kDBgbaJem3
	 MJ5eMYbm7rzvpZLNL8b1Gu0MSHFKe0c1vIK79nAjo8VIPu9I9Ocewh0dbq0tYEpYab
	 6h1uz33TxYTWdv4ivpn4QhUR/vkZ7ejiuY+lXUNlstjoik2Jj5p07UVpXg1v8Jt/v5
	 yI8cStxn0sr3eUkSbvOx9Ix9j6kt3uA6laiAf8eG9nULn6i6kQ/oTRTs/l+PxJU2R4
	 WrHsFJ9FWX1kw==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Ingo Molnar <mingo@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
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
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH 03/32] x86/boot/e820: Simplify the PPro Erratum #50 workaround
Date: Thu, 15 May 2025 14:05:19 +0200
Message-ID: <20250515120549.2820541-4-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250515120549.2820541-1-mingo@kernel.org>
References: <20250515120549.2820541-1-mingo@kernel.org>
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
index 7d9ed79a93c0..f40dffc3e014 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -984,11 +984,9 @@ void __init setup_arch(char **cmdline_p)
 	trim_bios_range();
 #ifdef CONFIG_X86_32
 	if (ppro_with_ram_bug()) {
-		e820__range_update(0x70000000ULL, 0x40000ULL, E820_TYPE_RAM,
-				  E820_TYPE_RESERVED);
+		pr_info("Applying PPro RAM bug workaround: punching 256 kB hole at 1.75 GB physical.\n");
+		e820__range_update(0x70000000ULL, SZ_256K, E820_TYPE_RAM, E820_TYPE_RESERVED);
 		e820__update_table(e820_table);
-		printk(KERN_INFO "fixed physical RAM map:\n");
-		e820__print_table("bad_ppro");
 	}
 #else
 	early_gart_iommu_check();
-- 
2.45.2

