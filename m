Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A457404E;
	Sun, 29 Jun 2025 02:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751164402; cv=none; b=CvWRAdfT5hj+6JeiR3VPvgsMEj9M06GSNg5kLxuyk+z8dqWIgHgJ7+CWxOy9VDP1R5TK/64PA4LElTybO+ivyUFwdcmmiI16FHVsqMkSo7qJF8Wob9J9H9K6tl8VrnoUWZhpY1eCcITh5uxtbQV34Y3cQeXnD9wLlfRpq7yzBzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751164402; c=relaxed/simple;
	bh=+qnxFMit2UysN/GO8pTAWOPkGXfCmQLCYvzY64P/LJk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R3SGylplaI2l51mkcESvHVK+qH8kImBtxaZ/qzhSUQay6Zb9G1gEAX7JN7SgLty4YRXlQbtROShuSHEaXpuS6MRmU6AWd1Py9Xm/k70DODbIZYvPwR8zStTMkmf7ti1J/YqNZs28eSSs4shl5m4Q3UmBhU7Skf3SQE4Msa6oynQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KH+780Mk; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KH+780Mk"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7d3900f90f6so104052485a.1;
        Sat, 28 Jun 2025 19:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751164399; x=1751769199; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A2yrRl6Cx7gw+xBQ3mnPZPT2NGv2W+bvziSVeIuhSDk=;
        b=KH+780MkjcAeCTt3M4lvb10brJGUWWUqsvM79xeK4u5CiNLMNy0ke2tKMqaAOhUChq
         VF+WozZRD3ib931+ieFuo/Ak/6RcDTodWY3Qv0XRNRg+uH7KGzchB8g/0niyF5R4quzU
         JE5XxYUFwM6fDpLTPixcgxZtvNBp23F9rvULQJQdJvnXNMaPtiElxOc17YdevPHJKT82
         PNLoGH6ZRTu9wa6zG6+M8jc5tT7bjGr1CHqKHv1sWmX+Yz8GWOYK5qK9tNFZ8fg7LGMN
         Ou3oi8NdRi7ZzMywa5+nPFSTPSJAAGAbjKa/6jJmaJ9bKKlyLO7KE19WOWcdyCwfUy1q
         KoBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751164399; x=1751769199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A2yrRl6Cx7gw+xBQ3mnPZPT2NGv2W+bvziSVeIuhSDk=;
        b=MW8xWlVQZvUyX6+55Y9eWjUPAm3QrLmxevFHtmL9PRu+z+X1yWqAZXme9TnNKw8tTy
         uMZjmOHcqL3Pmue7rK/x8FvdV58AfjCnKk7A1izZfYiuxApU6FyKPE2drMNlgI1tJUZT
         TUN6f8wOHxAqtklKj8LDeopcSkl5ehNugQAdOLXVhBotMrohvglAeF/gNTX9mfvyFrs7
         b2c/xKyce4xUzZf8slKcyZ+/9Dux+aFiGtQ+QbiR/d50H97IGxQU0+4/YjCa1OLmaOQD
         6tk/ZJz4faIWTi/E/KWfea7yi6JpcirBwHQ6ttwKWO5TCKsc9G87bEifTDtevrhRuJOD
         v07A==
X-Forwarded-Encrypted: i=1; AJvYcCUr4FbrCPldj5cLxUeLq3QkHUJqfBTiz/vqk/Gs6o+WF5CXJkuuNARcjjec5Hed+AjiiRai0x8m9IwE8rQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/ioJBhjrxAtRfbRoTA9MyRUOZ1KuO+kjogoIAGIuziQL8byOp
	IkaPkWI1GyunwvvO3xWwqv/ctQnCyxF/rYCJIsi7qiSdicdlSkNrKZeFiYg47muF
