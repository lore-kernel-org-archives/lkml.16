Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D23C1E377F
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 12:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.216.63.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743423282; cv=none; b=DOF8+dHh0nknj45bLV9Ssg9QG3Mbsl/arPq8RFhq6VG8OkWIbYD9O3T5syRzfc1EGcak5RUD/IYcU4nUNbwCXdCp2tlYGm4+z4fUzVn8+8evpygTjGBCFGnZuWjttjB6xxKqLKSMVGQ+L3njvcDyl5UeeHpHGnv+sOC5m/2e1nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743423282; c=relaxed/simple;
	bh=gVlxyrwyqplJnvQbj0nH7yIPZkaBYx6wgVpLYbMhhE8=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=ALctp8ix0GE0jRiGbsJYEtxCKvFfUYADKncAxi3MYbKQtOT1IB2+gcq2VW1QTuAGOQ6nK+K4X2NPSqA/EbuRferVRSax2vmtSiu5IknKabKE1mcXQylxeiIYOphObQJJbP0bh+FFB8bxlEccQuCNPipZ5QkC7KzNF/n0m/c0qrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=63.216.63.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZR96d1Gsjz8QrkZ;
	Mon, 31 Mar 2025 20:14:33 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl2.zte.com.cn with SMTP id 52VCEMZl054991;
	Mon, 31 Mar 2025 20:14:22 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Mon, 31 Mar 2025 20:14:25 +0800 (CST)
Date: Mon, 31 Mar 2025 20:14:25 +0800 (CST)
X-Zmail-TransId: 2afa67ea8721444-29a24
X-Mailer: Zmail v1.0
Message-ID: <20250331201425296l4h98bZjxHzs08fdvHrGO@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <nm@ti.com>
Cc: <yang.yang29@zte.com.cn>, <xu.xin16@zte.com.cn>, <ye.xingchen@zte.com.cn>,
        <ssantosh@kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <tang.dongxing@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSBzb2M6IHRpOiBrMy1yaW5nYWNjOiBVc2UgZGV2aWNlX21hdGNoX29mX25vZGUoKQ==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 52VCEMZl054991
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67EA8729.000/4ZR96d1Gsjz8QrkZ

From: Tang Dongxing <tang.dongxing@zte.com.cn>

Replace the open-code with device_match_of_node().

Signed-off-by: Tang Dongxing <tang.dongxing@zte.com.cn>
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
 drivers/soc/ti/k3-ringacc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/ti/k3-ringacc.c b/drivers/soc/ti/k3-ringacc.c
index 82a15cad1c6c..7602b8a909b0 100644
--- a/drivers/soc/ti/k3-ringacc.c
+++ b/drivers/soc/ti/k3-ringacc.c
@@ -1291,7 +1291,7 @@ struct k3_ringacc *of_k3_ringacc_get_by_phandle(struct device_node *np,

 	mutex_lock(&k3_ringacc_list_lock);
 	list_for_each_entry(entry, &k3_ringacc_list, list)
-		if (entry->dev->of_node == ringacc_np) {
+		if (device_match_of_node(entry->dev, ringacc_np)) {
 			ringacc = entry;
 			break;
 		}
-- 
2.25.1
