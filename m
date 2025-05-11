Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB7C25DD10;
	Sun, 11 May 2025 20:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746996806; cv=none; b=drsR8jsZtrOUAB9VAlBPR78NCg/eowUyX1ijkF9BQyEtMNUQblVopZnMoDAUu4++gJfH62SnmUf3ygFWVyqy+XSHO8Z6TCc2Z60i93nbhQTklYStSrP5Gf79eVvOe+zPj0qhqM6DYH4rhndDcEPhGg0q2qTQNPm20SMF8kX62WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746996806; c=relaxed/simple;
	bh=LIFeAHb+nqLq+xefQoSh++C1ZLkF/KDUEKZLmwKOmlI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eG93KGTrILpLsFkI9Bvy3Du0OqfH92di+RxCW3R2NtLVC71uBisUaxfGCdbs0nj8mfd4ArOO2B+R2XcigaSLH8t8Tt4ITRKJ5jZWlojuz7YAWH7WQzn54MFCCydaTXXJ/6FsTEMqww+cIZh+obYD7gMXe+4e1gsW7lxg3XPtioA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=bZe4STWq; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="bZe4STWq"
Received: from localhost.localdomain (x5996a826.customers.hiper-net.dk [89.150.168.38])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 7A1C32E0A474;
	Sun, 11 May 2025 23:44:40 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1746996282;
	bh=rgXIXL0LET4rRdcbB8YpYDd7SOLKugo5R8SBkYijYKU=; h=From:To:Subject;
	b=bZe4STWqq/hnhSxdOI4peaHCfrNVRcvW4ysI3SUPmMUSHMr71enegUQZs9vVq+QR1
	 wNY38919fARSgmJlnefQhKp0VBKb1J/nWD+KqeZoyJ8xvMT2x+PTneOkhssKE5Ldbs
	 kWAk+EBQjIY4lMst4Y+FCUX+rthHUiV2XCN1pZwo=
Authentication-Results: linux1587.grserver.gr;
	spf=pass (sender IP is 89.150.168.38) smtp.mailfrom=lkml@antheas.dev smtp.helo=localhost.localdomain
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: platform-driver-x86@vger.kernel.org
Cc: Armin Wolf <W_Armin@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Kurt Borja <kuurtb@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH v1 02/10] platform/x86: msi-wmi-platform: Add unlocked
 msi_wmi_platform_query
Date: Sun, 11 May 2025 22:44:19 +0200
Message-ID: <20250511204427.327558-3-lkml@antheas.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250511204427.327558-1-lkml@antheas.dev>
References: <20250511204427.327558-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <174699628198.27634.6236568785205799371@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

This driver requires to be able to handle transactions that perform
multiple WMI actions at a time. Therefore, it needs to be able to
lock the wmi_lock mutex for multiple operations.

Add msi_wmi_platform_query_unlocked() to allow the caller to
perform the WMI query without locking the wmi_lock mutex, by
renaming the existing function and adding a new one that only
locks the mutex.

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/platform/x86/msi-wmi-platform.c | 27 ++++++++++++++++---------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/msi-wmi-platform.c b/drivers/platform/x86/msi-wmi-platform.c
index 41218a9d6e35d..f0d1b8e1a2fec 100644
--- a/drivers/platform/x86/msi-wmi-platform.c
+++ b/drivers/platform/x86/msi-wmi-platform.c
@@ -140,7 +140,7 @@ static int msi_wmi_platform_parse_buffer(union acpi_object *obj, u8 *output, siz
 	return 0;
 }
 
-static int msi_wmi_platform_query(struct msi_wmi_platform_data *data,
+static int msi_wmi_platform_query_unlocked(struct msi_wmi_platform_data *data,
 				  enum msi_wmi_platform_method method, u8 *buffer,
 				  size_t length)
 {
@@ -156,15 +156,9 @@ static int msi_wmi_platform_query(struct msi_wmi_platform_data *data,
 	if (!length)
 		return -EINVAL;
 
-	/*
-	 * The ACPI control method responsible for handling the WMI method calls
-	 * is not thread-safe. Because of this we have to do the locking ourself.
-	 */
-	scoped_guard(mutex, &data->wmi_lock) {
-		status = wmidev_evaluate_method(data->wdev, 0x0, method, &in, &out);
-		if (ACPI_FAILURE(status))
-			return -EIO;
-	}
+	status = wmidev_evaluate_method(data->wdev, 0x0, method, &in, &out);
+	if (ACPI_FAILURE(status))
+		return -EIO;
 
 	obj = out.pointer;
 	if (!obj)
@@ -176,6 +170,19 @@ static int msi_wmi_platform_query(struct msi_wmi_platform_data *data,
 	return ret;
 }
 
+static int msi_wmi_platform_query(struct msi_wmi_platform_data *data,
+				  enum msi_wmi_platform_method method, u8 *buffer,
+				  size_t length)
+{
+	/*
+	 * The ACPI control method responsible for handling the WMI method calls
+	 * is not thread-safe. Because of this we have to do the locking ourself.
+	 */
+	scoped_guard(mutex, &data->wmi_lock) {
+		return msi_wmi_platform_query_unlocked(data, method, buffer, length);
+	}
+}
+
 static umode_t msi_wmi_platform_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 					   u32 attr, int channel)
 {
-- 
2.49.0

