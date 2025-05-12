Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D0A1E51FF
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 18:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747076293; cv=none; b=oaT3aFRZgjqmD4y6I8cPWsFYPKLq2POzD39HmU3QCoxBv8QB+cTzxlARItVAly23nQ8Q9DuQBOVeTJvY7Y9qWBWQFmTDQD8aTqC+AHRV5VGb0M8JJTPbnFTcVz7UgtoIhNEfSxos9tMy+VEyzNg/gb1oDqRq3XTrIUonQkjazHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747076293; c=relaxed/simple;
	bh=KFQjHqN1oAAjo1RJOok3ueSzjmFOYcaYRIZfi3T0bSo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TZWt9l1UmMg6YVrJa0njPMboQU1udLFEuoJbV4z2adJcXoAWS8Q2bS/MsnJdIRDijafFCaSfv9C/ET2HoK8lUpXXlFkZH08PCVz7Oal2v1DZ4t+q+kCBLpBJobZzM194RwaDLzMIHmuI2soHDLUllPTe8HMgEBGp/frzfGDQTo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=aEPTGW77; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="aEPTGW77"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54CIveRZ2645208
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 May 2025 13:57:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747076260;
	bh=Qb6JfIhSW1h4eYzfuOi/aq/Oo6JyXU+LA8+sA4fY1EM=;
	h=From:To:CC:Subject:Date;
	b=aEPTGW77Nm0yJMUYEB67Sfa18JFqrsYzbyXC2cCwZ737aMBr86iDu8Kb7orp/BnxK
	 BoBR4tai6/H+i7fPcnQ72Kyo41/vyGOJqXoSCVgx488xN6av7Zvd1PWgu7wfS9ZalB
	 cze6GTp4OnFctEjPWnLS5dl2SkpM2udmv45lHl8U=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54CIveZE018109
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 12 May 2025 13:57:40 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 12
 May 2025 13:57:39 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 12 May 2025 13:57:39 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54CIvddH072850;
	Mon, 12 May 2025 13:57:39 -0500
From: Nishanth Menon <nm@ti.com>
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
        Mark
 Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        Nishanth
 Menon <nm@ti.com>
Subject: [PATCH] ASoC: tlv320aic3x: Use dev_err_probe
Date: Mon, 12 May 2025 13:57:39 -0500
Message-ID: <20250512185739.2907466-1-nm@ti.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

During probe the regulator supply drivers may not yet be available.
Use dev_err_probe to provide just the pertinent log.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
Testing based on next-20250512 (includes additional patch) on AM62a7-sk
Before: https://gist.github.com/nmenon/be94f21e83b4260ad3f89e1ae8f0d188#file-before-L851
After: https://gist.github.com/nmenon/be94f21e83b4260ad3f89e1ae8f0d188#file-after-L806
 sound/soc/codecs/tlv320aic3x.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic3x.c b/sound/soc/codecs/tlv320aic3x.c
index 56e795a00e22..f1649df19738 100644
--- a/sound/soc/codecs/tlv320aic3x.c
+++ b/sound/soc/codecs/tlv320aic3x.c
@@ -1818,10 +1818,8 @@ int aic3x_probe(struct device *dev, struct regmap *regmap, kernel_ulong_t driver
 
 	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(aic3x->supplies),
 				      aic3x->supplies);
-	if (ret) {
-		dev_err(dev, "Failed to request supplies: %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to request supplies\n");
 
 	aic3x_configure_ocmv(dev, aic3x);
 
-- 
2.47.0

