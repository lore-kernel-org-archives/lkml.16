Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5552A1FE45C
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 07:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744096764; cv=none; b=bwm5BQpvwsPEZUiF5NJDnT11N/h1ZwlIXMtzfjTHb7lyQ1rZfbI/VjdJtDx/yno2DlwQGg9m2le53Dwc6IDH5mcuu6vyLnzuV7EhlX4jVnBv6/XhLdtfRBBxQeFuzfP+UbGKfbT3lzF1nM7At/QoMI2lDM/EXKGBh3UiQWHtUgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744096764; c=relaxed/simple;
	bh=N7E+LxEtt1UxqxTbM3X6qBMRxODpN3NuXknc/XDb+A8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=kCitUGr2XBfri+STiuhktnkHk+yUy81tVnLzQvfQh26dp5plG3vYzD9DjqxQpNzOf6JM/IFDaPrYXH2nRxGX1Zz8rtPAkAHgp+iMTyt4xiQWYTjUIA5g51nXVmIlvuA51FiMQbcf7KEj9a+Wa1Hyv/XsLrwVc6U/oe4L8waKZqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=WvIIk02U; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="WvIIk02U"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so32829395e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 00:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744096761; x=1744701561; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KKJBwlWJzXJb15ejrGd+NArOPJQ5lvjy79cwJXmKSR8=;
        b=WvIIk02UxyvBzo+fZbNzaSCh1XoF2RCv3dyhegXOe4nwowh/VA03GA0z5y+6IsqkdP
         IV756OXkNd3j/Z0In62C1jEKOBQpaxxVB+IIfZ1l2mH8qTBhIQOdTWKZn33CBIhpwhDr
         Va8Fbj3KV8ZftkTuJOYSCgL1JUfH23dVHbNHGaxegVrhLL+mYv9SKx1HsPobZgFMSsyA
         vX/KUKjJix7fkUuE7XnOejk5zpOjxljajomv/gPYCmTAYpJxpH7P3L9a1rubCViL4qW7
         mY4q4hdMEhEnTg1faS47dQKsDY4/j3OdCeeLnqV002gyKJz8eecnC8NiJIPr4MU2N1In
         g2Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744096761; x=1744701561;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KKJBwlWJzXJb15ejrGd+NArOPJQ5lvjy79cwJXmKSR8=;
        b=Sx+tN2X1d68RIHpwSQac3hrV7NLXWlUHShpV4uiSkBO42FCp5b0ULOtwS4jeKE32+6
         rO+bRSo4oOQypnOBk4fRwd6YohaMcPYuB8Ct/0fWQedFboh73IyoZ0V1ckDslCIdAslT
         Jw1ibQvmGdClnH08MMlia10OwpJDuhoH9wTKpXdUCRnFajTtU4uBJ1uPZJcTBZ0t6++h
         QgZr+ouz+LaPZ0LFLtQHu6yUqK7ZBvCexDPliCnHXDjDRoierBTG6/1OmVlDVfGTT0Y2
         UKhmWfDwHG7oOYWT/rKPOgB7RdzRSSkZuKgHL4lZ6BU+vqGsC2+SZtXj5Y3aAuE4s9Id
         YcCw==
X-Gm-Message-State: AOJu0Yw79amIPOrCDHIIT7YOM4YDWwd04gj7a7luvlo2ZLZSsVbn4ZaW
	BgDTkQuHF7qNQeFoqBn/6T8ORZwTpAB5eKJpwdLC4HFk77ktuXxhrdXQBhYbSgLyxFUxVi/Ufs9
	qxk8=
X-Gm-Gg: ASbGncs9nI80CfdTW8T1GtJngEo+slpCTIvLXc7PrZMy9EU+8PL3Nhfq/liIYt0vDPM
	k6LUnwEpS+odPGtk6HdLSkRZv9sMi4DI/pUBh5xDJOC+7izL6F5MKhVFW0UrkS3/Pz6lPLLvzFh
	oTtcUmmujl4pPtKo5lr9unHmmmclB6ebYUacazx+794+dvOf1i1CJyd5bC5eRbEmB3z0TC46REZ
	sCDvqs+y9SOlHDbuIxij2OvLXZ6pvxcA0THhWkeVX1QonK23Nis22b6dBTJI03q/hgR8OT6m3FQ
	TkOT5ZFSd6rj0XPokOIiDuSiqauovAquxOf3Hw==
X-Google-Smtp-Source: AGHT+IEIySkkIbbIIpNblvZEqN4nQUwCYsi9D3C2Bw1thAf9Ht22MUBwLJU2AIMa25qU6meS5LicHw==
X-Received: by 2002:a05:600c:5845:b0:439:4c1e:d810 with SMTP id 5b1f17b1804b1-43f0e59c566mr12189245e9.9.1744096760713;
        Tue, 08 Apr 2025 00:19:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a6ae5sm14228903f8f.32.2025.04.08.00.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:19:20 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:19:19 +0200
Subject: [PATCH] platform: cznic: use new GPIO line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-platform-cznic-v1-1-c3d4e724433f@linaro.org>
X-B4-Tracking: v=1; b=H4sIAPbN9GcC/x3NSwqAMAwA0atI1gZav+BVxEWtUQPallREFO9uc
 fk2Mw9EEqYIXfaA0MmRvUvQeQZ2NW4h5CkZClXUqlIal8Derhww0oFyYtjMMXvZ0d6OLWqjy2a
 cqtbUI6RIEJr5+gf98L4fovpYZHAAAAA=
