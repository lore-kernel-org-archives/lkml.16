Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791EE24113D;
	Mon, 10 Feb 2025 15:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739199637; cv=none; b=IwRIYAlh951xHOvQ7ON9Xn5OdRFxhHbNwl+xYbRkVn3l9PdUfg9CIJlpKdIhG1qsflJZdXuQPZVqfudo62BqRsRGAKrIbViu9DYxB6G0R7KpzSAiIjNuVSJljT5BM6f/g6ZY3yYjnV7yV2Xlu57oGYcHkHmH368zxqUK3PFCwOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739199637; c=relaxed/simple;
	bh=CpIY3VXhWV0zIQNk2Jdy6iSIOvKWKWRYF0BpjV11yt0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bSluvjUnJzFmamohbO60SPZ34SZjsKfHWCeNvAuhYY3r/2d7ctkh96krPm6grL9LgIetmH4Ew9+uLedJJP3ngyMI9UDD/Bu/kSLwYkYWYqHp7Opr39B4MZgmqoX1XOT/qLPkL/tHGiVp2sn6k5Zt8jelY9hXc7ROoKozvRvspJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=ejVrayS0; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=cxZ/Rswo reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="ejVrayS0";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="cxZ/Rswo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1739199635; x=1770735635;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7zhJkxN7M4AS4HKKzEz/t1x2Ieh8jUxa+UNprODpZG8=;
  b=ejVrayS00no5MA0AYWRsZP1/gEJ8iak65MyE0B3OCmrrAYktL5UETiUc
   fYkcCYF81rmks1gX9CpRA7YsyZPhbNzbjGQ9dlk6Vnw9ynJBT4vyEmntv
   3Ci6h21Y/pnMvT1+j3tJRP8yE8LSPdMKjcFkMDvu7ce1QkVbeDILJupoF
   V6I8qvTcRaeLHUCearBGsEiiJY44ZWPHy1FtGYf5CHuWIhTRaMxMzLBZA
   oYFGeEx2lTaVuT3Npt+8sRaonODOk6t0DwfWeezbM8CksIO4iaW2+v6xT
   eqJIMRW+a+PgUMrdPDIObEuhwJQX8JpxqvgIk3/31fzLk3xpR9FQk+ZQz
   Q==;
X-CSE-ConnectionGUID: kcsYhCceQzOrjtWek49g2w==
X-CSE-MsgGUID: RaoQhQOLSPaTSKdKUeZ6fg==
X-IronPort-AV: E=Sophos;i="6.13,274,1732575600"; 
   d="scan'208";a="41722360"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 10 Feb 2025 16:00:33 +0100
X-CheckPoint: {67AA1491-22-7866BB5F-D0C713E6}
X-MAIL-CPID: 80C5FE1B7D4F1AE7214D1AD0A141B436_4
X-Control-Analysis: str=0001.0A006377.67AA1492.0019,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 09075169635;
	Mon, 10 Feb 2025 16:00:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1739199629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7zhJkxN7M4AS4HKKzEz/t1x2Ieh8jUxa+UNprODpZG8=;
	b=cxZ/RswohJFosoO7bLBuLSHwgIas+H89T1H8TNMhmdDoEXv5pTQ4woMobfOOF/LYjxXgkM
	pt3o1o/QO5A98SLD5+qulT5aO26pXv/CG9H+R0BrtfXUpknv+iOjgzLItnWorLUTbtF7SF
	/dxKeMTNLO+S3pg5UAFpzjvRyni9dPLNDyYJbhZT33KG9yga1CQEB7AHLYyCwO8pTXirHw
	vkkRNRHzJL2tC4MXCZj39CFumgc32DLm3pZ/i4T9fgCHCnuZlxwww7zI79EKQWeooBji6Z
	2fH946fXb86o8wiKQA0353ljHhPeJ/ZIXulzx8wLVSyWtvgJUzNcr73izTX1Pg==
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
Subject: [PATCH 3/5] hwmon: (gpio-fan) Ensure lock is held during set_fan_speed()
Date: Mon, 10 Feb 2025 15:59:31 +0100
Message-Id: <20250210145934.761280-4-alexander.stein@ew.tq-group.com>
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

Instead of just documenting by comment, ensure locking per code.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/hwmon/gpio-fan.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
index b779240328d59..322b161d5ca1f 100644
--- a/drivers/hwmon/gpio-fan.c
+++ b/drivers/hwmon/gpio-fan.c
@@ -124,9 +124,10 @@ static int __get_fan_ctrl(struct gpio_fan_data *fan_data)
 	return ctrl_val;
 }
 
-/* Must be called with fan_data->lock held, except during initialization. */
 static void set_fan_speed(struct gpio_fan_data *fan_data, int speed_index)
 {
+	WARN_ON_ONCE(!mutex_is_locked(&fan_data->lock));
+
 	if (fan_data->speed_index == speed_index)
 		return;
 
-- 
2.34.1

