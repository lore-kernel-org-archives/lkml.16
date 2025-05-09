Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759AD4685
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 17:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746812126; cv=none; b=FCTc3T5pB2CHgawUIh63+hOvl5UU1M0FhlPoOXGmOPqqadz35r21sV5Z25oMuXDDJsYSg3nVy4/F1cxIlKVqHvz9oGz1q+CGrmUtIvCpbcbqeJa+0R4J9qZNGMV89C7A9E/YLdGxjruc0A9ut2Kpa9+XuNiIyv7Ehze6mHBZzqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746812126; c=relaxed/simple;
	bh=vgc+qmFXGj2CUjrLoJj/TdwgtvgprFEAhugVXgGn8yU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s6QIwL1xWIqmOymKKOWzVL4wd6w5rX2KLeFSCKhAFzt0tbzjyE2357OkKNMIEXlmx5u+JsBjK+Fw2VOzlZe99ZjHXWNcmrgrrX4NFfldXPPcwhbeHKuYo0ufovG0wYyxCY1IZLCvKFAuyKAnyKDfCpzEagnQNLrfss5Y8NOQrGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=i99fl/BB; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="i99fl/BB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=EL7mlZ+vSluFKscvlLbMD1TL+WBvFSoL5UqaKracsk4=; b=i99fl/BBfGeu5Kp7
	Z94Jw/cFwm5+KU079xK0s6uvnBVSjwp84yjDutRNqJvUWnNno65X0wuhtu07+ZDEEypdNeLzg2NiD
	RbghNBTt7YYD5md8eQqvYH624njvZW5+YxlX2uLyzU8F0jP7L2w5+/TJQ0a0j/LHmY9u13deJJ+rs
	7MJCANI/MbVd6ruHakwQKzlaPt9vQrUQ6p2U1+jprGy9NSSlirM8WZ2ACa5k3WMXi8XZWW5dn1fXZ
	aGxZ2DPUoMV5PuKZISXvrbSiclP3FhByeys/Xi2MKS2HbA83ummXSu81KjgJ3LbaL9PIxF+OuuV6C
	J0aVom92IK+df3gEFQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1uDRd3-002jGJ-28;
	Fri, 09 May 2025 17:35:21 +0000
From: linux@treblig.org
To: lee@kernel.org
Cc: linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH v2] mfd: sm501: Remove unused sm501_find_clock
Date: Fri,  9 May 2025 18:35:20 +0100
Message-ID: <20250509173521.49596-1-linux@treblig.org>
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
v2
  Clean up the header (as per Lee's review)

 drivers/mfd/sm501.c   | 43 -------------------------------------------
 include/linux/sm501.h |  3 ---
 2 files changed, 46 deletions(-)

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
diff --git a/include/linux/sm501.h b/include/linux/sm501.h
index 2f3488b2875d..bcda27a46e7a 100644
--- a/include/linux/sm501.h
+++ b/include/linux/sm501.h
@@ -12,9 +12,6 @@ extern int sm501_unit_power(struct device *dev,
 extern unsigned long sm501_set_clock(struct device *dev,
 				     int clksrc, unsigned long freq);
 
-extern unsigned long sm501_find_clock(struct device *dev,
-				      int clksrc, unsigned long req_freq);
-
 /* sm501_misc_control
  *
  * Modify the SM501's MISC_CONTROL register
-- 
2.49.0

