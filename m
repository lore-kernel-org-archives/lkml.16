Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12129265CDC;
	Tue,  8 Apr 2025 10:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744106996; cv=none; b=XXZ/3gE25KN1/zn3rfKAG7cbjYo+suR6JDepf4Hqyxe8+ugMzivkMCek+fM/EmEzB4FHe6Y/dFQK6D1HOsvFufzY0ZHzUHfJsvSOG597ucXZUrtGQiCKtNSRCqMDHDcnAEy/wAe5CQXSNxnVXdOAezAXmr5JjsTMknwPptRhlMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744106996; c=relaxed/simple;
	bh=Uh81BCZUvcOm9n0xK8VTsj936JVZ+CIeEHT1iPNOQVA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XXUZB6j7ieKWOtG8Aal66EvNgaKvyDIkkQtqsSbiwjNPIQvxQgXOdjtGvza9y2IkdquDlMnugCIB2m3M41QzBvWe6VT+p9lqbfv3vT3IvrYQqJSz1nlbPISjYq2u32GD9OQ/Uf3mFIwMEbhZ8MKeftHuKZtcy1akdItLTiESnXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RNzL2Oun; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RNzL2Oun"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B5E0C4CEEA;
	Tue,  8 Apr 2025 10:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744106995;
	bh=Uh81BCZUvcOm9n0xK8VTsj936JVZ+CIeEHT1iPNOQVA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RNzL2Ounydg9MrIFLUQN/vTk+EgaZ3DZEDYf5d1zi4daJxZYFPQZmvQiz45UPI/jR
	 5g/gysGbFGTlqKph9p8KFxyF+SNYyYJBJm+4G8m+GE6cz+ScM+fWd6q4ISwbBM2Md1
	 tR/IhmunVX4Qp1AIuBDl0jM5M3PByUg/YSxsefzeGw250c/+bC5u3O6fMI3HN4aZ2i
	 OONiuk0TewAxruxpCV3CRVbF3R7NrKKSuwzsNhbhvV5BXPUvN8za15qPj57ha4NRGM
	 QfCOHiS8dyLsJCN8p1t9HAspGRhqI1olrsy+NZO1/o8gBtHxWf9kaTypqQl4Ow42ux
	 +wXGR5VrGyOog==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab@kernel.org>)
	id 1u25tt-00000008RVR-05cN;
	Tue, 08 Apr 2025 18:09:49 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 04/33] scripts/kernel-doc.py: output warnings the same way as kerneldoc
Date: Tue,  8 Apr 2025 18:09:07 +0800
Message-ID: <559f0ad9e6fecfcbb3cc38b6097463bd38d58629.1744106241.git.mchehab+huawei@kernel.org>
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

Add a formatter to logging to produce outputs in a similar way
to kernel-doc. This should help making it more compatible with
existing scripts.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/kernel-doc.py | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/scripts/kernel-doc.py b/scripts/kernel-doc.py
index 114f3699bf7c..8625209d6293 100755
--- a/scripts/kernel-doc.py
+++ b/scripts/kernel-doc.py
@@ -2715,6 +2715,11 @@ neither here nor at the original Perl script.
 """
 
 
+class MsgFormatter(logging.Formatter):
+    def format(self, record):
+        record.levelname = record.levelname.capitalize()
+        return logging.Formatter.format(self, record)
+
 def main():
     """Main program"""
 
@@ -2799,10 +2804,19 @@ def main():
         args.wshort_desc = True
         args.wcontents_before_sections = True
 
+    logger = logging.getLogger()
+
     if not args.debug:
-        level = logging.INFO
+        logger.setLevel(logging.INFO)
     else:
-        level = logging.DEBUG
+        logger.setLevel(logging.DEBUG)
+
+    formatter = MsgFormatter('%(levelname)s: %(message)s')
+
+    handler = logging.StreamHandler()
+    handler.setFormatter(formatter)
+
+    logger.addHandler(handler)
 
     if args.man:
         out_style = ManFormat()
@@ -2811,8 +2825,6 @@ def main():
     else:
         out_style = RestFormat()
 
-    logging.basicConfig(level=level, format="%(levelname)s: %(message)s")
-
     kfiles = KernelFiles(files=args.files, verbose=args.verbose,
                          out_style=out_style, werror=args.werror,
                          wreturn=args.wreturn, wshort_desc=args.wshort_desc,
-- 
2.49.0

