Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D301F8BCC;
	Mon, 10 Feb 2025 14:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739199601; cv=none; b=Yz9kBmEG43PsoiefDJhz2j0wXftK6ogMlYsqw6lMYNC6LECWow3td0DzjqqMkknuxG/Dwq3TVz8x4qAmpcnGzZ+LXM+j7LK0B5hgDyCHqSmbSZ4cZ9QrB13G+KusAhqd1IQX7b9rnyWgFFw7zdOifwYwak77S6IcWl+xqQIPmdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739199601; c=relaxed/simple;
	bh=LYrH3se2kevJ6TQFoVUgVI2VCj7nNFdqnPW3WO52Uq0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UYNigZMPd2hu1DmEil4fTbK3qEdy+nfPrRafF5dW5V4D/KNIeO5gR1Mt8/n5emaLUNLQFMK06eDeUxMi/XgaURA53w2v8BW/N/AvUacEv9wwNjf4KlYfkGTjyNKF1x+m7mk/0gc4M5QLL9fpJNuptisPufkmzPSFvptdyXplMjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=A2dLVEb6; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=XXp+iOkE reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="A2dLVEb6";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="XXp+iOkE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1739199597; x=1770735597;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6ggFbkRi2BStIc9tcF8Z/DUHdg329kUgO/CuyG2Af4M=;
  b=A2dLVEb6uMBzWTivUWuJA6/vFnYDRhIlUFPAiyn9yBE8qKvCRMvI63IB
   H9fHiFipBvIwYkehBIRiim7NeTkno/ckvvUwL02Hkc6Q3GQQjt6O8ISwx
   sNZU2wjnbTQkZrn5TofzGQc+E4Nk1ZWKp4+4+UPgLlZRUTyV2SUtRdlbc
   6tuekoTexxXA2HyMOWjDdmiD++uBUq52iEKwq8k/y34VpjfVO9ekVFLHN
   8b2DwSqmHVXFI8LnglaWiS3aoNUW2JWFtB5oRZ3PEg8dH5nnEh57KJmtY
   Sbj2rMjP9YX/31ye5ZDS9uSvt+Hno+fkPvkf49MPM2tk3z90wjPgoPl+d
   A==;
X-CSE-ConnectionGUID: SzLJ4+o9RXuUQ8S6f4LzGQ==
X-CSE-MsgGUID: /JoPe9/mQFCEUiob6FYXSw==
X-IronPort-AV: E=Sophos;i="6.13,274,1732575600"; 
   d="scan'208";a="41722345"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 10 Feb 2025 15:59:52 +0100
X-CheckPoint: {67AA1468-2F-5D6E03B7-C5EC52AB}
X-MAIL-CPID: 8713916ACD72828F9A942077269D2652_2
X-Control-Analysis: str=0001.0A00636E.67AA1469.006D,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 97071166485;
	Mon, 10 Feb 2025 15:59:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1739199588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6ggFbkRi2BStIc9tcF8Z/DUHdg329kUgO/CuyG2Af4M=;
	b=XXp+iOkEwRaEuQ//xRjcnGsavQ7DhQStLLjXTJdknySx+7kQSCf7RJYVSNjjVcruXvQK1E
	NRmhs/zZnNfNmSSnccQvKqkS2ZY/d9nsznZQGbc10igC87oOrxdLZaFjpjEcsDU+5oBKyW
	ZGgr/uJeigFI/FOeCgxeABOh92e50+Wr+dxojZaht4VSfXqH/8rR1GPh8ZuQMOenSIny6h
	SdGtXXybdPsaet53LNLiv3227csVQ7aY/KnyWwVDjsNuHZqIzLB2D0bCD+rxpCmszwKQ6t
	BFlB6W7pmkhpXAFCiBUnvZAWgMN+o8any0d8Nl88cpd7w9QzuNJdgN8Y/jQAlg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] gpio-fan: regulator support
Date: Mon, 10 Feb 2025 15:59:28 +0100
Message-Id: <20250210145934.761280-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

this series adds support for regulator support for the use-case a GPIO
controlled fan also has a switchable power supply.
Patch 1 is the change for the binding, which is based on pwm-fan.
Patch 2-4 is some small cleanup in preparation for regulator support.

Note: Patch 4 can also be suqash into patch 3

Patch 5 is the regulator support by adding RPM support which enabled/disables
the regulator accordingly.

Alexander Stein (5):
  dt-bindings: hwmon: gpio-fan: Add optional regulator support
  hwmon: (gpio-fan) Add missing mutex locks
  hwmon: (gpio-fan) Ensure lock is held during set_fan_speed()
  hwmon: (gpio-fan) Remove unnecessary comment
  hwmon: (gpio-fan) Add regulator support

 .../devicetree/bindings/hwmon/gpio-fan.yaml   |   3 +
 drivers/hwmon/gpio-fan.c                      | 106 ++++++++++++++++--
 2 files changed, 102 insertions(+), 7 deletions(-)

-- 
2.34.1

