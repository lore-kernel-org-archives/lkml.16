Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EB123C380;
	Thu, 17 Apr 2025 11:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744889077; cv=none; b=GNFgeVVyANEHAVM/nAI2GU9rXiBX7HPor4GEp8wGoluTHT8YLdKZBTOmfHTpkXtmdfzdu9zxOSz3Ws3beh/zGhGIwy01BNy/onWdNIlSi0GAV9l50czwqtOKFJzGroc7ZUzYpJgTQT8UKUmuXTXqPxbEZQB3lQQbCButer1i1vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744889077; c=relaxed/simple;
	bh=2eatCI34+Bh2OL3jA8Y2aSfHzb4X0XzH0euHT+4kglA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=NEgV+t3gCDmQ5RKvxbH7MyYdSWWo3wEVtq4HXs0IlzR4SpySYnczOvoysYiVJn5uY+EfAQ8aAuIcCPaDz9AvRvuw2THqgQhcYMO89eTbvLGoAun1JxsXSNRdap7NP1GRg6cqSlB+5S8e/w7jgMD7XP0ttGPZ0wmXrEnFw0ygbcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lhldbMWf; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lhldbMWf"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39c0e0bc733so630864f8f.1;
        Thu, 17 Apr 2025 04:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744889074; x=1745493874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EYISWl3AuONZBs2ysAqOy12TWeMe6X38GVCsazvMgkc=;
        b=lhldbMWfeTbOhFLcQu+jC4C3fK5zz3cwK3UW/My2v5+e5D0tSRlvwvfiI+KO+E725P
         snWk7VCGdtpTHMeGN75cD/SKVP28fbI7sWvabq/eZILFkheYcRTfQCGFoDTpMd8jhqy1
         HVWw3xjYe+P24bj5EwsFvjWCivg4Ma/g12uyL2FF2z5+7hOKYVSrwmgu4wDIS3N89uWj
         vuIwsSft4ldRG1MaumWWlKSVPGZlD2xbCZiKUckYEvRjD+c38k+kPo1Fgv2QSWiZKONy
         KyjB+gAP5xYeDNSVjKUz2CN0nALpqCG0TQf0/FOVy34PzK5OodyEoEtIIBsHtlxdi1NI
         kp2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744889074; x=1745493874;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EYISWl3AuONZBs2ysAqOy12TWeMe6X38GVCsazvMgkc=;
        b=irsXdj0ELfZjCvKUd7CBYxpG4+lSCl/O3Drq8aT68BTS7DgbkYWTpCwnFJL0cTUUgD
         wYu4S9YNhc05lEg3SH/OdtvwaEioM6hejgpYsBezP/vMbFGKzkf/E+fRWrW4lPYaXvX/
         o7VCkpZaoglvnzy7rx494doiEyHXsTFVWJI3CcU91TTzmCNzBRCI2PRhYAlsnRSVQAPs
         +3cql/F/spgmgaxFe2sXmifSLTXC+Qff0J6losnt4paF5uNy6995I+lSKQip66BL9FQ+
         URvsKj/zrOK8MlVqguxs2E+vU+5A4orr+HZOmBgAI7B+e6Wud3/RtRoxRSLk5x9cDSUw
         3z+w==
X-Forwarded-Encrypted: i=1; AJvYcCUMwPNK3EZKanGqFqPG8G4Oy5aKpokGUsHhuSZfB4Rib695hH+VYUMb9qqBZzPyjG4kqsa0fAjRTd980jqbRq6fMgm1xQ==@vger.kernel.org, AJvYcCVNhOjDJX4d1Dvck7qgLOKR2viLidh4fN+1Fqhz17svTRNs15cLxUFLm35pckrjdgIBWik2vSoFw1HakMU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8fNIOXwuekkrTFVlnxQTgREJj+4Vb60xBbyipxnmwx0m1XOtu
	hbBDK6AO9L+wurM98FfXa/WXpN7bzEbWgo0HDJs9k2eyiAWAMI5R
X-Gm-Gg: ASbGncsjrgtlhoVzySjidklXQryOiP5ApJZjyRO/v4hKKKplOvvQfTqXV/x9LSXIiDT
	qSmRLIuuwWqL93lWYe97tKvWwyOcmkPdjAHUS2iybuGAehaunGRiOAwccFD/f25jEpyrSaEowwu
	GKU0M6e9TDtPnS3McmDlk901/WDy9mxF/MrtoVBzLl4fB3TqgKkKWbcUfldIg7vL2KlWJa/W80M
	uEou4yZNmCwi02qDcjoGCWArPysjpHecKIQLQzWyjnYmLAzaBgqI3xB6/FHjwVaaRY5nSb/fh3v
	y0qo3cJgEGDNTn7DYA90aiuRd2Di04ou9Bax9gqUbBaYEJbJIb56R7/1YBQ0CqrgePz2dJIl
X-Google-Smtp-Source: AGHT+IHbSZoSCUjCAcwnjMbOiDnIBzIwLZad8+nwdpJJllHNypcUOR2FPW7kyUHVqk8stRyKZa+Dkg==
X-Received: by 2002:a05:6000:2489:b0:391:2c0c:1247 with SMTP id ffacd0b85a97d-39ee5b1345emr5438822f8f.1.1744889073495;
        Thu, 17 Apr 2025 04:24:33 -0700 (PDT)
Received: from pop-os.fkkt.uni-lj.si ([2001:1470:ffef:fe01:b721:35c:4932:2a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b3452fbsm50921405e9.0.2025.04.17.04.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 04:24:33 -0700 (PDT)
From: =?UTF-8?q?Ga=C5=A1per=20Nemgar?= <gasper.nemgar@gmail.com>
To: ikepanhc@gmail.com
Cc: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	=?UTF-8?q?Ga=C5=A1per=20Nemgar?= <gasper.nemgar@gmail.com>
Subject: [PATCHv5] platform/x86: ideapad-laptop: added support for some new buttons
Date: Thu, 17 Apr 2025 13:24:25 +0200
Message-Id: <20250417112425.107749-1-gasper.nemgar@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

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
index 17a09b778..320ce9d2d 100644
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