To: =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3482;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=HyWh3p3k1T6Eix3dRhD8lojfA1Eb4WTNRroSsHG3GhI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9M33jkNalOD2GwidvbatAtDCf/ogO1F9nX9Fr
 snKQ6hBifyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TN9wAKCRARpy6gFHHX
 cmTKD/49k5a75cgxvE4AaAqKedbRiSCfY6+RV0yOlMJPQjNs7bqTpOo/K5VgAyqQp+Fkqggnfb4
 rLX95hpUAn2HwuFj6VDTUsev9xg760HkYMTpaLSTJHmOdooTFnErECCcMT167iGhBrXkXlijxZp
 IMwfufhU4wbxkaonraIBRBJgcdIfwXPnbDc0rItXc13OjWmdXK/f7GNqp9Og/PQ1LvEYl1Tggzp
 7sOPJ8nbxRere/m4KalgXEieJm7Q8YwQkYpXNL50l5ZwqkoTkXi6j7xTydCPPqf8rLn9rfbcG2Q
 fBAh7rVBoLhuZyySPpsXLIqHxOJksJgpJTS6VTBf1YGDHfUBzNXfNN2tEhLSuKoYouIifiv+110
 0sf++L80/nfV39uJjlSSta2p8N+ZVrBQRRnXc9AItk2KsVEQYfqPGCL192zuWsDI/TcQPmNwwXq
 cW/i/rAlit+8icjpbSHMo4CWqv0/vK1+OPfrHzLCa7EbpWavXjjzd4/i63C39ezn+a9qO+PSjWd
 3XjOJVMkQicGlfWbEozQFXFzNoWkRQqeEXm/MEaHEB0Vou0+rV2gSjoBoWAiNJ27tlSmA2XsUlk
 x+ZERHI3BOnp3fptGgm1C4ez6ocdgWNjVCWcAEElHwEwja0bVru3r9LdvQeopZO7UTOehcx5QXk
 79EYOloZyt/jdlg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
values") added new line setter callbacks to struct gpio_chip. They allow
to indicate failures to callers. We're in the process of converting all
GPIO controllers to using them before removing the old ones.
---
 drivers/platform/cznic/turris-omnia-mcu-gpio.c | 35 ++++++++++++++++----------
 1 file changed, 22 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/cznic/turris-omnia-mcu-gpio.c b/drivers/platform/cznic/turris-omnia-mcu-gpio.c
index 5f35f7c5d5d7..df9e4b2c6aaa 100644
--- a/drivers/platform/cznic/turris-omnia-mcu-gpio.c
+++ b/drivers/platform/cznic/turris-omnia-mcu-gpio.c
@@ -438,27 +438,28 @@ static int omnia_gpio_get_multiple(struct gpio_chip *gc, unsigned long *mask,
 	return 0;
 }
 
-static void omnia_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
+static int omnia_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	const struct omnia_gpio *gpio = &omnia_gpios[offset];
 	struct omnia_mcu *mcu = gpiochip_get_data(gc);
 	u16 val, mask;
 
 	if (!gpio->ctl_cmd)
-		return;
+		return -EINVAL;
 
 	mask = BIT(gpio->ctl_bit);
 	val = value ? mask : 0;
 
-	omnia_ctl_cmd(mcu, gpio->ctl_cmd, val, mask);
+	return omnia_ctl_cmd(mcu, gpio->ctl_cmd, val, mask);
 }
 
-static void omnia_gpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
-				    unsigned long *bits)
+static int omnia_gpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
+				   unsigned long *bits)
 {
 	unsigned long ctl = 0, ctl_mask = 0, ext_ctl = 0, ext_ctl_mask = 0;
 	struct omnia_mcu *mcu = gpiochip_get_data(gc);
 	unsigned int i;
+	int ret;
 
 	for_each_set_bit(i, mask, ARRAY_SIZE(omnia_gpios)) {
 		unsigned long *field, *field_mask;
@@ -487,13 +488,21 @@ static void omnia_gpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 
 	guard(mutex)(&mcu->lock);
 
-	if (ctl_mask)
-		omnia_ctl_cmd_locked(mcu, OMNIA_CMD_GENERAL_CONTROL,
-				     ctl, ctl_mask);
+	if (ctl_mask) {
+		ret = omnia_ctl_cmd_locked(mcu, OMNIA_CMD_GENERAL_CONTROL,
+					   ctl, ctl_mask);
+		if (ret)
+			return ret;
+	}
 
-	if (ext_ctl_mask)
-		omnia_ctl_cmd_locked(mcu, OMNIA_CMD_EXT_CONTROL,
-				     ext_ctl, ext_ctl_mask);
+	if (ext_ctl_mask) {
+		ret = omnia_ctl_cmd_locked(mcu, OMNIA_CMD_EXT_CONTROL,
+					   ext_ctl, ext_ctl_mask);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
 }
 
 static bool omnia_gpio_available(struct omnia_mcu *mcu,
@@ -1014,8 +1023,8 @@ int omnia_mcu_register_gpiochip(struct omnia_mcu *mcu)
 	mcu->gc.direction_output = omnia_gpio_direction_output;
 	mcu->gc.get = omnia_gpio_get;
 	mcu->gc.get_multiple = omnia_gpio_get_multiple;
-	mcu->gc.set = omnia_gpio_set;
-	mcu->gc.set_multiple = omnia_gpio_set_multiple;
+	mcu->gc.set_rv = omnia_gpio_set;
+	mcu->gc.set_multiple_rv = omnia_gpio_set_multiple;
 	mcu->gc.init_valid_mask = omnia_gpio_init_valid_mask;
 	mcu->gc.can_sleep = true;
 	mcu->gc.names = omnia_mcu_gpio_names;

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250401-gpiochip-set-rv-platform-cznic-1a136bd47a5b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

