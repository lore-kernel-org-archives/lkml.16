Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EFB278167
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 18:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744223874; cv=none; b=GpI8pBJXfiRXOirynykMK4+vF7UiTeDBMSnLVTXwGmpt5eM2Y31+eAEbUXXLeDIdvg2Xgr5eNBc6ydXKT0lJf2lY2xMRhqiGDdRZuu4OQuIYLJSTTFcIw2edpU0p4Ug0K1SUWJa4qqIiWNgORoG9NDX1Bdj/Swdp76NzRIwricQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744223874; c=relaxed/simple;
	bh=op+FNBneI6h3+sV2ZZlwMqV5lcQPl5VA3Pzvyo21FgU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lcr5W8mbXeENoi2XwStCgV/b+QGufewF+vSS+nhEwyUmKJJ0biinCtiB4s1Yvt68fatch3AHp6GIO1YQXI4ZLGKsd1FyWPVftKl8OCd919d2zsUToADbeVm7tnyf/NzwfBspJkKAACa7SGA+FcYM2tr4A4J39BjQ+UmRJOQE1gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ho8IeVwn; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ho8IeVwn"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39c266c2dd5so6197424f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 11:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744223870; x=1744828670; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L7RQvOK6fXK41dO5HhHuRssJ1eoHSZj31eOEcLWUU5k=;
        b=ho8IeVwnAUCM0Ul+b1oOSQfoEDx58zPkEwM2Sfdy/nkJJFuydesxXqlbPwQQ1nT5fo
         h2BaJcusTFDcI54slJFAQ0SH4zVBgQFKAxGldx7yjn/OxKgs061iR2/jrm8j1P9s6sDn
         Jgqjty6sZ13WA87wwVYuquW/RN7GKVF9AeSRM7fjxaj50n4K7mrxgNvjGtBKG6/SF3fl
         22X0cBdwv1vB+5xk9aQDcvhZX8G8nam2Vk+Gug3eg79VHNsj1QPTsgnQIaa7h/sNVQTb
         5fl3eI5wT01chWO38kD1XWLUKd9Z0IxT4tbfra5+NjNu/vYfmbApClXVq8zdnCVrSp2U
         VS9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744223870; x=1744828670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L7RQvOK6fXK41dO5HhHuRssJ1eoHSZj31eOEcLWUU5k=;
        b=Va1y49H33c64piVEaqu910x+bQhTueDHBxPXED6rs787TTkDSJS4PcVSonQ7SJhQJD
         oY4tl2nf6bo0ZVkjTt6rPlRDCa1dPDW9zAgdPN7k3d0b4jR2R9foepWOvXVldMoUw/ko
         eJuYZSQcf3Jdkv6ZVUaOcTXaDaTX050poqDwDgvFWxa5RKw5/h0TK+5D3IhUnHtBHiOC
         aXJ7an1pRa9qjPrH4APNyMEUMhNVpC4/37XNSJvwDUPTkv9xiiqdaH00tm4tyqyClp/t
         A0hTmI5z7gyZrpeKXoQyDsF1A4RN/MRA6vAnr3E7hFX1Zorr7SiIe1tyduolf9mKKffU
         DQxg==
X-Forwarded-Encrypted: i=1; AJvYcCUxORijlWrdo5FyuTpRKzIm2hVXvyfblUxwvNP93HQF/tYiw4R43CYyjMGDQP9s3Qr4YNoIpLnhl895klY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5740em/9DC47SvZd8OZNd8ts9qKbm2cN8WxZfnE78JW3REYpO
	xl9HR4Nq9xrkNncIBk7tT3c5SX4Ub0lgUp+VACv7aRqUgLA/DMqhSXDAHen+hDA=
