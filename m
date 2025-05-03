Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net [60.248.80.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10A827BF64
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 15:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.80.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746287110; cv=none; b=QIwLxBxCtEGSejyyJMoikuQ880jKlexy1Lp+fWrLwbY9nsjvZ2gZ9v0Wh5RMbMgCNHn4upN2PRTr/rEo9//Qpx+JVccnBsBf/coPbB0LMmvTgzpA+qT0GolOb70IyE2SLQpDI1bocZEi80yC3uiXPIyto4lmz8Iqf+F+U70VEmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746287110; c=relaxed/simple;
	bh=mdpLSxuVW+TpoTqhgBq+ZS9EqcdTqEudusik049hep4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XgogHGQriIdLEaPn09sAHDFnL3uH8MSI6rSh9lwwLUaXHwSOggx67pQYLm+cl+g072kisqWFKDn4YmvOt1xbJB8k0t3ppOdSraaZD6dKDul2PGpeBUBjzWjNptgE66oEsS7vUOG6yORfWNv3UjeOG62tYf8KFzf9PoOkiB3Qhj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.80.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from Atcsqr.andestech.com (localhost [127.0.0.2] (may be forged))
	by Atcsqr.andestech.com with ESMTP id 543FJKdY088031
	for <linux-kernel@vger.kernel.org>; Sat, 3 May 2025 23:19:20 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 543FImFu087627
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 3 May 2025 23:18:48 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS31.andestech.com
 (10.0.1.89) with Microsoft SMTP Server id 14.3.498.0; Sat, 3 May 2025
 23:18:48 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To:
CC: <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <paul.walmsley@sifive.com>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <tglx@linutronix.de>, <daniel.lezcano@linaro.org>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>, <tim609@andestech.com>,
        "Ben
 Zong-You Xie" <ben717@andestech.com>
Subject: [PATCH v2 6/9] dt-bindings: cache: ax45mp-cache: allow variable cache-sets for Andes L2 cache
Date: Sat, 3 May 2025 23:18:26 +0800
Message-ID: <20250503151829.605006-7-ben717@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250503151829.605006-1-ben717@andestech.com>
References: <20250503151829.605006-1-ben717@andestech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 543FJKdY088031

The current device tree binding for the Andes AX45MP L2 cache enforces
a fixed number of cache-sets (1024). However, there are 2048 cache-sets in
the QiLai SoC. This change allows both 1024 and 2048 as valid values for
"cache-sets".

Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/cache/andestech,ax45mp-cache.yaml       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml b/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
index d2cbe49f4e15..798aa71dc4ec 100644
--- a/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
+++ b/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
@@ -44,7 +44,7 @@ properties:
     const: 2

   cache-sets:
-    const: 1024
+    enum: [1024, 2048]

   cache-size:
     enum: [131072, 262144, 524288, 1048576, 2097152]
--
2.34.1
