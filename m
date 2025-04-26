Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630481624DD;
	Sat, 26 Apr 2025 17:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745688624; cv=none; b=lX+W9AFF+hFra44jRruIonqsSZjylUnvpz5Rie/6L2svfpr8FyFzRrA24htO3hGWUafwQVZrz9ktURA9HaM/WnkGgpNOjLMCW6hPrwyjk8wSo34KKGMug2y2rq37j2bLrG9p8CYlLUxQ7yAv5LWJKZbIuh3OLXjWdQypwDFde1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745688624; c=relaxed/simple;
	bh=PRNeftlIbEr6GrW9ejpvc9lZqLcck36T7gNKQ91Mk4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rO9TUBMa6eu7D68GgrwbDvVLvqG8IJxx2YsRJz5pNHkt9KLzPGisWBrcdq2QmPoTI6cZ3E4ZjB4ab7pZObJKDlaZXx8JB6EyhVVhVtaePlKPecWfKpXQIm5hZvpfX7AZ5cIfKa9GI+8tSEYtx1Jj7bnX7ZMVgZMIkNJvYIoGrpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=eC/LOViK; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="eC/LOViK"
Received: from localhost.localdomain (unknown [IPv6:2a02:2149:8b6a:d000:ae13:99fc:9070:c966])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 0CE7E2E08668;
	Sat, 26 Apr 2025 20:30:11 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1745688612;
	bh=YyXHZoD2zqYzGgdxHJu5vbXpWfKh7dtO8Wxqu63mPW0=; h=From:To:Subject;
	b=eC/LOViK7Knw7oJSflVtRjCQsEKgJeCC55g+kr8Q1ZDEy7lXsSCjnISDBCLdt4Y7E
	 DqW97iwD0jIAPj9SNbvZy/adMXeZTO0H37tp0FFiDfUFvbSSdiq6qhB1uzhHZFb0ME
	 Xv4mR47pdnhWYAlm+wLNKMPcR6AEAeRihrzZ/RuU=
Authentication-Results: linux1587.grserver.gr;
	spf=pass (sender IP is 2a02:2149:8b6a:d000:ae13:99fc:9070:c966) smtp.mailfrom=lkml@antheas.dev smtp.helo=localhost.localdomain
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Derek John Clark <derekjohn.clark@gmail.com>,
	=?UTF-8?q?Joaqu=C3=ADn=20Ignacio=20Aramend=C3=ADa?= <samsagax@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Eileen <eileen@one-netbook.com>,
	Antheas Kapenekakis <lkml@antheas.dev>,
	Joshua Tam <csinaction@pm.me>
Subject: [PATCH v1 1/2] platform/x86: oxpec: Make turbo val apply a bitmask
Date: Sat, 26 Apr 2025 19:29:54 +0200
Message-ID: <20250426172955.13957-2-lkml@antheas.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250426172955.13957-1-lkml@antheas.dev>
References: <20250426172955.13957-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <174568861185.7670.5152654212928158552@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

On the OneXPlayer G1, the turbo register is multiplexed and contains an
extra bit (0x02) which is set on boot. Therefore, we should only change
the 0x40 bit to not affect other behavior. Collapse the disable and
enable functions, and apply a mask for the turbo bit instead.

Tested-by: Joshua Tam <csinaction@pm.me>
Suggested-by: Joshua Tam <csinaction@pm.me>
Signed-off-by: Joshua Tam <csinaction@pm.me>
Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/platform/x86/oxpec.c | 96 +++++++++++++-----------------------
 1 file changed, 35 insertions(+), 61 deletions(-)

diff --git a/drivers/platform/x86/oxpec.c b/drivers/platform/x86/oxpec.c
index 4b48f4571b09b..86ac32eadd6ef 100644
--- a/drivers/platform/x86/oxpec.c
+++ b/drivers/platform/x86/oxpec.c
@@ -87,8 +87,6 @@ static struct device *oxp_dev;
 #define OXP_MINI_TURBO_TAKE_VAL		0x01 /* Mini AO7 */
 #define OXP_TURBO_TAKE_VAL		0x40 /* All other models */
 
-#define OXP_TURBO_RETURN_VAL		0x00 /* Common return val */
-
 /* X1 Turbo LED */
 #define OXP_X1_TURBO_LED_REG		0x57
 
@@ -328,95 +326,68 @@ static int write_to_ec(u8 reg, u8 value)
 	return ret;
 }
 
