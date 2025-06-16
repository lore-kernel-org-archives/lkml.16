Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D02F1494C2;
	Mon, 16 Jun 2025 06:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750056709; cv=none; b=OCbkgsL/BU50CEZnAi7wY5RIY0djOB1F83QO4JyVzut1iZhq1X7F9gtcFW/9Yqc5RYEMo88hzxESLh9gM00ZisUaGJV5waJMhHh9kSXcG3cVH5uhpF+Zl2e4D/Ummmp1K8i38DfQg4MO5/hUCFC1NpiNLhnlnDcm2S206vHRxlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750056709; c=relaxed/simple;
	bh=659K2a+RVej/0E/JVasPDdOXxmtJmIlt1/h05SIk5TE=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=u+Fas1vHJiz85m6OiJTNcXE7RsZhT0p4fE6m6n2H6izTaYZW9+sifg+7K7n6CKKsqlNJTnCTBt2KZsCXLBplDKvxkkC3bvTXKW3ky8lvnPDCY0tf936hjSdvD0Mfu3+hjA6ATcDCakjsrKA71Mr5rKLwvP9sGHo2NkzU2SA/Cj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mxct.zte.com.cn (unknown [192.168.251.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4bLLJT3mNdz5DN79;
	Mon, 16 Jun 2025 14:51:37 +0800 (CST)
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4bLLJD4wYKz51SW7;
	Mon, 16 Jun 2025 14:51:24 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl2.zte.com.cn with SMTP id 55G6pAJk054921;
	Mon, 16 Jun 2025 14:51:10 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid32;
	Mon, 16 Jun 2025 14:51:12 +0800 (CST)
Date: Mon, 16 Jun 2025 14:51:12 +0800 (CST)
X-Zmail-TransId: 2af9684fbee0696-177c9
X-Mailer: Zmail v1.0
Message-ID: <20250616145112048o28iY_4L8DDaySvz_ZR9Z@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <alexs@kernel.org>
Cc: <si.yanteng@linux.dev>, <dzm91@hust.edu.cn>, <corbet@lwn.net>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <yang.yang29@zte.com.cn>, <xu.xin16@zte.com.cn>,
        <yang.tao172@zte.com.cn>, <ye.xingchen@zte.com.cn>,
        <wang.yaxin@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSBEb2NzL3poX0NOOiBUcmFuc2xhdGUgdWJpZnMucnN0IHRvIFNpbXBsaWZpZWQgQ2hpbmVzZQ==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 55G6pAJk054921
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 684FBEF7.000/4bLLJT3mNdz5DN79

From: Shao Mingyin <shao.mingyin@zte.com.cn>

translate the "ubifs.rst" into Simplified Chinese.

Update to commit 5f5cae9b0e81("Documentation: ubifs: Fix
compression idiom")

Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
Signed-off-by: yang tao <yang.tao172@zte.com.cn>
---
 .../translations/zh_CN/filesystems/index.rst  |   1 +
 .../translations/zh_CN/filesystems/ubifs.rst  | 111 ++++++++++++++++++
 2 files changed, 112 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/filesystems/ubifs.rst

diff --git a/Documentation/translations/zh_CN/filesystems/index.rst b/Documentation/translations/zh_CN/filesystems/index.rst
index 9f2a8b003778..faaa0f097223 100644
--- a/Documentation/translations/zh_CN/filesystems/index.rst
+++ b/Documentation/translations/zh_CN/filesystems/index.rst
@@ -26,4 +26,5 @@ Linux Kernel中的文件系统
    virtiofs
    debugfs
    tmpfs
+   ubifs

diff --git a/Documentation/translations/zh_CN/filesystems/ubifs.rst b/Documentation/translations/zh_CN/filesystems/ubifs.rst
new file mode 100644
index 000000000000..27997777f4ea
--- /dev/null
+++ b/Documentation/translations/zh_CN/filesystems/ubifs.rst
@@ -0,0 +1,111 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/filesystems/ubifs.rst
+
+:翻译:
+
+   邵明寅 Shao Mingyin <shao.mingyin@zte.com.cn>
+
+:校译:
+
+   - 杨涛 yang tao <yang.tao172@zte.com.cn>
+
+===============
+UBI 文件系统
+===============
+
+简介
+============
+
+UBIFS 文件系统全称为 UBI 文件系统（UBI File System）。UBI 代表无序块镜像（Unsorted
+Block Images）。UBIFS 是一种闪存文件系统，这意味着它专为闪存设备设计。需要理解的是，UBIFS
+与 Linux 中任何传统文件系统（如 Ext2、XFS、JFS 等）完全不同。UBIFS 代表一类特殊的文件系统，
+它们工作在 MTD 设备而非块设备上。该类别的另一个 Linux 文件系统是 JFFS2。
+
+为更清晰说明，以下是 MTD 设备与块设备的简要比较：
+
+1. MTD 设备代表闪存设备，由较大尺寸的擦除块组成，通常约 128KiB。块设备由小块组成，通常 512
+   字节。
+2. MTD 设备支持 3 种主要操作：在擦除块内偏移位置读取、在擦除块内偏移位置写入、以及擦除整个擦除
+   块。块设备支持 2 种主要操作：读取整个块和写入整个块。
+3. 整个擦除块必须先擦除才能重写内容。块可直接重写。
+4. 擦除块在经历一定次数的擦写周期后会磨损，通常 SLC NAND 和 NOR 闪存为 100K-1G 次，MLC
+   NAND 闪存为 1K-10K 次。块设备不具备磨损特性。
+5. 擦除块可能损坏（仅限 NAND 闪存），软件需处理此问题。硬盘上的块通常不会损坏，因为硬件有坏块
+   替换机制（至少现代 LBA 硬盘如此）。
+
+这充分说明了 UBIFS 与传统文件系统的本质差异。
+
+UBIFS 工作在 UBI 层之上。UBI 是一个独立的软件层（位于 drivers/mtd/ubi），本质上是卷管理和
+磨损均衡层。它提供称为 UBI 卷的高级抽象，比 MTD 设备更上层。UBI 设备的编程模型与 MTD 设备非
+常相似，仍由大容量擦除块组成，支持读/写/擦除操作，但 UBI 设备消除了磨损和坏块限制（上述列表的第
+4 和第 5 项）。
+
+某种意义上，UBIFS 是 JFFS2 文件系统的下一代产品，但它与 JFFS2 差异巨大且不兼容。主要区别如下：
+
+* JFFS2 工作在 MTD 设备之上，UBIFS 依赖于 UBI 并工作在 UBI 卷之上。
+* JFFS2 没有介质索引，需在挂载时构建索引，这要求全介质扫描。UBIFS 在闪存介质上维护文件系统索引
+  信息，无需全介质扫描，因此挂载速度远快于 JFFS2。
+* JFFS2 是直写（write-through）文件系统，而 UBIFS 支持回写（write-back），这使得 UBIFS
+  写入速度快得多。
+
+与 JFFS2 类似，UBIFS 支持实时压缩，可将大量数据存入闪存。
+
+与 JFFS2 类似，UBIFS 能容忍异常重启和断电。它不需要类似 fsck.ext2 的工具。UBIFS 会自动重放日
+志并从崩溃中恢复，确保闪存数据结构的一致性。
+
+UBIFS 具有对数级扩展性（其使用的数据结构多为树形），因此挂载时间和内存消耗不像 JFFS2 那样线性依
+赖于闪存容量。这是因为 UBIFS 在闪存介质上维护文件系统索引。但 UBIFS 依赖于线性扩展的 UBI 层，
+因此整体 UBI/UBIFS 栈仍是线性扩展。尽管如此，UBIFS/UBI 的扩展性仍显著优于 JFFS2。
+
+UBIFS 开发者认为，未来可开发同样具备对数级扩展性的 UBI2。UBI2 将支持与 UBI 相同的 API，但二进
+制不兼容。因此 UBIFS 无需修改即可使用 UBI2。
+
+挂载选项
+=============
+
+(*) 表示默认选项。
+
+====================    =======================================================
+bulk_read               批量读取以利用闪存介质的顺序读取加速特性
+no_bulk_read (*)        禁用批量读取
+no_chk_data_crc (*)     跳过数据节点的 CRC 校验以提高读取性能。 仅在闪存
+                        介质高度可靠时使用此选项。 此选项可能导致文件内容损坏无法被
+                        察觉。
+chk_data_crc            强制校验数据节点的 CRC
+compr=none              覆盖默认压缩器，设置为"none"
+compr=lzo               覆盖默认压缩器，设置为"LZO"
+compr=zlib              覆盖默认压缩器，设置为"zlib"
+auth_key=               指定用于文件系统身份验证的密钥。
+                        使用此选项将强制启用身份验证。
+                        传入的密钥必须存在于内核密钥环中， 且类型必须是'logon'
+auth_hash_name=         用于身份验证的哈希算法。同时用于哈希计算和 HMAC
+                        生成。典型值包括"sha256"或"sha512"
+====================    =======================================================
+
+快速使用指南
+========================
+
+挂载的 UBI 卷通过 "ubiX_Y" 或 "ubiX:NAME" 语法指定，其中 "X" 是 UBI 设备编号，"Y" 是 UBI
+卷编号，"NAME" 是 UBI 卷名称。
+
+将 UBI 设备 0 的卷 0 挂载到 /mnt/ubifs::
+
+    $ mount -t ubifs ubi0_0 /mnt/ubifs
+
+将 UBI 设备 0 的 "rootfs" 卷挂载到 /mnt/ubifs（"rootfs" 是卷名）::
+
+    $ mount -t ubifs ubi0:rootfs /mnt/ubifs
+
+以下是内核启动参数的示例，用于将 mtd0 附加到 UBI 并挂载 "rootfs" 卷：
+ubi.mtd=0 root=ubi0:rootfs rootfstype=ubifs
+
+参考资料
+==========
+
+UBIFS 文档及常见问题解答/操作指南请访问 MTD 官网：
+
+- http://www.linux-mtd.infradead.org/doc/ubifs.html
+- http://www.linux-mtd.infradead.org/faq/ubifs.html
-- 
2.25.1
