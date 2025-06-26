Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344651CAA79;
	Thu, 26 Jun 2025 01:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750900710; cv=none; b=bNOvCt8YFnpSZKWDBtjdopOnD34/fFM7nxB9bvPpBKGhs3QHgQXOk/dhzx23MOpaKRY9fgyuP96/hKU10ujM3/pYshvYP+DcaGRBdKA+mf8iPuavh2XwWleplrM6nTNwdKKpuxW+F//hdOO1d4Nm9Do2fRbnR/RGBgNn5Gc9eaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750900710; c=relaxed/simple;
	bh=+0W0cycMmDqAsq4M7XhomUZQgzncfix1NC75ZRNSBv8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cuj8Y81T/qYAuypFHd9dBoPNllchuz3isbub2GCvfcoBnDFOf0EebYkpSGS+itYF1AMEbWtSOMU9ohNjgXF0rgrk40mroxiiVDCY2t+OVD7C7AeRkIeBSdfZuMsEkEH5rD7SCEzhN/49J474Q6Jsn7J1U6LX6uOw2B9TyUQqBiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=meQXPkyd; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="meQXPkyd"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-234bfe37cccso6646955ad.0;
        Wed, 25 Jun 2025 18:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750900708; x=1751505508; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kX1IqpuQILj2KVu3MokWvztdE3IjUipqVBcxbKIWMu4=;
        b=meQXPkydccxwe4gu0usPbpWaLjUrT/imNOz3NsnPYcQ8lUHkENEHpDX0g88h2SkZaI
         3UF06fNXJhK9MTTFQtJD4S34n0ymbpRlXXLa5+aGlm7/N0ijcU4QWQIQReYlYZxxwDhE
         BmceWFpiwBo57+Q/aELKyuy4rKTIXiW4aaM/bAGup0LQgJ5IhQVJef0K4ymkUfuBirvS
         YTb9gVmVJ/5H78S1RXjrhHG3HIQA1IZD134/ua6lrVOhvGapsfM1ZCZHiWi91l5Fv8B/
         3aoSmyKeM2ce8MjeEY1olkgKprc1t4e0nW5B1bCj/fOingHuuNIQ21JEwbuyrMGLAjbH
         D9cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750900708; x=1751505508;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kX1IqpuQILj2KVu3MokWvztdE3IjUipqVBcxbKIWMu4=;
        b=LRpznXLqiKf8VeZwknxERfT8v66QDKadLxg4MIMIWrkUGew8a5bNlTucXca4U11TVQ
         Cs8lMsD77r2zRrujW2cqmf+0G7YS+dcoHTY4Ni/VDsLZqmpqRaXoW+EpiJ/FvON6IQiy
         L9QtdjxN8suPC+AcMoBXmFhS5h6CcPq2OjGJ8CinR0JPqHiWBs8iXcPW76SBsxAz593c
         u2JTKTbjM5HyGhCgwrWpWD82tYmgoft0qo7N2L90KWJ3CSU4L1IhB6FHILQrleMhIgT5
         HLOojPkyi0bg8qIqaXpTwkcMq/l5Hi8YwbPAGZyDUVrvDN3WN9A9Q0OyLjYvsgbHXszd
         LWFw==
X-Forwarded-Encrypted: i=1; AJvYcCUbLWn4tqX/tnfKTKySHIc14DmsNlg5FcqPPfr/1hxvYmWxnSETup6XAkntnRQEHftt7hK29lLUlQMMglw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvK2xnHLkwOD/gPp6w4HJupLz8uxh2gOWcELgF2TduxxJr1WBO
	3u6uQVSLkvEpjKWEgtpTFDmZz4CVoB46I27FwKZeKBEoa87A+ZPFQdmg
