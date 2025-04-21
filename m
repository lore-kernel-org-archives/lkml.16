Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FD61EF0A6
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 18:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745261651; cv=none; b=azpMciJ4YNDf1QmazD6dCgTTO+enCsNJKHhCC2ZEaM+XxY0VHkBSouIMEbl3nfFIwqokfB3zVBkx9gdEOE31MreYIO/+7N+qwpjsr08xLzlJfhJ9jXHia2PVDZkp24yVLt+1ZxcORd7JBZUKnZNLWPldfH0+fjddVqwB08x9m6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745261651; c=relaxed/simple;
	bh=8dqxYJzFH0LdMCALju2Kx9n/AXIDOW004jSqtWom7ZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RVghvehmsvolnZ9xqcsg40/XHkSsk28h5eRJfIQAeHvDMWOivvl3VtyulcRLRpRfchm19iP6CU6xssGM1VEnSzysrcr5ZZM6NOp8teSF3Vj1FLOO/XCxMOvzELtjHu+s3Y2jOfQc81s3J6hOih5gJy4gsS779CGaQ0kiJCqa9E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OuPdEqV2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OuPdEqV2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3C30C4CEEA;
	Mon, 21 Apr 2025 18:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745261651;
	bh=8dqxYJzFH0LdMCALju2Kx9n/AXIDOW004jSqtWom7ZU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OuPdEqV2w2o7F+mKk0BuSKBsPzTgBvRGB3SzxPCExQwT0Q470oP/bqG+H8rLpyEo/
	 95UZWLL6WjMHZYCjtYYhhpur1KRhyNTf2jV0aU+5v7ItXhRiWI5WkePNOH+9DRJ8jb
	 cqvaZWQqopP/63E7quExlAGVW5WOltXHHat+RNytkQKdBYjgC/As1CZZPc4t8i31+w
	 1yUJRKQdFSq3Xn9mfJ0YNXVPuEYLg6YrLYdEQTcI9poLOSVJbIHo9Pz49sQhAqxNpY
	 LTOEUmI0+MLKE/ySluZT2VvPdlzXhjTi/qYKUa06//h3PS3UCR91AGLr5f0leXpUTC
	 nFZGATRj5SYBw==
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
Subject: [PATCH 29/29] x86/boot/e820: Treat non-type-2 'reserved' E820 region types as E820_TYPE_RESERVED
Date: Mon, 21 Apr 2025 20:52:09 +0200
Message-ID: <20250421185210.3372306-30-mingo@kernel.org>
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

Paul Menzel pointed out that ACPI specification 6.3 defines 'reserved'
E820 region types as E820_TYPE_RESERVED (type 2):

 > Table 15-374 *Address Range Types* in the ACPI specification 6.3 says:
 >
 > > Reserved for future use. OSPM must treat any range of this type as if
 > > the type returned was AddressRangeReserved.

This has relevance for device address regions, which on some firmware such
as CoreBoot, get passed to Linux as type-13 - which the kernel
treats as system regions and registers them as unavailable to drivers:

	static bool __init e820_device_region(enum e820_type type, struct resource *res)

	...

        case E820_TYPE_ACPI:
        case E820_TYPE_NVS:
        case E820_TYPE_UNUSABLE:
        default:
                return false;

Users of such systems will see device breakage on Linux, which they
have to work around with iomem=relaxed kind of boot time hacks to
turn off resource conflict checking.

Follow the ACPI spec and change the Linux E820 code to treat unknown/reserved
E820 region types as E820_TYPE_RESERVED device memory regions.

Reported-by: Paul Menzel <pmenzel@molgen.mpg.de>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/kernel/e820.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
index f9caf4c922ea..c36261d78109 100644
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@ -1140,8 +1140,10 @@ __init static bool e820_device_region(enum e820_type type, struct resource *res)
 	case E820_TYPE_ACPI:
 	case E820_TYPE_NVS:
 	case E820_TYPE_UNUSABLE:
-	default:
 		return false;
+	/* Reserved E820 types should be treated as device memory regions: */
+	default:
+		return true;
 	}
 }
 
-- 
2.45.2

