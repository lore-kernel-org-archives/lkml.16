Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F2425E80B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 02:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749523935; cv=none; b=dET0eWNaxmjNQ3UGw/7MJck6h29BcFeBCrEL/FNJsfarNXDZSzNDFRkblft/j6z/7D4f338YblBVgXLy7I7onVdEZxB7p4nyK40EOiZqKRDRJPUweeEYszzeawxyve4IG3qnnZP4G0O3chqTKeItrc2ZQ+cCTkfJ3ArKq32XwCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749523935; c=relaxed/simple;
	bh=BJSAuM/KEuH1gidHkhv+0rdYBs0sl4fswnQ67X/V5y8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Amotz9nkfdDtdsW1tfJk1EeRHVPmiQySMiv4/xoxVNT/zBd4KZPY/wGlnRpbU+P2gHfEs5NAuYOFWLOfgyFD4opmYd4X/JudIPN5QhHuRf74y2uouWrxNDg6w+zlw9k7/Xn9fXcBQ4AdPa889qgrx6+n96UX0oqPmqG1FDhE6QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QLWe4uge; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QLWe4uge"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2363497cc4dso6321485ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 19:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749523933; x=1750128733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rm7rFkHvnvV5pN555kvAO+KRnM6aiD+6xk7uYMzjvLU=;
        b=QLWe4ugeX2+zvNXVl0saAH25f8B6ENIKkDorKxTErK5J3QH0T131mP8i4QyF7wp4gE
         5aDl+5U1fMvIo5OVSXit76CWa5dZwuSlNVgOQ4xsFUn5jBhgdDrOoypZjkSVz2NRIAi5
         +Rg2woHIuDv+0U01CNu424kG2Wq9/mjnPFIa0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749523933; x=1750128733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rm7rFkHvnvV5pN555kvAO+KRnM6aiD+6xk7uYMzjvLU=;
        b=QpJ51MRPmIYgPxESLgCnUxSrTP2jvKq90lk4zyOEyB+62yvk3EEdhd6Up5lNYCQbAV
         5L9U59JDet5lPEjiU3AOIT5uS1HTyCOfvAsx0t4Gjp8gKc9t8ddk9HWaT2P4iG1pTheG
         R0bemtFoIYAGNjkPq7GBnxJYjaYu2pzU/mqj2I4BQLbIzUp+aaLpr2KTmg8Vid4/Tf8l
         twPMwAuA7wuIqsGRaCfaMQ8SogcrSXIUii7Is7zMy9P+QxLTpRunefrsd05IPnUroTxY
         jq/W+xE/urqnG3/TGsf3EwW0uZP7QYpRXIO5cbF3ykOWYuc5Ig9kOG46fzX7n/A8ojmc
         y70g==
X-Forwarded-Encrypted: i=1; AJvYcCW46mDJbEvZ8wUhT/UtKkrscqAG04iWGIfMLrTauws5zYUNWnypPCdsXtX5q3qQcmRaDf8qnNaoRlBjyU8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwdUiOXMHlaD7XLx/8CP7+JTRAALYBRMluIpqU8fcbX3gfD2la
	j8Kc2WbJru1INaC1zjMCKWqjJ1fo39B/aYNlAEyjAI+rlo7XEyfdLMPBXXughiXHBw==
X-Gm-Gg: ASbGncuCl6+KyWfvQ0JnjtoHhBZtHRO38SCuUf04ul2x2scT0LaOAVWqVMAYBSyBzZ+
	YoiDz7hFe4qr6Rg9ksl/LbgDqJ+DudSreT5QheEYt4qZdSpcxCMTZM5r31/IJEZ75jPMc8TCqi1
	/iSrvnmIsM6GJMjVDDAhDc7ytBaRrZY87b2pOYH+8/fAw40eEsllLvB+oCf9qNDqnaeHTUw4dCp
	Fmb1M6ad22PHvP927ihz0uV5Gym/WntmwkqnfPJQMh3p/MC6WsSy8qESYCQ7jgPsd6YKArnkPiw
	TarPzdevFC1uiOc+KlNkZgR4DC/yjOsnkYVIdV52ZB0cpoBt23DJHhDszevMok/fTtjUPpMW0bE
	NN2a649A9UvebWOZyQTU=
X-Google-Smtp-Source: AGHT+IGm82o58ZVjCAo3PybTPYdGDfXUbsMi8+8LjHbWtOpjdJXIBSCQJyWdYXNP2Z2kXvDi5YGUeg==
X-Received: by 2002:a17:902:cf03:b0:234:9375:e07c with SMTP id d9443c01a7336-23601dbd9fcmr242591495ad.46.1749523933313;
        Mon, 09 Jun 2025 19:52:13 -0700 (PDT)
Received: from naoyatezuka1.tok.corp.google.com ([2401:fa00:8f:203:4173:c66c:ee04:82a8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603514230sm61107305ad.245.2025.06.09.19.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 19:52:12 -0700 (PDT)
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
Subject: [PATCH] platform/chrome: chromeos_pstore: Add ecc_size module parameter
Date: Tue, 10 Jun 2025 11:51:37 +0900
Message-ID: <20250610025152.3844404-1-naoyatezuka@chromium.org>
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
 drivers/platform/chrome/chromeos_pstore.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/chrome/chromeos_pstore.c b/drivers/platform/chrome/chromeos_pstore.c
index f37c0ef4af1f..255818f24c2e 100644
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
@@ -115,8 +119,12 @@ static inline bool chromeos_check_acpi(void) { return false; }
 
 static int __init chromeos_pstore_init(void)
 {
+
 	bool acpi_dev_found;
 
+	if (ecc_size > 0)
+		chromeos_ramoops_data.ecc_info.ecc_size = ecc_size;
+
 	/* First check ACPI for non-hardcoded values from firmware. */
 	acpi_dev_found = chromeos_check_acpi();
 
-- 
2.50.0.rc0.604.gd4ff7b7c86-goog

