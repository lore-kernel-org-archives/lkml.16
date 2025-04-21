Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B191F1317
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 18:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745261606; cv=none; b=t6+ohemgYqci/y6wir6Hohm4UQfMaLFjh2YSCybgiO09CXwK2po0+ulxqrK2PUX2AcVFjStSNP92AO/GwVCBZpinwSnAPyZJF4rZF3fi8/70pTFRX7nZFi4HhFTPTGult0p0Jq4+FY7O10S86R9IHPwWnOCehByry1dOkIH8hXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745261606; c=relaxed/simple;
	bh=llkZNwRDTXnM7RyZfx311thpcdgrfSKxzjxOVFqcJJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Eo0SoFFacKtn0/OogtVzu9OgZLKZeHDO7p17jf4rLwRP0THMirqt4YYRqVVctjXhwf4wMMV3VGdoVRj/dcjN31nDPVgiPNCDzGawVbXzh59JMhB2KHu5brfe3Bnvp96KAmy3viFMPtz1TaKBOZ7djcY3q5azkUyqejXA/DCC+Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GAf034F0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GAf034F0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DF14C4CEEB;
	Mon, 21 Apr 2025 18:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745261606;
	bh=llkZNwRDTXnM7RyZfx311thpcdgrfSKxzjxOVFqcJJ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GAf034F0Apeab9olix68xcaE9/Bq/3wKK/13vKGjS1xbGxWS/eJ1UcwKSUZ0Bnxvj
	 NHDSfNRkDFrqx2LSVviqujiMiOePdjAol/ejuanWS1iT1Fu+OxaY3DJEoU6RQb4Ln3
	 6U0+J6iKMVZQeyKEIVpBTdMS3PAD/EA7QOsP9OeQYAYNmaszfdp1nKQ95L3vTjgC7l
	 Q61xBki7W/9tfWZ7u7VxaN6e7SUlz6/lW6f6GIV3y/aZHZb/VYqikmngXa1K3wIrZr
	 Tq4Wkjb11O22oPUhlTJv3ueR2OL1EGwD7XT4J2TtaF7W/gWkN3/fdr10gXsRFFoiW3
	 3iP41nQN8cQDg==
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
Subject: [PATCH 13/29] x86/boot/e820: Improve e820_print_type() messages
Date: Mon, 21 Apr 2025 20:51:53 +0200
Message-ID: <20250421185210.3372306-14-mingo@kernel.org>
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

For E820_TYPE_RESERVED, print:

  'reserved'  -> 'device reserved'

For E820_TYPE_PRAM and E820_TYPE_PMEM:

  'persistent' -> 'persistent RAM'

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/kernel/e820.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
index 484419711ecf..ae05161896d4 100644
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@ -187,15 +187,15 @@ void __init e820__range_add(u64 start, u64 size, enum e820_type type)
 static void __init e820_print_type(enum e820_type type)
 {
 	switch (type) {
-	case E820_TYPE_RAM:		pr_cont(" kernel usable RAM");		break;
-	case E820_TYPE_RESERVED:	pr_cont(" reserved");			break;
-	case E820_TYPE_SOFT_RESERVED:	pr_cont(" soft reserved");		break;
-	case E820_TYPE_ACPI:		pr_cont(" ACPI data");			break;
-	case E820_TYPE_NVS:		pr_cont(" ACPI NVS");			break;
-	case E820_TYPE_UNUSABLE:	pr_cont(" unusable");			break;
+	case E820_TYPE_RAM:		pr_cont(" kernel usable RAM");			break;
+	case E820_TYPE_RESERVED:	pr_cont(" device reserved");			break;
+	case E820_TYPE_SOFT_RESERVED:	pr_cont(" soft reserved");			break;
+	case E820_TYPE_ACPI:		pr_cont(" ACPI data");				break;
+	case E820_TYPE_NVS:		pr_cont(" ACPI NVS");				break;
+	case E820_TYPE_UNUSABLE:	pr_cont(" unusable");				break;
 	case E820_TYPE_PMEM:		/* Fall through: */
-	case E820_TYPE_PRAM:		pr_cont(" persistent (type %u)", type);	break;
-	default:			pr_cont(" type %u", type);		break;
+	case E820_TYPE_PRAM:		pr_cont(" persistent RAM (type %u)", type);	break;
+	default:			pr_cont(" type %u", type);			break;
 	}
 }
 
-- 
2.45.2