X-Gm-Gg: ASbGncs1hB75eEBk9bi7fYeqjspy/zvb06ckhMo09mbTwQ6kD99gSVYr0tqy2L1wqqA
	kVipQdnarHQnbsw8pceotnlTw5DtzGiy8gsp04s1xrDEXWc/v0XqdJrxCYu7kpqxANV0MEtJcrp
	n/lhZsMLlc+chbNRzMQlTWJTgma+HwXu14YCQJl/aikcvgug4yPgNlFLwYUhrNG/md5d/yfL2wu
	zi7c+bau5r61mHCwPr+s/AvWZRy8AapZKlxFmUv6ykm/8AEKGEbD7hWIRgPfuKM1Eet5LjARjQY
	I+2ey2nNw3y2H73mjZyTc3xMrOzRvytOKLhLyGvknQfuQED38mhbIuPujr4lQQ==
X-Google-Smtp-Source: AGHT+IGi1/B0kQo9zgzcnMps8F+X57XZP9yJayERCHDyZIv7bmiGpRfpTxhYC2d1Lb1SiBXfc3R/PA==
X-Received: by 2002:a17:903:1b64:b0:234:8ec1:4af1 with SMTP id d9443c01a7336-23823fb89d7mr77903335ad.0.1750900708472;
        Wed, 25 Jun 2025 18:18:28 -0700 (PDT)
Received: from [192.168.1.26] ([181.88.247.122])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d871f10fsm142710025ad.233.2025.06.25.18.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 18:18:28 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Wed, 25 Jun 2025 22:17:37 -0300
Subject: [PATCH 3/3] platform/x86: dell-wmi-sysman: Fix class device
 unregistration
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-dest-fix-v1-3-3a0f342312bb@gmail.com>
References: <20250625-dest-fix-v1-0-3a0f342312bb@gmail.com>
In-Reply-To: <20250625-dest-fix-v1-0-3a0f342312bb@gmail.com>
To: Jorge Lopez <jorge.lopez2@hp.com>, Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, 
 Prasanth Ksr <prasanth.ksr@dell.com>, 
 Mario Limonciello <mario.limonciello@amd.com>, 
 Divya Bharathi <divya.bharathi@dell.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dell.Client.Kernel@dell.com, Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1434; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=+0W0cycMmDqAsq4M7XhomUZQgzncfix1NC75ZRNSBv8=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDBkx86/xlidqNmx5Ysgy63B34Qnznc9juIMeh9nOyFI7O
 efgHe2+jlIWBjEuBlkxRZb2hEXfHkXlvfU7EHofZg4rE8gQBi5OAZjIJRaGvzIPvTy6D7RJeLoX
 sEcEiK5YezPp59WKsDVVtrF1sh+Wn2X4H3JDKkXrX9pE99p1uX93NsZfEd/0ct+ivIr9modmbmy
 04QQA
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Devices under the firmware_attributes_class do not have unique a dev_t.
Therefore, device_unregister() should be used instead of
device_destroy(), since the latter may match any device with a given
dev_t.

Fixes: e8a60aa7404b ("platform/x86: Introduce support for Systems Management Driver over WMI for Dell Systems")
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/dell-wmi-sysman/sysman.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
index d00389b860e4ea0655c740c78bc3751f323b6370..e345c62fbb35529fb4903f8c11f0fd07d941f94d 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
@@ -597,7 +597,7 @@ static int __init sysman_init(void)
 	release_attributes_data();
 
 err_destroy_classdev:
-	device_destroy(&firmware_attributes_class, MKDEV(0, 0));
+	device_unregister(wmi_priv.class_dev);
 
 err_exit_bios_attr_pass_interface:
 	exit_bios_attr_pass_interface();
@@ -611,7 +611,7 @@ static int __init sysman_init(void)
 static void __exit sysman_exit(void)
 {
 	release_attributes_data();
-	device_destroy(&firmware_attributes_class, MKDEV(0, 0));
+	device_unregister(wmi_priv.class_dev);
 	exit_bios_attr_set_interface();
 	exit_bios_attr_pass_interface();
 }

-- 
2.50.0

