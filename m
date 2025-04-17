Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CE3192D83
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744849973; cv=none; b=cqyzlaQmH2e3qXtOvGOo1wCTTYBroEdQOkH57BKwgbIRcJv7Jzd4EROkxx0QlEtWQ3i+WHp8uacgemKMqus7pTMeR4V264IVXZ8B2XmojnEj5INjVl2BO81xbawveYUaLx9TY/Onah9bHfPhP31oMlLlsP0vo/NhLlC1JhdrbEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744849973; c=relaxed/simple;
	bh=TRUv0Lx9qIYRkHYXYiephf2tTbsRuyIpmQ7XTHKKyrU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W+UIpJz1HY3pIgeTYlKengC2ogYLj3QBEGtlc0BvESAL2qpyRDxH8A1s2mipBQLaCXdiLAoveqGUFy6E38P3f3qWhrR2wZEVDoK+iEiN2eD/AZJXLrphcSX84N9yb/4jP9Z2IFRTlBQNiD/ltp/uY04ii9RreI9h7voKcufCRXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=AVgQWXU7; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="AVgQWXU7"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7376dd56eccso197678b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 17:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744849971; x=1745454771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dsbToqR2eAba/23hpGloCvJcl86xogM+KUwP2i6K5Dw=;
        b=AVgQWXU7xuJ/p5gFQklt96uPyfY7F4aSCebvtni59O6LIEbNyrbT5An6r1WXW0mVx/
         qwQOkjTtXO4FjMm3PfjjdLEPDCOIN0z6KB/YxIoxnRFbHJEoTPh5amX2kaVMHabmPClb
         Z0lpM+fw3iF7OZBdQkDT8GbHqJOKl5xU4+ImsyOzEIGAUAuSXXbgduyAoLWFB1uUMTAS
         sj8sEZb1F1FF5TYdsnyCMnu7mV6nMaJUrVn8avNul7fEk7NqnELbTuRX75y6+Tp6vCAr
         0cmQOSF1yb8XWc45pp9/BP3UdYvhmBJ1qj8uiknEN7Yroujc2ksPReQ5YHThkaRmR8h0
         AkNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744849971; x=1745454771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dsbToqR2eAba/23hpGloCvJcl86xogM+KUwP2i6K5Dw=;
        b=IV8o0Pm5fnp0orCS0IjXxQjdTYsmkiGsPSYxfKb/+7MXCxAVbCGYQqcE5SHJO5lQru
         SN/U6YaHmu1GsQ3+Y5ZQiz1jZ85ZD0ZuBaN1hh3axK+lF56TKpIAWbEs1Jj+8YYidAJj
         GuN+sheSG6Hg7WjTfpPNZjyeo7bXp6KZ+btwJjAIpX8XhWgyI+BJZjYEz4HTtE/I9mwL
         J87CR7reGSxv+TcbofPTf7W+E+p/t8PthExYprehm9MUlFkzEnelmW0IHlZBYG68lDQK
         zq7dni48lpjUgCDTY8Cy7H87kI4nNvM7SHdLDU+ffeZlNZpsGBdwjPy46Y7V/oHTqwCh
         xcbQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+uAbb4KxnXv/p4Ib9mN/Rl1VLaa7UjWtx/QnT62KtC8IG6IR7C2Lco9LrwPbBh9ogJhknHDEcGlvKEk0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwO2ACMxiu4x6/VcffmzaP5eVn7JR/e3tyeVt/UAeNL6IqH9xYZ
	4eOG/3YLBEXOmzY72yqYANK2pC6A2TSUvyh9hHrwpUpKc44LhDTJ46AGxF5y6CQmsm+UjVBFen4
	=
X-Gm-Gg: ASbGncsbjXr3eAE5AYwRQ4D3EzYFrKGBQeQ7eH1wQn3E60zWO8RWWs+yfOXq4QNpNgK
	s+BHsHPhHRonfX0enTiSVXAs/7WkCl/uxydGbb07hS6RkcBeUUx5znoqKGlWNEpOwbGuAnyrymG
	ZtKZrfa4yxifAvr8hshq6cqHN9iE/zmNSZd+FFOJJvv15a5y45nWgLQSbXHmC2biMX/xECHMyYW
	RujnG1MZM28ewljlx5xSnDgjJtI9yDyv3zpU0EOUF4Dw/TZybS+7ec4Pu3sM/TSg7ACIyjMvoQo
	MqFlOLXbpgEfUHI0tUaS2f/t/DnhsdJrXQ6SiQrB9lcgb1ibEScaklK6ztgVhnBG3u6dJy+PmWF
	SypM8rA==
X-Google-Smtp-Source: AGHT+IEzGyc78qt3I2Ea9h/ua6Bmt+3aTG77DQd6AZy/bfiPA5+q0GqkntNar2iof23jKJEGMNEiZw==
X-Received: by 2002:a05:6a00:aa8d:b0:736:5dc6:a14f with SMTP id d2e1a72fcca58-73c267f5570mr5754297b3a.23.1744849971084;
        Wed, 16 Apr 2025 17:32:51 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0b2221f01fsm1875561a12.74.2025.04.16.17.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:32:50 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v3 02/18] staging: gpib: agilent_82350b: gpib_interface
Date: Thu, 17 Apr 2025 00:32:30 +0000
Message-ID: <20250417003246.84445-3-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417003246.84445-1-matchstick@neverthere.org>
References: <20250417003246.84445-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_interface.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/agilent_82350b/agilent_82350b.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
index 97717afbb214..901f7182502b 100644
--- a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
+++ b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
@@ -773,7 +773,7 @@ static void agilent_82350b_detach(struct gpib_board *board)
 	agilent_82350b_free_private(board);
 }
 
-static gpib_interface_t agilent_82350b_unaccel_interface = {
+static struct gpib_interface agilent_82350b_unaccel_interface = {
 	.name = "agilent_82350b_unaccel",
 	.attach = agilent_82350b_unaccel_attach,
 	.detach = agilent_82350b_detach,
@@ -801,7 +801,7 @@ static gpib_interface_t agilent_82350b_unaccel_interface = {
 	.return_to_local = agilent_82350b_return_to_local,
 };
 
-static gpib_interface_t agilent_82350b_interface = {
+static struct gpib_interface agilent_82350b_interface = {
 	.name = "agilent_82350b",
 	.attach = agilent_82350b_accel_attach,
 	.detach = agilent_82350b_detach,
-- 
2.43.0

