Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EDF2135C7;
	Mon, 28 Apr 2025 22:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745878515; cv=none; b=hqrqBDVR8RkBt0nYGdtxF9Fk8X59pF4SesIGUJhWAx0TBn9XX1r10IbarrQ2OhLc+R4v4pGBZ/1pVMDvg4OjnntjcLN52U9JCc3sF8FVDn9goVwbzD2ZoGxqEHaGMgW3Cpcl0t69bV+FtJMs1UkaEa/LE8uT8WXectg1k+NMVKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745878515; c=relaxed/simple;
	bh=k/RC/fx6n8Q8+zu7/SzWd6ryzsTJfbFrnEhd/YoOr/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jUHaXp+7yxsufnaZvOjhlBC32G8fXevIQQIxZZapjwpbfl+2HcS6E23eswa1tL6az/xHrMtQEFaZrj5kD5tyk1qOZFbCrAwJOLfaaVNErgGn3E5FIETCuBRmv3Nu6ySN80V1MEg8GjXhO6OF9NInoHIck9maHlFP+mCOO+4AYOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JuAZoUUe; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JuAZoUUe"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43ed8d32a95so47124975e9.3;
        Mon, 28 Apr 2025 15:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745878511; x=1746483311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=psj4zvO337MlnZiqJVa6K5ww5rTOJT1l7hJQRnCvMqA=;
        b=JuAZoUUeLSeQVyAzNUlakgGmV2h98n4NjV4tsb1Tk5UK8bR4OPLJlvQxh0TXDICAXl
         /Z2CIWDLQi05G2Mcu0G5dism/Ad7CG6fVuCldNmSwH4DJA4fd/d36MBr8DSpXMBbSsDm
         uUtz7W7GM2YQSnTSNul9RygroYKnYJkWKAlGC63acwI0z4onIzaAjlSrbbQNWf/RlyjA
         ZbV3iKd7f8D9QeBIsElUHMANDbNObsbPu6TvCQh7uB6G4rFih3hkcYor10Jo/RN/v7rT
         nWn0Aq7Osx15vSrThnm4WBhgTAry4JSvZEKdBl1fpLyAKX/15flUf26ZzbofKHoH+pai
         EyAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745878511; x=1746483311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=psj4zvO337MlnZiqJVa6K5ww5rTOJT1l7hJQRnCvMqA=;
        b=bk4de9pxmkXpq56khTxa+2Ds61ismaqkl4o9IhPQt1LERx3dnDYuqELeEJKFECt6bd
         1KQY1A2WgVflUy9bQvTw+N9DG43Ftf0A+zSx9M5h+fu1MI5sgXWgedupG/G+kpygVpFq
         2tf62eaLQfIMYxm9AykS2J61iLa3gxKtue0b2uDb9q1jcf1wtQCMk1ruuJeTFpGNHhFO
         Ev31kIw7s/6c+X1p3cMma0LN5GeoJLF/Q+U+ATC7Er8gplG3cPMIdaX8VDsKgKVGmJtq
         Q2ktarFZyd1j36tw+AXnQ1u8qUPB4hhl+LYU9BaTXHOPh8qhot/L9mII/gofIOleg0OP
         VC/Q==
X-Forwarded-Encrypted: i=1; AJvYcCU75DNkc6qXqPwjptPSCwDjensL0Lrdpbpy0+pxigz5Hecu6VRXizt/qFtwjEmkb9SLXoerkMyWsxvO@vger.kernel.org, AJvYcCU9ETkspVBpwODwiI+ssT6I69l1UOBua8R8PR3OQXTVn6eud38fAnVUrnvNi/JlxumZJiNJF4pblkrh@vger.kernel.org, AJvYcCUrhn9kWzh6eFYgsCnzkDNg5Ie+HG7EtZ55o4BHV+XUk9rL6k/Q1cAkop6fe4uUa54iWunCX7Rc7xrVWqJs@vger.kernel.org
X-Gm-Message-State: AOJu0YyygYvz8w/Sc1PwchTazdcsWTgUcIRhnW6MAxkYyJ/gqA9xI387
	aFtwr4N6STrc41yM9ql2UKSXMoi75cnzzKQg7x095+Ij5bX/RDO/WU2rZ/tt
X-Gm-Gg: ASbGncuFsgHjZTzIShf8X4rXWXZfRRz6mVotF/L0hDia0Z/oF+2E5xMMk5oZeAEEXwi
	jVpqROMmUp9T+n69r7OovN78yYNzOOxYFACd98xs25ZVTIC7JkAvxnDyVtJGMHfF4701wOB8lyi
	rAil2XNfF7p/s19yolSE3A9XdNTJ35SzyClVr3Un/tuonRcxDu+kWTVHQqT54q+R56Y9ZaUzbRf
	m2+CDaMX7gUrTbZk/S6nEiEMuC+Hd4f3vz+iBSQKMYdpGbWTvvX0C3fkvoVFFI5NFRcpaJsiIaa
	8pmUz3+14PxRN3zictUFPqST9Th000dEs9jhI8lCj6OBElWKdjq4+Dc0A4uCEWEbtA==
