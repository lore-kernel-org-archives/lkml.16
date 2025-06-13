Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C551F16B;
	Fri, 13 Jun 2025 03:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749786148; cv=none; b=qha9KfeeuxB8I1xD29Z6LgDRRyExaYsigqBEFG2nu8H91xXJoajAd02I1TEpCeP1OjPMQVlQvoVS2vGVNfmdf7i/g2kw9+jNxf3Kcv9L6PWRJEk7JfQkExJgLyO3SsWRD6H2B9v1FkleRpjicqtXNMQCn5e2HTytDjDa23ov6Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749786148; c=relaxed/simple;
	bh=uN3poExD9aoddJwJu3j7FRjWcqXmaGlqiFzjd2VxEQM=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=WWGyL7K/WraqkauKgaRJv5sl2CnjqooUR+A6DBbFiITiDrY1JWpzLdeQmUCICQQdM0WaFY/3nG7YWVQvRhSuT7LViBZCjltCt/r5HtbcxmZ3lv3DuqvCMGYs70/aD7WF8NhwfKjC+PmVG3QQuF2ZMQsJNVbvrGQpOa7b3StNUK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4bJQFN1rYJz8R044;
	Fri, 13 Jun 2025 11:42:16 +0800 (CST)
Received: from njb2app06.zte.com.cn ([10.55.23.119])
	by mse-fl2.zte.com.cn with SMTP id 55D3gAYv096848;
	Fri, 13 Jun 2025 11:42:10 +0800 (+08)
	(envelope-from jiang.kun2@zte.com.cn)
Received: from mapi (njy2app03[null])
	by mapi (Zmail) with MAPI id mid204;
	Fri, 13 Jun 2025 11:42:11 +0800 (CST)
Date: Fri, 13 Jun 2025 11:42:11 +0800 (CST)
X-Zmail-TransId: 2afb684b9e13143-dd3cc
X-Mailer: Zmail v1.0
Message-ID: <20250613114211728AwwnXMz8tICEzliAEt0t8@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <jiang.kun2@zte.com.cn>
To: <alexs@kernel.org>, <si.yanteng@linux.dev>, <corbet@lwn.net>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Cc: <xu.xin16@zte.com.cn>, <yang.yang29@zte.com.cn>, <wang.yaxin@zte.com.cn>,
        <fan.yu9@zte.com.cn>, <he.peilin@zte.com.cn>, <tu.qiang35@zte.com.cn>,
        <qiu.yutan@zte.com.cn>, <zhang.yunkai@zte.com.cn>,
        <ye.xingchen@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIwqBsaW51eCBuZXh0IDEvM10gRG9jcy96aF9DTjogVHJhbnNsYXRlIG5ldGlmLW1zZy5yc3QKIHRvIFNpbXBsaWZpZWQgQ2hpbmVzZQ==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 55D3gAYv096848
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 684B9E18.000/4bJQFN1rYJz8R044

From: Wang Yaxin <wang.yaxin@zte.com.cn>

translate the "netif-msg.rst" into Simplified Chinese.

