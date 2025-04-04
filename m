Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDCC14A0A8
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 06:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743747146; cv=none; b=SZvoD7JcTbuumn1dFzg57a2pbVd56/0i7hM5VX8BTBGbPRvB37oE17E/EX+SVsf2IifggTcK7Fi1Szj93yfnpNoduSGMJDExkkra/UF3rOIsC363lDm8PQffOgdd/xsx3J7Twfz/NgIJCdb9TG1KyX0XTxXVqi4Mh1ZrF93uIYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743747146; c=relaxed/simple;
	bh=dclHe5vZPsL8BoV3MS9TfbIbF/cEN2mVaPUDTSA5uV4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=A8u2lc1FXwwg6+gqOI7TR0p1WoXcCkqPQPB2Hpmdq6ajwTb9kPcqaZ2wrIx58i3Xt0I79T33h+bDfs4eOvXEBwqHAHea3NstA3Bcjycw/7CHHCPZh3ivYss0B4cczQ58p9B+lILj+ga6PB+FKKOwMoExo1zLZpFHgi3W1fhknHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=uEAe+jev; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="uEAe+jev"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743747142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=n7GmzXDZjZ3V972/EgZThJHCVso08B6oY073TstCpKs=;
	b=uEAe+jevEOCoAsKVsQ6zBEvkKchj0nR5q4tLV9AKUFWabZ9EHfq+GQAsWDzobZptsG2Ype
	C6Ma/ZYLpMODDQAYGjJNWFW2sRmvyX8z80ZtA8ScJBrxgHzQZEheOfkmB9G8qZGgw1u5t0
	FqX6XvaSQsy/WcaTl9vCgpkOmcxslSA=
From: sunliming@linux.dev
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org,
	arnd@arndb.de,
	niharchaithanya@gmail.com,
	everestkc@everestkc.com.np
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	sunliming <sunliming@kylinos.cn>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH RESEND] staging: gpib: warning: variable 'nec_priv' set but not used warning
Date: Fri,  4 Apr 2025 14:11:35 +0800
Message-Id: <20250404061135.330056-1-sunliming@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: sunliming <sunliming@kylinos.cn>

Fix below kernel warning:
drivers/staging/gpib/eastwood/fluke_gpib.c:196:23: warning: variable 'nec_priv' set but not
used [-Wunused-but-set-variable]

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202503200532.B4rXNs0N-lkp@intel.com/
Signed-off-by: sunliming <sunliming@kylinos.cn>
---
 drivers/staging/gpib/eastwood/fluke_gpib.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/gpib/eastwood/fluke_gpib.c b/drivers/staging/gpib/eastwood/fluke_gpib.c
index 0304c5de4ccd..6854a745ccff 100644
--- a/drivers/staging/gpib/eastwood/fluke_gpib.c
+++ b/drivers/staging/gpib/eastwood/fluke_gpib.c
@@ -194,10 +194,8 @@ static int fluke_line_status(const gpib_board_t *board)
 	int status = ValidALL;
 	int bsr_bits;
 	struct fluke_priv *e_priv;
-	struct nec7210_priv *nec_priv;
 
 	e_priv = board->private_data;
-	nec_priv = &e_priv->nec7210_priv;
 
 	bsr_bits = fluke_paged_read_byte(e_priv, BUS_STATUS, BUS_STATUS_PAGE);
 
-- 
2.25.1