X-Gm-Gg: ASbGncu7HSIb1L7aGrERl39LoqCsI5ykzhDDWioqQtHmKgtjoYjxdgUKlU4l0rhz/fu
	iGGAjUzOopmTALTkxBjQjNaQH5n6FF2z3RO5ee011ykRU4WlbaAau2ni0hpedHwpnMZdustbSP7
	QUEo4/x7dvfAOIMqDGxmGgoC9DPb1eqf3maQFyU9wdcsGE/8Xp3EvuJ3ckZ4wyoSi2819J19n0n
	H6d8fmuaFTFPhJkmJeD70qbyw9aVdybO+SsTIetheu8wmwgFzt87uVHY5xAbTvG754jq3iiSrnO
	/PaIvdakhFxrAzi95qfIscBJ7D2v7SOQO5TjNRd8oGFfOGjjttCvBQK+EVRTCw==
X-Google-Smtp-Source: AGHT+IGbzInNG7RUEPmg4Ego2xXLmZuQ32seAioI3CutA3ElLKI9yH9tCBMk2yShY0GmN/zlcboLJQ==
X-Received: by 2002:a05:620a:31f7:b0:7d3:c5b7:2511 with SMTP id af79cd13be357-7d443994f1fmr1247335785a.36.1751164399213;
        Sat, 28 Jun 2025 19:33:19 -0700 (PDT)
Received: from [192.168.1.26] ([181.88.247.122])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44317e285sm374242985a.45.2025.06.28.19.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 19:33:18 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Sat, 28 Jun 2025 23:32:53 -0300
Subject: [PATCH v2 1/3] platform/x86: think-lmi: Create ksets consecutively
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250628-lmi-fix-v2-1-c530e1c959d7@gmail.com>
References: <20250628-lmi-fix-v2-0-c530e1c959d7@gmail.com>
In-Reply-To: <20250628-lmi-fix-v2-0-c530e1c959d7@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1636; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=+qnxFMit2UysN/GO8pTAWOPkGXfCmQLCYvzY64P/LJk=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDBkJS18rq9gLGiu08e8IrEjfZZlerHJTTLHkhmPPPFkDb
 qc7Unc7SlkYxLgYZMUUWdoTFn17FJX31u9A6H2YOaxMIEMYuDgFYCIbdzP80/n+9dLhY6X7np3s
 lHfdKXIs9MivPnHLdosojhnLbaYoBTAydPFP23spKSa6eq9hy9XI5oT0xMdzo3xXFM9/O+PwPZZ
 KTgA=
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Avoid entering tlmi_release_attr() in error paths if both ksets are not
yet created.

This is accomplished by initializing them side by side.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/lenovo/think-lmi.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/lenovo/think-lmi.c b/drivers/platform/x86/lenovo/think-lmi.c
index 34a47269e3d34d2eda6b71af73892656cd2bf67d..b3e7d76cccf7840a5bcf7f849f2a70e164cb7086 100644
--- a/drivers/platform/x86/lenovo/think-lmi.c
+++ b/drivers/platform/x86/lenovo/think-lmi.c
@@ -1457,6 +1457,14 @@ static int tlmi_sysfs_init(void)
 		goto fail_device_created;
 	}
 
+	tlmi_priv.authentication_kset = kset_create_and_add("authentication", NULL,
+							    &tlmi_priv.class_dev->kobj);
+	if (!tlmi_priv.authentication_kset) {
+		kset_unregister(tlmi_priv.attribute_kset);
+		ret = -ENOMEM;
+		goto fail_device_created;
+	}
+
 	for (i = 0; i < TLMI_SETTINGS_COUNT; i++) {
 		/* Check if index is a valid setting - skip if it isn't */
 		if (!tlmi_priv.setting[i])
@@ -1498,12 +1506,6 @@ static int tlmi_sysfs_init(void)
 	}
 
 	/* Create authentication entries */
-	tlmi_priv.authentication_kset = kset_create_and_add("authentication", NULL,
-								&tlmi_priv.class_dev->kobj);
-	if (!tlmi_priv.authentication_kset) {
-		ret = -ENOMEM;
-		goto fail_create_attr;
-	}
 	tlmi_priv.pwd_admin->kobj.kset = tlmi_priv.authentication_kset;
 	ret = kobject_add(&tlmi_priv.pwd_admin->kobj, NULL, "%s", "Admin");
 	if (ret)

-- 
2.50.0

