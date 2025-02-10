Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F4223CF08;
	Mon, 10 Feb 2025 15:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739199632; cv=none; b=OD/xPmmCEGHGDiypzLaJ275wC6AoXA8KGFnehhQ2NJ/PSLtd2HG4yH5xv817nnMFrfm4E5ypiLyPzVF5nTIeJ5lDy7VezI6FfMSpa7YLYHoofltB+4HP0GonPStw8O3KaM8S0Tq+2b4uEwMp3IxuYuN7dE5IAHq8DQoIPDH0Tkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739199632; c=relaxed/simple;
	bh=je1TjdH+CB0VhROqa6xoLkzlRwEpMlNFVak/l0NPmXA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ChbT6twkN1KkePL93wmkGAWrrVuA+6ZrqLDQWbw0/8QlQKnoSi71+EKaT8OAbIXFdrF7tIDd88GXbN9fwGQwmGre5GP1gAU7pbEEX5AU1v2xqNvdZz/5EpbEy6Wn5c7JxyomMooY86/dWNnFpye/KLQlTVTW+Nf123j3g6Nyygw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=EXBGQQh6; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Wbyp/UYM reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="EXBGQQh6";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Wbyp/UYM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1739199630; x=1770735630;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SBg5ApdPVMTnLCtCYqyPBq1czt0gte8t4rojP/rLmB4=;
  b=EXBGQQh6hLpTHzTxlv3U9MYbyrJCm+UpzcvnBhDDAb9b7NSp84KD+NmJ
   Ue8THEhqA/FCm6rOR3H471Fw7MrOIGiChkHqeWW/eHyoPAaXDThiycnxL
   T4Dq0WtXufu5Aggv6RyWOVEZZzU+wR/jlFP5kIjrhNzjye1Ft4cfM8IXT
   xnT2/W8Yf4mkf28s6hAVur06UCGTw6Mpz1vTBEE/aoZpRS5N/chtC+zYN
   FDuuBHc3uh6VahNSmCc4jWxM8i+N8MF2oLzzsu93d4KyCNyISpcxHBFhM
   NReHlejcnF24np7aVopuZsmPCYvporF3Np0wC0jsSrL4KGfy1x0n73sZB
   w==;
X-CSE-ConnectionGUID: J1bjCKPkTS2fdFiZJfiRHA==
X-CSE-MsgGUID: Sm0f6sdfRZiFSssiESMyWA==
X-IronPort-AV: E=Sophos;i="6.13,274,1732575600"; 
   d="scan'208";a="41722356"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 10 Feb 2025 16:00:28 +0100
X-CheckPoint: {67AA148C-26-5E7613A6-C613BD02}
X-MAIL-CPID: 994425C9E64636E6E6464E64925E19D0_0
X-Control-Analysis: str=0001.0A006372.67AA148D.0083,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 10773169619;
	Mon, 10 Feb 2025 16:00:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1739199624;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SBg5ApdPVMTnLCtCYqyPBq1czt0gte8t4rojP/rLmB4=;
	b=Wbyp/UYMciCUFlVXWfF4jYLp1od0qyyEcAI8zwXDhxGYV0AuMh+oPFnyqlO9OaLzbvz2Ak
	lbjBnj+0wuzmBEKe2jHPq91sLH/Pvmnq9RRlgJBp4fVsW911ulw490GWRq4lmU4mStb9CD
	qxf+Oz+lKf3CDiqds+KgVr5vnC4rnAC7/AVA12c5elLXBOF6+8f/hw7zzD/ww86+X7plrj
	cxBxh6s1q/23mjlgXtZLg5Yt26vHIUqQKseMBHf+TGV1Bl/7+6EYoelmCmImnxeKHpSNsX
	LYxjy+mZnU9DGTzwzbsYL3OAijqQ/YQ9sqY6U9OrkD64NhmnA59E2BhzfaXWBw==
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
Subject: [PATCH 2/5] hwmon: (gpio-fan) Add missing mutex locks
Date: Mon, 10 Feb 2025 15:59:30 +0100
Message-Id: <20250210145934.761280-3-alexander.stein@ew.tq-group.com>
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

set_fan_speed() is expected to be called with fan_data->lock being locked.
Add locking for proper synchronization.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/hwmon/gpio-fan.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
index d92c536be9af7..b779240328d59 100644
--- a/drivers/hwmon/gpio-fan.c
+++ b/drivers/hwmon/gpio-fan.c
@@ -393,7 +393,12 @@ static int gpio_fan_set_cur_state(struct thermal_cooling_device *cdev,
 	if (state >= fan_data->num_speed)
 		return -EINVAL;
 
+	mutex_lock(&fan_data->lock);
+
 	set_fan_speed(fan_data, state);
+
+	mutex_unlock(&fan_data->lock);
+
 	return 0;
 }
 
@@ -489,7 +494,11 @@ MODULE_DEVICE_TABLE(of, of_gpio_fan_match);
 
 static void gpio_fan_stop(void *data)
 {
+	struct gpio_fan_data *fan_data = data;
+
+	mutex_lock(&fan_data->lock);
 	set_fan_speed(data, 0);
+	mutex_unlock(&fan_data->lock);
 }
 
 static int gpio_fan_probe(struct platform_device *pdev)
@@ -562,7 +571,9 @@ static int gpio_fan_suspend(struct device *dev)
 
 	if (fan_data->gpios) {
 		fan_data->resume_speed = fan_data->speed_index;
+		mutex_lock(&fan_data->lock);
 		set_fan_speed(fan_data, 0);
+		mutex_unlock(&fan_data->lock);
 	}
 
 	return 0;
@@ -572,8 +583,11 @@ static int gpio_fan_resume(struct device *dev)
 {
 	struct gpio_fan_data *fan_data = dev_get_drvdata(dev);
 
-	if (fan_data->gpios)
+	if (fan_data->gpios) {
+		mutex_lock(&fan_data->lock);
 		set_fan_speed(fan_data, fan_data->resume_speed);
+		mutex_unlock(&fan_data->lock);
+	}
 
 	return 0;
 }
-- 
2.34.1

