Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2C8A923
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 00:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750380129; cv=none; b=WM1Vk+2tWp4cbfGesTmmFJexkwbu7FxmjLrRutBupRXbyfklXwZk+0B35nHuorfkouy0/6kB1edXbmgAQtc1oFyjmphF/2o8xd0hERL4pn8FD8kKE53uyWMA/MPR+HG6fbDqQVvSLsdnEdqlMUBfcDJT7s8cFMn+3KV3u9xM8ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750380129; c=relaxed/simple;
	bh=VAQSvPyDO1ZmPDa8nxQSlhHP3K0jM5ycwZPsDCz+TOg=;
	h=Date:Message-ID:In-Reply-To:References:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=uYh5WzgwsDFtFkqi1wslXet/N545oNiaNEF/u/PVWtoEWkDwVr/CAZUzZ9z7Jic9EApsdUVp7A/uXbKwEG0b2RiATBtQRAbY/8KpkPy0gk5CLAcfdfRvfOAOl9YEy7q31KLKs89ET5ZHUNPd5h3Iha2t9aDr7omDconbMz5hsRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4bNdw70kn4z5DXWg;
	Fri, 20 Jun 2025 08:41:59 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl2.zte.com.cn with SMTP id 55K0f4Ic094365;
	Fri, 20 Jun 2025 08:41:04 +0800 (+08)
	(envelope-from jiang.peng9@zte.com.cn)
Received: from mapi (xaxapp05[null])
	by mapi (Zmail) with MAPI id mid31;
	Fri, 20 Jun 2025 08:41:04 +0800 (CST)
Date: Fri, 20 Jun 2025 08:41:04 +0800 (CST)
X-Zmail-TransId: 2afc6854ae20ffffffffd83-7c389
X-Mailer: Zmail v1.0
Message-ID: <20250620084104786r5xoR16_AmYZMJLnno3_Q@zte.com.cn>
In-Reply-To: <0f535bed-f4d4-4565-8f21-b10070f793e8@suse.com>
References: 20250618100153468I5faNUAhCdtMA01OuuTKC@zte.com.cn,0f535bed-f4d4-4565-8f21-b10070f793e8@suse.com
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <jiang.peng9@zte.com.cn>
To: <jgross@suse.com>
Cc: <sstabellini@kernel.org>, <oleksandr_tyshchenko@epam.com>,
        <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>,
        <xu.xin16@zte.com.cn>, <yang.yang29@zte.com.cn>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCB2Ml0geGVuL3hlbmJ1czogZml4IFc9MSBidWlsZCB3YXJuaW5nIGluIHhlbmJ1c192YV9kZXZfZXJyb3IgZnVuY3Rpb24=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 55K0f4Ic094365
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6854AE57.000/4bNdw70kn4z5DXWg

From: Peng Jiang <jiang.peng9@zte.com.cn>

This patch fixes a W=1 format-string warning reported by GCC 12.3.0
by annotating xenbus_switch_fatal() and xenbus_va_dev_error()
with the __printf attribute. The attribute enables compile-time
validation of printf-style format strings in these functions.

The original warning trace:
drivers/xen/xenbus/xenbus_client.c:304:9: warning: function 'xenbus_va_dev_error' might be
a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]

Signed-off-by: Peng Jiang <jiang.peng9@zte.com.cn>
---
 drivers/xen/xenbus/xenbus_client.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/xen/xenbus/xenbus_client.c b/drivers/xen/xenbus/xenbus_client.c
index 51b3124b0d56..e73ec225d4a6 100644
--- a/drivers/xen/xenbus/xenbus_client.c
+++ b/drivers/xen/xenbus/xenbus_client.c
@@ -202,6 +202,7 @@ int xenbus_watch_pathfmt(struct xenbus_device *dev,
 }
 EXPORT_SYMBOL_GPL(xenbus_watch_pathfmt);

+__printf(4, 5)
 static void xenbus_switch_fatal(struct xenbus_device *, int, int,
                                const char *, ...);

@@ -287,6 +288,7 @@ int xenbus_frontend_closed(struct xenbus_device *dev)
 }
 EXPORT_SYMBOL_GPL(xenbus_frontend_closed);

+__printf(3, 0)
 static void xenbus_va_dev_error(struct xenbus_device *dev, int err,
                                const char *fmt, va_list ap)
 {
-- 
2.25.1
