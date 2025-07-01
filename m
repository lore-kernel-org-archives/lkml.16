Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD25266560;
	Tue,  1 Jul 2025 20:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751403479; cv=none; b=Q1p1piSGDaN/qaXoFcgMJEevZImdDAJjgG4gZ+QRdKWGJ2MHmZWbwVPlTZJpb/PtIjyCwijqbUovw0XQzfwsEMDeldxS6hb+f/ipfHy3lsr6++awpdj/239szhzzylcXHu6OoONAgqooV5H7PxSVwHRx56KZpyn99WYddm7RU2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751403479; c=relaxed/simple;
	bh=Eaksr4HhPMjQmwPjPOOAjOOvNz7adjAjvNRO1mGvo5c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BanzwLeXIgzKPdTsqoOuLR1VJ+57wx22Y1r1QZHXGDOk50gWryvLZgPnbesXM9xeNaeUDAZDMzdETo6YTnhtnkOcfh/kScW67gB987GBcag3AqegWyrT/KmSVYPFU1j/HFuoNxKCppOzNgQ00ol0G99b4bdtP97x0RkfQJaDNT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=IX7J0deq; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="IX7J0deq"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net BF84540AD0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1751403472; bh=uKLzQw6LskeWU3LFVrkmzDlvEIcpVXbA+0YqM4MUzu8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IX7J0deq62csjiUS+s4DmMe0Y9GFwQ0BurnEWF9KlHflSqAkYBwB2qw/txy/Uv+5n
	 ji5jNokHj09mWoT+OvrWgvFT7p27TFcbf3kmMq6ll03wcYSCX72GJ1s7m9lmkSokn5
	 TMJCSYYEZOP5+BNV/UruaemBzmM+il/lvEXxwaIPP7TuEmXMHb1nI7XNzM//7V5vI0
	 CCJ8KOLZvv+Dc3O/xKrVqoY0eWOfCY2Q3bCNhnUIBCdxsN9ObRz3d3xl1dlkBcMldG
	 6diUfO7e1/2UU+2KktN8xOO3mK8ROzNgCDjw6nWSzlHEcIIWT4vje/YdCyvrLf2Ec7
	 qGSK17+FJrwoA==
Received: from trenco.lwn.net (unknown [IPv6:2601:280:4600:2da9::1fe])
	by ms.lwn.net (Postfix) with ESMTPA id BF84540AD0;
	Tue,  1 Jul 2025 20:57:51 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 2/7] docs: kdoc: micro-optimize KernRe
Date: Tue,  1 Jul 2025 14:57:25 -0600
Message-ID: <20250701205730.146687-3-corbet@lwn.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250701205730.146687-1-corbet@lwn.net>
References: <20250701205730.146687-1-corbet@lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch KernRe::add_regex() to a try..except block to avoid looking up each
regex twice.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 scripts/lib/kdoc/kdoc_re.py | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/kdoc/kdoc_re.py b/scripts/lib/kdoc/kdoc_re.py
index e81695b273bf..a467cd2f160b 100644
--- a/scripts/lib/kdoc/kdoc_re.py
+++ b/scripts/lib/kdoc/kdoc_re.py
@@ -29,12 +29,10 @@ class KernRe:
         """
         Adds a new regex or re-use it from the cache.
         """
-
-        if string in re_cache:
+        try:
             self.regex = re_cache[string]
-        else:
+        except KeyError:
             self.regex = re.compile(string, flags=flags)
-
             if self.cache:
                 re_cache[string] = self.regex
 
-- 
2.49.0

