Received: from relay4.mymailcheap.com (relay4.mymailcheap.com [137.74.80.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6896E26BD8C
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 14:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=137.74.80.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739284070; cv=none; b=V4MgZ9POgQVE8JMyJWbb938KAUUQBav0kjAPryDB241ldiP7pGN9cSmDLTp4Y+4uj8XfyrWrCOpHoh2pPxgs9xvQk9j/0wFdqg3JR6ilntlzNBSG0rtGsG7b0OIWmCYOaMkUlONrwuOgaIZl2nxfyAJfbLePsXNZTZCA6JJuKFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739284070; c=relaxed/simple;
	bh=ykaLlg8HghwqKHvMRIYVlPnOo3Hdw86rjso/x8RKXFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NMledtO3VtogbQBOiCKUi/h9UC83I5ZR6LIeGtJ9mH5hsPKhPo1QGuKzgN5FU3w7kK42ymHzppMDFe8nTgqU7XjTDqaCEgGOgpbRiHUicNg+GjSQ5UN0gsRAmFv1p/skY0o022547zmcHpvR4+5XQ6jztEN9X7iqyxBHcoBd8zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io; spf=pass smtp.mailfrom=aosc.io; dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b=e/gML5h+; arc=none smtp.client-ip=137.74.80.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aosc.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b="e/gML5h+"
Received: from nf1.mymailcheap.com (nf1.mymailcheap.com [51.75.14.91])
	by relay4.mymailcheap.com (Postfix) with ESMTPS id 12A6E20319;
	Tue, 11 Feb 2025 14:27:40 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf1.mymailcheap.com (Postfix) with ESMTPSA id A3F544023E;
	Tue, 11 Feb 2025 14:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1739284059; bh=ykaLlg8HghwqKHvMRIYVlPnOo3Hdw86rjso/x8RKXFM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e/gML5h+N4T5zFb+89aGoEeB/kIkhHUwClhA3fowiCFNwMwkWZpegyDva+y/A5YtS
	 xsnvAzxxLoF+9PncyXNOsdEOxUdZVvbemNQKpiNT9T/tkbZMIZ1LklvXGqX4Is2ROr
	 lANBFZsaWBqOIwuL5e1aR0edV2QwiWKWu8tf/TDo=
Received: from localhost.localdomain (unknown [58.32.42.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id A4F99406D3;
	Tue, 11 Feb 2025 14:27:36 +0000 (UTC)
From: Kexy Biscuit <kexybiscuit@aosc.io>
To: yangtiezhu@loongson.cn
Cc: amd-gfx@lists.freedesktop.org,
	chenhuacai@kernel.org,
	jpoimboe@kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	peterz@infradead.org,
	Kexy Biscuit <kexybiscuit@aosc.io>
Subject: [PATCH] objtool: remove duplicate case value R_PPC64_REL32
Date: Tue, 11 Feb 2025 22:19:57 +0800
Message-ID: <20250211141956.553850-2-kexybiscuit@aosc.io>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20241217010905.13054-3-yangtiezhu@loongson.cn>
References: <20241217010905.13054-3-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: nf1.mymailcheap.com
X-Rspamd-Queue-Id: A3F544023E
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.90 / 10.00];
	MID_CONTAINS_FROM(1.00)[];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	ASN(0.00)[asn:16276, ipnet:51.83.0.0/16, country:FR];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	SPFBL_URIBL_EMAIL_FAIL(0.00)[kexybiscuit.aosc.io:server fail];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	TO_DN_SOME(0.00)[]

In arch/powerpc/include/uapi/asm/elf.h, R_PPC64_REL32 is defined as a
macro to R_PPC_REL32, makes the case value here being duplicate and
creates the following error...

arch/powerpc/decode.c: In function ‘arch_reloc_size’:
arch/powerpc/decode.c:114:9: error: duplicate case value
  114 |         case R_PPC64_REL32:
      |         ^~~~
arch/powerpc/decode.c:113:9: note: previously used here
  113 |         case R_PPC_REL32:
      |         ^~~~

Remove the duplicate case value to fix the error.

Fixes: "FROMLIST: objtool: Handle different entry size of rodata"
Signed-off-by: Kexy Biscuit <kexybiscuit@aosc.io>
---
This patch is required for this series to build on powerpc, however I'm
not sure if it's the preferred way... Please advise.

 tools/objtool/arch/powerpc/decode.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/objtool/arch/powerpc/decode.c b/tools/objtool/arch/powerpc/decode.c
index 3c95dd74fca0..7c0bf2429067 100644
--- a/tools/objtool/arch/powerpc/decode.c
+++ b/tools/objtool/arch/powerpc/decode.c
@@ -111,7 +111,6 @@ unsigned int arch_reloc_size(struct reloc *reloc)
 {
 	switch (reloc_type(reloc)) {
 	case R_PPC_REL32:
-	case R_PPC64_REL32:
 	case R_PPC_ADDR32:
 	case R_PPC_UADDR32:
 	case R_PPC_PLT32:
-- 
2.48.1

