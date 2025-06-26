Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181F5220698;
	Thu, 26 Jun 2025 11:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750937638; cv=none; b=M3h/ID7e21HFZ0gQBoaKsQWbKRFHAsyTwTxDzgmjX8V9YK16FZ2B48hE5MznFTS/qJZp4deXzH5VsDrIwhAJIYsDLLuZqoerBPwiaDKE+e+s+2E+RU+NuL8IFviyLcJ328sUoFtz8vUwUnOAUiN9lC+PlTOZqB0Y8u4JaReTWNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750937638; c=relaxed/simple;
	bh=I6VgIPZARUNjRRy1gZ4EqOBBacqiEQE6LIrR1nGA3JM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fQwqvOS1hfu3L/VAedr6MjCtvdQbiBqJ2HXmhruxq1wrPnlEd24ojrNGpVhf2Nb+OD+u3/hISdNkVCKqeyF69aYeILEo57HY22j1nJyfx+PqiW+Qj6RfV33MgVJakINB6Lz6KELvC4kHPzyOtPFfG9TPcRzYb3hyPNmbyuanu2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C0bgE3Ip; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C0bgE3Ip"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a528243636so510771f8f.3;
        Thu, 26 Jun 2025 04:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750937635; x=1751542435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dxbjeI5jsc0hMOr5jPn6QCS4hem2nL+Ns8VMIMaaELs=;
        b=C0bgE3Iph6P8dKXxh6Iyz6n8+1sTbLZ2vMefeKMAqrM1lis3NqFCiMk73+TZ5wdpnk
         aMgJ3D55X5XDqYpOqOS5vZCjHuXXRy4gUTelqEkbvd6d1QZKDfxE4BjepVMDYvEWcb09
         DHRJ+FVyZdxYMVkbj7HA8RLbVsszyxhzTPVo7Y/NvlOpT0UBRrifjBsxj8jGvTqcTXBI
         6Lj2bTzcHDKjJh64YoD7BUZP31H3PWd3vCCo9mTqe+VfcXmPBo/eIfu2HRw8LRXvP1Q+
         b+kHsudgiBBErqu5dBaQw6Db6a5Vgr9PRWqawfwxwqg9YeOcctY2DVOtBRvpvCH36tPS
         QNYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750937635; x=1751542435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dxbjeI5jsc0hMOr5jPn6QCS4hem2nL+Ns8VMIMaaELs=;
        b=gfA6BwZD95qfz+YWWIQsU5XD9i34TWHF+fbTitkaN7oKvv1+2SBKaVTs/r5OaBMsTA
         vdDKTOHJA0xNRXIoERAZ/NXSCJ+/2bWY8PoTHuk7VyHdUnMwxPOeiN72inKA/ezE+rO+
         0848Mut+mIkkG6BvbeHG9lniGCQVNipXZanFoSVfDVm8mOWgnxtHZgT0FbqpmxLBFlH1
         qmGh6JHX5vTr3bMSmGO2GossETKna9fNkN4UA+eglYzoZCdV+pQiuWk0TwJRrg769CCe
         2yn66UAgOSGhpoT7z0Ntu6puwH1SppwV+X3EIffvNrswxW2jIAGHSZBTKTyfABrWF7KE
         XytQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8MnnfxfHg3+mVAp3D/Fg6sHdOKW2kMF5i18NYtE3sA87nIdReixUs7NpUHsvrkyXF8rcCWefpYKflIno=@vger.kernel.org, AJvYcCWiBPDr362htKgugqY6IhrAAHPVirCUP6QwtSFRz2XPlJi9gF/XnQNy6NFtJsOcSHBzpnINobKfPzQpQoy0@vger.kernel.org, AJvYcCWvqatUNiN7OtZPWLwjErkRKfkYqP4tm9aFTmn3cOZugBl3UzpvPEM58EJStJaZOfCjNr2fozPc+Ohh@vger.kernel.org, AJvYcCWzrFqGdEee5CfsYKbl2NKoXXoBa45+7hcJtG7siCKXPdmFjXp7LA1Q1VSrthdGilfqdrb+lOXXRuGn@vger.kernel.org
X-Gm-Message-State: AOJu0YzkeUSpKOKCM32mmgWDCn81CwKjo+rI7JjHmEuu/e2DWDGZ09Fu
	p0pcivIjKxgx18iu29c0g2Onx5SCUXx9XKO2SBVZLydacPiiEPxaUnnn
