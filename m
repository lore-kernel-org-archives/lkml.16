Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE8119E966
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 03:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746156923; cv=none; b=RwEzdGPiZdift9rM0qh+WhiKqujENrI6lOTKkHP1N/GWMRB4J0R+BXu4PnaQ7TgPdtdn/aY/uD8Yn+ADjRYRPjKYHFW3AGVO3D8PRXzs7g02ZlvITcJUG3w6Lb7/xvJhgcjPKM+vG3OTk7iDfWft3hB38btfCkWIhxkcGKRXPe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746156923; c=relaxed/simple;
	bh=vmG+NjS+tpsXR9+FOuX2nGieQ3Ijm5vZx61sNRKujO0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eJDa3GObo+cdjlXHbgkvjtxSLqAEbddyWieaRO8AQpOWPpwG0wvDY5QwfirOv2XTIzsTCXPtcze3R4B3hrs8rFfOwloaeqkQ3ZexNHVLvZ172dekaJqAXMcDdUh6OYi83teyp5bYkZsOPBf82EYkbnUJL5r8pt+rJHm9Afq/xX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=i6tejciX; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="i6tejciX"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5423YqIx3771314
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 1 May 2025 22:34:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746156892;
	bh=STUdQap4y8tgoFM3cNAwbUcM59IYzDLqAztvXy35Y+M=;
	h=From:To:CC:Subject:Date;
	b=i6tejciX4Wf+rtwhzhRU24neDZ8bPjb3tNvKdmuP2c18jHT8rNUfwNk/ItIdkdVKU
	 MFZ2Z92iK1yhjOFYTbU6CvKjz47diYNrAPl56phoqdGWdLxgrO97STBe6P9n2k+qbs
	 V8MjxWXS+9oqmXqyXpq7m3q5ZNZ/N9tigfCXoJt8=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5423YqiB002926
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 1 May 2025 22:34:52 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 1
 May 2025 22:34:52 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 1 May 2025 22:34:52 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5423Yplp018090;
	Thu, 1 May 2025 22:34:52 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <vkoul@kernel.org>, <kishon@kernel.org>, <mripard@kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <sakari.ailus@linux.intel.com>, <u.kleine-koenig@baylibre.com>,
        <vigneshr@ti.com>, <aradhya.bhatia@linux.dev>, <s-jain1@ti.com>,
        <r-donadkar@ti.com>, <tomi.valkeinen@ideasonboard.com>,
        <devarsht@ti.com>
Subject: [PATCH v3 0/2] Fix PLL lock timeout and calibration wait time
Date: Fri, 2 May 2025 09:04:49 +0530
Message-ID: <20250502033451.2291330-1-devarsht@ti.com>
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

Changelog:
V3: 
-   Use read-modify-write for using calibrated value for PLL
    lock time
-   Move out PLL clock configuration part to power_on function

V2: Separate patch for calibration logic and
    return error code on polling 

Previous versions:
V2: https://lore.kernel.org/all/20250326152320.3835249-1-devarsht@ti.com/
V1: https://lore.kernel.org/all/20241230125319.941372-1-devarsht@ti.com/

Test logs:
Link: https://gist.github.com/devarsht/89e4830e886774fcd50aa6e29cce3a79

Rangediff:
V2->V3:
https://gist.github.com/devarsht/c4d2c4f6715ec7aa4df4cb2c7991b7aa

Devarsh Thakkar (2):
  phy: cadence: cdns-dphy: Fix PLL lock and O_CMN_READY polling
  phy: cadence: cdns-dphy: Update calibration wait time for startup
    state machine

 drivers/phy/cadence/cdns-dphy.c | 111 +++++++++++++++++++++++++-------
 1 file changed, 87 insertions(+), 24 deletions(-)

-- 
2.39.1

