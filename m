Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAFE9476;
	Fri, 30 May 2025 03:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.62.165.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748576003; cv=none; b=X1SqysN6N3WHJkoLSlt/sIRgxHr7gTDcPNFpFF3h0OZdCVpgHrGvfs7iEOyb8q+4UDWJypljUtRlJ+trkYoxQr9eu8mU1JkeYPFXyOfHihwFSo0X+Qrd44KK2W71yLShZCQNCPZCcixgUQybmlzXL2kKhKToNdHQYF+S+TtBrfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748576003; c=relaxed/simple;
	bh=u6e0uOaf3Y/stcdMY4NHHB4HKOrwMRgkaabVzuwtDEE=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=txRtqaMWKo5VINUoUqZmcjDK+Azp07zWgFyazoMenp0wzG/+kUQ/dFT9sbYwA65VtQOcjZlWPNQn+z0ElCFe8YLMs5+phMiaGBKLDjtemSV4nhdbVO5Ujr1vKFQnrAYAEIkyUaxPXlpr+BOngycJqw1bVWf2wxTnC9oVHWQntK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=183.62.165.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4b7pjD0gyTz51STV;
	Fri, 30 May 2025 11:33:04 +0800 (CST)
Received: from njy2app01.zte.com.cn ([10.40.12.136])
	by mse-fl2.zte.com.cn with SMTP id 54U3WlYY090769;
	Fri, 30 May 2025 11:32:47 +0800 (+08)
	(envelope-from jiang.kun2@zte.com.cn)
Received: from mapi (njb2app07[null])
	by mapi (Zmail) with MAPI id mid204;
	Fri, 30 May 2025 11:32:49 +0800 (CST)
Date: Fri, 30 May 2025 11:32:49 +0800 (CST)
X-Zmail-TransId: 2aff683926e1ffffffffdcd-b6b37
X-Mailer: Zmail v1.0
Message-ID: <202505301132492152dM75edlCkVrcPL71Omc5@zte.com.cn>
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
Subject: =?UTF-8?B?W1BBVENIIGxpbnV4IG5leHRdIERvY3MvemhfQ046IFRyYW5zbGF0ZSB2eGxhbi5yc3QgdG8gU2ltcGxpZmllZCBDaGluZXNl?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 54U3WlYY090769
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 683926F0.000/4b7pjD0gyTz51STV

From: Qiu Yutan <qiu.yutan@zte.com.cn>

translate the "vxlan.rst" into Simplified Chinese

