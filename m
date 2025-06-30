Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B66239085;
	Mon, 30 Jun 2025 11:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751282485; cv=none; b=l07TjLo5qM5ZP/glS1+ypw50w+OD4Lo7zoqAoGB16nvQeL87dpfgpZSxOiReGUq1flxzfhV/yPhoul3fXhyKbb2vuNtTw5K+lEPNBhpnbJ3/6t7uIrJ6RbNtdKapIlxWDkrprbbW6z/ShQOYmWlDXtnczTvRv2crn5HNIrNTMH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751282485; c=relaxed/simple;
	bh=kdffZayYqFKsYlrDbShiswllwemSxZXAowgkCZdDwSw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pkn7HhXHwlnGYc0RD9qwtuFzyDDfDhHZpVsi5j58egqjo1KoLzGMfi7oSqrDllHTAD9w9Kim8cSKgyal4+cZ8VbTxfmz3gNnWnfxy/ruuaEgF54cQcNJEIkwrzatntTKEFPczaVSffWj1Dakax5h2uKy1jEAwdWYREHJUYmLsOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kwSnG3I+; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kwSnG3I+"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3135f3511bcso1452565a91.0;
        Mon, 30 Jun 2025 04:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751282483; x=1751887283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/sCbwxspVKRy6vW2yV0dQypAUzvcx9awITgSiWZ2zks=;
        b=kwSnG3I+bvmM0RaUmCW/i10+wsBDtmqbwFMJJ5mm4EDfLc43j0txiiPG3v0jPZD7KK
         zVwj3Q/O3KWEbFAiB2tVxLSGAhDg28G1OmYwL9SKMJxw8IRiuiSWyKi5X7BDcvqRtjC/
         4Go/9H39BK4xoScm7CV/wWz+Ar14Y0TiJiA9pzIJNWIBDOSaJ8qEsISbIhhodY9I32tM
         we0hd71ivA81a/4NVrq0b6ESaDeuBKbJourPeRzStgHbDntUL1VmZddZ5Vm3tLcOQasr
         diXiBwzxWJbP1vCmShCfrjuur9odo+VfuMAgazO8Q19Gcw4MUfjvsUqml0kcjuy5QcEU
         BxxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751282483; x=1751887283;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/sCbwxspVKRy6vW2yV0dQypAUzvcx9awITgSiWZ2zks=;
        b=xKJr68ZzduIukXS2eG2+lc5B9eBXhvRN18pqTXTe+mvtF/MJmMZ409KYvswRAj4ATM
         lhnsyc5SD536X7Hj20qeKS30JXl43cq0NMH6dBk5Q4eAKFYk4meRtBFJreyaapO64MQ9
         VelbwPGAJR2hKUxqEHaQWKVznifVpYZ75pEGDiD0dt0sqaUFSVoXn1uNVtvcTNeqhrwu
         +bPyf6/dSuCwX/rHLe2dr7o60/miXFsOHjFFB8smKZZKFVp/3XKSPP6Z4KIexPQvW1bI
         p9OQFKnrEyJB+ZZXpzlbSsVBDaBQxOQzz4/mld398G7dn5jRhNUq7iBzj0dOobkyPsmz
         FJDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjTQWKCRHncPZp//BpnRTe44bKZtzEKRVgSq2sPNQq7vjgJSL+sS0CO1yjtzMOPMmKtVzdlD+K16jBi5c=@vger.kernel.org, AJvYcCX0okx8ROKZoE/UidIcJUmS4P1bZ4ZUrZGx4rcXXPlfoblsnDNQEAZ5aTGU/an5afJce+3sSQHjhaF+@vger.kernel.org, AJvYcCXJDqe29DWorUjQ1eqfQWZeSV6crXOsNHbPiCp3Umw8ujjyDRBRu7ZeFTgFUNN4I6KJK6uGyayf6Ex8qQmP@vger.kernel.org, AJvYcCXaMi/lcS28vKpYESpVLYz1nHWqmASuXWY1GsCDdIA9q4E0Ky9dTvVMEKOAhaeWuCQL7zVKOutWZ44Y@vger.kernel.org
