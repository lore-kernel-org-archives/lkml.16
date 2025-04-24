Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAAA1DEFE1;
	Thu, 24 Apr 2025 06:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745476099; cv=none; b=GbtDR5b1j7G20BBRE5ZrzPjWXiQGXYsvzO+BS9BWj1udUABQsMKUlRQaH1Pma0a4WKk+j3NERfkQtBotp/odosMVuXPh4AZl5CXi9gKh17s2QGLJPvfayyebDuGjnzSQXNewNVgINcp4AVEe3XZev+AlaYiaCYPBbfD6OJobG4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745476099; c=relaxed/simple;
	bh=iYSuVzTT55E0HMkjyHQ48u+Pp9i1B0teArWGYGyPXkg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LZHSApqKixMOanN53Bhl14Yke/dDmhuh0BU0Yxn5X7o6IMAhEqvoum7doYRW/hNqA1yO+8RDH9hMptbfyaziIWSufeYihKBm9qDIchsFjTOhkYcaGr7LDFaFX3V5245Cf6mlyVZDsGJXKJ2RIf4EBR5OzDizgsd4v2jy2I1oV/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b=N8+wBd80; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b="N8+wBd80"
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 53O6RulQ6051983, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1745476076; bh=iYSuVzTT55E0HMkjyHQ48u+Pp9i1B0teArWGYGyPXkg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=N8+wBd80nTllR28y7wvjC8pRnf63KIVTVc263mLOzIhtKLsxuOE59eq+eLqBN8FR6
	 sZkke2cR+AHqPdz8t9hy+ZAebmpQMskeWoJeKRWnvzY3XzIyLAaymTpGjbpKjpNWKZ
	 BhzV8gTo7jBhc24yUZO5Nj4hGP9ZGH22uUAbwErOUuLkYbhWR8uUDh/YRDQPZUx5+C
	 nawKIf7RAtI5ZEsvIjqA99gehCl+SIrnLlmFq/xpBNY59MECT1SSatFnumaBBmZ8we
	 qac1bG8a2roUT7nVQxdP70vYwGMr7UrVJ40eUfhtvmL4kB1DeThlBPkfqROv/N0e58
	 xP07yvu9kCYHQ==
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/3.06/5.92) with ESMTPS id 53O6RulQ6051983
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Apr 2025 14:27:56 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 24 Apr 2025 14:27:56 +0800
Received: from RTDOMAIN (172.21.210.124) by RTEXMBS04.realtek.com.tw
 (172.21.6.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Thu, 24 Apr
 2025 14:27:56 +0800
From: Justin Lai <justinlai0215@realtek.com>
To: <kuba@kernel.org>
CC: <davem@davemloft.net>, <edumazet@google.com>, <pabeni@redhat.com>,
        <andrew+netdev@lunn.ch>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, <horms@kernel.org>, <pkshih@realtek.com>,
        <larry.chiu@realtek.com>, Justin Lai <justinlai0215@realtek.com>
Subject: [PATCH net-next] rtase: Modify the format specifier in snprintf to %u.
Date: Thu, 24 Apr 2025 14:27:46 +0800
Message-ID: <20250424062746.9693-1-justinlai0215@realtek.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: RTEXH36505.realtek.com.tw (172.21.6.25) To
 RTEXMBS04.realtek.com.tw (172.21.6.97)

Modify the format specifier in snprintf to %u.

Fixes: ea244d7d8dce ("rtase: Implement the .ndo_open function")
Signed-off-by: Justin Lai <justinlai0215@realtek.com>
---
 drivers/net/ethernet/realtek/rtase/rtase_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/realtek/rtase/rtase_main.c b/drivers/net/ethernet/realtek/rtase/rtase_main.c
index 8c902eaeb5ec..5996b13572c9 100644
--- a/drivers/net/ethernet/realtek/rtase/rtase_main.c
+++ b/drivers/net/ethernet/realtek/rtase/rtase_main.c
@@ -1114,7 +1114,7 @@ static int rtase_open(struct net_device *dev)
 		/* request other interrupts to handle multiqueue */
 		for (i = 1; i < tp->int_nums; i++) {
 			ivec = &tp->int_vector[i];
-			snprintf(ivec->name, sizeof(ivec->name), "%s_int%i",
+			snprintf(ivec->name, sizeof(ivec->name), "%s_int%u",
 				 tp->dev->name, i);
 			ret = request_irq(ivec->irq, rtase_q_interrupt, 0,
 					  ivec->name, ivec);
-- 
2.34.1

