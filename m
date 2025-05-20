Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9F0264602;
	Tue, 20 May 2025 08:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747731378; cv=none; b=QNMYtzB5TEse2jGciikz9i0OWEi5WD9p52HnUP31xlAckdJ5p19LwMfFpm/SXjggckV7VMZ9kaBAragGk4tTB8hO0LJzeNt/nyzSuvrhbUbEspmodfHT6JTIa6LVnGczS7j9y7GuYu3pcvz153aKHvD3sIB2i5+i9U0UufTGlmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747731378; c=relaxed/simple;
	bh=hcqt6eZBGihUCfmwzVKOQS5DiA0cgTfveFjb6FGh0AA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qm3KQh/pNbsbS1ZklMB8ZW9XC6zDpiyCF0J9ldYCV+SjAYYdmYQ8TymUMk4PYZkm8vHQ5dgLgtNCKwMaQX8wSChuhYH7ROQF2+P4VXiPxG/vr9HT8P6FOB6qoS/3RSIS9Vu6AdVk6CurrGCF0UV8ILg/qpMNgQT0Sb9Kk5JqH/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K2VZakvN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K2VZakvN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10CB9C4CEF0;
	Tue, 20 May 2025 08:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747731378;
	bh=hcqt6eZBGihUCfmwzVKOQS5DiA0cgTfveFjb6FGh0AA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K2VZakvNgo7vyScfDwPrjGoF+U8I/l4NlVsB7hK+XE4t0JjYjcAGTR5Z2+6f/3JFq
	 gqB81+rI97Heq4h0LgmDwUVNCJyHVW5aNUn6k0F4Rvp7wQu9GDIEwFOHZfTcqM25U9
	 I80eh6uGJI+xKerUDSMRr4jogoZX5okUG3aYF1OQ+fcRP0riJ33/5C4B7OH0XrvFSw
	 3tXzDhlES2lGQS0i3n16lMBJHl/c2mN6mJxUWI43eDprNiUU/+2UrUmb/2e4ftSl1n
	 FW6hY6gJPk4CJckIVtpz4rULYLIGB5fqKvg9KwbrjNxvEnNYc9QtnEKJlKbHi/odXN
	 D2/V/KieNlp0A==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab@kernel.org>)
	id 1uHIlj-00000006U8G-0riS;
	Tue, 20 May 2025 10:56:15 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Kees Cook <kees@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] docs: kerneldoc.py: add try/except blocks for kernel-doc class errors
Date: Tue, 20 May 2025 10:55:47 +0200
Message-ID: <064bac2f462c13f56154891d8f3fb788db94f325.1747730982.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1747730982.git.mchehab+huawei@kernel.org>
References: <cover.1747730982.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

Replicate the same behavior as what's done with kernel-doc.pl:
continue building docs even when there are exceptions.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/kerneldoc.py | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/Documentation/sphinx/kerneldoc.py b/Documentation/sphinx/kerneldoc.py
index 314479718a01..4de667d4d95b 100644
--- a/Documentation/sphinx/kerneldoc.py
+++ b/Documentation/sphinx/kerneldoc.py
@@ -278,14 +278,27 @@ class KernelDocDirective(Directive):
 
         node = nodes.section()
 
-        kfiles.parse(**self.parse_args)
-        filenames = self.parse_args["file_list"]
+        try:
+            kfiles.parse(**self.parse_args)
+            filenames = self.parse_args["file_list"]
+            msgs = kfiles.msg(**self.msg_args, filenames=filenames)
 
-        for filename, out in kfiles.msg(**self.msg_args, filenames=filenames):
+        except Exception as e:  # pylint: disable=W0703
+            logger.warning("kernel-doc '%s' processing failed with: %s" %
+                           (cmd_str(cmd), str(e)))
+
+        for filename, out in msgs:
             if self.verbose >= 1:
                 print(cmd_str(cmd))
 
-            ret = self.parse_msg(filename, node, out, cmd)
+            try:
+                ret = self.parse_msg(filename, node, out, cmd)
+
+            except Exception as e:  # pylint: disable=W0703
+                logger.warning("kernel-doc '%s' processing failed with: %s" %
+                               (cmd_str(cmd), str(e)))
+                return [nodes.error(None, nodes.paragraph(text = "kernel-doc missing"))]
+
             if ret:
                 return ret
 
-- 
2.49.0

