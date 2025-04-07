Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BAAF2236FF
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 04:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744000269; cv=none; b=Yw4Dp8WtQ02zbLf8L27IpLZqFjGynL8HrVPe9tq0ZoLyn7Kgbr1FDmvulrpeeNwdupAR8U9jkmm1bWenQD0ttIhMvfvayE0p0qmtrdNGtRBVaGHsaG4fyG/Jpe9rjB14HL3yIgzkOZfv0nDPu3Rx8fYCN4I5XyfDZkrQNgubSYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744000269; c=relaxed/simple;
	bh=5z75klJulPBK3euVFo5jCw9QXY35/qZ4NCunDCR/9Jo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SDfgsH5ltdX+pO4epscd7XLmg4TNuqupwLwAklxUYf3Ant+Ft8hObcNgasmHzSg7PtYEe3X+0J5ZKk+uDhMQs0fownEsqdyg/vLYy5cKTRk3J91bD/hQiRUV9vwoh48mNL8aTIYLZyfggbos777pJKes54B7ebNPYVOt/n/wgmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=jWjvI6Rb; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="jWjvI6Rb"
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A2ECB3F181
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 04:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1744000265;
	bh=VbN0B6Oenuw6+py3+N6wdefqtqSm9CuUWAW6b8DJ97M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=jWjvI6RbueLLP7tt7e9kkBC5C/DIf6NbM47Ra31ueuYluJIzQCI5MZurPZ/ZLEbsg
	 YrFh0sXkj2fztmjUUDLuye9xjo3ULMvkKIE9TOB1fxVIOmEVC0jksPTz7sKJ2qu82J
	 ZII1undzNIAhD51yByOcdptH09vTvn6Kni0FGqVG5hFjHLKmhHje4qsbfaBWzPy4hz
	 2/0KtwE0x/4UQJ+11kWbnQFV6t2sZ322oXOmIZOjNoLvb367qIseTulDHSBGAheeeH
	 C6Y52RsbpDqrxH4IoA/srBtUh30cx4P7qwFTipOTOeI+VPTkFvtQkRz/SmCxPqWvjy
	 TxSa/12mIrNFA==
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-22aa75e6653so3323235ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 21:31:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744000264; x=1744605064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VbN0B6Oenuw6+py3+N6wdefqtqSm9CuUWAW6b8DJ97M=;
        b=q1fpWeDui3MSTS2V0FKhi84OjXoe0s36V/9cTlLnVYHTrld4tp43XIKjMqMSgYXuBu
         unASxyHuZMMKEL2vVHTI/eWq4TSBkhXtTrM3mEdO+K9gyFAXJCyDgbeGdp5D0G/BSjP+
         wul9wHARHseAM6yMvPu+1kihB8IyJy/8ZDWf4WGM+IZZDIVe0r86iczDZD/nWfU8SBhj
         Xvm18ON597fH8Z4ip361WwTCVLVQenLjaBxL7j1fAo1CaQg8kS9lHDA1EW5rbPyA0e6m
         6THkts52G0uoTL0wGpcNrxciMpQdR8xR1FIXd1vGA0/5xndvn2PmHz7CV4gS6/92lQUB
         hBAg==
X-Forwarded-Encrypted: i=1; AJvYcCUfBE16L5fc4U2oiYnuRFNGuRZnXIwtKb8udfzcXBbvfvNhXZQSAkO8eRjXCqEalOKfMDLT4wOINivLzkg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrcnD3MZtO26Gwws69fe56yMmhbEWq4lZL4fCv+rpJuNKFNZB6
	Zufu6pJT8JWgDwxkA7IuA3qWHbHOyP0/kp2IvRP4lHU81BnZM9MDker7dqTnbJdRBd+xa6/RG5L
	be6D4gXN8z+34ZkRP5btdfuStyVbB8l+t07remYa2fQqHBT8f+ifn2iRVNXj80k5GrQt74fltwr
	0MIQ==
