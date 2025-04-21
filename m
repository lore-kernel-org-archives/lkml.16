Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90C31F1906
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 18:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745261614; cv=none; b=c3p6ixgxr7sfAAYGz0VC+JJUMVFQu8BHPvIrN5WU3pOHJzy9VSWftPcXYXkzfonuCzmmk1a+iyqu+rsJ29RDgLi4Lf0ihAjex+GtrTKpHFhhURdzIaD7TkJU/NI+bRKwwLvI3uEhx28r+qtdn/R3+x5ROeuti2fpaIRcaS3yQ20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745261614; c=relaxed/simple;
	bh=JV23K5UID/SGrdWU1EzCvLuSQ1bEeNBQX5LBK1pmoeY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pmBENmfx/A/JqwiqwQkRf6dw3fVoANwGs78QUH+b1sAc4MpPYmsHfqMWJ3TNqyzVFynyuJVVLFMu7cA/53BmEoEVi8DCJFuTn2u/Q8sggnj0PkcwiEnU2oMTW5qaXELtXuPvzuaw6OyFxeacZBG4wy7ZtdE8tmpFfX3+zxdYvj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fNwEucwk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fNwEucwk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1902BC4CEF0;
	Mon, 21 Apr 2025 18:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745261614;
	bh=JV23K5UID/SGrdWU1EzCvLuSQ1bEeNBQX5LBK1pmoeY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fNwEucwkjdKKKxfI6lY4rQ6hhdjomRo8STDfXzFaavVdKH7nsykrJarmloUCbaDEb
	 WTBkMnwzelzx9rsUaXbaYAwOXx260mnW3yYnGzkYNgGbUOqzQeSwuuPmHWGA+HL/vo
	 DX2F5ah4FSXdscB3qgXn0l5zUqfjZV6TNtaCcM9SZ1ckflMFI8kvJrFAUD4T6250R0
	 EIrsM9Wrb34QaBq+1vpB9z0LqICX6Cl6gwMSuw5+KDRVaDhUQ+fy9mzvZk6HeMuv1l
	 wgPuFbWslsQ0FJYzIzlHkQUHj2YmQ5w3Q6mB/sE288JWLZ45nNdYXJhe0fT1ixuARq
	 4aiiVsjCYPC3w==
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
Subject: [PATCH 16/29] x86/boot/e820: Remove unnecessary header inclusions
Date: Mon, 21 Apr 2025 20:51:56 +0200
Message-ID: <20250421185210.3372306-17-mingo@kernel.org>
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

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/kernel/e820.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
index cb4e5349fd22..158f9a46ba55 100644
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@ -9,13 +9,11 @@
  * quirks and other tweaks, and feeds that into the generic Linux memory
  * allocation code routines via a platform independent interface (memblock, etc.).
  */
-#include <linux/crash_dump.h>
 #include <linux/memblock.h>
 #include <linux/suspend.h>
 #include <linux/acpi.h>
 #include <linux/firmware-map.h>
 #include <linux/sort.h>
-#include <linux/memory_hotplug.h>
 
 #include <asm/e820/api.h>
 #include <asm/setup.h>
-- 
2.45.2

