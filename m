Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD9228B3FD;
	Tue,  1 Jul 2025 20:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751403481; cv=none; b=Rf7JcOGdtqZKuQYH+/J+FewgTANsAiD+9mSAYo8JyX6OjpJjjIoMZ33jq5WEI5Amz/XF8bDjgo56eUQNvIURw/rqe6URYxtXf0lwvAYmsCAIzq/xiXkObY9IhvSBjN47VgV5b3XNPK2yHv38FK2chSQX7+iSC5JJvXHlnwSA2LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751403481; c=relaxed/simple;
	bh=R3tNUtkVXW9CZKgkxhpPTYJhIbS0igKazDEJU749qP8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jOBLlfeQoTRF2vB0wNcbWjOLzsBTsltaBgPjkbyPJ76SJaIl0zSG4zN10YJOJi+Qsh56Y81pWGd1PUBrSfNTqnEY2faUrYDjhYaaArsyYNJq2GVNMaAT28O+J1UqZNlr40+3PUPIT0JJoo+3x/Fa37PPz6KN3KFUVT23n3FQY9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=SZYedS01; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="SZYedS01"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5CE8840AD2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1751403472; bh=kBqglquqqrq2ldzkhbwrpnwof/hRu8OVVr4u0qu3yNU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SZYedS015ASLKY9EUNU4z1ji9ODQ18DQ0BJl0ZOUJn2RCk7oFEIMyw+YIeVQLCrau
	 OSOqpW2yJzIkB3YHgwtP9oP0RZozCSgPL4b3erG0AmH8jxrvm0AtQr5qOJisU74kbQ
	 9t1v3rxlpEKdPjRAeNZea54UuNeaKFa6YU8eNr2IJz/Haip/Crg7OoLzWay6NMWKQn
	 oKi3xHEAK70o9ed/Nio5xmwp0jeOdV1f0qeC3qomWaOSlJUdM6kpqtCfwUiu0E4uuL
	 JZ9MGf/Of0PJmRohi7fD63dmE9hGG/mg+ykfjmNEWvFoR7JwQ2nPPLeVOuzMOT7vU1
	 77cO58z0/bUaQ==
Received: from trenco.lwn.net (unknown [IPv6:2601:280:4600:2da9::1fe])
	by ms.lwn.net (Postfix) with ESMTPA id 5CE8840AD2;
	Tue,  1 Jul 2025 20:57:52 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 3/7] docs: kdoc: remove the brcount floor in process_proto_type()
Date: Tue,  1 Jul 2025 14:57:26 -0600
Message-ID: <20250701205730.146687-4-corbet@lwn.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250701205730.146687-1-corbet@lwn.net>
References: <20250701205730.146687-1-corbet@lwn.net>
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

