Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE5C1B960
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 12:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.216.63.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743077603; cv=none; b=oAZY+O9baZJZxXsa7ANclx7978yPnrUNkrRO7EmMoU7mGvzv/viH2yCC83Rdl3RrCC+Brma+7RY+CmRVH3F4GwxhmLDZ7I6JoiD/kldZdlZ9Iqy67RzrgVNUc+c0GHgFxziEqqlVxvot4j9vswZUQtwjjQV/SW7nQg/zbimDhqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743077603; c=relaxed/simple;
	bh=m5n6itpru1rfUcVFl1cK0b4GUO2Eh0ijcFq74YsJdQE=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=ugKJtERY6nXyd/uTnmVKY/K7QIb65ITxXPnIVQKOpUwflBmjZkOui3nSF4CCSA0J6EKYY8Qy/oq8uQIEUI1k4dZfeqbVFBOkJyfBABGLuG+WP/RyxUR4kIZtfg/YJ6goMr+yAPCeasWyjXdPqPVmBTzJpnFj1mN+/HtfPVUQDkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=63.216.63.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZNjGw4BThz8RTZK;
	Thu, 27 Mar 2025 20:13:12 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl2.zte.com.cn with SMTP id 52RCD8li042813;
	Thu, 27 Mar 2025 20:13:09 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid32;
	Thu, 27 Mar 2025 20:13:11 +0800 (CST)
Date: Thu, 27 Mar 2025 20:13:11 +0800 (CST)
X-Zmail-TransId: 2af967e540d7fffffffff0b-2c0fc
X-Mailer: Zmail v1.0
Message-ID: <20250327201311965LJfbvO-99xGLUTxfFzg0X@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <maarten.lankhorst@linux.intel.com>
Cc: <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
        <simona@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, <yang.yang29@zte.com.cn>,
        <xu.xin16@zte.com.cn>, <ye.xingchen@zte.com.cn>,
        <tang.dongxing@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSBkcm0vbWlwaS1kc2k6IFVzZSBkZXZpY2VfbWF0Y2hfb2Zfbm9kZSgp?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 52RCD8li042813
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67E540D8.004/4ZNjGw4BThz8RTZK

From: Tang Dongxing <tang.dongxing@zte.com.cn>

Replace the open-code with device_match_of_node().

Signed-off-by: Tang Dongxing <tang.dongxing@zte.com.cn>
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index dfa595556320..7a48f902e02c 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -312,7 +312,7 @@ struct mipi_dsi_host *of_find_mipi_dsi_host_by_node(struct device_node *node)
 	mutex_lock(&host_lock);

 	list_for_each_entry(host, &host_list, list) {
-		if (host->dev->of_node == node) {
+		if (device_match_of_node(host->dev, node)) {
 			mutex_unlock(&host_lock);
 			return host;
 		}
-- 
2.25.1
