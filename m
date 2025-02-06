Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A05922ACF2
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 12:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738844710; cv=none; b=UlaIwPV/4MW9VPtg+ez1SK1928/GkDKbjuauCFFvKVY/ob1w8JdXUzdzm17yf6Qvz9+ZsMNi69rjvTetqS17xvba8jJDtDs4fnb/m1uv/tXtpqycgaSopjlXWd5+UCPzvFBNt9gdcrujPV8K0BJKHGfqmUjmYJAKQ57kvH0v83I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738844710; c=relaxed/simple;
	bh=Ap18sWqPqaqbAEgQZo/PGqG5bZi5XCaSycqw04rTQG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QvOfQJ5w01iuEbHqYoY1Dqx5Ouy54umxyv5QvSzEd2MIDU1OT7Twi69YXVhU2K2zo9qwMX9vxSe0uHXpgDM7ahIxu/s/JMG3fvNYmMMYqQl237cc0YAT9wfRkZBl05fC5sMdBmpAnvDnmPO1ni730jeD+/I6U9MlVpzb/F/YVVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DCcyhHQw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DCcyhHQw"
Received: from isaac-ThinkPad-T16-Gen-2.lan (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0FE651198;
	Thu,  6 Feb 2025 13:23:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1738844634;
	bh=Ap18sWqPqaqbAEgQZo/PGqG5bZi5XCaSycqw04rTQG4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DCcyhHQwRVZm9I8tGGaJOM+EboPKtDKxEoHyVvqtomRYyvpwujxORWngbQEOfUU7q
	 +ILQRFhegTfL2NwS16znPb8e+8LIDCEW5fNHT0ZTuLEg7P/Z992v0QUjYQFFcjECcc
	 DYxDtp4JJtblqrU+u5m9CHB2qJDuqbmSsdF82QdY=
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: michael.hennerich@analog.com
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	linux-kernel@vger.kernel.org,
	Isaac Scott <isaac.scott@ideasonboard.com>
Subject: [PATCH 1/1] regulator: ad5398: Correct the SW_POWER_DOWN bit number
Date: Thu,  6 Feb 2025 12:24:59 +0000
Message-ID: <20250206122459.197985-2-isaac.scott@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250206122459.197985-1-isaac.scott@ideasonboard.com>
References: <20250206122459.197985-1-isaac.scott@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The datasheet for the AD5398 regulator indicates that the Soft power
down bit is bit 15, not 16 as represented in the driver. Correct this to
ensure the functionality is implemented correctly.

Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
---
 drivers/regulator/ad5398.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/ad5398.c b/drivers/regulator/ad5398.c
index 0274f41d0233..eb2a666a45cb 100644
--- a/drivers/regulator/ad5398.c
+++ b/drivers/regulator/ad5398.c
@@ -16,7 +16,7 @@
 #include <linux/regulator/machine.h>
 #include <linux/regulator/of_regulator.h>
 
-#define AD5398_SW_POWER_DOWN	BIT(16)
+#define AD5398_SW_POWER_DOWN	BIT(15)
 
 struct ad5398_chip_info {
 	struct i2c_client *client;
-- 
2.43.0

