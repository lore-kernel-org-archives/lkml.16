Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C2E21B9DA;
	Sat, 10 May 2025 09:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746868862; cv=none; b=ZiG+Ps5F7VV2W9CwrUJrol/kM4bbb8qIxCKKGauvY5TTJHpF3KKTBfytoGLF3y5OTPXcfdAS+j2SEokCGZyf/B1kRLsFPbR+qdVUqXpP+E9gex/T3LwYSWFvryEZXY193L7aTnpNb2pF/lVvoycXLMS/j/BXp5NiV/cdZPTJe/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746868862; c=relaxed/simple;
	bh=EkY2Q7cPdq5qkT/nEZqscnQ2gEnaAfbjti072pwy6Ms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PJMBRJA5MgvtnPT5NAWVmiqJdqh3d33pZp+Fnk9TGOgDqZKqC2Pq5nfmP7PKKasAE+X5jTkIHbtpP+OiBQ2CvIiH1wKBsZ2JcLmk0uO9Zx6qvSZEsXimpn05dkcURrtLsjfFfis7RCj3FVcTAJj4yMegUl6oxavL9lheSiCSEoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k8kOWdLU; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k8kOWdLU"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso19535595e9.0;
        Sat, 10 May 2025 02:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746868859; x=1747473659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2/e1bWjEMfQNvCNIgF1Vv6yPWIAJwsnxqj8b4Nj0U3k=;
        b=k8kOWdLU+u3Qi5rPop5e765/ltZCKX1CVSSkogQG1O/9w4Zymkp2vovYOP0LuzMi77
         CUpXdILv9EqUeQJmVFarofyfNA/D3mI6uRamXo6NuI8ZDa/JY1OUgW3q5s6I7hJglsmL
         C8JRIcclJhdc0R+2racA6MunaRwAGROheQIPe6d5AZcWvN7Qcs9BrQ82ZmKiTaFKw1pM
         CtzJNCyqvGVj77swAqG6P7zhMBrqN6RriS6TX/ZVf8wK0+1QkGMCrGSAYLQlUuo6M7Qm
         tRy+ywxVznRgnH+wwv2xFg0KZl5wtT1cU1OL0PaFWpvpDe/+X7Dt9J+aNNydg3ohEdw4
         MB4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746868859; x=1747473659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2/e1bWjEMfQNvCNIgF1Vv6yPWIAJwsnxqj8b4Nj0U3k=;
        b=dCbBADCefvymi2ZtklQCy+b4YcqDG7IyzKJIem4EgHDDRgCBd6jtrYxbOjKgZQCUWT
         7lfzg/kcAePz6+Khyxkklpqb8Jr0InUUFjmT8wqBiMF4Gp68sHOUmQt4cUzfTrAXtz46
         n3r/sG0ncDgrk+oh5MT1FEEajDAPHaplTftYV7Buqjh+ikDRIcI+sdM87h1TbtCq++iZ
         nxJE0r+3RJQknTp7evx35dpaxyPl4tGJDmwX7m8FKfvryWsRBzXWsl1CUS0Q2FBgfg1f
         plCdlb4+Ua+TteftQwQImZC+f65havj4gFGDMPruOc6nd2BZXX5sclrpjfSmM/jPNoao
         uvWg==
X-Forwarded-Encrypted: i=1; AJvYcCWIgJ778NbD5lGcBX27t7G9Qwz4sO4BpSo3blZH1muKfCnWHvTDVPjRdEnTV+mb9aFX1j4n0o8sctIr@vger.kernel.org, AJvYcCXQHbttoIsYHI7KlT2FD2ZruMqmBlJqeTk6v0x9g75RfGXOYbVoi+tK72TG5A/E9W5Y0itnJ9ovxksf@vger.kernel.org, AJvYcCXtmuu9BBgB9+41LZcFbwIbGIj1n3wAwuDR/I+GeqyllygaUYTCc75QR16gTNiTOEr84+KEVC1y6RbpeLOh@vger.kernel.org
X-Gm-Message-State: AOJu0YydE+d4Ad7GYLbvDTkmQaCvcUi9gazV+ZNcTMcLdGaHZ6RscgIU
	wIDxN3RFxrI6dvl6sOa2/Q9h11mk3znQ5nH1LQfZWVlUo45/c0XXuHQlPV0O
