Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781DC277CB9;
	Tue,  1 Jul 2025 18:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751393556; cv=none; b=F04GzHV9LfuleP4Sd5/q6R/g0w/URI4Qm/fsq51gpfpouqUPdyz/nGjxSo2+M1R/OGq3ak2xC4pWZ+08gvv7bd/+u9nksB/NcIRjB6/DEB+kXFgqK7WpZpERUcM9xh7rEoryzNwwRmsIELzft1mp1BksZCNv1QBs0rc6KSHxNIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751393556; c=relaxed/simple;
	bh=Xh8kOhDZi+cJxSBvJcMNVJTnxbvnOjvU+jIHGH3X+OM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XLXFFRFqIJyohAYaVZT7KCJpD4LIlUwVBfAvhTJ6ZzZhPUm+ep9xuq52oi42wS64FOJUEqZFo695cqqlRj7Ic3jeebPOWwMBt/Crw+Gdvcs5fjQZH9M5czIGOxNAoXzTdIVehmZINRkNtWJTmiM/tV3EsrH1IQuUobEkarXk65U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZBERshaV; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZBERshaV"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a6cd1a6fecso6379259f8f.3;
        Tue, 01 Jul 2025 11:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751393553; x=1751998353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vAar7Ya7FpbxWWgv0HDtNIouNiweF7ofnw1aL0s62lo=;
        b=ZBERshaV0WMCWMG3wzjXZ515pPjiphi/Tww02lWr9gvP0tfUu7UQ0uoSBlEJwOhA96
         r0kvJ1v75psiEtcheF9kStCeVFoAMv+jMbPvVdZxpqQfCGgFafqVm+nTaLRkNC8d8jEv
         IY8qqVJdQg0JegbK7COp12WVbAkHyr3qRnoxZgBs2FH2bXDiwW+0pQ/Twd9NrhqAyo0Y
         mrifVLYeOVP9kwNwYT4mkIh7Bmwsl+wB26gCdd/T/vZnIDUf2/EzQPIsZE2hrL4rgpfo
         KFi9+Ecv6TbvN1bOLDScnM4ga4biPv6TlxilZgXh5opKTAQ/bvwDfZKAfnGWtzUUAwsZ
         HnRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751393553; x=1751998353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vAar7Ya7FpbxWWgv0HDtNIouNiweF7ofnw1aL0s62lo=;
        b=kzyxwWgosRoKV42YgX1rNVdsm5pIILHq9gSeBnDNoJfA1Ng42xvAwamOJVd+hQfZbY
         AQfu0A0Qu0zbR0H73Hn0wWtoTfXLDB5QIR0YX/tpJrU0N8Pj0EER0bmJ/3CuTQucu4UK
         xJYp5NQ3/0EX8fb3KzRwNQdEe77pyuEptIXaYugUK9vtWMimSsa8sdSetW2pTKCk63n5
         jtfdkhiNKzGjdoeAOqVIxEqfc1oRoa6pqlPZsCicC/4TFlluKZV/ldAGbTHAyyYm2Vsm
         +U48WEILUWFdX8YohF7rytcZ252VwbErhZNmRemkpiD/QzHmir6h6ItmI7y5eDZy47TB
         66TA==
X-Forwarded-Encrypted: i=1; AJvYcCWRtKbRvWHtXELv3IgwD7IesorKIZtgyN3BzkanGSuwBbwfpuiPnkSj8QD7LjTXb2KjOXYQR2woTFvJjsUl@vger.kernel.org, AJvYcCWrLX3fyB4miG8WfodLR8fZoaszCsX56BT14kH4CpoUZ0TsS0FZf4/hfku+DgIO8BaB/zGw0duJtlYY@vger.kernel.org, AJvYcCX0HEE7N6XmldRUWIfBhdREhVWix1pV/KAh/5qSW0wp3yVd8jtl5pikRhawGgKhW+O2utjkeMvf3to/SA8=@vger.kernel.org, AJvYcCXBn+vUNtqiBjoAxttAVN/z56RAOqVEmCg3LlHVFZjWcY69pbbwfEougVkH8m1kD0wsY9985sZB0mWw@vger.kernel.org
X-Gm-Message-State: AOJu0YybKakX4OFCkeJ8SqNNZ3sxauAFc+DO8xRthyiZJAqGKD6TlCdD
	FdjJGg45kycV81XHcpmltDewCG0Jtnb60qs99Rq9idrPqKA2HSuIsZ00
X-Gm-Gg: ASbGncsrhiw//qpnzIkqdomgThLrNqgUFdZjw5yZnpLY6A5s30lG+DaRGR0s8frDhXm
	HPPPyPecT9PYEwEmyLoAq7eKMxL6wM1ER6jiUiTk0AkcvquSw8s/PR+hcczTXbKAF1t2BoyUndr
	HiRK2S5al/jtIKryU+4sNI0yr0nfmoSVFuGeROehFiOK0aMjoIxLiET80eYNBSonzgu3RTOIzFD
	gz0DTj7KsTsLULM5WeojEj95dUCO7sYienxkhVN/XfCK3DG2XiAX7jKOYhJ3gyl0YnEDM1w1OPP
	xznSGG1CjuVx9M+y+fwpPibnR+S1kRGYa5I2N/4o2uGddv80yQMk/79Qj3w1McskXwiGE/zFXCh
	cz8KLPDzsn7iY+F0CAOgR7206xBLb6Rz1ttXSf2SA5e/vLKEHuAg3A0XVlhy8Pw8=
X-Google-Smtp-Source: AGHT+IF7K9lgLD6nkkR0Aoj1MTgPAq5OurJJ0lUXNjgFyNDPNviATtKbXAfOy/DffzzlScGtNxPnUQ==
X-Received: by 2002:a5d:6ac4:0:b0:3a5:8abe:a264 with SMTP id ffacd0b85a97d-3a917603b9dmr11936887f8f.37.1751393551798;
        Tue, 01 Jul 2025 11:12:31 -0700 (PDT)
Received: from skynet.lan (2a02-9142-4580-2e00-0000-0000-0000-0008.red-2a02-914.customerbaf.ipv6.rima-tde.net. [2a02:9142:4580:2e00::8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7fa54dsm13707437f8f.23.2025.07.01.11.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 11:12:31 -0700 (PDT)
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
Subject: [PATCH v2 1/3] docs: hwmon: add emc2101.rst to docs
Date: Tue,  1 Jul 2025 20:12:26 +0200
Message-Id: <20250701181228.1196102-2-noltari@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250701181228.1196102-1-noltari@gmail.com>
References: <20250701181228.1196102-1-noltari@gmail.com>
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
 Documentation/hwmon/index.rst   |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 Documentation/hwmon/emc2101.rst

 v2: add emc2101 to index.rst

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
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index b45bfb4ebf30..c068462764d0 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -69,6 +69,7 @@ Hardware Monitoring Kernel Drivers
    ds1621
    ds620
    emc1403
+   emc2101
    emc2103
    emc2305
    emc6w201
-- 
2.39.5

