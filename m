Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793683074B1;
	Wed, 25 Jun 2025 07:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750834950; cv=none; b=G/peOUSzNTcouNzcE6Dl5v8nD7ouBm0rYc6wF44Xx/iclkw1wW0HubK6CalGhcCgNZMelBizCXjvJnia082M3GNyMilzVjtTQCdBcsjvA9dLYxSqDx9/+mLvXlYz/7jwIa3Kqs/i1quVZT5o8rrM8k0n1s836U6NuLHGNXZdjS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750834950; c=relaxed/simple;
	bh=lu8GW/xf4kOX1REuCn/SZZoVJUNSBI+oSTHjyIo0pcE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=it/9lBSEQFT69aUZ1Vozk8WyTfnhdXDNPw5VdK9LkbVXVLiDv2cdnUhK0WiF+DRaCoFF28OyROdNN/qrfZ99qG92V73X/abTL8cIdwAltWMAWjLjgZo3re1q4Fuxg5TqRkeHyrKyfJhABDLBsyGNQoh6+g2KAYLvvSLKrsYVFpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=TvFkXXUs; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="TvFkXXUs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=g3
	1EdVqBUgF/JJ4ImsjTsW7cIn3BR3/DuJ4lZMKdllE=; b=TvFkXXUsorLCyPPXTV
	YYE8LHQH0/FOwXUHbCKEukFL9ddsyr1Xs/lu73Owb6btAYFNEOoIRF9QbkrDWnOG
	KFUJtKqVvXuQzp5eXbIAfuuG3HrBRCqElEU1KHpQJzhENebMWCb2IY05tMeBvA2E
	Wn1OJGuD3ZVXCVWvlc1l2rUe4=
Received: from mps-HP-EliteBook-840-G3.monolithicpower.com (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDnHgyTnltoDJZ4AQ--.61670S2;
	Wed, 25 Jun 2025 15:00:38 +0800 (CST)
From: wenswang@yeah.net
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jdelvare@suse.com,
	linux@roeck-us.net,
	corbet@lwn.net
Cc: Jonathan.Cameron@huawei.com,
	michal.simek@amd.com,
	naresh.solanki@9elements.com,
	festevam@gmail.com,
	rodrigo.gobbi.7@gmail.com,
	grantpeltier93@gmail.com,
	laurent.pinchart@ideasonboard.com,
	cedricjustine.encarnacion@analog.com,
	nuno.sa@analog.com,
	ninad@linux.ibm.com,
	jbrunet@baylibre.com,
	kimseer.paller@analog.com,
	xzeol@yahoo.com,
	leo.yang.sy0@gmail.com,
	Mariel.Tinaco@analog.com,
	johnerasmusmari.geronimo@analog.com,
	linux@weissschuh.net,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Wensheng Wang <wenswang@yeah.net>
Subject: [PATCH 0/4] hwmon: Add support for MPS mp2869,mp29502 chip
Date: Wed, 25 Jun 2025 14:59:56 +0800
Message-Id: <20250625065956.964759-1-wenswang@yeah.net>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgDnHgyTnltoDJZ4AQ--.61670S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jry7CF1DGF4rZFWfWry5XFb_yoWfuFXEkw
	42gFZrAr1UJFs5WFZrCr1kuryUtr4FgFyxJ3ZIy398AFW3Z3ZxWrykX3sFva47ArWUuF13
	Z3ykCws5AF17KjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0eBT3UUUUU==
X-CM-SenderInfo: 5zhq24xdqjq5hhdkh0dhw/1tbiEhB3pGhbdHKTSAAAs-

From: Wensheng Wang <wenswang@yeah.net>

Add mp2869,mp29502 driver in hwmon and add dt-bindings for them.

Wensheng Wang (4):
  dt-bindings: hwmon: Add MPS mp2869 series
  hwmon: add MP2869 series driver
  dt-bindings: hwmon: Add MPS mp29502
  hwmon: add MP29502 driver

 .../devicetree/bindings/trivial-devices.yaml  |  10 +
 Documentation/hwmon/index.rst                 |   2 +
 Documentation/hwmon/mp2869.rst                | 166 ++++
 Documentation/hwmon/mp29502.rst               | 104 +++
 MAINTAINERS                                   |  14 +
 drivers/hwmon/pmbus/Kconfig                   |  18 +
 drivers/hwmon/pmbus/Makefile                  |   2 +
 drivers/hwmon/pmbus/mp2869.c                  | 711 ++++++++++++++++++
 drivers/hwmon/pmbus/mp29502.c                 | 691 +++++++++++++++++
 9 files changed, 1718 insertions(+)
 create mode 100644 Documentation/hwmon/mp2869.rst
 create mode 100644 Documentation/hwmon/mp29502.rst
 create mode 100644 drivers/hwmon/pmbus/mp2869.c
 create mode 100644 drivers/hwmon/pmbus/mp29502.c

-- 
2.25.1

