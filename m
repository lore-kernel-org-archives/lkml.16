Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 188F11E1C1A;
	Thu,  8 May 2025 03:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.130.44.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746674066; cv=none; b=eWuIE2dSxJn36ftbYlRgOdFS1bP5RipHlOGLYhiNmyhL8puB7BA70LnYcD2Kbkl5uYyAuMJAzCrovk6zZBeZ8Fw5v4q4UIaI6ehKNk3zL5nrT3f1Zydv9CLfqQCI2tQaEUbGSh94kP5PJVnVl7xzbnABLVTeiS3GsQ+v11Uh4PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746674066; c=relaxed/simple;
	bh=pg7wYVABb0rhUpjBIos8quBQPrxBvIRo10KdovuIrsw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DHkUVYPWbi9txhRPKGp36TXtRXVePwzukGsvwDVSZNVCvJH2wBF/iv6NftJERpOemw4xubVISbKIi5Q4gG208ag2I04R3XY13ofgxhO+VXwsWMy+p0++4htV5Kq0NhpWieLbVKScAOMSna9W5WuVJ3AJcQCJ50OFtGNOdr/kjcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com; spf=pass smtp.mailfrom=richtek.com; dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b=F8z+fRka; dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b=BSs8vQkZ; arc=none smtp.client-ip=220.130.44.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=richtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b="F8z+fRka";
	dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b="BSs8vQkZ"
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1746674057;
	bh=NeOVctq59G5+Vl63ggwe6KyX95ZPE2nqyV/Mh3vPYWk=; l=1520;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=F8z+fRkaYVIuAst8cx2HPjqLmuqABrWLC5ep3h4zizs9Auv7+Zg+TMZJ7yCN15mBK
	 Pryl2SsdGhwH2cCcNt7UTF5bPXlna2mz86j1alQPH1pHTd/H/exnhTvu+Qlt5d8UZX
	 arEPx0Jwd9ROG4sSHOUu7Zh6qrw90eiXAfXdr+bA5WuoXEB6nLkEpDbAn2bBf/KpHI
	 5B4ABDILn973mqcGyPWo9YqmRcgW8Rlg4GkUZqI4Z64an7/ho08olsWSyIVHn2pwZD
	 M6OZPnQ88FK68BagqA8vyyacoHg6dJtrYqDPh0EUdpgKSMzZThvfA6AiTsqqefB8p8
	 Npxe7+Rh39BpQ==
Received: from 192.168.8.21
	by mg.richtek.com with MailGates ESMTP Server V3.0(1128079:0:AUTH_RELAY)
	(envelope-from <prvs=1219E7066D=cy_huang@richtek.com>); Thu, 08 May 2025 11:14:14 +0800 (CST)
X-MailGates: (compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1746674054;
	bh=NeOVctq59G5+Vl63ggwe6KyX95ZPE2nqyV/Mh3vPYWk=; l=1520;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=BSs8vQkZzAa1Z4F9W0X4WoEYautReUxyTWfL5Z+noBhUQMABpmMpy1p/erOuLf1Nf
	 63eTX/UP8dO/XcUNndUOKxVtcaAnVLeZz+9/g5ISjO/4Re3uwiwyZ/n3KB7CrKHMlM
	 AsRrSxiZpDe1zws1XOaWeKLEcwpALomUne0cC6Noxf/gORdZ8CeRiplqJPs8u/erLW
	 ResLnrU25DYU45qKV+L1CH0juvvO61lSqy6DBc/QChnTvB1ROhXx/o1zfYqoqFpLPj
	 TeF9BiaVUclZIqFNIP4/TKO/iWWQ8ZPjj/vJL4/EVva9tUFsFwaxuaTN+GN/LpRf9B
	 eNSBWsgB2XRPA==
Received: from 192.168.10.47
	by mg.richtek.com with MailGates ESMTPS Server V6.0(786607:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256); Thu, 08 May 2025 10:59:49 +0800 (CST)
Received: from ex3.rt.l (192.168.10.46) by ex4.rt.l (192.168.10.47) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 8 May
 2025 10:59:49 +0800
Received: from git-send.richtek.com (192.168.10.154) by ex3.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1544.11 via Frontend
 Transport; Thu, 8 May 2025 10:59:49 +0800
From: <cy_huang@richtek.com>
To: Mark Brown <broonie@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, ChiYuan Huang <cy_huang@richtek.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, kernel test
 robot <lkp@intel.com>
Subject: [PATCH] ASoC: codecs: rt9123: Fix sparse cast warning
Date: Thu, 8 May 2025 11:01:23 +0800
Message-ID: <185a5ffea22ebd20725fdc7739db6b6addfae3ad.1746672687.git.cy_huang@richtek.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: ChiYuan Huang <cy_huang@richtek.com>

Use i2c block read/write API to fix casting warning.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505072140.iHyLlDN6-lkp@intel.com/
Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 sound/soc/codecs/rt9123.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rt9123.c b/sound/soc/codecs/rt9123.c
index d9a22fda3d26..242e8c975a62 100644
--- a/sound/soc/codecs/rt9123.c
+++ b/sound/soc/codecs/rt9123.c
@@ -399,17 +399,17 @@ static int rt9123_i2c_probe(struct i2c_client *i2c)
 		dev_dbg(dev, "No 'enable' GPIO specified, treat it as default on\n");
 
 	/* Check vendor id information */
-	ret = i2c_smbus_read_word_data(i2c, RT9123_REG_COMBOID);
+	ret = i2c_smbus_read_i2c_block_data(i2c, RT9123_REG_COMBOID, sizeof(value), (u8 *)&value);
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "Failed to read vendor-id\n");
 
-	venid = be16_to_cpu(ret);
+	venid = be16_to_cpu(value);
 	if ((venid & RT9123_MASK_VENID) != RT9123_FIXED_VENID)
 		return dev_err_probe(dev, -ENODEV, "Incorrect vendor-id 0x%04x\n", venid);
 
 	/* Trigger RG reset before regmap init cache */
 	value = cpu_to_be16(RT9123_MASK_SWRST);
-	ret = i2c_smbus_write_word_data(i2c, RT9123_REG_AMPCTRL, value);
+	ret = i2c_smbus_write_i2c_block_data(i2c, RT9123_REG_AMPCTRL, sizeof(value), (u8 *)&value);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to trigger RG reset\n");
 
-- 
2.34.1

