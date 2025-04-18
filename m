Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5234421C9E4
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 17:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744997703; cv=none; b=AJKqww7HETbcmlP3P0SRUQMFqPXFGorwbzZwN9VS4blR+9ywD5bIHv5KKisgE6fLMgfWNr89kPHoYSOR9Iq6iwFJuBNJIGqOnmH63yHFoFtm2UNdtYDcNmtJ8bSdzJBzpMrlWYbg85l/6PK6CpYlHD90APFibP0Hn8+auli50jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744997703; c=relaxed/simple;
	bh=+WmW+6HPnaBorUvAq2/XnG6ifzmTnOmW9gIoOcNOA1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UKePbcRfmyiB1P6OI4IZQah3g5l3wN+SJ+o5iwSxKz6wxvASUIjDLwhnOg8NSXfBXCumuRk6TbPVYEbVhtkg4PsqCNRhO4Q4fQ/e1S9FEexbFO2fMOkUiXVRbA7mYI5h4oXb5kkKhfHuaPavvEq9ji9IrUX0oY3ROUSJ0znd1m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XepX7aXy; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XepX7aXy"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so23761705e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 10:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744997700; x=1745602500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ZEqkL8XJqU+TI/zwsYZcQCUdyQHjs1e4Dkw85FOadI=;
        b=XepX7aXy+v4mfv8AW4kTHq5+cg50JFwEDKg9FvGoFjRTiGb3bNBuQZKdLRZEZVmxH2
         IPM2FxIjyTlCuOMwPNYY+Tmg+oXEZfLENmBYag9Wd8iJExKvO2WqBlIrCVWCw0+3Tn5d
         IrykyefhVxsAsk5RY62vqpwarF2+VTD8aqhZiG9L9x+98OEmhBB2E85Rk6VXTR8bt2vh
         ozCU2LdBfSZsoUccW7fPignLWwe4xM8MKKBx9h6LT2EapzMyjhgVJjVHV+aIIxF+imZN
         7thGQ4coQBTieJCNqUC2jh1855vl/7k20tzYANkdwOnqz1/oehkk8jjkh73L8499FgQX
         Udjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744997700; x=1745602500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ZEqkL8XJqU+TI/zwsYZcQCUdyQHjs1e4Dkw85FOadI=;
        b=LRinjkvmpSJwlXtEUVgNr/jSw0BgKwSyFNSfwK54fyXlxE2bmc2bF4THgP86kuLlYg
         q4ExNhLXAutoVhjw6uQMe/QMPu+isjw3rSG4r7tKxhdITFTOFd1J7sd0GwEbWcFJxwYq
         tpSh0Z0AgzDQk+8GWLrFJ2ipQ3mrbM9PoJ82FXW0UNP/J/fGaqFU0Im/oGmE9k8vDJNo
         EXJ9PR3BYIExQwtlW4/dz/skdBNNP+PcUqiNPjXNmZtaKjQ3AmJnAXASFjW/aOXDMDds
         HFLtNT1DX2gkPQi9rePXRqNo6bUHWpEIssmpJgaNHOCVDemSXMeURnyr6go6IgeYxqPK
         y4QA==
X-Forwarded-Encrypted: i=1; AJvYcCV6eJbQUAY1PSGwc28IaWtNz2eZhpxJBxv1ZAH5ZPwkBcXlAO+l1EnZqq4MJntI91kB8+gfu+FIIKAld/Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwARtLqkzm9b7SDe+v6vJzVedfzxcfUo9ZSw6v6xzvGugh+eini
	vSZV2/o/o6AkItseL0Mx+lgPFypPu1RUjZ6kEQUsHMIK249Zq78RTSj9ZQCe
X-Gm-Gg: ASbGnculkDWl17Y8p5uQCOLWt1a+Ex79yqT2/54G//EujWNtU77Ix5s4qIN6O9WdxTK
	3mxpZ2KSe/wjAWx7YmMLac4Os5fsx1uFujXRF0pw4+WJ6XRfhpGlFt1uyNExn1keHn+BSD+f4cD
	LjT/7bAlNWM0pDqSLCs2mGmOr3q4L9ePR7kPh92ll0XIb6khR0wW0dsIB89JuQfpVLh/wkY/lMo
	kYJDLAjgBXeNp6Cr7X+loqBgsHZl4JCx3NUKUarSL0epAVo6dEwkXiRQNjVstVipt3aMbmL0x2j
	cTUHNJN+ram1P67vXzxkRvrBumgPLSMQOFWKoAhBG0sDozYkUE8i7cSnCrTAJn18BqBW4aBvg9C
	a
