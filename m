Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7B026869B
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 10:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744107621; cv=none; b=B9xjOnLLfBAOpVlNd2zalqL1jaqZ6UcyZiMIswwXVXHTnljd70cR6i2GFooRg5DZkLp7aCLzr2VfUHXxDbrtpDX6Wd8tNBLMqUZU7uf+M33ac7075qkN3l6XWM2pnmw7swyXb2z9M5g/RbAIQSzfo8HVpd7nBpGPoqkss1CyJjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744107621; c=relaxed/simple;
	bh=fJ2QDU0edCT1i91gDbLTwkRKAOLcggRrfUQ3QN1wvvo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=na3XEMxPBHbmibHYwWv1DmJW2UAP0uZ/WixiA+cUEx7FSaQ8Ph4MeX5VELxgFA4vKiwyZFV74Pb9VapPiKAldbAKwWlPMi+uO8qec55x6KGbPok3jdhoGnEwYLsYSeHW1zvdalB1UCV+ZLJ7KOKJ137pjeWyArwdX6bmqNRpIUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=rC9Py0Z+; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="rC9Py0Z+"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39d83782ef6so309925f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 03:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744107616; x=1744712416; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N25ObTi9+VYre0Pwf0ivFwi1iTe0QqqN5sDF++TPjWQ=;
        b=rC9Py0Z+m0uUfuDFIwlBk31G1XYK80sM6+QkJNSSB1Ua6KhsObB1xv0IfDeuTOb9pf
         LeveQ7G3F8yg4dTG1Ki2mZIlgycYh7BktEJ5eZT6V8AhFllbAsEjQHQoqnl+GX3rsuuC
         KhhUSYVSr9nz0WXeHZqy+jndWn+ZemqOadWLxhPWG01laIdm6h+SvOpHwI8gJhVlBfZu
         RD8Kge7LP+UY0MjAe1M15YU39NC9IguMG0JxLBTW9WLopeuQ0bcPwFDG7FnE4ljwr0+U
         +aukPRQydKecn4ReISSKvFy8EDhgykWM0tA3hvwpVzC6+Hzz2+iVt17YBr41qFVTKO5M
         LcNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744107616; x=1744712416;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N25ObTi9+VYre0Pwf0ivFwi1iTe0QqqN5sDF++TPjWQ=;
        b=ROluM4WLCRi6J5Q2L4gli/DfpWKTxp9z9FWIxW6CJoqXcLB5HYBeYBMIs7SqEHh3hB
         Po/QOdbxGEpwagzf6DNGejZboPhvGUwbMfn8mFitH0g5EP6/YqORqIL/asFQH+S+Wg4O
         WemLpvE8IK4+7D1z6j4LqEJtEcYGeowxFtRq4Em7OWdZnGqRFWfYrPjjkvuioeXx/9Dx
         V0ZWwnJ08sVK94qHJm8Bp/Y0I8xecc4kcvCdlSINhUCnMdLc75NmX19507cQZeDVdcnx
         2QzV2ZtNQde6jHQX69up/3p4CIomVwvE3UcBtHGH3zAZ+sqwYp/QzZ1zvud/MVFdy8rE
         LEOw==
X-Forwarded-Encrypted: i=1; AJvYcCU4y6CKTsG4DOX4r7nieBR6JFpoLgWeOr4vy0KCrjP35XvELqUWCJiU+PTl/85TRbzvsqqlmdHg7mNCrFA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYgh9JdHcs9tRwr/e5u9rkjdVUG1gBaEUy+2/e2+mYgQyWDJo6
	OMWJZOAaYzZGB2xBYPf0i+ZwgyGm87Ze0kdVfvheAPM8kQB1+9N02aGijZcJsTg=
X-Gm-Gg: ASbGncsOQIBmNK772YgHtxlvFJsq1VmWTglzLkP7ED+Q5sMtBk1Cn5cVXC8jjLzT+0L
	u6raQTCWMOe7vodxfFIPCnsMzOOJxZoup3XUiaQ24sYk0p/Qyq9kOemJzC1pijkw9n6V9VchzEJ
	L4dXKoOwrB8eiVc5Sg9CdUqyuremVp0jQQ/oS3aGNrOVVhB8A7+vFTZSQLMsofDuEniRy7U9oTm
	LFeA09JvwRcdcocOtsASlSlFUN8Hd4LnsF0xFCzm4u8mRRh5e6oeDti4xXBr5X5vwlr09BOdFeS
	yHx8YgkBTFQxrVL4KXix9OAVw0piyE9NVUD7+RJAoZrTliNRB3T0WwaMZgHQGmmL8TFbQj9KTIc
	vtAm9rfMXbrLtDsplAmYDKw==
X-Google-Smtp-Source: AGHT+IGnPzc6uTuByt/3GyKTMHMQg/lwzqCoRyC3eh5DaNDXFcSV/h/SNkUkfCihJuOscV6vPXXflA==
X-Received: by 2002:a05:6000:401f:b0:39b:3c96:80df with SMTP id ffacd0b85a97d-39d820ac9bemr2407988f8f.11.1744107615738;
        Tue, 08 Apr 2025 03:20:15 -0700 (PDT)
