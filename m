Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09573155389
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 09:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744190007; cv=none; b=Ot9tI01cqR5+ktIa6d+e9L5A2hcrYaFj8XhkVvZLnFFVfX6SFzXuiP4hzM3aBoxTDQLlTIF4jWCMcNxNuNyWQ90XmgIY+yU6AMk9qmzJ9OhdaOq8Amko3nno70M0ywobJisZ1/Bwr8fH5aCus21QPF50XfsA7YeqSG7ju9DZtc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744190007; c=relaxed/simple;
	bh=w8jM+kjNpQwYUHFIVj+21LsNdXWV4iKMqaSnGVehs7c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dhDuAsiX2vsYyn+Nx7fF7NYTe1QFdNyePAE62LIXBg7CPqJSYGoS4zBE02E6Vz89ls0sE2uJ7vzjjXBns5E/vGEzKs1S6Ujy+Pkujrv2c44qyGj1Hl9TASlWQZ/G5McF8s9MHB0QqExHRBZZIfxPp2FSoKB5R6/s5ByF9eQPLMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IP7Wimv0; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IP7Wimv0"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-306bf444ba2so3025527a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 02:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744190004; x=1744794804; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BaNms8AAHYU6+Lu110JwWuCHuNcKevGY2uAR6UWGQNE=;
        b=IP7Wimv0+4lMP02bu2jDuBGVXZS7Y0PuCUYtYQeKWoEvcrAeFQRpmnubsCOhcIHL4u
         R9G9YZq5lwvDEMELvAWCQkokl2aS2fKt2BUaQnPXBlaM+GJ2YnbiJw85X9FhLXuWyiMT
         f85gli5YSFazGR4wFm6WTc9hhjR41Pvg6Cey0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744190004; x=1744794804;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BaNms8AAHYU6+Lu110JwWuCHuNcKevGY2uAR6UWGQNE=;
        b=kjn7N391am40M3jQUzfgFs9YiE9HbQ1Me53UoUpfUs9kwYyawiLBK+bov6o4mIC6DG
         AivbhOK00noCXyNWTtaTw6eHdngy68ibbD+ZRsMkCBgJcQ9UY5gqUBopuLHe7e0OFjsJ
         nTfUqHZReZOph7m38Z3Dkq9l1lkmAH5/hvSoiI4kWcUE0LE2SKLqKCuJAazlBQ9xZT52
         OgL3qfqn4MuGQzogxux/OYHui9otqfgehVLJm7N2v4F/iNo3Lt7pWty6N3iNULMDZ8Q8
         493KclHOldG03tnTienkZgb3l7E84Lz2SGClIHuHCLCjCVabxQc25sXJYSdkFrgsK7el
         x5Ag==
X-Forwarded-Encrypted: i=1; AJvYcCWPDrqohFwV1C3f8JxOP/tgPk/pa+x2fGMAO+UBP7yPidxIu4Cn51eacaMxejHwyQOlYRsYJYZxrR02kKg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQz1yDFGvbe4QIC/+VvyULDVXb1MuIo3orW2tXOgOgQqmBPyQj
	qC3tFkVL/1YdpcTYDPRW56/Heby6O0VR1JAeTuANMPOdGiOxM5AGIPQ7tgoZGQ==
X-Gm-Gg: ASbGncvoTgyGsEZXkrxJTkiiLi199pxs/W/oIiOc5rY/ZIUmdWbKtnVGq3GRpc6Csje
	8yBOEAtHW38qx6rSA1aWzZSY+Hd6yyNUfvnbpBbpe5v/IlCcBOpD+C8+rd7zkQJfiQ8BEE/U++Q
	hNRy+18Rz4lBITAGEK8XFG7FQwAfoAY8pIf+IKd0E3xDiMX/Wx8yPGqtLtTujWNh4/0hZDRV4xZ
	rYdvm9VRlg+9AAo5cXFwSak1wxbTxAv3kYWda+aqVv90RYCWCgNGa/jh1ksBGnFJtYpApGEDCME
	/NNfyk/GJVZUHvLYFDnRDk4+shElTlJU8/zW3xveYcSIwnkP2d9PnXOBm07HiclRrJlM4dROZFE
	/xYOEOz9C32UYU8S9E4dt0IU+rqKT
X-Google-Smtp-Source: AGHT+IG2BgqZHSIHI8aYAkVrTJn/SDbhHGgzVIz93kwK2lBJoxcfDzl64PMZYZKZH2NJ1T9ptVPhUw==
X-Received: by 2002:a17:90a:d644:b0:306:b78a:e22d with SMTP id 98e67ed59e1d1-306dbbc2ce6mr2970209a91.20.1744190004299;
        Wed, 09 Apr 2025 02:13:24 -0700 (PDT)
Received: from yuanhsinte.c.googlers.com (95.147.221.35.bc.googleusercontent.com. [35.221.147.95])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd10dc40sm1182551a91.9.2025.04.09.02.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 02:13:23 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Wed, 09 Apr 2025 09:13:11 +0000
Subject: [PATCH] thermal: sysfs: Return ENODATA instead of EAGAIN for reads
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-temp-v1-1-9a391d8c60fd@chromium.org>
X-B4-Tracking: v=1; b=H4sIACc69mcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEwNL3ZLU3AJds9SkFEPjxBSDlKQUJaDSgqLUtMwKsDHRsbW1AHYO/vd
 WAAAA
X-Change-ID: 20250409-temp-6ebd13ad0dbd
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.15-dev-7be4f

When userspace nonblocking reads temperature via sysfs, EAGAIN error
returned by thermal driver will confuse user from the usual meaning of
EAGAIN, the read would block. Change to throw ENODATA instead of EAGAIN
to userspace. Also, ENODATA more accurately reflects that data is not
currently available.

Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
 drivers/thermal/thermal_sysfs.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/thermal_sysfs.c b/drivers/thermal/thermal_sysfs.c
index 24b9055a0b6c515b865e0d7e2db1d0de176ff767..3d1713e053dfb867933d95131f1f2491d2ecd07e 100644
--- a/drivers/thermal/thermal_sysfs.c
+++ b/drivers/thermal/thermal_sysfs.c
@@ -40,8 +40,11 @@ temp_show(struct device *dev, struct device_attribute *attr, char *buf)
 
 	ret = thermal_zone_get_temp(tz, &temperature);
 
-	if (ret)
+	if (ret) {
+		if (ret == -EAGAIN)
+			return -ENODATA;
 		return ret;
+	}
 
 	return sprintf(buf, "%d\n", temperature);
 }

---
base-commit: a24588245776dafc227243a01bfbeb8a59bafba9
change-id: 20250409-temp-6ebd13ad0dbd

Best regards,
-- 
Hsin-Te Yuan <yuanhsinte@chromium.org>