X-Gm-Gg: ASbGncvK52zQtUGx+VKFWmQxb5RI62Sdb5HkJvtSyUoceklo+LFnnUD5BvEQ0ixWMpq
	ja8ZFvkewDC3NInVfEtlwi56ZIwLw/C/qYMabCRm6XyJB0qYWFVz5OmPwJegMZ1ccFcIrgCTOfr
	dlD2tEqdJ2XEw1JZIxSwexpISw/x1afDohUkAN6o6J+nmgtnulI7aEOqJYCKWeGMS0GgoCsisD3
	haC811pWYhqUMUN+0v/k+cLEETlF7usy6payqRRio08K447g/wgpXdRURphDQzDSVaBx0xM+oI0
	EpdSh6XIb0qiRcQJWCPR0Ojs1dOuYQd7ZWYCqEjLH2a0d8f1BPpR2RAvoqd71AnDFPX0sN4ilB8
	49CqZEISxYSil2gXUyA==
X-Google-Smtp-Source: AGHT+IEDHPm4LxkKIHaWsV3VkEh4vV7MWqjrpEXZp3f0HFZRY0uLOfZ60I6tOqq7efsrIH+dDqaIww==
X-Received: by 2002:a5d:64e6:0:b0:391:1923:5a91 with SMTP id ffacd0b85a97d-39d87cde0b9mr3769040f8f.55.1744223869782;
        Wed, 09 Apr 2025 11:37:49 -0700 (PDT)
Received: from [192.168.0.2] (host-87-15-70-119.retail.telecomitalia.it. [87.15.70.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d8938a808sm2380893f8f.53.2025.04.09.11.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:37:49 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Wed, 09 Apr 2025 20:36:29 +0200
Subject: [PATCH v5 2/5] docs: iio: add documentation for ad3552r driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-wip-bl-ad3552r-fixes-v5-2-fb429c3a6515@baylibre.com>
References: <20250409-wip-bl-ad3552r-fixes-v5-0-fb429c3a6515@baylibre.com>
In-Reply-To: <20250409-wip-bl-ad3552r-fixes-v5-0-fb429c3a6515@baylibre.com>
To: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Olivier Moysan <olivier.moysan@foss.st.com>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4317;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=8WrNMaaQ2xgbRizjN22pSBO+RAVh+prIiloygvq6/kQ=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYkj/tk+X+8602+/US/O41hwzOpblEdNTWrf8rUAg3wf2T
 X9r91fN6ChlYRDjYpAVU2SpS4wwCb0dKqW8gHE2zBxWJpAhDFycAjCR0gSGfxpLGL2vmAQJ9eQF
 P5/wJrH5he3m0OoM6ffcd1WXM3NKT2T4n1C6kj92s4W67I6+ramztt2f8OAmc+jrkx95ivrjJ/5
 qYAcA
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
index 0000000000000000000000000000000000000000..1539c2096ed9f9344da2e5d018e77a0524792270
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
+| data_source           | The used data source, as                             |
+|                       | ``normal``, ``ramp-16bit``, etc.                        |
++-----------------------+------------------------------------------------------+
+| data_source_available | The available data sources.                          |
++-----------------------+------------------------------------------------------+
+
+Usage examples
+--------------
+
+. code-block:: bash
+	root:/sys/bus/iio/devices/iio:device0# cat data_source
+	normal
+	root:/sys/bus/iio/devices/iio:device0# echo -n ramp-16bit > data_source
+	root:/sys/bus/iio/devices/iio:device0# cat data_source
+	ramp-16bit
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
index 030d90d383411bbfe949cfff4f5bce27e3dd37c4..52d73ba42d8600632d00b7a25df9ed5bea84fa3d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1306,6 +1306,7 @@ L:	linux-iio@vger.kernel.org
 S:	Supported
 W:	https://ez.analog.com/linux-software-drivers
 F:	Documentation/devicetree/bindings/iio/dac/adi,ad3552r.yaml
+F:	Documentation/iio/ad3552r.rst
 F:	drivers/iio/dac/ad3552r.c
 
 ANALOG DEVICES INC AD4000 DRIVER

-- 
2.49.0

