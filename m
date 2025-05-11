Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F2E189912;
	Sun, 11 May 2025 03:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746935872; cv=none; b=G1TXtYOT8YRtFnJZwOBS2ZWWiLdABSu6IwpTag2ydxsxpCwboyQP2BNwP8NU/6kGby3hSR4n1wwkilVZM2bD6kd1TqMmTZlwIptsT5+tYf4zRB+vNE5CfIKPp3Mdq1Q6wIskKEswB3uC8jjUxa8DCZLhhyG7KRtS6xs6GkojMaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746935872; c=relaxed/simple;
	bh=HLK6PiDnz7E2MMqNzDx5rVqMDXwXP+M194AWuImHFJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bLk/gQNF3Ka5WUVTgaHh9ZNYtZm7RVAymjrASCBwPVu1IQwgUmvK2abZzwbR4x7xfnWopMx7zKPMGGe/84E8RC3KJyZrfvU4elNLY2/RHWVzer4LRxYpn8kEKlUJxUiLZ2VJfGnaV1v0V2BfQyrIq59bTKJwZZsjmRFWhRPUvy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lBtpeFoZ; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lBtpeFoZ"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a1f5d2d91eso1562283f8f.1;
        Sat, 10 May 2025 20:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746935868; x=1747540668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pk8Os/KQV8g3d7fEWFNmmi62uW1E+WMBGyh6BXQrDnY=;
        b=lBtpeFoZOEPid9WkomPgn8EAyx80AVyNDBDfE2vjHTzyPTUKYJKT5e/YN0eY3NAjUG
         gIJVhPzfONIO9J6wfOJBvvIxBdKpDTbMM9BUkcCQ/401zsEXn3ttetgcUGV8mua+OIwR
         FF5kFr7fIV0HOh8E9z87S4ssBjD4U7+68q7F6YqD4ruaneF4J/RCj0H49zmRGBXmKBoy
         pJfGr8QwzaaJfM2WsmsDJW1ED7zmDcSrJuCNTF3JX+dwKUnat+jRo+AjDICpLyAt0Vmx
         6zWzenNtbk0X2ivq3T7U7kmEP/jCryYPJGvvBVQxUYh19G1MFnpGy1pnauV5u9nYydKH
         q4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746935868; x=1747540668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pk8Os/KQV8g3d7fEWFNmmi62uW1E+WMBGyh6BXQrDnY=;
        b=Yv3zosIzoODVHPhO604GeEzpfxrpDTxWQVGTh4AvEddVKvTnb9bDNGa2ub6jCQ7UHp
         9EVj92CXTtOsbmoHKajoQUleZ9N3p3KGI8Kr8WMCZrpBzJy870w+nOCx+qAMhEvlTtqy
         vziyQoKAvTXYXp93/cVO1uSoLNF6lF9CK6+DiZ0amc0nVZep0dZb8DQNnA9XbZK9hsRE
         BleJ2SgxC4u7nsR2omx9WkfVb6c8nYPATjCSq5kDt5bAyh12L7EA7FhNzxgyJ5zFPg6z
         A9fJFxhUjrz9rTJPgi8L1XQUBb1C7Mmze0f5tyJ5S/yGFjHJC7BjHtpUz5T4vVfeHBFB
         qKgw==
X-Forwarded-Encrypted: i=1; AJvYcCWWVSx08vXCFd+CWYd2XbkWlNfaS5kG3jNwUk4Zi0jQph/24YhKyK+Ct/lOOnuhzcqO5as2trKEQWLXdguK@vger.kernel.org, AJvYcCX9rRT51qhy2Y0Hu3MpblCHAJdMGAL50jeQr/KTmBjjy6vmzX3plkLoG/peVhcaSHaW7dEPCkLgE/Jz@vger.kernel.org, AJvYcCXuJtNrA3fbLp0dPoHfs9KuY0VL0x3gjZ+eMht0Vd06xlq1Z8xEeSgYjRAC//8zx39xEf7T6jO1P1ya@vger.kernel.org
X-Gm-Message-State: AOJu0YyQDgkWWmmuhS2Y4qqH/DYhd6fX3w01enrza0q3kAaTzJYLcqVt
	qC2f5d6bDZ9SIfxPwSNPwUDtSB3m7DepekDidW4wMWW9qaIX0/cyYF0Hur7e
X-Gm-Gg: ASbGncufoWeAEIJe1pQ+/BrzQKhYUe3O8t+FWAxc0gdwM3ezK6ZB7dfpf6lmAWt+pNl
	0Y81o3XKtqyWkG/Gfyc1Z+djS6Vid4pa7eJWMR4yuBPUIZv5WB3sXIDS252Y6jntNr414i+IeRc
	u2vo2Scm0TMSHiERKgtQvqGKWtg46gA4/z2eHMv570VpNcGvirsRNg3yG0vKbli+xVLNbmZq09D
	MlVOD0kBThdfynzoPImLrOw25CL8PSr5FQORDIC0DUDsELGRdCyD7bSd1x22TRkrc9pqmh0iZg4
	YMenXmDaddGpUi/IupEANOPxkrlcuSRUbnSfbUgvhY6V3Szv8F5f6enCuAvHPwErPqqOKVluCVQ
	+1DiC2qwhofo=
X-Google-Smtp-Source: AGHT+IHgD1DbRvr6b/N7zrlgQm2zrrzBhf+EbCUtMPcWsg4I47d7yiKsvb4JKwQGNpEesyBMQIUUyw==
X-Received: by 2002:a05:6000:1a87:b0:3a2:6b2:e558 with SMTP id ffacd0b85a97d-3a206b2e7cbmr189612f8f.28.1746935868044;
        Sat, 10 May 2025 20:57:48 -0700 (PDT)
