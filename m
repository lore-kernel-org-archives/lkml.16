Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EDD26FA52;
	Fri,  9 May 2025 06:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746773606; cv=none; b=rmsEX6TUOUeMWppvnJHeziHM4wdPRQDX95i5saVErs2j5AGDha4THMbjFyrJJ9MgRgQt1SWn6PLT2tdzNtpSc8MffAwAjmRbMLIQpiBCekLcaGO0LlVyvweVKV6n86Xpy7S5fOIxEJkWbdEpD1Pa32nzMwDC8NggYAbIdC7YXSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746773606; c=relaxed/simple;
	bh=XbyvX3UwLUkwC0pc5CuR0HrjYdx11LqUUQpNigy53lQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aA6eUfzFRJ4Rsdp+vQhJPglE4erRsdGbc3aaklWcvclGhVkimupuKLxWi181gviSSNpX455o8GSHOPW+MjBtFN3ynG021KlBSouNmK1N7fi7AYBmtQ9FM6ApywCefAtwTRzJ4rxO/+n+jNuxW7GvVanAHx+78G14mOFNNiNlbm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SIunfV3W; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SIunfV3W"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so12965055e9.1;
        Thu, 08 May 2025 23:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746773602; x=1747378402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hxIjdaLc48Q8gLT2aI5w+HCOv+woxWrYc8AKvi1Mj+s=;
        b=SIunfV3WnXacHZtOau+OBFDeRey6mP9kYIrIodEl6tCq99opEg124CcGsiBYc4jUqt
         fIqRs3Fnyh1GBN9UjKWAs+UidWvKGmtM2x2/8UofrBWqAr3FWaQ8koNJThx5Uc7+1Q76
         aR6bButIT5TZ78aBJ6DypUsuqBZ6eLdeP+YsRErIOMOj6ULjchj3eH2DztzH89GuybCu
         87vSt6qtE9U4KSoLHBOFOmqx0Ah0lqZdr6TLJXcSjDVVjRqo8RL10wlY+7QcoGY5Ndl4
         /NzBgCAr8UxrudWe6XaykVke1k4BlbsqDf045sZhlhques6d5dJ0ze/KVc1z/QHjSaQJ
         Qr0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746773602; x=1747378402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hxIjdaLc48Q8gLT2aI5w+HCOv+woxWrYc8AKvi1Mj+s=;
        b=Sr8RtM2zzUBedEMt8G8hMVhi88LP/9DRad6e9NSe2d+uhdX/O3RMCYK7jWDx3Lcoid
         OzKX+jgqczefikVGz0PqbVQixCgUqDK04NZHUgRSNwoc8TTYRj7+n/vgvv+6LgMan1f0
         sZkj2cQrFZm5Hp8WsoYQuUdj03dVoRmNPBofAdv51JmJUcL6QRYwzr5/i9ynIqLfkVhz
         T1P8I2mvDUlJSkwYtkO8fjOttG078v6TluLD86AcXJHcdaYF5/03Vle2PUQHzHSQbeWE
         CtoLHJRIj+gqRQxoEFy3TfsxpRCsZdo7aoyRR4Ysy29Ft7NU9sVSFc7IaPaD8fF02pMU
         jBZg==
X-Forwarded-Encrypted: i=1; AJvYcCW4ImohDihrmEB/mfONXcWTW9KeubpHuu7I7YXHHxRPxqCYNmN4lnP1djfwgoXy1A4y4AFf+fyPXhLhzIhD@vger.kernel.org, AJvYcCX4NX61La+xXL7ciVvClxbIPbdmWMBCkVvVtOvaGZHeChf1cigJy77CDj5Jr/o0nu+ZE3MKPMd/6zCI@vger.kernel.org, AJvYcCXCGSFiFPQOGGv6KYonSzFFcnAKimS3slF2YWTQCo4yzID6bg8NJyjlYZg6LhJCIzISBWOoV6jCGmNj@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0ifmVSE1DATnGw02dRpSXv1c8k9LU3nKWckR8WfTCBsQDraiA
	DStvcSv7Vp0Elny+TI9Y+aNvWMH86+bTgTnsHMOMPW8HqzVLTq/51h9UTpL4
X-Gm-Gg: ASbGncvqZdlyXp6zxcW+eSRBwGcQjAmshdXju8KldFoefaIY6YjR+rj6SnpmAr0U7X+
	38Hk7SkLoeJR8ojvYdy4exMOImFJU6HDOnCxYuFL3yW6pVr2jWOF50vWdMix2X+HwWkoZkQ43Ef
	vYBOLPjOtmlvOXh90gpwv3YdHncaaPiTwBAOK/eHwkOcDN0BWvBT0BygPMfd2a0lHLtdhkcMhX/
	L7ZnTuqARcviOUHWd/qEaynHomDkumEfMqzo0jWLEJVC5It5PGpZBuxSPZ+Up56zzNq211URBzp
	QVPiM5KyNtfvUPONMS3AlHU0R+pBhGwoV4UjZOAb07VyBOIfVmmxZw2qVpS83YpzbA==
X-Google-Smtp-Source: AGHT+IGh3zWR5dloNttdtVecxcltJ6Yzv9SN6JB89Afc2kJClOZagKrYdwWELSdcLPAC4dAN0R3e+Q==
X-Received: by 2002:a05:600c:c04a:b0:43d:abd:ad1c with SMTP id 5b1f17b1804b1-442d89cb6e1mr5314605e9.6.1746773602019;
        Thu, 08 May 2025 23:53:22 -0700 (PDT)
