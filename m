Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF816FB9
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 03:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744341203; cv=none; b=jBVslERYmJMlpIGb1KHwn8AjgMjJVHLXf0WAvGKaBc/XLfgOdYRZWR8fGG3DqgyJu+Stlq7WGNZor2LHI0Qa5UxXcHkIwIvK7m2X/hv0WkIL5Wsx/ZYGomEdYTBqu8P15giytPeokqYxwYZ89Z47yKlxKou/cmj8iDQE6zKJncI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744341203; c=relaxed/simple;
	bh=wUxHDLbBSGAp81otzfEfZX3sRBMR1DvVQr28hy/Lndo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=jpzNPdSYu9Xu64GmIwmXmF8KG03AD4OGjHJEcRgtluLCL/Ix9CzhjnUGQT1mtCFUSkfumTOcRuDe53WLca0Hd9YoPYyhOn6E41XOLHodcuZov1SjUxn6nrCwAm5ZDIS5nTlVsrs5hoqGYhAF7gAJXOV9n0BSgADmfjeD9JZngOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jlxip.net; spf=pass smtp.mailfrom=jlxip.net; dkim=pass (2048-bit key) header.d=jlxip.net header.i=@jlxip.net header.b=oHmntTTx; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jlxip.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jlxip.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jlxip.net header.i=@jlxip.net header.b="oHmntTTx"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4ZYhb14W1Hz9sph
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:13:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jlxip.net; s=MBO0001;
	t=1744341197;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Y0CUiD9VG0osrfjJg+84MY6J5qxYRyRwM5/TGsZSPAg=;
	b=oHmntTTxlBZZcip6KAyx1MRReo/SIX6CLRqsFU8DDwsXlpAMutgo92dLkHVtXIp6D2RBn+
	96aD5Kr52ENN3YvlgPrc9QS9clhhiZkzH0Ie6d2aj3cUHCXPqwYFAs2WnB8AHqsPd6Tg0E
	BdCqP1SOy4UTdfSp+37N+whFt5zIG1PJEK/p8GX7pJdX/gyzkTAZX/VOFlb1wVZEA5rBx6
	3OxAImyGoO/c0BBu9hO4GRgU899/9gI75po/pGyxbabavVLchrhql28y48gfSy9QkpWqa8
	xbtfKNMwDao1dflg2IyU0sfpXcymhgeULldKtche05jBnghDwlMT+FeL88UrUg==
Message-ID: <deaf91f5-6d7f-4708-a020-f32f9df8894d@jlxip.net>
Date: Fri, 11 Apr 2025 05:13:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Jose Luis Amador <jlxip@jlxip.net>
Subject: [PATCH] init: Update help for CONFIG_KERNEL_LZO
To: linux-kernel@vger.kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 4ZYhb14W1Hz9sph

The statement was not updated after the introduction of LZ4 and is no
longer true.

Signed-off-by: Jose Luis Amador <jlxip@jlxip.net>
---
 init/Kconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
index dd2ea3b9a799..d79d309a6b0b 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -354,8 +354,9 @@ config KERNEL_LZO
 	depends on HAVE_KERNEL_LZO
 	help
 	  Its compression ratio is the poorest among the choices. The kernel
-	  size is about 10% bigger than gzip; however its speed
-	  (both compression and decompression) is the fastest.
+	  size is about 10% bigger than gzip. Its compression speed is the
+	  fastest, similar to LZ4. Its decompression speed is only surpassed
+	  by LZ4.
 
 config KERNEL_LZ4
 	bool "LZ4"
-- 
2.49.0