X-Google-Smtp-Source: AGHT+IFLYjghUc2bmuXcDtV1VnIGkrz2YDg0oSiZFJYuIv2kxvSBVb4b333fC0pzHsRWF2z4oHf7TQ==
X-Received: by 2002:a05:600c:a016:b0:43c:e8ba:e166 with SMTP id 5b1f17b1804b1-441ac918052mr5465205e9.22.1745878511184;
        Mon, 28 Apr 2025 15:15:11 -0700 (PDT)
Received: from tempest2.110.lan (xt27dd.stansat.pl. [83.243.39.221])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a53870f9sm135901085e9.33.2025.04.28.15.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 15:15:10 -0700 (PDT)
From: Pawel Dembicki <paweldembicki@gmail.com>
To: linux-hwmon@vger.kernel.org
Cc: Pawel Dembicki <paweldembicki@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Peter Zijlstra <peterz@infradead.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Shen Lichuan <shenlichuan@vivo.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Charles Hsu <ythsu0511@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 3/5] hwmon: pmbus: mpq8785: Add support for MPM3695
Date: Tue, 29 Apr 2025 00:13:33 +0200
Message-ID: <20250428221420.2077697-4-paweldembicki@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250428221420.2077697-1-paweldembicki@gmail.com>
References: <20250428221420.2077697-1-paweldembicki@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add support for the Monolithic Power Systems MPM3695 device.
The device is PMBus compliant and shares characteristics with the
MPM82504.

Tested with device tree based matching.

Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>
---
 Documentation/hwmon/mpq8785.rst | 13 +++++++++++--
 drivers/hwmon/pmbus/mpq8785.c   |  5 ++++-
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/Documentation/hwmon/mpq8785.rst b/Documentation/hwmon/mpq8785.rst
index be228ee58ce2..20d43b8bba97 100644
--- a/Documentation/hwmon/mpq8785.rst
+++ b/Documentation/hwmon/mpq8785.rst
@@ -7,6 +7,7 @@ Supported chips:
 
   * MPS MPQ8785
   * MPS MPM82504
+  * MPS MPM3695-10
 
     Prefix: 'mpq8785'
 
@@ -29,6 +30,13 @@ The device can also operate in parallel with the MPM3695-100 and additional
 MPM82504 devices to provide a higher output current. The MPM82504 operates
 at high efficiency across a wide load range.
 
+The MPM3695-10 is a scalable, ultra-thin, fully integrated power module with
+a PMBus interface. It offers a complete power solution that achieves up to
+10A of output current with excellent load and line regulation across a wide
+input voltage range. The device’s 2mm height enables it to be placed on the
+backside of a PCB for space optimization. It operates at high efficiency over
+a wide load range, and can be paralleled to deliver higher current.
+
 The PMBus interface provides converter configurations and key parameters
 monitoring.
 
@@ -43,8 +51,9 @@ over-voltage protection (OVP), under-voltage protection (UVP), and
 over-temperature protection (OTP).
 
 All supported modules require a minimal number of readily available, standard
-external components. The MPQ8785 is available in a TLGA (5mmx6mm) package
-and the MPM82504 is available in a BGA (15mmx30mmx5.18mm) package.
+external components. The MPQ8785 is available in a TLGA (5mmx6mm) package,
+the MPM82504 is available in a BGA (15mmx30mmx5.18mm) package and the MPM3695-10
+is available in an LGA-45 (8mmx8mmx2mm) package.
 
 Device compliant with:
 
diff --git a/drivers/hwmon/pmbus/mpq8785.c b/drivers/hwmon/pmbus/mpq8785.c
index 7ee201550554..e6a643856f08 100644
--- a/drivers/hwmon/pmbus/mpq8785.c
+++ b/drivers/hwmon/pmbus/mpq8785.c
@@ -8,7 +8,7 @@
 #include <linux/of_device.h>
 #include "pmbus.h"
 
-enum chips { mpq8785, mpm82504 };
+enum chips { mpq8785, mpm82504, mpm3695_10 };
 
 static int mpq8785_identify(struct i2c_client *client,
 			    struct pmbus_driver_info *info)
@@ -60,6 +60,7 @@ static struct pmbus_driver_info mpq8785_info = {
 static const struct i2c_device_id mpq8785_id[] = {
 	{ "mpq8785", mpq8785 },
 	{ "mpm82504", mpm82504 },
+	{ "mpm3695-10", mpm3695_10 },
 	{ },
 };
 MODULE_DEVICE_TABLE(i2c, mpq8785_id);
@@ -67,6 +68,7 @@ MODULE_DEVICE_TABLE(i2c, mpq8785_id);
 static const struct of_device_id __maybe_unused mpq8785_of_match[] = {
 	{ .compatible = "mps,mpq8785", .data = (void *)mpq8785 },
 	{ .compatible = "mps,mpm82504", .data = (void *)mpm82504 },
+	{ .compatible = "mps,mpm3695-10", .data = (void *)mpm3695_10 },
 	{}
 };
 MODULE_DEVICE_TABLE(of, mpq8785_of_match);
@@ -92,6 +94,7 @@ static int mpq8785_probe(struct i2c_client *client)
 
 		break;
 	case mpm82504:
+	case mpm3695_10:
 		info->format[PSC_VOLTAGE_OUT] = direct;
 		info->m[PSC_VOLTAGE_OUT] = 8;
 		info->b[PSC_VOLTAGE_OUT] = 0;
-- 
2.43.0

