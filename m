Received: from cantor.telenet-ops.be (cantor.telenet-ops.be [195.130.132.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345981922F4
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 19:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748374241; cv=none; b=o1+wQ3nPmtgk1ieCja6LaypTRgjgDItAye7t35W29K9oE4YTe8BIfRVnPn9f3XRfczpUyUn8uOSHHb/7UcJnl5hRdRXzh2icFPPUPSRrwy6gvXGpUonnc2Z2RDwczIqugnii2lRqZci9v5Jpu6oKUyWcAP2tor+didFzgAH09Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748374241; c=relaxed/simple;
	bh=QpNV285BTS/KBng6Vcq4utezeQCjGo6G6reZO+F6LiE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Uqyz2+jUhCSH+JM9yoDvSySgsxg+a8m+ymWrMwkB+nNxBuxfC81UWwigooMScgtf1tQWz9LNU7uyLY9xh+QJP9+CKxcSlODiZT8gaUAeFUgEP8pd9RTVGz/6TYInEJjfCc6erL91Rttmk6YsenuCGy0H5hyfFlOFZHkzIQ365oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
	by cantor.telenet-ops.be (Postfix) with ESMTPS id 4b6N5L3FrFz4x2YN
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 21:30:30 +0200 (CEST)
Received: from ramsan2 ([IPv6:2a02:1810:ac12:ed80:9962:836e:244b:c4d7])
	by albert.telenet-ops.be with cmsmtp
	id uKWM2E0050Y7Yez06KWM4k; Tue, 27 May 2025 21:30:23 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan2 with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uK00C-00000003oHh-1fbh;
	Tue, 27 May 2025 21:30:20 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uK00C-00000003Wf4-1DCX;
	Tue, 27 May 2025 21:30:20 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Jian Shen <shenjian15@huawei.com>,
	Salil Mehta <salil.mehta@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] [net-next] hns3: Demote load and progress messages to debug level
Date: Tue, 27 May 2025 21:30:15 +0200
Message-ID: <0df556d6b5208e4e5f0597c66e196775b45dac60.1748357693.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Geert Uytterhoeven <geert+renesas@glider.be>

No driver should spam the kernel log when merely being loaded.
The message in hclge_init() is clearly a debug message.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Alternatively, the printing in hns3_init_module() could be removed
completely, but that would make hns3_driver_string[] and
hns3_copyright[] unused, which HiSilicon legal may object against?
---
 drivers/net/ethernet/hisilicon/hns3/hns3_enet.c         | 4 ++--
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c b/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c
index b03b8758c7774ec2..5c8c62ea6ac0429f 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c
@@ -5961,8 +5961,8 @@ static int __init hns3_init_module(void)
 {
 	int ret;
 
-	pr_info("%s: %s - version\n", hns3_driver_name, hns3_driver_string);
-	pr_info("%s: %s\n", hns3_driver_name, hns3_copyright);
+	pr_debug("%s: %s - version\n", hns3_driver_name, hns3_driver_string);
+	pr_debug("%s: %s\n", hns3_driver_name, hns3_copyright);
 
 	client.type = HNAE3_CLIENT_KNIC;
 	snprintf(client.name, HNAE3_CLIENT_NAME_LENGTH, "%s",
diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
index 3e28a08934abd2e1..6bfff77ea7e67e8d 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
@@ -12904,7 +12904,7 @@ static struct hnae3_ae_algo ae_algo = {
 
 static int __init hclge_init(void)
 {
-	pr_info("%s is initializing\n", HCLGE_NAME);
+	pr_debug("%s is initializing\n", HCLGE_NAME);
 
 	hclge_wq = alloc_workqueue("%s", WQ_UNBOUND, 0, HCLGE_NAME);
 	if (!hclge_wq) {
-- 
2.43.0

