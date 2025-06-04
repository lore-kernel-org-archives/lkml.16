Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9AC28ECE9;
	Wed,  4 Jun 2025 14:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749047841; cv=none; b=e/i84inXcW9E/wdRpw9LuIhG89wIfhS+0T9CW2QU9YzBy0Dwiz9OjJEXkyI9r/zlaH3jumYXOxTpEeejQJ56hquASOGnm89UWOP7uuoMuxf0gBHvcCXn8ElLoUiMmen+0GO0MywupcrDvWuEe3tn0ADNF9dI4YPwaLQrXeEz3ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749047841; c=relaxed/simple;
	bh=o/eS0IF6n81//MErCyau1coRDfnLuZuoMMa9zXVwLg0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=koPhM67n+Msp1sIrbF68JqaCviKDzq+IGN2YTBWH2R0QmTKSFhelBrb334h3seMqJM6XsRADhCxH2OwL6pCSRM9/3eFMerGcNP2PwtTidM/rG5mMbr+n0IoV9tW3PuSVczRabtHsrSY/gBrWcRfoxnWza8Qt6d7ji5jdXTSs864=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=VWhgABLz; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="VWhgABLz"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2485541F28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1749047838; bh=wNJhZW6ihKPzqnGzsjX01EfMfrNUVHiRICJcUri79Tc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VWhgABLzPv5K191kbMmASTQ4FJhxOc93Wb0ofcM+VzBxGSI9IhJWJgus1vlJbgO3f
	 +ezPU8nDNiyyEfi0FoBpaI+3MMb9ctJOVqkwwG+OnmwWVw+A/BGZFb/cQYN6FaghaS
	 Au58jdselallcC7zVGKNunPxXJAfAxqKPEHfBW2PvkIaqIRJnTJEgItLEajxloRttt
	 AHpCUl5tAYm9ZtGcdoKGIkBEe5DRnjFHZ3dP7BpbIU1WQZ+1WgP6bHbgzYHab/mwa5
	 vL/b7osrDH7R7u9UExP6iFPPk2W/hWot5cXrjzM1Nt+L3Npnq4INA0zjUexrQyO/yE
	 AdEvE+3cnd9Ww==
Received: from trenco.lwn.net (unknown [IPv6:2601:280:4600:2da9::1fe])
	by ms.lwn.net (Postfix) with ESMTPA id 2485541F28;
	Wed,  4 Jun 2025 14:37:18 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v2 1/3] docs: automarkup: Remove some Sphinx 2 holdovers
Date: Wed,  4 Jun 2025 08:36:43 -0600
Message-ID: <20250604143645.78367-2-corbet@lwn.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250604143645.78367-1-corbet@lwn.net>
References: <20250604143645.78367-1-corbet@lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove a few declarations that are no longer doing anything now that we
have left Sphinx 2 behind.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
v2: Remove RE_generic_type as suggested by Mauro

 Documentation/sphinx/automarkup.py | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/Documentation/sphinx/automarkup.py b/Documentation/sphinx/automarkup.py
index fd633f7a0bc3..7828aeac92e7 100644
--- a/Documentation/sphinx/automarkup.py
+++ b/Documentation/sphinx/automarkup.py
@@ -22,12 +22,6 @@ from kernel_abi import get_kernel_abi
 #
 RE_function = re.compile(r'\b(([a-zA-Z_]\w+)\(\))', flags=re.ASCII)
 
-#
-# Sphinx 2 uses the same :c:type role for struct, union, enum and typedef
-#
-RE_generic_type = re.compile(r'\b(struct|union|enum|typedef)\s+([a-zA-Z_]\w+)',
-                             flags=re.ASCII)
-
 #
 # Sphinx 3 uses a different C role for each one of struct, union, enum and
 # typedef
@@ -150,20 +144,12 @@ def markup_func_ref_sphinx3(docname, app, match):
     return target_text
 
 def markup_c_ref(docname, app, match):
-    class_str = {# Sphinx 2 only
-                 RE_function: 'c-func',
-                 RE_generic_type: 'c-type',
-                 # Sphinx 3+ only
-                 RE_struct: 'c-struct',
+    class_str = {RE_struct: 'c-struct',
                  RE_union: 'c-union',
                  RE_enum: 'c-enum',
                  RE_typedef: 'c-type',
                  }
-    reftype_str = {# Sphinx 2 only
-                   RE_function: 'function',
-                   RE_generic_type: 'type',
-                   # Sphinx 3+ only
-                   RE_struct: 'struct',
+    reftype_str = {RE_struct: 'struct',
                    RE_union: 'union',
                    RE_enum: 'enum',
                    RE_typedef: 'type',
-- 
2.49.0

