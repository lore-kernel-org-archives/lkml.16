Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67822ED177;
	Fri, 27 Jun 2025 18:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751049619; cv=none; b=RqwMMwQ+8zQrcocgDLHTXeUnP4FyrIOzwbvg+PbL+YJ/HfTfVHF1ghuL4Vz2rLNyDQj/LjNDK8g3d5g9a3h9bR4td8yZ/qaMvH/lbGzNpo5OYIKH2zT6QUMkznIBANZIohxDlL6ysdrWvmpXJF927pkuoIPNn/G2W9l/Wmw/Zro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751049619; c=relaxed/simple;
	bh=lTMAGNy9jLGShROhYkdk0ytJI8mqL0/g8PTQr+cZOYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N1Pt3xmiPJfxcZ03Z7CDkm+Vsml0a/ZGhP0xgwIphOWBCpAmYs/subgMKqySnh6dWWN+PppHp5sOu7WuxUfU96Y16Gtoq75WJ+8gkYwwWRmGO3wfci92+BU8z9Ojk0wWfZUbw7kXj26XpwhJh05/fa2lk9FqBwk6fBFZOAoG7Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=dR79u8eP; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="dR79u8eP"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E2CFB40AD0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1751049617; bh=Mls0+pzTN3LHiGp7GlWLLCkLVeQdt0qpNAqNfdM34Xo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dR79u8ePD6bYJ9iL/gNrdlmU81YmeX21pTaft+tED37sZdkuP9IUj91B64N1qfwM+
	 ldtEMwN00fWHm0XWRMZPOJL8CwdNl+XzQtPFRzbbanBPMgmyT4OxKb21EnO9DwYavu
	 ZBwNLg1fGCO5q/UBScaAoS8ttOQ8fSGLaJ5OSxikr35BPZp5XSGN3XUca2b8jpAVpS
	 mIHekLpvAVqYltoiEyS+Pj1fTkd9WGywrpD98V4HOnefRzUi0kZ5LZQDI9r3PC9PCo
	 Gs66GntedtTZjIE/KYf/tiLF98Dxo2Fis9kPmr/Y4sNSY9d6ajJBCd8PQGoRFs2mnc
	 msVpvTawxJetg==
Received: from trenco.lwn.net (c-73-14-55-248.hsd1.co.comcast.net [73.14.55.248])
	by ms.lwn.net (Postfix) with ESMTPA id E2CFB40AD0;
	Fri, 27 Jun 2025 18:40:16 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 6/8] docs: kdoc: remove the INLINE_END state
Date: Fri, 27 Jun 2025 12:39:58 -0600
Message-ID: <20250627184000.132291-7-corbet@lwn.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250627184000.132291-1-corbet@lwn.net>
References: <20250627184000.132291-1-corbet@lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is never used, so just get rid of it.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 scripts/lib/kdoc/kdoc_parser.py | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
index 734b908579c3..03a0e44707a7 100644
--- a/scripts/lib/kdoc/kdoc_parser.py
+++ b/scripts/lib/kdoc/kdoc_parser.py
@@ -108,8 +108,7 @@ class state:
     INLINE_NA     = 0 # not applicable ($state != INLINE)
     INLINE_NAME   = 1 # looking for member name (@foo:)
     INLINE_TEXT   = 2 # looking for member documentation
-    INLINE_END    = 3 # done
-    INLINE_ERROR  = 4 # error - Comment without header was found.
+    INLINE_ERROR  = 3 # error - Comment without header was found.
                       # Spit a warning as it's not
                       # proper kernel-doc and ignore the rest.
 
@@ -117,7 +116,6 @@ class state:
         "",
         "_NAME",
         "_TEXT",
-        "_END",
         "_ERROR",
     ]
 
-- 
2.49.0

