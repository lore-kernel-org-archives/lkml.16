Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C839C1B95B;
	Tue,  1 Jul 2025 18:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751393554; cv=none; b=eI37P7wd/q3da9qAWf444PcUhX//sgmnGQRuggLX+VhtOzwwqiHTmkE9GsHsrr7E9Jmqt/e3q/PZizfjZXVwAwoqkO2hMmXg5wgG4jc2PMvgfdnK4Ie7/gKAT30wAllVR8WTLtMcIr/yzABHaIK3YgddhsM0Mfz0hdxFiOd3ExE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751393554; c=relaxed/simple;
	bh=vPdDw4+jfgMBRX4Zg3ldNNAMXh3qYFeQt9oHABh4FpY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Nd0zzeuJ4OktLhg/4mug/EW3RiBUw8HwTTWxZS34Sckz+XK5kzX9EbxeSnf6QMIM43tqi3y9MpsHNlDgYBZtIPcruOAimFpdHCKV7Qtbtb8mZugEN6mlzNCKJ9yAxRTFi61u/s8srqQz112Ohv5IJyYWZj3beyePRhXtCixgef0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ktt9TMQj; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ktt9TMQj"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a4fd1ba177so3928941f8f.0;
        Tue, 01 Jul 2025 11:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751393551; x=1751998351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zQB5x2vN7q8tn4LouU0pkBvnGCkqaf3TIFn5zEbprfs=;
        b=Ktt9TMQjE5maEcIMQXXZhWo/Pn4/yhYyPOjNnMLcD+yMzUJgReqpuh153TP0Yhjcn3
         JUBuKfp51Aisnvi3IBpJTJ0gTz8vQmHRLsQU0rJBUWT24CAS++jJOAVCdOIbvOKMkWIf
         2XsaQUPwJkqjglrT3sscp262qBaP+cclot6b3APi5ptfchK+ihAaj4Ctb0SrGgKIimsA
         8W7ZbTYkb6yn/eTfRVJLbZNWQMyO3kG7vl32w0Gf1+9LfQC+WwMCrrxXwU0/4aae6iVe
         kLRGunfF5+nMjZUPa7qAZZJNiXgvcMFmKTUxWwiTnvBD/fgQBjwoZJArXTRJNid4I46V
         orxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751393551; x=1751998351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zQB5x2vN7q8tn4LouU0pkBvnGCkqaf3TIFn5zEbprfs=;
        b=p6LhWA0f9saOS31RjNkFKcUtVwdxMXntdUzCeIFBiA/s3DLxkzzihmXiVAxnr7vDkp
         h5jC9Evpg16uSAFCOYhzWYOzJWHWbWOjwWXcCqZTejjjanb0PUGzZjdPvuZ7xuElEYgC
         SRuROcGkgObFUGOS9AVLSrBkToJd4QBLRiR1qlQ4QvPJscN6BsM/NjPg8Ze7RHQkwpbT
         TK3JEYhU4h7X46awSS7iti8POlWdAr2RGS6WMGBcvhEyqI4b/4RbzDxncWyyNAtCXq3k
         8B2p118ONDXUqpxDmrGKrG+ej6SodB343tQNC0R1NntAETbdgqo2rRr9S33jgGrbX3t9
         cLew==
X-Forwarded-Encrypted: i=1; AJvYcCVrLJyld9XZlgUcGKt71rBeAn6C6ecZoHXCzjzjeEyxriWmmw6yF5b4pttJ7Zj5Doc5wlSXMUETQFTiJ6DZ@vger.kernel.org, AJvYcCW1ZCG9xdljdsUptHrjEYK7Mh4c+4qHsI4bxLHBxJxrWWecqIigeaIIk9hsjjXYSGDWC1g2O/+yNwcP@vger.kernel.org, AJvYcCWBCcp3S+SBW53D557isq05fiYpdLfL9AfKc9R53oSgV5jD73uTLObOkSkKj14n+jS5A47ENwJGpd6Z@vger.kernel.org, AJvYcCXJFIGyx+eOj0VHB7rUt+awgTh5JoEOfcnltjN/lxBdHv/coXe+6ceXyMYlEvp5m53EZbopkqB7Finklh8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHIt2OZ+OmDadmz6TAG0IA8XO7hWdunNbbHeZR5hxJkXuvJJ+v
	OSrN0DokbkX075ClbDdw2x+FNOH560oxlgk+Eu8eNbki6HdqVbFkqwgf