-/* Turbo button toggle functions */
-static int tt_toggle_enable(void)
+/* Callbacks for turbo toggle attribute */
+static umode_t tt_toggle_is_visible(struct kobject *kobj,
+				    struct attribute *attr, int n)
 {
-	u8 reg;
-	u8 val;
-
 	switch (board) {
-	case oxp_mini_amd_a07:
-		reg = OXP_MINI_TURBO_SWITCH_REG;
-		val = OXP_MINI_TURBO_TAKE_VAL;
-		break;
 	case aok_zoe_a1:
+	case oxp_2:
 	case oxp_fly:
+	case oxp_mini_amd_a07:
 	case oxp_mini_amd_pro:
-		reg = OXP_TURBO_SWITCH_REG;
-		val = OXP_TURBO_TAKE_VAL;
-		break;
-	case oxp_2:
 	case oxp_x1:
-		reg = OXP_2_TURBO_SWITCH_REG;
-		val = OXP_TURBO_TAKE_VAL;
-		break;
+		return attr->mode;
 	default:
-		return -EINVAL;
+		break;
 	}
-	return write_to_ec(reg, val);
+	return 0;
 }
 
-static int tt_toggle_disable(void)
+static ssize_t tt_toggle_store(struct device *dev,
+			       struct device_attribute *attr, const char *buf,
+			       size_t count)
 {
-	u8 reg;
-	u8 val;
+	u8 reg, mask, val;
+	long raw_val;
+	bool enable;
+	int ret;
+
+	ret = kstrtobool(buf, &enable);
+	if (ret)
+		return ret;
 
 	switch (board) {
 	case oxp_mini_amd_a07:
 		reg = OXP_MINI_TURBO_SWITCH_REG;
-		val = OXP_TURBO_RETURN_VAL;
+		mask = OXP_MINI_TURBO_TAKE_VAL;
 		break;
 	case aok_zoe_a1:
 	case oxp_fly:
 	case oxp_mini_amd_pro:
 		reg = OXP_TURBO_SWITCH_REG;
-		val = OXP_TURBO_RETURN_VAL;
+		mask = OXP_TURBO_TAKE_VAL;
 		break;
 	case oxp_2:
 	case oxp_x1:
 		reg = OXP_2_TURBO_SWITCH_REG;
-		val = OXP_TURBO_RETURN_VAL;
+		mask = OXP_TURBO_TAKE_VAL;
 		break;
 	default:
 		return -EINVAL;
 	}
-	return write_to_ec(reg, val);
-}
-
-/* Callbacks for turbo toggle attribute */
-static umode_t tt_toggle_is_visible(struct kobject *kobj,
-				    struct attribute *attr, int n)
-{
-	switch (board) {
-	case aok_zoe_a1:
-	case oxp_2:
-	case oxp_fly:
-	case oxp_mini_amd_a07:
-	case oxp_mini_amd_pro:
-	case oxp_x1:
-		return attr->mode;
-	default:
-		break;
-	}
-	return 0;
-}
 
-static ssize_t tt_toggle_store(struct device *dev,
-			       struct device_attribute *attr, const char *buf,
-			       size_t count)
-{
-	bool value;
-	int ret;
-
-	ret = kstrtobool(buf, &value);
+	ret = read_from_ec(reg, 1, &raw_val);
 	if (ret)
 		return ret;
 
-	if (value) {
-		ret = tt_toggle_enable();
-	} else {
-		ret = tt_toggle_disable();
-	}
+	val = raw_val;
+	if (enable)
+		val |= mask;
+	else
+		val &= ~mask;
+
+	ret = write_to_ec(reg, val);
 	if (ret)
 		return ret;
 
@@ -426,22 +397,25 @@ static ssize_t tt_toggle_store(struct device *dev,
 static ssize_t tt_toggle_show(struct device *dev,
 			      struct device_attribute *attr, char *buf)
 {
+	u8 reg, mask;
 	int retval;
 	long val;
-	u8 reg;
 
 	switch (board) {
 	case oxp_mini_amd_a07:
 		reg = OXP_MINI_TURBO_SWITCH_REG;
+		mask = OXP_MINI_TURBO_TAKE_VAL;
 		break;
 	case aok_zoe_a1:
 	case oxp_fly:
 	case oxp_mini_amd_pro:
 		reg = OXP_TURBO_SWITCH_REG;
+		mask = OXP_TURBO_TAKE_VAL;
 		break;
 	case oxp_2:
 	case oxp_x1:
 		reg = OXP_2_TURBO_SWITCH_REG;
+		mask = OXP_TURBO_TAKE_VAL;
 		break;
 	default:
 		return -EINVAL;
@@ -451,7 +425,7 @@ static ssize_t tt_toggle_show(struct device *dev,
 	if (retval)
 		return retval;
 
-	return sysfs_emit(buf, "%d\n", !!val);
+	return sysfs_emit(buf, "%d\n", (val & mask) == mask);
 }
 
 static DEVICE_ATTR_RW(tt_toggle);
-- 
2.49.0