Received: from [192.168.0.2] (host-87-15-70-119.retail.telecomitalia.it. [87.15.70.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d7c6d838bsm4396138f8f.69.2025.04.08.03.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 03:20:15 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Tue, 08 Apr 2025 12:18:52 +0200
Subject: [PATCH v4 2/5] docs: iio: add documentation for ad3552r driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-wip-bl-ad3552r-fixes-v4-2-b33c0264bd78@baylibre.com>
References: <20250408-wip-bl-ad3552r-fixes-v4-0-b33c0264bd78@baylibre.com>
In-Reply-To: <20250408-wip-bl-ad3552r-fixes-v4-0-b33c0264bd78@baylibre.com>
To: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Olivier Moysan <olivier.moysan@foss.st.com>, 
 Michael Hennerich <Michael.Hennerich@analog.com>
Cc: linux-iio@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4342;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=6w/Ug2UM5FIVCK/04ZJVGDVSrtb3C+at0h3MVUDEs+E=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYkj/8kNoK99sE8GjVXm3k6tdFvhEnvZKO7Vji2nRaXXmt
 pSyVy6nO0pZGMS4GGTFFFnqEiNMQm+HSikvYJwNM4eVCWQIAxenAEwkpo7hr1Be3/Sk7/fzijYd
 Zvq2M96C7Yv15cxK3f8F3okbj77NtmNk+N5UuWJjqflJkaup6e7OX/p0JiswvGBtut18ebnCkif
 HWQA=
X-Developer-Key: i=adureghello@baylibre.com; a=openpgp;
 fpr=703CDFAD8B573EB00850E38366D1CB9419AF3953

From: Angelo Dureghello <adureghello@baylibre.com>

Add documentation for ad3552r driver, needed to describe the high-speed
driver debugfs attributes and shows how the user may use them.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 Documentation/iio/ad3552r.rst | 73 +++++++++++++++++++++++++++++++++++++++++++
 Documentation/iio/index.rst   |  1 +
 MAINTAINERS                   |  1 +
 3 files changed, 75 insertions(+)

diff --git a/Documentation/iio/ad3552r.rst b/Documentation/iio/ad3552r.rst
new file mode 100644
index 0000000000000000000000000000000000000000..bd63b333ca10d993230027f933cebf7054684974
--- /dev/null
+++ b/Documentation/iio/ad3552r.rst
@@ -0,0 +1,73 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+==============
+AD3552R driver
+==============
+
+Device driver for Analog Devices Inc. AD35XXR series of DACs. The module name
+is ``ad3552r``.
+With the same module name, two different driver variants are available, the
+``generic spi`` variant, to be used with any classic SPI controllers, and the
+``hs`` (high speed) variant, for an ADI ``axi-dac`` (IP core) based controller
+that allows to reach the maximum sample rate supported from the DACs, using the
+DMA transfer and all the SPI lines available (D/QDSPI)..
+The high speed driver variant is intended to be used with the ``adi-axi-dac``
+backend support enabled, that is enabled by default when the driver is selected.
+
+Supported devices
+=================
+
+* `AD3541R <https://www.analog.com/en/products/ad3541r.html>`_
+* `AD3542R <https://www.analog.com/en/products/ad3542r.html>`_
+* `AD3551R <https://www.analog.com/en/products/ad3551r.html>`_
+* `AD3552R <https://www.analog.com/en/products/ad3552r.html>`_
+
+Wiring connections
+==================
+
+Generic SPI
+-----------
+Use the classic SPI S_CLK/CS/SDO/SDI connection.
+
+High speed (using axi-dac backend)
+----------------------------------
+
+::
+
+    .-----------------.                .-------.
+    |                 |--- D/QSPI -----|       |
+    |   DAC IP CORE   |--- SPI S_CLK --|  DAC  |
+    |                 |--- SPI CS -----|       |
+    |                 |--- LDAC -------|       |
+    |                 |--- RESET ------|       |
+    |_________________|                |_______|
+
+
+High speed features
+===================
+
+Device attributes
+-----------------
+
+The following table shows the ad35xxr related device debug files, found in the
+specific debugfs path ``/sys/kernel/debug/iio/iio:deviceX``.
+
++-----------------------+------------------------------------------------------+
+| Debugfs device files  | Description                                          |
++-----------------------+------------------------------------------------------+
+| data_source           | The used data source, as i.e.                        |
+|                       | ``iio-buffer``, ``backend-ramp-generator``, etc.     |
++-----------------------+------------------------------------------------------+
+| data_source_available | The available data sources.                          |
++-----------------------+------------------------------------------------------+
+Usage examples
+--------------
+
+. code-block:: bash
+	root:/sys/bus/iio/devices/iio:device0# cat data_source
+	iio-buffer
+	root:/sys/bus/iio/devices/iio:device0# echo -n backend-ramp-generator > data_source
+	root:/sys/bus/iio/devices/iio:device0# cat data_source
+	backend-ramp-generator
+
+
diff --git a/Documentation/iio/index.rst b/Documentation/iio/index.rst
index bbb2edce8272e7483acca500d1a757bbcc11c1e0..2d6afc5a8ed54a90cd8d5723f0dc5212b8593d16 100644
--- a/Documentation/iio/index.rst
+++ b/Documentation/iio/index.rst
@@ -19,6 +19,7 @@ Industrial I/O Kernel Drivers
 .. toctree::
    :maxdepth: 1
 
+   ad3552r
    ad4000
    ad4030
    ad4695
diff --git a/MAINTAINERS b/MAINTAINERS
index 57eaab00f6cb53df52a4799eb2c1afbbd1e77a1e..52bc56a9ee22c66b90555681c4757ea4399adae1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1295,6 +1295,7 @@ L:	linux-iio@vger.kernel.org
 S:	Supported
 W:	https://ez.analog.com/linux-software-drivers
 F:	Documentation/devicetree/bindings/iio/dac/adi,ad3552r.yaml
+F:	Documentation/iio/ad3552r.rst
 F:	drivers/iio/dac/ad3552r.c
 
 ANALOG DEVICES INC AD4000 DRIVER

-- 
2.49.0

