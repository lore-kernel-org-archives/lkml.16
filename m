Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB95220F4A;
	Sat, 10 May 2025 09:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746868886; cv=none; b=NJqBd8VCXrrlx9W87AWUaHAomhjo7Ec5A8rUt5OkGWFIX5n9a2WpsV+afjIHWupJUinDOmmO8cybzeiAcHSgo4cbpZJhLQ5eOUxnj2P3ZaxDokivwRW5a11aowNMbP3K56OBb2H5dA2FXEhG0/6XSNVxsKdQwBlJwfrnRQMXvP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746868886; c=relaxed/simple;
	bh=AEZwoEa0kIBgfXAtsj5VukUGw/H0uEfko6HeuAepTa0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ANHJGLGsvFBPNpc327Q7AxuIM64ePmdrZGV5/42pNtSQMr2HRTZw8U6QIctExVeaAa/rBlMpHjBIMjd3zti2VabUyW3TALYh253aBnNd/vm7z1GYPT7+LC46W2Z/ndelqWjk76k406mgJju9pja4VPNwljc21mCtNTK4A4D19mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W5WgRV4o; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W5WgRV4o"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso18983005e9.3;
        Sat, 10 May 2025 02:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746868883; x=1747473683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bO6Jqt0PFTVJr7LcSorP6iBX8+l4quuhVdfU4Z0JfBo=;
        b=W5WgRV4o4ar+Q5BCK4N/3Tz1aQySI8W+rbFYmCCuHD5J7OmH27inl4Bt6gE6dtRmxb
         aBunufVbO9L30FRDZaYDHUErfCoItty03vCwLmu3kutQ7gbtGRvdmKmkkgQLT4odtWfv
         FK5Ccow7mn4TzEFSefgcbyjoH7+6eInLXIWyCByO/CssZeu1lfmBBCJ7nzvfd5sLUf4/
         Zh95Ewi9WLsxKcKO7rzzj13YmCKmeSpniCZr/J9BtBEtTQ9MbUeNix9S0D9R3HbQ8XO8
         pApUOqAxgn7ukxzzCN18wzV3W4T7gY27683OYJe5zcRrlY/OELLGSkFuM5hSBGK1EiJq
         khvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746868883; x=1747473683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bO6Jqt0PFTVJr7LcSorP6iBX8+l4quuhVdfU4Z0JfBo=;
        b=LjbC+PmwrFoZ5EZxEGnwCOhXcdNVITvRKOLcezsSgXeLHA6IzR4NKhtW0mu8kWZq8k
         EdcuSZfcrCAVCiSEzEekCquE9gtk6RWNTFAV9Px7Wmr6qBbZ2ueZgIugxFUtEEREaEB/
         QXhkHsbalI0hL+QZbK6BWqxqSa1HH1CntYzAsv+bbOIjO+HAGWP+YvRZK7AWLwVq68V8
         qYzAztDxgByC1vvE0dpZDOqMi/J4y1xhDwn+g2zwNJPBFD7X8mUhI+LNORMhcM8OTpmp
         mJyDayR/MtycsA8UJhJqz0g8XKGcPzEOZSl5chFSqyUvPMEqsCe6JgT6Pk4iTJKAWGer
         C1kA==
X-Forwarded-Encrypted: i=1; AJvYcCUrZ6iZPQH2aVR4G0d5wgzCzI7ggDbKwjih4P/e9wFtxNSbYYTJJTrI2NdtLXiBAubmKv4OSsmxUORF@vger.kernel.org, AJvYcCWe9TcpuX9F0WsNfBTQW2stSH2EfSdmQk2zc8jNjgaXM3ob8I3LaSP9Y5hFMTL858Gq6i+CYo07qnkq@vger.kernel.org, AJvYcCXUURcITF9MoUevGlLqZ9x5E2qIP8Tl39SGIUCCYxkYQmMEW5QsVtXKgPgOztwM4pEEazTusNLNis/jEdo9@vger.kernel.org
X-Gm-Message-State: AOJu0YwQZ8UHA5cKHE9ihndspA8MSWwmeey7W8yShcGjwKz9CondDAec
	eF0hicgg9XE4qbfCGBBJbcnoRZ8smwIDViIfl1hciquEVRA6cIna5sBff5WC
