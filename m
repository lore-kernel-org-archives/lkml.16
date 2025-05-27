Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48D928A415
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 19:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748374435; cv=none; b=Cym/3NkX/OhHz5yYI97gb0YOPDNRt+d/cR2WdJZPkNFqj4mf2GS9A+0UqizYXiMHrWJsAxWCyHhte61MnEXqTpQTg3uh13fBd5ll5+NEGyF/qSPQCiiZudYeaLO33aCYoX07qQvLSv5VAgIGL8TaNT27ZUfzhuBtVx/YdsV8Vww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748374435; c=relaxed/simple;
	bh=tgF2570zw5h+ocW0gtCk0NIZVkzaTrB+6ITFfSpsTB0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O46yg37htT7GxdHYg5JbRmyvAEgTWYAApH3UXbgnSIAFvxObnRF8o90rbgb3ftTU/TCVTKNFRbp5VAXXXala+L8N3uRoNMN+3vB8ax4UMw0geF0ybyZEG0S+VVipzq2sffPwrawqh2PrYl45c7c34wfrSlTypnw0GsU39miX4Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan2 ([IPv6:2a02:1810:ac12:ed80:9962:836e:244b:c4d7])
	by michel.telenet-ops.be with cmsmtp
	id uKZi2E0030Y7Yez06KZiuR; Tue, 27 May 2025 21:33:44 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan2 with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uK03S-00000003oIx-1lM3;
	Tue, 27 May 2025 21:33:42 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uK03S-00000003Wgy-1J7v;
	Tue, 27 May 2025 21:33:42 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Fan Gong <gongfan1@huawei.com>,
	Xin Guo <guoxin09@huawei.com>,
	Gur Stavi <gur.stavi@huawei.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH net] hinic3: Remove printed message during module init
Date: Tue, 27 May 2025 21:33:41 +0200
Message-ID: <5310dac0b3ab4bd16dd8fb761566f12e73b38cab.1748357352.git.geert+renesas@glider.be>
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

Fixes: 17fcb3dc12bbee8e ("hinic3: module initialization and tx/rx logic")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/net/ethernet/huawei/hinic3/hinic3_main.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/huawei/hinic3/hinic3_main.c b/drivers/net/ethernet/huawei/hinic3/hinic3_main.c
index 093aa6d775ff70da..497f2a36f35dcdde 100644
--- a/drivers/net/ethernet/huawei/hinic3/hinic3_main.c
+++ b/drivers/net/ethernet/huawei/hinic3/hinic3_main.c
@@ -324,8 +324,6 @@ static __init int hinic3_nic_lld_init(void)
 {
 	int err;
 
-	pr_info("%s: %s\n", HINIC3_NIC_DRV_NAME, HINIC3_NIC_DRV_DESC);
-
 	err = hinic3_lld_init();
 	if (err)
 		return err;
-- 
2.43.0

