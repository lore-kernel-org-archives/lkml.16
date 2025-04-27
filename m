Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A2563A9
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 23:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745796623; cv=none; b=QKWDxtj/qlSbnGWXlGoa+3fPU92CsNmNGG+0MMnxyQ6eChfyvD2Js1sBMY0Br8lp2X3VYBmWqo/xBlTrx/ieuI+MoK3Cbs4Hc+LCElpocfTj65YpjKR7d+12qEvx8lHbhY29+uAeFMirg2SLnXP6fG+him/DOVxjfQNuXASKATk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745796623; c=relaxed/simple;
	bh=qC0cof0TG29XLBAu2iLtkaKEqep3HGv/4gBofq79CHM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mzLKRwDP/135NR4CnRggeJX6X96wlKRPQwyz+3rWdVjlSVOksQ5/mQ8gWs34PW79qKDhIzK945EMKC3U5Ja3Ya/n8sHME0w6SnhBGjKAnipOmq5JcEklqBZU5z/FIfLxxIz4KN0Z2GTbxQrjIpbBzBOw8iYB0kGLAb8BPxZ1ht4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=PNZHyo5/; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="PNZHyo5/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=THsb5OlOsoQipkgpscGZtTDIF02P0Acq+zPTefXP8+c=; b=PNZHyo5/t0Wrku0w
	q3vksLShQjGNMEW7T06XOkWBF7dRNvdD/D1e/ze4OZqpuAyxZgcnft2rSswaJbmKaiWoeSKx2olHC
	mSmhLjC2msdmnLqBetDz15BKZmfj0NwzLFVpFsT/L/F3uf1pDoqODWdxrS/hjflWMlK7ybOBBIvWg
	o56sejfkAk3yS4bmfZ6LW1cgsC/JW6a9O7y9XsWpcuJySxlKl9WRR4LpBOGQzlU9m+kbU1c5loPj4
	OkmmBgQseiEOcUtFYcrUG2qQlzpYG8HlP5qRAPuCTLoVC6AWMOIxiHUe0/U1HoZqpMD6yCbjo3Kyj
	TSMBNv1IB/0mRiuJ/w==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1u9BRx-0001ZL-2d;
	Sun, 27 Apr 2025 23:30:17 +0000
From: linux@treblig.org
To: gregkh@linuxfoundation.org,
	dragan.cvetic@xilinx.com,
	derek.kiernan@xilinx.com
Cc: linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] MAINTAINERS: Fix XILINX SD-FEC entry
Date: Mon, 28 Apr 2025 00:30:16 +0100
Message-ID: <20250427233016.124044-1-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

The SD-FEC entry claims ownership of the generic
   drivers/misc/Kconfig   and
   drivers/misc/Makefile

in reality that driver is just one of many using those files.

Remove those file entries.

Fixes: e00feed03f8d ("MAINTAINERS: add maintainer for SD-FEC")
Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 MAINTAINERS | 2 --
 1 file changed, 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8c7d796131a8..246bc1af2be3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26491,8 +26491,6 @@ M:	Dragan Cvetic <dragan.cvetic@amd.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/misc/xlnx,sd-fec.yaml
 F:	Documentation/misc-devices/xilinx_sdfec.rst
-F:	drivers/misc/Kconfig
-F:	drivers/misc/Makefile
 F:	drivers/misc/xilinx_sdfec.c
 F:	include/uapi/misc/xilinx_sdfec.h
 
-- 
2.49.0

