Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD40253923
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 12:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747310784; cv=none; b=aDPrJbhFPBJEcaHA8Wt5pBSkeJwIuGAD1P6XYzXtaeM7MkjhKgLP6c9pHWOsodY5JSugkFgSIAqoJzdG7p3PmshXXKcjcVjAUbCQBfNGsWyXiU1UqcEVz4w+Utn34PmCCN4VdQPC/Vp2QOUrBQM2YD4xjH4uDfRIYIRsxWUK93M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747310784; c=relaxed/simple;
	bh=zp7SIN7s30Adozj+y2qmFjn+RbOfC2rbFOJHPlbNL5U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ra9MWI8Nu6ocIT8BicIoNYc+Wf/J1+YJsPC1pzI8YxcWkanqAlj+VAT9kJrftBR8r676kaOzTinuHzU6jvYVcqHoawvHHy2+VXH4nYIj0magWC08InYokkQbK5vRLvf4dwi5mcLZKPco6EMAypW8/ypD5IlrQt28GQYwTvMsD28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V6M3EDwO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V6M3EDwO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE229C4CEF0;
	Thu, 15 May 2025 12:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747310784;
	bh=zp7SIN7s30Adozj+y2qmFjn+RbOfC2rbFOJHPlbNL5U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V6M3EDwOhdniVLWLwIiDZ4RxKI8mkbcmcrkKwqOtAzwQLhdWJAnhQBGi5DKj4ULI+
	 ewtWr1n/LH5hFCZd0uJrBq126AIDxdPYacOHq+yFT4g+FxHERg0pXW90oVGrXwBumT
	 IpO09lUpxLkWIfxfcUUMx5eux95ORLMJozjFjBaH9v+BvEwd8p7t+msvIJSLNxESMV
	 XaDVcl6vf/3sSPBIQqusM+xiorjqHxVBkk7qmLn3rTnd1jgnhpGpJlncIwRGz9r61H
	 t5AUYXzDpYZJyuaEJp07ls1A+1f9x9na+/JF9bvvJo00zLzJyZ/EtrRdLQ0Z7IcI6O
	 5mmwEBBGFelmw==
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
Subject: [PATCH 08/32] x86/boot/e820: Print E820_TYPE_RAM entries as ... RAM entries
Date: Thu, 15 May 2025 14:05:24 +0200
Message-ID: <20250515120549.2820541-9-mingo@kernel.org>
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

So it is a bit weird that the actual RAM entries of the E820 table
are not actually called RAM, but 'usable':

	BIOS-e820: [mem 0x0000000000100000-0x000000007ffdbfff]    1.9 GB usable

'usable' is pretty passive-aggressive in that context and ambiguous,
most E820 entries denote 'usable' address ranges - reserved ranges
may be used by devices, or the platform.

Clarify and disambiguate this by making the boot log entry
explicitly say 'System RAM', like in /proc/iomem:

	BIOS-e820: [mem 0x0000000000100000-0x000000007ffdbfff]    1.9 GB System RAM

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
index 7f600d32a999..0a324d0db60e 100644
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@ -187,7 +187,7 @@ void __init e820__range_add(u64 start, u64 size, enum e820_type type)
 static void __init e820_print_type(enum e820_type type)
 {
 	switch (type) {
-	case E820_TYPE_RAM:		pr_cont(" usable");			break;
+	case E820_TYPE_RAM:		pr_cont(" System RAM");			break;
 	case E820_TYPE_RESERVED:	pr_cont(" reserved");			break;
 	case E820_TYPE_SOFT_RESERVED:	pr_cont(" soft reserved");		break;
 	case E820_TYPE_ACPI:		pr_cont(" ACPI data");			break;
-- 
2.45.2

