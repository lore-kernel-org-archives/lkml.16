Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707D124394C;
	Mon, 10 Feb 2025 15:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739199641; cv=none; b=hoWpR2KQmy1Cz1zu4W3HniejBYHK4Yccsz9ohMeOuXn6taBGiEwf54QVLJzyVndVn4jdSj0t6brXgFGIx8o/MU3PCxaNJ40zH9ZrJ3BbZyTfMmVQuy14EmwjVtbh/oGxCv9E7Q8XhwebhChj0Y3RdbYBzTtoaEWedQ9NVttdNyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739199641; c=relaxed/simple;
	bh=IlEH9UnHk+VkPH0rbc8UAMXFvI08ENUutZ/6vepeZN0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XmUTDNySQfjxyyD/CplFf8o3EK4Fil7AV79C8muJG9WJmT5hOmsyzPU6SzumC+V5k2L++V11xVb62YALj8/Zwlvz0me2DDW6I70UHPlDdH7tAo4ibKl84Wfgt/fEH+sKF5jV8gZHso8KXqetNxCpfe+8LmB0/mXP8XdlYtjMyGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=Yv33umHL; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=C/duP5Ab reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="Yv33umHL";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="C/duP5Ab"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1739199640; x=1770735640;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wCA2u7BrMzwTbrY7qS2/tG6GLaz9EpT4QFmVke8rkzI=;
  b=Yv33umHLwKFt2Qphasbzxge0J2ABxqviA6UXGRqUMSzjT/Rg18MJRMgM
   xzOGXsMOvL+5ZDLaDU44tokz/x4lJGpG1MNRT/h5cs0GgAzqboPYmcf/8
   +46FzJTg1rndgcNgX9TH0VME24sBf5zpgqeVvaOejYdAcLj1ouiFweCkZ
   /LDQ1N8JKWPpyjDRXofu2oZfuxKZ5e9wOtlcqIr+6iIB2VTww532y5DXo
   57MBGiSxuoZRqtmq9KDGDA/NfKZNvWLNyPvWg+uzdLlhKVxTmGAlQq/Di
   YggjLZKYBDOefIkGGHvb+ZtSAppeyhf4SeXGlH2KtiQ96jb4mFbDRusho
   g==;
X-CSE-ConnectionGUID: XHdI1dveQbChE7XARXrDeA==
X-CSE-MsgGUID: sZIJ26gnTS6O/P8/T5fz3g==
X-IronPort-AV: E=Sophos;i="6.13,274,1732575600"; 
   d="scan'208";a="41722363"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 10 Feb 2025 16:00:38 +0100
X-CheckPoint: {67AA1496-25-7866BB5F-D0C713E6}
X-MAIL-CPID: FC6134356E81C2C52A1BA612175D2EC6_4
X-Control-Analysis: str=0001.0A006377.67AA1497.001B,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 11D7316964A;
	Mon, 10 Feb 2025 16:00:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1739199634;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wCA2u7BrMzwTbrY7qS2/tG6GLaz9EpT4QFmVke8rkzI=;
	b=C/duP5AbfTsSAIxyoOMZwJL2ZYUjodKkmIvYubmDtXla5BmWenfXtN9iyIbmC27EQ1f+gm
	t/WxC2c+mpZd2yuBOfRxiX8HCQUaw2hT9wXgsPqg/OzLdSkTtMy519J/QL6BG1uEoyVOzt
	DQ1uQH21nbdhGM8ARZ3obzLciT6+ZOtJFSIRQv7W8w1UQM8aW68Ri/+ukc1dzw6YZ9xhLQ
	o+BHLoYCaisy6nxlnf++NgfN5SmsLAdFTmdN5giQA6YyOBsbo953wDIpY1LY/XV24sZw3z
	C5pIfH5EIMW8UzyeWfAlZAYU8fGtxl86sPRurGSQPfybpapBH/OCYqlUljr8/g==
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
Subject: [PATCH 4/5] hwmon: (gpio-fan) Remove unnecessary comment
Date: Mon, 10 Feb 2025 15:59:32 +0100
Message-Id: <20250210145934.761280-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250210145934.761280-1-alexander.stein@ew.tq-group.com>
References: <20250210145934.761280-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

__set_fan_ctrl() is only called by set_fan_speed(), which ensures
fan_data->lock is held already.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/hwmon/gpio-fan.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
index 322b161d5ca1f..4614d0ad86b3a 100644
--- a/drivers/hwmon/gpio-fan.c
+++ b/drivers/hwmon/gpio-fan.c
@@ -100,7 +100,6 @@ static int fan_alarm_init(struct gpio_fan_data *fan_data)
  * Control GPIOs.
  */
 
-/* Must be called with fan_data->lock held, except during initialization. */
 static void __set_fan_ctrl(struct gpio_fan_data *fan_data, int ctrl_val)
 {
 	int i;
-- 
2.34.1