X-Gm-Message-State: AOJu0YzwmQQTd79v6x9muxaSB/IEDxieCT1JiBJ/Z2p1MuaOWE/iT+rD
	1j4kJfcU+H8PQGavw1pdOXNfB8MrozED8QTcQWkIRCk7fF71GOVHn0tJo9njeK9T
X-Gm-Gg: ASbGnct47exgBQUbYq9RkH6q/0XfHzk6gt3pkKrfAmJycsV5ef42Rnvm117cNDjO/Nd
	Wn9gTTJGKnafzdS3X8pc2tSXyMyDAOhpzrAAjdmuQb7bhtu+3Kf2SS03kHiz8OkiVUNp29gn76J
	nIwpOzyCuPw/6YQBklb9dH5Grfs9opkSzxf2qU02DMrmTwvhRx5rsy+hIyMjzeR/JR5odcC3AJk
	c40ShrmA8EpGL77LzBGb2tc8RcjNAB0kQP9KNPh314OcqpXBRY3NIICRyMr9ONTlV44OrgJ1H7v
	GVdkz5C4hfS30ALKzT2go11mF9IFvqnZicTvdlFFGSrhoVZhzEB8QveL5vY24jn2cznYrZk487P
	+CWUSE/yDesglSriEl+vO
X-Google-Smtp-Source: AGHT+IG8BfcZilt8h79yYyIlvyAUuCS7gEv9t319bokbhoDzSOnLTv8jEE3z2sBoBJi0roKge/ueNA==
X-Received: by 2002:a17:90b:2688:b0:311:d28a:73ef with SMTP id 98e67ed59e1d1-318c8eeaf48mr19633272a91.10.1751282483423;
        Mon, 30 Jun 2025 04:21:23 -0700 (PDT)
Received: from localhost (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f53879bbsm13888676a91.9.2025.06.30.04.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 04:21:22 -0700 (PDT)
From: tzuhao.wtmh@gmail.com
X-Google-Original-From: Henry_Wu@quantatw.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Fabio Estevam <festevam@gmail.com>,
	Naresh Solanki <naresh.solanki@9elements.com>,
	Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>,
	Michal Simek <michal.simek@amd.com>,
	Henry Wu <Henry_Wu@quantatw.com>,
	Grant Peltier <grantpeltier93@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Cedric Encarnacion <cedricjustine.encarnacion@analog.com>,
	John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Ninad Palsule <ninad@linux.ibm.com>,
	Leo Yang <leo.yang.sy0@gmail.com>,
	Kim Seer Paller <kimseer.paller@analog.com>,
	Mariel Tinaco <Mariel.Tinaco@analog.com>,
	Nuno Sa <nuno.sa@analog.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Alex Vdovydchenko <xzeol@yahoo.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: peteryin.openbmc@gmail.com
Subject: [PATCH v2 0/2] hwmon: (pmbus) Add support for MPS mp2869a/mp29612a controllers
Date: Mon, 30 Jun 2025 19:20:49 +0800
Message-ID: <20250630112120.588246-1-Henry_Wu@quantatw.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Henry Wu <Henry_Wu@quantatw.com>

Add support for the mp2869a and mp29612a controllers from Monolithic Power
Systems, Inc. (MPS). These are dual-loop, digital, multi-phase modulation
controllers.

---

Changes in v2:
- Fix coding style issues.
- Using the pointer to replace the memcpy.
- Fix wrong device tree entries.

Link to v1: https://lore.kernel.org/lkml/20250624074156.291176-1-Henry_Wu@quantatw.tw/

---

Henry Wu (2):
  hwmon: (pmbus) Add support for MPS multi-phase mp2869a/mp29612a
    controllers
  dt-bindings: trivial-devices: Add mp2869a/mp29612a device entry

 .../devicetree/bindings/trivial-devices.yaml  |   4 +
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/mp2869a.rst               |  86 +++++
 drivers/hwmon/pmbus/Kconfig                   |  10 +
 drivers/hwmon/pmbus/Makefile                  |   1 +
 drivers/hwmon/pmbus/mp2869a.c                 | 299 ++++++++++++++++++
 6 files changed, 401 insertions(+)
 create mode 100644 Documentation/hwmon/mp2869a.rst
 create mode 100644 drivers/hwmon/pmbus/mp2869a.c

-- 
2.43.0

