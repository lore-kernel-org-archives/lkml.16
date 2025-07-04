Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF902F7D13
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 12:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751633970; cv=none; b=ZDvH7RDPAKsk4jicLwWFgnUDbDk0GQa+KyfG+5GD7Bw3vmfU5l9/jXir1stoHd2e3+lJIApxuVQnWI00f54mqDhJGdCqq8D/mq4gS6nQ7luRe6Yz/gEUP9D1pnyMpB0mOjPEspPBAXC6P6zT418b6YOvvJvmrhanuqDmHhpufJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751633970; c=relaxed/simple;
	bh=1h8MyorGorZmrxPa+MoF/jajLD8H+zTQXb/+fjjo/h4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NFYWtRcbF17S4fYuUXlUe/s+qwGj+JpRthvv6WLTHd31VnMPEb+fEHP7cqbjRJUeLgDdYJ7+UXBDgYdvTAp4+74zHu6yjj+tVqT/jogaAdc877ImpMJC7x9R+60NGLeDL3R6+qKM8ojVJ8rCuDEuanQL4399dcxEB24JnosnVl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=qgCozvAD; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="qgCozvAD"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 564CxHmW001119;
	Fri, 4 Jul 2025 07:59:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751633957;
	bh=OTFhsNb2uIQEAT5Fxr50Xmp5L4mU2/xP+vH48JsWZXE=;
	h=From:To:CC:Subject:Date;
	b=qgCozvADJQW8tmDxjrY9/f89B8jLBuJDECTnBVDJpbxbi0IXkUdTEifJ5tvCBXDyX
	 8ma4FQWgpm9JaEg0GvvS4EznrvrVlBHEuuruzuIwN27KK0BAn03sH4VKEfafcBFAC2
	 Ro2M5YNhMCtxiqxFXz9ZN1L3Tkx1yaZCPmsegcNA=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 564CxGRv3404556
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 4 Jul 2025 07:59:16 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 4
 Jul 2025 07:59:16 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 4 Jul 2025 07:59:16 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 564CxFxW2774102;
	Fri, 4 Jul 2025 07:59:16 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <vkoul@kernel.org>, <kishon@kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC: <aradhya.bhatia@linux.dev>, <s-jain1@ti.com>, <r-donadkar@ti.com>,
        <tomi.valkeinen@ideasonboard.com>, <j-choudhary@ti.com>,
        <a0512644@ti.com>, <devarsht@ti.com>
Subject: [PATCH v4 0/2] Fix PLL lock timeout and calibration wait time
Date: Fri, 4 Jul 2025 18:29:13 +0530
Message-ID: <20250704125915.1224738-1-devarsht@ti.com>
X-Mailer: git-send-email 2.39.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

This fixes PLL lockup and O_CMN_READY timeout by moving the polling
function after common state machine gets enabled. Also fix the
calibration wait time to optimize the polling time.

NOTE: This needs to be applied on top of  
  https://lore.kernel.org/all/20250618-cdns-dsi-impro-v4-4-862c841dbe02@ideasonboard.com/           
  https://lore.kernel.org/all/20250618-cdns-dsi-impro-v4-5-862c841dbe02@ideasonboard.com/           
  from the series:                                                                                  
  https://lore.kernel.org/all/20250618-cdns-dsi-impro-v4-0-862c841dbe02@ideasonboard.com/    

Changelog:
V4:                                                                                                 
- Optimize wait_for_pll_lock, wait_for_cmn_ready calls to oneline                                   
  using conditional operator                                                                        
- Remove superflous init for ret variable in cdns_dphy_configure                                    
- Enable pll and psm ref clocks before configuring PLL                                              
- Update commit message to refer to TRM                                                             
- Rebased on top of:                                                                                
  https://lore.kernel.org/all/20250618-cdns-dsi-impro-v4-4-862c841dbe02@ideasonboard.com/           
  https://lore.kernel.org/all/20250618-cdns-dsi-impro-v4-5-862c841dbe02@ideasonboard.com/           
  from the series:                                                                                  
  https://lore.kernel.org/all/20250618-cdns-dsi-impro-v4-0-862c841dbe02@ideasonboard.com/    

V3: 
-   Use read-modify-write for using calibrated value for PLL
    lock time
-   Move out PLL clock configuration part to power_on function

V2: Separate patch for calibration logic and
    return error code on polling 

Previous versions:
V3: https://lore.kernel.org/all/20250502033451.2291330-1-devarsht@ti.com/
V2: https://lore.kernel.org/all/20250326152320.3835249-1-devarsht@ti.com/
V1: https://lore.kernel.org/all/20241230125319.941372-1-devarsht@ti.com/

Test logs:
Link: https://gist.github.com/devarsht/d08d851399ca327e5594266a8d66d478

Rangediff:
V3->V4:
https://gist.github.com/devarsht/e4db52e1f4aec2d45596b3ed019e92ef

V2->V3:
https://gist.github.com/devarsht/c4d2c4f6715ec7aa4df4cb2c7991b7aa

Devarsh Thakkar (2):
  phy: cadence: cdns-dphy: Fix PLL lock and O_CMN_READY polling
  phy: cadence: cdns-dphy: Update calibration wait time for startup
    state machine

 drivers/phy/cadence/cdns-dphy.c | 126 ++++++++++++++++++++++++--------
 1 file changed, 94 insertions(+), 32 deletions(-)

-- 
2.39.1

