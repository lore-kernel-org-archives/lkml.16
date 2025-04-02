Received: from mail.hows.id.au (125-63-26-112.ip4.superloop.au [125.63.26.112])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EDF31F4CAB;
	Wed,  2 Apr 2025 22:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=125.63.26.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743631703; cv=none; b=lgTdwmuSX7e7aHgTXm2G/0V14AJCQhlfNEmuK4rDTh/ni+asR5sewZiXC40fZr6s0f1UdIblrsX9WZrxuSlkbgFX2z8l5YaDteZT/GYJCHO3CMqDOGjUV1UbnOPkd1eeSPyjd8TvASwtIIqZzA8irmUbX6R34XccPM3p+XpPi3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743631703; c=relaxed/simple;
	bh=0TdOR3qEXfPkH4C8WmoAHU21GhcNfcwzdcuRgiarf/U=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ohKbtEws2jJS5J4hzXIhg2DVvO66e70eIQEhSiTB78yv2iF269Lb42HawGd9GxN+VoWJ4sOcLAC1MbMP85VRQZD0777qlG6aY5b2PTRAY0OogGrerTHVxxei+vaGOX6qpCiMD6mrVBOvBowN7zunDI+x8JKMBAqBTkpzq3YaL7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hows.id.au; spf=pass smtp.mailfrom=hows.id.au; arc=none smtp.client-ip=125.63.26.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hows.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hows.id.au
Received: by mail.hows.id.au (Postfix, from userid 113)
	id 4A37E22F1A; Thu,  3 Apr 2025 09:08:13 +1100 (AEDT)
X-Spam-Level: 
Received: from archibald.hows.id.au (unknown [192.168.0.111])
	by mail.hows.id.au (Postfix) with ESMTPSA id 1C54E229F9;
	Thu,  3 Apr 2025 09:08:11 +1100 (AEDT)
Date: Thu, 3 Apr 2025 09:08:09 +1100
From: David Hows <david@hows.id.au>
To: Clemens Ladisch <clemens@ladisch.de>, Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] [v2] hwmon: (k10temp) Add support for Zen5 Ryzen Desktop
Message-ID: <Z-21SQkZpuWiWK06@archibald.hows.id.au>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Add support for retrieving CCD temperatures on Zen5 Desktop CPUs

Signed-off-by: David Hows <david@hows.id.au>
---
 drivers/hwmon/k10temp.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
index 3685906cc57c..96a76f3359eb 100644
--- a/drivers/hwmon/k10temp.c
+++ b/drivers/hwmon/k10temp.c
@@ -503,6 +503,13 @@ static int k10temp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 			k10temp_get_ccd_support(data, 12);
 			break;
 		}
+	} else if (boot_cpu_data.x86 == 0x1a) {
+		switch (boot_cpu_data.x86_model) {
+		case 0x40 ... 0x4f:	/* Zen5 Ryzen Desktop*/
+			data->ccd_offset = 0x308;
+			k10temp_get_ccd_support(data, 8);
+			break;
+		}
 	}
 
 	for (i = 0; i < ARRAY_SIZE(tctl_offset_table); i++) {
-- 
2.49.0

