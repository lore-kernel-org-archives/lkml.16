Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB52289E26;
	Fri,  6 Jun 2025 16:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749227705; cv=none; b=J5EGEo/hjzDkHMgcWpTM/Fyf6eHDa593I+RpiEButHLs2zMLIgHn9jVCZo7VRK7ThlcZOU4cL1djMDAfEX/PwXjqJiLroE8CCyWnXgQRJDORSBeL2MywJvKa9KyzykH894JR4k16Zk0XH6x4plz1F0x20BvRKATIQJoGhAQZPLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749227705; c=relaxed/simple;
	bh=msJBqBHkePeWRZwnfqxFqzb6+do+sSPzY8HstP17mU0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PskTbuIw3gmjOex8cshEc8Dk1TyG4JH805Ept45NZzlvBwyW3rbyhq8U6V0uEW37xePv8SUb52WBwn0T4OmImVFrKe+0XMd7Hv0pJqVTATQKngtOVadXF3+9qjLKmexcsDQDk7EvLbD7/W9wk55ASscJyNT3Pahnw6ijKlua9wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=PzGPpIe9; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="PzGPpIe9"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2652C41F30
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1749227698; bh=Hu5hx8PEIgVdywDy22TCRt/j6m2yo0K5y93HRezRrP8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PzGPpIe9IF9Jro50VYWitZ5NGcj+QUxDSk9XuRVTnhhV+YbWUfhsHHs7DcYXY5R+Y
	 51+cDdzI7Ji15S23071HoxOKD+QK7FSivT+sVcmHUvolq3wa0VPJIbq3mcStWTVWuv
	 ISZgeu9ous3gIDK6dq6OQI8BC8czkOzqT32vg4RAWDTrT0wue3ZqKgskpohZYHb8La
	 7MYzassQ9uGepWjWh03PWIysnKyfdPlaEtWS/eWirii1pgLXjAtibH+xqfUOpFPQAL
	 hqP8tb7YVZxC2cN0ctVl5AlOroGx3lOOKr2b4Abqp1WlRdSJ6B7CCrlDtF3K7+58cG
	 315MCIBrgC4GA==
Received: from trenco.lwn.net (unknown [IPv6:2601:280:4600:2da9::1fe])
	by ms.lwn.net (Postfix) with ESMTPA id 2652C41F30;
	Fri,  6 Jun 2025 16:34:58 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 6/9] docs: kdoc: remove the KernelEntry::descr pseudo member
Date: Fri,  6 Jun 2025 10:34:35 -0600
Message-ID: <20250606163438.229916-7-corbet@lwn.net>
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

The entry.descr value used in process_name() is not actually a member of
the KernelEntry class; it is a bit of local state.  So just manage it
locally.

A trim_whitespace() helper was added to clean up the code slightly.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 scripts/lib/kdoc/kdoc_parser.py | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
index 56299695abd1..7c635000f3de 100644
--- a/scripts/lib/kdoc/kdoc_parser.py
+++ b/scripts/lib/kdoc/kdoc_parser.py
@@ -60,6 +60,13 @@ export_symbol_ns = KernRe(r'^\s*EXPORT_SYMBOL_NS(_GPL)?\s*\(\s*(\w+)\s*,\s*"\S+"
 
 type_param = KernRe(r"\@(\w*((\.\w+)|(->\w+))*(\.\.\.)?)", cache=False)
 
+#
+# A little helper to get rid of excess white space
+#
+multi_space = KernRe(r'\s\s+')
+def trim_whitespace(s):
+    return multi_space.sub(' ', s.strip())
+
 class state:
     """
     State machine enums
@@ -1258,12 +1265,7 @@ class KernelDoc:
 
             r = KernRe("[-:](.*)")
             if r.search(line):
-                # strip leading/trailing/multiple spaces
-                self.entry.descr = r.group(1).strip(" ")
-
-                r = KernRe(r"\s+")
-                self.entry.descr = r.sub(" ", self.entry.descr)
-                self.entry.declaration_purpose = self.entry.descr
+                self.entry.declaration_purpose = trim_whitespace(r.group(1))
                 self.state = state.BODY_MAYBE
             else:
                 self.entry.declaration_purpose = ""
-- 
2.49.0

