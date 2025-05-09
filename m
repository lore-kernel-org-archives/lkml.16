Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C014B1E7C
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 09:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746783435; cv=none; b=AXAsjoT4+mNZT4gRN2oU5Yk3BpF9Id8Gve8ZszXbZxhIXZtLgQVNLrnzVFmKI326oR00JKoCdJlGuFV7vZbkoHIHvxa0svZOmHCE1kODhLQMYc695MXcFUlTDPzW8yMfOIbsZP/sFYE9bF/0gCWMEQhmlL5LA+CuwvKQBoVj+oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746783435; c=relaxed/simple;
	bh=sDYSAhVvIVn5tQ2ro4uFEW6nTVXtiDwlETIlf6AuHMs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mi0uTJR714jwzwakMAnGkjSAsYE9RjOykW87LDfMdEVNzr4eYc5dJeuayCXiC7hRl/wfyKChRqUaL6vU50n0GYXR7iDsJ+F2sgERO65t5q6XJlIWigAEcMPQiwQ32jOxQfscW+EDqMVcQaUk0nqGnOeLfv2eTIc7f6tSguiAFpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=XwpHchZB; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=GRMwnEBz reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="XwpHchZB";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="GRMwnEBz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1746783431; x=1778319431;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Sa65UZo5QHwJ99/kDWQn+CX44VKbX5JZ/RDf9qrF3lM=;
  b=XwpHchZBdIsQfm5/lJvzCGpGFE5EKIkNSV1X0+RI5wwHlnLKoUZ27y9w
   PjkfNN3WjqiIeJ1uNAhJ3x7iMPX/4PEMFw81As/Q5c0ocpbaAdOuwtPtR
   0GinPg55lqDvqeY2HSB9ewskjEwo9Nd73b32kJWjo5vklCCDsLZPwKnuW
   UkzgfoUjkfvgvZLO9itxvTFzKuOZLLuqIlNEIteUDFXo0J711DN8wzFu0
   xpUwWXg/KGXoSyX2oyYm81CLBRMjN4XgnIYk5D6H/zZnJebzVzBhJwbb6
   w1UQLA2rS6I8fypRlFw9LFvCeDOjuv8HTJE51KXJwQD136bQgh4HVvKXF
   w==;
X-CSE-ConnectionGUID: T4LyJ4wQQe214YuReQuUzg==
X-CSE-MsgGUID: nMKPSJZ7Ru6+ruPHa6EBhg==
X-IronPort-AV: E=Sophos;i="6.15,274,1739833200"; 
   d="scan'208";a="43982717"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 09 May 2025 11:37:03 +0200
X-CheckPoint: {681DCCBE-4B-45F3AE15-E90F7DFA}
X-MAIL-CPID: A167B3FE7372266156962412CDD67950_5
X-Control-Analysis: str=0001.0A006374.681DCCBA.004A,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5EAA9163D2A;
	Fri,  9 May 2025 11:36:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1746783418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Sa65UZo5QHwJ99/kDWQn+CX44VKbX5JZ/RDf9qrF3lM=;
	b=GRMwnEBz6zFlm1IXBrZJVCIOsjwp9p6s4klim27YmSXswJEmW4h1Y/NP6T80Eb7eMcsTZy
	/3Xe7ePXLWgeVfjfF3Sf5FTKmg9pyudEIeupHsCCsrOJwqdHlDbfu1q40Mi6Vf1epZAocr
	wv5U4JDv6l0suEcvX3xxI1+LJjkmv0hc2yx35ELq48dSKsdlORo0lZpr+oket9xp1HqbAC
	Xme3txGx/RLd4ZS0lZ0G656mKn6J3aTPMsoSlodESZa89bzsd9VJmNvVgGQHcKl8Kp4Mpa
	fMa6FU+jWUKQZtM3ytUAl3uTOdpnoDZ8VwuhccI+cpXMslre2/JHI3URi7aDYA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Nishanth Menon <nm@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/1] soc: ti: wkup_m3_ipc: Use dev_err_probe
Date: Fri,  9 May 2025 11:36:52 +0200
Message-ID: <20250509093652.1866566-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

During probe the mailbox channel might not yet be available. Use
dev_err_probe to silence this deferred probe error message:
wkup_m3_ipc 44e11324.wkup_m3_ipc: IPC Request for A8->M3 Channel failed! -517

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/soc/ti/wkup_m3_ipc.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/ti/wkup_m3_ipc.c b/drivers/soc/ti/wkup_m3_ipc.c
index 79dde9a7ec639..5845fc652adcf 100644
--- a/drivers/soc/ti/wkup_m3_ipc.c
+++ b/drivers/soc/ti/wkup_m3_ipc.c
@@ -644,11 +644,9 @@ static int wkup_m3_ipc_probe(struct platform_device *pdev)
 
 	m3_ipc->mbox = mbox_request_channel(&m3_ipc->mbox_client, 0);
 
-	if (IS_ERR(m3_ipc->mbox)) {
-		dev_err(dev, "IPC Request for A8->M3 Channel failed! %ld\n",
-			PTR_ERR(m3_ipc->mbox));
-		return PTR_ERR(m3_ipc->mbox);
-	}
+	if (IS_ERR(m3_ipc->mbox))
+		return dev_err_probe(dev, PTR_ERR(m3_ipc->mbox),
+				     "IPC Request for A8->M3 Channel failed!\n");
 
 	if (of_property_read_u32(dev->of_node, "ti,rproc", &rproc_phandle)) {
 		dev_err(&pdev->dev, "could not get rproc phandle\n");
-- 
2.43.0

