Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC3326A092;
	Wed, 23 Apr 2025 07:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745394618; cv=none; b=L/4Ljny5UK5wuaUl84puWBRIX6Q6H0mSAN8V7sqAbWiulBQAPb1dwW7r7A9n7orF/bp3mkFUaVa9jjMDlPtB1CdqsL6qqwrSADHiwUj5dOvBW5F4eeey/JA8FPblYXpsm19vjfyvOsNPWXvKfDGHK6GgC81rVQopHY8IGn31V0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745394618; c=relaxed/simple;
	bh=ejPJc142FO5RP1Y1Nd+s9OWuZ6CAVPGq4kZVh8TnF+Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kdwTyz+raamvLAX0ANFUedICbKW6y075vd/Eep20SlLgq6U309uywKVU1EMYsfzbn/vAYjivw58JcuSHqhdw4RJDR868NFELcH5hhuY7Pw3XwzEZFsaG3O1RIWLu/sAyKYrH/kGo0fCkrvXqQXYQWb8w6yDlzie7MG6VoSW82uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gUXwVCXp; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gUXwVCXp"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-223fb0f619dso70021705ad.1;
        Wed, 23 Apr 2025 00:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745394616; x=1745999416; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=utfcfSySktGqqSsZd6F8G5Wk9jaiDpJsZODjNPiEWa0=;
        b=gUXwVCXp7ud/pcULpGj3R+ZlLsMd17r0eXfiRYk41kziRcA3JRR5pWOJChrl0AOpFY
         M+vV7IgvL2NGvwhGjNPy+WwUBTRJtDP/njsxut/9zEYDjGO7GjnRQkNfsKpE2RgxOpeI
         KKSfcPVTTb49p9NMc+maMGwrhieDZzt5x3UvEvkrMe8DVG8LTOmncbrYA6OZ33c0pAtx
         3orbov4KGumfi52xnnOSIfDkxAtpv4p5PZWd6360m9N0KwzR4x1s4d7nRx3hUSHnEcGQ
         RKv6GLQoLrDAhTgGBnWdrFghbqDcMp4M6Evwhtk3evci9AkY9jRVL2QuhZ0qMXvmWkwZ
         E5fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745394616; x=1745999416;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=utfcfSySktGqqSsZd6F8G5Wk9jaiDpJsZODjNPiEWa0=;
        b=VQk4bEc7/45bgsIXKkWNqsSsS8N8X5eswcqlzsKRHduZD6GDtdK/VVLpiocfXdSfV2
         37frcWkRGGUxkDG7/j4dbaw5VlHJX7l4YJyFXd5ZHqCJI87lLlExxu1TzlRNo3nMuAue
         Us7aqUBf0tDaVILPz1jyJbaAG5WYcigDDXAcp+H9b6pBn586aGToLn2qgb08XFyDRO4v
         xS61efnZlw76CvRu9xp+TeiqIE2PdaELGiivRpvifLfn5NcDALQVKn6aRgaspTk0kJ1V
         fhSQONCrlFqzbPemUu8FOVHRJHBeoSSEPj0LjFiX1JLXFXFP2rcrIabKcJZquRyVVaS+
         rSkg==
X-Forwarded-Encrypted: i=1; AJvYcCUet/GbnkJmqY7MZdxF7bCJS7AP+tqapp58LjZzy+bqUGK1cG7KS3S06gvcwKoLmn3lDL2q8q583PBwldErbIYONr0dwg==@vger.kernel.org, AJvYcCXH31eYK+wa6NSAup64hd/beyXAAm6xf/WNwI9j7QfRwiPgANJkZOF6454LlOVx2Y0+JpWQZ6AllJwDq8U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6//VPT27s7hDdz5wt8H6XYftBmWJBYeRAq1LrCiYs2DVmBfZw
	v8VEA+p8hUd2WBNCZRAraKNz8yntDN6ivf9jeA+Hy9EmlusUDcUD
X-Gm-Gg: ASbGnctao2aJKidSJKs2wl/Ui4gQkdOEA3b4HcC44k1dd6DKn+z+Fk1FU3/GBSNF8Qw
	Haj5QTuYIUyGcnQz5L9aqnvAuHE5+H7DQCSVCz/MrDBOZ3sQquSJS1ZxMFEf9y/EP7gSvxDPmi0
	c8mUcYhJ8bTX18xe+II+uKQ8mrpdK2mlrWjmYOjwJ51iMoeOrFrXUVvm6vRSsunQqmiZdkoDyr6
	2vfa9xTy5uarNpmJMMVethhiP6ileyWFbLykzj5p4Br+5Ra0wtH+s6AWWecZL4Y7kFCNl0dwFxc
	EmiffYMTUgpmnpCqAcIKtb74mezJfkaDUwm/3RGU
X-Google-Smtp-Source: AGHT+IHMwdvJOFF2zzxoEORYG5dAL1gxr9tE1beysMXjw1izfb1Qk8C+/q6gAfnZ+50toQV46j3g8w==
X-Received: by 2002:a17:902:ebc4:b0:223:5c77:7ef1 with SMTP id d9443c01a7336-22c53586639mr274436145ad.21.1745394616050;
        Wed, 23 Apr 2025 00:50:16 -0700 (PDT)