X-Gm-Gg: ASbGncvGQp+1TYW6Az6kKJF1okvFys5fq+cb19JUVEqyRzMe4lNLFpplfdAyCB3yjYC
	V5yUf+sFifEYFwoOdBWe3gY7ypNhRmvusGDkGCoF+rluWADoemBBCt0XjXYCPYMX6T1KqPm0k7Q
	R1fcgrVjshePEFDFsjvnePM8YpA0kig1b+OqrkGLfwJ8SdKL0rPBbYs7PoJOlIEmgBMLkInN+8V
	Ud2bqBhl4fNyw747Rp7XlxIJ5MMWO6Y0+3G0OBYnr1hjvtW+gkLszgOBjJ7gK8bBnJEKj5f0xc9
	Qbr96ZqJzEF0+lcWpKTwWTeyMqsssn+DjMqBJdSASvs0mIqPKEwy6fOPGWwpCO6IvB1F/2OmRu4
	G8BgxsbM69sXJ4E7SJImbkGIZ1X7H3F6IX58nYMjVINFd0Pfjxo9sEbJsaC/JkHA=
X-Google-Smtp-Source: AGHT+IGdCIENlA91xI3nrqHzY3rilDywr5Ff5lEAua+x0O1AbOS2pGWoTXe6GaIPdBPyuIQ8Cgaeug==
X-Received: by 2002:a05:6000:40cd:b0:3a4:f70e:bc25 with SMTP id ffacd0b85a97d-3b1cff1caaemr73316f8f.27.1751393550826;
        Tue, 01 Jul 2025 11:12:30 -0700 (PDT)
Received: from skynet.lan (2a02-9142-4580-2e00-0000-0000-0000-0008.red-2a02-914.customerbaf.ipv6.rima-tde.net. [2a02:9142:4580:2e00::8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7fa54dsm13707437f8f.23.2025.07.01.11.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 11:12:30 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
Subject: [PATCH v2 0/3] hwmon: add Microchip EMC2101 driver
Date: Tue,  1 Jul 2025 20:12:25 +0200
Message-Id: <20250701181228.1196102-1-noltari@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Microchip EMC2101 is a SMBus 2.0 fan controller with temperature
monitoring.

It supports up to 1 fan, 1 internal temperature sensor, 1 external
temperature sensor and an 8 entry look up table to create a
programmable temperature response.

v2: multiple improvements:
 - add emc2101.rst to index.rst.
 - add missing documentation properties.
  - Remove FAN_RPM_MIN definition.
  - Rename FAN_FALSE_READ to FAN_MIN_READ.
  - pwm_auto_point_temp_hyst_store(): simplify function.
  - emc2101_fan_min_read(): add missing FAN_MIN_READ condition.
  - emc2101_fan_min_write(): fix tach_count calculation.
  - emc2101_init(): fix REG_TACH_MIN value.

Álvaro Fernández Rojas (3):
  docs: hwmon: add emc2101.rst to docs
  dt-bindings: hwmon: Add Microchip EMC2101 support
  drivers: hwmon: add EMC2101 driver

 .../bindings/hwmon/microchip,emc2101.yaml     |   79 +
 Documentation/hwmon/emc2101.rst               |   61 +
 Documentation/hwmon/index.rst                 |    1 +
 drivers/hwmon/Kconfig                         |   10 +
 drivers/hwmon/Makefile                        |    1 +
 drivers/hwmon/emc2101.c                       | 2175 +++++++++++++++++
 6 files changed, 2327 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/microchip,emc2101.yaml
 create mode 100644 Documentation/hwmon/emc2101.rst
 create mode 100644 drivers/hwmon/emc2101.c

-- 
2.39.5