Received: from tempest2.110.lan (xt27dd.stansat.pl. [83.243.39.221])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4c76dsm8163963f8f.92.2025.05.10.20.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 20:57:47 -0700 (PDT)
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
	Naresh Solanki <naresh.solanki@9elements.com>,
	Michal Simek <michal.simek@amd.com>,
	Fabio Estevam <festevam@gmail.com>,
	Grant Peltier <grantpeltier93@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Shen Lichuan <shenlichuan@vivo.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Charles Hsu <ythsu0511@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v4 5/5] hwmon: pmbus: mpq8785: Add support for MPM3695 family
Date: Sun, 11 May 2025 05:55:48 +0200
Message-ID: <20250511035701.2607947-6-paweldembicki@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250511035701.2607947-1-paweldembicki@gmail.com>
References: <20250511035701.2607947-1-paweldembicki@gmail.com>
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
v4:
  - no changes done
v3:
  - fix alphabetical order in couple places
  - adjust patch after patch order change
v2:
  - Added whole MPM3695 family
---
 Documentation/hwmon/mpq8785.rst | 13 +++++++++----
 drivers/hwmon/pmbus/mpq8785.c   | 10 +++++++++-
 2 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/Documentation/hwmon/mpq8785.rst b/Documentation/hwmon/mpq8785.rst
index b91fefb1a84c..198d5dfd7c30 100644
--- a/Documentation/hwmon/mpq8785.rst
+++ b/Documentation/hwmon/mpq8785.rst
@@ -5,6 +5,7 @@ Kernel driver mpq8785
 
 Supported chips:
 
+  * MPS MPM3695 family
   * MPS MPM82504
   * MPS MPQ8785
 
@@ -15,6 +16,14 @@ Author: Charles Hsu <ythsu0511@gmail.com>
 Description
 -----------
 
+The MPM3695 family is a scalable, ultra-thin, fully integrated power module with
+a PMBus interface. It offers a complete power solution that achieves up to
+10A (-10 variant), 20A (-25 variant), 25A (-20 variant), 100A (-100 variant)
+of output current with excellent load and line regulation across a wide input
+voltage range. It operates at high efficiency over a wide load range, and can
+be parallled to deliver higher current. Variants -10,-20 and -100 have different
+voltage scale configuration register range (10 bits) than -25 version (11 bits).
+
 The MPM82504 is a quad 25A, scalable, fully integrated power module with a PMBus
 interface. The device offers a complete power solution that achieves up to 25A
 per output channel. The MPM82504 has four output channels that can be paralleled
@@ -42,10 +51,6 @@ Fully integrated protection features include over-current protection (OCP),
 over-voltage protection (OVP), under-voltage protection (UVP), and
 over-temperature protection (OTP).
 
-All supported modules require a minimal number of readily available, standard
-external components. The MPM82504 is available in a BGA (15mmx30mmx5.18mm)
-package and the MPQ8785 is available in a TLGA (5mmx6mm) package.
-
 Device compliant with:
 
 - PMBus rev 1.3 interface.
diff --git a/drivers/hwmon/pmbus/mpq8785.c b/drivers/hwmon/pmbus/mpq8785.c
index 8827d5a57310..1f56aaf4dde8 100644
--- a/drivers/hwmon/pmbus/mpq8785.c
+++ b/drivers/hwmon/pmbus/mpq8785.c
@@ -12,9 +12,11 @@
 
 #define MPM82504_READ_TEMPERATURE_1_SIGN_POS	9
 
-enum chips { mpm82504, mpq8785 };
+enum chips { mpm3695, mpm3695_25, mpm82504, mpq8785 };
 
 static u16 voltage_scale_loop_max_val[] = {
+	[mpm3695] = GENMASK(9, 0),
+	[mpm3695_25] = GENMASK(11, 0),
 	[mpm82504] = GENMASK(9, 0),
 	[mpq8785] = GENMASK(10, 0),
 };
@@ -81,6 +83,8 @@ static struct pmbus_driver_info mpq8785_info = {
 };
 
 static const struct i2c_device_id mpq8785_id[] = {
+	{ "mpm3695", mpm3695 },
+	{ "mpm3695-25", mpm3695_25 },
 	{ "mpm82504", mpm82504 },
 	{ "mpq8785", mpq8785 },
 	{ },
@@ -88,6 +92,8 @@ static const struct i2c_device_id mpq8785_id[] = {
 MODULE_DEVICE_TABLE(i2c, mpq8785_id);
 
 static const struct of_device_id __maybe_unused mpq8785_of_match[] = {
+	{ .compatible = "mps,mpm3695", .data = (void *)mpm3695 },
+	{ .compatible = "mps,mpm3695-25", .data = (void *)mpm3695_25 },
 	{ .compatible = "mps,mpm82504", .data = (void *)mpm82504 },
 	{ .compatible = "mps,mpq8785", .data = (void *)mpq8785 },
 	{}
@@ -112,6 +118,8 @@ static int mpq8785_probe(struct i2c_client *client)
 		chip_id = (kernel_ulong_t)i2c_get_match_data(client);
 
 	switch (chip_id) {
+	case mpm3695:
+	case mpm3695_25:
 	case mpm82504:
 		info->format[PSC_VOLTAGE_OUT] = direct;
 		info->m[PSC_VOLTAGE_OUT] = 8;
-- 
2.43.0

