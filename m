Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E7B17C220;
	Sat, 21 Jun 2025 20:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750538130; cv=none; b=A7WFSJzIWx72iWrfvXIhvMbQesNJy6QZOqNZyQv95yNzFd0061MZH+0+N8834vacIkw6IEYS49/6muZunbF8+gChcgeMgFhBwq+nCsFJhu+53oHZ3+1AZWZCiIYsgvJ45bwwZt2BhcDrgvnhDOgt3v+bno6ZeWqrmR2qlKoyOdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750538130; c=relaxed/simple;
	bh=PIgnXZoNcczk9sjzileC3R46aHm/pWzyDBtsHom8YH4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZR6b2CjJLasL9yn/yInfMBF9q6Ch1J8uvxhyeyFdiC4ZZyNcxeWGsoiOiSJ3gJ0fkHxNtthW6TDRsorAohgqSgj+XkEZxcxFmUE9yU26SElJMET/SB+r0C+0K5HVPxodwf9A6wKcH4Ql+71b3KY6V322521Q6qScV0Aqi7F8JRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Mz2ph1H/; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Mz2ph1H/"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B9DD441F2B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1750538128; bh=TJA19eEJ7nfHXs0zlOqFBQnq1kbpG1/6/C2QTSEnHhA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Mz2ph1H/iEpDNhi142UwH+rdYCRoRi5TzF9G3Onhg3sULbbPBIa5aS25Fj7mLNQ+/
	 4zu/Vg1ovIz7NeRCfRSkxTe0r/k9deHbyeq58XVlPNDPU98Jyc7CzUoz/5CtFGYmmE
	 jUxJ4HKzkvtfRdGcpo+9ir1UznEBlGis5PLvpF2CtCna5j3UB7ppRLz5hfv7gcpV00
	 j6ly0lGSwxMKJ+79M2ar34m1fGF7eYxgh5Bl8uUpLslYO1kLtmd8TUGZBAYmDF8J69
	 wWCK3E3HCdj2oBzdZRF28hSUJukipOASPe+aXMeeuemPSmQ6o+TMctZqqlO0WgOBlZ
	 gSiomlkhxs9fQ==
Received: from trenco.lwn.net (unknown [IPv6:2601:280:4600:2da9:67c:16ff:fe81:5f9b])
	by ms.lwn.net (Postfix) with ESMTPA id B9DD441F2B;
	Sat, 21 Jun 2025 20:35:27 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 1/9] docs: kdoc: Make body_with_blank_line parsing more flexible
Date: Sat, 21 Jun 2025 14:35:04 -0600
Message-ID: <20250621203512.223189-2-corbet@lwn.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250621203512.223189-1-corbet@lwn.net>
References: <20250621203512.223189-1-corbet@lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The regex in the BODY_WITH_BLANK_LINE case was looking for lines starting
with " * ", where exactly one space was allowed before the following text.
There are many kerneldoc comments where the authors have put multiple
spaces instead, leading to mis-formatting of the documentation.
Specifically, in this case, the description portion is associated with the
last of the parameters.

Allow multiple spaces in this context.

See, for example, synchronize_hardirq() and how its documentation is
formatted before and after the change.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 scripts/lib/kdoc/kdoc_parser.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
index 42b2e0936b72..c46e1b6a7d4b 100644
--- a/scripts/lib/kdoc/kdoc_parser.py
+++ b/scripts/lib/kdoc/kdoc_parser.py
@@ -1309,7 +1309,7 @@ class KernelDoc:
         """
 
         if self.state == state.BODY_WITH_BLANK_LINE:
-            r = KernRe(r"\s*\*\s?\S")
+            r = KernRe(r"\s*\*\s*\S")
             if r.match(line):
                 self.dump_section()
                 self.entry.section = SECTION_DEFAULT
-- 
2.49.0

