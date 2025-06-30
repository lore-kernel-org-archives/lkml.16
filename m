Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D07923E34D;
	Mon, 30 Jun 2025 10:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751281005; cv=none; b=jyrE/fiM3JR4r788nKfZNT5MBUW1RUdW/2Wy5IsyCQroFgD1D/JZapnzgPEC9TmF7B/ZA/ouL8PUXmQV5TZ5ME+TeanXhEPZYe3k8sXDUTiNqOIvyo3zNqnKUeg8gcVuQqPQ0nOhoZR9ZYKbrxUBARSNlXvh4PfrfXfr0awXaPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751281005; c=relaxed/simple;
	bh=2aecDWoj7rxVTizGkUEIiXj76Ti0ZfTcY1V1cAjM+cs=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=tuWCr5Tl1kmeSbOla7o7sziHtKAh874hNZidveDaRzdVBNBXR7DpNM6UNWHEJ07BNaqNPcSMgdkvxLY3HSPfnwCTazvnOUz4DNoGeFddFKlxKtfeQCTJVCgpESfvvUt+YGiD13Q+Fb6xUB0p92k30nOJFCVQ4ZpV4l7DU/RyqPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4bW34m0f29z5F2lr;
	Mon, 30 Jun 2025 18:56:40 +0800 (CST)
Received: from njy2app08.zte.com.cn ([10.40.13.206])
	by mse-fl1.zte.com.cn with SMTP id 55UAuR9h024743;
	Mon, 30 Jun 2025 18:56:27 +0800 (+08)
	(envelope-from jiang.kun2@zte.com.cn)
Received: from mapi (njy2app08[null])
	by mapi (Zmail) with MAPI id mid204;
	Mon, 30 Jun 2025 18:56:30 +0800 (CST)
Date: Mon, 30 Jun 2025 18:56:30 +0800 (CST)
X-Zmail-TransId: 2b0068626d5effffffffc1d-351f2
X-Mailer: Zmail v1.0
Message-ID: <20250630185630910BT_3WfN1DPPZ5M1L2duP0@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <jiang.kun2@zte.com.cn>
To: <alexs@kernel.org>, <si.yanteng@linux.dev>, <dzm91@hust.edu.cn>,
        <corbet@lwn.net>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Cc: <xu.xin16@zte.com.cn>, <yang.yang29@zte.com.cn>, <fan.yu9@zte.com.cn>,
        <qiu.yutan@zte.com.cn>, <wang.yaxin@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIHYzXSBEb2NzL3poX0NOOiBUcmFuc2xhdGUgYWxpYXMucnN0IHRvIFNpbXBsaWZpZWQgQ2hpbmVzZQ==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 55UAuR9h024743
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 68626D68.000/4bW34m0f29z5F2lr

From: Qiu Yutan <qiu.yutan@zte.com.cn>

translate the "alias.rst" into Simplified Chinese

Update to commit 735dadf894f0("docs: networking:
Convert alias.txt to rst")

Signed-off-by: Qiu Yutan <qiu.yutan@zte.com.cn>
Signed-off-by: Jiang Kun <jiang.kun2@zte.com.cn>
Reviewed-by: Yanteng Si <siyanteng@cqsoftware.com.cn>
---
v2->v3
1. Add reviewer tag.

 .../translations/zh_CN/networking/alias.rst   | 56 +++++++++++++++++++
 .../translations/zh_CN/networking/index.rst   |  2 +-
 2 files changed, 57 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/networking/alias.rst

diff --git a/Documentation/translations/zh_CN/networking/alias.rst b/Documentation/translations/zh_CN/networking/alias.rst
new file mode 100644
index 000000000000..d94fc38a3d2e
--- /dev/null
+++ b/Documentation/translations/zh_CN/networking/alias.rst
@@ -0,0 +1,56 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/networking/alias.rst
+
+:翻译:
+
+ 邱禹潭 Qiu Yutan <qiu.yutan@zte.com.cn>
+
+:校译:
+
+======
+IP别名
+======
+
+IP别名是管理每个接口存在多个IP地址/子网掩码的一种过时方法。
+虽然更新的工具如iproute2支持每个接口多个地址/前缀，
+但为了向后兼容性，别名仍被支持。
+
+别名通过在使用 ifconfig 时在接口名后添加冒号和一个字符串来创建。
+这个字符串通常是数字，但并非必须。
+
+
+别名创建
+========
+
+别名的创建是通过“特殊的”接口命名机制完成的：例如，
+要为eth0创建一个 200.1.1.1 的别名...
+::
+
+  # ifconfig eth0:0 200.1.1.1  等等
+	~~ -> 请求为eth0创建别名#0（如果尚不存在）
+
+该命令也会设置相应的路由表项。请注意：路由表项始终指向基础接口。
+
+
+别名删除
+========
+
+通过关闭别名即可将其删除::
+
+  # ifconfig eth0:0 down
+	~~~~~~~~~~ -> 将删除别名
+
+
+别名（重新）配置
+================
+
+别名不是真实的设备，但程序应该能够正常配置和引用它们（ifconfig、route等）。
+
+
+与主设备的关系
+==============
+
+如果基础设备被关闭，则其上添加的所有别名也将被删除。
diff --git a/Documentation/translations/zh_CN/networking/index.rst b/Documentation/translations/zh_CN/networking/index.rst
index d07dd69f980b..e0073087735f 100644
--- a/Documentation/translations/zh_CN/networking/index.rst
+++ b/Documentation/translations/zh_CN/networking/index.rst
@@ -21,6 +21,7 @@
    :maxdepth: 1

    msg_zerocopy
+   alias

 Todolist:

@@ -45,7 +46,6 @@ Todolist:
 *   page_pool
 *   phy
 *   sfp-phylink
-*   alias
 *   bridge
 *   snmp_counter
 *   checksum-offloads
-- 
2.27.0
