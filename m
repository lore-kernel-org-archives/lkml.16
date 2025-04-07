Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net [60.248.80.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CC823E25F
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 11:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.80.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744024418; cv=none; b=HYcgZfEoB79CV4Hfeaa0CSecDns2mSZIuNeQC5z+rndK3hUaqum0H7L9svbIx8hlR7qtouPwZrz3g9437hm6hd5cf6H1umhnuYQgoiwuwJxH37kCrmFz/7lICycXO4OIu6QgXM0/bXE7qsyFto9ANXcAPML94N6hm96HQFEt4Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744024418; c=relaxed/simple;
	bh=Tpg8PEgvSnro+K2cdpYhdiH19YVGDpcGdLMRJnHUBkQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LSVLdbuB/wFgEaJ+os1rPUhC+023GWiCA2OUrSLIu33y12zraqmPCrlagfrwyC9rSIKvGuUFPaDnM2UFTnRJM4ZzDAJjr0TT9RHHkINYIIjGIguqKPEuwEjBSO2GfoJJ9tfTrkFCjXpcv2IWBDQLitMbwnu4WAfQ3qsSXrPOy/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.80.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from Atcsqr.andestech.com (localhost [127.0.0.2] (may be forged))
	by Atcsqr.andestech.com with ESMTP id 537AoKFx002145
	for <linux-kernel@vger.kernel.org>; Mon, 7 Apr 2025 18:50:20 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 537AnmL2001639
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Apr 2025 18:49:48 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS31.andestech.com
 (10.0.1.89) with Microsoft SMTP Server id 14.3.498.0; Mon, 7 Apr 2025
 18:49:48 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <tglx@linutronix.de>,
        <daniel.lezcano@linaro.org>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <tim609@andestech.com>, "Ben
 Zong-You Xie" <ben717@andestech.com>
Subject: [PATCH 6/9] dt-bindings: cache: ax45mp-cache: allow variable cache-sets for Andes L2 cache
Date: Mon, 7 Apr 2025 18:49:34 +0800
Message-ID: <20250407104937.315783-7-ben717@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250407104937.315783-1-ben717@andestech.com>
References: <20250407104937.315783-1-ben717@andestech.com>
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
X-MAIL:Atcsqr.andestech.com 537AoKFx002145

The current device tree binding for the Andes AX45MP L2 cache enforces
a fixed number of cache-sets (1024). However, there are 2048 cache-sets in
the QiLai SoC. This change allows both 1024 and 2048 as valid values for
"cache-sets".

Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
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

