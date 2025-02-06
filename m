Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805D21AAA1E
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 18:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738866226; cv=none; b=pn+0dhjSFepglbJQJzQDxbyjnhUt/X4yUD7U1ylo0tIhoQVgfBtGB3+T1zCZopotULFXyJQ9keICuPscVhpJj7/WUW+7C6HG4Jq7xesswxFmzJEUSNAnw3WRqXPENfkAVGNnCr8wEqAW89iCwFOOYX3UBMVGtmsPm6AasN7tpTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738866226; c=relaxed/simple;
	bh=6++6sKWjTc5PHmcMhQi9/YNbgXyYiVj416YfEREQY0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WRrO/J3chIJlaA0EJ/S6Cqs+SxW9QZ8DHdHJvvaka6d6uBHFMdKRYgQBIdrFY6L8mvFid3geBCay3Wf/o96R1xwpUPfge6TNCaHMxpE7nTOWJ31e+OncFzAUkOcaNzMPzziuH/1XknnOBIpD6KryP2CgDFODfqJCNfUc0c3aMmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=utoW99S4; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="utoW99S4"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4361f65ca01so12346785e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 10:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738866221; x=1739471021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pDDlbsWe1+x0J64iOKUY2kNKofB4ONjhy2xkpxjKx44=;
        b=utoW99S4/u9hbCosPuoUBpeLF4Qa3y4OzA4Z8SudVBx/XqGj5GqDIvoBYt92aRqGZy
         HuDdUUOioFt8Q7Sd41QwoFRlkpCQzbExp7YUNPibIPPN2m1D2Jlo9CzvE1spDHc/YvVG
         IUfL8cZXeez1kZgmQR1DfZbl8m0OS+ZEmBPN5HD8n1b0OvcMxDoy1wwzsPMUIL/ItpM3
         Qq40RuiFvTQjq9PXGwJWUgdxFQotTMVEJC7IK88Ea/3vEYTamI06WqVXFhrtHHRUee8c
         aUjQaaA8h8OxKcpNkenWyVhPyPExDxuzVeKI/x8WUwXqSN4xqWx43g3gdGga422GrDZM
         LAEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738866221; x=1739471021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pDDlbsWe1+x0J64iOKUY2kNKofB4ONjhy2xkpxjKx44=;
        b=m39VTpWO0b4QtzXEs+Twr5x5sAXMRDIwZpAq+wY90DHb03HKKvJ/5LQYE4LhWge/nP
         kzSxFUcJtoezDGb4HNzCPcnJsAwgqkJIU5r9VeoBiLvB6BVme/jX1x7cygEYSuTKvN23
         bYsyVoYN4rTdGsxLfAYyiSOR7+7LzK9fgBObcoQJNf6x7EmaX7pF9hM/TZqCnjOB1NN4
         BL22DQNf5gY0x4AWBOxzdeBYj8om4aM/WdpPjiAcjWYgINKdDZuiWAHF/tGZNcmwg4uV
         MICedm8IBa7omGKYVWKxmN6D+cHqvtNDsRYfgDlXAXm16Pe5khRzxRQAoEYlBJQiLIsj
         DXYw==
X-Forwarded-Encrypted: i=1; AJvYcCUArE9k6E3mfav3JEhFt3lLW1BGOBvjbwgUIoQfQ43bNfOtgeJoH328fE5ajYjRNnXufDm5eDMf49TubfA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6av9hmajFBuj4NEx4kTLHgxxxXNT9m9yc7GV8uCw/sgq58DXQ
	cklDnztV3B+2+DikcLYT9805YpRK2VidIEvKrdvRKxhBo9KdThoP5sFeTxQsx87Qb/NIRDl55yz
	vgPA=
X-Gm-Gg: ASbGncvlW06I0b3PcbD2IwyfxSIaKxBhYlThl1EUZGZtjzZ0H6fhnkGBTwkrJeOa1Ws
	8XO4lE19QFV48VUe9h8FSP/A+FK9YWyEkB8m2yOTBuxux73ETzsGZQeHKTPgDz7/XZEhkNbofPJ
	C6QI0DYyOPhj6TMo0wolt/GjKsEZQRczQ6rOTTHXG408mbRvgxTCOIpu0EIQ/3Zl2DPT8t9r3mh
	pvLGtaB1lEfnf6cV5Ml93toX9KlD/8swfC+LfIpCQrwTWgmkcGnsG4Kl9vX3Vl6tyOUbd2Az+Se
	wSmfd/V/5RdUgnM89A==
X-Google-Smtp-Source: AGHT+IGDzhbQXgNu/QrBSTCFEQkahNbDI41i1sobGeOtV/ESskeVnnIwh4MbMbL35jXT0b0VpBo0Fw==
X-Received: by 2002:a05:600c:1e25:b0:436:17e4:ad4c with SMTP id 5b1f17b1804b1-43924972ce9mr3831115e9.6.1738866220710;
        Thu, 06 Feb 2025 10:23:40 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:a0d6:294f:5246:28d4])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4390d94d802sm66111445e9.12.2025.02.06.10.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 10:23:40 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/7] platform: arm64: lenovo-yoga-c630: use the auxiliary device creation helper
