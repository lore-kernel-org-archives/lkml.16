Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE9C2ECEA8;
	Fri, 27 Jun 2025 18:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751049618; cv=none; b=qNVGauktCnHtipBqlir1s2EPug92xwdQ80jb7OlAmiLXju+fNuvHZG6M9aIlaul3DN3+9AdbElBUTQDreCaoP9aaCtNso4CxVYdNaXlFJT1vbxaRapXyLv6Vv8TVO920SusvgLtIvZbHzFnMy2dZtoPojl1RN7WeTN0/6xO+DvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751049618; c=relaxed/simple;
	bh=eKnkV3cRdYAzuNoW6e/CWaaa9iGwq94K82H2T+gMCX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u+YNxGZZ1qkFVICrjKeTekz9OZdBBX/VKg4nA06BWZyTRnUFLxcH0ayGdNc4JiZRmKrGoh2BvJe13CPLrLm+zmPLZZW/KkpTa0zV9Lcaz8JdvwnJfajdZYLsev5uAJkiYTSeHlmSquj+83eNaza86BFHwUVO1gf9JAw5Jgc4qBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=W5axXksc; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="W5axXksc"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C372340AD5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1751049616; bh=oy2tQOVISxZN/7bzsjOD/t4NelfiJkEaBQFC9sJRccE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W5axXkschMzOVROgnPDBZa2LW1STyyHO+0RHgTpkwvAskjAUz5aziVgyzKcTNms2R
	 6fg2nvgt6hu6OwhMqUiM28llMmzHrahBrMVJH3riNKTsD+MuxonxUcGPfGBHkB0uCF
	 prQO0pOv4rQwiAR6ugRAfZle/zcmAv8zEVEzpDt9ynexj+PvG2kWp+R1qtOHQBaoRI
	 3ffDmQI+fK4L6NDnUmK3k4M8QV7cGroDWNL+rH7ykoIrHu7FFXMtx7Dt8UOZsUEcDv
	 FhTTmGWTyUjymDmphUzRUJ9UJKdnmLGV0cI6SSzxgmen+nKoz5bf3FzCVNJo7zQ2Nv
	 vsRMreOP9Lc9g==
Received: from trenco.lwn.net (c-73-14-55-248.hsd1.co.comcast.net [73.14.55.248])
	by ms.lwn.net (Postfix) with ESMTPA id C372340AD5;
	Fri, 27 Jun 2025 18:40:15 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 4/8] docs: kdoc: remove KernelEntry::function
Date: Fri, 27 Jun 2025 12:39:56 -0600
Message-ID: <20250627184000.132291-5-corbet@lwn.net>
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

This member is unused, to take it out.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 scripts/lib/kdoc/kdoc_parser.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
index 9e46cfa20978..224dea5f7c2e 100644
--- a/scripts/lib/kdoc/kdoc_parser.py
+++ b/scripts/lib/kdoc/kdoc_parser.py
@@ -129,7 +129,6 @@ class KernelEntry:
         self.config = config
 
         self._contents = []
-        self.function = ""
         self.sectcheck = ""
         self.struct_actual = ""
         self.prototype = ""
-- 
2.49.0

