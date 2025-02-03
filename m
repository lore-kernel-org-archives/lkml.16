Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80FF202C2A;
	Mon,  3 Feb 2025 11:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738580508; cv=none; b=D6tSNqwBnfaKafHikNEbRkhQaLSCECgb6GP3TdM2k+7RXmEZQJwkKLPf/y8F8MaZrzgvnJjsEpiGiwzhEDjHfR44STH8L2lQwzYH2sn53IXCn2ZxxMkMwt1JUZ33LuY/ikNaSQ49+lHBm1PlZfGTvYotdVkTyS3ht89yZQVcQGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738580508; c=relaxed/simple;
	bh=8GkETiTGBP9q5mixXC4jA0BYouO97SgA3qumfOQmHrs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZMuwbn3Qh7f82d6+EmCwcISuEPga8W/BAsIQjDpOFu3XMlbIwWywjeyR3SqDpy3w7nPOOSBw00bM4BnI/hA7sy6IwySc2ti/9I/mXDS/v5VUGqvRjbM0qxVj5P9V0i06zqxwIcoTHbzAX1dgNF32yowqv5K22Pdi9N7v2ZrsNBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JIC71Ot8; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JIC71Ot8"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 93A7D44308;
	Mon,  3 Feb 2025 11:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738580503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4pipkAKB6Y5/xQqX+bJd5jY3xXtAv0BFlQru9j60lSo=;
	b=JIC71Ot8xpQhbw/s2aXlunpTXWeJaUmR3mEJg1VGNIzWExwtF4WBeyYidkqlhPV6nWG5YZ
	ZMAYi6xQgpT3Xa/XsmjZWi4awkuKPjJ47abtSPZeJi52THQ420tW7jDibPfIf800yGXmwf
	b30DVD4YLfKB3oqhmmg4dVzgKm7DyOx+axtz4yb1tbj99g7q55gzMyyn/lIKM4E6EUvR0S
	H5QyL5oKJVduMU2xpjrcqREg5sDOa7+X+/+ScrURNT8jWTQkhYytSdcuCUQ6SsrHVmNaqC
	UYatvthHJj9hybrvtx6KzhKxMQsZOJNzebkZLinYTR17ajPIuvS3kqHC8DhYQg==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Mon, 03 Feb 2025 12:01:06 +0100
Subject: [PATCH v4 2/2] mfd: cgbc: add a hwmon cell
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-congatec-board-controller-hwmon-v4-2-ff6c76a4662c@bootlin.com>
References: <20250203-congatec-board-controller-hwmon-v4-0-ff6c76a4662c@bootlin.com>
In-Reply-To: <20250203-congatec-board-controller-hwmon-v4-0-ff6c76a4662c@bootlin.com>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Lee Jones <lee@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 thomas.petazzoni@bootlin.com, blake.vermeer@keysight.com, 
 linux-doc@vger.kernel.org, Thomas Richard <thomas.richard@bootlin.com>
X-Mailer: b4 0.14.1
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujeegvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefvhhhomhgrshcutfhitghhrghrugcuoehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkedthedvieethedtleetffehudevleegledvteegvdeujeeghffhkeeggfefudevnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemuggtkedumegrrggutdemfhgutggrmegttgdurgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemuggtkedumegrrggutdemfhgutggrmegttgdurgdphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomhepthhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopehlihhnuhigsehrohgvtghkqdhushdrnhgvthdprhgtphhtthhopehlvggvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnu
 higqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhhfihmohhnsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqughotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehjuggvlhhvrghrvgesshhushgvrdgtohhm
X-GND-Sasl: thomas.richard@bootlin.com

The Board Controller has some internal sensors.
Add a hwmon cell for the cgbc-hwmon driver which adds support for
temperature, voltage, current and fan sensors.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/mfd/cgbc-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/cgbc-core.c b/drivers/mfd/cgbc-core.c
index 85283c8dde25..0460e4e3f3c5 100644
--- a/drivers/mfd/cgbc-core.c
+++ b/drivers/mfd/cgbc-core.c
@@ -236,6 +236,7 @@ static struct mfd_cell cgbc_devs[] = {
 	{ .name = "cgbc-gpio"	},
 	{ .name = "cgbc-i2c", .id = 1 },
 	{ .name = "cgbc-i2c", .id = 2 },
+	{ .name = "cgbc-hwmon"	},
 };
 
 static int cgbc_map(struct cgbc_device_data *cgbc)

-- 
2.39.5

