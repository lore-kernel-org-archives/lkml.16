Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89888248F5F;
	Wed,  2 Jul 2025 22:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751495769; cv=none; b=dPGH+MG7liYQAwfU7UEXzLDuDl1eJ1v2DqzpxvBr4e02NmKU+Qrts98MG4jT4wUNv61EgLcH9ME63JWwYa66fREllwWJn/RKGnVb62QDisl0eF/lhvuhfy8IC15Z1dT+7FtLGctCT4fBnfA007k39hpigCcdL8UjzPsxH6VTtX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751495769; c=relaxed/simple;
	bh=BynowONsB9loA0lfjkoAwOWy03aovuUqcqYge5s+3G4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KWpsW84rlUi95Bw4jNVq/DGbcIZnb8ULtLbv+asA99HTT2IiOPjHJFC2A0Y0HG2/dYxZHnAE55m54H7w9SvnrwKzqYJQtzZ93HDEY+wDIkP7iKSB8KAKFjKshnFNeNvNrmgn7aR860PEicLnYU0c+9OBrlIzo55Hv0O4oEt22tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=brFmjVEt; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="brFmjVEt"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2D40840ADC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1751495764; bh=dNof+AXeq/f+pu3hjZOO4w64OTws2zFcSf5JnVShQt0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=brFmjVEt4C8AJqGYv2pzslIf+zzGuV6CdyI85lQDz6NfqXNftoJdw8GQ+K3xsFM+e
	 BygqL5k0Hf4Zu53LWRLCYHkHsztRiCZuGm5MBTeiwzS0nEBk/C/MiwMicZNKToaV1v
	 Dc5gpX6x9o0c6x3UEfODUENrbsTkfWCCwhO5WJGJOkp7s+Eb+ZV/UZ3zTvUXmHuTjX
	 2zDKAaKROaiPj8r39zSM/uz5ebPh/qfJHP5WSAjwn4UTISDwA24lhBztEXre3L7fSG
	 +aHedvh5QuCxJIC0Tx8ArHN3D9VpDdUyUUftJQ7CIfNQE0f1dijB63uqkciylJEf9+
	 Y8WfOvX66MahQ==
Received: from trenco.lwn.net (unknown [IPv6:2601:280:4600:2da9::1fe])
	by ms.lwn.net (Postfix) with ESMTPA id 2D40840ADC;
	Wed,  2 Jul 2025 22:36:04 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 10/12] docs: kdoc: directly access the always-there KdocItem fields
Date: Wed,  2 Jul 2025 16:35:22 -0600
Message-ID: <20250702223524.231794-11-corbet@lwn.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250702223524.231794-1-corbet@lwn.net>
References: <20250702223524.231794-1-corbet@lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

They are part of the interface, so use them directly.  This allows the
removal of the transitional __dict__ hack in KdocItem.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 scripts/lib/kdoc/kdoc_item.py   |  5 +----
 scripts/lib/kdoc/kdoc_output.py | 16 +++++++---------
 2 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/scripts/lib/kdoc/kdoc_item.py b/scripts/lib/kdoc/kdoc_item.py
index 51e8669b9a6e..807290678984 100644
--- a/scripts/lib/kdoc/kdoc_item.py
+++ b/scripts/lib/kdoc/kdoc_item.py
@@ -20,10 +20,7 @@ class KdocItem:
         self.other_stuff = other_stuff
 
     def get(self, key, default = None):
-        ret = self.other_stuff.get(key, default)
-        if ret == default:
-            return self.__dict__.get(key, default)
-        return ret
+        return self.other_stuff.get(key, default)
 
     def __getitem__(self, key):
         return self.get(key)
diff --git a/scripts/lib/kdoc/kdoc_output.py b/scripts/lib/kdoc/kdoc_output.py
index 8a31b637ffd2..ea8914537ba0 100644
--- a/scripts/lib/kdoc/kdoc_output.py
+++ b/scripts/lib/kdoc/kdoc_output.py
@@ -124,9 +124,7 @@ class OutputFormat:
         Output warnings for identifiers that will be displayed.
         """
 
-        warnings = args.get('warnings', [])
-
-        for log_msg in warnings:
+        for log_msg in args.warnings:
             self.config.warning(log_msg)
 
     def check_doc(self, name, args):
@@ -184,7 +182,7 @@ class OutputFormat:
 
         self.data = ""
 
-        dtype = args.get('type', "")
+        dtype = args.type
 
         if dtype == "doc":
             self.out_doc(fname, name, args)
@@ -373,7 +371,7 @@ class RestFormat(OutputFormat):
                 signature = args['functiontype'] + " "
             signature += name + " ("
 
-        ln = args.get('declaration_start_line', 0)
+        ln = args.declaration_start_line
         count = 0
         for parameter in args.parameterlist:
             if count != 0:
@@ -445,7 +443,7 @@ class RestFormat(OutputFormat):
     def out_enum(self, fname, name, args):
 
         oldprefix = self.lineprefix
-        ln = args.get('declaration_start_line', 0)
+        ln = args.declaration_start_line
 
         self.data += f"\n\n.. c:enum:: {name}\n\n"
 
@@ -474,7 +472,7 @@ class RestFormat(OutputFormat):
     def out_typedef(self, fname, name, args):
 
         oldprefix = self.lineprefix
-        ln = args.get('declaration_start_line', 0)
+        ln = args.declaration_start_line
 
         self.data += f"\n\n.. c:type:: {name}\n\n"
 
@@ -492,8 +490,8 @@ class RestFormat(OutputFormat):
 
         purpose = args.get('purpose', "")
         declaration = args.get('definition', "")
-        dtype = args.get('type', "struct")
-        ln = args.get('declaration_start_line', 0)
+        dtype = args.type
+        ln = args.declaration_start_line
 
         self.data += f"\n\n.. c:{dtype}:: {name}\n\n"
 
-- 
2.49.0