X-Gm-Gg: ASbGncs44UYR4ei9G2Afi4pNye7ucVSOUBUH4XEtBUZzhGAhuq0Cnw6KI82g0CsN+Al
	urAW4b5kz+7gat06+B+vfUSI6l5mjr+eOTQ5ykbMZ5gveUNhxbVs06MD2Y1XZs9GimtM6IfN5Am
	DZz2SShbI2ueF7Pq/6iZuadTclr/8m9YbDaB70aKh2w3XoZiaT8Q+z86DUCp7jUN5v1+0MDwN77
	bwrdLV+2EFpfD6Fyv3qfKye6ULSdsShnIYPninPdztESJcjcxbYl0OoQGLsY7UoP9JS4MKBAI9y
	eG9jMrPMkLwkWoddDHAJZVRB0JNdNvjyDeGXDf1mRtnRhox10HFb4Tp4iUbsKAeC+P0gcCcnkbX
	/jr1cP/LHcNURvIyIzRFyloz9yXnd3u8LLb3a3bUMfp8rEvve/id0ylIT2qIiTWjePHfKviUOPA
	==
X-Google-Smtp-Source: AGHT+IGoczWyVuydH39zMVQ96RJfMa9Sai3EgB+ebWFZlnaFxsh7LhoMbqH0MC0MA4AY2Era5saV3A==
X-Received: by 2002:a05:6000:2d12:b0:3a5:2848:2e78 with SMTP id ffacd0b85a97d-3a6ed665f25mr4231271f8f.28.1750937634942;
        Thu, 26 Jun 2025 04:33:54 -0700 (PDT)
Received: from skynet.lan (2a02-9142-4580-2e00-0000-0000-0000-0008.red-2a02-914.customerbaf.ipv6.rima-tde.net. [2a02:9142:4580:2e00::8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e80f22efsm7071753f8f.46.2025.06.26.04.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 04:33:54 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
Subject: [PATCH 1/3] docs: hwmon: add emc2101.rst to docs
Date: Thu, 26 Jun 2025 13:33:49 +0200
Message-Id: <20250626113351.52873-2-noltari@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250626113351.52873-1-noltari@gmail.com>
References: <20250626113351.52873-1-noltari@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add description of emc2101 driver.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 Documentation/hwmon/emc2101.rst | 61 +++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/hwmon/emc2101.rst

diff --git a/Documentation/hwmon/emc2101.rst b/Documentation/hwmon/emc2101.rst
new file mode 100644
index 000000000000..94db8a05a7a8
--- /dev/null
+++ b/Documentation/hwmon/emc2101.rst
@@ -0,0 +1,61 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+Kernel driver emc2101
+=====================
+
+Supported chips:
+   Microchip EMC2101, EMC2101-R
+
+   Addresses scanned: I2C 0x4c
+
+   Prefixes: 'emc2101', emc2101-r'
+
+   Datasheet: Publicly available at the Microchip website :
+      https://www.microchip.com/en-us/product/EMC2101
+
+Description:
+------------
+This driver implements support for Microchip EMC2101 RPM-based PWM Fan Controller.
+The EMC2101 Fan Controller supports up to 1 controlled PWM fan based on an
+external temperature diode.
+Fan rotation speed is reported in RPM.
+The driver supports the eight entries temperature look up table to automatically
+adjust the fan speed.
+
+The driver provides the following sysfs interfaces in hwmon subsystem:
+
+========================= == ===================================================
+fan1_div                  RW file for fan target duty cycle divider (0..255)
+fan1_input                RO file for TACH1 input (in RPM)
+fan1_min                  RW file for TACH1 min RPM
+fan1_min_alarm            RO file for TACH1 min RPM alarm indication
+fan1_spin_up_abort        RW file for fan spin up abort on low RPM
+fan1_spin_up_power        RW file for fan spin up power (in percentage)
+fan1_spin_up_time         RW file for fan spin up time (in ms)
+fan1_standby              RW file for fan standby mode
+pwm1                      RW file for fan target duty cycle (0..63)
+pwm1_auto_channels_temp   RW file for fan temperature sensor (external, force)
+pwm1_auto_point[1-8]_pwm  RW files for look up table fan speed
+pwm1_auto_point[1-8]_temp RW files for look up table temperature
+pwm1_auto_point_temp_hyst RW file for look up table temperature hysteresis
+pwm1_enable               RW file for fan config (manual, look up table)
+pwm1_freq                 RW file for fan target frequency
+pwm1_mode                 RW file for pwm mode (DAC, PWM)
+pwm1_polarity_invert      RW file for fan polarity inversion
+temp[1-3]_label           RO files for temperature labels
+temp1_input               RO file for internal temperature
+temp1_max                 RW file for max internal temperature
+temp1_max_alarm           RO file for max internal temperature alarm indication
+temp2_crit                RW file for crit external temperature
+temp2_crit_alarm          RO file for crit external temperature alarm indication
+temp2_crit_hyst           RW file for crit external temperature hysteresis
+temp2_fault               RO file for external temperature failure indication
+temp2_input               RO file for external temperature
+temp2_max                 RW file for max external temperature
+temp2_max_alarm           RO file for max external temperature alarm indication
+temp2_min                 RW file for min external temperature
+temp2_min_alarm           RO file for min external temperature alarm indication
+temp2_type                RW file for external temperature type (CPU, 2N3904)
+temp3                     RW file for forced temperature
+update_interval           RW file for temperature sensor update interval
+========================= == ===================================================
-- 
2.39.5