X-Gm-Gg: ASbGnctgqXxXPjqBNd6EsV+6izS8YFawYOJ5DxtDd3+lv7Gi0bJ3P8CWcn2S6NA04WH
	wYuQDpJqkGGaaX+fbl1wRws+kllofEg36axV1mgh7wT2IkJI4wtGMOU4KNafUHGIf+NtY5n+bne
	/3OF57/IAkXU9JtnEQ81aYuBy+5R7g+K0YI1wDkbhdNTqQddx2Jnu85oxADlMShCOts/H0T4SYn
	i0AQwMlADNBnk0Zti0SfMGMCe6WVgc3Y63YfVRVDExlCTZVozdqsA3adDbeuYsLFQGMD9T1CR1P
	OVficRTXP7esbuwyypAKI/M7xnUwxhn/9e9665mfhPcDgtDTCQJC+OwY4WEWhsQmqN7AiHLX1Xl
	6
X-Google-Smtp-Source: AGHT+IG56s9f07iaGmAkfDoSoclIwgguXa6vIbT+eM6/yZ1j9g/Soz+JIG6toLAVKqzVqMSXTYaRLQ==
X-Received: by 2002:a05:600c:3e8e:b0:43d:42b:e186 with SMTP id 5b1f17b1804b1-442d6d37b08mr56223145e9.8.1746868882578;
        Sat, 10 May 2025 02:21:22 -0700 (PDT)
Received: from tempest2.110.lan (xt27dd.stansat.pl. [83.243.39.221])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d687ae5asm55901985e9.36.2025.05.10.02.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 02:21:22 -0700 (PDT)
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
	Peter Zijlstra <peterz@infradead.org>,
	Shen Lichuan <shenlichuan@vivo.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Charles Hsu <ythsu0511@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 5/5] hwmon: pmbus: mpq8785: Add support for MPM3695 family
Date: Sat, 10 May 2025 11:18:48 +0200
Message-ID: <20250510091937.2298256-6-paweldembicki@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250510091937.2298256-1-paweldembicki@gmail.com>
References: <20250510091937.2298256-1-paweldembicki@gmail.com>
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
index 1e12e7267a7f..6c9c0970e5d6 100644
--- a/drivers/hwmon/pmbus/mpq8785.c
+++ b/drivers/hwmon/pmbus/mpq8785.c
@@ -13,9 +13,11 @@
 #define MPM82504_READ_TEMPERATURE_1_SIGN	BIT(9)
 #define MPM82504_READ_TEMPERATURE_1_SIGN_POS	9
 
-enum chips { mpm82504, mpq8785 };
+enum chips { mpm3695, mpm3695_25, mpm82504, mpq8785 };
 
 static u16 voltage_scale_loop_max_val[] = {
+	[mpm3695] = GENMASK(9, 0),
+	[mpm3695_25] = GENMASK(11, 0),
 	[mpm82504] = GENMASK(9, 0),
 	[mpq8785] = GENMASK(10, 0),
 };
@@ -85,6 +87,8 @@ static struct pmbus_driver_info mpq8785_info = {
 };
 
 static const struct i2c_device_id mpq8785_id[] = {
+	{ "mpm3695", mpm3695 },
+	{ "mpm3695-25", mpm3695_25 },
 	{ "mpm82504", mpm82504 },
 	{ "mpq8785", mpq8785 },
 	{ },
@@ -92,6 +96,8 @@ static const struct i2c_device_id mpq8785_id[] = {
 MODULE_DEVICE_TABLE(i2c, mpq8785_id);
 
 static const struct of_device_id __maybe_unused mpq8785_of_match[] = {
+	{ .compatible = "mps,mpm3695", .data = (void *)mpm3695 },
+	{ .compatible = "mps,mpm3695-25", .data = (void *)mpm3695_25 },
 	{ .compatible = "mps,mpm82504", .data = (void *)mpm82504 },
 	{ .compatible = "mps,mpq8785", .data = (void *)mpq8785 },
 	{}
@@ -116,6 +122,8 @@ static int mpq8785_probe(struct i2c_client *client)
 		chip_id = (kernel_ulong_t)i2c_get_match_data(client);
 
 	switch (chip_id) {
+	case mpm3695:
+	case mpm3695_25:
 	case mpm82504:
 		info->format[PSC_VOLTAGE_OUT] = direct;
 		info->m[PSC_VOLTAGE_OUT] = 8;
-- 
2.43.0

