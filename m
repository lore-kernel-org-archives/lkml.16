Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D4A252900;
	Fri, 18 Apr 2025 07:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744960069; cv=none; b=oYAYd50kdWaS79famc1i0ZE0aLCG9DQr4ZyigZV4Sy9jhch2FDKKWg+pJg3MkjedBfYUTKgNDA+PgE+MUXq+4GQQpFiJFujbdbWBE8o+jDRFAnBPzW5lUMoP+FbNMkvuWXPvxDCV1LqkT+K++H1OuRs1eR+WAqkUYi8BoqyG2HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744960069; c=relaxed/simple;
	bh=cto9DbEuEGyqEZmtGwIiTP7CgzV3QxgjQjozuyiK460=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=kwkkoWVqPU5ZIRxlqqn2ALTkqfehbHxuL1l/P2Aay2/ePKrHTGD1KHzdp81yEYP0MIRUcJIbXRyXCBPY6n3u5vdzQ6vK0/8O9Bhkwf1+0ZpMMUEYKw7IgeJbw6Lp7YQY2LPa6C3ZlWU1yInUia15tBb6PCzN9QGJJn6GcsFZ5QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dC2qsBGk; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dC2qsBGk"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39ee682e0ddso923152f8f.1;
        Fri, 18 Apr 2025 00:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744960066; x=1745564866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bPJExcUU4HBEusxIHavNs8We88ebopcHgFYpLqHEIIM=;
        b=dC2qsBGkgtgJEUDAzQIaSANSXXBYtYTAzQAbBK55UY9aLo5Dl/6iV1qx2EJMcXTo6b
         d9xZG7yQy0w2Pm+au6aPeoUgjuEF+BUukFYWwE5PTffW8jW67I7tHaEGaaMprezfIUaE
         dz+YomY2HajBvlaEgxlhSlNaGaMgQUByPpHSAdF7c+IdX4ONPvooV8SE4KcJkZJBVZsm
         UxTSP6Ag114GUfkeCRY67APA30ycXUOu1qcBvsHLT7qjiC1A44L/CCVHQ8KMWY4AQFLW
         cbdf2vAGzlvSuCfKmwtXUHpS3BkfiI7BC+PZ1a2tHrNbcKoC2SCi7RUwT8/rK58jAEk3
         MWcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744960066; x=1745564866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bPJExcUU4HBEusxIHavNs8We88ebopcHgFYpLqHEIIM=;
        b=xTg1afMTWn2jKoJm8A36wto2yJD4RrjRD0qrqRqZMAVSEe+MnyCZUJ/Hu+oZ4kG1rd
         eEOz7hwN+MtKNbbeuh5JyQgLzSYLjLmt6XgAmqaBY71uPvu/VZeo1rIJDBt45k1Tx6yR
         WGj8zO2ToKTxtAK1ArSwb+AIkXP02nGiVneF0oLGTuyw9Qop/oxV8dt9Ouhf6+ceu3HS
         jCaqkWhb9F2dCnvIQ9DvmBOsIvtt0M4FErzJnbEekHyz1RqAQnLXEYrnQfJr6zCUy/nj
         bANGD15LTxeyCinJjPJdJUQoeDRdpvlxJy9Rs3jDcCk3K0ZGdcVVzQTp0Rx/MpKHB/Gx
         HbCg==
X-Forwarded-Encrypted: i=1; AJvYcCXY0Q+ulpU8EoFVLXIvYgKHV+l2QKT44JkpDSafFuMnO5P/mP6LDV6moHnkStPIYC/m+RmFRrzbKmIdn9V5ovaUX5haAQ==@vger.kernel.org, AJvYcCXymWT8j8f7fIgglW4igH9+uThqvBYwb0CBV9xYb8Ihj1c9PEu6RnKLY0IY23HeIJ8zjv7oSqO/IrG1mNU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxA7S6qJxKKpO97xGlYhRpouEjjwZcHM041w5FJCMLOGp7l/suv
	eJZ9/6Nc4NNQ1K8vjHVj9j6gyNag1NqUDXVw9DheFFMyKNepOgcy
