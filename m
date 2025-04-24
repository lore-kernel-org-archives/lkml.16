Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9781517A2EF
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 02:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745462517; cv=none; b=sR0fsPRaxDobK1BFe7/KgNArQy+0NTkp6JGIZCqoW1SWYUZ/LYGCy+gDUrSXBZHp541IGgAwkQaa2bphlXt3nbvO+pZv1E7V8dXmMoah8NTbsFcEwf+H7iU4iunsR79odoekv9gIfmScp+/6AAKRg8v7Bsju6NKnOTZCjBiqxqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745462517; c=relaxed/simple;
	bh=yrJGmNPCM0TF5kHp66SXiT7fplcjmCQr/20VcG80oU0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=T+U1azGb1zjUuOQxdUsNe3g2PgoRMae6xJMQr+yEq/xBmI+KOQrC5wPaDwCdmqcu5g59LIUqws0wRFfBTqZNKTLBoNS9x2I7Qr2MJc7g5yaLgUHe8kiUPfL3uP5965+W6/sxC67+/fHHWnReLJCXSBZgGLzeLQbpP3ZC1bx3muk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bB19p221; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bB19p221"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745462512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vv0ub1HV+zaOm/ig5nFshbIt0lM85siO57UbBlhiO8g=;
	b=bB19p221A9LUZnuwBbDzcRbTjbv5dfnA/u8QxyqAnyzm6TPN/BKnpccE8wMNY2AZowV1d2
	XfZj2jPKn0egtmIpKU8HCrnV1V4mN3mN0mJoevi46Ebsny+t3FyLKtlnLTmcKT0SlI3je+
	z32EsIx1/WisDbwPSlG0h+vso3+NECY=
From: Youling Tang <youling.tang@linux.dev>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	youling.tang@linux.dev,
	Youling Tang <tangyouling@kylinos.cn>
Subject: [PATCH v3 1/3] LoongArch: Add a default install.sh
Date: Thu, 24 Apr 2025 10:40:32 +0800
Message-Id: <20250424024034.78436-2-youling.tang@linux.dev>
In-Reply-To: <20250424024034.78436-1-youling.tang@linux.dev>
References: <20250424024034.78436-1-youling.tang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Youling Tang <tangyouling@kylinos.cn>

As specified in scripts/install.sh, the priority order is as follows
(from highest to lowest):
  ~/bin/installkernel
  /sbin/installkernel
  arch/loongarch/boot/install.sh

Fallback to default install.sh if installkernel is not found.

Signed-off-by: Youling Tang <tangyouling@kylinos.cn>
---
 arch/loongarch/boot/install.sh | 56 ++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100755 arch/loongarch/boot/install.sh

diff --git a/arch/loongarch/boot/install.sh b/arch/loongarch/boot/install.sh
new file mode 100755
index 000000000000..daac197d3315
--- /dev/null
+++ b/arch/loongarch/boot/install.sh
@@ -0,0 +1,56 @@
+#!/bin/sh
+#
+# This file is subject to the terms and conditions of the GNU General Public
+# License.  See the file "COPYING" in the main directory of this archive
+# for more details.
+#
+# Copyright (C) 1995 by Linus Torvalds
+#
+# Adapted from code in arch/i386/boot/Makefile by H. Peter Anvin
+# Adapted from code in arch/i386/boot/install.sh by Russell King
+#
+# "make install" script for the LoongArch Linux port
+#
+# Arguments:
+#   $1 - kernel version
+#   $2 - kernel image file
+#   $3 - kernel map file
+#   $4 - default install path (blank if root directory)
+
+set -e
+
+case "${2##*/}" in
+vmlinux.elf)
+  echo "Installing uncompressed vmlinux.elf kernel"
+  base=vmlinux
+  ;;
+vmlinux.efi)
+  echo "Installing uncompressed vmlinux.efi kernel"
+  base=vmlinux
+  ;;
+vmlinuz.efi)
+  echo "Installing gzip/zstd compressed vmlinuz.efi kernel"
+  base=vmlinuz
+  ;;
+*)
+ echo "Warning: Unexpected kernel type"
+ exit 1
+ ;;
+esac
+
+if [ -f $4/$base-$1 ]; then
+  mv $4/$base-$1 $4/$base-$1.old
+fi
+cat $2 > $4/$base-$1
+
+# Install system map file
+if [ -f $4/System.map-$1 ]; then
+  mv $4/System.map-$1 $4/System.map-$1.old
+fi
+cp $3 $4/System.map-$1
+
+# Install kernel config file
+if [ -f $4/config-$1 ]; then
+  mv $4/config-$1 $4/config-$1.old
+fi
+cp .config $4/config-$1
-- 
2.38.1

