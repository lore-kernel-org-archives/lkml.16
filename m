Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB3222A1D5;
	Thu, 17 Apr 2025 10:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744887502; cv=none; b=l6qPVtKMweEhYYad1UTO8zuMxFBGmn1LJuFGmNdpZ6/7Hovw5ddIlgKsssmV+qZLGXWqtjsooYho2liAhGcmrOIvu7839pYav4g7ZTFESf3m+EkXHr5KrzqXer2vabHhRU6+FH22SKfpTb5jHFiu6oxjyD0XgKxpBAUqxIAd3pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744887502; c=relaxed/simple;
	bh=6pApmvsVQVsQmnATukOO7BvLu0XhL5vPN5/CoEIDPr0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=R6RcVDfwhgScnnFB6jNq3CFJygPuDfgyc4FPd15eqZllc08U1davh86WtUlxzW2pTPpEF6GoCylLgE1g1Ezv1iUUetG/aTUDlYcvRzs3SQ8Hh1eSn6egCsURCCb2+51c07kbaSvfHGBv4iHdCZ0WEkMNcxUmNPcxBfPrGlPez30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FNhEoVDW; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FNhEoVDW"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso356969f8f.2;
        Thu, 17 Apr 2025 03:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744887499; x=1745492299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4GrUlyk74WjltV2K0kWiBgfuLaCstnwmS8DfLOMBDsk=;
        b=FNhEoVDWbPp/TrUyhnuLYvmBWdIQTsegAdw/wnMcE+CnA3TysBfnLla0YB5BGNNjR5
         aAAl05YMoGWhuOuwKVVCDqvScxpx54nxs0c65WjdkGxIriWR4UY9fovAtULFK5zmt0Fi
         YLayC9tDtWK4vpa+/OkfMdfooyoTiPMQ54y3tmPDMhwO8J5iQGeTleil8hCk+6hZrdEG
         sNfHR2e/Z7osyAL+5nCcN+4bFbn4cZGZWO7yuhHi+iglAST8LJfsJ12iPdACPir1jcda
         R2m9HHQAQX3/E05Byt5pERl5Uxjli718xhMCaScXye6z8ZVlGZZa6/PAl+VsIi/vSqUF
         MqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744887499; x=1745492299;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4GrUlyk74WjltV2K0kWiBgfuLaCstnwmS8DfLOMBDsk=;
        b=vJEMvvJH+qdQuk32l6H6BHtWaestJNnMtT/zLeulCnqD9mwC0BoQvHzOXQQpu3BnSL
         aKdZs76X9sO8nIvGivpllyAH295tqHaouwQJPq3I7aCGcmsDw/OFZrSiN9Jt5qxr2urN
         b+HwRv5sd4ceOYdq9V2kG+xWXjp26QO0lGLvowxO6V0nIZW0vIWmQ2WjnAYeZIBjZx76
         wN+qJxGAQEEJdo9ZmPsNv9CDCAFxKgNN/yvwOfN8uBssRol8d8hren90aNnhPOaPFx0Y
         BJVLUSqTuOuqjIuOClZoN1uHtTSE4Ly5DqrflHXhsWhsLd5/XiNtCmx1f1cDDCmgcr5w
         ZJLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGyvJ6PrOyEknYHeHob4CNj3GAFhSsHhjoYRFhN2oUI2pfl7x1R0T2zTTkUP2lth0PwWz7gomzSEjamZm3KyHdvhbDTQ==@vger.kernel.org, AJvYcCW7gtCNVAd8+0723wu+UazKvuVgmZ4ndm80E6UwGCNdeFbIHnqOz++scg6Mfcy1+Q6gDUhGCF6D+y1A8CQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd5t20V7v1riR9tQsIOuUEIfLTq2EhLnTMPtMXoqw422FS38rv
	zvT94Hjg58d3EUKL3gk/wtnkCxjVsmYav4pgeCro0Q7a/jMdnYei
X-Gm-Gg: ASbGncukwtxuztD7Q0zCK+T7tcQjSIePi7PJjO2AqZDhdKKdsgU2qLnDzms1DG7vrKp
	YvFbZ/r/rRu9uyTbI+JodVTGn7FXOQj7x1pLurwLbtVSpWqa95LndFNXb+n0OwQon4CxKusPSvK
	CJIHfEdWhyQ5gO+zSnsSt1d3kbt+W2FgYn6YPfrfIixkYvZyuyLQG0C/e3T2zZ0O4uhwI5JQdyy
	nEL3DUrJHrmBi1PkujYEkwBhGOyDup8iEATngqUy/uzo/mI3PYJc1DXnK4mP+WWYAMq21FvC0zb
	c0W8vkdSi2l4I5s+FIWAhFa3dEeZspaDz3XMOQM6BTJIU8tEL7RFQ0lBEr/OhA==
