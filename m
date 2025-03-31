Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C03A218EBE
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 19:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743447848; cv=none; b=Mf5QTG0TrKOxv2/g0zq3DonHG5YxWyq9uxvwUMdU0bJmL2NMqcXUkM7PekuWs0cgIm8dyqxZFCzv+ozUL4iRGUxrwdtHps/hgZ3j3RuU+7XAJhQwCTl44wF+ZoH4bINJrcwEIgpxxwbUq5v0LxXS2GcKQUtw7aR+OWrYkN3njeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743447848; c=relaxed/simple;
	bh=F2Qod7NABbhubiuu+bmx+zE/fhm/Yo5sMggxFose+iE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m1Ka88wXzFC6E8VhyosacXN0ct1lY2ykC0P9O4FrNJ5WE4MEwNuTWniuyqvlDVwACOPHktptRrwT9AwXzvRg+ve59kM9j5mnDRTxLNiRnHb3aG0qFljijf3TFNREqf/H9KOEcmu1YgKF1yzNQt2DLbyeQSs4svTX31ybrSfe8no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=botxjJON; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="botxjJON"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac3fcf5ab0dso766376966b.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 12:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743447844; x=1744052644; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ShsE3ZcbHwYaWyOB5JwD08uVlCnOZ4Y4zX0gXgP+EjU=;
        b=botxjJONMq1XNSP1m+4d0W1/82YmAgXdqwQfI1o2IjiTJnnHSsODdL3lUuw0D82TKi
         Wqo5qHFN4661B/tsr2Ov+ZKS+2liC5Nc78bcJeI1QNRN5gl3+FGAfBU16iYknsZivQyZ
         i/nHL5OGr8fUA8pOEgbvNiOAVtyN/CVEgK7V2PAzNG44T/9UuxPUTdidom2AMDSC0RWS
         wltDwlg0kJquszJ8lNfqb/f7LJZOpMObuOngW+TX9tb/hmTv6RK9ZoUi3nNkVWsL2k8O
         HJmcSI3YjAKVANaF8u6Lvx7NNE1U7SJOBqTzGc4MotJYl4Egn9Wg4WXyDtLEXfmNM0BZ
         Y4Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743447844; x=1744052644;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ShsE3ZcbHwYaWyOB5JwD08uVlCnOZ4Y4zX0gXgP+EjU=;
        b=bVeOvyKGbhtYfR2QxU32dNJVe/DB03TLPFoSiKcXkE1rw02Eem+HGCosGgtKgUpleo
         n066DQ84hQtDD0+VXUgHkNJvW7qY0MFrDagwT+Yvt/LyjmBSGbf1HthByXOZuIJNkOZ0
         aG61X5GGrdlyeRq7RajgTnzIFaJXNSTaHHbdV20LdrM0Dmv3t4fFV63qx0etQiFFGFsZ
         ZfdUbW9lZsPjL3DcQ5HJ0K2Q/Rhbs82kEOzPmtJva4wDe+h7eq/P+lOq06NWe/zHOHgp
         OX/0KNO+fjvfsprCJUQaQmR25zl+T4b1dk8iJZtPX0liC/jZQnzd4ygdnhbLcD+XtAQh
         GIdg==
X-Forwarded-Encrypted: i=1; AJvYcCUXOqhAKWTF4bvDWkD/qVCTw+OodVKfpacD3xQ9d2Ly8NKIQa+jcNz9NMpiiBhfqL4Ad/i4jnHPMB9sa2U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAzlgprjZbYzPW9+e5XytifGTN5g+QYVCtXTxpSNUObpb/jjrX
	mkNeVxdtNNhV0wCpt6NMt0mhzxoNgelOhChLBXs/Tzkb/jAh+m3cyr6i2cVfDPw=
