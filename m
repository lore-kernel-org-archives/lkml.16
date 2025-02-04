Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A13D2054E3
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 23:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738711116; cv=none; b=rlCjXH9P0wn0HexH/Se7Y1zEzFtMQYi/L1aVds2OYIV6Zu1bBVNoleaKPUTFh5tNzpx7HIWTkuK7dZrhMdGRAnwYT6Lb46FUtaOP5xksZ+8Z4GFc1KWDNIhVAaSJKCa+CcCOLNGEYqQoTZBkw9mkgHvoG9nlkEVR5ILMkQqXfe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738711116; c=relaxed/simple;
	bh=BuZF9IYapQ79vT2lDBiaxzXpexQR5dQMpjFSWcuU+Vg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RgIsNf4SGSww7qxMLptCxOfHvKw4hQrEDxosA4hMrQK/oxo0ygo/TNZ0txKUtX9rM14O0UmQcypr2xvnmdOiNykcurMYT8r4Mp9+V+N4szpRBJB0XOPQuVynrsGDeSe2aqAi27fkOOl9zp7NNimMu7HyImSNrTxCyXy/2STm4h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=oXtRpJ/d; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=oXtRpJ/d; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="oXtRpJ/d";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="oXtRpJ/d"
Received: from kunlun.arch.suse.cz (unknown [10.100.128.76])
	by smtp-out2.suse.de (Postfix) with ESMTP id 70C861F381;
	Tue,  4 Feb 2025 23:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1738711112; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=W2zDfhuqWd+jazrB8zXGTb+ziTtldHXymsK1G6Xuz4E=;
	b=oXtRpJ/dOPnRyXjk93k2nX9ZWhTrLZQEcJ4ipHU6UExkYYywGX6a6HwNNAIT9FZRfICkAJ
	0WfDABpNwYVO+WJTmuJoK0SXfCabSWRXSezKnvSj7AEZMkgzeT1k77LI77xM6qKJWIaDOK
	3hFfbTbGrElm/XbU+GGYvLlK3+ZqyR8=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1738711112; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=W2zDfhuqWd+jazrB8zXGTb+ziTtldHXymsK1G6Xuz4E=;
	b=oXtRpJ/dOPnRyXjk93k2nX9ZWhTrLZQEcJ4ipHU6UExkYYywGX6a6HwNNAIT9FZRfICkAJ
	0WfDABpNwYVO+WJTmuJoK0SXfCabSWRXSezKnvSj7AEZMkgzeT1k77LI77xM6qKJWIaDOK
	3hFfbTbGrElm/XbU+GGYvLlK3+ZqyR8=
From: Anthony Iliopoulos <ailiop@suse.com>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: <linux-kernel@vger.kernel.org>,
	Naveen N Rao <naveen@kernel.org>
Subject: [PATCH] powerpc64/ftrace: fix module loading without patchable function entries
Date: Wed,  5 Feb 2025 00:18:21 +0100
Message-ID: <20250204231821.39140-1-ailiop@suse.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

get_stubs_size assumes that there must always be at least one patchable
function entry, which is not always the case (modules that export data
but no code), otherwise it returns -ENOEXEC and thus the section header
sh_size is set to that value. During module_memory_alloc() the size is
passed to execmem_alloc() after being page-aligned and thus set to zero
which will cause it to fail the allocation (and thus module loading) as
__vmalloc_node_range() checks for zero-sized allocs and returns null:

[  115.466896] module_64: cast_common: doesn't contain __patchable_function_entries.
[  115.469189] ------------[ cut here ]------------
[  115.469496] WARNING: CPU: 0 PID: 274 at mm/vmalloc.c:3778 __vmalloc_node_range_noprof+0x8b4/0x8f0
...
[  115.478574] ---[ end trace 0000000000000000 ]---
[  115.479545] execmem: unable to allocate memory

Fix this by removing the check completely, since it is anyway not
helpful to propagate this as an error upwards.

Fixes: eec37961a56a ("powerpc64/ftrace: Move ftrace sequence out of line")
Signed-off-by: Anthony Iliopoulos <ailiop@suse.com>
---
 arch/powerpc/kernel/module_64.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
index 34a5aec4908f..126bf3b06ab7 100644
--- a/arch/powerpc/kernel/module_64.c
+++ b/arch/powerpc/kernel/module_64.c
@@ -258,10 +258,6 @@ static unsigned long get_stubs_size(const Elf64_Ehdr *hdr,
 			break;
 		}
 	}
-	if (i == hdr->e_shnum) {
-		pr_err("%s: doesn't contain __patchable_function_entries.\n", me->name);
-		return -ENOEXEC;
-	}
 #endif
 
 	pr_debug("Looks like a total of %lu stubs, max\n", relocs);
-- 
2.47.0

