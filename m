Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6AD29995B
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 12:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747310809; cv=none; b=Ww0lHZHufXFnTIJa0xGNnh24CYFlZ0IS/uGsw8jAtlx6pWzOAGXZDrVt8wUbF3zFAvrYVPQ/F6x3VnJqbtmYdH5mGkEipxNV/YJEYQTeSYdilCLE/VUJ6/u7bleeCRQYcKbFnn2ubrIKWgmRifmWup20iFW94yM3S6m4Q/sa2uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747310809; c=relaxed/simple;
	bh=RxpJ3+cdNa83Xvx4t3HxQG7xX7sZgpp20hKEHZVRxBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DERzkELFB9TNW/OAiZZFLk06DM90uUNeWx3WDpWZz43oMRirHkjYGJwdubMtIfhMsmZ19Fe8gAUuQuFF7RcvMTQ9a4Gbf8uPKUElJ6r9HmETRuBa05axrs36oON1cLCU2cgVgNqjIC6tTfK9Xj3am+C8Savp6Ox4UN/4f6oUJws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZsPIQ6Fj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZsPIQ6Fj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B906C4CEE9;
	Thu, 15 May 2025 12:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747310808;
	bh=RxpJ3+cdNa83Xvx4t3HxQG7xX7sZgpp20hKEHZVRxBQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZsPIQ6FjeOgh/i+DcvxzGSCqDIp3LR69S56WmAscXsLywnFa67PD2OOu5FSRrhj3u
	 9PBX894ixKGarIR0aIUgXITnsWAQNSmZZ/rDhp5GGpUsy6VvuHo4y5z1yHksEQ9PyO
	 0FFfl13cIiqcmrH8QpnIL/k+atPlKDbkddCLZ7GEvDfsuxUYiiew9FAHo+cQ+HZZrW
	 3HNjFQ08VckK77HpKanWNnmOTfcaLVB3sAol7B6O/FR5t+CAEpcmOg1K4i35rTCmm3
	 Il2VVqNcOK8U0HMgw8z/Mj9aYCc38XIOghfj5+gNitdMbJvULRyYqmLNsTT+N8sada
	 va5xEJ0AXkMvw==
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
Subject: [PATCH 15/32] x86/boot/e820: Clean up __refdata use a bit
Date: Thu, 15 May 2025 14:05:31 +0200
Message-ID: <20250515120549.2820541-16-mingo@kernel.org>
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

So __refdata, like __init, is more of a storage class specifier,
so move the attribute in front of the type, not after the variable
name. This also aligns it vertically.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/kernel/e820.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
index ba4e6e6bb0a5..bb48dcc8a8ee 100644
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@ -60,9 +60,9 @@ static struct e820_table e820_table_init		__initdata;
 static struct e820_table e820_table_kexec_init		__initdata;
 static struct e820_table e820_table_firmware_init	__initdata;
 
-struct e820_table *e820_table __refdata			= &e820_table_init;
-struct e820_table *e820_table_kexec __refdata		= &e820_table_kexec_init;
-struct e820_table *e820_table_firmware __refdata	= &e820_table_firmware_init;
+__refdata struct e820_table *e820_table			= &e820_table_init;
+__refdata struct e820_table *e820_table_kexec		= &e820_table_kexec_init;
+__refdata struct e820_table *e820_table_firmware	= &e820_table_firmware_init;
 
 /* For PCI or other memory-mapped resources */
 unsigned long pci_mem_start = 0xaeedbabe;
-- 
2.45.2

