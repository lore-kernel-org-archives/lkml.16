Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE59C1CDA14;
	Mon, 10 Feb 2025 10:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739182705; cv=none; b=RljsdDD8OGa3W8Uvx1Mh3xFrPzAHJNnzU5Nyf6hDuGkdHpvQkIGqHCzW9OQQK99LlwxeG6B34nozbdHgQaw1VY/Q27XUnuJ20zVXcxejqT7ZaOBHvn/WrPcfYX1w0GAJUVs3D50t7WWcwnnyWTLT/ACUgT02hzZ11j89imTQOzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739182705; c=relaxed/simple;
	bh=Bg/135c3/sCX1BS6OU1mn7NTkAkZ/Ldfy6wpxAGy82o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bOAP1ow+tIwd9H5H6t66Z6TksWsjxmV4lh/KiM1pV1vAWW5H7Li7NQ2FqtUBDb+6fX+sqrWNXugIW9sHOMMme0yJNlhXE2n6EYFg+/WM9D6NHfYySSBnZOkycZTifjAny06HNeN4gBrT7HpyM0TTyxX1LmJm5Cl2t1VhqaWTrZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mk1NaiDX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mk1NaiDX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 365F0C4AF0B;
	Mon, 10 Feb 2025 10:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739182704;
	bh=Bg/135c3/sCX1BS6OU1mn7NTkAkZ/Ldfy6wpxAGy82o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mk1NaiDX/yrCZ0RD6jrz0EXGmJAE3iGKfhgO90RFeVGW8YLD2T3FKnZdE7a/dIACe
	 EJvsNKpMbkFkfdomvWqQ/38mTC1DAncomdT6aftLB8FKgSjEN3NeoE0qBBLwpryXGK
	 sxQVrVfhottBTq0zclIR4KLVzyKgzH8IVVSjQlhFJCq9Jk+taQBnKpj7U87sWiPFYE
	 O6xxnMuiU0VujKW0pYqBo94jRWv5QLPF/qfBQ3yqXrHw8T/93PR9aB6gxqOUpPpIWJ
	 2ixRvajbpzv8f97UBYRfLTTYU9npMigCjfmleX8ug+ZjAKI+LpjzJEm5A9idCiXYkP
	 EE2akiEkJWccA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1thQru-00000006CjM-1VwB;
	Mon, 10 Feb 2025 11:18:22 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Jonathan Corbet" <corbet@lwn.net>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 19/27] scripts/get_abi.pl: add support to parse ABI README file
Date: Mon, 10 Feb 2025 11:18:08 +0100
Message-ID: <f1285dedfe4d0eb0f0af34f6a68bee6fde36dd7d.1739182025.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1739182025.git.mchehab+huawei@kernel.org>
References: <cover.1739182025.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

The Documentation/ABI/README file is currently outside the
documentation tree. Yet, it may still provide some useful
information. Add it to the documentation parsing.

As a plus, this avoids a warning when detecting missing
cross-references.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/lib/abi/abi_parser.py | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/abi/abi_parser.py b/scripts/lib/abi/abi_parser.py
index b20d5c9d920e..6fac461d794c 100644
--- a/scripts/lib/abi/abi_parser.py
+++ b/scripts/lib/abi/abi_parser.py
@@ -263,6 +263,16 @@ class AbiParser:
         if content:
             self.warn(fdata, "Unexpected content", line)
 
+    def parse_readme(self, nametag, fname):
+        """Parse ABI README file"""
+
+        with open(fname, "r", encoding="utf8", errors="backslashreplace") as fp:
+            nametag["description"] = "```\n"
+            for line in fp:
+                nametag["description"] += "  " + line
+
+            nametag["description"] += "```\n"
+
     def parse_file(self, fname, path, basename):
         """Parse a single file"""
 
@@ -309,6 +319,10 @@ class AbiParser:
         if self.debug & AbiDebug.WHAT_OPEN:
             self.log.debug("Opening file %s", fname)
 
+        if basename == "README":
+            self.parse_readme(fdata.nametag, fname)
+            return
+
         with open(fname, "r", encoding="utf8", errors="backslashreplace") as fp:
             for line in fp:
                 fdata.ln += 1
@@ -344,9 +358,6 @@ class AbiParser:
 
                 basename = os.path.basename(name)
 
-                if basename == "README":
-                    continue
-
                 if basename.startswith("."):
                     continue
 
@@ -448,8 +459,12 @@ class AbiParser:
                     continue
 
             if filter_path:
-                if v.get("path") != filter_path:
-                    continue
+                if filter_path == "README":
+                    if not names[0].endswith("README"):
+                        continue
+                else:
+                    if v.get("path") != filter_path:
+                        continue
 
             msg = ""
 
-- 
2.48.1