Received: from [192.168.1.26] ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bdac67sm98240235ad.29.2025.04.23.00.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:50:15 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Wed, 23 Apr 2025 04:49:46 -0300
Subject: [PATCH 2/2] Documentation: wmi: alienware-wmi: Add GPIO control
 documentation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-awcc-gpio-v1-2-160a11bc3f9a@gmail.com>
References: <20250423-awcc-gpio-v1-0-160a11bc3f9a@gmail.com>
In-Reply-To: <20250423-awcc-gpio-v1-0-160a11bc3f9a@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: Gabriel Marcano <gabemarcano@yahoo.com>, 
 platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
 linux-kernel@vger.kernel.org, Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.14.2

Add documentation for the GPIO control methods.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 Documentation/wmi/devices/alienware-wmi.rst | 85 +++++++++++++++++++++++++++--
 1 file changed, 81 insertions(+), 4 deletions(-)

diff --git a/Documentation/wmi/devices/alienware-wmi.rst b/Documentation/wmi/devices/alienware-wmi.rst
index 79238051b18bc5de9b502325017cd5c5fcf41748..8751199834b8e2a3a4abf2b735e4ac6067d93c6d 100644
--- a/Documentation/wmi/devices/alienware-wmi.rst
+++ b/Documentation/wmi/devices/alienware-wmi.rst
@@ -231,6 +231,77 @@ WMI method MemoryOCControl([in] uint32 arg2, [out] uint32 argr)
 AWCC supports memory overclocking, but this method is very intricate and has
 not been deciphered yet.
 
+GPIO control Methods
+====================
+
+Alienware and Dell G Series devices with the AWCC interface, usually have an
+embedded STM32 RGB lighting controller with USB/HID capabilities. It's vendor ID
+is `187c` while it's product ID may vary from model to model.
+
+The control of two GPIO pins of this MCU is exposed as WMI methods for debugging
+purposes.
+
++--------------+--------------------------------------------------------------+
+| Pin          | Description                                                  |
++==============+==============================================================+
+| 0            | Device Firmware Update (DFU) mode pin.                       |
+|              |                                                              |
+|              | **HIGH**: Enables DFU mode on next MCU boot.                 |
+|              |                                                              |
+|              | **LOW**: Disables DFU mode on next MCU boot. (default)       |
++--------------+--------------------------------------------------------------+
+| 1            | Negative Reset (NRST) pin.                                   |
+|              |                                                              |
+|              | **HIGH**: Turn on MCU. (default)                             |
+|              |                                                              |
+|              | **LOW**: Turn off MCU.                                       |
++--------------+--------------------------------------------------------------+
+
+See :ref:`acknowledgements` for more information on this MCU.
+
+.. warning::
+   The following methods are only exposed to DebugFS if the ``gpio_debug``
+   unsafe module parameter is set, as you could end up bricking the MCU.
+
+WMI method FWUpdateGPIOtoggle([in] uint32 arg2, [out] uint32 argr)
+------------------------------------------------------------------
+
++--------------------+------------------------------------+--------------------+
+| Operation (Byte 0) | Description                        | Arguments          |
++====================+====================================+====================+
+| 0x00               | Set the Device Firmware Update     | - Byte 1: Pin      |
+|                    | (DFU) pin status.                  |   status           |
++--------------------+------------------------------------+--------------------+
+| 0x01               | Set the Negative Reset (NRST) pin  | - Byte 1: Pin      |
+|                    | status.                            |   status           |
++--------------------+------------------------------------+--------------------+
+
+WMI method ReadTotalofGPIOs([out] uint32 argr)
+----------------------------------------------
+
++--------------------+------------------------------------+--------------------+
+| Operation (Byte 0) | Description                        | Arguments          |
++====================+====================================+====================+
+| 0x00               | Get the total number of GPIOs.     | - None             |
++--------------------+------------------------------------+--------------------+
+
+WMI method ReadGPIOpPinStatus([in] uint32 arg2, [out] uint32 argr)
+------------------------------------------------------------------
+
++--------------------+------------------------------------+--------------------+
+| Operation (Byte 0) | Description                        | Arguments          |
++====================+====================================+====================+
+| 0x00               | Get the Device Firmware Update     | - None             |
+|                    | (DFU) pin status.                  |                    |
++--------------------+------------------------------------+--------------------+
+| 0x01               | Get the Negative Reset (NRST) pin  | - None             |
+|                    | status.                            |                    |
++--------------------+------------------------------------+--------------------+
+
+.. warning::
+   There known firmware bug in some laptops where reading the status of a pin
+   also flips it.
+
 Other information Methods
 =========================
 
@@ -239,10 +310,16 @@ WMI method ReadChassisColor([out] uint32 argr)
 
 Returns the chassis color internal ID.
 
+.. _acknowledgements:
+
 Acknowledgements
 ================
 
-Kudos to `AlexIII <https://github.com/AlexIII/tcc-g15>`_ and
-`T-Troll <https://github.com/T-Troll/alienfx-tools/>`_ for documenting and
-testing some of this device's functionality, making it possible to generalize
-this driver.
+Kudos to
+
+* `AlexIII <https://github.com/AlexIII/tcc-g15>`_
+* `T-Troll <https://github.com/T-Troll/alienfx-tools/>`_
+* `Gabriel Marcano <https://gabriel.marcanobrady.family/blog/2024/12/16/dell-g5-5505-se-acpi-or-figuring-out-how-to-reset-the-rgb-controller/>`_
+
+for documenting and testing some of this device's functionality, making it
+possible to generalize this driver.

-- 
2.49.0

