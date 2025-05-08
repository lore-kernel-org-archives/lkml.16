Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D54238F80
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 00:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746663752; cv=none; b=DWUWjyFXNbLxY62+JP6/nLiZkuYivvMcjbpF1czTDNvJ8UXIJ5rkFXMdU6/uZOJmjPulh9bj9fWRjyVSK5jifFjN6uEkHqSCZKeof2KkHgxGzY3QBJapDWbj3ZhLsgfgejRNYC0VtLjc7K699mdUOGOsKHGs8KBXJZriItEdyI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746663752; c=relaxed/simple;
	bh=hskLJXjgM+5iBMzRzwuLWLkbYZ8zW4PVXh88bDdSItk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H/VqMo2hRf4pOvDTBtKyUBSgA9gIuL8F0CcTrzWnzCjmobSzD2tdov30kNr9qh6WeADu/ULZ/ErB9lJbrSlajouptDWlz7yXAyE9iX7IVmtDyfJJ7tq+2Z91stkqpN37raHa8sn1pui8QF1oEL9fUCdR+mrSG92F35Zc1Y5uVxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=dOVrgQtZ; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="dOVrgQtZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=SZYWknl8nEFAwI8QYUQ3xHDwD12l8aPLSAu95/JRXsc=; b=dOVrgQtZ35ATIQj1
	wrR3niAM/dRqqIVqbUUN2EMSrh4vbSD2eRy/YBvNkM4Jy2JeQzKsJUSd98vQd8TN05+QzBlgelDKB
	OkiKqlpwHsdY3UzGFRPUK8lhVQJT3GJOG71J9sEeWcrOnJlaLaP9hmQLbkaBRpbgJdiryPpa5AzSa
	3+66jWWpJU7BhTS+N5/bQ8uvLAcVOYwy2vZVxsATID7QTTJ4p01mIAvRgzNaI6MEZTuBLywgpQStA
	px9VJT3xSzUW/SvgFDge8NeP5qsk2aASgRQNV6OX4CygVQeZwKTm08dC5XNvA92zrp19rVT0PcvXX
	j6i2hN+hHGUqA6vNjA==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1uCp1v-002HXY-3C;
	Thu, 08 May 2025 00:22:28 +0000
From: linux@treblig.org
To: lee@kernel.org
Cc: linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] mfd: sm501: Remove unused sm501_find_clock
Date: Thu,  8 May 2025 01:22:27 +0100
Message-ID: <20250508002227.204836-1-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

sm501_find_clock() was added in 2007 as part of
commit b6d6454fdb66 ("[PATCH] mfd: SM501 core driver")
but hasn't been used.

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/mfd/sm501.c | 43 -------------------------------------------
 1 file changed, 43 deletions(-)

diff --git a/drivers/mfd/sm501.c b/drivers/mfd/sm501.c
index 7ee293b09f62..bdeea0047e1b 100644
--- a/drivers/mfd/sm501.c
+++ b/drivers/mfd/sm501.c
@@ -631,49 +631,6 @@ unsigned long sm501_set_clock(struct device *dev,
 
 EXPORT_SYMBOL_GPL(sm501_set_clock);
 
-/* sm501_find_clock
- *
- * finds the closest available frequency for a given clock
-*/
-
-unsigned long sm501_find_clock(struct device *dev,
-			       int clksrc,
-			       unsigned long req_freq)
-{
-	struct sm501_devdata *sm = dev_get_drvdata(dev);
-	unsigned long sm501_freq; /* the frequency achieveable by the 501 */
-	struct sm501_clock to;
-
-	switch (clksrc) {
-	case SM501_CLOCK_P2XCLK:
-		if (sm->rev >= 0xC0) {
-			/* SM502 -> use the programmable PLL */
-			sm501_freq = (sm501_calc_pll(2 * req_freq,
-						     &to, 5) / 2);
-		} else {
-			sm501_freq = (sm501_select_clock(2 * req_freq,
-							 &to, 5) / 2);
-		}
-		break;
-
-	case SM501_CLOCK_V2XCLK:
-		sm501_freq = (sm501_select_clock(2 * req_freq, &to, 3) / 2);
-		break;
-
-	case SM501_CLOCK_MCLK:
-	case SM501_CLOCK_M1XCLK:
-		sm501_freq = sm501_select_clock(req_freq, &to, 3);
-		break;
-
-	default:
-		sm501_freq = 0;		/* error */
-	}
-
-	return sm501_freq;
-}
-
-EXPORT_SYMBOL_GPL(sm501_find_clock);
-
 static struct sm501_device *to_sm_device(struct platform_device *pdev)
 {
 	return container_of(pdev, struct sm501_device, pdev);
-- 
2.49.0

