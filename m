Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071052F2706;
	Thu,  3 Jul 2025 18:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751568258; cv=none; b=tQENx87rgFzR8WdvVjzv5KXNyTI1I9CsXJCH/DNw21YO+bNe6cWcVgHulPpz6oiC04HUkIaGJ8ZYpjEx3Plm2SkEz3M4nSwAkUcnJrrDR9zfeMGYrePn/5uxXlGDu64XPpJLk9ttm/tuUq1X6IqKL0/Gr3D35ZEtZEr6RfSrZgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751568258; c=relaxed/simple;
	bh=8LpVR5vjfFVmOAAZmoulkR5XIUYLW27aeF/9waSxwdA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=diiEYXKU8ckYziirLnMo7BY5JYRxdJefm/lluDfpiIlCdQeQ2PeIx5t6Uf7Ra+CoqHq1/ZKbuNMCUpwSd+s8Zi92Zd6pppfsRy8d5aQr/nzR1TyMRruPwgkgPM/3D/+XAESPGBd19twTMW7T3YZSz7AuN9/W/t4yEvzJ2pZul54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=QNze9jn8; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="QNze9jn8"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2260D40ACD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1751568256; bh=Boes/PYNn6MSOnmyVvyWWb85WBr7EHHbGNkvn9wn+Ok=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QNze9jn8rGBt3zujbwDNW4UdhaCkJ+fuPpT7nVEi+Yr5JT9MPSttNCJBwtmiOhznB
	 elHFLJYRIwvu79SwmzPCdEkxNT3o0MfAY8eBu23e7Dvq29Xz4LNz1bXFBP3ce+4Unm
	 ImwnLb5XTxLPSmr9OXiHYCNvk+labhrrnv3IEuPd0wmdPITHsZiW59Jr20AMOHcNAC
	 g/ErG5fzTr0jdDmSQgcz5EtoUwaq9F52VS0COeJjNBwkf6bHt9XIIjj+AELTahuXA+
	 lZRx5RoPT8WXrTzLwQ7+vFr42HEU5csim1QMzaDE7qlHyrgEevY8vUPLp8XCqymtmm
	 tqdHIYlB2aXqA==
Received: from trenco.lwn.net (unknown [IPv6:2601:280:4600:2da9::1fe])
	by ms.lwn.net (Postfix) with ESMTPA id 2260D40ACD;
	Thu,  3 Jul 2025 18:44:16 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v2 3/7] docs: kdoc: remove the brcount floor in process_proto_type()
Date: Thu,  3 Jul 2025 12:43:59 -0600
Message-ID: <20250703184403.274408-4-corbet@lwn.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703184403.274408-1-corbet@lwn.net>
References: <20250703184403.274408-1-corbet@lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Putting the floor under brcount does not change the output in any way, just
remove it.

Change the termination test from ==0 to <=0 to prevent infinite loops in
case somebody does something truly wacko in the code.

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 scripts/lib/kdoc/kdoc_parser.py | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
index d9ff2d066160..935f2a3c4b47 100644
--- a/scripts/lib/kdoc/kdoc_parser.py
+++ b/scripts/lib/kdoc/kdoc_parser.py
@@ -1609,9 +1609,7 @@ class KernelDoc:
                 self.entry.brcount += r.group(2).count('{')
                 self.entry.brcount -= r.group(2).count('}')
 
-                self.entry.brcount = max(self.entry.brcount, 0)
-
-                if r.group(2) == ';' and self.entry.brcount == 0:
+                if r.group(2) == ';' and self.entry.brcount <= 0:
                     self.dump_declaration(ln, self.entry.prototype)
                     self.reset_state(ln)
                     break
-- 
2.49.0

