Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B770F2E1755
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 23:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749771633; cv=none; b=bwhntHDLlwhnLnb9e8jzwdBL/a4Xa1ciq/DCbf7W43SsD8DvxFz3vuCHS5lY+o1GfB7pRniYNdAeQzxzG1BzsHnnki0u8eZMhGJpRbmtpwG+qk1v06dO8GrAK7T0TeloXO6g+dzCO4rVYD2Je6um1I1Ok7AOR5GQ/vzQkFP+Dfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749771633; c=relaxed/simple;
	bh=VM+Tq2JHqf5zPcRiSy1otnHq9UT5dGu3SFfeNLN2rO8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i59tsBTIGete+jaC5FSFqrXfSQorPNH3JD2VdOVye77AYjM7IBi8IGABrfTXhBOj5/kvIpqGlC+BUGmi0IFozxYCvuU/Fg6czxFjoH3q5nfw2pc6rwt/yXQTTYzkXru3Z4kqJXWvDrShw4aYjzzN51Z2ZvSZPvJf2Wi3AFoiNSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=h/3NmRVl; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=aHDxpVi+; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="h/3NmRVl";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="aHDxpVi+"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749771629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9Dt63MaH2HMdvBtvlDsryqLPF+tYIcYR7emziyJ9L1M=;
	b=h/3NmRVlk2fm7TIjkaNzkyJYlzXqhwXNQGi+sVhT9qyosudX+8lpd9V51peiOIkGpWX3gu
	WV124HhcuW4lYEWRNoyuuICr51AwA5BspySa01/LusBytfEKn/Imcre10sELIFdxDB6rxD
	B9op0g5VYOZ+F1bnrsdQGXWoLXDIju6MuXmGIR4UdywvrOi9PSF4GGITJzx1xRoodpQumm
	FmfREoMqeo58/ZSFS0kSbRqQEIfiIR55Q58BappjFguVu4QCc86esjc5Qted2C5lMlahx6
	ueSGymieQ7xowD/ozHFh0zkcc6a9r2eyXDSMVzKyTTOqOz9YpAxf0OogZ4Dalg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749771629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9Dt63MaH2HMdvBtvlDsryqLPF+tYIcYR7emziyJ9L1M=;
	b=aHDxpVi++tBoRmkbQDbIMzD5Ah+4ZXOWLWi/PCauyxFyxeJhKAsq3oXyLMCQUj4/8hvQxM
	L8U/TnVH/jStd1Bg==
To: Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Sean Christopherson <seanjc@google.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	John Ogness <john.ogness@linutronix.de>,
	x86@kernel.org,
	x86-cpuid@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	"Ahmed S. Darwish" <darwi@linutronix.de>
Subject: [PATCH v3 03/44] x86/boot: Reorder sme.c headers alphabetically
Date: Fri, 13 Jun 2025 01:39:29 +0200
Message-ID: <20250612234010.572636-4-darwi@linutronix.de>
In-Reply-To: <20250612234010.572636-1-darwi@linutronix.de>
References: <20250612234010.572636-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The source file uses cpuid_*() macros, but it does not include
<asm/cpuid/api.h>.  Sort its include lines so that the CPUID header can
be included next.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/boot/startup/sme.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/boot/startup/sme.c b/arch/x86/boot/startup/sme.c
index 70ea1748c0a7..922b236be02f 100644
--- a/arch/x86/boot/startup/sme.c
+++ b/arch/x86/boot/startup/sme.c
@@ -34,15 +34,15 @@
  */
 #define USE_EARLY_PGTABLE_L5
 
+#include <linux/cc_platform.h>
 #include <linux/kernel.h>
-#include <linux/mm.h>
 #include <linux/mem_encrypt.h>
-#include <linux/cc_platform.h>
+#include <linux/mm.h>
 
+#include <asm/coco.h>
 #include <asm/init.h>
-#include <asm/setup.h>
 #include <asm/sections.h>
-#include <asm/coco.h>
+#include <asm/setup.h>
 #include <asm/sev.h>
 
 #define PGD_FLAGS		_KERNPG_TABLE_NOENC
-- 
2.49.0

