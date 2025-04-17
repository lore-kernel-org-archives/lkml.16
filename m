Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD181C8F0;
	Thu, 17 Apr 2025 19:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744919437; cv=none; b=My2YHpIGXuwqxi07OXxJrGh/1Cfz8WJbOcAVUaArO8mbS6Z1PVXzFOVB2aKPExGGjpWM3oMh4WdGsP8lKCjG9MWyVAT2WZdaeIoKQldi1mVvoKPqR3m6YQHIImpdfkIJH+y7byL5CEh5SMkgz11wsZI9hekbwInOnGGCymtAfwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744919437; c=relaxed/simple;
	bh=gjDqHVq3XxfgifA41K24jhd2USvJnkDVNheM8Nop2Vo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Fo1xOpfzBFaQ/ZBj9g3TqkABfw5YrHV0Mk6XylJGBLYqsgx6SFxB/1pXgF3uVrlnH23L79tSaDtRIQ7/fdBxoe7gkHYqqqwil9jNNkcIvFaWqIXCfRzrOeiW9dU/m9xB+hp2R+QYe1ilA+sszKx772mIk9Ddp6htuZ1duEYd7mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EDroF52e; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EDroF52e"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7c5c8a4a986so5676985a.3;
        Thu, 17 Apr 2025 12:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744919434; x=1745524234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AV5uSbCdwy0RJo47xIlP66kTWMr10v+1ER/kOH8y5mg=;
        b=EDroF52e2s2yZ9jXEzBtKsg9krbCl+cLcyvn3HL57q6d6aXL4CkiQHMmTWcuC9FJ6u
         xjJh9sUx3s1b3JA20crEni13+rQSllkLCPRq7pEVqUL4jBNdFmlnEzNLyod+nPgwFKCt
         WSAKrNr3mKTqF/zUPTzb/RScihGkb1obS05jvmN2FJWY7cmKE09QHexXQpwVJNyQ+iaM
         htYA5ZTdA81UMxZCMwjmiQstfL7c0jnGjeElKyfUmA0yAoe1jdipvnPlYHdT/oBlwVak
         t1hrNi27GxolsJPRsTds7Tox2uf22WmwxYgONW+cvGBuD8/Fu5canXuB1gYGI+RXlgz7
         LkRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744919434; x=1745524234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AV5uSbCdwy0RJo47xIlP66kTWMr10v+1ER/kOH8y5mg=;
        b=CAWA0yoKx2JkIVUwu+ehQxv8UOvsdrYsAMnc2FIzmv52OArgyDsmOjpICKrotzccP0
         VgM9CgEcFVZLLzvnl83nW9cwfNSNIZhrXQH8WsgeyKTd4YY1BWGgl2RydOx60gLTqJ61
         IpHdyVrhpT8mPRg2ZCarWJQHG3RFrbjIXyvMNKyaSMI4QJV4PqvRdkKnLd+DisA093T/
         k61EDM/Fq75I7ZCfmkV1HliXJdybQeV1mtZ15TqOD3o+R/4H/LDPLJHMVZc26F/a4UCv
         74ruZEqZzY8k3wrGltWe/UCmdjLCQS8geINF8cSZQeBv9GdMIxht5FcdHDIaw/Xefc7f
         4zQg==
X-Forwarded-Encrypted: i=1; AJvYcCXOSdR+tueoOmhQdLKudm7GYQFpwqmI/kKo9oOLcBg+2LFc4tBYFT/bQq6cAa5qlxc6ccEpIE3C/Hh7j/Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFHReAKEtPLncieOyRxMvtRiN7nJyA4qqA5ezeuqhfqEnwQdEx
	nqqtCxB1K45230dKjSm8e3Y7RGay5SMhBLDS5ZYyAgmBkTZNOQI=
X-Gm-Gg: ASbGncuVjBi7F3cbe7g1OfCZlzmvNy0T08O5bBnyJHVReXGDFT3fsSfVdUvLj88d3p7
	w+A4JMIrKv04Ozs5mq83gJIPPUt3yU5iudQQWSRoi9FIj2h/Kohfc40iAbEW2ICD5uQ0RHM+7DZ
	mB48M/7MLdFlGxz6U8sNFaGLZkjszkIO5d4XDwC9Qpi4oAjRu8zXifreqjv9xXbiXMzS2x5h4Ko
	dJugsoXGmeCcfilzqKX921o5dswfd+l/Ce5Lxb6ppVFhKTV9MK42yoB3DVFvtkYfDMmy1kDcd41
	NfzXi/1jKSfrck67/8YGAZJTGmE4iJWvXFv5jA==
X-Google-Smtp-Source: AGHT+IF8Nbd9Hp8vVK0Z8NAPkOXBEgoCrJfS4vNVNsk4w7yEAqpo13XJkqVEX7oz+RIX6StuoRlpig==
X-Received: by 2002:a05:620a:bcc:b0:7c0:bb63:5375 with SMTP id af79cd13be357-7c927f9cb17mr7975685a.4.1744919434583;
        Thu, 17 Apr 2025 12:50:34 -0700 (PDT)
Received: from ise-alpha.. ([2620:0:e00:550a:642:1aff:fee8:511b])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925b775c1sm25832085a.97.2025.04.17.12.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 12:50:34 -0700 (PDT)
From: Chenyuan Yang <chenyuan0y@gmail.com>
To: gregkh@linuxfoundation.org,
	mathias.nyman@linux.intel.com,
	mika.westerberg@linux.intel.com,
	ribalda@chromium.org,
	rafael.j.wysocki@intel.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chenyuan Yang <chenyuan0y@gmail.com>
Subject: [PATCH] usb: acpi: Prevent null pointer dereference in usb_acpi_add_usb4_devlink()
Date: Thu, 17 Apr 2025 14:50:32 -0500
Message-Id: <20250417195032.1811338-1-chenyuan0y@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As demonstrated by the fix for update_port_device_state,
commit 12783c0b9e2c ("usb: core: Prevent null pointer dereference in update_port_device_state"), 
usb_hub_to_struct_hub() can return NULL in certain scenarios, 
such as during hub driver unbind or teardown race conditions, 
even if the underlying usb_device structure exists.

Plus, all other places that call usb_hub_to_struct_hub() in the same file
do check for NULL return values.

If usb_hub_to_struct_hub() returns NULL, the subsequent access to
hub->ports[udev->portnum - 1] will cause a null pointer dereference.

Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
Fixes: f1bfb4a6fed6 ("usb: acpi: add device link between tunneled USB3 device and USB4 Host Interface")

---
 drivers/usb/core/usb-acpi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/core/usb-acpi.c b/drivers/usb/core/usb-acpi.c
index 935c0efea0b6..ea1ce8beb0cb 100644
--- a/drivers/usb/core/usb-acpi.c
+++ b/drivers/usb/core/usb-acpi.c
@@ -165,6 +165,8 @@ static int usb_acpi_add_usb4_devlink(struct usb_device *udev)
 		return 0;
 
 	hub = usb_hub_to_struct_hub(udev->parent);
+	if (!hub)
+		return 0;
 	port_dev = hub->ports[udev->portnum - 1];
 
 	struct fwnode_handle *nhi_fwnode __free(fwnode_handle) =
-- 
2.34.1

