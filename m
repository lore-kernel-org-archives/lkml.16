Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F712249F9;
	Tue, 17 Jun 2025 10:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750157258; cv=none; b=pJ3hlUM3IeW7C3G/Pxc/3nZgY4crLKDAUX81KTVGamIT4j8e5CfQRhm61wqBmhXppefMvuggSY1GWDiHujdWoKaXyJw0uCyUby5kS+NYGagcTVmrEbOXouy4oXuASDUKtLQCA2j9O2OCNNroykjL/9DRAU/EC0vBrMBH6zuXskI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750157258; c=relaxed/simple;
	bh=MWqDIdWNCF7eOdgs4SOkDxYmhHds6r/EiSOKhZbHd9E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TPpeVOTvRTvlQJuHlnxGeEZP6OPQCbVqARlM0w3YlCqhYdtf3aSu9aKawIAnrrm9OFlo0jeSgpch50DvZG1qMptZtqaEpT6na2NAHxLOhCkSPncrtaFEn9Nb9dyjECMmmbAKYCxxsO1El2loK18jK6qbMRkOqCUuhZ9ZChasRac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=uBYcaihr; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="uBYcaihr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750157258; x=1781693258;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MWqDIdWNCF7eOdgs4SOkDxYmhHds6r/EiSOKhZbHd9E=;
  b=uBYcaihrBqHLxaITX4MTICNY24SE5KbGLKtK3sVIcu8b2NynyClBzMAF
   PlMIQchOcDcvyhCd7bhNruy4oqM/r/ijKgpIoD4N0XnPG3oMI4VBvH4AO
   QRS0Z5jb71T9NjtzoPcykwS0LwQEOGGz4gH1AETljJImTTwmHcs2LDT71
   Cl0nn4jP80oJXhgqsxBIq/fBMUXuxQVURgw3FdP9UOxLAENEi5wg79DG6
   lQk19kGyOBR4fqdD/CYo7sDoyp/h7I5LAKtWuI8biwxYdVEim01789aU4
   LLs23NUTZz4QCzHI5J8NngjvyE+CWmqceb9iYCvKLhkkp6uVamXsP21Sc
   A==;
X-CSE-ConnectionGUID: NlLJIgKaS1e8ItqRhu+KEg==
X-CSE-MsgGUID: ohbEyHi6T96aDb7svZRyfA==
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="274279560"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Jun 2025 03:47:30 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 17 Jun 2025 03:47:09 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 17 Jun 2025 03:47:07 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH 0/2] Add cache configuration for Microchip SAMA7D and SAMA7G MPUs
Date: Tue, 17 Jun 2025 13:47:01 +0300
Message-ID: <20250617104703.45395-1-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This patch series adds cache configuration for Microchip SAMA7D and SAMA7G MPUs.
The cache configuration is described in datasheet chapter 15.2.

Mihai Sain (2):
  ARM: dts: microchip: sama7d65: Add cache configuration for cpu node
  ARM: dts: microchip: sama7g5: Add cache configuration for cpu node

 arch/arm/boot/dts/microchip/sama7d65.dtsi | 17 +++++++++++++++++
 arch/arm/boot/dts/microchip/sama7g5.dtsi  | 17 +++++++++++++++++
 2 files changed, 34 insertions(+)


base-commit: 9afe652958c3ee88f24df1e4a97f298afce89407
-- 
2.49.0

