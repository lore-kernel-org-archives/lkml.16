Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F7E267B61;
	Tue,  8 Apr 2025 10:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744106998; cv=none; b=pFHfccR8zy3GgxV9d8+fwIdnKHd4ubeMX8YZGTfJUYTuG17aFiNhfRbM0ovHfb6GiNl138kjzDkG2W2h3alo1pe+prlCsteZxNpPNLQKEze4614oJ01bhm5VYKNAJKbcJ5dyngX3BtjA1RjRNMsJ5PxYtwtuTPPq0f2CM6GlLM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744106998; c=relaxed/simple;
	bh=xGGaublStiDF9Xu+i44mFNAhZua59ZKfxDpXyFMS7D0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F0DxuJS9FcDlA8rA5XGhStUNUsM7oaVTrWeW5PUx+eZwMB+NQA+Qd2ESaByxAhof4kicPkbmHcDfANmy7eFn0q45Du9BrMheMIeBtIlS6GPVGQRTUwLV2Bemx0VvuPfw1KSh32Ylf16Ol7Hn9YLUdjHcIPDxGbAxW2/1vyL/5KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZhD+3w03; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZhD+3w03"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F236C4CEEB;
	Tue,  8 Apr 2025 10:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744106997;
	bh=xGGaublStiDF9Xu+i44mFNAhZua59ZKfxDpXyFMS7D0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZhD+3w036SUvdKmRhUVh1HWc4aPzTeYp56frEDd/+oJPAQfTNtGXeJoSCJZaFwW8t
	 /K6EjrmxihfhlglwMUh7MkaiT+XzKIY1FfwU/RDhmHslsSAqhFesF1xn7OBxYsrf52
	 oBHnV3w+EPP2VtysvaA4A6O5kuLUCLR8JfoqD51MHGQ8n/DzWQZOMoxrmpSVqkLDI4
	 38DM4X0DqrjpCngoWAac0T1sMlrG9zxPMFyLdqIUbg8vOLQT33NgNNMOINpDsGMb30
	 gf8IqxrBtn+TCIoCcvWt0ckL4a8jyjq6X6nKV7W655TI1kQcKHqwJJLGQFyGLWL0hh
	 lRhF2E89+UNnQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab@kernel.org>)
	id 1u25tt-00000008RWP-28PO;
	Tue, 08 Apr 2025 18:09:49 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sean Anderson <sean.anderson@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 24/33] scripts/lib/kdoc/kdoc_parser.py: fix Python compat with < v3.13
Date: Tue,  8 Apr 2025 18:09:27 +0800
Message-ID: <e2b8e8361294558dae09236e4b8fbea5d86be5a3.1744106242.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744106241.git.mchehab+huawei@kernel.org>
References: <cover.1744106241.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

- str.replace count was introduced only in Python 3.13;
- before Python 3.13, f-string dict arguments can't use the same
  delimiter of the main string.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/lib/kdoc/kdoc_output.py | 8 ++++----
 scripts/lib/kdoc/kdoc_parser.py | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/lib/kdoc/kdoc_output.py b/scripts/lib/kdoc/kdoc_output.py
index 7f84bf12f1e1..e0ed79e4d985 100755
--- a/scripts/lib/kdoc/kdoc_output.py
+++ b/scripts/lib/kdoc/kdoc_output.py
@@ -647,16 +647,16 @@ class ManFormat(OutputFormat):
         sectionlist = args.get('sectionlist', [])
         sections = args.get('sections', {})
 
-        self.data += f'.TH "{args['function']}" 9 "{args['function']}" "{self.man_date}" "Kernel Hacker\'s Manual" LINUX' + "\n"
+        self.data += f'.TH "{args["function"]}" 9 "{args["function"]}" "{self.man_date}" "Kernel Hacker\'s Manual" LINUX' + "\n"
 
         self.data += ".SH NAME\n"
         self.data += f"{args['function']} \\- {args['purpose']}\n"
 
         self.data += ".SH SYNOPSIS\n"
         if args.get('functiontype', ''):
-            self.data += f'.B "{args['functiontype']}" {args['function']}' + "\n"
+            self.data += f'.B "{args["functiontype"]}" {args["function"]}' + "\n"
         else:
-            self.data += f'.B "{args['function']}' + "\n"
+            self.data += f'.B "{args["function"]}' + "\n"
 
         count = 0
         parenth = "("
@@ -697,7 +697,7 @@ class ManFormat(OutputFormat):
         sectionlist = args.get('sectionlist', [])
         sections = args.get('sections', {})
 
-        self.data += f'.TH "{args['module']}" 9 "enum {args['enum']}" "{self.man_date}" "API Manual" LINUX' + "\n"
+        self.data += f'.TH "{args["module"]}" 9 "enum {args["enum"]}" "{self.man_date}" "API Manual" LINUX' + "\n"
 
         self.data += ".SH NAME\n"
         self.data += f"enum {args['enum']} \\- {args['purpose']}\n"
diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
index dcb9515fc40b..e48ed128ca04 100755
--- a/scripts/lib/kdoc/kdoc_parser.py
+++ b/scripts/lib/kdoc/kdoc_parser.py
@@ -1444,9 +1444,9 @@ class KernelDoc:
 
         r = Re(r'long\s+(sys_.*?),')
         if r.search(proto):
-            proto = proto.replace(',', '(', count=1)
+            proto = Re(',').sub('(', proto, count=1)
         elif is_void:
-            proto = proto.replace(')', '(void)', count=1)
+            proto = Re(r'\)').sub('(void)', proto, count=1)
 
         # Now delete all of the odd-numbered commas in the proto
         # so that argument types & names don't have a comma between them
-- 
2.49.0