X-Google-Smtp-Source: AGHT+IG0PYQiJFZINtUaPciBIboDtC5A735X1xBsUNdqImMGNzueSKa5sJ8oBIjpqFgCr0mbUKvK4A==
X-Received: by 2002:a5d:6da6:0:b0:390:f738:246b with SMTP id ffacd0b85a97d-39ee5b1891bmr5027735f8f.15.1744887499123;
        Thu, 17 Apr 2025 03:58:19 -0700 (PDT)
Received: from pop-os.fkkt.uni-lj.si ([2001:1470:ffef:fe01:b721:35c:4932:2a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b58cc0csm49421255e9.32.2025.04.17.03.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 03:58:18 -0700 (PDT)
From: =?UTF-8?q?Ga=C5=A1per=20Nemgar?= <gasper.nemgar@gmail.com>
To: ikepanhc@gmail.com
Cc: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	=?UTF-8?q?Ga=C5=A1per=20Nemgar?= <gasper.nemgar@gmail.com>
Subject: [PATCHv5] platform/x86: ideapad-laptop: added support for some new buttons
Date: Thu, 17 Apr 2025 12:57:58 +0200
Message-Id: <20250417105758.100675-1-gasper.nemgar@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Added entries to unsupported wmi codes in ideapad_keymap[]
and one check in wmi_nofify in order to get wmi code 0x13d to trigger platform_profile_cycle

Signed-off-by: Gašper Nemgar <gasper.nemgar@gmail.com>"
---
Changes in v5:
 - Changed performance button to KE_KEY 
Changes in v4:
 - Changed performace button to KE_IGNORE
Changes in v3:
 - Minor changes
Changes in v2:
 - Added more codes that trigger with key combos (Fn+N, Fn+M, ...)
 - Added performence toggle in wmi_notify()
Changes in v1:
 - Added codes for buttons on laptop(performance, star, ...)
---
 drivers/platform/x86/ideapad-laptop.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index 17a09b778..72d3306ef 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -1294,6 +1294,16 @@ static const struct key_entry ideapad_keymap[] = {
 	/* Specific to some newer models */
 	{ KE_KEY,	0x3e | IDEAPAD_WMI_KEY, { KEY_MICMUTE } },
 	{ KE_KEY,	0x3f | IDEAPAD_WMI_KEY, { KEY_RFKILL } },
+	/* Star- (User Asignable Key) */
+	{ KE_KEY,	0x44 | IDEAPAD_WMI_KEY, { KEY_PROG1 } },
+	/* Eye */
+	{ KE_KEY,	0x45 | IDEAPAD_WMI_KEY, { KEY_PROG3 } },
+	/* Performance toggle also Fn+Q, handled inside ideapad_wmi_notify() */
+	{ KE_IGNORE,	0x3d | IDEAPAD_WMI_KEY, { KEY_PROG4 } },
+	/* shift + prtsc */
+	{ KE_KEY,   0x2d | IDEAPAD_WMI_KEY, { KEY_CUT } },
+	{ KE_KEY,   0x29 | IDEAPAD_WMI_KEY, { KEY_TOUCHPAD_TOGGLE } },
+	{ KE_KEY,   0x2a | IDEAPAD_WMI_KEY, { KEY_ROOT_MENU } },
 
 	{ KE_END },
 };
@@ -2080,6 +2090,14 @@ static void ideapad_wmi_notify(struct wmi_device *wdev, union acpi_object *data)
 		dev_dbg(&wdev->dev, "WMI fn-key event: 0x%llx\n",
 			data->integer.value);
 
+		/* performance button triggered by 0x3d  */
+		if (data->integer.value == 0x3d) {
+			if (priv->dytc) {
+				platform_profile_cycle();
+				break;
+			}
+		}
+
 		/* 0x02 FnLock, 0x03 Esc */
 		if (data->integer.value == 0x02 || data->integer.value == 0x03)
 			ideapad_fn_lock_led_notify(priv, data->integer.value == 0x02);
-- 
2.34.1

