Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C5D1C84AA
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 10:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743418650; cv=none; b=qrbYIMdCtdJ0VidPIuhEGcpJtAIGszXIGRkI7vUcA/g3dpztnpC3752CeaKbArzCM8rYO8BMYSDGbdqmLYArIqUz09K/K8Q4ySNyXD79u7ia0tyWUNcZdN/hwsg/odDdaIbTn6L27M24fuqjFHaft53sP08CMekIsQv3lHf+GI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743418650; c=relaxed/simple;
	bh=vZc4WLoF722KufXOX/s3fWR9QlQ5ECV3mb4MtzX7J4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tW0Uqot5FjnXKJFT32oYY0zSLjqVZ9TJFxPXNtgfVzdEN0sI0jdlCc3Ok28ftIXLSsEybyCssS5ODf69RDotDIwuR/1l2YZvIwyKUEU8be3gxWeWDZLTcfvPFHvUcckomKlOdEndBWkxawlbaCDadvCaCIonFWQEAmlJT5Fards=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YF2RlIl6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jCEmoNfH; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YF2RlIl6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jCEmoNfH; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YF2RlIl6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jCEmoNfH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YF2RlIl6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jCEmoNfH"
Received: from kitsune.suse.cz (unknown [10.100.12.127])
	by smtp-out2.suse.de (Postfix) with ESMTP id 8F78D1F38D;
	Mon, 31 Mar 2025 10:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743418646; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=akuXqyCZOSdlrQSLt/Khb4sbew/avXeSTkqZbTZoVGA=;
	b=YF2RlIl6UxN8gjtKv0fke8bouCvvzRT47LyJmr4ULr/9KeRuP9MYy/Zsjz2D7FzQQ0N9Ym
	9N3yo1NLUQKL3ggQB8T4Mw+2GTh5BNCtI/o42NQCbs/3sMi1UXLBstsuqCa6hvDkNa5Un4
	B34+bCrrCeqc4z5SMf6hQb/B66alz84=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743418646;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=akuXqyCZOSdlrQSLt/Khb4sbew/avXeSTkqZbTZoVGA=;
	b=jCEmoNfHFOR5dPqJlRHSH7G3ktjTYy1SPRHbig7fqJuMu1xf/bPM+2YX9xT+M53/SOpXGj
	6LUkv7dq+/o9aCDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743418646; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=akuXqyCZOSdlrQSLt/Khb4sbew/avXeSTkqZbTZoVGA=;
	b=YF2RlIl6UxN8gjtKv0fke8bouCvvzRT47LyJmr4ULr/9KeRuP9MYy/Zsjz2D7FzQQ0N9Ym
	9N3yo1NLUQKL3ggQB8T4Mw+2GTh5BNCtI/o42NQCbs/3sMi1UXLBstsuqCa6hvDkNa5Un4
	B34+bCrrCeqc4z5SMf6hQb/B66alz84=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743418646;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=akuXqyCZOSdlrQSLt/Khb4sbew/avXeSTkqZbTZoVGA=;
	b=jCEmoNfHFOR5dPqJlRHSH7G3ktjTYy1SPRHbig7fqJuMu1xf/bPM+2YX9xT+M53/SOpXGj
	6LUkv7dq+/o9aCDw==
From: Michal Suchanek <msuchanek@suse.de>
To: linuxppc-dev@lists.ozlabs.org
Cc: Michal Suchanek <msuchanek@suse.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org,
	"Nysal Jan K.A." <nysal@linux.ibm.com>
Subject: [PATCH v3] powerpc/boot: Fix build with gcc 15
Date: Mon, 31 Mar 2025 12:57:19 +0200
Message-ID: <20250331105722.19709-1-msuchanek@suse.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <875xjsjj6b.fsf@mpe.ellerman.id.au>
References: <875xjsjj6b.fsf@mpe.ellerman.id.au>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,linux.ibm.com,ellerman.id.au,gmail.com,csgroup.eu,kernel.org,google.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -2.80
X-Spam-Flag: NO

Similar to x86 the ppc boot code does not build with GCC 15.

Copy the fix from
commit ee2ab467bddf ("x86/boot: Use '-std=gnu11' to fix build with GCC 15")

Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
v2: Move the fix outside of ifdef to apply to all subarchitectures
v3: Change BOOTCFLAGS rather than BOOTTARGETFLAGS
---
 arch/powerpc/boot/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index 184d0680e661..a7ab087d412c 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -70,6 +70,7 @@ BOOTCPPFLAGS	:= -nostdinc $(LINUXINCLUDE)
 BOOTCPPFLAGS	+= -isystem $(shell $(BOOTCC) -print-file-name=include)
 
 BOOTCFLAGS	:= $(BOOTTARGETFLAGS) \
+		   -std=gnu11 \
 		   -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
 		   -fno-strict-aliasing -O2 \
 		   -msoft-float -mno-altivec -mno-vsx \
-- 
2.47.1

