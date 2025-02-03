Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA51C202C55;
	Mon,  3 Feb 2025 11:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738580507; cv=none; b=Kjk1lQWYgKUaO04W+OhcLiir3ObTpnldDmrl6KaQRDIp+lZbxAkPf/I3igUGihoWK0LF3Q/w0yN+S3DXy4fHp9tTFbTHULizqhM4ALPm0ommvkvBx4g6MX8eX3Q8MSAT/QnFdCcKZBH6nrEt5EYtqi7bZGmpVRS5XWI0nglZDWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738580507; c=relaxed/simple;
	bh=/yMVkhOVLx00butLsrD/fGyXoeNUr23Wx8NgtZbk7hQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kNRVIZJDDzyyIIZ1X4vtdLoVl/ZP+Qf555aM+467Lv/058G/9GF9kWaLsgjiBICkRXH7sMcFX4ARiMbWTHjGKSHGjxTcSUupH3v4hPKHZiOBLHSYQD8VWafPvJHxHpT6Dw8H2Elj1c3juDu8li4igb0Iwss4MigTJidOGolgLSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Ff0+01DY; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Ff0+01DY"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 77AFB44311;
	Mon,  3 Feb 2025 11:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738580503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=I81caOaJIOC8WXu1z91vKs/zochmvwTppB2hNy4SkNI=;
	b=Ff0+01DYiXrl9BTpidz0rwXhObO9HOzDPAu2eIIchGN97HgE9EwVU7gbQwit8taGgskco1
	J8laBmTQHLax9yR9m6NcbdP7NwvFepoO67XKm2IEwg+8zwbEArRfMaXClzW43WXwzLV+5J
	Ai/d+bpBx/BgzOu+MPbE7E1MsvExLGsb5MbsYeCacAranrIeE3NO/64CWd5IoY+xjT7J07
	arb3mHogmcEtisehngC7ghmFFohMJ0MCap/NRAawfQe08hfP9gQFCZQ8W0xDRT1oKdS803
	ZFzPLoIa/jmVvcO0oAV/yccEW9nYP2LeettIraYhVUbEfkqGdumX1rjTuW421A==
From: Thomas Richard <thomas.richard@bootlin.com>
Subject: [PATCH v4 0/2] Enable sensors support for the Congatec Board
 Controller
Date: Mon, 03 Feb 2025 12:01:04 +0100
Message-Id: <20250203-congatec-board-controller-hwmon-v4-0-ff6c76a4662c@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPChoGcC/4XOO27DMBAE0KsIrEOD/4+r3CNwIZEbi4AkJiTNJ
 DB091By4yCFylks3swdZUgBMjp3d5Sghhzi0oJ46ZAb++UKOPiWESNMEEMsdnG59gUcHmKf/BZ
 LitMECY9fc1wwWFDcW6k956gpHwnew/fe8HZ55ASft1ZUHkc09BmaM8+hnLuqTlTg5CjanseQS
 0w/+7pK9+9tCKVEHA6pFBNsNAXhvLTewOsQY5nCcmpdu17Zs2iORdZEqoBzza2RTP8X+ZNI5bH
 IN9EJqbh2hin1V1zX9ReDRKIVoQEAAA==
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Lee Jones <lee@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 thomas.petazzoni@bootlin.com, blake.vermeer@keysight.com, 
 linux-doc@vger.kernel.org, Thomas Richard <thomas.richard@bootlin.com>
X-Mailer: b4 0.14.1
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujeegvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpefvhhhomhgrshcutfhitghhrghrugcuoehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeetieejudffledvveeuvdeiuedvuefgkeegheejudefgfektdeuuddvfffhgffgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtoheplhhinhhugiesrhhovggtkhdquhhsrdhnvghtpdhrtghpthhtoheplhgvvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhli
 hhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqhhifmhhonhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdguohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepjhguvghlvhgrrhgvsehsuhhsvgdrtghomh
X-GND-Sasl: thomas.richard@bootlin.com

This is the fourth iteration of this series which enables sensors support
for the Congatec Board Controller.

The series was rebased on v6.14-rc1.
A typo was fixed in the Kconfig, and the description improved.
The documentation file Documentation/hwmon/cgbc-hwmon.rst was added.

Regards,

Thomas

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
Changes in v4:
- Rebased on v6.14-rc1.
- Add the documentation for this driver.
- In Kconfig, fix a typo and improve the description
- Link to v3: https://lore.kernel.org/r/20241115-congatec-board-controller-hwmon-v3-0-1c45637c8266@bootlin.com

Changes in v3:
- remove the cgbc_hwmon_compute_curr_channel() macro.
- Link to v2: https://lore.kernel.org/r/20241108-congatec-board-controller-hwmon-v2-0-16e337398527@bootlin.com

Changes in v2:
- hwmon: use unsigned int type instead of u8 in struct cgbc_hwmon_sensor
  and struct cgbc_hwmon_data.
- hwmon: in cgbc_hwmon_probe_sensors() no need to request data for the
  first sensor as the Board Controller returns data of the first sensors
  with the number of sensors.
- hwmon: fix typos in comments and improve them.
- hwmon: remove dead code in cgbc_hwmon_read() and in
  cgbc_hwmon_read_string() (deadcode was the 'return -ENODEV').
- hwmon: remove useless platform_set_drvdata().
- hwmon: channel id always refers to the same sensor.
- hwmon: add a enum cgbc_sensor_types.
- Link to v1: https://lore.kernel.org/r/20241104-congatec-board-controller-hwmon-v1-0-871e4cd59d8e@bootlin.com

---
Thomas Richard (2):
      hwmon: Add Congatec Board Controller monitoring driver
      mfd: cgbc: add a hwmon cell

 Documentation/hwmon/cgbc-hwmon.rst |  63 ++++++++
 Documentation/hwmon/index.rst      |   1 +
 MAINTAINERS                        |   1 +
 drivers/hwmon/Kconfig              |  10 ++
 drivers/hwmon/Makefile             |   1 +
 drivers/hwmon/cgbc-hwmon.c         | 304 +++++++++++++++++++++++++++++++++++++
 drivers/mfd/cgbc-core.c            |   1 +
 7 files changed, 381 insertions(+)
---
base-commit: 379487e17ca406b47392e7ab6cf35d1c3bacb371
change-id: 20240809-congatec-board-controller-hwmon-e9e63d957d33

Best regards,
-- 
Thomas Richard <thomas.richard@bootlin.com>

