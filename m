Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDF117BCE;
	Sun,  6 Jul 2025 10:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751799213; cv=none; b=uhj8g3HCERy/7gaYP8ikSheyQ6onvEkLwiw+2Cm0Df3duNnEDUbiJRCDtzKJSHAOhEFMh6wXcBiNQ1WbKCKM5RljZTIddK3UJVI5aX7ezomnQDHWBmx5ixukeh3U24XHMcfc0gCoHPx71byNnXXxbzoheMJcwgat2M5/mpBBdAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751799213; c=relaxed/simple;
	bh=hO91axIELC89D5o2swhCKNlygBueJYLWBNu0MZg03oQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b70lFfhOpuyKVoXSeVzM0A1GOjU5IuCyAF0pJzvOruHbODS3X+THZryNHsooDEdRzS7cyWIZ4kwytF8QNxKVU01ovJtEFtzxl/a+PczXGj9MICdZ1hgsr58XWm3EfO+mi/hUlXRb+TfHSgnKgjDDZF6kmvAkBe94v+YXAFmIO5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KGp/Wq4D; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KGp/Wq4D"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a4f72cba73so2054345f8f.1;
        Sun, 06 Jul 2025 03:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751799210; x=1752404010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rl5aIDFBl7BfHLUk8Y1FaZt5D9KfnVPhh08Fkw39vp8=;
        b=KGp/Wq4DKHaXO86Leg/ifGzLh1zg+XQeTDA1Iahr5rtGlUGFy1gaGAiW3RV7x1SUIz
         GYb3qojfhSBxEmIVduR5rTc/fKVXfV+bIP8CFGKW3azxEuFfi8myxAtTCbvVJ+Cp1v9B
         fs6n1GWVnlFFvLt3ZahEdkYtb5bU4GLjRA8CgbO3TMUb471n1Qy2bT+c/J64FJptF1Cz
         aAZAY5zhpUV4lzIVjIZx/BWGrkoUNo+HrTJnzEu4rcxKfgjk1bpOfBDtxQLa44SynXjR
         vgZo9Eesibe6lU1qlhw8jmLzD7sL5CHC1OkBnq8PhtCabU8ElTXjKh8eYTIvhYbf5ftn
         wzYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751799210; x=1752404010;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rl5aIDFBl7BfHLUk8Y1FaZt5D9KfnVPhh08Fkw39vp8=;
        b=vDcQfASAjcgH90mVNQLyJMy9budwjqtSzGkDYY+mgr7cQCuwBMZuTjmInWHCOTeuI6
         HSiYoWAobZOvjikJ/wJgrpQPwt/n+K2lZk+PkkuCsLI3T0OMyBc2OFUk55H+2HlVS27e
         HE+R8wSGxyhcaQxtzZtelsnzIp8s8iXsOIpXXMLnEx7ai9KhBVz6KYU9ccl6yvggxfgl
         Eh79WZXsAcwYthn2gzLVoHDFHBZHzmmf5Kd70fHvLNxc0Uzgux6ClGUEMitz83Su8pVF
         boZDYFy3RRb5hMrd8CxUvYcDZIuwYYqIsMwpG0VROBBw+H0dqa8TfxGHARv4DZk+wD3Z
         SNYw==
X-Forwarded-Encrypted: i=1; AJvYcCVcMW7nh6Wk8NXqAD6+yLTo22F/+vBQWC6xfGp8/rjlORh910eh0Y2/0zJgSya5XUP+YvZNxq/VBWHVO3Ku@vger.kernel.org, AJvYcCXN6ifh4L8JlHMy9jUPtOG2MjmUu93Lcit0MqKqlPDizrLUbpu1I5/AU3IybNzuBS6MnhPyTEConZ5m@vger.kernel.org
X-Gm-Message-State: AOJu0YziuJ1nLFbPTbHHAOaND8FFwXnh2bDtJQucfAY+C3rFadrCiZMv
	c9eCSCN+L/+icaqJm9+Q+ck0bDVJeoD91W8cdLcu0OvbiUNQ/y5aovio
X-Gm-Gg: ASbGncuMEfMsC+Igs4bZibdlmqU6Jb+qAmypIa/9lmhU1Z6QM8nTnXcBY/i5jt8NYGV
	foULa6pQQ6HqCNrv5uQrJ5rGpy/CkX5FCkOKamzamt89BPom7PPvO61sNXekypavToZeYlLGfkk
	C85jsZlPAZ1DfX04mHXVKjCEUKO9bdJ+CbaA7JRwnfKF5t4cLVel86lG7HLrzzUaHXmh4LxRomV
	5qVKJIQaoqCSbpLMX8NY1UH6+WFpnoH2H400B1x3WfRRJjfIc+/PczuLG1ZR7GkrbaPYom2EUwa
	E0HFTtql47IWKZJvHYW2UiTN5Lyb7Fx/nLNdtErQwHgQ0O6idKUWwwSkbNx2eGAo1G8uLLRaFRD
	l5/8rtjSatMNx3sBIJQ==
X-Google-Smtp-Source: AGHT+IEQPZxKSHEU6v6YjdCk3jMRA9LfzHcP+l2NaDcRx2syaWwk1uY2E6C4p46eeU1lYX6rRjeJIw==
X-Received: by 2002:a05:600c:56cb:b0:440:69f5:f179 with SMTP id 5b1f17b1804b1-454b1f4fb49mr62520655e9.7.1751799210219;
        Sun, 06 Jul 2025 03:53:30 -0700 (PDT)
Received: from masalkhi.. (pd907d170.dip0.t-ipconnect.de. [217.7.209.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b1634147sm80283985e9.18.2025.07.06.03.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 03:53:29 -0700 (PDT)
From: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
To: arnd@arndb.de,
	gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org
Cc: conor+dt@kernel.org,
	luoyifan@cmss.chinamobile.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	christophe.jaillet@wanadoo.fr,
	abd.masalkhi@gmail.com
Subject: [PATCH v6 0/3] Add support for STMicroelectronics M24LR EEPROM/NFC chips
Date: Sun,  6 Jul 2025 10:53:08 +0000
Message-ID: <20250706105311.395162-1-abd.masalkhi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the STMicroelectronics M24LR series
RFID/NFC EEPROM devices. These chips expose two I2C addresses: the primary
one provides access to system control and configuration registers, while
the secondary address is used for EEPROM access.

The driver implements both functionalities:
 - A sysfs-based interface for the control and system parameter registers.
 - EEPROM access via the nvmem subsystem using a secondary I2C dummy
   client.

Tested on: M24LR04E-R using Yocto on Raspberry Pi 4

Signed-off-by: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>

Abd-Alrhman Masalkhi (3):
  dt-bindings: eeprom: Add ST M24LR support
  eeprom: add driver for ST M24LR series RFID/NFC EEPROM chips
  ABI: sysfs: add documentation for ST M24LR EEPROM and control
    interface

 .../ABI/testing/sysfs-bus-i2c-devices-m24lr   | 100 +++
 .../devicetree/bindings/eeprom/st,m24lr.yaml  |  52 ++
 drivers/misc/eeprom/Kconfig                   |  18 +
 drivers/misc/eeprom/Makefile                  |   1 +
 drivers/misc/eeprom/m24lr.c                   | 662 ++++++++++++++++++
 5 files changed, 833 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-i2c-devices-m24lr
 create mode 100644 Documentation/devicetree/bindings/eeprom/st,m24lr.yaml
 create mode 100644 drivers/misc/eeprom/m24lr.c

-- 
2.43.0

