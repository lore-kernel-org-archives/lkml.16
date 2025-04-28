Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9021C1B85F8
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 06:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745820860; cv=none; b=bhIGxTl40oEfWNnxacFQFodkTKHPho1hNMDFLSKmYZRbccp2elih9GGQYVrHU2QlibcKH45bK6J0kIWsBX5TnD2vAB4xaLRJBQ9OCOiLHf7r94WfoKTjIE9gqd9W6E0u8Yg+AcNSgKaLePr/2UZHPXprQwtulaENZFQKpZNpgdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745820860; c=relaxed/simple;
	bh=7KMQeuyOyCYitIjR2rMb2L1WE/OVDkFQ75pBih7W5fk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kU9wN3+kDURSM9UtNsekQ4GgFEE32dVcZbPXN/ov4FnF97VqkhHewVgfycRQxvNsqz1zp1fKVTDwibFIG5gBdL+1Ww9qolIxljBjTMBi7h0DT8qXHGMvSuJ9JMLBGjlejUBSKdEw23raFrqjr0duWrNEBo6ohFeJPuBat8cxtiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VvVx3kIz; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VvVx3kIz"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745820855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=I8nsf8o70Qa3W09KtF1+Bj1jDIeGKTvvrbUdrVUnHOE=;
	b=VvVx3kIzXIBO01o5AL9TafTNmC7MsL3SX4Y8iEK5kFhKEPw4wLdW1s6nfKqX3jeduGbXe+
	4Tdj3wTR0DMUC60Qk52mCDum4LqbEXWQQJJ6pEfYLZrEV98V+djibYzbmKfbPkw3yCHJ0c
	3xpv8ao3GAEQvVkTuNlUM1Ge1/k4NJU=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] regcache: Use sort()'s default swap() implementation
Date: Mon, 28 Apr 2025 08:13:18 +0200
Message-ID: <20250428061318.88859-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Use sort()'s default swap() implementation and remove the custom
regcache_defaults_swap() function.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/base/regmap/regcache.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/base/regmap/regcache.c b/drivers/base/regmap/regcache.c
index f7fcf2de1301..c7650fa434ad 100644
--- a/drivers/base/regmap/regcache.c
+++ b/drivers/base/regmap/regcache.c
@@ -34,21 +34,10 @@ static int regcache_defaults_cmp(const void *a, const void *b)
 		return 0;
 }
 
-static void regcache_defaults_swap(void *a, void *b, int size)
-{
-	struct reg_default *x = a;
-	struct reg_default *y = b;
-	struct reg_default tmp;
-
-	tmp = *x;
-	*x = *y;
-	*y = tmp;
-}
-
 void regcache_sort_defaults(struct reg_default *defaults, unsigned int ndefaults)
 {
 	sort(defaults, ndefaults, sizeof(*defaults),
-	     regcache_defaults_cmp, regcache_defaults_swap);
+	     regcache_defaults_cmp, NULL);
 }
 EXPORT_SYMBOL_GPL(regcache_sort_defaults);
 
-- 
2.49.0