X-Google-Smtp-Source: AGHT+IFSe4AzT6s51bwigohequdK5BUemML8iVqbH7ehZkk5hrV4pgmN0v+Fey9j138PiYxkJ/eRCA==
X-Received: by 2002:a05:6000:1449:b0:390:f116:d220 with SMTP id ffacd0b85a97d-39efbd6a39dmr2452869f8f.17.1744997699538;
        Fri, 18 Apr 2025 10:34:59 -0700 (PDT)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4332f8sm3287320f8f.40.2025.04.18.10.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 10:34:58 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: marcello.carla@gmx.com,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 4/8] staging: gpib: Remove dependency on LED subsystem
Date: Fri, 18 Apr 2025 19:34:30 +0200
Message-ID: <20250418173434.2892-5-dpenkler@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418173434.2892-1-dpenkler@gmail.com>
References: <20250418173434.2892-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The yoga pin map is compatible with the others so that its led
can be used as the activity led. Using the LED subsytem required
adding a dtoverlay to the boot config as well as setting up the
activity led via sysfs. To simplify the setup we remove the
dependency on the LED subsystem and use the on board led as for
the other pin maps.

Tested-by: Dave Penkler <dpenkler@gmail.com>
Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/gpio/gpib_bitbang.c | 23 ++++++-----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
index ac9ecb6e0aad..caa8361da696 100644
--- a/drivers/staging/gpib/gpio/gpib_bitbang.c
+++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
@@ -66,7 +66,6 @@
 #include <linux/gpio/machine.h>
 #include <linux/gpio.h>
 #include <linux/irq.h>
-#include <linux/leds.h>
 
 static int sn7516x_used = 1, sn7516x;
 module_param(sn7516x_used, int, 0660);
@@ -136,19 +135,14 @@ enum lines_t {
 #define SN7516X_PINS 4
 #define NUM_PINS (GPIB_PINS + SN7516X_PINS)
 
-DEFINE_LED_TRIGGER(ledtrig_gpib);
-#define ACT_LED_ON do {							\
+#define ACT_LED_ON do {						\
 		if (ACT_LED)					\
-			gpiod_direction_output(ACT_LED, 1);		\
-		else							\
-			led_trigger_event(ledtrig_gpib, LED_FULL); }	\
-	while (0)
-#define ACT_LED_OFF do {						\
+			gpiod_direction_output(ACT_LED, 1);	\
+	} while (0)
+#define ACT_LED_OFF do {					\
 		if (ACT_LED)					\
-			gpiod_direction_output(ACT_LED, 0);		\
-		else							\
-			led_trigger_event(ledtrig_gpib, LED_OFF); }	\
-	while (0)
+			gpiod_direction_output(ACT_LED, 0);	\
+	} while (0)
 
 static struct gpio_desc *all_descriptors[GPIB_PINS + SN7516X_PINS];
 
@@ -1180,8 +1174,6 @@ static int allocate_gpios(struct gpib_board *board)
 	}
 	if (lookup_table)
 		gpiod_remove_lookup_table(lookup_table);
-	// Initialize LED trigger
-	led_trigger_register_simple("gpib", &ledtrig_gpib);
 	return retval;
 }
 
@@ -1193,8 +1185,6 @@ static void bb_detach(struct gpib_board *board)
 	if (!board->private_data)
 		return;
 
-	led_trigger_unregister_simple(ledtrig_gpib);
-
 	bb_free_irq(board, &priv->irq_DAV, NAME "_DAV");
 	bb_free_irq(board, &priv->irq_NRFD, NAME "_NRFD");
 	bb_free_irq(board, &priv->irq_NDAC, NAME "_NDAC");
@@ -1254,7 +1244,6 @@ static int bb_attach(struct gpib_board *board, const struct gpib_board_config *c
 		gpios_vector[&(D06) - &all_descriptors[0]] = YOGA_D06_pin_nr;
 		gpios_vector[&(PE)  - &all_descriptors[0]] = -1;
 		gpios_vector[&(DC)  - &all_descriptors[0]] = -1;
-		gpios_vector[&(ACT_LED)	 - &all_descriptors[0]] = -1;
 	} else {
 		dev_err(board->gpib_dev, "Unrecognized pin map %s\n", pin_map);
 		goto bb_attach_fail;
-- 
2.49.0

