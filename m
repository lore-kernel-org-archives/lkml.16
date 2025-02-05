Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C093C218AC4;
	Wed,  5 Feb 2025 12:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738757664; cv=none; b=qcggzqF8k20PnLkG12pFOT3PWgQm3ABnwUq5UDNNi08PxUeAW13lLdQD6M9HfURh+rRV/k0yxpkuUZXCKbtdFYsb1D8YXXrxoUtlKm6bgeLkAU1AlBDoELl2ojCTscUln6kZEv60T6C8IRg9LceySosN1qR6oBl2i9f5L16Eg2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738757664; c=relaxed/simple;
	bh=rcI6f6OhT0wxgcN85+VRNHiqiMS0KrhoL6Bjehtb98Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=j6v8rbx/4VuSyUacYG/4zmaA5K+gguKjl2ssClxyx+GbY9FeTLUNwaOxsaDvpMXRpVK2/lREw6kb+W57ciyKOJWTDzHamIKXjKj42hHvQlwLYA4Ta7/ug8n3iC4Oh+xe6eh8m9c5RvWbqcY9WoWk+VNyzeHH15SiaGq2sJIIdA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tNntWyeg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tNntWyeg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 893EFC4CED1;
	Wed,  5 Feb 2025 12:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738757664;
	bh=rcI6f6OhT0wxgcN85+VRNHiqiMS0KrhoL6Bjehtb98Q=;
	h=From:To:Cc:Subject:Date:From;
	b=tNntWyeg9gzbpLtFY9obNhZhKgzcIuzkPXccW74BxwuLWpuHbYMb1rWYVjQj97j82
	 1Hn7lyRr14mwYoF61Guj6CW2uEcjQIyIamnpcOJYR4qh700IRtRMaK/qMCvDC9xiZS
	 LYx8h5lWCQjtPtkC+aYYRvRiwfEIYDGT0UgzKMiKk/nS6udWWWj557VfKExYvBS9Ck
	 qd0npDrIptUGn0CYMLpgDue/94AWcQdsirY8EsIDGju1roitNBzbbwC+fofzR47BDl
	 d7e1pwUOVGDJl37gLTPukhQ1thkjZmtU9B8NTddJ9R/ZUxLMBXVxR23OPuBxFQ5CxX
	 u/pAzmvnMGHxQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: sg2042: add back module description/author tags
Date: Wed,  5 Feb 2025 13:14:08 +0100
Message-Id: <20250205121419.373464-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

A previous code reorganization inadvertently dropped the two tags,
which leads to a "make W=1" warning:

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwmon/sg2042-mcu.o

Add these back.

Fixes: cd4db38c4368 ("hwmon: (sg2042) Use per-client debugfs entry")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/hwmon/sg2042-mcu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwmon/sg2042-mcu.c b/drivers/hwmon/sg2042-mcu.c
index 74c35945d169..105131c4acf7 100644
--- a/drivers/hwmon/sg2042-mcu.c
+++ b/drivers/hwmon/sg2042-mcu.c
@@ -355,4 +355,6 @@ static struct i2c_driver sg2042_mcu_driver = {
 };
 module_i2c_driver(sg2042_mcu_driver);
 
+MODULE_AUTHOR("Inochi Amaoto <inochiama@outlook.com>");
+MODULE_DESCRIPTION("MCU I2C driver for SG2042 soc platform");
 MODULE_LICENSE("GPL");
-- 
2.39.5

