Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810332F2705;
	Thu,  3 Jul 2025 18:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751568257; cv=none; b=l0ywv6m4KxT66VWp+2QHm61ruE8UsQTJUgMsBzfAP0KwVeiv/xO4bCHtdM4OVcIN4nPCeOHHCG8OgqcMYHEe7jhy651IPgXJ5rCW3nnvy3byPXgT1uQOOBLhWKNbx+JSIr0NnFmb1jzmBLBWgR29TtIPyd26tlbmi0c9yVka8zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751568257; c=relaxed/simple;
	bh=0hR6ZhiubZ5Kyc6vmfw/sHaL3W5BBzzHhyzQChARWQk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oabJUyYAim6z4s7XgfTpTTkQ7buamf2XECrsOgvZR3bM2yr6J0Ld7Gb8jjfg4aeuRXKdrxoLyZOJrkPXmgQ9iN4wrTVmgkX78LPGC+Yf4GmohNe2Jhp30Gt5GIdXwkBEZYtlIY/obGqMjbrWvQ2vS3eez1dYcl69RUKxlQvbjYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=oCr03uAb; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="oCr03uAb"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8CDC340ACB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1751568255; bh=+7QrIo1J84pby1WL7DeMQCAy/1LzFtVjNscgsF5i0jQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oCr03uAbFKL4p/BPT7UvcaUbllWSwHwVPiLNAXv75T35XXTV0Ahic2EFcUC3zo+hR
	 TX9399/p/Y/+pgJlJNPRaf+CDn+XgqON3RgJlaBZaxk6x01P86dlTYZ2jKkUjl7nEz
	 s/qH2kWi2B3LSkcQtGN+a7d8O8G3wlcX5pcHOVcl4MCsA9O5AHL7evlGawF9F9Q7Jj
	 oQohgSNNFADuObgGnUxIplZANSFMbNxVqP7M/Ih99QkFYBKsi3Z6XhFxPjMP6K4GqT
	 Vl4ql8MzNbwRkVMaMmDEmFtCHtrai+3jLN4RVcNpoNXt/S44FAek1G0KR4GWBx120W
	 CY7RfW4fjtKuQ==
Received: from trenco.lwn.net (unknown [IPv6:2601:280:4600:2da9::1fe])
	by ms.lwn.net (Postfix) with ESMTPA id 8CDC340ACB;
	Thu,  3 Jul 2025 18:44:15 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v2 2/7] docs: kdoc: micro-optimize KernRe
Date: Thu,  3 Jul 2025 12:43:58 -0600
Message-ID: <20250703184403.274408-3-corbet@lwn.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703184403.274408-1-corbet@lwn.net>
References: <20250703184403.274408-1-corbet@lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rework _add_regex() to avoid doing the lookup twice for the (hopefully
common) cache-hit case.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 scripts/lib/kdoc/kdoc_re.py | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/kdoc/kdoc_re.py b/scripts/lib/kdoc/kdoc_re.py
index e81695b273bf..612223e1e723 100644
--- a/scripts/lib/kdoc/kdoc_re.py
+++ b/scripts/lib/kdoc/kdoc_re.py
@@ -29,12 +29,9 @@ class KernRe:
         """
         Adds a new regex or re-use it from the cache.
         """
-
-        if string in re_cache:
-            self.regex = re_cache[string]
-        else:
+        self.regex = re_cache.get(string, None)
+        if not self.regex:
             self.regex = re.compile(string, flags=flags)
-
             if self.cache:
                 re_cache[string] = self.regex
 
-- 
2.49.0

