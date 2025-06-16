Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A03D136A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 06:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750056448; cv=none; b=DMNdBBstwuRLjlIq/8mTijTifMy0d8TxRSV3dIk1SFrb5GrrfHosy1WhmHCRuhLjch4fmITyUanPyYi/Vb/dXuT5/r/402v3ZQwbFTZgQyJqM9cojps4f5ujT5Za5Ql/4Ykvg7z9bIru8oiYpU3n7RgpJds6bUp+FhXztd9p1V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750056448; c=relaxed/simple;
	bh=DAR6+FGmg7uqVOJeLWd2OVt9OazzPqedOTfur1hxpAM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bUxPuW3gAg9ASecwwKdn1SeF6h6oWeDLSr4nwtvpTwI9411rdN4ikJfHHHN6OoZgaaWaHrqAJjRDC15kENmK2HvAP89cx/fpmjKj8clT6I7Et2zkh84yQLcOnVYOLm+rkUUmTSuU61XHeiGkUKrmAx/so09eTNFJgasM0UblFkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=LjsXAM9v; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="LjsXAM9v"
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55G6lAgF2522816;
	Mon, 16 Jun 2025 01:47:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750056430;
	bh=5i3+6MceKfZkPIPthlqzU0kOos8h6d0+eZ5gSTwLJu4=;
	h=From:To:CC:Subject:Date;
	b=LjsXAM9vGoHAH5U3UMNoEJQbQXqFe4sixwMcEc4feP7dtV+zEnxi3+OQJdLrKLUID
	 wMgZIoxBXxmuey2m5wJT2vjkMzDoWblWKx7UKx5smsNYDQXswM31vgoXGyrRfzlWfg
	 vFMTdQfRk3kzFMCE8uMTsSHyB4DPZQP3WbUrwKQQ=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55G6lAwt570542
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 16 Jun 2025 01:47:10 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 16
 Jun 2025 01:47:10 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 16 Jun 2025 01:47:10 -0500
Received: from uda0492258.dhcp.ti.com (dhcp-172-24-227-169.dhcp.ti.com [172.24.227.169])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55G6l6Cm3805820;
	Mon, 16 Jun 2025 01:47:06 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <vkoul@kernel.org>, <kishon@kernel.org>, <sjakhade@cadence.com>,
        <rogerq@kernel.org>, <christophe.jaillet@wanadoo.fr>,
        <u.kleine-koenig@baylibre.com>, <eballetb@redhat.com>,
        <make24@iscas.ac.cn>
CC: <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH v4 0/2] Enable PCIe Multilink and USB support in Cadence Torrent SERDES driver
Date: Mon, 16 Jun 2025 12:17:03 +0530
Message-ID: <20250616064705.3225758-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hello,

This series adds support for standalone PCIe Multilink configuration
along with the support for PCIe Multilink + USB configuration in the
Torrent SERDES driver.

Series is based on linux-next tagged next-20250616.

v3:
https://lore.kernel.org/r/20250109121614.754466-1-s-vadapalli@ti.com/
Changes since v3:
- Rebased series on next-20250616.
- Collected Reviewed-by tags from:
  Roger Quadros <rogerq@kernel.org>

v2:
https://lore.kernel.org/r/20250106131925.263240-1-s-vadapalli@ti.com/
Changes since v2:
- Rebased series on next-20250109.
- Based on feedback received from:
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  a) "const" has been used wherever applicable i.e.:
  s/static struct cdns_reg_pairs/static const struct cdns_reg_pairs
  s/static struct cdns_torrent_vals/static const struct cdns_torrent_vals
  b) Commenting style in patch 2 has been fixed.

v1:
https://lore.kernel.org/r/20240615093433.3659829-1-s-vadapalli@ti.com/
Changes since v1:
- Rebased series on next-20250106.
- Significant changes have been made in the second patch of the series
  in the process of rebasing. Support for 3 or more links was introduced
  and this series had to be modified to be compatible with those changes.
- Added "Co-developed-by" tag in the second patch since some of the
  changes in this series in the process of rebasing were made by me
  which are quite different from the v1 version of the patch.
- Due to these changes, I have *not* collected the "Tested-by" tag on the
  v1 series from Enric Balletbo i Serra <eballetbo@redhat.com>
  and I hope that this series can be tested.

Regards,
Siddharth.

Swapnil Jakhade (2):
  phy: cadence-torrent: Add PCIe multilink configuration for 100 MHz
    refclk
  phy: cadence-torrent: Add PCIe multilink + USB with same SSC register
    config for 100 MHz refclk

 drivers/phy/cadence/phy-cadence-torrent.c | 288 +++++++++++++++++++++-
 1 file changed, 279 insertions(+), 9 deletions(-)

-- 
2.34.1