X-Gm-Gg: ASbGnctXKcUiQDnH1WLOlQBfda3egd+mbao/GsaK60owtkx5E7Uz9AT0xL8Unmizbi7
	vDC85a4Fntsg9RUovZ6HL9Qf1Mweil4Vk/37jBNdBuBA4JpzpQ5KTY6DA2VZVC0xqAOx5n99K2W
	92hHn3SFTPV6pWjtnIY9QKgNWh0Xaw3R9OCNDCi/XwdBMGk/coDEudYyMZZmEwJAV142jUMtDmx
	+iD7xS1G14bQpcuEgHF5+lLPsmQqZo7N7ynP8UICznt2BBZY6YSu9+9yEz1C1vHT2Tf1yj0al2O
	9t3jg0rNv1Pz85NKt4J4XORq6eQFX+1fo0GEToCtLjijk/zBnSCgYFFwMytANsvNaxoXosJTZnl
	eMeigXdp6x3UcKoy2Q97cAnMcVEBO
X-Google-Smtp-Source: AGHT+IGuQItt9kOHohfEdRqiYQ1qj4daUOg0M2kttNOL8REmmUJaouq4B1SoHf687sYLgKm6ciKoHQ==
X-Received: by 2002:a17:907:9708:b0:ac3:ed56:86dc with SMTP id a640c23a62f3a-ac738a4b283mr953684366b.31.1743447844447;
        Mon, 31 Mar 2025 12:04:04 -0700 (PDT)
Received: from [192.168.0.2] (host-80-116-51-172.pool80116.interbusiness.it. [80.116.51.172])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71961f9cfsm652288566b.122.2025.03.31.12.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 12:04:03 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Mon, 31 Mar 2025 21:02:45 +0200
Subject: [PATCH v2 2/5] docs: iio: add documentation for ad3552r driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250331-wip-bl-ad3552r-fixes-v2-2-cdedb430497e@baylibre.com>
References: <20250331-wip-bl-ad3552r-fixes-v2-0-cdedb430497e@baylibre.com>
In-Reply-To: <20250331-wip-bl-ad3552r-fixes-v2-0-cdedb430497e@baylibre.com>
To: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Olivier Moysan <olivier.moysan@foss.st.com>, 
 Michael Hennerich <Michael.Hennerich@analog.com>
Cc: linux-iio@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4191;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=K6IzTR+F1J2B1DTGHtf/OPY+ArUlb20kadSjMscdtUE=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYkh/9exWaIWaQl1Sgvvim+/ND1wUOxlvZZSyOOmFicU1t
 SQzA8nijlIWBjEuBlkxRZa6xAiT0NuhUsoLGGfDzGFlAhnCwMUpABNxOMnIcOvf041rRYquJ2Va
 2QpoPv3Ata/+n+W65Y7zdy7bEVgeWMbwT0+06WiWnH9pVMvMLcsmGfuk2S3fryiV9rR/jmePNr8
 UDwA=
X-Developer-Key: i=adureghello@baylibre.com; a=openpgp;
 fpr=703CDFAD8B573EB00850E38366D1CB9419AF3953

From: Angelo Dureghello <adureghello@baylibre.com>

Add documentation for ad3552r driver, needed to describe the high-speed
driver debugfs attributes and shows how the user may use them.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 Documentation/iio/ad3552r.rst | 72 +++++++++++++++++++++++++++++++++++++++++++
 Documentation/iio/index.rst   |  1 +
 MAINTAINERS                   |  1 +
 3 files changed, 74 insertions(+)

diff --git a/Documentation/iio/ad3552r.rst b/Documentation/iio/ad3552r.rst
new file mode 100644
index 0000000000000000000000000000000000000000..2af24cfe886f1f4c1b86ac679fd19b83635b6771
--- /dev/null
+++ b/Documentation/iio/ad3552r.rst
@@ -0,0 +1,72 @@
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
+specific device debug folder path ``/sys/kernel/debug/iio/iio:deviceX``.
+
++----------------------+-------------------------------------------------------+
+| Debugfs device files | Description                                           |
++----------------------+-------------------------------------------------------+
+| data_source          | The used data source,                                 |
+|                      | as ``iio-buffer`` or ``backend-ramp-generator``.      |
++----------------------+-------------------------------------------------------+
+
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