Update to commit c4d5dff60f0a("docs: networking: convert
 netif-msg.txt to ReST")

Signed-off-by: Wang Yaxin <wang.yaxin@zte.com.cn>
Signed-off-by: Jiang Kun <jiang.kun2@zte.com.cn>
---
 .../translations/zh_CN/networking/index.rst   |  2 +-
 .../zh_CN/networking/netif-msg.rst            | 93 +++++++++++++++++++
 2 files changed, 94 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/networking/netif-msg.rst

diff --git a/Documentation/translations/zh_CN/networking/index.rst b/Documentation/translations/zh_CN/networking/index.rst
index 07a3933afe92..4dd75ec27dec 100644
--- a/Documentation/translations/zh_CN/networking/index.rst
+++ b/Documentation/translations/zh_CN/networking/index.rst
@@ -22,6 +22,7 @@

    msg_zerocopy
    napi.rst
+   netif-msg

 Todolist:

@@ -100,7 +101,6 @@ Todolist:
 *   netdev-features
 *   netdevices
 *   netfilter-sysctl
-*   netif-msg
 *   netmem
 *   nexthop-group-resilient
 *   nf_conntrack-sysctl
diff --git a/Documentation/translations/zh_CN/networking/netif-msg.rst b/Documentation/translations/zh_CN/networking/netif-msg.rst
new file mode 100644
index 000000000000..4810a3f8fc7c
--- /dev/null
+++ b/Documentation/translations/zh_CN/networking/netif-msg.rst
@@ -0,0 +1,93 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/networking/netif-msg.rst
+
+:翻译:
+
+   王亚鑫 Wang Yaxin <wang.yaxin@zte.com.cn>
+
+================
+网络接口消息级别
+================
+
+网络接口消息级别设置的设计方案。
+
+历史背景
+--------
+
+调试消息接口的设计遵循并受制于向后兼容性及历史实践。理解其发展历史有助于把握
+当前实践，并将其与旧版驱动代码相关联。
+
+自Linux诞生之初，每个网络设备驱动均包含一个本地整型变量以控制调试消息级别。
+消息级别范围为0至7，数值越大表示输出越详细。
+
+消息级别的定义在3级之后未明确细化，但实际实现通常与指定级别相差±1。驱动程序
+成熟后，冗余的详细级别消息常被移除。
+
+  - 0  最简消息，仅显示致命错误的关键信息。
+  - 1  标准消息，初始化状态。无运行时消息。
+  - 2  特殊介质选择消息，通常由定时器驱动。
+  - 3  接口开启和停止消息，包括正常状态信息。
+  - 4  Tx/Rx帧错误消息及异常驱动操作。
+  - 5  Tx数据包队列信息、中断事件。
+  - 6  每个完成的Tx数据包和接收的Rx数据包状态。
+  - 7  Tx/Rx数据包初始内容。
+
+最初，该消息级别变量在各驱动中具有唯一名称（如"lance_debug"），便于通过
+内核符号调试器定位和修改其设置。模块化内核出现后，变量统一重命名为"debug"，
+并作为模块参数设置。
+
+这种方法效果良好。然而，人们始终对附加功能存在需求。多年来，以下功能逐渐
+成为合理且易于实现的增强方案：
+
+  - 通过ioctl()调用修改消息级别。
+  - 按接口而非驱动设置消息级别。
+  - 对发出的消息类型进行更具选择性的控制。
+
+netif_msg 建议添加了这些功能，仅带来了轻微的复杂性增加和代码规模增长。
+
+推荐方案如下：
+
+  - 保留驱动级整型变量"debug"作为模块参数，默认值为'1'。
+
+  - 添加一个名为 "msg_enable" 的接口私有变量。该变量是位图而非级别，
+    并按如下方式初始化::
+
+       1 << debug
+
+     或更精确地说::
+
+	debug < 0 ? 0 : 1 << min(sizeof(int)-1, debug)
+
+    消息应从以下形式更改::
+
+      if (debug > 1)
+	   printk(MSG_DEBUG "%s: ...
+
+    改为::
+
+      if (np->msg_enable & NETIF_MSG_LINK)
+	   printk(MSG_DEBUG "%s: ...
+
+消息级别命名对应关系
+
+
+  =========   ===================	============
+  旧级别       名称			            位位置
+  =========   ===================	============
+    0         NETIF_MSG_DRV		0x0001
+    1         NETIF_MSG_PROBE		0x0002
+    2         NETIF_MSG_LINK		0x0004
+    2         NETIF_MSG_TIMER		0x0004
+    3         NETIF_MSG_IFDOWN		0x0008
+    3         NETIF_MSG_IFUP		0x0008
+    4         NETIF_MSG_RX_ERR		0x0010
+    4         NETIF_MSG_TX_ERR		0x0010
+    5         NETIF_MSG_TX_QUEUED	0x0020
+    5         NETIF_MSG_INTR		0x0020
+    6         NETIF_MSG_TX_DONE		0x0040
+    6         NETIF_MSG_RX_STATUS	0x0040
+    7         NETIF_MSG_PKTDATA		0x0080
+  =========   ===================	============
-- 
2.25.1
