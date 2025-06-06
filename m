Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93063289E0E;
	Fri,  6 Jun 2025 16:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749227704; cv=none; b=EUdvgeGI4HIWZi+wZqbJIg+K5Lwl/1ozxGkumpPexfiYKiBgroeoEvHBYX+39KoqsBcZQ7LMW8+PNw27PFf532VxNSmCG+XbPUxdr+kXLJRDtNY6WjIJVuwJMhUHoNnYDhs9xG8PwIHllmRdzDII0li7B4baBkyLvL2sWYBNR3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749227704; c=relaxed/simple;
	bh=cCX7+iWaJ32ve9qQ3KC+4mD5gRO5zvHS+vb0szaj5U4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=okUfA3PsDm0WEbKoJPNbY7Syl4yeJWIrIrKdxOMMR7EZph2c01C7HOLBNLWBg2JDZT9jG6QD12FFi1Q2hvOkq2eP61aDSoRcn0Jnk2Hezan0P/2WyZT9xbz0piJz255CDPy3XLnkQjHR0uYTJlb2O+hxGgOfoMOZkGfrKCpOW2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=mQp/ZkYO; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="mQp/ZkYO"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8B01241F2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1749227696; bh=kb0zYT2ntM43Di/wACcwU37EP9pm+N3CV36LcbfUc8o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mQp/ZkYOFsY7Xqy23HT/R20g7ZE6o9KfI5D9i3+6GwtAi0u69hCaPW+iWKbw/54IW
	 duHvkF01168QoqMNYFeWHI/DbkFlTWY5v+p80SjuCM6DXeJoLIW3D9mxveAE5XTbx/
	 nZqMFLF1VPcYoRV5J4Lxmd1n8OxcPFjCbiOsyJslwq//W71k/4EVSuGiGHs3U0y8Yn
	 2hey/30Au39GNuuSwTYniINs1AvDlxPXNbwdKSEWFjAU3vUxddWIFOqzSAVAGdk10A
	 n0as7RGCel3jb+AqHhdggCqD4jIaGdZwD7f6zCTpufa4namzhgpIY3l/1SYbHxnu7y
	 xb1kCnanpx8EQ==
Received: from trenco.lwn.net (unknown [IPv6:2601:280:4600:2da9::1fe])
	by ms.lwn.net (Postfix) with ESMTPA id 8B01241F2D;
	Fri,  6 Jun 2025 16:34:56 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 3/9] docs: kdoc: remove the section_intro variable
Date: Fri,  6 Jun 2025 10:34:32 -0600
Message-ID: <20250606163438.229916-4-corbet@lwn.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250606163438.229916-1-corbet@lwn.net>
References: <20250606163438.229916-1-corbet@lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is only used in one place, so just put the constant string
"Introduction" there so people don't have to go looking for it.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 scripts/lib/kdoc/kdoc_parser.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
index 37b7e501af7c..90b53b70cfee 100644
--- a/scripts/lib/kdoc/kdoc_parser.py
+++ b/scripts/lib/kdoc/kdoc_parser.py
@@ -203,7 +203,6 @@ class KernelDoc:
 
     # Section names
 
-    section_intro = "Introduction"
     section_context = "Context"
     section_return = "Return"
 
@@ -1207,7 +1206,7 @@ class KernelDoc:
             self.entry.new_start_line = ln
 
             if not doc_block.group(1):
-                self.entry.section = self.section_intro
+                self.entry.section = "Introduction"
             else:
                 self.entry.section = doc_block.group(1)
 
-- 
2.49.0

