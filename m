Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2B12ECD02;
	Fri, 27 Jun 2025 18:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751049617; cv=none; b=Bz4729fkXmxsa4KUoGZzzbw6E/TzFQbNcJ/eseST6GZOKiWcm1ZITZ7ySeW37uPVNue/8AUyYZS1An173auvXbJoQLxS3ipEyRt5dmlqwsh6w+hGtmw/Hhbet2CaZqPiOQKr2OBl/sTp6DDx8wyuQaFuU0MP9FwUAPOOm9ni2hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751049617; c=relaxed/simple;
	bh=PT2Yk6alDe85ukXVn62bS4QnUGmVHLMjM0JtsfhX3Xc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UpN1EKENeLWxLRedfqrHi16D1WO2dzm2M6TBDzl+Ze09CGVOvBw4jqfoPUCW7pswzj9xaPmpknSKoXbWHHRrx2r1T4T3GHqePYFcQ8uLh0ATYoLzaWZmR3aq6I53gqYRgmAhdf0GZhsgtAl1ozNIzc2Y7pm7pwyYbrG4/8WBMyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=qwxogYrJ; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="qwxogYrJ"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 37DCC40AD4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1751049615; bh=DSTb3QsYlsZNGDLtIkrCarnBRqRmgU+B8Ifif3GhWeA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qwxogYrJS3aLgpJYTigefPW9n1UT+UXZUCvzf4AyL3h22Pf3To/ScvvBijCx3jI1R
	 b3gdtEVsoCSZwNxsI9hkTiQsi+eB0JGU9Z4SfNU0bgyflu0Uo5ZBAhxXkmgpDFhEtk
	 RK7Sc/Dhqnyhkm9f5sn3LOMn7Dc46RZwD8YADrE7zWxHPkU/0hUaxtZkr5vKvhpqBV
	 wGhkkbILn4IzIl6P/FHTD4oxNhWLOTxX/xHB4rDbDopwBu7VTcjC6+kFZKFDH08x24
	 l/mE44uVorAcfit/QpeVgf2vR+Lfr6SRET66e4e18z6XBR3yRwkKtwom0NiTrFZgk4
	 fqzfUiv5ifGUg==
Received: from trenco.lwn.net (c-73-14-55-248.hsd1.co.comcast.net [73.14.55.248])
	by ms.lwn.net (Postfix) with ESMTPA id 37DCC40AD4;
	Fri, 27 Jun 2025 18:40:15 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 3/8] docs: kdoc: remove a bit of dead code
Date: Fri, 27 Jun 2025 12:39:55 -0600
Message-ID: <20250627184000.132291-4-corbet@lwn.net>
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

The type_param regex matches "@..." just fine, so the special-case branch
for that in dump_section() is never executed.  Just remove it.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 scripts/lib/kdoc/kdoc_parser.py | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
index f87355b63c19..9e46cfa20978 100644
--- a/scripts/lib/kdoc/kdoc_parser.py
+++ b/scripts/lib/kdoc/kdoc_parser.py
@@ -207,13 +207,6 @@ class KernelEntry:
             self.sectcheck += name + " "
             self.new_start_line = 0
 
-        elif name == "@...":
-            name = "..."
-            self.parameterdescs[name] = contents
-            self.sectcheck += name + " "
-            self.parameterdesc_start_lines[name] = self.new_start_line
-            self.new_start_line = 0
-
         else:
             if name in self.sections and self.sections[name] != "":
                 # Only warn on user-specified duplicate section names
-- 
2.49.0