X-Gm-Gg: ASbGncuTUf+ktdf6EVNzwbI5khqc005xVaeidEnm+4jVLBc+4EeMrli4qy/8QoR2fla
	Mcsp597rr04pCmBwVP/BrDFmcxoncgkEJ4OP5LYwmGfqDMkqmW8IAJAaUuzxZjscOQ3907gqz44
	7xrN6VmwK05f0T8thyJrRo/axrDRhv//sMGLkWNP5v3jcwHV3NzzLLOGEr6IN/p6UQeiK0biudu
	4nJBtY3SlSnCHM2X8sAMdPKkxZM4hkf8ud/V4oDJlcDRQIPl/NwxQO4/xEyiWoN+SyHFMsyBpHh
	D07xktxfZ9fizoYEw8pJ+8MzGNjp4xXlGbIQQb4SQgwaG5K6SgpvjO9fwkbuR3ALuSwhcrWPCKr
	p
X-Google-Smtp-Source: AGHT+IE+98meZZMT5vhF1cqphE751jtmGafTC1805YkfKwMFEEn4CdEeiA16fj/TaOzg0Xanj1g76Q==
X-Received: by 2002:a05:600c:3d99:b0:43b:bfa7:c7d with SMTP id 5b1f17b1804b1-442d02b91b8mr92314075e9.2.1746868858544;
        Sat, 10 May 2025 02:20:58 -0700 (PDT)
Received: from tempest2.110.lan (xt27dd.stansat.pl. [83.243.39.221])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d687ae5asm55901985e9.36.2025.05.10.02.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 02:20:58 -0700 (PDT)
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
	Fabio Estevam <festevam@gmail.com>,
	Michal Simek <michal.simek@amd.com>,
	Grant Peltier <grantpeltier93@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Shen Lichuan <shenlichuan@vivo.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Charles Hsu <ythsu0511@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 2/5] hwmon: pmbus: mpq8785: Prepare driver for multiple device support
Date: Sat, 10 May 2025 11:18:45 +0200
Message-ID: <20250510091937.2298256-3-paweldembicki@gmail.com>
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

Refactor the driver to support multiple Monolithic Power Systems devices.
Introduce chip ID handling based on device tree matching.

No functional changes intended.

Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>

---
v3:
 - replaced (uintptr_t) with (kernel_ulong_t)
 - used i2c_get_match_data() instead i2c_match_id(mpq8785_id, client)->driver_data
v2:
 - no changes done
---
 drivers/hwmon/pmbus/mpq8785.c | 38 +++++++++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/pmbus/mpq8785.c b/drivers/hwmon/pmbus/mpq8785.c
index 331c274ca892..d0ac294b4bbc 100644
--- a/drivers/hwmon/pmbus/mpq8785.c
+++ b/drivers/hwmon/pmbus/mpq8785.c
@@ -8,6 +8,8 @@
 #include <linux/of_device.h>
 #include "pmbus.h"
 
+enum chips { mpq8785 };
+
 static int mpq8785_identify(struct i2c_client *client,
 			    struct pmbus_driver_info *info)
 {
@@ -53,26 +55,46 @@ static struct pmbus_driver_info mpq8785_info = {
 		PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
 		PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
 		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
-	.identify = mpq8785_identify,
-};
-
-static int mpq8785_probe(struct i2c_client *client)
-{
-	return pmbus_do_probe(client, &mpq8785_info);
 };
 
 static const struct i2c_device_id mpq8785_id[] = {
-	{ "mpq8785" },
+	{ "mpq8785", mpq8785 },
 	{ },
 };
 MODULE_DEVICE_TABLE(i2c, mpq8785_id);
 
 static const struct of_device_id __maybe_unused mpq8785_of_match[] = {
-	{ .compatible = "mps,mpq8785" },
+	{ .compatible = "mps,mpq8785", .data = (void *)mpq8785 },
 	{}
 };
 MODULE_DEVICE_TABLE(of, mpq8785_of_match);
 
+static int mpq8785_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct pmbus_driver_info *info;
+	enum chips chip_id;
+
+	info = devm_kmemdup(dev, &mpq8785_info, sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	if (dev->of_node)
+		chip_id = (kernel_ulong_t)of_device_get_match_data(dev);
+	else
+		chip_id = (kernel_ulong_t)i2c_get_match_data(client);
+
+	switch (chip_id) {
+	case mpq8785:
+		info->identify = mpq8785_identify;
+		break;
+	default:
+		return -ENODEV;
+	}
+
+	return pmbus_do_probe(client, info);
+};
+
 static struct i2c_driver mpq8785_driver = {
 	.driver = {
 		   .name = "mpq8785",
-- 
2.43.0