X-Gm-Gg: ASbGncv3pf/EjuuzALGXQZ0ZtJ8avPWZvcZH0mTA7SJfrJiwbRVVsoicikOTaU7Y4cn
	LKRD28kc+4LrUP2lg1NdhEDzl8V2HrFF1pQEzTuw9YemfZ9ztkRrIYk5yc4dVVfoXOAJyUP7DyQ
	Rs9VWPM+OZWuI0yzACxxOn1CNdWitlRG2V9gGacYkqxCFlopq+jjDdaIP98R7OCMqAqaDQAKryK
	ZhoLwubfBd7hVtIA2zSaw2h1IRimuYMyTn8WWeDCRujfEBM+WKpJbFbzmXJ/h3NoFcvY2P6/kf+
	J3QNCx6OVwPJyfskuM7c7omBWPV0iiThUQ==
X-Received: by 2002:a17:902:ce02:b0:224:160d:3f54 with SMTP id d9443c01a7336-22a8a87949cmr149795555ad.31.1744000264106;
        Sun, 06 Apr 2025 21:31:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFy98Am/whrbbqIZNo+BR5j4Z0JXTKszZD/vODdfyxs6+TUEIaW5R6ZQESYqR01WAMU2ROHLg==
X-Received: by 2002:a17:902:ce02:b0:224:160d:3f54 with SMTP id d9443c01a7336-22a8a87949cmr149795415ad.31.1744000263751;
        Sun, 06 Apr 2025 21:31:03 -0700 (PDT)
Received: from localhost.localdomain ([240f:74:7be:1:5985:1f8b:863f:3722])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22978670dbbsm70839525ad.209.2025.04.06.21.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 21:31:03 -0700 (PDT)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 8/9] Documentation: gpio: document configfs interface for gpio-aggregator
Date: Mon,  7 Apr 2025 13:30:18 +0900
Message-ID: <20250407043019.4105613-9-koichiro.den@canonical.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250407043019.4105613-1-koichiro.den@canonical.com>
References: <20250407043019.4105613-1-koichiro.den@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation for the newly added configfs-based interface for GPIO
aggregator.

Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
---
 .../admin-guide/gpio/gpio-aggregator.rst      | 107 ++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/Documentation/admin-guide/gpio/gpio-aggregator.rst b/Documentation/admin-guide/gpio/gpio-aggregator.rst
index 5cd1e7221756..8374a9df9105 100644
--- a/Documentation/admin-guide/gpio/gpio-aggregator.rst
+++ b/Documentation/admin-guide/gpio/gpio-aggregator.rst
@@ -69,6 +69,113 @@ write-only attribute files in sysfs.
 		    $ echo gpio-aggregator.0 > delete_device
 
 