Received: from tempest2.110.lan (xt27dd.stansat.pl. [83.243.39.221])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67d5c2asm19276315e9.1.2025.05.08.23.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 23:53:21 -0700 (PDT)
From: Pawel Dembicki <paweldembicki@gmail.com>
To: linux-hwmon@vger.kernel.org
Cc: Pawel Dembicki <paweldembicki@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Noah Wang <noahwang.wang@outlook.com>,
	Fabio Estevam <festevam@gmail.com>,
	Michal Simek <michal.simek@amd.com>,
	Naresh Solanki <naresh.solanki@9elements.com>,
	Grant Peltier <grantpeltier93@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Shen Lichuan <shenlichuan@vivo.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Charles Hsu <ythsu0511@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 3/5] hwmon: pmbus: mpq8785: Add support for MPM3695 family
Date: Fri,  9 May 2025 08:51:07 +0200
Message-ID: <20250509065237.2392692-4-paweldembicki@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250509065237.2392692-1-paweldembicki@gmail.com>
References: <20250509065237.2392692-1-paweldembicki@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the Monolithic Power Systems MPM3695 family.
It contains four devices with suffixes: -10, -20, -25 and -100.
The device is PMBus compliant and shares characteristics with the
MPM82504.

MPM3695-25 has different VOLTAGE_SCALE_LOOP register size [11:0]
and it needs to be separated because it will be configured in the next
commit.

Tested with device tree based matching (MPM3695-10).

Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>

---
v2:
  - Added whole MPM3695 family
---
 Documentation/hwmon/mpq8785.rst | 13 +++++++++----
 drivers/hwmon/pmbus/mpq8785.c   |  8 +++++++-
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/Documentation/hwmon/mpq8785.rst b/Documentation/hwmon/mpq8785.rst
index be228ee58ce2..7093e4db4f55 100644
--- a/Documentation/hwmon/mpq8785.rst
+++ b/Documentation/hwmon/mpq8785.rst
@@ -7,6 +7,7 @@ Supported chips:
 
   * MPS MPQ8785
   * MPS MPM82504
+  * MPS MPM3695 family
 
     Prefix: 'mpq8785'
 
@@ -29,6 +30,14 @@ The device can also operate in parallel with the MPM3695-100 and additional
 MPM82504 devices to provide a higher output current. The MPM82504 operates
 at high efficiency across a wide load range.
 
+The MPM3695 family is a scalable, ultra-thin, fully integrated power module with
+a PMBus interface. It offers a complete power solution that achieves up to
+10A (-10 variant), 20A (-25 variant), 25A (-20 variant), 100A (-100 variant)
+of output current with excellent load and line regulation across a wide input
+voltage range. It operates at high efficiency over a wide load range, and can
+be parallled to deliver higher current. Variants -10,-20 and -100 have different
+voltage scale configuration register range (10 bits) than -25 version (11 bits).
+
 The PMBus interface provides converter configurations and key parameters
 monitoring.
 
@@ -42,10 +51,6 @@ Fully integrated protection features include over-current protection (OCP),
 over-voltage protection (OVP), under-voltage protection (UVP), and
 over-temperature protection (OTP).
 
-All supported modules require a minimal number of readily available, standard
-external components. The MPQ8785 is available in a TLGA (5mmx6mm) package
-and the MPM82504 is available in a BGA (15mmx30mmx5.18mm) package.
-
 Device compliant with:
 
 - PMBus rev 1.3 interface.
diff --git a/drivers/hwmon/pmbus/mpq8785.c b/drivers/hwmon/pmbus/mpq8785.c
index 9a4a211b2aeb..34245d0d2125 100644
--- a/drivers/hwmon/pmbus/mpq8785.c
+++ b/drivers/hwmon/pmbus/mpq8785.c
@@ -10,7 +10,7 @@
 
 #define PMBUS_READ_TEMPERATURE_1_SIGN	BIT(9)
 
-enum chips { mpq8785, mpm82504 };
+enum chips { mpq8785, mpm82504, mpm3695, mpm3695_25 };
 
 static int mpq8785_identify(struct i2c_client *client,
 			    struct pmbus_driver_info *info)
@@ -79,6 +79,8 @@ static struct pmbus_driver_info mpq8785_info = {
 static const struct i2c_device_id mpq8785_id[] = {
 	{ "mpq8785", mpq8785 },
 	{ "mpm82504", mpm82504 },
+	{ "mpm3695", mpm3695 },
+	{ "mpm3695-25", mpm3695_25 },
 	{ },
 };
 MODULE_DEVICE_TABLE(i2c, mpq8785_id);
@@ -86,6 +88,8 @@ MODULE_DEVICE_TABLE(i2c, mpq8785_id);
 static const struct of_device_id __maybe_unused mpq8785_of_match[] = {
 	{ .compatible = "mps,mpq8785", .data = (void *)mpq8785 },
 	{ .compatible = "mps,mpm82504", .data = (void *)mpm82504 },
+	{ .compatible = "mps,mpm3695", .data = (void *)mpm3695 },
+	{ .compatible = "mps,mpm3695-25", .data = (void *)mpm3695_25 },
 	{}
 };
 MODULE_DEVICE_TABLE(of, mpq8785_of_match);
@@ -110,6 +114,8 @@ static int mpq8785_probe(struct i2c_client *client)
 		info->identify = mpq8785_identify;
 		break;
 	case mpm82504:
+	case mpm3695:
+	case mpm3695_25:
 		info->format[PSC_VOLTAGE_OUT] = direct;
 		info->m[PSC_VOLTAGE_OUT] = 8;
 		info->b[PSC_VOLTAGE_OUT] = 0;
-- 
2.43.0

