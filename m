Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2E41DF98D
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 03:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748489988; cv=none; b=g4dLtsPMUAM3nE2enb5sL3WOYfhvUvD1XnuKnWuFJ0ysoy2gmFbqGLXqV6I4K0l4vOXAnuCFbPAD0fFEcf/uegmE/F9RWJcVhm8ulvCCUZ223bALAgwlLUuH3HCTo5xvGVERXO3iahRvA98aQzpjQl8vkfc/E1C0McdDzcjpZZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748489988; c=relaxed/simple;
	bh=aW0RTWdvtM1w6UkkBNYoSa1kspYBY6nDibe+OrzxZuA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tqLqpDO/YS6fPCMeSjix/Ruyb37DrVSaPeWZdWCxkiuNghldKLaMYUWQqi4Yt9n2SuKWcfqdUBDz8020DdfzUOut76oUtOWzhH2BuW79nCKoiUrHqh1QTgvR2gEAahziQJUn/F2DsGnIZkasWsFMjYU2bG4DAWRrKTjtj+sN9og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YokUf0jV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YokUf0jV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748489985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=w1X44SCuPTfj5D1IbAzKgKS5OuFXYEFBS/1q8JBmFyc=;
	b=YokUf0jVANX1qZCgg4EbF3TzC/QLFytJua08aqi+zuuvxWI54yThlaJ5BsXFaMc7TJyaCx
	CsyEZMFNgkcvsTxNEhuNpWeIFLl9HIT4yELVQcoaFcDGqnI56YWvUxiSRn3tBccImITUtH
	SLxH8trHndkOiO5Wbr/wDSQY4O7nEys=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-103-T0tVun3OOLO9Lvygm9M7bQ-1; Wed, 28 May 2025 23:39:44 -0400
X-MC-Unique: T0tVun3OOLO9Lvygm9M7bQ-1
X-Mimecast-MFC-AGG-ID: T0tVun3OOLO9Lvygm9M7bQ_1748489983
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ad8adc22e88so35989266b.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 20:39:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748489983; x=1749094783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w1X44SCuPTfj5D1IbAzKgKS5OuFXYEFBS/1q8JBmFyc=;
        b=DQUFIuBG1uxEdWq+5vH9plX1Yf7S/thCvOpIgQdMB4waXOehKcgaIrhNbWI69fPJ5H
         Rc7/G8xXNNx7C98Lx5G8Zj4uOD5Vkqcfc39We7NZdUcP5iCnhepVZl+7JTwlNrp9GQoC
         oiAOuWrNLfn5TL8wj4mfexsg4DHFVL8XHtGSclLt47nvQ6JdKWbRJqm2c2GrnYLtludA
         WiTkFvf5jHrxLjTibpVGVK50XmpX8E5m/RHuu5DnoVJ7raK1WLqf7KvFU/3pwiPOQBim
         883cgt7yKMpEp4F+FckJWa7/HB06ihA1kACQfi5VunV5v6xJ0jfqSJgu/wW3pW0vst5n
         Uzgw==
X-Forwarded-Encrypted: i=1; AJvYcCWzTX+YN7F+aZ3KbKfwUrmuwNMSphh2tEhvKlevx4D2MqUAmhp48xeY/Ya1gvKzM6/n4EuziirCspePpjI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKFVNeYw3Ha0PTJIWsOmnK1+wM3asOWD5CClxb9fxxEDQaN05H
	guG4/MI0s9sh9dXdr7n+9LisDceyyEXzmlvOJzaiE1S/gAqzC3j6rtXT+UaIO3CbR+KET+Fhzmj
	cgqA1nttnNefdhCfnHJeicAS7WsclQyYLjpOyWc59vwGE0dcX4d0qxk0LCHJogiQtdw==
X-Gm-Gg: ASbGncu/hThO52ZIkmIB5GS4s/c0TVSwefMxGsY10iRk14H8wfwju9xSGllhMp9xt6H
	rD43ztttC+uvQBeDllNk4jpervqhU38plTOs/klzMaZApSy5JfQlHa/XmXwJ8J1Ub6mhw5S7Crh
	XGAVhU0LXoFbkjMUO61t8gkjTFyhDnCIQ4F6jbiw0MCjNad9a5kuDr1qiNHPhoSifV6Q4HxW8U1
	sfrTlU8HmIgrKHrUHKnwbu6uf4Dg07aBsiertAm3/1RFls/6HR62xYZ+t4pWvK//WwFRHWT24Vi
	9C/XFyJE7Id0wOcWO1Fke4ckr7H5zLmm75wzgDP63Xum+CO4LlyNOeTo6A==
X-Received: by 2002:a17:906:9fcc:b0:ad5:10d9:9061 with SMTP id a640c23a62f3a-ad85b2799cdmr1912493566b.54.1748489982852;
        Wed, 28 May 2025 20:39:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGvpqqAZuFEZNhtkIGDjJnONQJ3hQN1ikYduqSMmBqKDYUX8JsBp/1HPjY5wTGLHJ5InFanQ==
X-Received: by 2002:a17:906:9fcc:b0:ad5:10d9:9061 with SMTP id a640c23a62f3a-ad85b2799cdmr1912492266b.54.1748489982516;
        Wed, 28 May 2025 20:39:42 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e01:ef00:b52:2ad9:f357:f709])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5e2beff7sm56525466b.111.2025.05.28.20.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 20:39:41 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Akshay Gupta <akshay.gupta@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
	Guenter Roeck <linux@roeck-us.net>,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] hwmon: clean up Makefile after sbrmi driver movement
Date: Thu, 29 May 2025 05:39:33 +0200
Message-ID: <20250529033933.281845-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit e15658676405 ("hwmon/misc: amd-sbi: Move core sbrmi from hwmon to
misc") removes the config SENSORS_SBRMI, but misses the reference to that
config in the Makefile.

Clean up that obsolete line in the Makefile.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 drivers/hwmon/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 48e5866c0c9a..726ffd9f6a1b 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -196,7 +196,6 @@ obj-$(CONFIG_SENSORS_PWM_FAN)	+= pwm-fan.o
 obj-$(CONFIG_SENSORS_QNAP_MCU_HWMON)	+= qnap-mcu-hwmon.o
 obj-$(CONFIG_SENSORS_RASPBERRYPI_HWMON)	+= raspberrypi-hwmon.o
 obj-$(CONFIG_SENSORS_SBTSI)	+= sbtsi_temp.o
-obj-$(CONFIG_SENSORS_SBRMI)	+= sbrmi.o
 obj-$(CONFIG_SENSORS_SCH56XX_COMMON)+= sch56xx-common.o
 obj-$(CONFIG_SENSORS_SCH5627)	+= sch5627.o
 obj-$(CONFIG_SENSORS_SCH5636)	+= sch5636.o
-- 
2.49.0

