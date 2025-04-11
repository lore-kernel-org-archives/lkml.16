Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D9F27E1D6
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 07:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744355063; cv=none; b=AaM8GRj8iKIFXX8XJb1ukwZ8D2e+kMEaOd4lJssuRsJ7akLOoSJUBGjx8W8CQaj1o67t0DW0qmL64oKu6wARY0CNP1VEINwgYIWXCRuDjawZy7fEdsCHqghEuhqsrS5f74wL1tO9VU732gOtqKvKiIGQP/KX0W5EdaP+HlTJdLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744355063; c=relaxed/simple;
	bh=VDxcma+ffVDfUCyYSA4dC9lEW94546qLv3OjqCFfl/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X6Y+xYMpYRr+KJ+R+oEkO34s3Vvzh7X1zAULA6XaynqoUwIWFM+t8PGFQGPT3FQGOSeL0+yFC0N2j6pp8vaQqDs0hGoRTl7tsVqqPeFa7oknbh+VOFSdQRmICSKzmX/Tzjovv5/cNZMkqjKIPLI1eO5Jq3+EoQSvSEgN3nrEjxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=XBRnSoPx; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=gTqef5cX; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="XBRnSoPx";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="gTqef5cX"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744355060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SvwYAWGlxs9sA7IjpzfZ23cbIREBDFJZvPhkAw/gpSE=;
	b=XBRnSoPxuI+umlxNW5JRwJ0x53Xj+KmtrpLV7ZR4nzvlU16wvbMXfiKDfC57CXOy1xJ4Co
	8QcsDLUgwNlqAFxSeHe9H4qKhJiuz7IqW05HmarUwVTgNSY1xtvZCepW02p4IXaWciAMSC
	d0IZ/izrvRP0LkMAi07bZI7QEbUnmpAoYBs4d4RYzifznJzW4IA784BhTKp2MTBK+2ezJK
	baN7nba1NNEyQJ4mTbCy2eNsGiPf2Cz8XV486FE3b08TkR1M6cQxZ+zxi8TOjF4Yk8ghtD
	x9nacLSKjvUNPktZaTBWr+dLOqp1pIRykDH+L04L02fR3qHJBVO5pNynpCiKgw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744355060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SvwYAWGlxs9sA7IjpzfZ23cbIREBDFJZvPhkAw/gpSE=;
	b=gTqef5cXl80jBnDIi+1jMIH3XRJlcCT0efiICgBuisJnJLIZGRvANcDWuGtS/+fqWdBupT
	yLngpQEoQtNmo3Bw==
To: Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>,
	x86@kernel.org,
	x86-cpuid@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	"Ahmed S. Darwish" <darwi@linutronix.de>
Subject: [PATCH v1 1/2] x86/cpuid: Remove obsolete CPUID(0x2) iteration macro
Date: Fri, 11 Apr 2025 09:04:00 +0200
Message-ID: <20250411070401.1358760-2-darwi@linutronix.de>
In-Reply-To: <20250411070401.1358760-1-darwi@linutronix.de>
References: <20250411070401.1358760-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CPUID(0x2) cache descriptors iterator at <cpuid/leaf_0x2_api.h>:

    for_each_leaf_0x2_desc()

has no more call sites.  Remove it.

Fixes: 4772304ee651 ("x86/cpu: Use consolidated CPUID leaf 0x2 descriptor table")
Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/cpuid/leaf_0x2_api.h | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/arch/x86/include/asm/cpuid/leaf_0x2_api.h b/arch/x86/include/asm/cpuid/leaf_0x2_api.h
index 46ecb15e92d9..09fa3070b271 100644
--- a/arch/x86/include/asm/cpuid/leaf_0x2_api.h
+++ b/arch/x86/include/asm/cpuid/leaf_0x2_api.h
@@ -40,29 +40,6 @@ static inline void cpuid_get_leaf_0x2_regs(union leaf_0x2_regs *regs)
 	}
 }
 
-/**
- * for_each_leaf_0x2_desc() - Iterator for CPUID leaf 0x2 descriptors
- * @regs:	Leaf 0x2 output, as returned by cpuid_get_leaf_0x2_regs()
- * @desc:	Pointer to the returned descriptor for each iteration
- *
- * Loop over the 1-byte descriptors in the passed leaf 0x2 output registers
- * @regs.  Provide each descriptor through @desc.
- *
- * Note that the first byte is skipped as it is not a descriptor.
- *
- * Sample usage::
- *
- *	union leaf_0x2_regs regs;
- *	u8 *desc;
- *
- *	cpuid_get_leaf_0x2_regs(&regs);
- *	for_each_leaf_0x2_desc(regs, desc) {
- *		// Handle *desc value
- *	}
- */
-#define for_each_leaf_0x2_desc(regs, desc)				\
-	for (desc = &(regs).desc[1]; desc < &(regs).desc[16]; desc++)
-
 /**
  * for_each_leaf_0x2_entry() - Iterator for parsed leaf 0x2 descriptors
  * @regs:   Leaf 0x2 register output, returned by cpuid_get_leaf_0x2_regs()
-- 
2.49.0

