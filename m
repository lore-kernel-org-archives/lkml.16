Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62BB2147E7;
	Thu, 10 Apr 2025 21:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744320625; cv=none; b=pOebqKVbBxo3ijjcYzRgRm4l3pjfl8fBAZA+rXJc9c8njSj5vhYnOoNUEpkrJ2nQWCP4V7lMl72HYOLnVtq2ZXMQ/cnE80npGdehemOsLx4Guef6OZh0u/U2kPU6DDH5x5H1qNqA9XKyROySlYGFcXaxz3GpBtSiSmbdCuAA8iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744320625; c=relaxed/simple;
	bh=DtW9p7sIFn3Lr0thD0opZfYZCvln0+vg+bFmQmtjCb4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=FCueeINnJ5Sjn+bm2goGt2y2Vx3JAolTerNEVhTZgQa8iPOd6p7Nht8yPGB09XYTQR0p/wuOMQFPw7wZW7KGZ+RUd7O5MMTNpKzamwYFZXHHbiko/FpmPW3HAs9svjxTMiCpmklnj0E65x3wpEgIfU78yTY441t1R8usCeMTLmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PDrEk+uM; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PDrEk+uM"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3965c995151so552431f8f.1;
        Thu, 10 Apr 2025 14:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744320622; x=1744925422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9+8olWxBi1dycgdk6iFY3F5FhW2cFaD8o5hGv/hrFiY=;
        b=PDrEk+uMjbUVKNW5pHkpAm++I23st681lkf6NgNjn6NR8rvSQNaDwVfhzwpsM0prS1
         RsrTWF6LKVDC8KN9nchZdJ3LvzBewJwjKzGa1h0DgoWgk1uStMY4+DPv0KXpItn7cmAR
         kkD84duTC64WHOM/vZJiIJ7yfAfL/tpcTX//CzBNKa9wZzS30SJFaOeluLvF55D1YaYs
         Vt/3iIucpG45apJ15yPP2W47XvWBKHqxsZDJkt5TE+phrN2je4eGuZ/9ZhZyYsAyzuwJ
         JiaRhR3lNjfaNHbBjauezgo836wqd35s5XfgdzUf1EpjGRyRfkVuMmBU0oNK2mkCqcP1
         AEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744320622; x=1744925422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9+8olWxBi1dycgdk6iFY3F5FhW2cFaD8o5hGv/hrFiY=;
        b=IVu0p9xJAhGtu+PF+677Zv3OTOxHcCj+t/KEQUUmeEzFoda5WWXOIQ2y6fq5Wtb+79
         ws8CvB39bOvrOGGbQesX+6rXVQ8t1AmrQkEvvVxO6Haz5FpQGoP/P7zLpCU2NBKpLL4h
         rK9Kz0XHTTmPvwfrtQexBAonpowv/fCzsRf26Qge8awRaWZQAM9X9Kk4BikeLgiIyaY0
         Ax+P4hRu7oq+Qgw7aBt04q/9Sf6me36+qEzWbmw4vOYOUHg/hkTpdFw4P2Toj0avRP3Q
         EvMSNp+n7evw33kYuqqeeoEEygphNk6e4hOXu8Ku34yord+/lgZWXgRl3L1ONlrI5Qeo
         y5uw==
X-Forwarded-Encrypted: i=1; AJvYcCX4T62xC/6Wf9nwm8RZAaKOaJnZISdec0loS9e45in+BPD1ZDcTmAY3X1DyO4lF2QfFj8NAwz/GASkA0LvjGsZ/ReJJ7A==@vger.kernel.org, AJvYcCXr0B+Dq5wuyCBPct7ITGyNZ7HGC3ZKTjyUyb85kqlnelZA+fMZR/ko2Sxpje5aFOeKOTsM1u5YOaDqcZ0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4I5jNhW/kOELHrGkfBfmRVXPkIOSVbkGvwQ0xyn9vu7cKWI/d
	Z3TfHpf0uf7qVLWF0txFSvaEg6khblbHAb+EJKSEJuj9p0RbZPvbrRpxXGtT
X-Gm-Gg: ASbGncvIKvznEX21/Nw+4TrY24As5XWaYUr5k1wZoVhW16j1IxskEmEAktDHKNUS89F
	wnEgwRTGNbo8LFORqokIhoVZ1pGlRXEO5z1cIZHwASRi98c8L5RBYhxkxfo7c2A0Ymp5+gDGaSs
	sCyoAGnCVe1KxGnPnQV+P1jjX3l9zLP0lMBRtmGHVJWvpDwKu8RFJKvlUjO9RZ9nyThFwCDEyjC
	3PUiRHUPDEl98ZwzCGBdxrTLOWEAZ+IbN0EGg/73HKs8eAfxdMI35NhD6gSpn/WTPtMzseGiaDI
	2MguZjTY2I0EwfIDFFjJ0IO7Ps1hkU2yhPJpiG4J
X-Google-Smtp-Source: AGHT+IE/OfbhcCVIY7M4P66jXSL3xeNy/e8xh8ge17vikhHw0wTpNIhrbAIBPsc+O+7o+ejDQzJ2Sg==
X-Received: by 2002:a05:6000:2ab:b0:39c:2688:4ebf with SMTP id ffacd0b85a97d-39ea51d10b6mr164862f8f.6.1744320621812;
        Thu, 10 Apr 2025 14:30:21 -0700 (PDT)
Received: from pop-os.. ([2a00:ee2:303:6800:a6b5:368:e9d2:f033])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f235a5b08sm65446475e9.33.2025.04.10.14.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 14:30:21 -0700 (PDT)
From: =?UTF-8?q?Ga=C5=A1per=20Nemgar?= <gasper.nemgar@gmail.com>
To: ikepanhc@gmail.com
Cc: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	=?UTF-8?q?Ga=C5=A1per=20Nemgar?= <gasper.nemgar@gmail.com>
Subject: [PATCHv4] platform/x86: ideapad-laptop: added support for some new buttons
Date: Thu, 10 Apr 2025 23:29:37 +0200
Message-Id: <20250410212937.28772-1-gasper.nemgar@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Added entries to unsuported wmi codes in ideapad_keymap[]
and one check in wmi_nofify in order to get wmi code 0x13d to trigger platform_profile_cycle

Signed-off-by: Gašper Nemgar <gasper.nemgar@gmail.com>"
---
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

