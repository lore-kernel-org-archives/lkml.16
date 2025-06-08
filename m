Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377301373;
	Sun,  8 Jun 2025 18:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749408365; cv=none; b=RvKnljOeFGJOqoi4y/YaI9QB40cv2cceD15TuKPM7Je5R3W7PKMvg101wnMkX/2z8JUSz97ZZBoiyVnJMY4mbdt0/zukzO6Hb7akWSVaxgPqAQfOiws3SQkAKRiF4EixOYwQpOXv587SNLrUcuInjwrTjkahOoZkJhGbZ8fNPKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749408365; c=relaxed/simple;
	bh=Qs6+HE89AUgmyAavkV7HuAS3JlNL54D/qBhAGlU+hDs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u0rK8Z8/IR/8ulCFmKOFloZOIhReZ0IHnlqLY32m2ekOf8jJiP1QnxWgL9kZmLwVaiWUq8VtiEzXHAGKb8hzEu78h6PloxeS8LNZNJmBFHwqvaVxkQ793as4QM9aFKqdlDPSZ4yD49V65zuIuwaAdDb04q5GzXG/A+KrG3mUHpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mqPQASrM; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mqPQASrM"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a4ef2c2ef3so3077661f8f.2;
        Sun, 08 Jun 2025 11:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749408362; x=1750013162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CDenIljNSTVSHWuGkdw4tF8oL0H0P+4SvxvPT0+Mmn8=;
        b=mqPQASrMn0oDfkpbxi3mkxvMmOwcBlq/Lpo2jS2Wb28NDRS3ff15byZWO+HBGeL+Vr
         5iNM3gU0nzEiqdOW618NCJR3XuBgm5XggyQ0zn9SGJEG69sdLQl9+ikDxFeLPu9oRGnL
         m4usTtZHmoRugQtkxIKdrCj3Em0PK2wn4w8FEeicJdCCn4tH97kmBoCTD+FFiEzCXrWc
         Gge8XEhBtK23tUnDKy55T8xSUoaJPoDyR8EBw/fOxKNUm5Y/i2v8PZORxg9ymTL0B8pz
         KaXZsaTnjdrLMtIyhmvaZ2X+Cub70wxadEonN9koCGz4tSZrCVi46vqHchTRuKCNXjel
         375w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749408362; x=1750013162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CDenIljNSTVSHWuGkdw4tF8oL0H0P+4SvxvPT0+Mmn8=;
        b=MvrAlpY5Ibhk78i5UalBlxnyIyCrVfquhvo/OVdz4qMvuaixWX8rkGywETjrT+ddru
         r8FuBofUnPVVWxnE38T67eEVdGZx8aw8iIE5O5KWnZgbzFqGWUrt4TfzB0W7mneJEiTH
         tqXGIU9vAgwf4xy4hh3k+6I/fpMnpxloiAHlPLCfwe33TGL9T+3lwWBu39UNCMWsBvCO
         JlT9kOddC0oxIyxJQwwaMLXNgeCG0I9pG3BL2oU+U+aiZb0LsCMC8X+hwCANwWeKBLTr
         Jq7MacfHhTyo7/zBCUzEZ6RQtP3fc84eta+ozY7/tOPXnYrOLU4sQPO39a/s9kFzIe+x
         ymbw==
X-Forwarded-Encrypted: i=1; AJvYcCW+1PvsH7PD7WAGwTbwtqOFjgrhpWy/spauNy2Odkc8LE0iTJ4jdwbUjI7m2U/f8N31diwofN3+Vlyq@vger.kernel.org
X-Gm-Message-State: AOJu0YwDNJFLUMgDHGGxLZ5DqzNcA+9UMvYQ4VIHhAUYZZgzN60BpX/r
	NhLtKmOzD3ZKSUz0mZfIRY8gUkCGZgmzow5GHoT2n3JrDVBmxs8y20FoeC/1o5zc
X-Gm-Gg: ASbGncv20Z125uSXCSp4/vyQNMuipaQz+jPrgv3Y1awShB5D//gOknnj1DQVwu/vXur
	lAMHRm8an0K+mr7E2H+nRLWZS7M4fnARlNgDgGGBDg440h2n4KKQOsbifj0knrZV2r6q6MnHQ4K
	cE9HN0plCJnAplRo37ET17zK1Teuxb4IppzM0s6dd67tZRtU495w+kLKr8Qq7GnPShUUuAcVOgT
	rLP4b0NSlPP0me3QghDgGe4iRQ3qtBUAxMyDOhAuRIE7lovdioX1AF8QpG+7TVJ8s2d/8iuencj
	Cq3zJvupn8xGM8ga3+Uk3jtdiZ/1t8weLeXjIxhNiWBN46E5rdzAXjOyOfGz6yXffYZlsQ8Lwhm
	Xja0IpJZEHq4R0ZWf+czdDTEX
X-Google-Smtp-Source: AGHT+IHCtGPfKczA/GlmJA89eJ/9KAvZ/o+z5gIzz0lAOOr8ivEFbvRnTl6W8h/FpOszEGG+Dg9xVw==
X-Received: by 2002:a5d:5f4e:0:b0:3a5:1c0d:85e8 with SMTP id ffacd0b85a97d-3a531ca9955mr8566031f8f.22.1749408362143;
        Sun, 08 Jun 2025 11:46:02 -0700 (PDT)
Received: from masalkhi.. (ip-109-43-113-112.web.vodafone.de. [109.43.113.112])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5324361ffsm7621418f8f.47.2025.06.08.11.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 11:46:01 -0700 (PDT)
From: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: arnd@arndb.de,
	gregkh@linuxfoundation.org,
	W_Armin@gmx.de,
	luoyifan@cmss.chinamobile.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	abd.masalkhi@gmail.com
Subject: [PATCH v4 0/3] Add support for STMicroelectronics M24LR EEPROM/NFC chips
Date: Sun,  8 Jun 2025 18:27:11 +0000
Message-ID: <20250608182714.3359441-1-abd.masalkhi@gmail.com>
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
 drivers/misc/eeprom/m24lr.c                   | 653 ++++++++++++++++++
 5 files changed, 824 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-i2c-devices-m24lr
 create mode 100644 Documentation/devicetree/bindings/eeprom/st,m24lr.yaml
 create mode 100644 drivers/misc/eeprom/m24lr.c

-- 
2.43.0