X-Gm-Gg: ASbGncv6gUSUGgU6jc4YGRgcOTVuIehmmnA1Us3OBUF8Qv5Z05rl5fYco4ka3+2MrJ7
	qnN9NpZbxbOQWGDBHjTqTX7oQkFcusYLMnnVJ+Dh036OEn1SfE9H213sFQ+ml/io0lQMGqpcBdA
	Oc+Z3ew7OAVsoVrNEdMhJZwdNlhnPH7+AUp1LIsuqN2CXQc+0+rYc7i3XF48rZxENigSYRZbTmv
	3JDJt/CTTjCQbH0nNfKKSGBWH+KH2xrGjQ8xHADgwcBoaDVBDQ7y+n1eiVa9oSvb9I4UCmO1cDc
	i2rINUQnnjWTYDmZCo6rx0GPAVsD3GWP55JCCvSbMKjpoAlYFRWiTbKqA5V0Yk0=
X-Google-Smtp-Source: AGHT+IGDq4sZuN8N7f1md7Q3cfJ2tfosrjrd2INgNCTnVnZEBHzWNRKx1iKPfpn3pc6GDQ8nOIDC1g==
X-Received: by 2002:a5d:47cb:0:b0:39a:d336:16 with SMTP id ffacd0b85a97d-39efba6d8fbmr1046133f8f.34.1744960066107;
        Fri, 18 Apr 2025 00:07:46 -0700 (PDT)
Received: from pop-os.fri1.uni-lj.si ([2001:1470:fffd:32ff:cf9b:b36d:7c92:ffea])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5aa100sm11131855e9.7.2025.04.18.00.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 00:07:45 -0700 (PDT)
From: =?UTF-8?q?Ga=C5=A1per=20Nemgar?= <gasper.nemgar@gmail.com>
To: ikepanhc@gmail.com
Cc: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	=?UTF-8?q?Ga=C5=A1per=20Nemgar?= <gasper.nemgar@gmail.com>
Subject: [PATCHv6] platform/x86: ideapad-laptop: added support for some new buttons
Date: Fri, 18 Apr 2025 09:07:38 +0200
Message-Id: <20250418070738.7171-1-gasper.nemgar@gmail.com>
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
Changes in v6:
 - Minor changes like typos
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
index 17a09b778..532efb9d1 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -1294,6 +1294,16 @@ static const struct key_entry ideapad_keymap[] = {
 	/* Specific to some newer models */
 	{ KE_KEY,	0x3e | IDEAPAD_WMI_KEY, { KEY_MICMUTE } },
 	{ KE_KEY,	0x3f | IDEAPAD_WMI_KEY, { KEY_RFKILL } },
+	/* Star- (User Assignable Key) */
+	{ KE_KEY,	0x44 | IDEAPAD_WMI_KEY, { KEY_PROG1 } },
+	/* Eye */
+	{ KE_KEY,	0x45 | IDEAPAD_WMI_KEY, { KEY_PROG3 } },
+	/* Performance toggle also Fn+Q, handled inside ideapad_wmi_notify() */
+	{ KE_KEY,	0x3d | IDEAPAD_WMI_KEY, { KEY_PROG4 } },
+	/* shift + prtsc */
+	{ KE_KEY,   0x2d | IDEAPAD_WMI_KEY, { KEY_CUT } },
+	{ KE_KEY,   0x29 | IDEAPAD_WMI_KEY, { KEY_TOUCHPAD_TOGGLE } },
+	{ KE_KEY,   0x2a | IDEAPAD_WMI_KEY, { KEY_ROOT_MENU } },
 
 	{ KE_END },
 };
@@ -2080,6 +2090,14 @@ static void ideapad_wmi_notify(struct wmi_device *wdev, union acpi_object *data)
 		dev_dbg(&wdev->dev, "WMI fn-key event: 0x%llx\n",
 			data->integer.value);
 
+		/* performance button triggered by 0x3d */
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

