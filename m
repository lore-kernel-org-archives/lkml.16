Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BCB25E47E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 05:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749531909; cv=none; b=BaYIPRHr02l8rAsLGJSt2BPZCqeFjU1r5F1MZ5M5+FCHEuDMeN0aVSzRmekGRwXSjAe8xfAIDqxZ7MXudVqd9PcNJjgo6MNkVacvI2FEeTVD59GFwPsqIBrL4uTs6vA5hKFsHtclLmkl4jQq+brPItg719f2jmlrh9t+7qnKnN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749531909; c=relaxed/simple;
	bh=uyNqLoXucwkytiJ5G6V3n8mW9G9aw8BXAUcbIVRwFtg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=P6yuFniRQp6hGUKP+n0tTRnJdhyjJsGRlvUhoIojAsvEa98oY8fMPriika2IQcXY3/7WnY58aycxuc6f8Fw0PiHzfthT4Laeah3/p7aJ0RKNvRLEfDjq7zldee93VtQVxzRa5rH7kt5Z+Nd3C+6HS5DTwk4aHtYRjCSrzi4EeGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Z+ahqp5l; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Z+ahqp5l"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7406c6dd2b1so5232209b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 22:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749531907; x=1750136707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=imqHtGt/tO66pE6iWFuD1X2tjs5P6qkLBbewDhpPIyg=;
        b=Z+ahqp5lavby1uSVCG0DkZM1maM1W52PR/dBihhNY6ZSV/wbtYjAoBB+DyDlDtUej3
         tRFaesV5M/oLX98QqhMO393OSRgOjEKU2mugVNhotfPDTCUec+fCT+/1SZmcIw1SRZCS
         tYKls11klt774rEwHnwOiNhfi4WFwZevDbOYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749531907; x=1750136707;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=imqHtGt/tO66pE6iWFuD1X2tjs5P6qkLBbewDhpPIyg=;
        b=b4M7U2rqTOt6RI+aB5V9oDo+xT1CExhDmPQfbySLtiW2KCfdSRJHnf4ayhmNvEX9eN
         cxxU+SyzaSx2lc3/0gnw5vPauBCkkzjGGra4rcy1L7B85ntoDMrTFEazP0/QN/YmI2FM
         y7bHp5PnksvVrrk3yhIDYwsAZDqy3DHrsHr8lcaGhPzhBvufaaK2ljpBkY3PtCcGYKWb
         ZttOlI48JHkoDC6pkbo+YohgvT/xf840i5STyoa0oxJ2/Ty7CvhPXx2TC0LIxbjG8oDm
         0t7124G1+sQY09c2WOWyT5UcBXTGV52XzjHqe0IurKeciycVbvUMbQNnGlx00+YSXqqo
         4qOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrWXgusekeiUSmxdbcziKFfDlJiI2ksl3Wj/2WImnooEi9dXnSNa/ginG3Py/A9GsxWAR2rOMOUipE2ZQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyYK4cGQOsJo2KHevEPzq61bOLi9TDBM89djH8ZYmlyvBJLt//
	Jo2YvkwJEYFqdg3TeHyOKEt7Wfp4uW69B51LRspJbvGlLKJ08E6NnzL4PYmWXbP7JAROnNOlgfa
	h+jPTxA==
X-Gm-Gg: ASbGncseYQdEKhhUEi6VbuguEnzruISJUtVPM0S5Q9V2D13e+M3bsdK8jPcaUpSBqDD
	dvPnudvnZ10T23ek2aCk4am01ZHlvvOFs/tyrd9h056XbRyw9MSmp6XuajvwwdvFeXvVYesTUb4
	ri0JXj23yz9H4EbhBb3y4OHdcy3AmFBXADmmza4ffJr+W/rx5zKL39HqRw2Dvd8o50OT6wOrV2K
	cMJ9tQ3EBx5jCzZ8HaEuZYfLI7+Y+zZdvgqnTqvvzmdRNWIc1ZFfi+Vm4UOxZba8ne3RZrgNVUL
	Vd3da+QcTLEhZMQ9Wb++jnHgfTfGHQEH63cBGGtw2TeBKv4qqZEQLXKOtOO2WjN0JR42daJRuyR
	5BPvWGL7AR+qoj4ZEDyQ=
X-Google-Smtp-Source: AGHT+IEyvsBr6E/EX/tDQzT9qF/aIlLCH2bHJIt9wooBRZ+wpVSA3bPnKk7bwrMsUrtCyl1lykQxqw==
X-Received: by 2002:a05:6a20:4303:b0:218:11d6:b66 with SMTP id adf61e73a8af0-21f768bb26cmr3591721637.5.1749531907301;
        Mon, 09 Jun 2025 22:05:07 -0700 (PDT)
Received: from naoyatezuka1.tok.corp.google.com ([2401:fa00:8f:203:4173:c66c:ee04:82a8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5ee6f6desm5222359a12.26.2025.06.09.22.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 22:05:06 -0700 (PDT)
From: Naoya Tezuka <naoyatezuka@chromium.org>
To: Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G . Piccoli" <gpiccoli@igalia.com>
Cc: chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Naoya Tezuka <naoyatezuka@chromium.org>
Subject: [PATCH v2] platform/chrome: chromeos_pstore: Add ecc_size module parameter
Date: Tue, 10 Jun 2025 14:04:58 +0900
Message-ID: <20250610050458.4014083-1-naoyatezuka@chromium.org>
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On ChromiumOS devices, the ecc_size is set to 0 (check dmesg | grep ecc 
to see `ecc: 0`): this disables ECC for ramoops region, even when 
ramoops.ecc=1 is given to kernel command line parameter.

This patch introduces ecc_size module parameter to provide an method to 
turn on ECC for ramoops and set different values of ecc_size per devices.

Signed-off-by: Naoya Tezuka <naoyatezuka@chromium.org>
---
v2:
- Remove an unnecessary blank line

v1: https://lore.kernel.org/lkml/20250610025152.3844404-1-naoyatezuka@chromium.org/ 
---
 drivers/platform/chrome/chromeos_pstore.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/chrome/chromeos_pstore.c b/drivers/platform/chrome/chromeos_pstore.c
index f37c0ef4af1f..28e26aa99cdf 100644
--- a/drivers/platform/chrome/chromeos_pstore.c
+++ b/drivers/platform/chrome/chromeos_pstore.c
@@ -9,6 +9,10 @@
 #include <linux/platform_device.h>
 #include <linux/pstore_ram.h>
 
+static int ecc_size;
+module_param(ecc_size, int, 0444);
+MODULE_PARM_DESC(ecc_size, "ECC parity data size in bytes. A positive value enables ECC for the ramoops region.");
+
 static const struct dmi_system_id chromeos_pstore_dmi_table[] __initconst = {
 	{
 		/*
@@ -117,6 +121,9 @@ static int __init chromeos_pstore_init(void)
 {
 	bool acpi_dev_found;
 
+	if (ecc_size > 0)
+		chromeos_ramoops_data.ecc_info.ecc_size = ecc_size;
+
 	/* First check ACPI for non-hardcoded values from firmware. */
 	acpi_dev_found = chromeos_check_acpi();
 
-- 
2.50.0.rc0.604.gd4ff7b7c86-goog

