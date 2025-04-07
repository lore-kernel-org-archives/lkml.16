Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408C5253B5D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 18:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744052242; cv=none; b=o1xTzTLcwnxejn9+kTFd87XZakveA8tMz4FbwrnlxKSrv6TaXxpnsJT0qpbilhhFzXxejaw6IqYqqAwaJ+IdPLia7e5gAp82zVRY1N9i+qnU3fGwKp3zELmA5rFxtki6ubrn9Y+h6Mqd/LR4K/lDm1MGPHmRSSCE0/z7tHHgVbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744052242; c=relaxed/simple;
	bh=NJN1GNR5FglhPaWtGVRtLSZ+9nR3k3nYEOBv/xPhWtw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ai+00G8ksbRSoKvQGoDYEX25ZMAPaVyJM3jptlb478VAZGsGAYu6jpHYBbZtfw7CjDXvjZtQ6q9H5sisZs6981hEPBMdSfEgO0SBQHTcwgN93XQDa5AgfLMMgDf7/4mhRjqYWNKYvLo9084jJcIZH1Uxl5QS0p3nhnrnffdTppo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ilAhbRuQ; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ilAhbRuQ"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 537Iurh2454879
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Apr 2025 13:56:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744052213;
	bh=1hB+Rsl8dEIP80gJg1dRpUGGywa9yjHgvJWWFP9MDZc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ilAhbRuQvUr5o5N86CHRjPzz8/cXGDJJ0lrVBSpJVYkgfA8BdUNF1Pvu3skNKv/lc
	 ceS9y8Zl5/7f00qk9/NnQ6KSuo26ZtbCFqPmzdyYuYSmG30Kz7isxhXfgkty85nW5u
	 G7Xn0UGNuXQFxjnif9VQFoyOmRv8Bz1iQ5ApA06A=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 537Iurf7025521
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 7 Apr 2025 13:56:53 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 7
 Apr 2025 13:56:53 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 7 Apr 2025 13:56:53 -0500
Received: from fllvsmtp8.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 537Iup49094348;
	Mon, 7 Apr 2025 13:56:52 -0500
From: Andrew Davis <afd@ti.com>
To: Arnd Bergmann <arnd@arndb.de>, Andre Przywara <andre.przywara@arm.com>,
        Russell King <linux@armlinux.org.uk>, Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik
	<robert.jarzmik@free.fr>,
        Alexey Charkov <alchark@gmail.com>,
        Krzysztof
 Kozlowski <krzk@kernel.org>,
        Stefano Stabellini <sstabellini@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <xen-devel@lists.xenproject.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH v5 2/5] ARM: pxa: Switch to new sys-off handler API
Date: Mon, 7 Apr 2025 13:56:47 -0500
Message-ID: <20250407185650.411887-3-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250407185650.411887-1-afd@ti.com>
References: <20250407185650.411887-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Kernel now supports chained power-off handlers. Use
register_platform_power_off() that registers a platform level power-off
handler. Legacy pm_power_off() will be removed once all drivers and archs
are converted to the new sys-off API.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 arch/arm/mach-pxa/spitz.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-pxa/spitz.c b/arch/arm/mach-pxa/spitz.c
index 33533e35720f8..c0b1f7e6be874 100644
--- a/arch/arm/mach-pxa/spitz.c
+++ b/arch/arm/mach-pxa/spitz.c
@@ -1096,7 +1096,7 @@ static void __init spitz_init(void)
 		software_node_register(&spitz_scoop_2_gpiochip_node);
 
 	init_gpio_reset(SPITZ_GPIO_ON_RESET, 1, 0);
-	pm_power_off = spitz_poweroff;
+	register_platform_power_off(spitz_poweroff);
 
 	PMCR = 0x00;
 
-- 
2.39.2

