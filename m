Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593981FFC7B;
	Fri, 27 Jun 2025 06:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.62.165.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751005951; cv=none; b=Cv44DclGZDwTPXQWcMLky0fEMkfSWz3weR/VJ0zS32Y45h8PpaUYW7u2mg49feYrtLrSJr6sFHF1KnOeghIiVTsZP/envn+Ew4jIbm25SJi82Hin4R+0HvGFkFseQqT97Oy/vupWGCLrYhc71LPIsab7TniKow3n6aWl9MVY3p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751005951; c=relaxed/simple;
	bh=S0DpVHUSYfdcpM429tdX/SLVTy73izAoV6lP6F1SdVc=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=JFBLzJrZ2VkPCVNFnFMvoxW7zz5RFPI67SSm3rBYlYdG1Qi1HmcB8yk4khlca7VIuQx63iWR7E8UCejTowvoDfyNyASG3xRFmMVMAIKzwRmb1rGaa1PgMnC5GYdm5aldOaKO+SuJ8FKSDMre/VhNKIfzf6BKW3CRuo5DVhfJqno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=183.62.165.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4bT5M56hNsz51SsL;
	Fri, 27 Jun 2025 14:32:17 +0800 (CST)
Received: from njy2app01.zte.com.cn ([10.40.12.136])
	by mse-fl2.zte.com.cn with SMTP id 55R6WAsx012024;
	Fri, 27 Jun 2025 14:32:10 +0800 (+08)
	(envelope-from jiang.kun2@zte.com.cn)
Received: from mapi (njy2app04[null])
	by mapi (Zmail) with MAPI id mid204;
	Fri, 27 Jun 2025 14:32:12 +0800 (CST)
Date: Fri, 27 Jun 2025 14:32:12 +0800 (CST)
X-Zmail-TransId: 2afc685e3aecffffffff89a-585f9
X-Mailer: Zmail v1.0
Message-ID: <20250627143212435mZ2WRnqC77Y-XxvFKrGsy@zte.com.cn>
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
Subject: =?UTF-8?B?W1BBVENIIHYyXSBEb2NzL3poX0NOOiBUcmFuc2xhdGUgYWxpYXMucnN0IHRvIFNpbXBsaWZpZWQgQ2hpbmVzZQ==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 55R6WAsx012024
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 685E3AF1.001/4bT5M56hNsz51SsL

From: Qiu Yutan <qiu.yutan@zte.com.cn>

translate the "alias.rst" into Simplified Chinese

Update to commit 735dadf894f0("docs: networking:
Convert alias.txt to rst")

Signed-off-by: Qiu Yutan <qiu.yutan@zte.com.cn>
Signed-off-by: Jiang Kun <jiang.kun2@zte.com.cn>
---
v1->v2
https://lore.kernel.org/all/20250624165039911FXwVWbH9TM62kBeLnxzXg@zte.com.cn/
1. Trim the redundant “=”

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