Date: Thu,  6 Feb 2025 19:23:14 +0100
Message-ID: <20250206-aux-device-create-helper-v2-4-fa6a0f326527@baylibre.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250206-aux-device-create-helper-v2-0-fa6a0f326527@baylibre.com>
References: <20250206-aux-device-create-helper-v2-0-fa6a0f326527@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2030; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=6++6sKWjTc5PHmcMhQi9/YNbgXyYiVj416YfEREQY0U=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnpPrMR8BF61h15hNkSJqnjGxnf46fJl+cqgVFa
 Y/PS8PgpWuJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ6T6zAAKCRDm/A8cN/La
 hSYbD/9YSQ8jWvPP/hOJcq+VvB3eSSnd9tlrEL1EwfMpM/Y9M31UY7+1eClI6Rz3XnbFEXX3+Is
 VWY7tgyLvoAxVqTIpQZsH7mqwDc9od8FRh2RnyNlwLV2PN0JUw/7znaYAhccSfCWKUc67jAsmZl
 IIjRLjqVHkeP0nqG+wPQlMEE/HwJOkIbXw7rfcFZoa21ymo17LYVNEOAyywZfmJD6cPzIS8gIw4
 yfKZzKMdPUuVoT0Bzxv2Gmrpqx+WaFDEgKTstZJPClR56LuGL/zmMoo92piMlqTtnK86I5eohc6
 3Y/vZld7hi+NSZKXB43lrFIyETQFhpyiIZSFevQPsgXxZOP1tVfNDsiHZqpqXQ3CeYAoAtpLL87
 4hhUYoLbsYbp8Mzp754hHVwYrNX/pisCyCusLhlftg63C0/0Xe+DH6JsdjVzW46FtVTEV3FwnaV
 b2Yj2pywOdPYhT0ZbTIHVhfdJzf4tn/HDSvodDjJKQ50GfjAXGK751wITmPkCEc5mEpYR+bLRkK
 XwcLcRqzZOHaml3GvU20g5rlhvBFuoDnjNJEaEV2/p4outMNfuFjza0wZPZjmO9ZsAxJ2qdAJsH
 q1qZU7oYq6sbZOhHwZbRjwz+ZzjDNFkRx0N+ADrV8qAs9qlSAPr1X8B/skyLV2wx8zFdPgI3KOw eHXykk1tATbcivQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp; fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
Content-Transfer-Encoding: 8bit

The auxiliary device creation of this driver is simple enough to
use the available auxiliary device creation helper.

Use it and remove some boilerplate code.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/platform/arm64/lenovo-yoga-c630.c | 43 ++++---------------------------
 1 file changed, 5 insertions(+), 38 deletions(-)

diff --git a/drivers/platform/arm64/lenovo-yoga-c630.c b/drivers/platform/arm64/lenovo-yoga-c630.c
index 1f05c9a6a89d5ee146144062f5d2e36795c56639..b17b728f6a30eff301ce3f903f7a6e4bea2bbfcc 100644
--- a/drivers/platform/arm64/lenovo-yoga-c630.c
+++ b/drivers/platform/arm64/lenovo-yoga-c630.c
@@ -191,50 +191,17 @@ void yoga_c630_ec_unregister_notify(struct yoga_c630_ec *ec, struct notifier_blo
 }
 EXPORT_SYMBOL_GPL(yoga_c630_ec_unregister_notify);
 
-static void yoga_c630_aux_release(struct device *dev)
-{
-	struct auxiliary_device *adev = to_auxiliary_dev(dev);
-
-	kfree(adev);
-}
-
-static void yoga_c630_aux_remove(void *data)
-{
-	struct auxiliary_device *adev = data;
-
-	auxiliary_device_delete(adev);
-	auxiliary_device_uninit(adev);
-}
-
 static int yoga_c630_aux_init(struct device *parent, const char *name,
 			      struct yoga_c630_ec *ec)
 {
 	struct auxiliary_device *adev;
-	int ret;
-
-	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
-	if (!adev)
-		return -ENOMEM;
-
-	adev->name = name;
-	adev->id = 0;
-	adev->dev.parent = parent;
-	adev->dev.release = yoga_c630_aux_release;
-	adev->dev.platform_data = ec;
 
-	ret = auxiliary_device_init(adev);
-	if (ret) {
-		kfree(adev);
-		return ret;
-	}
-
-	ret = auxiliary_device_add(adev);
-	if (ret) {
-		auxiliary_device_uninit(adev);
-		return ret;
-	}
+	adev = devm_auxiliary_device_create(parent, KBUILD_MODNAME,
+					    name, ec, 0);
+	if (IS_ERR(adev))
+		return PTR_ERR(adev);
 
-	return devm_add_action_or_reset(parent, yoga_c630_aux_remove, adev);
+	return 0;
 }
 
 static int yoga_c630_ec_probe(struct i2c_client *client)

-- 
2.45.2

