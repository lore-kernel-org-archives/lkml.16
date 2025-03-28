Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6769A13AA53;
	Fri, 28 Mar 2025 11:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743162680; cv=none; b=tpjZrlnhXvFmw+nToWVnRwgSchLKvnbcSGuK6iXXQwSsbY38uM9TNdw61R1spbKRjYbPXdPoDu3oXflPkUyLHbP5+UOeu1VbKh8cjE1SSEh1GdnDAGl5E2jZRq5Y5gK2gFYHUCAUJy8Eciumo3kUEnK/7iLkNbIdIt2KqqKD9Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743162680; c=relaxed/simple;
	bh=Jpb9L7tOB+WcLXwy+TL2Qj9jqcDnE6O6sSnbX1/QNZw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=L4jvauoU3lM3SQaPuNx55yP9duSDLuERiHcX2WutfJsyLxXVsWCekkb9d9aRx/5iAeXVxGBMnJ/hhrZO8SRiYR1MXg3SMqoDLpXG+MgGtI/EN+RBQKVdmatTFqRJmKPVt3xahySFU13NXAHXsGGd4ELceWYuRTTZStX5yOSYoZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fWSqNsIG; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fWSqNsIG"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cf848528aso17636785e9.2;
        Fri, 28 Mar 2025 04:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743162677; x=1743767477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=efsfHNeHy2QYHH3O5LuUBe1aW9V2YVJUeXBo4AvS1/o=;
        b=fWSqNsIGtiK+OB/L04uQ/C4J2jtGpehspzlSfaSETB5xbePVzpNYe4sD43VpZLflc5
         RVAU/7Q4QHsAoLzg7N790+y6Jxd97o26XW8V2QfTzDETotCRD/SWEt+PEyECHLavqXRZ
         4Klxk3o0Ju7TE4cGhjCD6dplYIyMJf2On+f7c1xHZJPFfqiIPIRT9W71z7iOioxDax/9
         pd9X/9TxW15JfCKFbhjoEOvqxkWRvrFLlGTzrThNpy5C6OkMrAlyi7fz0kv6bIZjZRvx
         b1EIwyPZwRKBcMA+Ge8KjX4srtYDHTh/28YT7+SrZj9dgft0JVZiWLQEYnOEyKHZs60J
         wY4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743162677; x=1743767477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=efsfHNeHy2QYHH3O5LuUBe1aW9V2YVJUeXBo4AvS1/o=;
        b=lSQ7raQR+ROVF05aLI3TmgCfuJbjz/dsnziwwnB2TfBfZkijB34siSwWN543qfH+2d
         O8Lu4tdiknJWtgMUjR6Z76Qp3M6BOyxjGmd4Ys4YoIBNSHAbIgj1NT0eCoAXI1pHNDyK
         5SBTgcgeUChBxQgL1pVmbdK3sYavtC9GJS1g0VAW/4SF97qMxh8pAvx3UwgtqzgWcZGd
         4EkxgCsEAxVWO0TNs+mJJqicc8IbuE1Lgp6A9LR5DrujNYud7tBaMiF+K/TgdhO+YZ7l
         6AbHH7w8Md/3a/lRF5euHVMq7a8uoHvfPeBwlYlNqLeBkyss7tDPCGLbbCw/fn1zYRkH
         KaXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDq2j2wFHcV3GT5YXadp4OJo12Q9rJ/xhf/hE87Sti8xp7AUHq4f4cAL/PlSnE+VgVQ6L7EVeBapHOs3U=@vger.kernel.org, AJvYcCUSbxXPMdw3UpNuj/VqvoNVqBuKX20YM+xd+UsrzyzUMYst1hS/PEEvH1N82RthnUzPJN7e00DCqhZP9SL9n0g1hID+7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzP2ayZ33QuRo2DWQzFimNhfXPdVhVd8KLQjmqacT2JjR51AZHF
	yci6e3Ay3vT3yFN9+iLQDzNv/DjG42Is5EI4JOTewGXPFz2caz4F
X-Gm-Gg: ASbGncsleqfr+fIEJeaWBmNd7YLKhO8kleK+fEI3jcur4fa8FT6NzKyAkIeCtT1A59Q
	2dJryLL2UJEG5GBmaqxKJIv8FIcOWqjrrUnzrxs1r79269OPQKdTn0gzO3+jv+WRX2gxlaKokSy
	dus+KueFzNtCCYEjwJHEMH249Q2V0O5lKtAcAyuzAePIcaJU+rHfh1mjAcJFig3lSyuUgolqncq
	yNXLvZxc/WdCjTEIiYQtF/abHflz7xT5NW46A1LKZFvXZLLpfYZ7tn2N8vaXGyNkiItg0A9j7xN
	RAj+rjxznks3KLR0mSucbm4h3Yyjjr1fCH4VT0gHKll+g+ajNQ2y0hMIiHYtvWG53R4=
X-Google-Smtp-Source: AGHT+IGPGtJIB0r5ChZXDEaqFUPgP1kOPnRpZzpoBsSqtuL8H2qxGtHtjLcOIt14R/M/RhXYn88hMg==
X-Received: by 2002:a05:600c:4751:b0:43c:fc04:6d35 with SMTP id 5b1f17b1804b1-43d84f5a96bmr64687605e9.4.1743162676378;
        Fri, 28 Mar 2025 04:51:16 -0700 (PDT)
Received: from pop-os.fri1.uni-lj.si ([2001:1470:fffd:32ff:201c:d449:8385:aa8a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fbc1889sm25000675e9.16.2025.03.28.04.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 04:51:15 -0700 (PDT)
From: =?UTF-8?q?Ga=C5=A1per=20Nemgar?= <gasper.nemgar@gmail.com>
To: ikepanhc@gmail.com
Cc: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	=?UTF-8?q?Ga=C5=A1per=20Nemgar?= <gasper.nemgar@gmail.com>
Subject: [PATCH v3] platform/x86: ideapad-laptop: added support for some new buttons
Date: Fri, 28 Mar 2025 12:51:07 +0100
Message-Id: <20250328115107.110619-1-gasper.nemgar@gmail.com>
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
index 17a09b778..8f8764554 100644
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

