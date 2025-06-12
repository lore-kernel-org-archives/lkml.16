Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08212ECE9C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 23:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749771759; cv=none; b=pMLBGkaNoaB1RUrITpE2pZ50oLNz2pQ/jab35b/31jeOHNw2CqocpT4D78AXb7V74J4emId8e4iXWisOK6GtLAlLvQoxtBYRe4pmToezYPEyLyepJ+HoPcgVogcd1woVVAupjZ738W18lGhoFMEnch1fZ8B2ZJ5FoheMmddUhP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749771759; c=relaxed/simple;
	bh=FTESbv55VSuQPuAp2vy1/V9XHlZBZKHsuwSmEztqyPo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jwh1Z/Oa7/vdMUe6oU+y1sGTkSOvEceNJEDwEUwVzSA/qaGp1nALnQEQnDKwpp7y9IiZK8LN53gEyONu5S8C+nI27FIi7jSXKjd7GDYc8hYDC8g/UGx/6tS07zwLrBlXxJC67dNvUlBEP1WJIQXj7plxHLB/Oqr7nY+S7gqMaks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=E4HADOp7; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=+OBFs0tk; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="E4HADOp7";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="+OBFs0tk"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749771756;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fFZQmugutsviUyhvi1xQJowcmdC20YjG3suPpqwyY4s=;
	b=E4HADOp7Bw+WDYz5MuYnIl4E4uUNIl4dTAeA14AZ4Auoq3I3Aw3oSwJvkB30v9N2CYsnfm
	jB6SeE51Pj2qiExuve5GIfF/thvlFlvcwSowg7NpocbM1mPILQx4u6omsvZ2rCb3haYgR8
	fcfakJNnPaVVAdlNVy5CybT8VDqsuOiZcLYWD9Qtx4poDKSx1fdA8s+TjX5jn6ff7du5IH
	xIVSnWmZ4T6HjbjqgbiuiLByr/auUe8/5rYLJ16NqrqVapwpHf/Wv5SdilG3MXZxHS6Z83
	wMvzcVlFRNo1A/RLG4PWvv4lQ7BV3sPmxsTXUDpe060BanJiWj5F1Cp3CY5p4A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749771756;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fFZQmugutsviUyhvi1xQJowcmdC20YjG3suPpqwyY4s=;
	b=+OBFs0tkHRkO2grtUs0lm8+N1KzGdboqBtC+JmE2p2nny3jk+cpbeKSvEKT+H0FkMJcvgy
	pJIUR/QWOGFPoFAA==
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
Subject: [PATCH v3 41/44] x86/cpu: <asm/processor.h>: Do not include CPUID API header
Date: Fri, 13 Jun 2025 01:40:07 +0200
Message-ID: <20250612234010.572636-42-darwi@linutronix.de>
In-Reply-To: <20250612234010.572636-1-darwi@linutronix.de>
References: <20250612234010.572636-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

<asm/processor.h> includes the CPUID API header <asm/cpuid/api.h>, but
all what it actually needs are data types from <asm/cpuid/types.h>.

Modify the header to include <asm/cpuid/types.h> instead.

Note, this allows the CPUID API header to include <asm/processor.h> next,
without inducing a circular dependency.  This will be needed by the
upcoming centralized CPUID model APIs.

Note, a large number of call sites were already using the CPUID APIs
without including <asm/cpuid/api.h>.  They directly or indirectly
included <asm/processor.h>, which included the CPUID API header.  Such
call sites have been modified, by parent commits, to explicitly include
the CPUID API header instead.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/processor.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
index b5d90b60191b..88f8ee33bfca 100644
--- a/arch/x86/include/asm/processor.h
+++ b/arch/x86/include/asm/processor.h
@@ -16,7 +16,7 @@ struct vm86;
 #include <uapi/asm/sigcontext.h>
 #include <asm/current.h>
 #include <asm/cpufeatures.h>
-#include <asm/cpuid/api.h>
+#include <asm/cpuid/types.h>
 #include <asm/page.h>
 #include <asm/pgtable_types.h>
 #include <asm/percpu.h>
-- 
2.49.0

