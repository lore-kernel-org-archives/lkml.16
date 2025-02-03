Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE4F1DC9B0
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 03:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738552381; cv=none; b=UwsZJZerAIzSmUx2w0ARmHAXmSZ1PZE+lt4U0rnQXx7gtNuLTgiXH09OLk0sDYm1lK1HkWW6jATHpCMcfNKs/3KPgsdVOTeDooQPs0P9gMFauOESkJSdN7DFdCuPEOr1HOPvSCDHg74wCcob8iNK5QcuiSyoiXsaIm1t8uF7IMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738552381; c=relaxed/simple;
	bh=Vqk19K2G5OkkvB0lmlmp+qiCv2ThpYOqqX/LCVhB150=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CxnNXe4eOwi1arJlo7UYaejac89BI4o6SPWSve+Ja/5FpU/fQ6tA9AB3fn9n3AqlZG9YrQ4XNDv5ImK+3exHqLpVWZlA4CjrnyDXyUQn1O6ZHTSQ6Dl+vn/y1+rcpZqjpUaD19sgnyuwU9wkWoTF79iXTrwTsBBKOuCtZIzHqzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=F5M/t3xL; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="F5M/t3xL"
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 352B43F2F0
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 03:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738552378;
	bh=XeAXiTNaWKC5ny0m9ZhKc05Lq+fQXFbLlYp1VOJLKnk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=F5M/t3xLWy+VqRaTGXxrNtjGXsFYvs1jYEiAgNS+fsu+9l8tlf9h+mmuz+D3EJW5b
	 A2BtyP40NxQUjDFnJaURGdpS0F2skIsRgDjT55VrHUjy2gBgdJ1IaijY0MKmRg5VUj
	 txkY4oYX70m+yY/QG5qVyoKq0LxN0GXR+ta/mtHsicmnZBLQ9FeVvIUsT3cAAB/1fm
	 V39YDJeHJjv0phjhCe4/E1Jm6bVUHdL3Sb1uKWrKDPfk0YLq8pg4QHC8+Tj1eqBejt
	 UOwK5f30i6fobwrge4pKWSEHvi1LFurcQgFfvc1cTTGVISFEcvMu/VHPNaDNCcPKG7
	 LvH88XQgCorDQ==
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-216405eea1fso78588655ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 19:12:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738552377; x=1739157177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XeAXiTNaWKC5ny0m9ZhKc05Lq+fQXFbLlYp1VOJLKnk=;
        b=eFYMrFzUUUqtIcmzITazs/F0XebBEmd4MdZ/itVBctN8I8djNoqgYrHQbPIsi8ias/
         5od4Zu0LAR/iKuJZCWysdj+vpdTY+gxRs3D+NGNLi4TUENAvnK+B1X70X6fdgZvHTEJd
         FAlJ4Jq+bn2qiJos+L8wwdHyR5/oWRQ5We0orzl6f2GuATQzmxgmf2PY+kZhPhHAmM6+
         +HMAlleoEcxQhrOlOJ7rg3fyC2/tAhNmjtSRw0Q1Qs+5F+e+LrfNwtG3szfCHHG7WXfP
         szL8pPaqyxNXrUvI7WbhC6S6K9EhJ1HVtkcZhnSRgPMexOt+sbeEkwgLjMnIkOP/mrdf
         avcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPROd8o6FH6HR7soh3Yn/g5ILG1BweH9e/HCa0e7is++YZItv8XgzYIlkwKGCfImDj1Dx9/8G3r7qrB3s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXB7q1wACvazMlDchO5Nui4k3qxO31YVvM3Au4Hj4LWesbe/1T
	bkEIIMAKLTq2aemyYYvkkb8GDgKATPTRbbu2ghVkKd9eOVTVnFUZOC7Obs6m1Ps26mX2ExocWnO
	lnjzCC14+mgZmyS9UkwEvIUxBs1ZjkSWJHEpbhXRUoRxQqYg0TkD1ujBDWbj7LB6hFHlWFgGv7E
	9e3A==
X-Gm-Gg: ASbGncu9eUsF8gONKoXpO6QkxQITLJaVtdI7mp2I7pAQj9s4nMCGmdsFTwiqIVr77BK
	T3k8pPkndumcA14Zg78CQEJX8bgo51+oRqAwMcJ6kEmvCKsjqbLTVuCmedkSANEZ4PQYzipP9Vp
	3W+bbHUlFu0jiVrqrBwud9yD16ne/DbPRyX+QFLDvhsYNONnLGyeJpQzi0dEZZuJE2dyAQX7wcp
	+smKWdDON2wP0mWrs02sU3HfLa0b/sHjNw6q0wXEdycPzAlKZv0FRC5gDrhBwM7Ka9qZa7O3PLB
	hHqH
X-Received: by 2002:a17:903:287:b0:215:cbbf:8926 with SMTP id d9443c01a7336-21dd7dddeabmr350239805ad.35.1738552376678;
        Sun, 02 Feb 2025 19:12:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEW85KdLcUDRiEGLjEV+sTd+bF/5MEuJ3Hn6OGahCN/cydQSnjK+aCn0zLmryY81e4Gjuewlw==
X-Received: by 2002:a17:903:287:b0:215:cbbf:8926 with SMTP id d9443c01a7336-21dd7dddeabmr350239495ad.35.1738552376297;
        Sun, 02 Feb 2025 19:12:56 -0800 (PST)
Received: from z790sl.. ([240f:74:7be:1:33e1:5e62:5b35:92b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de3300253sm65809075ad.162.2025.02.02.19.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 19:12:56 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/10] Documentation: gpio: document configfs interface for gpio-aggregator
Date: Mon,  3 Feb 2025 12:12:13 +0900
Message-ID: <20250203031213.399914-11-koichiro.den@canonical.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203031213.399914-1-koichiro.den@canonical.com>
References: <20250203031213.399914-1-koichiro.den@canonical.com>
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
 .../admin-guide/gpio/gpio-aggregator.rst      | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/Documentation/admin-guide/gpio/gpio-aggregator.rst b/Documentation/admin-guide/gpio/gpio-aggregator.rst
index 5cd1e7221756..e753f3dc4ae6 100644
--- a/Documentation/admin-guide/gpio/gpio-aggregator.rst
+++ b/Documentation/admin-guide/gpio/gpio-aggregator.rst
@@ -69,6 +69,99 @@ write-only attribute files in sysfs.
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
+    name to ``<example-name>`` (e.g., ``agg0``), except names starting with
+    ``_auto`` prefix, which are reserved for auto-generated configfs
+    entries corresponding to devices created via Sysfs.
+
+**Attribute:** ``/config/gpio-aggregator/<example-name>/live``
+
+    The ``live`` attribute allows to trigger the actual creation of the device
+    once it's fully configured. The accepted values are: ``1`` to enable the
+    virtual device and ``0`` to disable and tear it down.
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
+    If ``offset`` is >= 0:
+        * ``key`` specifies the name of the chip this GPIO belongs to
+        * ``offset`` specifies the line offset within that chip.
+    If ``offset`` is <0:
+        * ``key`` needs to specify the GPIO line name.
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
+   auto-generated and appear as ``/config/gpio-aggregator/_auto.<N>/``. You
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

