Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1E218DB17;
	Thu,  3 Apr 2025 13:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743685503; cv=none; b=Y/xqDfJE1YqFkQyn8Oksqks3QPgo6x76Zuw1+KZYGQXMPThWOaMfi8DvOhMmeNa4RCk2I96UMa0VaftuFLmUfKm3GT156XAqbr+SduOjz3naNLToNm273Q5C+3xjLpRxF8oprz1aJMIfycnFbfRC1n/UbxXuwwhdZwbi+1i736c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743685503; c=relaxed/simple;
	bh=DtW9p7sIFn3Lr0thD0opZfYZCvln0+vg+bFmQmtjCb4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=uSmSfJXuL4+nq778T55dBy2oPH6cGgUrsFhJ6xT0amtttQMmL2k/7uk8RlIakfkEaACVv+qOqOd6jxZOqoCx/lhjvONsVi4jWhKoE3C8a7n9dDVaXOIoVsx8FtCIwSro4FCG+YjK34mGA1VFWWI1nF5FriB8P1w6OtU4RIQe3qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iWQ3skjl; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iWQ3skjl"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso5926505e9.1;
        Thu, 03 Apr 2025 06:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743685500; x=1744290300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9+8olWxBi1dycgdk6iFY3F5FhW2cFaD8o5hGv/hrFiY=;
        b=iWQ3skjlOeCAInjQMo0jXA7pqx2GeWM+FzkB6piaXjaAUI+MMnUVlAMqQIGAtP43Yw
         0or+r0TkMkcc2S4XtYvn73Zh8jYHAz3BmeNToCinzAD2QIFPJPPsEBnUW559QR5jMneW
         /7dQX/euv264qcSlTkeLIgIuhRz2CkSNYjcVYz8Z04DRCV0lp2hM4lFJXa+Ue8TlmNBu
         NfmKIgdwukOFb5Hk/8qQmDgBfbIjn6GnlVhOzMsdsYMKJFJ9SI6GVpROin3iHo31TifD
         N+kf0DCpt7mbI2o2pjmfFYSEFQa4G/0mDm8Ia4zasNAb+FD4NgBs2ZR66uA3rBMq1uv7
         0P6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743685500; x=1744290300;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9+8olWxBi1dycgdk6iFY3F5FhW2cFaD8o5hGv/hrFiY=;
        b=aZ1TjCAEGyobWrIglZt+QMRXaTKEysZdRsaAEI0sgssqSewfhK141u4CjZih876HOx
         /qTQSK9WvaIjspMcCappfOk6smHLiXZ6SBDbYdQI0B3/Thl42EIcOopbzTdYGWshF82p
         qq7BfAl4OjnM8NpmULX/TETsTM4YcqaBYtcxklpSSSyOuBE7YRQ662I5WaoPhYjDvx2J
         Wiggkc2vlZEI1deh5+FM06sgNItbQMhHQU3IbazY3hbhuyE17iu8hq/2NmkSLqsVnW1P
         dShviNVQLAYMyk1K/Rz40KJrlcNftC2Xvfl4bHLKOfUiUO2g3hnPPZ+5C9Z95HVEeugf
         y37A==
X-Forwarded-Encrypted: i=1; AJvYcCVzAiHZxJTn69e5N5pUGKiX/MojNLPzHFJ1v0wSe8L8nfDUa3P4L3Zq14/HpfRKJcpMagGrcWUomlJc/8w=@vger.kernel.org, AJvYcCWaw4BHsMSpQZXGDGGEAW2K3l7n56l9vfMCiS6Oe4LxTmpidi1l9MPdTIKGBhF6pgoImhbASJaCHMFP0GFjJiomkD03FQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0+Sy1PFykEtR4wfink4JqInBYPps/6ZcIAF4MZxZUpLJnRJ0R
	fAH+dXNEIDDJyb+rQZuumfqh5FyLUZRU9SwpptBgoji5DRXeDDNO
X-Gm-Gg: ASbGncsKZ1axZyJ4jZL7uHhtYd67FbDCB4SspAEjro0mAZNnhnDgqITAnC2KhFRmKVY
	vJViQekbaA7a09wLF5sSut/VlvvLr4JT/p2ncWp4XKWBgbmNrIDk4ycIG72DKkDy2/1kNl8VzAZ
	QfRItBU7vZlYs7iyWXx9jWQe1q7BtPD3E0O3rTedadJo45G4RnHCNYha/CZrDqfCTTgseTIkV9/
	EVnnYeF42nrMlNP7FhMCPdyHN8wRd7WUrMPYWP5eqffQ5P7ASMyX1Nd7dQ4bjzn++I4fimI5yUu
	A87DSdQ3uZl60KqUaXPoNbifrzhuQm7Emzrc+gLIlxOHbcACIf3uUWQfur24XJdefvU=
X-Google-Smtp-Source: AGHT+IF36mXfPM6LXf1+QB4CuMc7FZc2Txv9gwkUvWzcwTVAsbLY7z9AlkUqyPOVCZxDFff/gFSJDw==
X-Received: by 2002:a5d:64ed:0:b0:39c:1257:c7a2 with SMTP id ffacd0b85a97d-39c2f96b901mr1945534f8f.58.1743685499593;
        Thu, 03 Apr 2025 06:04:59 -0700 (PDT)
Received: from pop-os.fkkt.uni-lj.si ([2001:1470:ffef:fe01:1a5c:bca6:cf6d:45c2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b76f2sm1767672f8f.53.2025.04.03.06.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 06:04:59 -0700 (PDT)
From: =?UTF-8?q?Ga=C5=A1per=20Nemgar?= <gasper.nemgar@gmail.com>
To: ikepanhc@gmail.com
Cc: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	=?UTF-8?q?Ga=C5=A1per=20Nemgar?= <gasper.nemgar@gmail.com>
Subject: [PATCHv4] platform/x86: ideapad-laptop: added support for some new buttons
Date: Thu,  3 Apr 2025 15:04:48 +0200
Message-Id: <20250403130448.16242-1-gasper.nemgar@gmail.com>
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