Update to commit 33a1aaf82bcf("docs: vxlan: add info
about device features")

Signed-off-by: Qiu Yutan <qiu.yutan@zte.com.cn>
Signed-off-by: Fan Yu <fan.yu9@zte.com.cn>
Signed-off-by: Jiang Kun <jiang.kun2@zte.com.cn>
Signed-off-by: xu xin <xu.xin16@zte.com.cn>
---
 .../translations/zh_CN/networking/index.rst   |  2 +-
 .../translations/zh_CN/networking/vxlan.rst   | 85 +++++++++++++++++++
 2 files changed, 86 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/networking/vxlan.rst

diff --git a/Documentation/translations/zh_CN/networking/index.rst b/Documentation/translations/zh_CN/networking/index.rst
index d07dd69f980b..ed62950c6a1b 100644
--- a/Documentation/translations/zh_CN/networking/index.rst
+++ b/Documentation/translations/zh_CN/networking/index.rst
@@ -21,6 +21,7 @@
    :maxdepth: 1

    msg_zerocopy
+   vxlan.rst

 Todolist:

@@ -142,7 +143,6 @@ Todolist:
 *   tuntap
 *   udplite
 *   vrf
-*   vxlan
 *   x25
 *   x25-iface
 *   xfrm_device
diff --git a/Documentation/translations/zh_CN/networking/vxlan.rst b/Documentation/translations/zh_CN/networking/vxlan.rst
new file mode 100644
index 000000000000..b1a67d2e7b8e
--- /dev/null
+++ b/Documentation/translations/zh_CN/networking/vxlan.rst
@@ -0,0 +1,85 @@
+.. SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/networking/vxlan.rst
+
+:翻译:
+
+ 范雨 Fan Yu <fan.yu9@zte.com.cn>
+
+:校译:
+
+ - 邱禹潭 Qiu Yutan <qiu.yutan@zte.com.cn>
+ - 徐鑫 xu xin <xu.xin16@zte.com.cn>
+
+==========================
+虚拟扩展本地局域网协议文档
+==========================
+
+VXLAN 协议是一种隧道协议，旨在解决 IEEE 802.1q 中 VLAN ID（4096）有限的问题。
+VXLAN 将标识符的大小扩展到 24 位（16777216）。
+
+VXLAN 在 IETF RFC 7348 中进行了描述，并已由多家供应商设计实现。
+该协议通过 UDP 协议运行，并使用特定目的端口。
+本文档介绍了 Linux 内核隧道设备，Openvswitch 也有单独的 VXLAN 实现。
+
+与大多数隧道不同，VXLAN 是 1 对 N 的网络，而不仅仅是点对点网络。
+VXLAN 设备可以通过类似于学习桥接器的方式动态学习另一端点的 IP 地址，也可以利用静态配置的转发条目。
+
+VXLAN 的管理方式与它的两个近邻 GRE 和 VLAN 相似。
+配置 VXLAN 需要 iproute2 的版本与 VXLAN 首次向上游合并的内核版本相匹配。
+
+1. 创建 vxlan 设备::
+
+	# ip link add vxlan0 type vxlan id 42 group 239.1.1.1 dev eth1 dstport 4789
+
+这将创建一个名为 vxlan0 的网络设备，该设备通过 eth1 使用组播组 239.1.1.1 处理转发表中没有条目的流量。
+目标端口号设置为 IANA 分配的值 4789，VXLAN 的 Linux 实现早于 IANA 选择标准目的端口号的时间。
+因此默认使用 Linux 选择的值，以保持向后兼容性。
+
+2. 删除 vxlan 设备::
+
+	# ip link delete vxlan0
+
+3. 查看 vxlan 设备信息::
+
+	# ip -d link show vxlan0
+
+使用新的 bridge 命令可以创建、销毁和显示 vxlan 转发表。
+
+1. 创建vxlan转发表项::
+
+	# bridge fdb add to 00:17:42:8a:b4:05 dst 192.19.0.2 dev vxlan0
+
+2. 删除vxlan转发表项::
+
+	# bridge fdb delete 00:17:42:8a:b4:05 dev vxlan0
+
+3. 显示vxlan转发表项::
+
+	# bridge fdb show dev vxlan0
+
+以下网络接口控制器特性可能表明对 UDP 隧道相关的卸载支持（最常见的是 VXLAN 功能，
+但是对特定封装协议的支持取决于网络接口控制器）：
+
+ - `tx-udp_tnl-segmentation`
+ - `tx-udp_tnl-csum-segmentation`
+    对 UDP 封装帧执行 TCP 分段卸载的能力
+
+ - `rx-udp_tunnel-port-offload`
+    在接收端解析 UDP 封装帧，使网络接口控制器能够执行协议感知卸载，
+    例如内部帧的校验和验证卸载（只有不带协议感知卸载的网络接口控制器才需要）
+
+对于支持 `rx-udp_tunnel-port-offload` 的设备，可使用 `ethtool` 查询当前卸载端口的列表::
+
+  $ ethtool --show-tunnels eth0
+  Tunnel information for eth0:
+    UDP port table 0:
+      Size: 4
+      Types: vxlan
+      No entries
+    UDP port table 1:
+      Size: 4
+      Types: geneve, vxlan-gpe
+      Entries (1):
+          port 1230, vxlan-gpe
-- 
2.27.0