+Aggregating GPIOs using Configfs
+--------------------------------
+
+**Group:** ``/config/gpio-aggregator``
+
+    This is the root directory of the gpio-aggregator configfs tree.
+
+**Group:** ``/config/gpio-aggregator/<example-name>``
+
+    This directory represents a GPIO aggregator device. You can assign any
+    name to ``<example-name>`` (e.g. ``agg0``), except names starting with
+    ``_sysfs`` prefix, which are reserved for auto-generated configfs
+    entries corresponding to devices created via Sysfs.
+
+**Attribute:** ``/config/gpio-aggregator/<example-name>/live``
+
+    The ``live`` attribute allows to trigger the actual creation of the device
+    once it's fully configured. Accepted values are:
+
+    * ``1``, ``yes``, ``true`` : enable the virtual device
+    * ``0``, ``no``, ``false`` : disable the virtual device
+
+**Attribute:** ``/config/gpio-aggregator/<example-name>/dev_name``
+
+    The read-only ``dev_name`` attribute exposes the name of the device as it
+    will appear in the system on the platform bus (e.g. ``gpio-aggregator.0``).
+    This is useful for identifying a character device for the newly created
+    aggregator. If it's ``gpio-aggregator.0``,
+    ``/sys/devices/platform/gpio-aggregator.0/gpiochipX`` path tells you that the
+    GPIO device id is ``X``.
+
+You must create subdirectories for each virtual line you want to
+instantiate, named exactly as ``line0``, ``line1``, ..., ``lineY``, when
+you want to instantiate ``Y+1`` (Y >= 0) lines.  Configure all lines before
+activating the device by setting ``live`` to 1.
+
+**Group:** ``/config/gpio-aggregator/<example-name>/<lineY>/``
+
+    This directory represents a GPIO line to include in the aggregator.
+
+**Attribute:** ``/config/gpio-aggregator/<example-name>/<lineY>/key``
+
+**Attribute:** ``/config/gpio-aggregator/<example-name>/<lineY>/offset``
+
+    The default values after creating the ``<lineY>`` directory are:
+
+    * ``key`` : <empty>
+    * ``offset`` : -1
+
+    ``key`` must always be explicitly configured, while ``offset`` depends.
+    Two configuration patterns exist for each ``<lineY>``:
+
+    (a). For lookup by GPIO line name:
+
+         * Set ``key`` to the line name.
+         * Ensure ``offset`` remains -1 (the default).
+
+    (b). For lookup by GPIO chip name and the line offset within the chip:
+
+         * Set ``key`` to the chip name.
+         * Set ``offset`` to the line offset (0 <= ``offset`` < 65535).
+
+**Attribute:** ``/config/gpio-aggregator/<example-name>/<lineY>/name``
+
+    The ``name`` attribute sets a custom name for lineY. If left unset, the
+    line will remain unnamed.
+
+Once the configuration is done, the ``'live'`` attribute must be set to 1
+in order to instantiate the aggregator device. It can be set back to 0 to
+destroy the virtual device. The module will synchronously wait for the new
+aggregator device to be successfully probed and if this doesn't happen, writing
+to ``'live'`` will result in an error. This is a different behaviour from the
+case when you create it using sysfs ``new_device`` interface.
+
+.. note::
+
+   For aggregators created via Sysfs, the configfs entries are
+   auto-generated and appear as ``/config/gpio-aggregator/_sysfs.<N>/``. You
+   cannot add or remove line directories with mkdir(2)/rmdir(2). To modify
+   lines, you must use the "delete_device" interface to tear down the
+   existing device and reconfigure it from scratch. However, you can still
+   toggle the aggregator with the ``live`` attribute and adjust the
+   ``key``, ``offset``, and ``name`` attributes for each line when ``live``
+   is set to 0 by hand (i.e. it's not waiting for deferred probe).
+
+Sample configuration commands
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+.. code-block:: sh
+
+    # Create a directory for an aggregator device
+    $ mkdir /sys/kernel/config/gpio-aggregator/agg0
+
+    # Configure each line
+    $ mkdir /sys/kernel/config/gpio-aggregator/agg0/line0
+    $ echo gpiochip0 > /sys/kernel/config/gpio-aggregator/agg0/line0/key
+    $ echo 6         > /sys/kernel/config/gpio-aggregator/agg0/line0/offset
+    $ echo test0     > /sys/kernel/config/gpio-aggregator/agg0/line0/name
+    $ mkdir /sys/kernel/config/gpio-aggregator/agg0/line1
+    $ echo gpiochip0 > /sys/kernel/config/gpio-aggregator/agg0/line1/key
+    $ echo 7         > /sys/kernel/config/gpio-aggregator/agg0/line1/offset
+    $ echo test1     > /sys/kernel/config/gpio-aggregator/agg0/line1/name
+
+    # Activate the aggregator device
+    $ echo 1         > /sys/kernel/config/gpio-aggregator/agg0/live
+
+
 Generic GPIO Driver
 -------------------
 
-- 
2.45.2

